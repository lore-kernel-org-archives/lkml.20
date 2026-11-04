Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826898;
	b=tm4cz3zTN7NkBC98ZhYQQxg4WxwXVBodbJxKZ0HU6BZw0bKyf18TfSwghdtTqoFVo//8
	 /FbklOc/qEF3r53ckPTc7SYX6isHv3z2C39mIzdG7cj8dt+CBTVrAF5IngoOOCYf/E+S+
	 PNRKLW4/DNQJdIqMTUzQWxUsznOOr+V4wlt9GMPBj1c2Txqp5QkbkxMwZiOt0B82rh1HD
	 /ntP1SRkUl1/t4HCPIMOsbhuh1oJLq/ctB/aAmyqy0BdGO9KljaQ624fKISDwecaZNMa4
	 R6T6ca005USq7tF3Vh5vugQ+fclKB5QVRPozbDbehKQdN1oopLYjPel1QcJzxjBYagQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f3BqD1OwVSoHT8EUbtaIi6oF8j+TF/48vKRJtgYYzW8=;
	b=OKILUUgfxKA3rwbhoSMFA6S/IIDfxkuDt20Eam/5BO/VTX5Wj9XcGTbuvG0T88TXGctS
	 q9iRfPmC72KzvraUgz8qm9Rcjku7jMQzR1+Cc+tWkz9a5gweLr+hErZSLuj5XmmqT542w
	 re55YOKTDZU0llMuJINlMMIpPaPcZulX9DXy6t0XLeZA/0HSOUeW7CEE4hSVyd/gjg74h
	 w+nSMwadNx8qXQLg8yr3NxHCmsKjzpvpYgOD8Niya8GBIF7zDsnN27REBBS/al/MW9vP2
	 pxMLljMzSfhaBLF2dCThUBfv8AphTVt1lCHAXcdpq1Kt6JIvjfwlCqM5BsqxioXGP8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2ZPue3G;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B96072663
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 696B96072663
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2ZPue3G
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a1947498bso2795437eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826897; x=1794431697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3BqD1OwVSoHT8EUbtaIi6oF8j+TF/48vKRJtgYYzW8=;
        b=h2ZPue3GAkA3JRtKQGC492+Qb8gnc074iQDaQkTM2tmgKSXJVLp/iTkI/eT1JZwSdn
         LgDvNhAZjQ3ERPkhlBCJ8U/nMje/dxi6+1yfveblQv4HiccV9mFM9zUXqF/3b2A2rj6k
         dvyXKSyNdZfXW9JcCeljSsJRKiCVE+1K5Vc+7IRZHhFqGmkU56Kp/vlda58J1nxpVEw9
         LSy4mYyKl8aiOSc8jP/dXFtDj3ElMWbKBkfBGDPfbQa6kMEZW1dDz4BcpcjZaDhCpzH5
         jqJEsoBVq0obh/o4JGJ32Yetbje944HYNCWQhtS6oBLBEssKsz0boclZHUv8H9YuDNwk
         Ge7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826897; x=1794431697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3BqD1OwVSoHT8EUbtaIi6oF8j+TF/48vKRJtgYYzW8=;
        b=ObbfbsyP/xmnSJXyFV0AnjMbBzLivZA+X2JdRV+OzPd9oHEfK6/zAA074C1rI9t3Ua
         rkJvT++toUIos+Q1sEHrjAxb/NsC9+pFbuOyb1lT85wCo8kHM7gt5h6fs7USIcGDzwdf
         J/ImS6H32oO9roy5ImSOt4pjwKKqHMjfXD+0TSjtF+1c7GL6ed9ox6afu5GC0Ixrb/Nz
         AfRvMzRV1dieHAdBDrIZi77lkDRbtKvOZkUvO8xxN+q7t9Byy0xj4IFsbiZWoKzz+CTf
         mbxQ11bq+0k7j6EdFomeIgWZKr96e9cI53IyqBaGagR3NZCOfRT2IJwtrZb261A5RX8r
         mDpw==
