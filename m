Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269156;
	b=b//lGOWZRm0iWg5H3VIXZjO687jG/XgNf+/iJvdx3nfGrBoj4x/zXy66a6YurTGNCMDj
	 5HfROiv2KXqXSw1BLgwy1Iy05X8oiHgOaYgclp+MYou8NG4j3UuhsDBf1vj5Of+Z6Um5J
	 UM54g027C37HRnqB3jYmFbU8zzNRzge2JqbdcqCbD0T1hqRtSMGJyUiJYVYGhW8HwMuyB
	 gavDD783vkqzI6rgFcdgB/3aBWKqyfGMskMFMzZ7CgTacJoN4/XWowSpPLbaR9m7jw/UM
	 KRMIOn0BmpAX1IOwFjsLb9OcJ5i143UOoy1z/1Wh/hJWE/1U6k3NPet0UZE9L9O9N6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269156;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6LCAQEBPZJx8JZSEy214RQoDXw+6FRsYGwEN0a3YsIc=;
	b=jrgBc/IrRzT4yuJ/0NQEa7L3VjvWKbQulKNSSdzdZxP44s1d/VsCa3yXu2UAgJrfkchX
	 NbNjUBdFfOlolRt8gXHX4EkukmgGd5324sZpw3K2c8JWUmguLmvrf8E9nB1YSQIWZlffV
	 AVRni+t4yoPxGC6GbjzbRY3qQ2gNW5h6mMphis+uZ96rusSIrj67o76M4v2AlvkW4I0NA
	 17uHw3QGBygrFdJXd5q5U5IKCY0hu/7xYBz9OMpMTbvBIjYE7yWruVzmcuiQi0kl3sp3e
	 tZdFjYWSnzF+EFPC+ouJ7/POy+bIiwoFNXLTWJI4Cli05RS4MAKsYqs7OulPgybsX4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DNRMNkyk;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277BA606A32D;
	Thu, 29 Oct 2026 10:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277BA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DNRMNkyk
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC243C22;
	Thu, 29 Oct 2026 11:16:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269019;
	bh=KBtlOAOFYJM1PRfZCgbJiAuSbTP1DfY5ZemL9rRN+5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DNRMNkykF6fjjsLioGOMEwAdBA3gHRimDByzK+7TB6t4Ndd7ORUkNrMSV0Jh6V4AP
	 KiYUj08X2fb0up55sxL49AKY/40loj9ZohhluLHDTadYnUysCDGTwzbzpxbmFz++FW
	 v88AM7W6XNvcYN8OOUDVje7+woUWoVg6p2jQlofs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:50 +0200
Subject: [PATCH v4 04/14] drm/tidss: Drop the tied off video port check
 from mode validation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-beagley-ai-display-v4-4-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KBtlOAOFYJM1PRfZCgbJiAuSbTP1DfY5ZemL9rRN+5M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2WJ3f5PtYgPGQjINcFNhfcLRDv9Y9wkNfDk
 raEBSXv3oiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlgAKCRD6PaqMvJYe
 9XBkD/9HAxVjBiLH8Gn7K5nseLyKL+qMTPW5zFvL0i+XUNwXCm2GiHrrx0Qg1IVlGVZwVbN+Tx8
 E9t73PbHlp2DZP2XRgR0/q7cSjqBFuGFF//1SoaGENwUKnJbm0pt7YUvmnOYwnPRupxAa6lnxGd
 o7s/nXR28apu4HRhWHFy22KwJCAIcpz2QoWuOSvBobfl5RKpG+frRNhNEiH6oDxJHArLEGlatgI
 KhZdUFj1TZtphmTQorPXsdH3mXwimABLeg24pP/P8zjkdBlHHdY4pm6xovfIFs6jHqtGD909kfb
 gsBDsnp+sS64g2oy3E38/+7VvCeATJwYiZYG8cO+3k9VeOI+gT4MYEf75A8PoSCsYF8GvaedR34
 mBBJosZccbb1SIVZd8OESVmOuRBOyfUKVDaxLRTq1H9aBMYxUm8q5mfMd6yQpQND1dRcX1Fh54p
 gbBc4eAzFuxif8W8PxyV9pAz9BRA18itb3x+SOVLBThEhHF2cFyI3G2QlZ7n0Ey4vV04yrAR68r
 X5EWdku/7xj/qvZaYdbz9k7KXAy+p+7nn076I5K6b11h/IvG1S6cL65S7Y3oCLXVxO0u+LTuXWE
 CNLxru/rPwgpZ4RmuOZmU7EeZ0dNaGvkCE3Trz+HFrvWNLefi0ibHuFwN6LLkiFtWAPtJje32+f
 rK9ACKQ3yM6PFKg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

dispc_vp_mode_valid() WARNs and rejects every mode on a video port that
is marked as DISPC_VP_TIED_OFF in the 'vp_bus_type' feat.

The check is redundant, as nothing in the DT will be connected to the
tied off VP, and thus the driver can never do a mode_valid call for it.

Remove the check, and rely on the DT to be correct.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index efdabf046d64..8c537280faf5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1342,12 +1342,6 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
-	enum dispc_vp_bus_type bus_type;
-
-	bus_type = dispc->feat->vp_bus_type[hw_videoport];
-
-	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
-		return MODE_BAD;
 
 	if (mode->hdisplay > 4096)
 		return MODE_BAD;

-- 
2.43.0

