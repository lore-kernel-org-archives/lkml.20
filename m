Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013231;
	b=bEIYsj4jREc65e3b1mnyAyUM0E37TcAHYsaoc0yZH1HTa4pzfYK2dcsXisTyLGgQOVlE
	 npPU1Ni8kO4iScFh0/lFr2iryIl81USzSkmBeNBZpwqYS8Vy+s+KjoixF73cCjIGSoRk9
	 IsNIM0uGW17I1U+u5LVq1ZuB+oRi/5jIy6uND/67BUk0XFOr8b/EauTjQ/6vJFhZiFYRr
	 u2USwFRk6DZJ964MpSmBDQK9a99Ut6G8XtICdmgJXsU7CtwZOvlbwttjO7Z8LbWiU0R0/
	 QIbs6gyl+VGYWCTtIHlkba6JYwXnGBGNLKp6TogzHY4rJfLuVzXJzpOwEWaRPd00dzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013231;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
	b=ZbFvnO/uLL6NkwBhEmMPSQG63lCO4n7CpHxzIJCEMKcmeaWwg2ErUU8NBfG19B9UTAPh
	 igEdBQLeBxhyL30hOPbWAsZbontvNdemyzdPjD7Nkyey2/B2va5y92sZ5OV9iQcXZcG3w
	 /zFNqfXtpb5SXLNfIXbcpEAmbqhhomc73x23P09lUWVEs+p64IrDRlBFFCI5P8huQ316w
	 1u6pjiQOW/+myAW4JK8znk1oxe9g1qm71wkpVj9x8KbjTFziDWGJBZZD8y4jg1ZA81VzA
	 k42+lF8gM0t08jVxdhTzBfKVIV422do5sUqVMvWyvWj/YgL+51EGhteYpRgjYOXG1Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gI1iGMRU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="H1o1rsr/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A98606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A98606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gI1iGMRU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H1o1rsr/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794013230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
	b=gI1iGMRUgsMPlVdaLVnMsbbhIm/C0tTF1cI4XBwe4X8G4NPRJFUQpAsLhyGrVnAm7r/AB+
	eHWo9KAjjE0H35onOv4Ji3jJWN241jaARlhGSn/2BBV4M8gzh0Q+xMyi6CBjqzNU82zVt1
	IjxkOZLfdkPAYOSRUuAyqQkeK0K6brA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-WkcR3LV1PgiC0A5yHdwHQQ-1; Fri, 06 Nov 2026 20:00:28 -0500
X-MC-Unique: WkcR3LV1PgiC0A5yHdwHQQ-1
X-Mimecast-MFC-AGG-ID: WkcR3LV1PgiC0A5yHdwHQQ_1794013228
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso52176685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794013228; x=1794618028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
        b=H1o1rsr/2mqMrxPsgD491WDG1WDzWaeymjA/zevZ0pM+5Z3soifg5kXw4qHmmF+FoU
         QKoDgO7IC2fMauxGX3VRulFpYCtvMsGND2wTDVUVIcHlrdhSyqWtYOhhItRJchITPpSx
         Lq5RvILUV7waSY/lFJ42/ANlhUYUOUPau7bNbg85LZLZINpKwjHwrKsB90NT2FUrTknb
         79pqRgsnUt0Yuwf6utDQSla4RgyfWvettSDu9DrwzPq8r8wjTSeJsFeQpZuJXmayQeU+
         7ec1mg5bnyXnX/zVrAdHhm/kaD1vFvs20D8V+1D/oDNG4Nk1cI7I3Z5sHXY1XE9UQZn8
         j+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013228; x=1794618028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16HUaCp2sq85hg8bU8Q79JWawMIdomwhEGR1N+tBFQs=;
        b=DyyvI7aDwVlQPtRMaF13NeRGencn6lotZTUyKSnJZ0+4eRFsz5GZsxpLt/bU/Sa0cg
         0arXBvaLVWxWvNqK6i4YMm/1/Qw4lUO29Nz+8G45HAtFYNo5n6co1M4jD53IJkXnvRn0
         B28oBy2EJgZlbKOc3RjGKMtFF+aZeJveDfBZVUIKQkUt8Bnju/x1Yr+PfdW3Uz7rHNpX
         5ENpH7z/Z2nKy6LHejrUrZ8+ypFxAVoSj6B1oqWSpE2yrzbHif6yucGeEptmcRcvrF3A
         DDtv6/A2z82GL82jqHDA8KYp9zLLoysnk9iIJxkaKqEGHhnqIIJ4yrt+xL8518ZD0RtC
         fp/g==
