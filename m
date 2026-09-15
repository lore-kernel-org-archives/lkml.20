Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380B4A92EA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473273; cv=none; b=aW+mJPtukKt5wjINTQYSFe3R2EkbuObLBofmKDcmSbSkb6l3x5i/e3EL8emBMSyIdRzVH6EdqE1c7p91Z7aTwWJJ25W1tNJqa/0UziEa6gbItBur9hR5/ot5/pHz5ZoehUdyZyZCOaANdpgLSYHudk4VcSuLGi9w+CSuy+U3F9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473273; c=relaxed/simple;
	bh=4XUMdGNNDdDpAAwbuOPgfyiNEZsB2ALa50w4MMtVLVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KV7D5vjQOxSKjTT7vxxucwIbAwvZbB3GT03X1jqVuJHaVhTn1xBZ8+OQhhp18XBiKciPQkfsYdKXw21wQe/J5HIXZ0Rf+jWC99AfVEwcZMT3XauHR6a8YmayM2ZVJa3DqVUWrxv22bv6ZZSZfVK/88YFHi0igcHjWkyEfkjHiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FigqRK52; arc=none smtp.client-ip=74.125.230.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FigqRK52"
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3a48db5ecfcso24100371fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473269; x=1790078069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOQoh1y5NM/04T86C2Jn4EMNc9+KHCfk34Vs3gnxreo=;
        b=FigqRK52Rn2Y8/VXB1shDMAozSXPXg9xWtWgfLoPoUHkP0Lb45WjwlmCYNsXceluIw
         YWBH4+KZXnpFYeMgLzUoiG5cyMmX0dX8Xb7d3g046ehJCH0pyPAxMllY1Z39YPRaweoT
         Yud8YIm3GZOApFDqxtve9Aly4+A8TjVIbWtqRjt9SJpVnYDYrIJ4beLAalYiJ18ty7rg
         ti2MH4bChR0hH4FGGskn6cf/NBxFDnI1WayX2IaukVDyTMyDIXz1nVigJgcyhGhFAqbx
         kLuizIlbBRoYG7YrDzyyHjrtPOjz1HqIcuSDMkBaqnBJXhS0BR3MqQALmpSUev9BWiNQ
         fHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473269; x=1790078069;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOQoh1y5NM/04T86C2Jn4EMNc9+KHCfk34Vs3gnxreo=;
        b=XOZ2ukylVo86Frl3HIXxD+DTnoIy8ZHaxAh+1TVH3dhtdRTp3yBwPZkd36J8gZTv2M
         SutaXu2+x8Oa0w2+EyqyfJiLgPiKHbSorP1wJ00CNcldZoOmx83bFdUQpaKfl/UpBdAU
         pjJLA8kBZDndSv+c2PTskyn5LrR2BLV/Bztyz4iKPAxkI32oTTROkgZ2b5/7VsztzSps
         Zkr+7co1i6UGyGc7GnrQBD32TX2nE88Hri0Dsf6v7wr9rhSvvAPRg7BUPcYJL21/0qhp
         uHxpz7bcEHaZcTEtnZdTgty7g40LCNw/io/HBv1gx48ovRt0bGbCsaJ6Pc5KM8nSHzio
         93Xg==
X-Forwarded-Encrypted: i=1; AKwUvByAmRXJZhrKpw4Gg/sHe7cKdiOenrDBn3CL2CrtQs1t76eFOLOKd9sq1qgKF8sjw4BmQj/OSv1zuCLh1Nk=@vger.kernel.org
X-Gm-Message-State: AFuF++muUAWGO28+Ds6LQ3IjNHvxLMPqZ2SHRGKR5prwT01D56g3eh+h
	ZOT1AzZ4ruwzP78bvRf8x4XxwwMbUuF6ZaJEgFJeQIcoPRrRglJDxXHP
