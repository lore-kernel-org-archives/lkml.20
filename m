Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBC187346
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791436642; cv=pass; b=X+VSecaHUCO8YRxQNcr2mcZ6s3uRhGJ3BcROGfAIXvziJPulGrRiJebohBXqgcfRl/jcOlPIMoZat7ZilCkQ6hz6eJr4mnr6bSJpYgEKVzoymU38Hd7kK2wjD3/Kj/BQUNJ9GwB5SLafiH7ExKtAIpO7E4yauiatUM5dUetQ63w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791436642; c=relaxed/simple;
	bh=zdCGsDGcxUU273IBciKovFJSUzj1TaY1zOt7n0r/0Jo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RPMhwaqwgm20mqam3FU+WDFgeQwYdCzMg7qg7WNggqQCWvTqxVBFQCZkmTE+In7hsNwTWsnhTdPKGdxln2V2aA2MpIvQr8ROTW3j6OoKruJDNWez0ltQCrZKIXehIK3XQvRgRZOUHDK1/mLGdmDfC4WauiO0nnkcmII4VPrlFAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNKL1j1A; arc=pass smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNKL1j1A"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e61817b178so3378375ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791436641; cv=none;
        d=google.com; s=arc-20260327;
        b=ixqCjEZ+zGm7UFHafEIqjLSJru2FIWvp8JeRLmVFSbfwsBvUX0lrXIkr0y6f8kQwHD
         RM6F+6b0OT1zBCAD9HpieRoz6rrP2aixUSY7HRzsq25+mmPsaZJHPuHwkHLd8tlfPO3O
         CO3ZvqDa3EIDBkDUQ86QJ2Oykq6I3KOZOfmeqreIGh3oP1NNnDBH0wSPXx1SfGpmFhNP
         1gcNHT1Sh0dR/a6oepxqukZEoQo9jviqZZrgGSAVYwttfsTheWy9J+Cobg9aIjr6G0vc
         PME/+B2pfr2ncr54CV5CfMdCUoJ0sAHnCwscOIwlLbad1ut3W5hQW+XK72rmicY44iR6
         NO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nZxCaIo9txwzpM9hHuP2f8v3rOWm8pOzF15AOYuWLXs=;
        fh=LZ4gDYhpA3FpFZnt565kXAaNd5qNUIb4FI2yniyjjlM=;
        b=ZIy/RYeBL61zlmbnNOnyRJYHsA9n7vCzskRrkMVSArZ4g9c6Ily6H6nYuLVIL5W/B8
         RQxBV0k63BgEMc1mBE04LqZOiaJvosLG27dWd0V7y9iz+kwRCsybX/Jg7D8OxtPTtQhZ
         YtvxmQKHMOcrrf/heSGdI9jl/0rp3GSmyRkEoUaFv9QbPuyFjiNNEY7KOWeMJV8mhLdP
         yMMNIgJ52vF4Xw8QdhPh7FTcIlR5KTHRMfXwqzBFcX/tqUvu4+gQzSCm+7aDgjjb5EnR
         1owzYbRKV0VIfw1CLHP/JA73OJ2ZQi5Y52vYqEzGqXw5PbDk68nLvEsGEE2bzI4yoZtm
         f0YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791436641; x=1792041441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nZxCaIo9txwzpM9hHuP2f8v3rOWm8pOzF15AOYuWLXs=;
        b=UNKL1j1AQFlEGoE4ns7NeArd3WAbmsnG9fRdtwtE4L6w2Bur6z/anBTqwM17+cl+4M
         TK7pvadOo2SsOP9XYrmRdDbtFZuidad+fA78tqqHgc69HFshS4vjJodHyiAB+yy73i4b
         +0Huc3LYOVGRlywdz+MfhaQ2nsmEgEAtFrsxi0WN4arGrFaZzmZw1/n25/gw61+LBnd/
         1ZUHh6V20qGTWb5JgJsCs6kVGgVD/ew/nswG2ArQZZwOJlKubcI3fvYbZbRwUlv/xPdL
         paX58RG4AbnpD3awIVe2cQW3ldpm1mJdj2ds0xbdm0RiTz4lrU3c7A7wVhv4IrHife2f
         xtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791436641; x=1792041441;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nZxCaIo9txwzpM9hHuP2f8v3rOWm8pOzF15AOYuWLXs=;
        b=xnZi5WCN1iqefZjpUzpQKBs9hge/I1R8jElEtpG2IhR/1V7XEP2w+YvYZMRn6wtcvR
         oOqG3D5gZRcU26QWaB4pLAkmtmc5zGF3/+q53MCsZhstlyH0O4p1NoVMl3CvYxnatcMI
         zSV0GaynebdxpZRIs1U8ihEgvPd0KUYJmqFLA4G0qJ3W4VAiiQ8cVRbF9l2VBK98x8xB
         g1kRFH/LQjFJVY82ah4/lUMj4kvvNITsPCK/Chns9AfbrN0odZiCydPolrHNpEtPhZEy
         MPgUsofgArECwcjKL7uWu+LzADtoh3wqvE4yiGP4M1q55ntzPoz1adlsfHiGBq40Gz6o
         hgHQ==
