Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD203B27F6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088531; cv=none; b=P8GtcHytRoY7f/7+nk2Uf9ZCB16YVp5oJCRKI8X8xGQZKevENL15HJGHKhq9iLvyA8PghVBGoZ+xtTJHxiuhk9YB0barhwDKZ0gZHv6rrwQAZF5kZmzrt/lSU+afKpXKudnIixucazxd+bJu3pbOwUcLRjQRR8X9Bsw2zHMAuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088531; c=relaxed/simple;
	bh=KZ/fD8FH+Wlo4KWrp3tSDdM6Rhcc8zTyI0ZU4yMUbuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uV3vSkmGp/BnRqTZHKTjLbsbhxIsjsSdA6kYymq46p8vpeYKq5Q8o+dFIqSk5J1oUpot1PRqbHoFyu0jO/cDoU+WIsgQVuHCwz8scHA1Cf168lbMv9v8l7mcKA3yIPp0Me6wI1/U07nvtzZZ5XAT8QeTGDB7oB71ZkzGgqkNPzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2uMRw3i; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2uMRw3i"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6f55a7089so24940805ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088527; x=1788693327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNBolfdjDJZim1d0V9ZQFfyaRgxWkpiwGCAz20WAkoM=;
        b=L2uMRw3iUVVbPwmVG0zGOQ+LoVFaMC/YFPSUlISVxytd0CMfq85FqmA2BWV7vh9mW7
         PlcWnxF2pgaLRB+IGk276yIN5XwXj60L1zE08VhafD4+KoqdClKyu0k3U0ZhEvXFjw4n
         EFlqVuc3SOZAyXJCIinlN/yI3JVCIxZ+4trT40ghI5fC7eAa1n07k2baCyQjHTij1wVL
         29YspZcWktvJcbyx7xl9zEzTDCnBtUGRr3OmChh7wRleUViUJfTtoaoSFaMeFTLMWP2z
         krXKMLA+t/jQAMuyi76nktE4a0sQJ3xJLuQrJMCtWqfIHPewOUKMw/KV1ffmqAiIUcLD
         R30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088527; x=1788693327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNBolfdjDJZim1d0V9ZQFfyaRgxWkpiwGCAz20WAkoM=;
        b=HlPczS4/m7ZjnIRIa4hKImr2+2hpXhVQ7m2M0n5JrbfMLrnXYpFH+T+MZdkbrYP1iK
         W8KlC8QrLvYysO8pORfcO/tdkiNRbr9vWEkPKsio3xaSuGoloVo7HlICAVRB2yKKwXCD
         CYqDvCfTuMhKnK7JGclaN4BZ0l9GvJxgaPLyPWR/FXZ098E6lFKDd5dMWDPHVSuRARb/
         VnfWmROljvObBMxggs9RgUxYY0WNp7B/b1oL9apANHbFi6ZJ46jl/GOJmP8N6NJNJi39
         xMhzMqwP5ToxufjpFWSOfx3iVCYNxuoyCHt8RnKVVFJPv97IsF7vLfyjxOX8HcmQd4GL
         NbYg==
X-Forwarded-Encrypted: i=1; AKwUvBzOexzaI6BKDaq/8FX1x9qiCMYbDixuXHitQCBm/eVKRM8p8iKEbSDv5qjJVbNDE9v7RfAtSeXUUv5sqYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwfS546H/xlknKNHXE1KIUlHn3pQFlQHBCS9kAHzwUMbmqg2w1
	M4IZkgSnhqKFApn74pTDixRUXeGuEG338PBOs5E3inMvjc2UriqWwr9/WgpzVQ==
X-Gm-Gg: AYBFou2W8Jkvgfwgz9JkCnVKLtHefMYyLilUijfpKt0TRggIXnrqEZ/iNXWcexwXPeq
	SOgWB8IT/DAg4/xHmg/SJq01bL84pXi68J5nOUSrTlTl/xM2ODff4NCQASpg0vqfpcKmVzAlT99
	4gq9Q5sizQN88SFr0lEdgeyunx7DVpeXdvIrPvLdOm66ZWnaeExwDkrr5BRoSOLWPb8dVOo2JD5
	59ENi53NrU/mJ9so1Uqhhznj/RTdJdoWscALoYUGmLb1TNtsKkrNdw5mYTFStVaBnjhho3Ripu0
	3Pqw9FfIlJ7fbvsoCvSqyDxY0j4Nsvt1OwnYWFNkE6DYFm41ffn3VY13dUQizohyZq5U6R4KLWr
	m9GGQ8i2QdPfQlZKr4JhMsHP7juDyUSvRh+61vPmbAtwoNr9QvPG9Z0JMSuM3v2Cx9t5rXAuNut
	y4+OUjjM+iV6QTAmasZeJcI+Si8e1d5LKq9KrEf38WzkHqMn9ucXqId0c4m/5rwbe7qKo06NrRx
	DoUZ+CPJtB7onb/qqJ+/EZMlnBup9HKcGvODFsEXjgHZcab79I=
X-Received: by 2002:a17:90b:4fca:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-396d0daf8d9mr31040405a91.4.1788088526642;
        Sun, 30 Aug 2026 04:15:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:10 -0700
Subject: [PATCH 6/6] platform/x86: x86-android-tablets: use shared battery
 swnode group on Yoga Tab 2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-6-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The WM5102 codec software node lenovo_yoga_tab2_830_1050_wm5102 is
registered automatically when attached to the codec device via
device_add_software_node() in lenovo_yoga_tab2_830_1050_init_codec().

Including it in lenovo_yoga_tab2_830_1050_swnodes is therefore
redundant, leaving generic_lipo_hv_4v35_battery_node as the only node
needing registration.

Switch lenovo_yoga_tab2_830_1050_info and lenovo_yoga_tab2_1380_info to
use the shared generic_lipo_hv_4v35_battery_swnodes group directly and
drop the custom lenovo_yoga_tab2_830_1050_swnodes array.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index cd8cee1f4aed..52d96ae89078 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -427,12 +427,6 @@ static const struct software_node lenovo_yoga_tab2_830_1050_wm5102 = {
 	.properties = lenovo_yoga_tab2_830_1050_wm1502_props,
 };
 
-static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
-	&lenovo_yoga_tab2_830_1050_wm5102,
-	&generic_lipo_hv_4v35_battery_node,
-	NULL
-};
-
 static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
@@ -448,7 +442,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_830_1050_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = lenovo_yoga_tab2_modules,
 	.has_crystalcove = true,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
@@ -794,7 +788,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_1380_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = lenovo_yoga_tab2_modules,
 	.has_crystalcove = true,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,

-- 
2.55.0.897.gb25b4bd76c-goog