X-Forwarded-Encrypted: i=1; AKwUvByrc4DuSdoCK6nw+pQyEDGZem6FPBATzpp+puDkTxZHMCGktfzmRycBZk3oIFfePo28fEEicJikIWibYdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vKUTH+B/URQoKMHOqiLL9rwUcfcH18Ftof9Wz8qC+VsTkR/Zd
	PktldYIEd1seSyuHnL7UOoD6zIW4KxTJ7i5BWsEVdzj7bDSVo97uUSmyFlfJ8YwY/IhUiQAq+ck
	zM42f/4/QwkWMc9n12ZBYgVbegqbrh4xta3ogZXhnkisapCmuoa9M0Hkrt5zftZvk/MaA7/Aj/f
	Mm
X-Gm-Gg: AYBFou18xjNLVDrJC7nxPf6N/g42arBPVGGEei+U23gjzNpB/0xhJ/8ELzb1aHgsf2k
	bERm0rY215Ea8S4ghNrfuaKY3LdfKlLc2nOCcmJMvmtqnfO4aka6RK56BwLbgI+3omuz8i4mg8I
	swOr3E9mD5Toh3zOqvefjJWT38gY2uNWMH4G5r0O78ZT6F1UxO0aqn0TOsCdatfmPU2mzD9wI/K
	88KBPuDYrVki293EDvs9KrEXaEZ84GANuTjKFLrdUBPin2LGUPS+pfV+5P8Sr2oqwfWuJUwdtca
	FrEbioli4IbghyZaeDWbxcovOHdkZOwJEhVVtc0leq/ix/J6hcz/Xy9LGnfv3TCQxZbkPCF9e6V
	OObq7q/Bz1jzXkXAcBCMg6NyoE7YUOcZxC7044D5MnTb7CsZuJwK9M44n4cwTj8yV/nNTD1DOsV
	WB3jkVt5cC7sGJVAqM
X-Received: by 2002:a05:620a:258b:b0:944:4e6:85d8 with SMTP id af79cd13be357-94604b8bb36mr113027085a.5.1794013228246;
        Fri, 06 Nov 2026 17:00:28 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:944:4e6:85d8 with SMTP id af79cd13be357-94604b8bb36mr113021485a.5.1794013227544;
        Fri, 06 Nov 2026 17:00:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm258908585a.8.2026.11.06.17.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:00:27 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 20:00:18 -0500
Subject: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
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
Message-Id: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3ZTcRN30gkzd4tKk4spiXVNLk8TkZCPDZCPTJCWgpoKi1LTMCrC
 B0bEQPlBlVmpyCcgUpdpaAIShc+dyAAAA
X-Change-ID: 20261106-dma-gpi-subsys-594acc21c25b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jmAzhr4h6GEVM+4TElleiQn0m9dCBbcSbMe6/5AUMZU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeVajvYHvCrcZnfVhup7ZbVD/jQymBBFPzLpMpT6rOT
 NCwenq6o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIksS2Fk2CdjtdZB7cIq7daS
 rSkXf0ju6Lrx+d2f5guVLB8/qCeXrGRk2G00j3+l2+FX5xUaTlVI/VNSZuI5/v9s5qyHDMpldzt
 2MgEA
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
 drivers/dma/qcom/gpi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..d6c76ce1846e 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2325,11 +2325,7 @@ static struct platform_driver gpi_driver = {
 	},
 };
 
-static int __init gpi_init(void)
-{
-	return platform_driver_register(&gpi_driver);
-}
-subsys_initcall(gpi_init)
+subsys_platform_driver(gpi_driver);
 
 MODULE_DESCRIPTION("QCOM GPI DMA engine driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-dma-gpi-subsys-594acc21c25b

Best regards,
--  
Brian Masney <bmasney@redhat.com>