X-Forwarded-Encrypted: i=1; AKwUvBzKpWCuASpQAuUeDcNDItmZeqRaWUKEvmJInnQ8fCW+J9TEeidX01Qez1wMzb402iCOiXrmf8ich9ZJTII=@vger.kernel.org
X-Gm-Message-State: APuU4Z95+18FyJCcSdPfbr+TWcVC6WIxL4OuMaTtoBQtJcz8uBPG5rNm
	sfdHfGh+sIZEhRRCook+Kpcgm1voB1T1yJkagKh2FdhiLvCM704Ofkfm
X-Gm-Gg: AYBFou0SEXIisJ+S7U11WcWjxtjuUGZlIOQlUvmPVZ2qiCYzmSjfD8iu81TcxPdp2v2
	zht73qgFXDdHczqPMP9wMgiWFQpLd9t7F7CBSPsZLNOcIZI6wjNO6R5fUXEg2bMrsE/k4h6UB6Y
	uo6Jv2ZAiCAJ0K/Q0hZGrZsCbBUL2JsX9lWFomNPZ7iTaSkPJbtaJITISfKkSKJXqW38VBfd5jC
	L7X45ItVHKFlbf28pZk5wtfbwf8swvoO42SwXblmsuinbE/rhog0CmS2LVHdFriktxQXcuqh+6+
	KTVvgB3yWJ652nLLBXpeXFEWqqRj1nxpmX/z7gUelcCx4gPk4e2uY3ZQFRqocjQE/QJkshK3HTK
	tx65EHwzzjvwqXKJ4rL5bfBvzT8Z6Lhi4JPxg/psI4+7Hc8tO7kn+oZ9OkotUoChyjleOLfeK9f
	/9fA6ZVPUoJr1v4DD8h4bULJqEXxtrhMhe7VjKivRCkDi/82chjj90t5+zKRvv2DqC7R+mXhdkf
	Q6Qn04BIz1kXogm564J78eUd5k0SO5OQp/dUSkBt2+LVBaD6gFv/rx8eUBPvXu6l6u8LAvWZkz5
	Sxvzy19xL6xam6bXEpNNx3itkvzA2FA/NaO1jZPmaAfEw0rok3dTsdr5B3KuYG/NCQ==
X-Received: by 2002:a05:701b:2806:b0:190:b2de:1549 with SMTP id a92af1059eb24-1ac557770c0mr23698408c88.1.1793826897202;
        Wed, 04 Nov 2026 13:14:57 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2f7sm10606078c88.9.2026.11.04.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:14:56 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	sara.sharon@intel.com,
	luciano.coelho@intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: cfg80211: don't truncate the merged MBSSID profile length
Date: Thu,  5 Nov 2026 02:44:50 +0530
Message-ID: <20261104211451.693451-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
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

cfg80211_parse_mbssid_data() keeps the length of a non-transmitted BSSID
profile in a u8. cfg80211_merge_profile() returns a size_t, and it
concatenates a profile that is split over several Multiple BSSID
elements, so the merged length can be well above 255 even though every
single sub-element is at most 255 bytes long.

The value is then cut to its low 8 bits. A 300 byte profile is handled
as a 44 byte one: the elements after the cut are lost from the generated
non-transmitted BSS, and if the Multiple BSSID-Index element lies past
the cut the BSS is dropped altogether. Any AP in range can send such a
profile.

The multi-link code further down in the same file already uses a signed
size type for the profile length. Do the same here, cfg80211_find_ie()
and cfg80211_gen_new_ie() take a size_t anyway.

Fixes: fe806e4992c9 ("cfg80211: support profile split between elements")
Cc: stable@vger.kernel.org
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 net/wireless/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index ac56338f0f43..8e9ce8336876 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -2592,7 +2592,7 @@ cfg80211_parse_mbssid_data(struct wiphy *wiphy,
 		if (elem->data[0] < 1 || (int)elem->data[0] > 8)
 			continue;
 		for_each_element(sub, elem->data + 1, elem->datalen - 1) {
-			u8 profile_len;
+			size_t profile_len;
 
 			if (sub->id != 0 || sub->datalen < 4) {
 				/* not a valid BSS profile */
-- 
2.56.0

