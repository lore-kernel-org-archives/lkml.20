Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013689;
	b=A0Z3OqNvouhjpK3/GMB5A/rKWyHUT0cq2/z1YSuu7iZ8RvpczRTl+uk30yaYBOfqQFkU
	 UHN69u5BvKvlHAr8xSXWoi0FY8txllboNb3yyjd9FuXr2fqlgPouh6ZAbHfYHwvPTDQ7r
	 gHP66Fu2ReQEgegR+NeePvDO1AXp7aTvw7p4iZmqEkW/rnT0958c5e0kQyBjCB/f1Pb5l
	 Wf0qnuAGw7x2ZlzEhstfsxoRjj+ay0WoWe2516f8EqGou7F4spUG/8DKLLBk1bedpkfyW
	 9hhdrtC8EwgWPVJ4VmXR71qi0H7G4FnN/dFDCQ1riAEFTCqyCch91Rs3vtUsiTKEcFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013689;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QXV2j9N+OCsupic/UJYrnfVM8yDj5IVkePu2jYOlWxg=;
	b=Dxof4Q2TiiQCQ+qjozVRmVEuvzCbUujk4fM2Qs/JsRBOsI2bsNKf5uo801AnkzfP9FfV
	 ItVcO+F+lB3W782X0WZtptIYt1xVsGXXGo+3D4mugSR9CtrEfXWResB7nJY/FYFt49bz8
	 6byyNBT8T/KPv41xsxDZIYv2B1GfA2MA7NmmAEvs8BAYmHI4AM5DrBVVB+tnmPLm2H7Vb
	 LUK4ksV/2pJ6ahXtC+H4YWuSsejvFK2+9fFMHK3YO176yrbLu85+yHGQDvnJkJt4dM2Qv
	 03dvA0MycEE4nh4sBLDdEQ8Ta67WHl135z6YfJ+r3HlzUo7eQpfslC2/4jz+k2ooSSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TLmFVqLX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MHY9KMVr;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D5F606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D5F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TLmFVqLX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MHY9KMVr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794013687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QXV2j9N+OCsupic/UJYrnfVM8yDj5IVkePu2jYOlWxg=;
	b=TLmFVqLXekxFEcRQYW+dmIt+VZP1RK16xYTemlpBbLnEFv/qZedqxTt0Mvf9TD+nLYjvoM
	i/PNmQh4KdnUZTeTwUE9OmviyV8ijF46TGG4pioK0v5MzYAsr6XHM3m6XpWi7m33EjCiIS
	BgCIrov53EowoQqWi0lKVdVzIPZPz1E=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-xEp9LtdYNUWu5gM4RX4idA-1; Fri, 06 Nov 2026 20:08:06 -0500
X-MC-Unique: xEp9LtdYNUWu5gM4RX4idA-1
X-Mimecast-MFC-AGG-ID: xEp9LtdYNUWu5gM4RX4idA_1794013686
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-537548d4bc0so29632521cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794013686; x=1794618486; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QXV2j9N+OCsupic/UJYrnfVM8yDj5IVkePu2jYOlWxg=;
        b=MHY9KMVr6ushneSy2+gp6nMGf7J7oreepksFd4MuEdywIM1W03VikyHr8YI6PFWPN/
         Xz/vG3iMTKwMaDg4lOYEYevgt0ZB+pKr4AIrSpLUh7MQjtz3meIsd3MvfjEcJjaMBrIh
         LQFRWeAoftMwzIg6ZK6u1lev0ObFu9yWGUnHQtwrnbYuLmNn7Pmh50s54sSPJ33WsWfd
         MKXIYBOmEMgksMn6XX6AR8PPeWVhrCIHPNkZbOCRjPsy70m0rytnQUhUwRvFh+/oY1/U
         GOYkIvAwd4SiiXILbcTDncxJtMJ+OBpKi3kjHQ8v739JxZHj/A10p9S9NDbZptIAT0H+
         yc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013686; x=1794618486;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QXV2j9N+OCsupic/UJYrnfVM8yDj5IVkePu2jYOlWxg=;
        b=FApEKtt0+SDnpDsHGRAXb9OaBGCQ0XeWN53XAENt9z7F7JKaHL6M5/zGDeMlNb2q58
         jnsdbX6uQcHHL1PxLviH4WMsGy4mW9Bs/kCMx6Fa8A41l+eRnyuQmdwkamAFjv11Ocrv
         sxY7tzID1DpkPx05tTi5CG0wYciyTev7MpsCp1RXcNP2BBE5KQIVk0gsL/S6GWlr2HU0
         YCZlPAOg924IFM6KLIUMvJI9MJEXimq4GF/4YKP40rBuKRs2yoUjah1uac6yZuYkhqgE
         isR3QIahmvM4/HAsNJmQrLI7gqiua8zcik3elvuZBKFEocc01Wk04LptHd4ATeeghZ26
         H0AA==
