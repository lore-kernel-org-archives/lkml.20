Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74AD31E84F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066747; cv=none; b=UssMdeVTOpRP4fJzGkfAFbOteQPvnYssPmvZiFJYMPJJWC96zgzJDivktKk/2wC2OuYXZ5WSTwa0Eie9rT5ytTwBAEPoh6GFcr6PTkQt0VpTZ1flGSp6V20NKxbiqKoA7UVnvfP1CEI1nSmrGMglA73qj8k+JSywkctuNf9BDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066747; c=relaxed/simple;
	bh=USxceNv93mvO+qYyxsutIULkz6xx7E7suaD9GJik7LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puDXZ09Wy7hJ4+yvoKHb39EHvRUNo7zqC5wlSZxH0CigmIDgjrn2yKXjBJnREPwhCjtSukYeKNi0ZWj1CSXz0q0Rz73XOzVpyDJx7GmZCneulxUyu/kzyrf2UjGqzq7de5UWCyWaskjUDWSnjKVzU4KqontQan+lNPFyF+xacFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AYmBolax; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AYmBolax"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-885cf67963eso43128307b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066745; x=1792671545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rxq3hfUR8X6WLnz0/5e9y66/fCs1i78EHHGa1XswQAY=;
        b=zFlKdXi8mOSQiyNBITczdOaXY+HD2fkEqb7kDpni7js6DL6VHvudAu0rxDUoX1sQfR
         piuXdx1YCHeH6JuauPUMferZOh2D+MmTquqLroHaQqwtueczC/GDds0tB4ipgEGZOMoD
         i6gHiuFV1VyIcX9W81Hau+vao5kjHyl867doCG/bu2gS/D5ReHHlpiyFxMrPzLt7sZe4
         kDfSzmOAxokOkrYbuglqAbRxC+bJcSoy9YFx3kFz0/Mm9UKTHwor04dikXRJ995SH4bU
         IC+A8hOCb2pSm++8bCSSVE/aIIpAjkxAvULpDTX+AT6VBsGazkDq1+dB/nUtTdfzQvyI
         75mA==
X-Forwarded-Encrypted: i=1; AKwUvBwTgN3AajBt0PwwveQDIsGZ8JgUdOQ8EVPC8rYB0N7sXHpPb9c3NH8arMeCzURiR7PYOLsTszg8r9LYNJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYITb5VeyYpMcNE6M4qSIy0CO1v6gksjkgEqUNThhwdmgN1mjJEz
	2TkmSmH5O0hRUExBtlGNWF19UKbpIE0ZSFjTVuEOJsyg0PwdcRhE/TeWo+7rW/IrmvxpsbqugeU
	V/Jt/1XwWMMR+Oas/00BwCNUxCOa8YTDE5XU0yRbVjq2y/q73t9XZoOJKpx0sTfcbT6o4qAHjWT
	uRlGmZ7kYbGfcGLRgI2iYXg7PUoh4oehRtuDuuX+fkZlRIgqHRdRBvUEybNpT/5mk6adEt9mpgq
	gT2zZVnucNfHtkNIg==
X-Gm-Gg: AYBFou2gIQVY7bvQynEq6aig0hbxW8ESG5Owo7PZXpVZ0bD6F87sYONHUwgoLnlRYuZ
	3OM3BjMHooJPug1Zq57mv3tdWCM/stEPYnP5Bdxs88u2pQII9yZI8Nqlhp2uJC3/Kdabu1cFrq3
	jGLZ+ufmgCMKTrjy42UzUZpSsj6STNQLE6kyT6Ne2eWB/G/o2ZRvX5FwaQ1rH+ph4iN9tse/YF5
	w9sqIL1h8QUBopj8huh/8JB0Kg35yriSIwdbWCAM1uIkty6PPvYMF2gPokprxIrhuOKUp2gJxlX
	m5e7c/C0JYSyqQNsqK34UjDmORmt/Fw5eOIxTFhVZ+mdlGSWluTis4B4l+SIScTH1ecH6AwdK9C
	fZYoOe6dvNIDUzLE5hH9zwS6pSBf0MrbUBL6ZsKTMp6vofh+rEDNlJRvBAB3KTdZL3+HjyBv0lV
	ylKw4Qev5MGhBHRaht/ABah+clX+z4aYCl8YjB
