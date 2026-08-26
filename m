Received: from sg-2-4.ptr.blmpb.com (sg-2-4.ptr.blmpb.com [71.18.227.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70383327C13
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772983; cv=none; b=sr0Ic8VqFOxfLeeBFHufFytxzts+UoT3afPBflhXFa9kBUS4CoY0lSfM+AjzqY/9+75PqFwZv/DrXw7RH+7J7BePeVfeacOX+FRuK8RXx6dYkWc0mea4Lg5DfOO4jVK3IR6A6kRCVrWY4WZnfQ/8DKnA69m+ZunRjj5dF7yQcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772983; c=relaxed/simple;
	bh=iF812bLAs9t1EnoNtoWH4+hhjwKPi1Vz831/GWCnovk=;
	h=To:Subject:Date:References:From:In-Reply-To:Content-Type:
	 Message-Id:Cc:Mime-Version; b=LLy3g2GVTnGMb9BSkxKsk3RQUE73Y2L1vUqHmf6iqcEoIrJoJQZlpUZY43Pa3eZ0MPgWYYNoaJJoI5NCxjSNErWxMeSx3EApk3Fp/Uflh3gFcrP05/RhbKT7rqdu6E1JwnJ1f7zQ4x+D7vzFMQqzAGW79biE3B45zrHU7LFEGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev; dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b=xXwDHC/l; arc=none smtp.client-ip=71.18.227.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b="xXwDHC/l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2602131731; d=imm0nv1nhtv.is-a.dev; t=1787772967;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6m6/nVTkN2G1SyFXrOvB2/4l1QVTjAhGUBW3iigpQ0U=;
 b=xXwDHC/lI9wUDcOickNtgmclJ9sSYiCmwHK5xU7einvu66U3SsrJOT+V9wC7pDVTeA7iBw
 1iRoThyg+mMzzg12uXM9UNdM6OyRxW8j9emLfaoZbBPjOGqRq2lxUOVZ/w9tKdSqfJsH3S
 NpgLykGftIq0WXNMYASmlQrFb7SbQMVFPt8YQXi510I+OkbRpAM24/MJ7/M6jqWWgpbmYh
 WYqLPb/BK0z07gCTlf6AYydlUwkB2wm/9JJ+8wrWvOkKljEUFgzCcg1gQ9cFjIMzqv3O8s
 AJWLLDGDuLYMTnJ2c7rSp4R49Enwp1JQJ4inmlKXZqBc2NUhAaKKW+st1iDVag==
To: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, 
	"Alex Deucher" <alexander.deucher@amd.com>, 
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/amd/display: skip receiver power control without AUX
Date: Thu, 27 Aug 2026 02:36:01 +0700
X-Original-From: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
References: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev>
From: "NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
In-Reply-To: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset=UTF-8
Message-Id: <20260826193602.6441-1-neptune@imm0nv1nhtv.is-a.dev>
X-Lms-Return-Path: <lba+26a8f4027+c14e7f+vger.kernel.org+neptune@imm0nv1nhtv.is-a.dev>
Received: from Neptune-PC.kiko-royal.ts.net ([58.186.164.158]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 19:36:06 +0000
Cc: "Rodrigo Siqueira" <siqueira@igalia.com>, 
	"David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, 
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, 
	<linux-kernel@vger.kernel.org>, 
	"NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Passive DP to TMDS dongles do not provide a DP receiver and use native
GPIO I2C rather than AUX. dpcd_write_rx_power_ctrl() nevertheless tries
to write DP_SET_POWER, causing the DP helpers to retry a transaction
that cannot succeed 32 times before giving up.

Skip receiver power control when the link is not using AUX mode.

On an Oland GPU with a passive DP to HDMI to DVI chain, this reduced
boot-time "DP AUX transfer fail" messages from 32 to 0. The EDID
remained 256 bytes and the display continued to use its native
1600x900 mode.

Assisted-by: Claude:claude-opus-5
Signed-off-by: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 49521ac4b0e8..7991531f6ef4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -50,6 +50,15 @@ void dpcd_write_rx_power_ctrl(struct dc_link *link, bool on)
 	if (link->sync_lt_in_progress)
 		return;
 
+	/*
+	 * A passive DP to TMDS dongle presents no DP receiver, so there is
+	 * nothing to power up or down. The write can only fail, and the DP
+	 * helpers retry it 32 times before giving up, which adds tens of
+	 * milliseconds to link bring up.
+	 */
+	if (!link->aux_mode)
+		return;
+
 	core_link_write_dpcd(link, DP_SET_POWER, &state,
 						 sizeof(state));
 
-- 
2.47.3
