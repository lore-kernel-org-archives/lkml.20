Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032176;
	b=vXtiW55RMCnrT43i05pIxdzX11h40UWPSiLEarVnZXfcgS08WFxgQYgZjlTvpXAcUxs2
	 usQ3m8cgWJ5wEGq2qcfx1pwfycVQGd5wt9TgiPgeX7jjw7clRmMO6+oguGvuEXrV3Mx4U
	 4fXBuYhJi3iVRmY1xCvNM2LTomaLd4mT965EDLZvdhoAeAcpKJHgUM3dysj8+a9brOHu9
	 Ra0wV8Ahj/U8bB8mMWrKxEtIpZ7Iw0/XBZCv1/rGG/EdqqU74U36x30+noMTpAho2tQY+
	 QvxmW97FEzCSWy48gld/yBOdkQ9DQ+M/OyjShMyuaBXEyJobyBzBk52i7NFtVTfjrpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
	b=padXF/p4+WTHM0fupg3XCArOvFTZF5R0/2D3fynkozhrdZ5MYmUoRPtPnEVIkUWsGwB4
	 +QQbj0AVrwn/iWdZBkNCNOXaIKoqw0WLa8Q7LSidHCaakRnE0gdxgv27mDqDh1QuMobRh
	 atanX84k77T+JgzaU1RqmKEx0eSrZtbh7eaAEpL8KeWEqr3Zvpzjo4mIN5W7VqRR1ZNXS
	 jEUaim800eO7PHl1jAeqShCT23vcwHiWJnz/VpsI12huBK4OxfpVaI5Fprkhy6UpE/fw6
	 zd7dcSSiyq3qTB6o03d+HtddZB3WxoDLKlJGCBhjTkLi7EcwOSXWUGW4+yrN9IXUgLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EDQVoZKI;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C76606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EDQVoZKI
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d885929so2119573f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032174; x=1793636974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=EDQVoZKIFoHfyIabQaL7LH4hKsf9Qw78qyZwe7btZ3rAEDG9miGiW3Mhp6rT1GLY3C
         2hEdZE8VMyCjwNwTY1HtXWoQ+kOmULX86s+9YOZh0ZTTxOTb1Fzaikh+X9STyA+YofRp
         8u2HY6pI6Zkl+30+DqiYQhEsqqeDT2MW4aRNzAqiLZiHltaKDcMwTsx/QSvaNkmYgY7j
         lNoTG/OBg19+ni+x7bueG++TVlZOW/4GzN4jyWvUggBqUYFNxTc/nZUHeYmpWIqE86mj
         l4/2EmVagSsOo4xuMLzZAnypx1gNftYggWRnsPKRZl6YcRFLXUze87vGyyHjp0wshuGh
         wxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032174; x=1793636974;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=pK/c/By5jHRjqskGo45+7YCeadXp7LCEJyN5AeaPGoaolfNwV/UDxmzXWGDwWKS4Gz
         +nrZejRfMHJlKutjjuGu0/Q59w0j6ZUGBuAK5OUg/tx0BADK/kRdB22PytuDjCLTQh3Y
         mt3PUWaK6So+KinoVFa0eGjtzcCo2ZrUsK1tPVWe8bQnQmtSCuBBRt/c76YbN2tnKEqe
         FBeEK381RdNaAFk0Aw2AathgrVDhOr+PsSbffe/7S06hcF3Iafx+IS6B0bUusH6g/w1S
         k4tfiYWNb+Hiu97yCKwrWQZwxD8PZkJjAgyjNs1X7+CcdZFWhD7ugL+F55K3JbEopIv4
         tseQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+Fo8vEca9tBlPkp2Co1lXdbE2Ol0i4Br0IQQhNl1LRiGkJPSsmm812RExrqQvFtHWJpXqJpEZ/qnoVYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt80iCPNFe7eTNMTwE6tuVApBSUxOIlNBQAjxR0Gxtn7FjERCE
	evJl1KK/CKvP7lfC+EETUvus6esiiA73K2i4I4MqTTTJ0lld/kDCfinQL/J/TrJQGLk=
X-Gm-Gg: AYBFou28YaAM8QN/pfcStrN4ConCigZFn6dd/srDgw7hlAlb5navd5gZ/wXrRvpcia9
	EhoSIsRZ8bgmksSrpGrlf9yugqIaKu+cqOVMSOmr5r059xeTnJYQWsFsK4LsXXVX8u0/UXKEnql
	EIoBBvUZhCj3d7Vhhxz97XKl8AqZtH9sxJcZxJYu0MspjL//59IZVjNC1QXuJTqt75fVOaYurfI
	hPRyaCtwR1ZL/4LT+2r3QIL6fqYeJcLopUXwgjhdrFA7+hHZhgUdHplqI51bWlGLzN+ztDsa7H5
	muk3SE1ULCSJVKHnCffPKd6N5S2J6zWaPNSdzGA8XVEtgqYUSHeAq5+GfIfUUDec397Yk13ibms
	wKyN+l5nv0ePysRUN+4BDBJzidwY8BfH/gWtjjqwkTw1IJ32LblrR7U0omht7K6qJJAsGODP+P2
	dCt0cuN7VKo2ROOUC+tvahtpcHMd5FURoZE6iYXUXIKHJ3ycqbhb5wmBum+sKzMZbNzIc7ys+qW
	I7QPAe/oGWXjM9Tpu1KZNE8ylPAJVoT4pRJAK9OkJGlT4iB9xH9EV9RJGd7GhMBXAwq66GlbcBH
	WLEZxPrv2Q6uQ0zUXgMX+W+T6K9PvO3oTJ5EKn65LfkdCUy5BvN0pq/1/s7L5Kyw
X-Received: by 2002:a05:6000:4308:b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e3eb455a7mr13165387f8f.2.1793032173870;
        Mon, 26 Oct 2026 09:29:33 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecde7c3sm18281256f8f.51.2026.10.26.09.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/22] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
Date: Mon, 26 Oct 2026 17:28:17 +0100
Message-ID:  <6fe1e37942ee2f4d8ecfb4ff1a2313b9934165d8.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LtmNoSs0VsyI/755R4pZVK8cbuvtZIuCZ1dOLhKQlds=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqz79atZY1dsTbNslwvpzeqcJ7rR+9H6s31pwZHsHZFFm j5KHx52MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARISv2v/JL5va8mG/+fVPC 89Y1F+59zvY5at2lK34yqTzPtiZ8O0PSpJyml7fNJcKNvyvGxbspRXgHpEduuiRamLlzPTe/4ud XH7Kqlk91a1vfqFZT0jfLafHtT1NEuw+vOeEZN2ndTjH/d8F/rsvZzPs9tSFcZF2+zwNFYcGbWR 7cMo5fb4UUPYngrZvQ6mbcmvni1sy7e1S8H55lPvRCJKj6eoijVfj29hMCC1OCF+9Wjz7seqF4E 5/YokUfjvUmiLAYHV1e7pwbfXRP6eS3CR9FnwYrn963mtEsP3fprLvb6ucUCV0J3lVhwfo6vDwz Z+LhDSq3nrEdtlSsNIyUFJq6s7AkwE76yS2GVmYp7xu3AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
auxiliary_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..ad5dc9a3a119 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio", 0 },
+	{ "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
-- 
2.56.0.rc1

