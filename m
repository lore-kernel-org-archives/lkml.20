Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269117;
	b=2qdn1fCAZMjOVHbvv2QvmQbLAuml5WZGey3JKYCrW82hzP9pd8PModAzcILZS7YtSeFw
	 +yGChNh6o0xYlEjfGZPwy7JO35fpywZJKcyj3AeCfdILW/XVISX0PFmvUd7azpPNTcnCo
	 vL2AMuJcaDa08cKTlg0jC5P1rjTPNvXNROCes4gyoljoqCfd30w/EyVSSKN6I+8otd+QB
	 nQvFngQHREeJu3pHIDfXANz1UbHRv5gnq3l0RXCY5O0NFTvToId4tf82grqT33aPuPlBs
	 tYaI3qxSAuRrt99CMuTQ/zjLzRlhcQszfiUj0CmbRwvvHtZHWzupj8NqmaC7dZirgOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
	b=i9TrGsHfYc+oakCZXTOPfC3uYpNQgGEmhinj2iMzha6UVYLP4yZKOf2LkMMbZ0YbN4jU
	 pJemHFKc7cDjhz/BkLx1WghrkhR0MPgbZn+BDs3ugWwvhBhKI5Y3johXN+x0+g5PTHcMo
	 15P6N56+xjn0c6B+rmNzu3oQyV/Eyutt2mO6gDZcjZcwaTv4o669n+EYC3J3b10HmEt8f
	 VhGTqredvmqUsqCcRwIWLZ7JdIABAaBA5QQQAKWv0sbNv8wrLuEoO2JjGYoJ/GN7rn+f6
	 SYRZ9WSLdIZSxZ+YSLeio4gH91YjgT98N/LzY/rDsP4yFy8Kt3UUkxm2PaR+cpeeUhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOlnLdAP;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127C0606A335
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127C0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOlnLdAP
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso888116a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269115; x=1793873915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
        b=UOlnLdAPcICJBfP/9Va6/jpahl0YLUlGB25a5b+vGFo2rlehMmjBOConnFRizUDvje
         sIHK/vzuUP/6taFgPjBKbha2W3ZcDVzJYI1Xfh+XEuTHjh4Jo+7LM0Piy3MVZkQ2VuMI
         Ro/8/QTXk/pgxbzZ529bbI49pwSqzfh/e3pGzOcsCmJ3eVFz4Rgkxc1YeXEVJjtIw7pw
         QgK+m+E1EyOB13fz5kKDEZamDRZCOf/g+k1ryYnsPY5CPJBiD7k/CMQ31PObr3pNff7e
         ui3ihV7DNRHyGw9zWi9Wd66xKa0jw0Kb4zrCqQH9YPN6AAr2oncJTnHcxJ/Rot37Hl/q
         V+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269115; x=1793873915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLSIccFHorX+6O5ooGIFQ+bO/vHG9UJYFlcd1fhhBi4=;
        b=SLIxEkUR3o+njVZOQ1IovqMNnUfe23HjjvtyhAzIf/VqtMCANzWaPAAmJ0t9Cd2Bjg
         pKGUtxK9XRZ6zn/lPcy12i4W3OQVsE5bznCsrJPPRERd5o0b86v8C97F6mKS4habYF2+
         Hi9zYdfHsnGCBmR76iHHPGC3AhRCnFatXXg7k6vHi9qiy/eHOscymI4L3Zategnrt6D0
         4HXh0bayZ1rg+2KZZgx8n74Y/4+ZqWo24Kds+QVDm5HFjGphIPeYoEKmmKAMuK7PTvMC
         9lhAG4smTfqYLNAYVI+14iiDqnKSSg0YjY1mR0c2g+fM25tlyn8hjLuaj+qPCAg5g8IC
         vJYw==
X-Forwarded-Encrypted: i=1; AKwUvBzKxPhvCOMUzNS4SUgPHHY4slkxCe4gxVagLPzG7cT+U9Cl543iDLMQf04JJas/+gGCeffeSaXwHaZ9LeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtrbv0iFA9q4Pn1RqS5anVwX1SMdWuqZmkB/Kp8EgPwZNSGRWT
	kw+TPcqaiVylOx5aMBXOf/vV8tgv4lmXNpuIZltgcoSuEFsv7khhI36G
X-Gm-Gg: AYBFou2/6YyvkUSwwgpEabKvuh8Kydjd4PzLwiP9NrFRlzFp/COSPbsLAI7ECP2yga9
	knGmMBbAmzdyYAUAo883NQ8ZRVnOSv1Mvi2ENm5zvDY82HCSd0bjL399VMB9MR0uQU+AwE4i3eB
	cXIviJe6TaxDwvXzIlZ2RKeyHIF2Do6QQCBtIldAmkcsnYKL4v3O8ILnoGOxGF8tWlKeTmvUG4g
	jo+BtDj+k/x4bPe2lS4UiFU7Dv2LUi7z+YtkezInuaP+ik+iwqnwEcyFWDQN6w/emnhLInfkO4P
	HnSDrTAr36MgEgpDMXvf7rcmlTMHoxF0TJ/wBgrqjw4XHlW1c5KW9bpwrAIK5Bst59deikJmaIr
	M0rdb+rOWiVKYUTa6S69soHFd6vWW/LThmRkiipdSLAFL0SXjhRg4uLDqmHAUv8QUnwBy25Xugu
	G/qOHHxJa/omLah34KC+JAbKezSvAisWi1yPsPs5W+NstuDQEzGt2m3irhx+zv6ynO49M+UTk5M
	QrA+SleEHDctpzKYu9aCxveNBpg11assDyQh3AUCwmOBjM0feN23F51GMZtoQK9q+MMBrYRcMLO
	zIPR3VGSyYlXhi5V/nqeJVBXUHDfmAzxkWqaE9+DprfiRZZWWU3mIQfq85ETxjM=
X-Received: by 2002:a17:907:80e:b0:c2e:62af:b6fe with SMTP id a640c23a62f3a-c49d11324e8mr178671366b.8.1793269115238;
        Thu, 29 Oct 2026 03:18:35 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:34 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
Date: Thu, 29 Oct 2026 11:18:25 +0100
Message-ID: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
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

Use the helper instead of open coding the check, so enhanced framing is
used for all DPCD r1.2+ sinks as the spec requires.

The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
the other drivers do. That is 15 bytes, it fits in one AUX transfer.

Compile tested only.

Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8d0626ddf..0973598c7 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -262,7 +262,7 @@ struct cdv_intel_dp {
 	uint32_t color_range;
 	uint8_t link_bw;
 	uint8_t lane_count;
-	uint8_t dpcd[4];
+	uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
 	struct gma_encoder *encoder;
 	struct i2c_adapter adapter;
 	struct i2c_algo_dp_aux_data algo;
@@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode
 	intel_dp->link_configuration[0] = intel_dp->link_bw;
 	intel_dp->link_configuration[1] = intel_dp->lane_count;
 
-	/*
-	 * Check for DPCD version > 1.1 and enhanced framing support
-	 */
-	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
-	    (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) {
+	if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
 		intel_dp->link_configuration[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 		intel_dp->DP |= DP_ENHANCED_FRAMING;
 	}
-- 
2.50.1 (Apple Git-155)

