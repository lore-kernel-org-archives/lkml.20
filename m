Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010988;
	b=BcvCa+PXlvBrrGvLiu6WMvVZ0Zkx1C5Vjx0YQ6wP8hscgRELoesJsJU0y5ftRWbixYl3
	 mrcN/DK1PzIQ6Yhb5U+3OiP07sF3fLXzKRGyCnXZvHGCMT+FeGC9j/m2BUkKiDR1dR1Lw
	 Udvvkxq8bVcWwm4RwFw/E0DoGE6dWxcCyvlake4SHtY6e3b11YxPIe4LB3FZksYSNWL6l
	 jRRO8U7Io4gy5eH3zUvnfjJQk+8FnE1TX/zQv/nuUUChqpukiPTvXjj6l+WzeJBrsugHQ
	 tlYlieDMbMr2JrUGOh7I7yo9v3QbSI9upRwn+FfLVoqpoTAtAzVHnJy0pHMd0Hnk6Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010988;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2qaTxHIWADCsfkpTNdGVSiRyXwMuC2Zxo+DZ+nY8soU=;
	b=IKX4NszwgBiph8Lykb1yt6oFHXUjaFepiFmLKTGUEwDHTDgXtNEmOmzhQYn3pmxaKCct
	 YWWdMWYA/PQ7Ps0SUt8oIoVCVjLDB90fJYA/hql8lEQWcm/yhtlF+bxVU1YpXCmqOiEjF
	 onPeyD7qVIO0N2FZDpP6ZjsqGiH5ccM0cFxzhurnNj/VrVhOtJG2GQc+Vh4TVUoTnSeB9
	 yZ/jY4ONnn8jn68jNGQO2ENA2wHKashxaKtNZqj9HrvVcVct+jjMFTY3FhqKZyHAj83TH
	 Dj9waQ7EirfrsqtMPuA8LH3LqdwIO5vzNQN+c+nNleJN3NLW5FOxFcOax8a3wJMCmqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZPyRkwTu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Dz9471Y/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357C606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1357C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZPyRkwTu;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Dz9471Y/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2qaTxHIWADCsfkpTNdGVSiRyXwMuC2Zxo+DZ+nY8soU=;
	b=ZPyRkwTuxvDIR1oBAqELuoyFu16UV1m4MNUKVO14pu/Ad8EkcHmJkFJpx8M3q8T019VFWN
	NYNJTTj0nCDA4js+YFIqP8eudCOZnQswDejUuVBe1tD+WXQwWxNoCTYpF6+hiter70rKb1
	BI3etOum5PhNyTircQIcqDRoOieD7bQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-MEWqyLjaMl2giUYgnLjOtA-1; Fri, 06 Nov 2026 19:23:06 -0500
X-MC-Unique: MEWqyLjaMl2giUYgnLjOtA-1
X-Mimecast-MFC-AGG-ID: MEWqyLjaMl2giUYgnLjOtA_1794010985
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso203811985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010985; x=1794615785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2qaTxHIWADCsfkpTNdGVSiRyXwMuC2Zxo+DZ+nY8soU=;
        b=Dz9471Y/fqQYJPAaoPkI20gM5SV6nTWp43wJ74T1RNhzVflwoSNxEA72r007EetH7a
         M21q4pUDBPvc6diaUhO0p6lTGroo+TBK51hUFey7OF0yrqNgawLYVXfvmVzvYMt9QdLT
         QUJ/3a8UKGbhwbwA9Hxc4hhhPhz7d1TTXOiYkN6XUQslPiEoO/10C3vOLdBN/J39SI4A
         BZo2wuLYSBg6MfEtc6xEwoBO4Hvp7Qeb4nS7YS7Mrb7T3pEGbZqYoGWwBZR+cx83sTrY
         +sQXOhMXEj5YiPRzGPToxMABL757kyldUGy1ZG8ZpEpJ1GlK10YLWlUDX2cQEm8qaHpp
         ZWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010985; x=1794615785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2qaTxHIWADCsfkpTNdGVSiRyXwMuC2Zxo+DZ+nY8soU=;
        b=CQCitaMMwFP7FmicVUp2nF477801XZ75XQqBKQOqchRFRVN0kj6BS06yR6V9lZM+Lo
         cdnUUoXqepNKWTinXfLiNn1dQMMBdSGfnqqv1fpNyJRH2wvBeXYUcnRKIRTKpBPaAANZ
         S937cCYxMJMuBQS3U3auWvDBfu5vdsq+A2a1/eQpPQ/0DpCmlFWXMy9pOYPJeNxjl44V
         Xys5/4Fx/KFQhlaUxFN+w9TTSZq8k7lUDzEFm7vCRDTAEsjvmXroFGlNJ6/XTR/rjRnw
         5B9dUrhmT4fEPZ0G3ditaXe8MnVHfx8gCE4o3TjMMJsDVNymEJ8ni42tSaOCWGlZWCsl
         sDOQ==
