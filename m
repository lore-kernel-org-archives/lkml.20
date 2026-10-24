Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859638;
	b=uTXVX7SW0MYKdQBirkCWaeVh5JFwATzxurrQlHO1PQZpCdii0sfZ88oKcMYtA0c/JbRg
	 z6sHUKlXWfjIGY+4RRKRSu2bXjEKmN39YgHTVA2ikgBrF4FC5oARK5z4prcPbn+0XC7Tw
	 TZFuWs2UEFXxxppNr0cHfHVfK9eY3NX1S6OUgjgxJDZ5ySGXZHR9Yds7L6i9qMDM0GjXR
	 QLxK8IAIV40NmdvkWjkffDGIZdLtDtJcawOOctOzGXAn/dStnu1Co6xLR0xNNMYv9ILa+
	 Zvlp1kjWDDG/Gx6ZpYr5DGiwIjRPGkZ012a2osKWtSEr0Iim9FDzlRWuzSZY6vx4cIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859638;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=A+smEMxRbdf3wqkFYq5ydoYj4fQO7s8hJFqE/+6d3PM=;
	b=WZUnhxT5+WHO9ivPnzWdNz12St/ZK/6ll9NQa5j9adgPWKVGzO7x0EHs0KiaShm9xMCN
	 Mjl3CEnpsCbv1aLKh8l+MCAoZiNCZw/fbd5nO0TqU0ULbx0YYi/cQhjn9mcz0pk0KPDNG
	 WtkvaGcJNj6dSwFsFaPax6jfKk2vr45kSn/Qp7tA1Ug5B5OENQPV32mvuAwWDWb4KYuPW
	 W7AHafAu/qMlhd+cNkIIVu+t0Da1uRfye3DrbKY6f4s1jNXUx/t1JPJL5W0OBZCgO9af2
	 RqInLumELHsBR1VOc35/i3/2WdsoArMJ0s15WxTuMRiNCNBf3IhECkJ6Cuv7zSwVjjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=CnfEMRbk;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F1606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A4F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=CnfEMRbk
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jBlnp0zlbzMl0B;
	Sat, 24 Oct 2026 18:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792859630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+smEMxRbdf3wqkFYq5ydoYj4fQO7s8hJFqE/+6d3PM=;
	b=CnfEMRbk82Tbp5ybgWKzKwguxXmY22sXjPvpisqCMEuWJr8LhIqgYOpjnTJGFvsnItfeaL
	VwCG99eGQQJFULpwoAm0NMaklMKXlnvMnKOzwNDTr83F6PabFUCmu6jXCbT8p4WmebiGjW
	dXFJWJO1sxOcK8WFiPPnVtZkkZyL44JmmO5dLoycazZaXZlhD3cxWg/eorpmBc/hibFfes
	UWH3v4eyBHimwqEp4vBgprVUS3b6COVBsPAUQqm9ppfpIMyQNQmQSVQCu2+EObxxahpck3
	W1Ek8KH0DLUA9ArXsGwNVeNhn1CSNgnBXNztIQEoBJfMKXwHQ4rpLlCadl4LuQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	"Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
Subject: [PATCH v2 0/2] drm/amd/display: Keep eDP native timing after resume with video=
Date: Sat, 24 Oct 2026 17:33:45 +0100
Message-ID: <20261024163347.2413649-1-hugo@hsal.es>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <74c73b6f-a6b3-4652-8da1-b5c46ae58809@amd.com>
References: <74c73b6f-a6b3-4652-8da1-b5c46ae58809@amd.com>
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
X-Rspamd-Queue-Id: 4jBlnp0zlbzMl0B

On a 3840x2400 eDP panel booted with video=eDP-1:1920x1200@60, an HDMI
hotplug followed by suspend/resume brings the panel back with the
1920x1200 mode as its raw timing. The image ends up squeezed into the
top-left corner. Photos, hardware details and the test loop are in
https://gitlab.freedesktop.org/drm/amd/-/issues/5983

