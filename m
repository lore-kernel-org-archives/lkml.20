Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AB54A7E7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971552; cv=none; b=l+4UAfM4eS4wB0OIX+UwHpHun7epwQGYV0GBPSVdtLPw02dR51Cu2WnSTy/PiGhh8aAT26Y+vdFOixvydC4HbLUzCKk6xsDJmbJMWOWor+s1363WzPWpuPsGjxMYHmBtkCJg739TyjPw3RexWri6/MoSgiMZbqri2b1jVtcTOTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971552; c=relaxed/simple;
	bh=Q2tUUujjSzbcsH76oS+V/haZALHgiQrtHXUM7Ytev9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tglN5jMbLudJZ8B0RSYZfwNs1dXi4erM6W7aOu2wAaTJZD+ikDC+QAZ82i31eVLX6uOliANJ/Mu3YRAHinSHSnjltZMdbvBuentBffHdgDD/1zecxnXkqr+/AcK2zCY7Joe0CIfsRSyU/VRAVDD+dy4XRznfoPpfVUFPzXPNUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tp75TEle; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tp75TEle"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499de29beb7so1710655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971549; x=1789576349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yG+S01jgDNF6gG2aUjEkOKkHDiymuefIawG26yDnYyI=;
        b=Tp75TElezmGf3RnHnYHosJGO22JjnHGP2Z8g3/XUf1AVYtHTzhNY2d0QVJKYCIROv/
         9aRGhS7kJ5JMNQI1AEdlVzNDGNubB2zX1Mz9OAZOpYNuVulMBllffF/+D9VwKCLQ7vX8
         /h8wDT0O9m3oKuDFQPx/1WTDiA2sfg49KoESAnBbGWY4Gdnwd/xcReBk6mRyY4UkyEH1
         YaZXxlpBCVBB1YzP9dq5MuemOLN3V4em7ElIroJ5a16htgA/CFdWe+MwzsPx5I0RyFKS
         fJROLEvhNoNtCZfuQ8mIyvgXcdg2zhaxqplqemHHoL4LFc/5DqyWncdm5OkApmVeQ3Fr
         3vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971549; x=1789576349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yG+S01jgDNF6gG2aUjEkOKkHDiymuefIawG26yDnYyI=;
        b=THrjblRm+nGfk2q5IykNxOrLb5AaekUhad3N0SDhiC7nUq+J2LA69irI/a5O4B4XOy
         0HUxfIqO18GuxKEDZ5x/Kq+S29WaTsH+H/en8NsLHpXxFKGoI1qpikVr13kBoPFzC922
         8PhrdCIaU4xaBcTSaiNeMK+II3Z2U0H6oMDz9r5JUO1PxuCCrLnH8QR9h9rbOONQ/+ce
         CKkaJCcnZEWzx+ltJwwgLW/3C2TgHEvIJmWGa5m5uWjellzlt3f2CE0AQFOR3O7bzD8s
         ZGOMatjGATTUo6EIaOhJkHT7XvM2SkB+tdPlhKhfGwJhkCVKPzbQ929zOQk+tvSn4unc
         767g==
X-Forwarded-Encrypted: i=1; AKwUvBzS3MiU4Evnjft4hr7jr2+ncKpuEZlb2gFFcin0ui4NZCT2zebbKpKXbLi2KFvtexfJnI9oRZVWHt9YY8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nf8VMpbkBJtY4tRn6mGq1AvoG2fjQmEN6vmgZOPD7j8+sFXbw0
	S86SIVQC3/dPt9dIg3cBub8M+57e/P9vgwhV99zyGUpIg65CrS94XCr9
X-Gm-Gg: AYBFou0HeY4hK7BhmyUtWDzFAZ+WefiN2xfdBVfJhkn+yqlTofOnUTmOLYzKIBvIsLr
	ICw5HkkQ7O31H51s0Rz5DYagbHHdNdLWkInrSfwLdIpfv/McOUeTnrcZrCiqO9kFOAydL24yTi+
	QG0M5JmiAaGvfD8W34Rgfwp0I7lLMVsYOa5soRNHrtj+DHEqNiImrfRr40wRvp37xz3Nilvr27c
	dxiBgONuNxRueXkyRprayrp0QSgKpB4TgubLxnsxVY9G72Q7KMGiCELtJyJtJwcFCFeURA6TiI/
	YiAQB+1rpHlOoon6V/v2qBfh+7eTwRTts40lUt10sR0HpSfSYSw9Jy2+ntRvwmxdS8BtlHkbphP
	UhtD7tfbhFpt+jYPuNMZA8kBIorhYX+OQBJ9Wre/4XKBax9eisFfIhAURcJGaWDi02zDN29Ik1z
	7K30kBQIh849vK7+jTYTGFCsVYjoNFXZcFD3WWzNEoGhPxdTEbr3fwsXuJT2gaoyIPtoFDrH+Z4
	8fWiLtxs9fkVouy41/DEjW2AKWeM2oSYJRySvet876B0+Ph5BnbStQGbTWSCEgigCeFSepOt7Pb
	HEbD
