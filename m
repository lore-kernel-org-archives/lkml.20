Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297513;
	b=hfklcDKhsmp1UHDnVQoYyM15R5ZuCVSxUr71gFgKl/VbdGQGoiRsv4vCspFdLIrdk/x6
	 z2CJaF60JVs+D3lYzjy14RfSLb3v3LwA5rQeI8+SPzu5vFZ109ZqEWEgCEvg7M5jB65bm
	 hi/TkQEfN3k20xbcXe3F2vSFpa0jdnDw/3o01BJ5r1FCV4rdRtOSyHbgKvcL2t+JDrgoc
	 JDmtsruSrs4sNWGTN+FIjdIfhyfS3SVWoB6+UIXWVpS03fv4Z4Mv13PMjbvcTx1YKgYtR
	 8EdW8mbM7TOr/KCNoSC4vDFZViByKDYAKMzV/5hDPOs//hN9B/jpqTo8Qkq3qEHG3kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297513;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fg34h+VZqICMTcHL/S6rQT7kCoY22/jhi5QW/4nFZYE=;
	b=tX3OASgRsV1nW75kaVklgH9fXeuB/dtW0Pci5n47hbeQx48/5Mhom6v0FBXVRzijbSUf
	 nl1AQm9YH+JuXNzC/cu6CN95mdOvU5SSlvUjkImsPEk2xD0bz30LuhWDkm8MxquUwJFHo
	 T/Nif9ECsUUosVYREuBMkxfiTEnq7y+ZZaDahEj+F93vOCyBJyNCP71X9DGVAO8Sp8XWv
	 lq6eeo9qj1nFO6VmDVLKL9yBruEpq4oST/JdjiPu7TvDcH8LoV1DhqBsKGNysOzjH8N7r
	 pT4ZotF+XrOARZVh4XkT5/ZYufsgUyjcS+ItqQGRIjVI5092tFUwQF0jDQqgMb7QC8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BEkstElA;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D0560A2600;
	Tue, 10 Nov 2026 07:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D0560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BEkstElA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BEkstElAWoIs53fa6u9UkFJgyjFdJQUm0OmOH2/ECOfSAbfx50LQqyOwU8SwmJUMDJUbT6egcs5ry
	 q4I/rDYquyNoBIHo/dC5fs2Tb+jMH/52sARKzQaQkMqmq1942Y8xr0q7FMVz3pGODN+ucAo2vH0yGI
	 Yk4zElY3iFSEweHY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af2cea5bba-cd44e;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee76af2cea5bba-cd44e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdcf;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdcf
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/22] usb: common: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:08 +0000
Message-ID: <20261110075825.24946-6-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/common/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index fc0845f681be..450d13c6ca5f 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -285,7 +285,7 @@ EXPORT_SYMBOL_GPL(usb_decode_interval);
  *
  * In dts a usb controller associates with phy devices.  The function gets
  * the string from property 'dr_mode' of the controller associated with the
- * given phy device node, and returns the correspondig enum usb_dr_mode.
+ * given phy device node, and returns the corresponding enum usb_dr_mode.
  */
 enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0)
 {
-- 
2.53.0



