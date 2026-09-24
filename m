Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C65411A1C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286099; cv=pass; b=Q7zAwyGca5wy95onsaLQyjk6ZRz6SNedI6A4S/KfsD3TZmximjmY6Un9pIlYc6nv2iB8hwMvoa/LHas5VD3OTYnKgbe/j1hRewKJBcMToBmoomTtARLIdXjvvS04bg35I7WsT0Ex3SPNprOrPftAslFdvIt7VZuCBYrvmGxkgd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286099; c=relaxed/simple;
	bh=87GpcxVJ6wlRutNZWnNn10feaLHPsEDPE/16T1OQ2W4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DM4Om4g9sAkCsXIXBXmxAV/zoBjXaVToUdohxN7ZsHmrzPAqSuLJZSaW16MNKUfmYnblrvy0nmF0sWLhjOFFzLKScnkYyqVf+7Nb/0PDO2Rri/XoxHHnr9qf6jm0v3SSG2u+t/teisZtulmJ50m0FKsdPIq0HgMaRhtO/WGoEYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbVQsZVx; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbVQsZVx"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea1cb2e4so54662a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286096; cv=none;
        d=google.com; s=arc-20260327;
        b=Fu8D+A91bJF4sLWVWF1qkO290UN8L5e4dEuTHihwS5qDo9wCDXZ1zR83C/WTExVN0X
         wTm7YvD2dsJ6kOvV4TU+CVIxzc05dl9JrdU4DxmIMKLhgFfyJnMSFHgyi2CjNgw2BB4R
         3Lnc42yfEbBwDXeLaKSlOKLiV2l2zQlSaJ/o90QCDKHP64dbWL3kY0Pu6NX2nb+Cz1K1
         3G1X1Ujkjfhpz9oOcriDi7rc0r0W+lNk/dKYwgdXbm0ggLcFfz7Tm5PEN+7ASe0a02/s
         +yqO1ClKPPxRMah0ua6Ipd7bDewjfHURwT3m7lXBcdS5VE85CSi/xdPTep2b85kpxef3
         ZPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2SQz060QqCvrL5IKb7FfmYdL+k8EGntsJZoM76fEKWQ=;
        fh=lN7EoEU58yQskkwjAEUH/PdpctEGw+bAcfFVyi554R8=;
        b=M/LJN4HuhdZAcERl/U7a6H+WhXPYdN8pzx1U/4P78n0n8dN7DzfEpXKkEUUIzn4dSx
         auyHzxY29ZV3STtbyEZ65mxY0wCL/WS5SlTHIlYE0LxCftmjQ9yClLDgrF6wxrC7O/3+
         xk0IxuSK8hh4YssnrOJosVyjZFdtCGeQhbZNNNFT6awIFPUfX3UxgdJVGUcK9RvIFo3c
         ePhQ6bjs6vIogsds00C42eYMKoLuDXeY0PRsL2+uK+V3uGCRSl/a5lRiyrwvSQ1zjS76
         skYCrYdjG+yQyTU1Zkw+0K2eQlNbvP8FcBtO3rAtNWsjw+H/KG+fuS1uknqgw5WcoL/t
         krjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286096; x=1790890896; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SQz060QqCvrL5IKb7FfmYdL+k8EGntsJZoM76fEKWQ=;
        b=XbVQsZVxihKwvODXYXjNOXR2+LSzGEPG5A2YupQVxoUgT4soJjX3uI4+1+H9VHWFgy
         yH0d2PLNTOpYo0K1t0HmW0JhL7gg+nUxQRH0O0pJAlHohNM0VYRXjK5g7pnAXnQiD+wH
         gONBxArOnD/kSoU1LZ9ZoisWKk+lWDZhaLVMBkHf8P/mP0CN7j9vM3k1CXv85+aZRZdl
         Ily+kwx1kQNeezZ2P2Epg9rtFik2j10EVHLvOcnnC+WLuR3Epd/iookz2hwni3c9PCK1
         8HpjVfbgZHkk+o3XhDBQXewSionEyZbpUXjfM7QBZrodfLeLSxgYFQcKWf21M5FdGJEL
         uNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286096; x=1790890896;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2SQz060QqCvrL5IKb7FfmYdL+k8EGntsJZoM76fEKWQ=;
        b=FVwKpt7QQqh+gmi5uyfMza+pJBJG/F070muE9xCdGv5m9YFdBkvptUpEy2tXCcLWz4
         SzD9ztj3GLpeYZSflX+Wgj0XQqvGUv62l6x1UpZU79xuQ5j3QgCi+09vCbF4HUVCYoWT
         uNtb1D9EToq+ydzww1eGGgR5Oeiq0A0PZ2tbHl7HVl9Ujrnb92jT5yz0O1q5gVFLcjWS
         AXwWGZ6g5GI3yWzTHrPWRcvcK3S9+PM/bcX5zqIxKIDccguQyogtfWUpyEbw11fiRSxt
         u04fIP2QDzBv1UBN5qiAWIY8zeFf8XcNlaRzIOexG4CdUShgQvhXIL1Yk98FART5nDke
         9Org==