X-Received: by 2002:a05:600c:620f:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d2570acaemr21422495e9.1.1788971549021;
        Wed, 09 Sep 2026 09:32:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900E58FC5516AABB3E4.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:e58f:c551:6aab:b3e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm2604635e9.8.2026.09.09.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:32:28 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 0/3] drm/dp: shared HDR metadata SDP helper, and max bpc for dw-dp
Date: Wed,  9 Sep 2026 18:31:58 +0200
Message-ID: <20260909163206.36409-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of "drm/bridge: synopsys: dw-dp: Add HDR support" [1], resent
as three patches instead of five.

The two patches that actually enabled HDR output on dw-dp are not here.
They were written on top of Sebastian's "Synopsys DisplayPort Controller
improvements for RK3588" series, and that series has not landed. I
checked rather than assumed: against drm-misc-next they no longer apply,
and every failing hunk sits on context that only exists in that series -
vsc_sdp_nr, audio_sdp_nr, dw_dp_clear_sdp(), the runtime PM conversion
and dw_dp_rockchip_hpd_sw_cfg(). None of those symbols are in mainline.
Holding the rest hostage to that seemed wrong when the first three
patches stand on their own, so they go alone and I will resend the other
two once the dw-dp work is in.

What is left is useful without them:

 1/3 moves i915's private HDR metadata SDP packing into a shared DP
     helper and converts i915 to use it. No functional change; the
     second user follows later. Jani's Ack from v1 is carried over.

 2/3 fixes a real bug: the bridge connector loses its max bpc value on
     connector reset, so a driver that attaches the property gets it
     reset behind userspace's back.

 3/3 attaches the "max bpc" property on dw-dp. To be precise about what
     that does: the property is a limit, not an enabler.
     drm_atomic_connector_check() derives max_bpc from the sink's EDID
     and only clamps it against max_requested_bpc when the property
     exists, so the min() can never raise it. dw-dp's format filter
     therefore already lets its 10 bpc entries through on a sink that
     reports 10 bpc, with no property attached. What the property adds
     is userspace control - the ability to ask for less - and a defined
     upper bound of 10, the deepest entry in dw_dp_output_formats[]. It
     is also the case that motivated 2/3, and a prerequisite for the
     HDR patches that follow later.

Changes in v2:
 - Dropped 4/5 and 5/5; they depend on the dw-dp improvements series
   and no longer apply to drm-misc-next.
 - Retitled the series, since it no longer adds HDR support by itself.
 - Rebased onto drm-misc-next bf63a72ea005. No changes to the code.

One thing worth flagging for 2/3 and 3/3: Cristian's HDMI 2.0 series
removes connector->max_bpc in its patch 71. That series is not in
drm-misc-next either, so these two are correct as they stand today, but
if it lands first I will respin them against whatever replaces that
field. Say the word if you would rather I wait for it.

A note on how this was made, since the patches carry Assisted-by tags.
I work in a pair: I run the board, take the measurements and decide what
goes in; an LLM assistant (Claude, by Anthropic) helps me read the
source, draft the changelogs and re-check my claims against the tree
before I send anything.

What I have not done here is boot-test this exact three-patch series on
hardware. The code is unchanged from v1, whose runtime testing was done
on an Orange Pi 5 Plus running a rockchip-devel kernel that carried the
v9 generation of the dw-dp series, with the patches on top; those runtime
tests were never repeated on plain drm-misc-next. That caveat bites
hardest on 3/3: mainline's dw_dp-rockchip.c is not the file I tested
against. For v2 I have only checked that the patches apply and build-
tested nothing. Say so and I will do a full build and boot test before
you take it.

[1] https://lore.kernel.org/all/20260808095749.9428-1-royalnet026@gmail.com/

Igor Paunovic (3):
  drm/dp: Add drm_dp_hdr_metadata_infoframe_sdp_pack()
  drm/display: bridge-connector: Preserve max bpc across connector reset
  drm/rockchip: dw_dp: Attach "max bpc" connector property

 drivers/gpu/drm/display/drm_bridge_connector.c |  6 +-
 drivers/gpu/drm/display/drm_dp_helper.c        | 88 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c        | 84 +-----------------------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 26 ++++++++
 include/drm/display/drm_dp_helper.h            |  4 ++
 6 files changed, 131 insertions(+), 82 deletions(-)

base-commit: bf63a72ea005d5e1cc12a9ad5e228c4b44246b0f
