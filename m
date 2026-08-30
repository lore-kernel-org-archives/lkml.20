Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB032F7EE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088521; cv=none; b=I+z1R8VOlHQrHq+BGzm7UOoyd90fKusbVlXg0YqXduU844ict6dC+4lp5msZimmzK446cAdEwQrQF90FgGij6nTWtyaFBaiew9oF4wrKX57Dtay0pgmfN5ssZ5hansH7QBCUNPAcHbhKqOl6iX5g2A7Fln7et7KeRVjn8ERX0bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088521; c=relaxed/simple;
	bh=L+kBfOFoAZ0Oqva+U3xNU7w4Xq/HFuIKHhhVREciYCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqT1QXb1pZsHqRoRt5OlgAnN6wp2Qp1w7Qgo6CfDgRHotAKyddk0/ZyPEdyY9XrfQ8l1VmSDuFuCyypkLonIaTlu0Yzc17/ZSrNm2oUCrtCxZWKllx385NdKz5/ybDhmAzdBRscsM0qTcKtkIOzXjWaoc8fcvEzdYLnYiuk9iM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg78OhFy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg78OhFy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ff7d9acso325775ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088517; x=1788693317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeoPQYEaTrf5uEGgRnLGKCII+rVjxqLzd1wRSr/Slf8=;
        b=sg78OhFyi52k9f7u6DWvLabLZe5vNnzVPsUOX0zpSFHpxjpFSsmryA9ufGDY3qjso9
         rSmzCuk7eReQ3pv/EZ9k45wtS4hg7k2+RSqwfh0SRA++DbkLIB3ZVqEtFdaJpajBex7n
         8ULdLUjngbsQt9renHzYIZyg4dGfjxhNDQC59shP4FGczYM1gfSPq5IFN+UItN4rHoVu
         gVPpUXs/S1Iblkc3FQvMQHOoaVusxOlrW2Lahy5qXpsE31H/RpG+hREMu3js3eOL+KNM
         K4p87K5/OUaI2geSkQsEFFjWrINpCqa5B1ipqMeZ3fNzdIRUXMCWMJk9Su2UkjySSaP2
         GVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088517; x=1788693317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeoPQYEaTrf5uEGgRnLGKCII+rVjxqLzd1wRSr/Slf8=;
        b=sXXwhwDlezuPWFZI2NBhBO9aT+O2CHRg0OZrZOSF1WcoABoTBUVXqIjKCtuKg1SPOy
         LfgJJ4juNx3HS4AhBHfvChWgkhVCMLsIVfqXlvfRi/VvbfNqxHxgxvvPRafFQdPOgxMF
         jGO7afOkPbZ5aP5Q0hhlsJLshGQex3dERl9wc5d9p5I0yAcWqTdtcQxkpY9wNrcuKk87
         krdn/G6cmxkHFoNIoTsWaYnOUgPuww/Yy5DSoIiYr1db9hKEx4TU/wBIru0xc38ZVAJ2
         frP6z6thfI7M/U5op7aKVdxlh8jrTuamLVRPcx9j1tPOIfCIrW9O8HPF5pWZefY7VBAY
         f8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzDFdATjGk55jTVswIKvmVBUE5tCI7+bmhZsFt1nmIfE7Sh/7qt0Wu/Xvne7PVIS9hObpdF08GyFeruTM8=@vger.kernel.org
X-Gm-Message-State: AFuF++kPclxkeJ+LeuDXGluctwGnTujwZA2q7/exjRLKtyGPp/o2n4XB
	SfhgaVx0uJHwePovYwpW1OhswXCkQQy06er+IsERse9ik8OTeGRh9hXw
X-Gm-Gg: AYBFou3WAuH0IUKLBMfHXZsplHkI4BaiV88ErhLjB/i2JGWjlZ2Q/U4BpsfyIqcpoCb
	Fvgp8SLxiapaW2ZjNgQADitgVnK0+BFnFO3O+IneZPvyuiPr2LRaJzQ4f99Xdn6KsF+MgXxlDEq
	Kq/YSmN6f3wmum3HMUsfYhcnGugtW1A3lSuMIYfTy7YZYqHknd5cj5gzi2FFvKfUxtcVwJbHqUE
	V2+bUB50in9GuI4rpqXaxqqJDgNfPXOwmA2tK79izjXAfY+lRzGLm7YO0XgrUy9JJKAcMHNxRaw
	osGhbC9pJuiNSn+48+yqVwAuwQa+nt8TJ5600GoO9fIG6Z95JWE2/b/eBIKbGlfXLr3CvKVPzUI
	6HYwmPs3SqNipdVwflzO5/RSuhlBGtvbqKMJclf9hN8P+Er8pNcaiyTqkA2KbfHotlIqdV0+PjA
	A4QTbLn5Q6HiTTwmtksiNrsdPOZe7OIky4tZReKQ5MWE0cONXmFN1GsDJpC1zhmdeE1lhYLhL1X
	c9cGUYZEhR3Fp+cLJtvzCHCr1eqRTCTKVTH6UeK7qrzdIiq/5LVwMeyVfwhMsA=
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr249489195ad.13.1788088516722;
        Sun, 30 Aug 2026 04:15:16 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:06 -0700
Subject: [PATCH 2/6] platform/x86: x86-android-tablets: hold device
 reference for secondary fwnode teardown
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-2-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

In gpio_secondary_fwnode_init(), acpi_bus_find_device_by_name() returns a
device reference, but the local dev variable is declared with
__free(put_device), dropping the reference at the end of each iteration.
Meanwhile, devm_add_action_or_reset() saves the dev pointer for
gpio_secondary_unset() without incrementing its reference count, which
could lead to a use-after-free during driver teardown if the device is
released in the interim.

Acquire an explicit device reference with get_device() when registering
the devres action, and drop it with put_device() inside
gpio_secondary_unset().

Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 5db794d65eb5..722c0ae4ecd1 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -367,6 +367,7 @@ static void gpio_secondary_unset(void *data)
 	struct device *dev = data;
 
 	set_secondary_fwnode(dev, NULL);
+	put_device(dev);
 }
 
 static void gpio_secondary_unregister_node_group(void *data)
@@ -409,7 +410,7 @@ static int gpio_secondary_fwnode_init(struct device *parent)
 
 		set_secondary_fwnode(dev, fwnode);
 
-		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, dev);
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
 		if (ret)
 			return ret;
 	}

-- 
2.55.0.897.gb25b4bd76c-goog

