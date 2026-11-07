Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010873;
	b=5ZtPbQ4oFVhgqfGFcC9UuUeQKIA6Gche0FwZLqmD7QG/xu1YJOEf8HCVgC2jjMlyD5c6
	 XqYjGG+uwr1gv2N7yHnb9k67TUhvGBbCBs8JwRtKA05Ho4BfioMTNO1O925pv8kK89+Ut
	 Kc/CqyWJTaMOZkEnla31PspK3LvJA5VAtlQr0YWuzTyoUCVKr1IGMjTJ6LmKMiotsuBvK
	 TYyz5eTgyRwwSW9MVyGoRvnzrLags8Dte7ePfICPXNmkXwm3IZRDEPJdzlpi8ucXJ3SUU
	 bS/XJ7Vkyb72PbTUayPHbxN5J2AFWMClqeZaKh+GuNYtrU12MktQm3TGC/jywgWq1Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010873;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
	b=1EQKFHwWBGJ8JXLlPUCoJP0uIqKanbxF8RGexdIUeVrhbxdoDP/wVlLFjTUPR7hjloLx
	 RfCP46dDKwSOptYVMiZAEoXnr9y35pmEtQ98Owcoc6FJn8lQcu3sdRkkkR9fZTGyaQh6d
	 m8/DOTd0WZihGzMTYw9uJPwFbY88lruiHVOZIft3j+Fljs/alS03ovLOvCUEhlDHG9SZ2
	 hlSAxS/4Ym1BHFq5lZwtBHOVNCiHk8bHvl85JSEVg6Ijwj0v2HM2tzML6MLaII84TLa4L
	 p8/0qbScSTmx3vaBGSxjP6LaZtx83Bwry2i951/u9kc2e2OwDl8XVagUv1PCYgEXBkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tkiu5bk0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MnDusvBC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C1606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252C1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tkiu5bk0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MnDusvBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
	b=Tkiu5bk09yUHR1uaxZwik0Ai84WIe1t6DsgAKuMvQFYBECWQbk27DVJhBRzk2wFctvTJiM
	q2t4tNO526VcKsUI0/mxhfVSHWb6MXA/MzKo0iqH9jlhYDRCnAl7hlXZl5zyZokmMEkKsW
	OebQ4NvRyV+TN7EV3pyontATDAby1no=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-vTQVp8NWMsO6OVn-edItig-1; Fri, 06 Nov 2026 19:21:05 -0500
X-MC-Unique: vTQVp8NWMsO6OVn-edItig-1
X-Mimecast-MFC-AGG-ID: vTQVp8NWMsO6OVn-edItig_1794010865
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363fa3d3e4so25801681cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010865; x=1794615665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
        b=MnDusvBC/Y2jouH9+SmLPWi2YJ0nHgXTKZp3gQjFPxqMwZ+CZKkOYAtycYmx23rOZ7
         S94Pe3BveuN/IvIjg/5SJqpw8UtjV8yJ53h0CwzVSrlEvfDG5ZQ+WlqFh3rgbn1css7B
         hnZIcgZ6NMXGEQ90CC7fa0lnELzr/rbHB+oFvGJ6DCjoS6Lr8gjVQkCpuGtwFGmQvyFW
         IOrK+alaU6RnvcuD5YzujB7lSlGZpjms1GjWuxImNaR3ddgKjQn1UdiU7sOlspA2jQiD
         b6h7AbiGKCoo4o3hYVEEzVJFqkN6/VvzZU9uq+NVxw5OLQI27QtxRoqRz7cI0eHHeumO
         W1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010865; x=1794615665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
        b=PD7KHDTbZ4KVWwx6SHBFujQUEDncZ0gso/UrcsfrKx9LuuC4INcYkBhiOzzUFAKzTb
         dmdA2RMmVQiP8sLGKF5yEaQak3c++nxOFCuxYRI/MfDkf5okjc9pKNg39GwEF2eW2Oo6
         ug9cXTplSriqBM3IRfbmr4WRQHFfiuCzJ5Y+Vm00iP9iQy6eKgWaUwwREDdXXia6AxnQ
         bpRzf7dUfLbuMw8xD3TAWUWuLHMMjieanLM9B3zOpUkFft0dfoczBiailhL/5mkyTKEe
         A8PWSdHQK+UbfjY020Pr2f5X00fBLZYDwg411Cpd405UReSkKzpIghkYFtSwJInaBEhv
         AFGw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ0xkJy9nbPYWpkrrj2LoRBwL0hPbD1wFfWDzPY5ryJ7vPObClj0X/K+YHO3/RslGVSefxe9+9BxTxYdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XCnkBzcxeGUZWs0c56K3WoLwZ0ozCqs8KsEdWVox9Hp4X8k6l
	awprLS9rB1cnfQW/NshfNTZSgR8OTxrySiGsJrP5kaQS8EUye36wh56jbb+piTSl7oUlIUFD8G5
	/UOz+u1A11vmErd1B5X8IiLjzal/7ZOZeMcwjgcGqsIqs3abimohdp3T9QtEjrH1oMw==
