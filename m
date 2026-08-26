Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2523C1D4B;
	Wed, 26 Aug 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751462; cv=none; b=CqVwQcwr01P3A3Odnwi7Ore8zxjslwA58zU1Lxop85FJe0Y3eyQ+LFvAeMqBkpyWyfzT3mdhyDzoilefFXJtio+3plNRdLCXtk1liO+Dm+Ut9o5bVonTTw9Yv8+j0zwfrzCO85DnfjL3Q1RxcxKSCloSJfRcyOO1ARqYgp2tvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751462; c=relaxed/simple;
	bh=edcuadEQQZoJqhB/CJLlSfSPaw6Yh4H+GVgSCAzV/g0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AbxBIE73i6oDFSoDRrZ1bgzhzTMhd8NdKoo+GuuCPyVzRRK80whHq0Hfk3x9zENFpTl5RGCScn1p92N4Bne/lU1EQx4mAA1n4DPjzB1uf2TH9z24cd8Xjef0oOJLd+tTUGJD7CNsYdge4o0F4oq6c6AqBTWaNgpDgcSPTLyxH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4a82742ca15311f19a56ed5b684f684d-20260826
X-CID-CACHE: Type:Local,Time:202608262137+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:74ffe434-2bee-4b98-a7a3-e6aeac6117ed,IP:0,U
	RL:25,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:50
X-CID-META: VersionHash:7db8b62,CLOUDID:ed915de6e1983984ef9bbabfbe3989ca,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:11|85|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4a82742ca15311f19a56ed5b684f684d-20260826
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 409515827; Wed, 26 Aug 2026 21:37:32 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>
Subject: [PATCH] usb: gadget: uac1/uac2: reject more than UAC_MAX_RATES sample rates
Date: Wed, 26 Aug 2026 21:37:30 +0800
Message-Id: <20260826133730.3798793-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UAC1_RATE_ATTRIBUTE / UAC2_RATE_ATTRIBUTE configfs store loops parse
a comma-separated sample-rate list with

    while ((token = strsep(&split_page, ",")) != NULL) {
        ...
        opts->name##s[i++] = num;
    }

without checking the running index against UAC_MAX_RATES (10).  The
storing arrays (c_srates / p_srates in struct f_uac1_opts /
struct f_uac2_opts) have exactly UAC_MAX_RATES entries, so an 11th
token already writes past the array, and feeding more tokens (the
configfs write limit is 4096 bytes, i.e. up to ~2000 rates) walks past
the whole opts object into the surrounding kernel heap.

Attack chain (no USB host/device involved; the caller only needs
configfs write access to the gadget function, e.g. for the kernel to
issue the echo):

    echo 1,1,1,1,1,1,1,1,1,1,2,... > .../functions/uac1.NAME/c_srate
      -> f_uac1_opts_c_srate_store()
      -> opts->c_srates[i++] = num for i = 10, 11, ...  (unbounded)
      -> out-of-bounds heap write (index into a 10-element int array)

Reproduced on kernel 7.2.0+ (KASAN + UBSAN + slub_debug=Z).  An
1801-token write to uac1/c_srate yields

    BUG: KASAN: slab-out-of-bounds in f_uac1_opts_c_srate_store
    Write of size 4 ... f_uac1_opts_c_srate_store -> configfs_write_iter

and the exact array boundary is caught for the three remaining
attributes with 11 tokens:

    UBSAN: array-index-out-of-bounds ... index 10 is out of range for
           type 'int [10]'
      in f_uac1_opts_p_srate_store / f_uac2_opts_c_srate_store /
         f_uac2_opts_p_srate_store

plus: the 1800+ token variant plows through several slab objects, and
the kfree() of the duplicated token buffer afterwards enters a
pathological spin under slub_debug=Z, demonstrating live corruption of
the downstream heap.

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
 drivers/usb/gadget/function/f_uac1.c | 4 ++++
 drivers/usb/gadget/function/f_uac2.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f57..de34891163ef 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1614,6 +1614,10 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 		if (ret)						\
 			goto end;					\
 									\
+		if (i >= UAC_MAX_RATES) {				\
+			ret = -E2BIG;					\
+			goto end;					\
+		}							\
 		opts->name##s[i++] = num;				\
 		ret = len;						\
 	};								\
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803c..02fb27daf04a 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2032,6 +2032,10 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 		if (ret)						\
 			goto end;					\
 									\
+		if (i >= UAC_MAX_RATES) {				\
+			ret = -E2BIG;					\
+			goto end;					\
+		}							\
 		opts->name##s[i++] = num;				\
 		ret = len;						\
 	};								\
-- 
2.25.1

