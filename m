Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010874;
	b=CCmUDzv7BJEbDTNnaW4E6MBPbi5q4U4ftGMEuJl5XV3eZcGkx8E6rz3kMHmiPNXaBbT6
	 S2WiNwiLRthn6jkXjl4XCStIGl4vJ7vGTlic47Z00fpzY1XDdX4N4AiW1rCWbHAGtu3hX
	 C/Vi0of1UO9kklXbMCBvRK4gpcREXlKEjYRx5q17uCmnlT0npgqkgUGvrvcyr00C075H6
	 dEZfRHXEzb7qYh6e1II7SYaT01cfO2iCzaRzMstfDgdzNFta6dEuilTtBEy9hPNBAZyzc
	 btbVbFfHz07qD2mvRM2lJLMYsprdEN0YidLudp5pz2qXzPsKZnsTQmRIR5ww/rpMbIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010874;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
	b=40XGR/cjoc46NTUqcMDIq+4djDvZqCoVDJc17vGf2HeSpCcL0IBQC4VOtkv2COu62juD
	 jSPeW0QmZPYYX8rN9QytjEgBZjtSTlBQu0pzt1T3a+hzIf6fYXzUi9Kn95wLuXxonk9A+
	 ee7t6W4WpBs2cSGdWLk9Rc8EHJchWq1MSo73Qmw83/oPzhTmuElIUycLMFBfcIo3eucpE
	 QNbQ80wxwxOsBMMHztJmVItFjhQ9tbnpBBH2JjbK1eC7pI7Azpw7weFtexq6HqBVVy1NW
	 /Y+X65l0aHIeMUWEtK04CL/vCLEqQdsKVncT/zmgHMSDoDFolaZm8ZJGPh/3zhGoAAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c4tABIeZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TlhEYliG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B0606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F6B0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c4tABIeZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TlhEYliG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
	b=c4tABIeZxGpJTqTGCw9OUphl0LPIqQA8VvGz0TkVlcr4vxS062WWvd+J7MQ6XGQvfrTr5R
	G5Xp8Di0cnDCPNu4fu/9aQPXNXRAEKR+dr2cWlVmDj+f0l8MaBMC+3ipZx68HNsPTIXF4+
	SJ5Y7A5MLPrIvpzM02tgXtNvf6matXM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-l2U2GBchORKu_zt-mH-_kg-1; Fri, 06 Nov 2026 19:21:07 -0500
X-MC-Unique: l2U2GBchORKu_zt-mH-_kg-1
X-Mimecast-MFC-AGG-ID: l2U2GBchORKu_zt-mH-_kg_1794010867
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337ed1ba44so25051711cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010867; x=1794615667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
        b=TlhEYliGVbeKP+cp7MH+ItIjtZR2X3n36TPBi5pXitgqQ8L9XAHGScWOhnej5Mbf4m
         nzlc5FSbF8+zNBTnzNheFU7fbwKZJ/Y5i75a4bszXmvU+n/Z50jG4EHqg7wjaO8Nd5sh
         kuDLDC3FbjCH60JeOk2QSlVkCA6VtwPYja35LF0aOz4UjixbVnPR34uupPLJuo13SMEX
         47KXXddkVEMHaTN7XPKm1y4qL0tBcAmiwU++hqi6qCxlWn4qjeVlKDS13KUDFrq8G5K2
         oDLC2KF//jwoURVAFFLWKjGIZuRxFGOjBhKYZYu+1NYYSKtOKJEnDSDia5VnMOv46Lpi
         cHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010867; x=1794615667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
        b=T2FD39ysQ9nuxqXBlEwVjGDCoz5HNaKVVRI2E+wRrC837LG4VctDQ06bkVsdRe186N
         rcVRlpIVXLCdHzck//E2l0ddOlDe/WVwjtgK+HL7WBG4MKNLLIdBUQS0lNup35SOj8PP
         GusBIjYFWIdfeWIM8SvIZbTbQFKP4+9WiT6hDN49EzSxotdlZnhNf2zF1C5BLzY6qWez
         0Hak5B/z0Ng+Q5e4W9QAqnC3tSQqQSs3p2dO6+4RIVFCm35rLC5gTOxiLIFosYsbGD7K
         y6RsWZRWJYMnWVqvCFcosxnzi+XSCjwNZFBsDatOZuH4mgi5ivsZfgm8cE75DsMcQGLu
         H9UA==