X-Forwarded-Encrypted: i=1; AKwUvByACRYpWkj2yEWyGRzXglffJNsSeeemT8GFmCc407pGbsF0xndtVD7dVAgZCwX+17KE+C/V/wsKfUs8teQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n4DsrOg75pBThsGZHaR2DVRbEkzflfgrlpNWJ+p+aER1tEzICK
	NrdphkEc/fIe4vO+TYS0E0/9ap1h/4OjgyPZhoYiyEiPr4Gzhogy6fpftG2fCfzqd0mRmRzIkGl
	2xdfynpk/BuP6w67fSREDzvRo4K9Q7eprYbz6N/HHC5Qr6Rg=
X-Gm-Gg: AYBFou2UtyZAUt28Ei1e5z+4wcUY6M6/l1bIE5C+KQo1zELqIJxLINtlsvmvSvde7yx
	6rXjBzjaE6QparJ1QiEoEcFszIJOtsmQpRqCus05lF6+GzFhgx7roSQhDnovmJrswsDyKi5wNHS
	voqCDH1mP9iCJCXn7+rV96y+IiKUwKIquiKLg14yZ6eYjxeJLnkYpY/bDi6aV2U3VkFPnLhiQWN
	XLOZFRSh9lnTare7E6i1sxdgqtaHGJsX8EY5SPSo4+++GeYUEOrFCg2b1/H9sgf8rmBMrwA27o4
	5B3fI9L+fvzm7q66L9FDh09BY5AFLNKV6u7ZoepJw2SFwcnrwTSZOw==
X-Received: by 2002:a05:6a20:ecc7:20b0:3e1:4541:899b with SMTP id
 adf61e73a8af0-3e145418a8fmr1385001637.41.1791436641046; Wed, 07 Oct 2026
 22:17:21 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 22:17:20 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 22:17:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yibiao Li <biaobiao2233@gmail.com>
Date: Wed, 7 Oct 2026 22:17:20 -0700
X-Gm-Features: AclHuK9UcY5R91xpt04gOFDaB136BcNqqe9341-E5szYJoMqgQSodHyBmZUxnAI
Message-ID: <CAG1agfwtnjmb8RVLmZvY9W-zrR1onhK6urJA3Lqai82tAXn2Cg@mail.gmail.com>
Subject: [PATCH] drm/amd/display: Use separate iterator for preferred mode lookup
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Yibiao Li <biaobiao2233@gmail.com>

create_stream_for_sink() uses preferred_mode both as the list iterator
and as the selected mode. This triggers a false positive from
scripts/coccinelle/iterators/use_after_iter.cocci: native_mode_found
already ensures that an exhausted iterator is replaced before use.

Use a separate iterator and assign preferred_mode only when a preferred
entry is found. This keeps the selected mode separate from the iterator
state and makes native_mode_found unnecessary. Preserve the fallback to
the first entry, or NULL when the list is empty.

No functional change intended.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202609190901.yKTzhsGz-lkp@intel.com/
Assisted-by: LLM coccinelle
Signed-off-by: Yibiao Li <biaobiao2233@gmail.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index d386bb1475..ceea8fe481 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -1453,12 +1453,12 @@ create_stream_for_sink(struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 	struct amdgpu_dm_connector *aconnector = NULL;
 	struct drm_display_mode *preferred_mode = NULL;
+	struct drm_display_mode *connector_mode;
 	const struct drm_connector_state *con_state = &dm_state->base;
 	struct dc_stream_state *stream = NULL;
 	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
-	bool native_mode_found = false;
 	bool recalculate_timing = false;
 	bool scale = dm_state->scaling != RMX_OFF;
 	int mode_refresh;
@@ -1509,14 +1509,14 @@ create_stream_for_sink(struct drm_connector *connector,
 	stream->timing.flags.LTE_340MCSC_SCRAMBLE =
 		connector->display_info.hdmi.scdc.scrambling.low_rates;

-	list_for_each_entry(preferred_mode, &connector->modes, head) {
+	list_for_each_entry(connector_mode, &connector->modes, head) {
 		/* Search for preferred mode */
-		if (preferred_mode->type & DRM_MODE_TYPE_PREFERRED) {
-			native_mode_found = true;
+		if (connector_mode->type & DRM_MODE_TYPE_PREFERRED) {
+			preferred_mode = connector_mode;
 			break;
 		}
 	}
-	if (!native_mode_found)
+	if (!preferred_mode)
 		preferred_mode = list_first_entry_or_null(
 				&connector->modes,
 				struct drm_display_mode,
-- 
2.43.0
