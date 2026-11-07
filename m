Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011734;
	b=n9ezO0oVy/nA82Jg2mzTyCFDftXiJMnmyBh13rh7dceupAB3hFrFaWuT3O0SCM+XcQPE
	 I9oUHz3+QH9wYDFaIyNt/WxfvuCVliosXCnoCP1HR3pgatqOvZYyfnVR2Z9ctH1A2a2I4
	 JTvu9RPOIiML8g9dkwSbx53ho7kqbbV1XT8kYKDmHGSmrCrnbD4Cj//n8IXMS0X4yaIhF
	 bPyR6RlihSOXgnYhFM5bhnsVqQ8489ZLQ4eCqktdy8ne4atagGcbtv33Aih//hrs0hRvO
	 zFxwAEk0AD4ZRlxF4vXEbIav25aEvawaR8g6+4iP/kB7mrOp8cGgHeEYwmGQyK2wGOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011734;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
	b=F+in7w09wY09rjX1ItuiAU+vBcdCF8FSarwGD9iC62SznBK0hIWJO6x2DCN7hC/Wyr+e
	 O+Z2imonmwkThPYASlKJ2+MiP21h9ML/ZnAfOD/D10XJHWhA6dWYz0w9CyCIIT9tKHUzO
	 7RhcvieM5FNDQvq7saJm3FTHaCYfAwXUql2WwghCV3Trh98xHqXQl8fJuIpWzdRfhhCvI
	 uEOsVIlRFnYCLVtIiT11xvaf6/cdxnjePF5uzBHVlT4ZZw+s/R+PHSHz9OlYhXbd3Ox0A
	 FLwUOpB0+Lq9IvsINlUOc7K2pYBxAC3Z5xhcbpWmgqk+hSuaTqDOB663ebK+gWj7yOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WM+GALUD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KSHynIjk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E755606D816
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E755606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WM+GALUD;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KSHynIjk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
	b=WM+GALUD3rXK6wHBP3F/cY7AoDEl23jnaAwVp4BJbyPEYLft4cisNs5zIkKkEd+JPnpxjJ
	lQD1Vt1QgvL1sp6G9Tc/bDKI2euOMkUWv/rIjvIZkwoe75bq/cW0sKhf7iMf882JkhGSZd
	aeWt4oEHO/oUWee4d1aMoYWzAx28izc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-IFtpXABmOMmae5GogB_BZw-1; Fri, 06 Nov 2026 19:35:32 -0500
X-MC-Unique: IFtpXABmOMmae5GogB_BZw-1
X-Mimecast-MFC-AGG-ID: IFtpXABmOMmae5GogB_BZw_1794011731
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337b591609so16809941cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011731; x=1794616531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
        b=KSHynIjkR68kLh9lzQ4UqNZKkEm8sKl8DvN+TpJ18faYNOimxfBeKWhENhPh9KlbH+
         sjly/yV85FZbhuCXVQu860MOWfq9rWoh5ueYa26r0AiUef9s3RJHB+YlRunYuPMlCv3y
         jQD6btyZVAYoVkC+wqZtgZNqQ4EJmdkf+iqhzSJDnte/8EjBLQpmTVnTOFauDrnNW+zY
         yK18XCWrv8ekv+A+OgMfPANo6fugHJ7fb+RNwtYoRJOq7uBT3xas03/vMP4g9hfLffdl
         RMvA0PUls/B4ZLhMEdY+5fCnGKzcNzpXHreuPj/YrM9AvzXENjxcZhf/42sN804c8sXz
         n9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011731; x=1794616531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+Up1eWAi6FZ5aP/4cLggFPz7Kl41JV1rEvqnrhdY5A=;
        b=rychw4KUbaP0hD/QMSyGEB5bz2b1YgO9czzOEyTHGCpu5Uy0DOj1t8dXy+2LUKnGLi
         0xh1m2Nsb0XiGsOotgcb3jX3Sj322iTcVW61oyx2Qp7x8gdE5HBBhFY6Vlvs8jqHkhWj
         lyq1pFmyKn6K8s1+xWQpjjv6OYROhb5eIFhYcTmwYnw8y/v+FhMo6RizZ/5PGs7vpPre
         iS9ZI/r1RLklboDHRp/eaj770idXOsAdq3HXEpAv0tx4YeYDV0wnvr10gTGTvsbL5l3L
         V8PYwwg1gkkfEHfL8RZxH+EJbn3X1zLEYyO0/jdkviEGxNGS9bIp3Xqt+lWnd804nuu3
         OEXw==
