Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB834D915
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730225; cv=none; b=oLkt0Qw2zmop3gGQG/Mii72R0qrscElFlX+p1bBXB2z9gs6/ddnKQTopEXZ5OXJJJ7N2/LTIiCaUX5STbXyVkpXeZoLPP6y6BZlL2KBBIARNGwFY1bRy/bjNexARSc6EzTeNZir8Snw4pfB0PzooxrzPACIFKMbok7VUv4RV3bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730225; c=relaxed/simple;
	bh=ouiBEWCppQpfMCPF+WHPpje4212PjHDS9dbw4C/lhfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUeIEAhPqTaPrmq8cwO6Cu30kml1rPW+vzJtq48GjB0aYPXBaE/3YAF64T+oEbyhTjCPRk+CSCNEa+OihCkLUDSTYnuVRIuy9M13ZnIqFZS2iEDEVS5YuS59fyU8rpDIPfwDyBq7TH00AXfplKrVUFPSn5OUO/wJPYJOdfm6+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=OJjYGquR; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="OJjYGquR"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7334459eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790730222; x=1791335022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqnoWOKNgk3yU/myXUZ7ovtM9FCChQAXvuNXrnvE3KI=;
        b=OJjYGquRzuVurQmpAz6A+uFigznrtN/x8NZ/pvXYq3RmUDthQeS1NqTmbY+Gzs2QLp
         boNunnawwZYM0874MDJQdL7uwlvN2fZwpirnNEOiAaxiCYs2grIjC92IFR3m0Y8j4/Yw
         UAxvxec9rt9BVj2fq5qJUovTRz9t5d1FKHjFFUtwL5W9us2F1QPi8Nu69YRIP1BNHqQs
         bShPtNAMqguWEkUQnJVSbOT51Hzrk9zygF81SpgkOyxWYsb2FlnglCOYy8MuUkSSzQAd
         koMCeOTUgY8VLxeq0qjJV468PLMAxoUu5BB5i6HL1HgMK2FW3E/G48FjNKpfPrjs+QpR
         pkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730222; x=1791335022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqnoWOKNgk3yU/myXUZ7ovtM9FCChQAXvuNXrnvE3KI=;
        b=Xd9bUZj4ucZWRCv69y6PUBYcBh4NXUTevI62VME+rBQdjGZHrFYX/SeSRXZTN9P1le
         h4AYtCWQiRT35+9+bssmne6iJXPKQ23U13YsbQ3gdA/yIK2vZMDbg/3LA8iWf95pQxip
         6BJozTGzCE4P9h7o7S9ivOItTJM+qmKCr3TFBzSn5bhfU1tpOsk1EsVWxg7ISXRearXt
         5DJtRKQp/T/p/qE6rKIdvj6oFLVs8OaluBw9AfabvVD+wEa1Ww46waCTg+d0kQJmwq9o
         v54DcBHPTX4QlZPZRC4INod+RPwxkBEtaJwwXrcUcVJhL8DEXrljdzt/ZogodUG9wRcx
         Kdjw==
X-Forwarded-Encrypted: i=1; AKwUvBybDtRMqaiAOgOHAedUUfmTRBTWAl06YtvJ8/KKbJ46juXU451Njv5yNT5ifSolCYOVyJivzHlgEb9xe0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHfTAFhMIbCqAjGpe7Q+8JWPRHicN7+n03YZgvxM0pq5gXNzcp
	zDIDCri97qK7F90zY4LrOiabUGlycf2qbwu9U5QBYsmw/tKYKU50mllcbPutzu2iPME=
X-Gm-Gg: AYBFou0gAvU7o9ixoQAeT4mINEZCZpH7kwzUv1R5FSePXMKL3PjvaokFOxTvRiRtt+n
	LZBNZFZhkFB8IYZzB178hWVJZ1huUCj/kCEgtsvxNvh8np0S7qwl0TvUDz4bRF4aeW8pwD6wcHL
	PHuZ6Lye4fWDlcSzS4rqdF/EG5sbIxtPAgmAdTvyjvoBHkF2R5/lNgcWzCqGSKvrCdGo4ddELzL
	m10ZHrsMaA3KG+RS/OWqWhlIBJJ6UW5zmaKxfnXlzawmIU153zJlwlpdRDKQZ861oPdFxYOpjeT
	NpwkRp6UW4EcUKkpMhuXoOf2ZgZS3dURjmFYciOgvUg2+5iSxKv8gniiNdlVwfY4QEkexma+ZeA
	Z2mutZeYchPJo5GOpZN3Mc5NGXO0lP7xC5QEY1lIOxzjXkJmjG6iwOKNwZ7mqDsus7aKsRJMrgX
	l8UI1WcN47gQHnSYvgxr3uwwDeSTcQOHhgoK4YmaoVKq2fGEwyBSlNVuhg9RNFdpaV00Gm+BFso
	H8edfVCpNOjHK8lHoofvx+fjrcs7YPo4YvR7RMIFePaCPIl0Kce28o5NdRsfh/LA8XZVjwQVzrQ
	iJn+Lg==
X-Received: by 2002:a05:7301:a24:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-34c66c0725bmr997520eec.16.1790730221429;
        Tue, 29 Sep 2026 18:03:41 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 18:03:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 2/2] drm/i915/hdcp: Add encoder check in hdcp2_get_capability
Date: Tue, 29 Sep 2026 21:03:21 -0400
Message-ID: <20260930010323.93999-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930010323.93999-1-artem@trailofbits.com>
References: <20260930010323.93999-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit d34f4f058edf1235c103ca9c921dc54820d14d40 ]

Add encoder check in intel_hdcp2_get_capability to avoid
null pointer error.

[ Backport to 6.6.y: this tree predates the later intel_connector
  conversion, so the unsafe intel_attached_dig_port() call is still in
  intel_hdcp2_capable() rather than the DP and HDMI shims.
  Put the same encoder guard before that common dereference and return
  false through the bool API when no encoder is attached. ]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-3-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
CVE: CVE-2024-53050
Upstream: d34f4f058edf1235c103ca9c921dc54820d14d40
Backport: guard the common 6.6.y bool helper because the later DP/HDMI
split is not present in this tree.
Review: https://lore.kernel.org/r/2026-09-29-daily-reply-0012-re-i915-hdcp-encoder-check-v2-6-6@kernel.org

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f7987fb90bb1..89e378f71d67 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -168,11 +168,16 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 /* Is HDCP2.2 capable on Platform and Sink */
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	bool capable = false;
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	/* I915 support for HDCP2.2 */
 	if (!hdcp->hdcp2_supported)
 		return false;
-- 
2.39.5