X-Gm-Gg: AYBFou1pJh3aTxBroODWZei/LmjVFzTG5nS/u6/nagOQHNAiL7c2TO0VcaXIxv0ic3P
	Fi0CsMDnErMfbi07GR3DwddWvvjzQfpWN1SlrdhS1/QjK+zanGXl/PUkciXasyyVKtsGAeZoO6g
	d9+aIHABvuZ6A9p7L6G3wdat9SqcSmL5vxOyFXaOcBXpX3iWystzpEFDWCOmrZV4KPLxpDemN92
	upTaEUrYqLZTywI05V1UvzQWxkZDQ/sJQWhhsRWbiMfvsIItuEYV9Jtg97PpAVqcZPO8Ks6hcC8
	UqT1NQGXeSCfnfFS8Pnijfbmbd48MsVFEK8Tw6oOqo5UAjin2re1AnwvlKJisiz8/yHPnvSvxZe
	G+vJrxx47rSyIzEvhopJUP3aI3SS7Eks3Ivla9/SpXg1oOqnrmEeg2ADUowD6YjRfSSKtmgYHCO
	jJoFFupQJ+DNuflz75
X-Received: by 2002:a05:622a:4d09:b0:532:c057:9564 with SMTP id d75a77b69052e-54e130945e6mr65066231cf.23.1794010864998;
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
X-Received: by 2002:a05:622a:4d09:b0:532:c057:9564 with SMTP id d75a77b69052e-54e130945e6mr65065991cf.23.1794010864646;
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:20:50 -0500
Subject: [PATCH 1/2] mfd: qcom-pm8xxx: convert to subsys_platform_driver()
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
Message-Id: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An9xVkNlvQgpiky47BGz2nZjV45FIb4wx87M5kPdjww=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5b2Ie/hoyhftY5G71X/E3jU/4PFa80pGmnTM6tiGZ
 Usl+J+s7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiSdYM/zOfxlm6/Wg63azm
 GsGrP3vL11pV1si4FQtYLEWE/75j1Gb4KzA9V7TwrmzEufkBRek2vo86YroOxtkESbzOUr7zz6u
 QCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mfd/qcom-pm8xxx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..14de2a5e6ba6 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -594,17 +594,7 @@ static struct platform_driver pm8xxx_driver = {
 	},
 };
 
-static int __init pm8xxx_init(void)
-{
-	return platform_driver_register(&pm8xxx_driver);
-}
-subsys_initcall(pm8xxx_init);
-
-static void __exit pm8xxx_exit(void)
-{
-	platform_driver_unregister(&pm8xxx_driver);
-}
-module_exit(pm8xxx_exit);
+subsys_platform_driver(pm8xxx_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("PMIC 8xxx core driver");

-- 
2.56.0

