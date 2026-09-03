Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64CF412BF3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423570; cv=none; b=B49JxUr+R4tf+6GfCyg+u3Q3stkSi8WU4ztxQluR+0MSR0Zz8VQTZKGV9u6kLrw/96JqCOWC8cAT3jk2BoaC/cVgDsZOnyobv7A7HjVcTLMrX+2VpNOe95NxoyeH5mE14zE3D6Tg1c+dM+zdpu5FybBAWiWLVTHim39ryidppBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423570; c=relaxed/simple;
	bh=dboskfr/WbnD9iy2g2Z6ZHyrdYGaOgiWcFxOHivsHsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7rQfywybG66urkCSlmAZ/XtVRKsZw7QRFzNSKRrDIqQBpFmmd9opokv/ebrsktxBS8/xVa69A1y6ef0hqJ6Q3MPXfHhnIYi2q1vpKHqA5U+pWzP6vidBIlof6f9gsBo8vgNCDSihp4sBi7sM7qhpvP5cauK+TCGp6UVF0uTk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=singe.za.net; spf=pass smtp.mailfrom=white.za.net; dkim=pass (1024-bit key) header.d=singe.za.net header.i=@singe.za.net header.b=qIn9VHsp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=singe.za.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=white.za.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=singe.za.net header.i=@singe.za.net header.b="qIn9VHsp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e4998d28so1512991f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=singe.za.net; s=google; t=1788423567; x=1789028367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87q+8eSNMFxYzwvsFisXuoJT/zkVDq4SE1UqY3UlKec=;
        b=qIn9VHspg8YLxX/yxnv/L6Au/hX6137h5/CEQaBixmrC30295AlXF5LX08bV+k4NEN
         gX/vHgPkhVTEyMMYIKq+WlDj7gfBbYIbc+fjad4BSJ4ZG/DJz/wG/Rh2pQ5QRl7I2O0+
         XpycctwRrGcpdz2y8+HMlO5yqFMrVQCryq5ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423567; x=1789028367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87q+8eSNMFxYzwvsFisXuoJT/zkVDq4SE1UqY3UlKec=;
        b=lBUgQ/kL2F4JFtJlmK9ZD0FFbXkUF4YQ/AHzz8ySF4gpz/x+LrN4JV4YnHxLV6H7bQ
         +ah9C13Ni/w5TvT/HbiJs5pZTgyo6RKgQsXtSOJgLtETPu2eZdCxXSE5Gj4KlHyH1DHI
         YgKeBIk+YgaQnGaaay19VEh2vX12LE/XQsJOzYtvLbRE90FP7jdfNhOqFe3TdUPEYZ84
         BZSWX1q9fesLmxZELOZkxzKCxiT/V2j4RYVQagGS816IfeL4yK7ls82X89tSVwlcEOmY
         lv+senThym5PzAvNQtFmVuvpwHNf1/ybJSDQykVXEUsHPLsF31Y7i3XH3VtV5i1KwGm7
         56Tg==
X-Forwarded-Encrypted: i=1; AKwUvBz0CFyGZoerC0N8YGmTDXkXBn4Rby/0ZpfcyyxbSRqQmCWOESs38DSewAxUVIdJLPd9Js2bT8PB3/NBkec=@vger.kernel.org
X-Gm-Message-State: AFuF++nA4R9hA/hIdSD1WLoUd9cUQfkoJxQJZvbCWX0YNDBH2JXS04Vk
	drkt0bfWOwirZRiM+4Cwn5vhxKuCVsAlSclmhlrSIs+8+OcTY3UxGtdCL9ua7URlhgkRaTYi7fA
	dzS9SY36tVw==