X-Forwarded-Encrypted: i=1; AKwUvBzfBhv0yy6tTPhsSA6PGp8cV3NST50c1rIoeXwETiBKJPbd8zq/cTSLCJcJzqTMz7V3fk8fBXH/AVDXwUk=@vger.kernel.org
X-Gm-Message-State: AFuF++mbyUtTFHuBTXbcgnmFKlA0v/xeLS3bBeZ+hkMgHnzP1BaC5TSF
	hUAIwWFtVQY4s87djtaRmYwzRijI5RfUf3Lzl8VKWuNUaHqIleBmLePm7NBxbpJ0uO3JsDmicLS
	slR9PThKW++1bvIF3Xt/UjQkBMXznCQ==
X-Gm-Gg: AYBFou1vRNcDsZ+Y4/9pt5buBxgxTFcmFhD89H5LZRIy5tAysbu/W/P8pn+JUMW6bBV
	z86j76lSscYFtmT9ip9KK8riCnDV/juM2mbMORFZe3k9COUJHwJB+qZ4wK774j9ix7U099nr4OC
	zvkE672pnAU1mRQMkkJut+cRglrMmTlxZA2eFQnWLTGdXoGtNktYTYBpYtnCe540NVUCIKbmRpY
	WHcExqe712eOpNtC7pDAurSjyr42GUH29ZntIYD7lKePdUaFZBAL9uliTAa73anRgjWEpxi+85V
	EaXHLPbT6Mc5BsKHfzBJjqtLgwelTl74BOZDtrmm4shOD3lmQG7QUGsE9SAaemqqXjSAZmeaov0
	vTnT5xvtdq3zT1alDvv4bsMxO0C9/blgz5oUCas9u2izJIvXUpLQ1n9Baj8qNKA/u
X-Received: by 2002:a17:907:d10:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c2ac2310342mr324229466b.1.1790286096374; Thu, 24 Sep 2026
 14:41:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:41:33 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:41:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 16:41:33 -0500
X-Gm-Features: AclHuK-LsOlMArYi-bBBEFBbSJHVTEpwXw5N32xMJ3oCEDVV0k2jabu7ooErkFA
Message-ID: <CAGEsz8EXYLRxnOFOD=FxKn6QFFFTGhqDpsvs3q_dZw5dna8fTg@mail.gmail.com>
Subject: [PATCH v2] usb: dwc3-am62: shut down refclk on remove
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: rogerq@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, mhun512@gmail.com, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

dwc3_ti_remove() relies on pm_runtime_put_sync() to invoke the
runtime-suspend callback and disable the USB2 reference clock.  The
callback is not guaranteed to run: autosuspend may defer it, and a
reference held by pm_runtime_forbid() keeps the usage count above zero.
The following pm_runtime_disable() then cancels pending work while the
clock remains enabled.

Balance only the reference acquired by remove without requesting a suspend,
then disable runtime PM to drain any operation in progress.  Disable the
clock explicitly when the stable runtime status shows that the device was
not already suspended.  This also handles CONFIG_PM=n, where the runtime-PM
calls are stubs, without double-disabling the clock after a failed resume.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 6661befe4100 ("usb: dwc3-am62: fix module unload/reload behavior")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org and Thinh Nguyen's Acked-by.

 drivers/usb/dwc3/dwc3-am62.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 632634d6e..2fb9e088f 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -319,9 +319,11 @@ static void dwc3_ti_remove(struct platform_device *pdev)
 	reg &= ~USBSS_MODE_VALID;
 	dwc3_ti_writel(am62, USBSS_MODE_CONTROL, reg);

-	pm_runtime_put_sync(dev);
+	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(am62->usb2_refclk);
 	pm_runtime_set_suspended(dev);
 }

-- 
2.47.1