X-Forwarded-Encrypted: i=1; AKwUvByP1yOSZA4JvivcbDhHwKdbORYFjaaWLTEB0L0M6BXKzR3Z1WRbSA71wzFdtxeECXskwFD+BkfqiHMM3Ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vE75E7oD2ayqGxKXsTDme42/CM91f30Zi57fb1Ubgz90VGDJv
	lqQBXOEQqF+4/jFcgSmFaMw1uVbNdjDRZ/069HJLIbSRUk6X8tZ1pRxSUNilw4VECtVhWU6Qk6J
	WSIrNBi0BSCRkqnYiNxTYTF+Yg+gNULTVLIOSJZkoXAMg2B81oi59gruBugr9SJhx1A==
X-Gm-Gg: AYBFou0cWb7uxIdaos9c6CnIEQOgYNA+BtA6Rj0PG0sfJQeYyQRBwk6lOQ8F8lbPiUC
	sa10u2fArGLVQcclE2X99ybfJR6IuMJEHccrSs8H2/ELPcEVCqrh7ZP0pIWdCaEYSZGSIq31lm5
	zb30DwI3/vhs8Y1oizIF0BgONDrKiPnYs2n4k7lZiX99gwx1sd+46OECrwyL4CeS8dKBy8/Work
	WmZQeIPr63sFr455IsFLS+QolpZ7aCQz3B6AiOBZ2eGIhfzUCJNh2Tv3INZEhfdrjygjD5tPqa4
	uHIxbN0ZQ5f4YBR2kN+UGm8ufZcy8s1bihAMlrXUSknH7K6iUaDTLuu4br/JyWVlWiHJPWmz6ex
	EVxCatrNHpzt1Bupf1r/Pm+CcKf2wcVVjGckYpnFFUr173EgPH2AUd0OW9NRuBFX/8K/PeKuQsm
	H6Ww9WUtVz52Tiwoct
X-Received: by 2002:a05:620a:6889:b0:93a:10b0:aee7 with SMTP id af79cd13be357-945f35650dcmr603870285a.44.1794010985579;
        Fri, 06 Nov 2026 16:23:05 -0800 (PST)
X-Received: by 2002:a05:620a:6889:b0:93a:10b0:aee7 with SMTP id af79cd13be357-945f35650dcmr603867085a.44.1794010985129;
        Fri, 06 Nov 2026 16:23:05 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f58bf0f1sm258367185a.5.2026.11.06.16.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:23:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:22:52 -0500
Subject: [PATCH] PCI: altera-msi: convert to subsys_platform_driver()
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
Message-Id: <20261106-pci-subsys-v1-1-70da22799cdd@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWtihLq8ilhUDcYC6SBEvLti+
 SXn/BcIOSaBMrjA0c7C8+SBYQB2MFNPiltviKNYI0ZaLZaVbI2conLMdIGJSTtN4A+Lo46PL1b
 Vv/1yJLu+BbjvB3y1opluAAAA
X-Change-ID: 20261106-pci-subsys-8176914a5f6e
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CKquFl8HF2seB1BATCvbYeJLcxM42RWogE7U/Td8Ga0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5SfKfGZg/5vMGpTh5DBNT/Oo8/cl9/Mjrx0xjur4W
 2HIzGneUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQOOjD8rzE7dGO5/23dcv3L
 O9JPuZiXPFhxVn4667kS9Q4xhuX3OBj+Cm5YoNF1jf3XVYZ5muc35eRP3MJltOBJzOHabZNPd3z
 V4gQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pci/controller/pcie-altera-msi.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
index ea2ca2e70f20..03d76250752c 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -267,18 +267,8 @@ static struct platform_driver altera_msi_driver = {
 	.remove = altera_msi_remove,
 };
 
-static int __init altera_msi_init(void)
-{
-	return platform_driver_register(&altera_msi_driver);
-}
+subsys_platform_driver(altera_msi_driver);
 
-static void __exit altera_msi_exit(void)
-{
-	platform_driver_unregister(&altera_msi_driver);
-}
-
-subsys_initcall(altera_msi_init);
 MODULE_DEVICE_TABLE(of, altera_msi_of_match);
-module_exit(altera_msi_exit);
 MODULE_DESCRIPTION("Altera PCIe MSI support driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-pci-subsys-8176914a5f6e

Best regards,
--  
Brian Masney <bmasney@redhat.com>