X-Gm-Gg: AYBFou1Vk05Ocj38UTLzWOxlIeb2wziA+zzpYyVKn3qla+gkQBXuF6eAH2IpNi1TWiK
	B5pMzKBRQofmH2tYNiytAxnE9NNVeVmoIO6afoWfVftlQGWDVSxYv045AEAic6d2z3Hyu2UADx2
	yz0QwsFQGXc9jXDdT8p6HdXrs0zblH6DPO5bi+2jkhsTtxZWFNgT8+G9rQkE/1oEOZZnCJxjsAf
	VtfPrKmfVCa0nFaWOY6NsRMIX3+uiX/dR9Gqfiuyc96pbb1f4dS/kZ1eWos6ZIkynyE4KucSZnA
	XnqkNPEarqBFTIaTCsyiwwtNQbVW726rCKP2PDK7RKc+dZoXVEaix0/vG6hFfGDsFJyg3MW5VuG
	1TPBWghwQdoWAv1YtmEZ6corfKXaGPTmu5Eipq2o0lU+fZZb6mVEtfd7oHV7vCRf2973KG08xhq
	dxiPTv1C+M2veitXEtEsk6AmFNq0PUsJ+TFASlSfX4gCIebLByu0O9QU0rPYtu8MgyL66+CVcI0
	SOl5QYhmYqjEgM=
X-Received: by 2002:a05:6000:2589:b0:484:36c8:ffb9 with SMTP id ffacd0b85a97d-48488ded10dmr21114530f8f.4.1788423566735;
        Thu, 03 Sep 2026 01:19:26 -0700 (PDT)
Received: from localhost.localdomain ([105.184.8.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm12348292f8f.7.2026.09.03.01.19.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 01:19:26 -0700 (PDT)
From: github@singe.za.net
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dominic White <github@singe.za.net>
Subject: [PATCH] wifi: cfg80211: allow zero HE OBSS PD offsets
Date: Thu,  3 Sep 2026 10:18:04 +0200
Message-ID: <20260903081804.96532-1-github@singe.za.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dominic White <github@singe.za.net>

IEEE Std 802.11 permits the OBSS PD offset fields in the Spatial Reuse
Parameter Set element to have a value of zero. (IEEE Std 802.11-2024,
26.10.2.4)

The standard specifies the offsets as unsigned values added to -82 dBm,
with field presence signalled independently. The valid offset range is
therefore 0..20.

nl80211 currently rejects zero for all three HE OBSS PD offset
attributes during nested netlink policy validation, before the values
reach cfg80211 or the driver. Allow zero while retaining the upper bound
and the existing minimum/maximum relationship validation.

Fixes: 796e90f42b7e ("cfg80211: add support for parsing OBBS_PD attributes")
Signed-off-by: Dominic White <github@singe.za.net>
---
 net/wireless/nl80211.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 44f2bad08..57251cff9 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -529,11 +529,11 @@ nl80211_pmsr_attr_policy[NL80211_PMSR_ATTR_MAX + 1] = {
 static const struct nla_policy
 he_obss_pd_policy[NL80211_HE_OBSS_PD_ATTR_MAX + 1] = {
 	[NL80211_HE_OBSS_PD_ATTR_MIN_OFFSET] =
-		NLA_POLICY_RANGE(NLA_U8, 1, 20),
+		NLA_POLICY_RANGE(NLA_U8, 0, 20),
 	[NL80211_HE_OBSS_PD_ATTR_MAX_OFFSET] =
-		NLA_POLICY_RANGE(NLA_U8, 1, 20),
+		NLA_POLICY_RANGE(NLA_U8, 0, 20),
 	[NL80211_HE_OBSS_PD_ATTR_NON_SRG_MAX_OFFSET] =
-		NLA_POLICY_RANGE(NLA_U8, 1, 20),
+		NLA_POLICY_RANGE(NLA_U8, 0, 20),
 	[NL80211_HE_OBSS_PD_ATTR_BSS_COLOR_BITMAP] =
 		NLA_POLICY_EXACT_LEN(8),
 	[NL80211_HE_OBSS_PD_ATTR_PARTIAL_BSSID_BITMAP] =

base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.50.1 (Apple Git-155)

