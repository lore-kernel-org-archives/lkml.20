Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291456;
	b=jIs+EGMkfZFfMJPxag+DwYsHdNXIMe4FJLj82Tb33Nj6bSbNyP9IvHgi/CrH8X/Fy+09
	 xa6HOVBETzvlaccxmiBV03GTR6fge2IrvJkWHfESGVmTT2Gf1d090E8RdXFxM96PZTewr
	 hBLMDoWtvudRyf6Tkhe7BB4moJj0mTIr9J/xzpiRmls2r5Cm1djV8npzTiiULPrMNn2Nx
	 KwqBJo7XtDAku9SUOLC8wewb6C1NBAiLFmTMvOFx7/w83fxf6Z7IZWBIjMlTN/dyjYLw2
	 fOpRmzePiUL8ZMh49Nj+b23CkE+9K2P+bug70CNd7nBGark8Or3MJx9tmXB6iTFTSDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k3uhdNlZSdSaEdl0vjUQD2xKy4pCM7Y0eAHlBiwggF0=;
	b=E6WBjUYQasu3+URh3T+ZwRYUpWHCJUu0oAbV87asepr5CISH8+t0nh47rWBvlSot+Ll8
	 ixTQpFVs4eVxRXrEzrx/2IVyFf0jQCB7rouPcRMz6g7WBnWVAoDJ2EPHnScRu2GoNrlZo
	 rMSHO7JfR9cW4dVxSib0jY8Hc2f7HDXSDOmE6jcviioRAqOTzXXRh3IeCwcYliMqtxc2F
	 DmbQJerIBGqWKUpTCQ+9an9SsOl4nAsn7jUeZRzZI6k9EAAYEPnmWnbWdhlb+4MAf4GTc
	 1ria0FhQQonhxQV8HF1q8Ck4KRLr3uIuSbVO9Pnce1EuaBO8TEeQYa+bGm0/C5FFsUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="EW/ive39";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E5606A32E;
	Tue, 10 Nov 2026 06:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9E5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EW/ive39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794291455; x=1825827455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4t+x+EaigO+vySyWALUEm1r5nKoU1AV4wCMiWWdA7bM=;
  b=EW/ive39+0RrQqcP5cC4s5COWF63mBd5WonFsvkzHAoNt+XWvMYV2EEK
   5aNjYJMyEdyXwKrboNffilKryOv3v4R0T1FqrWQmfxg6hoTHqsk3KJTu/
   ePXBuMukRKJxjSwp63TRHTL3FEALWV0E3swaZJzYI6BMMRj9JJLqJfOmM
   JMH6hcxEA9CDzH3PZHMKD5OdB7NWU0tJtGVnnyQXv67vvYXwviehWf3rP
   6ixffDFAL+sVENqAMKRDRSGdJjo6nBzbudaZlG/7qDeBLpsREROtqCyvl
   NZks9mQ9VRCoa3sicNs6cltZekNq+iulOuiBcr1HTs0DuGBmPJcBcEE0F
   g==;
X-CSE-ConnectionGUID: Wm3dcb00RAStnFCjXm1Cqg==
X-CSE-MsgGUID: eAGe0IkmQVKmbwEmyMQcag==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3021012"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3021012"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:17:35 -0800
X-CSE-ConnectionGUID: dn73NeU9T2qBPenz7PGdTA==
X-CSE-MsgGUID: Vm13HjXITmSwWl6CGH2Unw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7931038"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2026 22:17:29 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	John.Harrison@Igalia.com,
	kernel-dev@igalia.com,
	alex.hung@amd.com,
	liviu.dudau@arm.com,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	laurent.pinchart+renesas@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	dave.stevenson@raspberrypi.com,
	mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	uma.shankar@intel.com,
	arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 6/8] drm: writeback: Modify drm_writeback_get_out_fence helper
Date: Tue, 10 Nov 2026 11:46:35 +0530
Message-Id: <20261110061637.2500929-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110061637.2500929-1-suraj.kandpal@intel.com>
References: <20261110061637.2500929-1-suraj.kandpal@intel.com>
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

drm_writeback_get_out_fence() does not itself need the parent
drm_connector object, but update it to take drm_connector for
consistency across the writeback interface, which is being moved
to use the top level drm_connector and traverse down to
drm_writeback_connector rather than passing in the lower level
object and traversing back up.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: John Harrison <John.Harrison@Igalia.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
v6 -> v7:
- Rebase over latest kernel
- Rebase over latest writeback series by Dmitry

v5 -> v6:
- Rebase over latest kernel

v3 -> v4:
- Update subject line for consitency (John)
- Update commit message across commits for consitency (John)

 drivers/gpu/drm/drm_atomic_uapi.c | 4 +---
 drivers/gpu/drm/drm_writeback.c   | 4 ++--
 include/drm/drm_writeback.h       | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a3e8809b4508..139210b093e8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1498,7 +1498,6 @@ static int prepare_signaling(struct drm_device *dev,
 	}
 
 	for_each_new_connector_in_state(state, conn, conn_state, i) {
-		struct drm_writeback_connector *wb_conn;
 		struct drm_out_fence_state *f;
 		struct dma_fence *fence;
 		s32 __user *fence_ptr;
@@ -1520,8 +1519,7 @@ static int prepare_signaling(struct drm_device *dev,
 		f[*num_fences].out_fence_ptr = fence_ptr;
 		*fence_state = f;
 
-		wb_conn = &conn->writeback;
-		fence = drm_writeback_get_out_fence(wb_conn);
+		fence = drm_writeback_get_out_fence(conn);
 		if (!fence)
 			return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 7c74361e38e2..33be7a0b9a89 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -504,10 +504,10 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_writeback_signal_completion);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
+drm_writeback_get_out_fence(struct drm_connector *connector)
 {
 	struct dma_fence *fence;
-	struct drm_connector *connector = drm_writeback_to_connector(wb_connector);
+	struct drm_writeback_connector *wb_connector = &connector->writeback;
 
 	if (WARN_ON(connector->connector_type !=
 		    DRM_MODE_CONNECTOR_WRITEBACK))
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 5e8ab51c2da4..2afa48ea7c00 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -104,5 +104,5 @@ drm_writeback_signal_completion(struct drm_connector *connector,
 				int status);
 
 struct dma_fence *
-drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector);
+drm_writeback_get_out_fence(struct drm_connector *connector);
 #endif
-- 
2.34.1