The hotplug makes fbdev emulation reprobe every connector with its
framebuffer size as the limit, so connector->modes loses the 3840x2400
mode. On resume, create_stream_for_sink() finds no preferred mode in the
list and scales onto the first mode instead. Patch 1 falls back to a
mode of the native size if the list still has one, and otherwise to the
encoder's native_mode, which amdgpu_dm_get_native_mode() copies from the
preferred mode before the size limits apply. Patch 2 adds KUnit tests
for it

The fallback only applies to eDP and LVDS, where amdgpu turns scaling on
by itself. On other connectors the preferred mode can also be missing
because mode_valid rejected it, and then scaling onto the first valid
mode is right. From reading the code, other connectors take the same
path when userspace sets the scaling mode property after fbdev pruned
the list, but I haven't tried that, and this series doesn't change it

A fuller amdgpu fix would always drive eDP and LVDS at their native
size, not only when the preferred mode is missing. I kept this to a
fallback so it changes less, but I can respin it that way if you'd
prefer

I left out one other case, also because the fix is big. On eDP the probe
can drop every mode of the native size by itself, for example when
mode_valid rejects the native timing after link training settles on a
lower rate. The list then has no native size mode, and the fallback
takes the encoder's copy, a timing DC may reject, where before it took
the first mode. I have a follow-up that uses the copy only when the last
probe with room for the native size kept that exact timing, and retries
without it if DC rejects it. It's about 170 lines plus tests, for a case
I haven't hit on hardware. Sashiko, running locally, has no findings on
it, but the instance on the list may see it differently. It replaces
both patches here and is at
https://github.com/someonewithpc/linux/tree/edp-native-mode-validated
I can send it if you think it's worth it

On amd-staging-drm-next before this rebase, with an HDMI hotplug and
suspend/resume (pm_test=platform) in a loop, 28 of 29 resumes came back
with the wrong timing without the patch, and the other showed it
briefly. With it, 169 of 169 were fine. A backport to 7.2.8 went from
103 of 103 bad to 1363 of 1363 good. Those runs predate the lookup of a
native size mode in the list, but in this case the list has none, so
the patch takes the same path. On the current base the
amdgpu_dm_connector KUnit suite passes, 358 of 358. Without the fix, the
new eDP and LVDS tests fail and the HDMI one passes. Without the lookup,
the test with a native size mode in the list fails

I've also sent a DRM core series that fixes the cause for every
driver. It makes drm_client_modeset_probe() probe with the device's
limits and has fbdev's mode pickers check the framebuffer size
themselves. Either series alone fixes the reported bug:
https://lore.kernel.org/all/20261015212545.1989962-1-hugo@hsal.es/

v1: https://lore.kernel.org/r/20261014223041.171317-1-hugo@hsal.es

Changes in v2:
- Use drm_mode_init() for the on-stack copy of the encoder's native
  mode. drm_mode_copy() reads the destination's list head, which was
  uninitialized (Sashiko)
- If connector->modes still has a mode of the native size, use it
  instead of the encoder's copy, whose timing mode_valid may have
  rejected (Sashiko)
- Build the copy in saved_mode, which this path doesn't use, so the
  stack frame doesn't grow (Sashiko)
- KUnit cases for each condition of the fallback
- Link the DRM core series, now sent
- Rebased onto amd-staging-drm-next at 77f548b127c6, as Tom Chung
  asked. That includes 3299935e65c0 ("drm/amd/display: Use separate
  iterator for preferred mode lookup"), which changes the same lookup
  but keeps the fall back to the first mode, so this fix still applies.
  It now checks for a NULL preferred_mode, since native_mode_found is
  gone

Hugo Sales (2):
  drm/amd/display: Fall back to the native mode, not the first, on
    eDP/LVDS
  drm/amd/display: Add KUnit tests for the eDP/LVDS native mode fallback

 .../display/amdgpu_dm/amdgpu_dm_connector.c   |  47 ++++
 .../tests/amdgpu_dm_connector_test.c          | 226 +++++++++++++++++-
 2 files changed, 271 insertions(+), 2 deletions(-)


base-commit: 77f548b127c6de34ce271fa09ba270cb1ef9f2da
-- 
2.55.0

