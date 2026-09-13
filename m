Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8440862C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339075; cv=none; b=FBrHnvFCNg29NOK8QKaZCZY3Ze+45fYpZREMvILjgC+1AufWiYZsdeZaWPufpAeOP9ifCLUm/9uiZkRgUOfwinGsDchHCPdNCT+fhl3fUwx8hYQIBuiRIRAsuctYDr7dMQyLAQpIqd9EZ7izZtd8gtAyvhx95OFcYmd5AB/CxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339075; c=relaxed/simple;
	bh=77rMhJ96Hr7kt35p05mN/FY3qSVNLhdnYmkNXT/rfv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVwup84i+z+UzJgVWsi3dKIQXP5efbbtIXVFMcikBIILzE66V+rACtpQYGco+R7gnwosgWGpjPI2hNo/ThqkesS3FvUD2xHVVygWSY50cbJjU8EyREAH+P1AFsxcQCh6U4zcZB2Lkg0KsPR2r5/OHJc0FhpCP2ENHbbXz6oOJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7ObzS3B; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7ObzS3B"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-939fa4f2b81so139748485a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339072; x=1789943872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eC2whU9fXcoJ6LICLe5n5h5thnnSk+FT//fcnt2+uc=;
        b=K7ObzS3BsTgssppi06tUopRu3nLYwoAyj0LjrjmjTyYZCD0K1sYB1wf5UicISAfcwt
         2WC8Tb9n5Ho+kBA2ulPRAZ6Cz3P9sLwGKPO68kagYeJAHvrsWDtffdZK55UAxtHOal+A
         OiZyAJrWjx0KLwW8e4m64LOXcm+dF0uDUNv/041EoeUtDsqPe/thrsx2aBexG36jtj95
         uZxswIl7rvc6vzn0FQ0WL4O9sMwINQIUr7fbGfZvaX7HPGJWso7KdQAISYR74hZkYG5B
         OeH1y+1JNqmDx4Uf4vDc9lzB1OUM/MMZvs6hN4zO0tCq9l7pbui41t8yIIgz1lRamJqm
         1KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339072; x=1789943872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eC2whU9fXcoJ6LICLe5n5h5thnnSk+FT//fcnt2+uc=;
        b=mglYTofYrI7fg9pjZKJKjJXiFS8TyqnuLzdDg/TGtXAl0N5a3v2R9Fax31FUnZlANz
         dNU3ZQD6tpDiGbroxbcf8EGgJ3NRUKcTdD4hX9cyB+dmwcs/W5eWa1liKJnTH/tDbnoK
         UVxiJ4s0ocvAB1fPJJscXZMMMQqTIOz8WHX1XVt5B4ELj0tg5aDi4Gd2ZyJBeBlvjfFO
         30kx8meNh6YrbNNu4kYKuSn5rEQ6KWdocldYE27c4I8TZZruRqgCRJnA54beH2IJv98y
         I7T96R8JBiUGX2N0OMe4dwNxrxJUkVKq5uHsF1+ubSFjFM9ngwaHX+UFFACvGg3XoQn2
         IvuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbvQKtmGv2neVylHPyOlNPoU1NA3trK1a41fC/LBZHMaBjv91t7NLuqanlWNikzMNN/gjggdMQWIZCsys=@vger.kernel.org
X-Gm-Message-State: AFuF++njm1EMiLP/r27fJBHEordFXWzKlNVnEeolha/rzd6yTo22sC2a
	i9D3wGVQjNkiTW0pr12B+Q/4aPlArTgrisgR7eywCD0YGfQUAg9jJYyswYBTDOxDoDxB
X-Gm-Gg: AYBFou18glGWBx4A09O3u5sj0OofpcIf8Su+d2jasdXz3nhkeQHJ1YQpuG7KuJKKCF5
	PU+cPx5nDzsCWsWYtI1NQ8RUgzcszJ3dLy9/faP7xCovVk1k1gPZ+i5pJK9f72kp5+KdFI1udbI
	cQNsFtyFurOBTk8WrlALFuIML3BapPff80SqjNpVnOWZI9ORm6bJVheIKAwCpljcJSlsO4xvwsi
	22rFuYYURKQW36XGlaGttK8mn+i/wrZM3Qm9/wD79Kj/xluw0IVA9CmotM054XFStB7PHHITcDh
	472BO/yjP+5xI5bMo4LLkhz8qH5+fKlTwu95jAY4RF8gr4bhYZlsDnwaA3c76TWi75CnoTQqgFW
	BHpZleoOHH6rruYzZ3GWbXVyul4nVyU632OVkj/BMdFDxoYWWLQ3e1/23+p5taAr36OBFN1Vdz0
	2GHCnZubED15Yn+wN61ltPZ06UGQ3LWxyqHM8NG3xMCX17NLdZoI/N5/YvCECFtb+njxA+7un2a
	ZohXEe79n6SsvHsN+X4TozVV3SAw3sL/Jw78amsZp9+lvymiuJq+b3gVtDMA/4g+H8kVXgymJkX
	yKs3Pd+O8SAWBOWxRaZK4OZo1jmgjZFJUg==
X-Received: by 2002:a05:620a:8081:b0:932:ddff:123d with SMTP id af79cd13be357-93a29945ca8mr25452485a.29.1789339072480;
        Sun, 13 Sep 2026 15:37:52 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: ohci-platform: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:31 -0400
Message-ID: <20260913223732.92882-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913223732.92882-1-mhun512@gmail.com>
References: <20260913223732.92882-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When OHCI reports remote-wakeup capability, a successful wakeup enable
leaves a source attached after driver unbind: usb_remove_hcd() does not
disable controller wakeup.

Disable it after usb_remove_hcd() to balance the enable.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: fa3364b5a2d7 ("USB: OHCI: Add a generic platform device driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index c801527..c2a90a4 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -246,6 +246,7 @@ static void ohci_platform_remove(struct platform_device *dev)
 
 	pm_runtime_get_sync(&dev->dev);
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(&dev->dev);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);
