Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011150;
	b=djPb8kMXOW34mii0zJyC5/TS0yYOFKfishU58ZTagrD4yoTWgl1MaViIhYgKrOKrHk1K
	 WRk4pW8BkBfwxsckLEcFVdSv7FUm/8QG1PvFXJFfIPDvOIUN1W7Y/HG5xcOz3zPyy6x5Y
	 mN/OLLiO9V3uU1VZJ94GhXGto29GQc436WD1hsiy9xcF1IvLPXm9vVK58uXEyOXFyRDgW
	 mATodmQ5UANlufUyQhcXRBozN8z4Y6gmerGyDQsYn/bzBUBx8iJEBjE3A2sx4T5adLDpt
	 EML1ZYZ/WRRQk3COQnx5ieMvlGs5nl7ht2PD1mQa2b0cMZc7AHhkQx6rYaQbN59mVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011150;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hj9ZwmouCpMroTFxCx7j3amaFop7D3wBW0J4aQmdNLY=;
	b=MexM+VKxdEAIrGCOArQJGU53Sx+3rMgDa0r+CdTb1QIgqU3MmYviqTfwJuQ3Ck9sNspn
	 1H6APnxlMSw5EyPsIhPrII/UF08AUa8u4orcgon4o3K8zpjU6tFw+HOa9acQuS8GP2G/d
	 b3oZ9SY0hs0xWcy1EMXsBiJ1SCCHNUiEHHQIuvqs3j+vwn8mSJf5dHhhF6XKCM3ihotk/
	 JjN5FJ8W2FY0H9WC5UGTDB50A9tPXmjgeJxqEZbnuiPZCvzh2y0XBe3V69YK4eAvw0CYF
	 XsAFhRJpknZLJgUR/NCe57e5M9jqnaPLD9pVO1bNUBOlhUdNHBX5S24r/2ej8Kthe1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ejqQZXZH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=C7doyet4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840D606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E840D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ejqQZXZH;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=C7doyet4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hj9ZwmouCpMroTFxCx7j3amaFop7D3wBW0J4aQmdNLY=;
	b=ejqQZXZHBB4GSNUQqsqwt3BvsuhiIp2aaZaWQBARft18L/69vK1riDDYQWUxn9MFU4UuJq
	hTs+sRX/txpM/I4linlfs5djN2SN4bHkwVY1gUcANElDICBQli/7v9S/Oa5xwu72HwELYT
	o9cfx/UZKd4eoJtZUBIYODY2bDzwpHQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-mLFVqlHXOTOMtWFzB0z4EQ-1; Fri, 06 Nov 2026 19:25:40 -0500
X-MC-Unique: mLFVqlHXOTOMtWFzB0z4EQ-1
X-Mimecast-MFC-AGG-ID: mLFVqlHXOTOMtWFzB0z4EQ_1794011139
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eb05c8241so20797356d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011139; x=1794615939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj9ZwmouCpMroTFxCx7j3amaFop7D3wBW0J4aQmdNLY=;
        b=C7doyet4jmBN2yCryS+UvAAQOMIPMdmuVIrYLEq1J+s8iGxRTCYddg3Pm4kpkopiFR
         fpjGvs7IJBaFR75Dx5JZ+D6OvFxzg3VarRv3bvjgIz1WFUwxSOIpSVPt37Y6C2FYl8g1
         XaqQV8dg32OGyNlN5nWKa7FxXfeAWZu9FLUSmhXK4FgII3c8Uq4ee7QY4t2BSfl51oZK
         11dRIjRhOerg1OSYrKysO8rf7dMlJDuDLuhNH69k+VT8sKMaYuI2lLl4W6X3BZbV7ETI
         X6Yl8lcu2FDuGDqFQe3D7PAF/F+2h03IjJcEPScDNtch5360nlQCFXwOtvpoBOiCpPLk
         vWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011139; x=1794615939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9ZwmouCpMroTFxCx7j3amaFop7D3wBW0J4aQmdNLY=;
        b=chLHPjhBtqbfgNR1I5Hlj/IvEXJe3dLd51L5LoehjPO9H7OWuKJGFPi9L1Q1XPYtlE
         K/b46THuOptVs1Aiwf2YLV0xNtMukNFQPg4tN/8qvWTSwWTSZupzXv6MfZBrNKRzUbK/
         J9Sh4/8YRCcoXF3oCoB4SBn+4o8F5kyxN+JimHWy+XVzsomHee+iGDBxnWj4FivlwlOV
         aL+whBIf7CLy2+u2URwUQJzet+xtP1xkawl6HctPsHWjOz7stPylhkvkADWBRHave0O0
         G/TxQuHnr3hUvjR9zpIONiUbmLn3nEPnlfYUXmaFAX0VDiJfxP1/D+2A6HyPPdDB3TKA
         eo2Q==