X-Forwarded-Encrypted: i=1; AKwUvBwSDUdL9mS//x+1rVgHY07gN3BmR4YzPsB7BH9xYviXcWa9l2MqjvbbU5/SfDTDaFEhm+WoGnnkrZ5Xdms=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FQQBewtr8bDmDkYHlhJFxnY7eLR1Ewla05t1VwTyrfsP/e7x4
	RkJmzYCE0PQrQOFxwtPaLWSx5wQVLQrlwnF29OzmIro8mhazuK7o4mSAY2v+FDpIhSSiQMvt657
	YiwBZAefbEd8gz4k7icfSEOY/CIyukJEeh1JvzNNNuY83/Mpkzj2+qO3zMNXDXCoPhg==
X-Gm-Gg: AYBFou30VNuBgAEApbh+jzacobA2tDNGCpGBqiM3LQGVpBQdqvds04OcLLYGREomk/n
	f28GAnoaFctSFMKJAsB6cjcxVxw1ax9uG2EKG2Sf68R149uNxwLygTd5v70Yf5rXNhXMjbe7LjV
	KhGrTATaoGBYKew2Ie6gL0gvvA/n6ybE3Ujn7PgonU9ql83K++HOlTLUYavMpg3XhrnXJN0/42u
	Tgz+PDb4zVrZRxplEhXcb/WFbxWD4/+HnUvIzsGoZHGgYGt8nqfBnz65sswEPY/DGN8TbOZ7Ydt
	CiMW5gdRVkANRfxwhJcBacQpG37Amma0Wmkiam6q7QLaV0ukfjkFiGbNQQoCWg8+nHI9s1G5ATC
	/DxWAowq5OkrPaItj6ZGTjxjYEmxkOMhWAwQ038WqWG2Hk7+Qy8WmvWdMwK9q4+riGY8az6WNoL
	b0d1ZyLleQin2BT8hL
X-Received: by 2002:a05:622a:1245:b0:535:1f5c:e489 with SMTP id d75a77b69052e-54e105045cbmr71062541cf.5.1794010866800;
        Fri, 06 Nov 2026 16:21:06 -0800 (PST)
X-Received: by 2002:a05:622a:1245:b0:535:1f5c:e489 with SMTP id d75a77b69052e-54e105045cbmr71062141cf.5.1794010866242;
        Fri, 06 Nov 2026 16:21:06 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:20:51 -0500
Subject: [PATCH 2/2] mfd: tps65911-comparator: convert to
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
Message-Id: <20261106-mfd-subsys-v1-2-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ukJ7KafP99YfAsIJ7Y5Krw2MYdB6MwZA/beMmQx/SzY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5b2su/XsLr/Iq4VWWT9/bJvN9lqp6Lz2x8BfO5Zs6
 Vp34s/axo5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmsleGkWHvpL060r/Uz5rP
 yyuy2DPLdJLG+mUJ6g91YxZ/3vRxZx8rw//8T429XhtsmHTNf9kc2RJ1z3ZR3medLUWiRzkP7ON
 OO8sEAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mfd/tps65911-comparator.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index cc8545a972bc..db787a4c765a 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -157,17 +157,7 @@ static struct platform_driver tps65911_comparator_driver = {
 	.remove = tps65911_comparator_remove,
 };
 
-static int __init tps65911_comparator_init(void)
-{
-	return platform_driver_register(&tps65911_comparator_driver);
-}
-subsys_initcall(tps65911_comparator_init);
-
-static void __exit tps65911_comparator_exit(void)
-{
-	platform_driver_unregister(&tps65911_comparator_driver);
-}
-module_exit(tps65911_comparator_exit);
+subsys_platform_driver(tps65911_comparator_driver);
 
 MODULE_AUTHOR("Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>");
 MODULE_DESCRIPTION("TPS65911 comparator driver");

-- 
2.56.0

