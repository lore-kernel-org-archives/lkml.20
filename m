Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574503;
	b=WvNkiWEbbbWG4LIN0NsGTXeGqnqPMX6MmsSMcSWWqB3PROuqXCyhSG6z8wA4aioZaXCC
	 nlMpzr6OZpPlQGHEHZ/KyjIDNPV17mrbkYy21JIMLulj2uvmss4p0y1y23W55dT5pezLR
	 Rg4o9dga9hd9Ur0XCpGXVHYkTZ+GtPylM7M313WqcugHOeTTG7hakICU+/afvkYip7fBQ
	 jqN0wHZKdiuR3ZbU4IHT98C89Q1l4C05ECon5lPZJQWlPPxs42Lx3i9QTbwO6PRIIVQ8C
	 pZorh38qVJd7cS5RBr+XeahdLqxu4MlbdV1PKqjSAAJvvGCVT0htGRJztHImtpHd67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574503;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TqZ79ECxYN/RwCBf7F+bL3hULKViJj255xlTW5oDrDw=;
	b=Gket+pvTqfPYndK4Y3ZF5for0NG8a3RxlHauFOtgsv1IJDMF81v+V0hsOlst3HdKFwwP
	 UdYNFKGF4PVMQzt595m132GFOGY+iZ8T3Bei5EsJeaPOL/VRaZHu/pmGsjhyIE7YNTcj6
	 yjwXhcNYfHPTmHVoSm6Zn5o8lYGbLGRa+0QX5ZJTqmsWjxE5p+bv4FhlsuB3e6bZl4kF4
	 ixRGdrX3pwylfP5/soCkKFRi9H3PFGCxNTQAJlFv5iayXieB/CruRLykBURmjZECf63ea
	 tJSeOtoWr+LdxM6GnWEKSru5Gq+RSszmBj2c2M6OBvevsMLRMa788cn3QAgf4lOOA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=WhvXiVSE;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546160A2606
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9546160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=WhvXiVSE
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 32DDB3F998
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792574501;
	bh=TqZ79ECxYN/RwCBf7F+bL3hULKViJj255xlTW5oDrDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=WhvXiVSEPinCRhs3oLUbwdZIhVPLfxfLSp1yJbAhYnFuM77nJerKvSzjrYVHeRkdX
	 xnBwP/BaKADyLcjbqi+dHaCsntgKb4esG4dPx+BHvnw4nqYNzB1xZAA7oeogFkddcU
	 5mrUEV+lFHeP/kX+H1juF2jYLAMYJcNdxXq+DjV9mX97KigFuQlBPBb8Hiv6v6cAjF
	 pA3TORXZhTe81bnvBGDaqnhK5dk8AG/b7savi0Ckk52PtXGHKbOjEKZMyQbyLxEj4j
	 1lQhdPaRydyvmQuQpaT8+tyB7+99bdPExNSDGC9vhZmbSofWTgWKwE2VISFbpAZDFn
	 TM6a1ftddN8dzffJ9fnNwn1ZbwM0h3AN/+A3VdC1SjBQrDPpFfLKGz0Cy8amLT0mz1
	 cBQV+IucZkwLaUwnMHAujOCC57k1us3JfH8VFp4kIWFHJt73/Yv7zpydzfVqH0m6gV
	 teo8Fs99aFfZVeVPNmX4zSgAOBocxvtbwT9JunB0PNbqGTZcyKfnVnVOhTJvRK8Qij
	 T8+dDeJjBmpih9sDz/XW8C7SS55bZOf0iP6/tXRTGqPnDKN/NrTy9tZLxS9CEnH+Lx
	 BKUDjPYLaBd3rhVt698wfrKXMAF+bg4XhEakCiDy4oXu9z0hrozHszpy/2z/hYEucj
	 OSh4yb6kqz/NQl74KKiUZQFc=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e969b16118so1312165ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574499; x=1793179299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqZ79ECxYN/RwCBf7F+bL3hULKViJj255xlTW5oDrDw=;
        b=MuyU0Rmlu1QWimArGr83yt9dyUOBzr9xu+fhw25inGNGx++sNwEmzjTOioMrF8NLEA
         tZ6MrQrqcdNJiQZ00Zu7VNQnMqPYk/b+p+etDKgJnwCNaSdVhuixvMTJAEg3xvEB+dlV
         gFy/qqtWCKBGxzsBHJmKZP9CMd0OvWpM6mvgXzQjAMnZXIwcHZGdYDJP47PZsLTe9jCj
         U6HQqNQHWfdeQWzmeGfQQAxdL1U08B9yh9Cpmoie7TOFItGmATkq0FknLg2KTMaRWkEM
         af/Y5rPtjsXHnsFFkCQO7voenKEf6OZ00b+ZyouFIasPwzJp2UdNkyH9VaGy+5RUu4OS
         kRkQ==