X-Received: by 2002:a05:690c:3489:b0:8b0:cc41:a124 with SMTP id 00721157ae682-8b0cc41a429mr14370827b3.49.1792066744617;
        Thu, 15 Oct 2026 05:19:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b07f192727sm831517b3.5.2026.10.15.05.19.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:19:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso8228591eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792066743; x=1792671543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxq3hfUR8X6WLnz0/5e9y66/fCs1i78EHHGa1XswQAY=;
        b=AYmBolaxe/87sCZDDd8Dd+5/RQzjX9p8DESwWTWh8W3Fl87h/qdLekqhu/LxBwVZ8K
         h10cSjSPkpLh+H3f8YEIBNgXUSAaI548Ugok7KUnroRmZcM6N8E05pardllgGo0e7hos
         Ja+9rABMpTupCbP+68YyxQbYKIFtPbdYLSczg=
X-Forwarded-Encrypted: i=1; AKwUvBzRMgur0mtNjaPoKfSskt2hlpMMNAFnmgQ706R/ks1w+b9zOl36Xk3/tLCJRp2CyLYy0J+xZ+ANo8puAWo=@vger.kernel.org
X-Received: by 2002:a05:693c:26c1:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-3537ddd6142mr23491564eec.1.1792066742956;
        Thu, 15 Oct 2026 05:19:02 -0700 (PDT)
X-Received: by 2002:a05:693c:26c1:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-3537ddd6142mr23491537eec.1.1792066742277;
        Thu, 15 Oct 2026 05:19:02 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm64496032eec.26.2026.10.15.05.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:19:01 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net v2 1/2] bnge: cap RSS contexts and RX rings to the RSS table size
Date: Thu, 15 Oct 2026 17:48:46 +0530
Message-ID: <20261015121847.1933308-2-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261015121847.1933308-1-vikas.gupta@broadcom.com>
References: <20261015121847.1933308-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Dharmender Garg <dharmender.garg@broadcom.com>

The hardware supports at most BNGE_RSS_TABLE_MAX_TBL (8) RSS contexts.
They are stored in vnic->fw_rss_cos_lb_ctx[8] and back a 512-entry
(BNGE_MAX_RSS_TABLE_ENTRIES) indirection table and DMA buffer, so at most
512 RX rings can be served by RSS.

bnge_cal_nr_rss_ctxs() has no upper bound, so with more RX rings it
returns more than 8 contexts: bnge_setup_vnic() writes past
fw_rss_cos_lb_ctx[], bnge_set_dflt_rss_indir_tbl() and
bnge_fill_hw_rss_tbl() write past the indirection table and its DMA
buffer, and the pad computation in bnge_set_dflt_rss_indir_tbl()
underflows into a huge memset().

Cap the number of contexts at BNGE_RSS_TABLE_MAX_TBL and the number of RX
rings at BNGE_MAX_RSS_TABLE_ENTRIES, so the sizes derived from the ring
count always fit the arrays.

Fixes: 627c67f038d2 ("bng_en: Add resource management support")
Signed-off-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_resc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 4711dd4945ff..b540eed12fc6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -182,8 +182,9 @@ int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 	if (!rx_rings)
 		return 0;
 
-	return bnge_adjust_pow_two(rx_rings - 1,
-				   BNGE_RSS_TABLE_ENTRIES);
+	return min_t(int, bnge_adjust_pow_two(rx_rings - 1,
+					      BNGE_RSS_TABLE_ENTRIES),
+		     BNGE_RSS_TABLE_MAX_TBL);
 }
 
 static u16 bnge_rss_ctxs_in_use(struct bnge_dev *bd,
@@ -459,6 +460,7 @@ static void _bnge_get_max_rings(struct bnge_dev *bd, u16 *max_rx,
 	}
 
 	*max_rx = min_t(int, *max_rx, max_ring_grps);
+	*max_rx = min_t(int, *max_rx, BNGE_MAX_RSS_TABLE_ENTRIES);
 }
 
 static int bnge_get_max_rings(struct bnge_dev *bd, u16 *max_rx,
-- 
2.52.0