X-Gm-Message-State: APuU4Z/pubdpVRtmVOFtpD9LgLxTnBw3LdkXZivYs9cm1bAd5LzPaFWq
	pnoXa1JogVX15RaesFn1/IMk1mShwyjsGCgSjYHV88wpwYBqpEA50lNC8DSUaEsLVN6Alz1cHJd
	ULXRzOl60wSLzIgIq/AM7HvtGwm+LvmEK5kcEu5zFDAygyJUOY9BHDFQbBLilmpW4do8gK4UaIC
	X97vd3Xe4cEfHkFnR7v6WRdLDGDPCbTarLrc62f0DHAvUcvECX+7Y=
X-Gm-Gg: AYBFou16Gq7m9qezKlyEskhl8HvsyGGu5/mz6Fxs0x3zqzK9ATShJmB50QvLvRN2l/6
	fkAsRLnI9VLIqorz/3SF5KzCD4VaC62oYixwmqP9NJHejT9xkFVRv3LJBlZ7a9WmJHUr8vwyg4X
	ow96TzxSSN+M9Vg46/zHQLxRrs/bVKWSNftqzP5ofDHXLs6lxL+K3Azl07OVrIH4RmVTaYPaJuf
	uB+IYPqrgx/bwkARLkMlff1Ip9UF0lQu+m8tIM/Dat/lJXvxg3jBM3QVoMfuDHq474ncDwflMYK
	kwmFrmW7DhZNJ1q58S/JLMs6YqJkhCgUDSrd+0f1dOMArLvWyo/biBWc2m51YUZ+PWDd4Rhnufb
	4xL1FmwzhBRiuDfjvBPPvYL7woQqQxyJjNFg/U+GigCrRP3cTO6UV2QB8RbZB8uymqylIUqPcQj
	hKZkn00nvK1Z4Tj1WM
X-Received: by 2002:a05:622a:124f:b0:54a:9f87:4a57 with SMTP id d75a77b69052e-54e102eff60mr70902541cf.3.1794013685387;
        Fri, 06 Nov 2026 17:08:05 -0800 (PST)
X-Received: by 2002:a05:622a:124f:b0:54a:9f87:4a57 with SMTP id d75a77b69052e-54e102eff60mr70902111cf.3.1794013684824;
        Fri, 06 Nov 2026 17:08:04 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a638a7sm32936686d6.22.2026.11.06.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 20:07:44 -0500
Subject: [PATCH] extcon: max77843: convert to subsys_platform_driver()
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
Message-Id: <20261106-extcon-subsys-v1-1-6a781b323d6f@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVpGxF1FbGoGoxFSQch0rsrl
 l/y3n8DYyBkqLMbAh7EtPgElWfgJutHFNQng5a6VEqWAs/NLV7w3vHFQhe6ktZ2tjAG0mcNOND
 59Zr2d1rO6LY3AjE+KNU+Y3EAAAA=
X-Change-ID: 20261106-extcon-subsys-24280aaba499
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=gT+j5AZr6awdfo6enGTtH90WdUB+Q9yjoOtCRKDM8u4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeVX5Qyokqnpfzds6WBSuvzHGKnpcS4N7gPnHHjTNt8
 6aZ/lp8raOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ/J7K8FdG69vLopAD2XPa
 78vsmLDmv+HdPlW/zZ38CzVn3e2y+tHByLDkU9bGierlrOZenhaCr6t+FLkcErh2JFw6actMm7v
 Mz1kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver is configured in the Kconfig to be a tristate,
the driver doesn't have suppress_bind_attrs set, and there is no __exit
function defined. This change will add an __exit function that
unregisters the platform driver.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/extcon/extcon-max77843.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index 2ae9f7f1a67f..6adc4cd6f94a 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -960,11 +960,7 @@ static struct platform_driver max77843_muic_driver = {
 	.id_table	= max77843_muic_id,
 };
 
-static int __init max77843_muic_init(void)
-{
-	return platform_driver_register(&max77843_muic_driver);
-}
-subsys_initcall(max77843_muic_init);
+subsys_platform_driver(max77843_muic_driver);
 
 MODULE_DESCRIPTION("Maxim MAX77843 Extcon driver");
 MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-extcon-subsys-24280aaba499

Best regards,
--  
Brian Masney <bmasney@redhat.com>