X-Forwarded-Encrypted: i=1; AKwUvBzIXelj/9hU6oB1rc3WbCuEWruFadGfwbP3yEZonBQTbEZYaky+i8F3yhhUvfHJHIGBDvbKsjhY4TlSqFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aO+5LJKM5aVXVtWSc/VJkg30pEJuYJ/h9CIGqHHmOdaKtPZ8U
	baqvdsmc8f2OXmywgnmOUNszo5KoDI4vBgL0fTqu0yOiQbAeMIFSIcUsYT87G4WudIFosDXyE/q
	kfG+ASkTQsMzPrXNofPaUVCkDIpUbvpa8NFS6Voq6sP64U+W+GRBU26TAa1OfJ9XS8g==
X-Gm-Gg: AYBFou0zt2hbj9O/mLrZGbrdoWihl1+1ZEq6VR7RGpk9NtZcf3DjUJu5D5qlGwRSpxf
	tw3IoLQEdsWjR80/XbirhZDHyKg5pzrZu+viXQ7zHy2sc4OTqkLIWbX0NgrgjaiyN54r/vvzKIG
	uZOH47cKMS9SdJchGyr1NokW5Ak/5WxRoShQ4ECCEoKZdxrCxlzGn5eN8CTnMrdikHC/Momjrme
	077pGrrbjUrQvFIwVzhV6C8rih6mtvPau33HREsz0ejWBpA9m3in1uuE7lGoW0eIXRqatETNCIQ
	5bp7MsWy7gWrmJEI8rUvngkfgMeCxqiPuyWYUKGMF6Haz9rkjpq+pBVoakkp71sLVyjjvuYbbLp
	E7SIzAWrCA+c8kvK/exNZPK/bQI0euW3q9g0mCZ1fUMd6RS4zUbafU7p2OWDm8rOov81eoS1kIj
	CRUmX49wPN/UlGq7nH
X-Received: by 2002:a05:622a:4c0a:b0:532:9b14:96c5 with SMTP id d75a77b69052e-54e15762f20mr63065911cf.60.1794011731406;
        Fri, 06 Nov 2026 16:35:31 -0800 (PST)
X-Received: by 2002:a05:622a:4c0a:b0:532:9b14:96c5 with SMTP id d75a77b69052e-54e15762f20mr63065661cf.60.1794011730921;
        Fri, 06 Nov 2026 16:35:30 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:35:13 -0500
Subject: [PATCH 2/3] usb: phy: phy-ab8500-usb: convert to
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
Message-Id: <20261106-usb-subsys-v1-2-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
In-Reply-To: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=KwKuScuKpz/3uSterueKo9bscNQg0aADIVbOPy7RCVI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFbnz6Cu5ppSJ75Fznd6r+epAd3HQwpqjliV5UbcaU
 q7NbPzfUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ+cTP8L4/R27p89ryvvazK
 0tEhR0+mt/o9Dez88Fgrw3HJ9gfSpgz/g/f/+VN5dac7l+0qm8+VXDJeUmHa6dNUzjooCvpcO2D
 PCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/usb/phy/phy-ab8500-usb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index e2e06e57dced..2c569c3244a0 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -988,17 +988,7 @@ static struct platform_driver ab8500_usb_driver = {
 	},
 };
 
-static int __init ab8500_usb_init(void)
-{
-	return platform_driver_register(&ab8500_usb_driver);
-}
-subsys_initcall(ab8500_usb_init);
-
-static void __exit ab8500_usb_exit(void)
-{
-	platform_driver_unregister(&ab8500_usb_driver);
-}
-module_exit(ab8500_usb_exit);
+subsys_platform_driver(ab8500_usb_driver);
 
 MODULE_AUTHOR("ST-Ericsson AB");
 MODULE_DESCRIPTION("AB8500 family usb transceiver driver");

-- 
2.56.0