X-Forwarded-Encrypted: i=1; AL+hErH2MqBOZDhjw1ll6gLeLx01ByVNXQLq+i8rNbNVp55mmaRWwN7Odk8b1cZ1a3TmWhKHYkMvy1KNGF01yLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d7X4ZCclQMsmhN0gA/pKDzNo7ED4P580ApBcgAf7hdh8XXlyz
	ilFYBD4w9hmFZ0QiCjaUD/i2uFX5nUClzWgZ9s4pKR4u7CUxV6RQ7OAJWJQBzeHhRcSo3lTvkCN
	iq5HwWXMfsBrSyKKjjsbhQ5TKxH25/TdEuK9XdIif6eeMCNM/Ml3YABJhXI90ltbpWQ==
X-Gm-Gg: AYBFou1+1DNUMFR1V89glrp+S1jN428Wxr+alxtRzdVNXjRsdh/wVss4sNc4LY1gQtd
	x7hx5YAr2kRolwoi1EjRWgHnCGU8NaaAgEaE3MN9Om83eHdXnv1zLFHc3QPzhYkg+z44wJVdEGr
	94/1/8ViyBzl/03g7juZk/eQzYOqWt7djuTFnF2we9vrcHcga8HxgeH5gfJEyl1N01wL+dLb+Sn
	zfg3R/P/iBh42lmMMZbufb1KleSDnaqI4P6Wm4TOLpPW3CUH2RR5LJdjsARS1XFmRqKIoTjr2J1
	0fEnI2+ntxnQVycOAZCu5M/n6/u+dmKScXdxUgujc8MDwme6KosUvm8th92SkIgWx4C0RshIRcx
	GeYAA3HrpRznheVyPqoomPn7hZNAyH9u0HCAtv1u/iZS0FFQNK/AYhVBKbGf8oBgofTFrBb70jd
	BIVCdgIxnqs9LCE7Mc
X-Received: by 2002:a05:6214:43c1:b0:91e:a476:1117 with SMTP id 6a1803df08f44-91ea9282be3mr63164136d6.8.1794011138991;
        Fri, 06 Nov 2026 16:25:38 -0800 (PST)
X-Received: by 2002:a05:6214:43c1:b0:91e:a476:1117 with SMTP id 6a1803df08f44-91ea9282be3mr63163896d6.8.1794011138393;
        Fri, 06 Nov 2026 16:25:38 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6ab543csm32089856d6.39.2026.11.06.16.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:25:37 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:25:21 -0500
Subject: [PATCH 2/2] phy: ti: phy-twl4030-usb: convert to
 subsys_platform_driver()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-phy-subsys-v1-2-9a443422e563@redhat.com>
References: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
In-Reply-To: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=R6c0upgxMnhNhVwmId++8F/tWpVwHZnybYHMR5t1NBk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5f/JX9du9+LnhuTTrz+mRqQtfCVioHPZYfs8Oev7j
 zdeZdR37yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAivOYM/11KtQPD3uxYKdRz
 MeiDsErA5ax/r+bLS8oZmz/STH+8soyRYasHs59b3aKw7ZrrE3/MEOAp05LPX3xrQaYMj3VQyL5
 tLAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-twl4030-usb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index a26aec3ab29e..08aaf0f8712b 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -841,17 +841,7 @@ static struct platform_driver twl4030_usb_driver = {
 	},
 };
 
-static int __init twl4030_usb_init(void)
-{
-	return platform_driver_register(&twl4030_usb_driver);
-}
-subsys_initcall(twl4030_usb_init);
-
-static void __exit twl4030_usb_exit(void)
-{
-	platform_driver_unregister(&twl4030_usb_driver);
-}
-module_exit(twl4030_usb_exit);
+subsys_platform_driver(twl4030_usb_driver);
 
 MODULE_ALIAS("platform:twl4030_usb");
 MODULE_AUTHOR("Texas Instruments, Inc, Nokia Corporation");

-- 
2.56.0