X-Gm-Gg: AYBFou1+Q3b8hyVAsYS9oGGq8r6HYuc/MqrwCfwrrKtGDRCW+QYqAZ8Xhn+650ByEly
	PTu5EyaPqbaC4aidwGKLmAp9KYJm1zk3EasDvgZD5ACqpE8sSAs4UvlA7efoCOtK4GtFTRvML5O
	o8fXE4VFY0hFnic64qmH6iKdIQ0Ws2ejTk+yvQw4gcaI9t+XCKo6/cygXydDPQNf3CPIARaz3Jd
	mJ1CmPD+IXVtF8pJ17p8wsxE4w8tpXSmGFt3wcvdtbs35da0gYMI5HdQ997l1CGt0Lij0zbfgMG
	NfYAtcajl3bCzPakXNzLZuWF8XBE1JegCTRMCPDqjHnbAOzQ3hEBlZWwgbX7pz1YlKDe7PQEBpi
	Zc6xETd26a4dTD9GOOGITzX32aT30KbvyxlJIu4uVvrasH6pBnGsFTWqJm8hMybGSaWwyRImEQk
	fYCFTImkTo1qnxDwX++E/SeABZg1A+2hTN3SU0Fyo6s1d5NmwilxC7O3HOuUw9trG9sNQ5BVYbb
	NSt3nX7gkTRsj7DUvIKQWnl3rM=
X-Received: by 2002:a05:6512:110b:b0:5b5:e7a8:9b1d with SMTP id 2adb3069b0e04-5b8ae68dbafmr4041728e87.13.1789473268925;
        Tue, 15 Sep 2026 04:54:28 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a334bae0sm33906521fa.24.2026.09.15.04.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:54:28 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	Kailang Yang <kailang@realtek.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Sean Rhodes <sean@starlabs.systems>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Martin Hamilton <m@martinh.net>,
	Bharat Dev Burman <bharat.singh7924@gmail.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Denis Arefev <arefev@swemel.ru>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.6 v2] ALSA: hda: Fix missing pointer check in hda_component_manager_init function
Date: Tue, 15 Sep 2026 14:54:08 +0300
Message-ID: <20260915115410.106036-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denis Arefev <arefev@swemel.ru>

commit 1cf11d80db5df805b538c942269e05a65bcaf5bc upstream.

The __component_match_add function may assign the 'matchptr' pointer
the value ERR_PTR(-ENOMEM), which will subsequently be dereferenced.

The call stack leading to the error looks like this:

hda_component_manager_init
|-> component_match_add
    |-> component_match_add_release
        |-> __component_match_add ( ... ,**matchptr, ... )
            |-> *matchptr = ERR_PTR(-ENOMEM);       // assign
|-> component_master_add_with_match( ...  match)
    |-> component_match_realloc(match, match->num); // dereference

Add IS_ERR() check to prevent the crash.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: ae7abe36e352 ("ALSA: hda/realtek: Add CS35L41 support for Thinkpad laptops")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[Roman: Instead of modifying hda_component_manager_init() (which does not
yet exist in version 6.6), a check needs to be added to the
cs35l41_generic_fixup() function—the very function introduced by the
offending commit, which calls component_match_add() without verifying its
successful completion. A check should also be added to
tas2781_generic_fixup]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2025-40097
v2: 6.6 is missing 1cf11d80db5d ("ALSA: hda: Fix missing pointer check in
hda_component_manager_init function") as well, and it is the newer tree,
so 6.1 cannot go first here.
A 6.6 version also needs one more hunk than this: 6.6 has a second
unguarded component_match_add() in tas2781_generic_fixup() alongside the
cs35l41_generic_fixup() one.
Send a v2 covering 6.6, both call sites, and 6.1 
as Sasha Levin <sashal@kernel.org> suggested.

 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 937f3fdbab25..a020e824fbb2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7052,6 +7052,11 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 			spec->comps[i].codec = cdc;
 			component_match_add(dev, &spec->match,
 					    comp_match_cs35l41_dev_name, rec);
+			if (IS_ERR(spec->match)) {
+				codec_err(cdc, "Fail to add component %ld\n",
+					PTR_ERR(spec->match));
+				return;
+			}
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
@@ -7084,6 +7089,11 @@ static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
 		spec->comps[0].codec = cdc;
 		component_match_add(dev, &spec->match,
 			comp_match_tas2781_dev_name, rec);
+			if (IS_ERR(spec->match)) {
+				codec_err(cdc, "Fail to add component %ld\n",
+					PTR_ERR(spec->match));
+				return;
+			}
 		ret = component_master_add_with_match(dev, &comp_master_ops,
 			spec->match);
 		if (ret)
-- 
2.53.0