X-Gm-Message-State: AFq9FYLEc9qiNhc96QQDmBH40WPhgEGLCh8cS7YD3W/R1E5MOfEXuj5o
	pEyQNl3dXU7FiWGW2AjReM/ehV8NCDCD6RUn/EKnV3/i0BDXYc+1Jv9t2433gYj4q3uuLloiXfc
	UZF9n/YAVUVttouOgIVFHTxSUxJMJMl7ycJ2lvQF5RErsJIO2ytzoF3q6wdbi5Y3DbQ8pJNPwL6
	zkWUfnYg==
X-Gm-Gg: AYBFou2VuC55YF8CuDmni1FQNBiSphPX6TgtXwGIOXlGBjtNL5HnjBWnA7vJw3dTw31
	SwE4HocLedFu23LEG53QDqA5RypCdzWfjq9xSn/C1hPG7PnObijNhQy06rn2lS4KHkqXBMqjn7F
	U0IVKZsglAiudsq4cFQ9DITasE3x7ULDJOTNkOPMhIduHy1CbbSTexNQ/hqHpdJWiJsD9Anc17c
	xK+4NlW6yo+4UN3dwkDCF6eo/XfDq6x4pTQWCbJI2gzX0UDdNsdyFNH2oPyw6kiRZYlrE4dPeV4
	YtTzaM9KaHf5mDxIgS1HvCG0yM3u69fn1IkCGbIwDifJpXBXd88F18z/np/U/Q1g1Jgl4B8T6lw
	zArdpOji2YOeyFWp83S/9wPZMP6NFM43mL+pXQ3aMamiCyQ+q+nb2uagDJjNSoWW2ER4qWzJ71Q
	TW3gChhYkuZu8yFrU263n0H/S27MhSLhCO8aMwOdLom2CKByxv81R6dm9yvBdzwO7TtC768BPLD
	snIxHVRWjdPco1t68SMwZFemoMlKRN3pMUqB/mMmA==
X-Received: by 2002:a17:903:2f85:b0:2e9:4175:306b with SMTP id d9443c01a7336-2ea4391292amr20386655ad.1.1792574499604;
        Wed, 21 Oct 2026 02:21:39 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2e9:4175:306b with SMTP id d9443c01a7336-2ea4391292amr20386405ad.1.1792574499271;
        Wed, 21 Oct 2026 02:21:39 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-c2b4-05d7-81df-1886.dynamic-ip6.hinet.net. [2001:b011:2008:445c:c2b4:5d7:81df:1886])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea4005a7c1sm6572935ad.71.2026.10.21.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:38 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v2 3/3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through normal serdev matching
Date: Wed, 21 Oct 2026 17:21:24 +0800
Message-Id: <20261021092124.2306053-3-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021092124.2306053-1-an.wu@canonical.com>
References: <20261021092124.2306053-1-an.wu@canonical.com>
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

The software-node-backed serdev client cannot match through ACPI or
device tree and is force-attached.

Set its name before adding it so the serdev core matches it normally.
Deferred probing is then handled by the driver core.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..2eee9ecbcae7 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -260,25 +260,14 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	/* The fwnode is a managed node, so it will be auto-put on serdev_device_put() */
 	fwnode_handle_get(dev_fwnode(&serdev->dev));
 
+	serdev_device_set_name(serdev, KBUILD_MODNAME);
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		serdev_device_put(serdev);
 		return dev_err_probe(&pdev->dev, ret, "adding serdev\n");
 	}
 
-	/*
-	 * serdev device <-> driver matching relies on OF or ACPI matches and
-	 * neither is available here, manually bind the driver.
-	 */
-	ret = device_driver_attach(&yt2_1380_fc_serdev_driver.driver, &serdev->dev);
-	if (ret) {
-		/* device_driver_attach() maps EPROBE_DEFER to EAGAIN, map it back */
-		serdev_device_remove(serdev);
-		return dev_err_probe(&pdev->dev,
-				     (ret == -EAGAIN) ? -EPROBE_DEFER : ret,
-				     "attaching serdev driver\n");
-	}
-
 	/* So that yt2_1380_fc_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
@@ -305,8 +294,10 @@ static int __init yt2_1380_fc_module_init(void)
 	int ret;
 
 	/*
-	 * serdev driver MUST be registered first because pdev driver calls
-	 * device_driver_attach() on the serdev, serdev-driver pair.
+	 * Register the serdev driver first, so that the serdev device added
+	 * by the pdev driver's probe() matches it and gets probed. serdev
+	 * drivers are probed asynchronously, so that probe may still be
+	 * running when the pdev probe() returns.
 	 */
 	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
 	if (ret)
-- 
2.34.1

