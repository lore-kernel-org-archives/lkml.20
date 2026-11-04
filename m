Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816925;
	b=Lo/YdlP26M7UHAqvQfvGsuV+r3hQDFDzZZu3YVN3UYq/YszhK5FNVZHOweaRgKAKP2ta
	 ojt5rhGzKtqEqTSsVFGPM4ThG8mAb9iJ9cV+yE0wTPQChBwjeliRogyCzvOy82zth3YPl
	 kICNhY3MjD/VAbH+f3r8zcGTAqQIsA19dodYinA2bJ2iOcIGEbjIyrcEl1pZiA73mLdMT
	 L/M4TWxy0XD8y65+Szooh41+UBJ9LqK6I656NdrzaFsu6OLyBstrD7WWsyQfbyqCHI9PU
	 2tmCp/5/MYIrbu7KPDJH2xeM9qLh7wNuPdZRwPdQV/JYBVACRid3NXFJNH5OJA4uamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RmHpo3+pR2s5ML5HiGnTikUyVxsXw4licnGddfMA2fg=;
	b=QTBKfH+aPTgvsi1yZW0IK4T+s3AbbDkrskL2HgbodUOq/iDsNvu9XhWdqWt12UIN78Wz
	 PfAvzFfCu0gBEO/LquxPDymxJtvw/VaABMJfDD4Q1XFX3J4cIHe2GmjLS9FYQ4HoBliF8
	 RGfg3Fl87k1eG7Zlzhqncam+f8LUoqXPC2RNnaA07YYuVBtqtBSivTIZtLjPZmLqJFHiE
	 5CCBgQH5VTj+YVDVHhDRWagGVDWwRJinN04mqC9DWRfxIKl5f7n6j479+JCFIImuEsBgc
	 F+SdCSePIa25DbNFLHKy3aGew/yIXJXYEUwAzTMxTnJXrCxLERXfsih1yq2LEIp08QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnhuRls2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD2F606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnhuRls2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36cedf1bd63so1084805eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816924; x=1794421724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmHpo3+pR2s5ML5HiGnTikUyVxsXw4licnGddfMA2fg=;
        b=bnhuRls22bPr1CgblNs2CholbSpN0yqFa50f5qD2aA2WkZVca94r9QS42VwXkcYAZo
         My/elqfe0kiSvN071wEeMoeLihKJbWpGZol76RSeN+C46JbO9iWfHPaTjQD8zqy7mxqY
         KFvf3ASdU7UUXszVU29ZtjF/bf966F+ZRvUgYCJQoSCvHuk2xYdeArZL8Q8DosBJvXhp
         Kaj8KTas80UdcMQX/N6ssYOYuMtNM3EADY21ZGzlTSICyR9feHDuqOkUGU9252Q4HdWc
         0qNOqijNlGJyTTBUXNOpqLFZ+gx5XRDKBf14QiAMNHNbxfsvyLfR/FZ3KeXRbbvAmC4Q
         eJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816924; x=1794421724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmHpo3+pR2s5ML5HiGnTikUyVxsXw4licnGddfMA2fg=;
        b=bIOLZIyDG49l6Tay6LB7EiN8dEGs7bPKBmMqq0b4+G4iJTcLFzdJ6OBZc+0v06ZxBQ
         4LCBHtW1JhXRB8+GlQ3HAE3OfPVnQFKUOetNFVYhTE50Tx9ezVLZyshq/Bz6qEHBxOUT
         Ttqk+8cEIsyJ7Uaz6iQl9yFjBb9+hwAqWf8M01RmyF0OyrnLZQIkuwGuFGi2pHanM9zQ
         rNvf9zfpepISYvzqVyNeTle6uwhnuYWoFDvWuLgq6DHv2knrdciwVZj9AzW426uNPZDJ
         7BDxK3gQDsIuccKnZPqa5HKC+hdGBf9OyDjtAIkSKARBJwxH0t1UKDTdeGY1bIus8lx9
         z+OQ==
