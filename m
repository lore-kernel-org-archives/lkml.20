Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE341D62D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651861; cv=none; b=UNJuzLt04gCA1Ik372T7D0sQgKt62PHKJT5FT87YGIm9nF89q5MxfnBkehrC8ie5N2kAa//zA7cLsqKoEDnKcGJnY9IdvsVL1bzKoKsJQBayIIQis6jhP+pqr1rqtoaU+7e6Zx8erJRve+F2943lluaRugBe0otJkPkR8nhsVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651861; c=relaxed/simple;
	bh=LHHCtf0dNurf9idze4IY9jf7pEvLps72QXqveJnsnYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2HOQAl4fGPY9TB7OmuoPsidx6g4LDQ/U4Ybl18KTz3LPNUXszugtUlYo/lddd+LXOOWzvnaYfY2SBL9fPRXBEQoXQfLcsnf0BaKdV6aN2a8iCsgddZLW1hhCL69zXM10Ks02J8zPy4Zbv5rpD4oyB7EVE/SBLCpxb7b89wffAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=CoqhZOxO; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="CoqhZOxO"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so2133467c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651853; x=1791256653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsP2Z39yDHYgidPq7LJCuoklm/2VErUU9c6HnTD+Pa0=;
        b=CoqhZOxOVl+tRaN0GR4kieFz8maMrHQOSv+rWNdItAU0XQHzbAXDbhHrvVziKyFgj5
         TQhKbP3jlFxWXx1klqBFTk/NQl85a31cdpAX8I+rE0gx7zq5wcsGAoSUqwodqnGMaWNm
         04e9i5jQptuROrTB7c+Xpi+vNJB5v6oSIudldeD2+79dzMkPgSMckoXB3egGysvE7K5d
         0C/F9fjUFqJEcG451ek37PIwrshZuBEbYJV5a9yBBNys/91yEZc7X8Wy1+777o5x3OBQ
         2Dzihp2gxq5S/qqjWwjLsGpXhe5KpiFsCakDkXJqKlRbP2KVpnq2jNOgSoCjsaA2vvz0
         AtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651853; x=1791256653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsP2Z39yDHYgidPq7LJCuoklm/2VErUU9c6HnTD+Pa0=;
        b=RSBSa9m1EnE/an/rfLu5mBGcuLHz5ur7/kjaS3LMUWkVkA+Wvx/5a3fqj0hzXOEDxm
         rwqrHsOd6oehBmmJXbucq4+kVcga2tc/uMQO6cA76QlHjrY9/W9SH4Alk44KINusGaAf
         n0ZPNirK4H3gK9wZ7jf/4KjY07dgz/DeyPIrxoW3ML2SYfJGe2mfulU81+XZkkpjgvWX
         LedFDHytj5BGX+BzvzHuGfYeAsRWGQiiC41XZyH4BhuJdHrjBNCRztAriL9ikYRl0K+m
         Giwah8f9DpqJi/sO8Sar4+hgWcD3LRua5StQrxnnTwWVvcy1ftyUSl4KVucIo8zaIRWu
         tuTw==
X-Forwarded-Encrypted: i=1; AKwUvBxqyabSz8AVh+JAtGXZ9opj7rCJYxRpjMTTIWQqjiWRueiIuvyqgoGNAIPdzvQhQhkKwaksndBqqWld9PE=@vger.kernel.org
X-Gm-Message-State: AFuF++n7Z+CByz9XEKAGLdLslZdmEhv6ODGoqjeGVBZXsxta9g2pdq6S
	5nfyBlhX/zOxPEbXWG+7Eiu6g0C3JEkMHIeZo0JNB5Bb1plXUzJSsBHC75at7GWlXLw=
X-Gm-Gg: AYBFou1Eg0Rbu5X8iR/9t8+dhE25nYxAIEYH74uZdMZcJR+NNCpZuknK1piG1YAZfxC
	Aqosg1pw2xEA8PXXn8xmPtWFp1YlCECdpS+ke+B78UUDm0CRwsj6DUjQ6uq/GzN7BWaOrlSqPSQ
	78ItDnurDyFEomf7ceEHsCf2wkLBGCYlbugx3pN4WlxUgN+JwVZrgJhVZHriYEk2v3VRA7RZoh9
	yrSHpztTWAnXxGItRfVze8pzCr8/ihrZsCuV80StncdNmjp0P7L5cphbQau+tcYoQ63CzkMZPyV
	+UqFmtRK3A8Vc4eAcZivSoIDxJDRPZBKjebDbeSekV2WZeY1DusLnXmjtCdXfTZwSeh3csvmz5o
	Vb+Rs0Tl38ktgTyV7ulMHJXjl3K7lAhjD57TqIYTqrQeqXifZkcJleZWyHWvAgkbaL9PgjpmMsu
	AwLtzSDPxnDW9Nl7/LeMpFf9xfcZp9ztgKl++P8wkK+P/ruoGy7k0SDzfQeJG11ONqSanpj+Wwn
	RpjNRdb+FdI+SsJlu+b3g072n/MleW/GT4fiRk/wIwFj1ezb8A/U+ZuA26H+73HAPz7nB77iu9d
	xnL6Yg==
X-Received: by 2002:a05:701b:21c7:b0:143:46a6:b01f with SMTP id a92af1059eb24-146cfec8e21mr13180519c88.31.1790651852851;
        Mon, 28 Sep 2026 20:17:32 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm31321186c88.13.2026.09.28.20.17.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:17:32 -0700 (PDT)
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
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 6.6.y] drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
Date: Mon, 28 Sep 2026 23:17:26 -0400
Message-ID: <20260929031728.88004-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit 31b42af516afa1e184d1a9f9dd4096c54044269a ]

Sometimes during hotplug scenario or suspend/resume scenario encoder is
not always initialized when intel_hdcp_get_capability add
a check to avoid kernel null pointer dereference.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-2-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-53051. It rejects the HDCP capability query
when hotplug or resume left the encoder unset.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The code change is identical to upstream.

Could you please queue it for 6.6.y?

CVE: CVE-2024-53051
Upstream: 31b42af516afa1e184d1a9f9dd4096c54044269a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f377c4484e1857..f7987fb90bb1ac 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -142,11 +142,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 /* Is HDCP1.4 capable on Platform and Sink */
 bool intel_hdcp_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
 	bool capable = false;
 	u8 bksv[5];
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	if (!shim)
 		return capable;
 
-- 
2.39.5