X-Forwarded-Encrypted: i=1; AKwUvByPAut1D97CkYdk3U64Ym0UYmcGYplQ4QDayQNJowgrA8N6rwqoXxSJ1G7nPhswsdQrCamGTiNoRFqOzN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VHz36CApa8NWLJGq4TB4Pgcrpgtxtqs3xbqD9pN96PJ+GOTX7
	3oFAAOdZ5p2nCvONm4LeM/RSU1d06Wdjz2XPo/w7GV5kkQPmioj4nMDvb22W3YA=
X-Gm-Gg: AYBFou3bW7LVEBgA/JOaTdcytgPh5U9nzfdo/xXpNJFesiHlMqXqAcWZCDoWEiNMngJ
	mUuB/Q43FQBSM3uclSUy9g6bRJ1AtETIf5QcRTCjjuxC1CzRE4mdCoOPRYonvrCpWUHPRuPZGtc
	kKy9V1Zh4PLNDhT2i2Xb/5EaYdFoIFwXUFQp8HjjEH3rTmP9KkrUJfOy/RcXJLTpfejzA8UUSRp
	w1vKXUQTiQxVwbZqpmfKH+rvKJGGhUT+J0c030/gkzKdwPrB/e8EBtH5u5LdryAc5Zy/WFEvuqV
	Xa8EPIIugojlT8Ehy3CoojxdHuNqDMM9XA0ab5TdiPN+PgoTfY/ZXqQL73LB7Ki3fXb0+pcv6VR
	ZCA0E8zf2dnnT/7LUqd7tneF6VgbM8MVBvxODRi9dNl01Bn+wh1syiEQDm9UQfPAzNjj7tmw1IG
	MLwRb3hQbiIQ7FYU490kdoLVbRbB3ewIGrT15kt2RaWA7IriivK2rJKwNiBSMwv66ayXeIoq0tD
	87aBkBO/ryUXZ9Np8ChdVx8RALHi1NAkWopw0kmHfcXuC9AKodbfTR7VWFYF0DN0/cAQzqDbnrr
	uzpQKRoMCH4wjTLXnyYb4CswN9vbPqSmop/DTvZDepgt0rkSAl1aAbu6E7sgXlviIg73
X-Received: by 2002:a05:701b:450e:10b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b24f2b4bfemr377336c88.0.1793816923539;
        Wed, 04 Nov 2026 10:28:43 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm9412265c88.6.2026.11.04.10.28.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 10:28:43 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: musb: tusb6010: retain and unregister the generic PHY
Date: Thu,  5 Nov 2026 02:28:37 +0800
Message-ID: <rc-review-20261103-35-b81ec08fb02e@gmail.com>
X-Mailer: git-send-email 2.50.1
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

usb_phy_generic_register() returns the newly registered PHY platform
device, but tusb_probe() discards that pointer. The zero-initialized
glue->phy is later passed to usb_phy_generic_unregister(), leaving the
actual registered device behind.

Store the returned device in glue->phy and stop probe if registration
fails. If registering the MUSB child subsequently fails, unregister
the PHY before returning the error. Normal removal already unregisters
the MUSB child first and can now pass the saved PHY to its cleanup.

Fixes: 2f36ff6915c6 ("usb: phy: generic: allow multiples calls to usb_phy_generic_register()")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

The N800/N810 registration path remains in this base. The proposed
OMAP24xx removal affects its future use; please advise on the target tree.
https://lore.kernel.org/all/20260914140821.1805449-1-arnd@kernel.org/

 drivers/usb/musb/tusb6010.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 1d9571f24a56..a7e0c6fabca4 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -1245,7 +1245,9 @@ static int tusb_probe(struct platform_device *pdev)
 
 	pdata->platform_ops		= &tusb_ops;
 
-	usb_phy_generic_register();
+	glue->phy = usb_phy_generic_register();
+	if (IS_ERR(glue->phy))
+		return PTR_ERR(glue->phy);
 	platform_set_drvdata(pdev, glue);
 
 	memset(musb_resources, 0x00, sizeof(*musb_resources) *
@@ -1274,6 +1276,7 @@ static int tusb_probe(struct platform_device *pdev)
 	if (IS_ERR(musb)) {
 		ret = PTR_ERR(musb);
 		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
+		usb_phy_generic_unregister(glue->phy);
 		return ret;
 	}
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
