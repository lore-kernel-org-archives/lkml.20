Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8483C511E7D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568619; cv=none; b=ZQ+Ol4MXSIAicG2OEY0aKvDf35Dkmv5AS0c7c3xzGg6nBEL39EfoQs22tIsMY7sFtKYQJgdkjVYznNHxUIsG0eQSwDYSE6oHodnxmSnlLEN0pf0M3U6Nodwr7CmV1jwgY/2U5MY4e95FjfSIQKA/hyhQexyTPvhKxcYAvhqcvKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568619; c=relaxed/simple;
	bh=AKt9EBG2sN//YZXz7OJRbcZoWgw3MVBMUuQ0ohJ+fn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5ZKsQgnkNSOdJ4VuABxk3au8Z/NjoBvaMOnCWLhBcieadA9NGZ70fpsWIGZIf6oGBtmok7hgF8pk2wWgWCi/B0pdyOr/4DC1gMMXejSmBDQViGlJJmatqc2O2n6SvshPsjJk27RjKItcVrU4xVHP7blSTp8++p+T8GjT9tdQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S82RQ5bJ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S82RQ5bJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so163741666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568616; x=1790173416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6QT3yGLHL6iAKp7l+6TCtIqZRata/HBJzcHAfxOozE=;
        b=S82RQ5bJFrDX8fCe32ln4IrcTX4Ow8QhBonXvXldB78Scevz5jLTofi2DGR69HVmxc
         L7mV6OjJiuus3oI6zx2QDse6QQ7O2nmpmqSOBt+5pkhnuFA5CHboUKGF08Uok10e66R5
         /gcoOUpUblZksqckJ7WLvgwP5TPk9hwgW0ZrDIQItPd8J/AKoz7iS17QqexRfDwL0ZtQ
         tjW16mO4fuG/X5cqB/czkqz6Luxh/uRMWTtE4pmJAk6eB0FON1V4x1WxyXLFZLu1u7k1
         l9o+RBcLRNpomTYLcLjJ7Dfm8l38VORMllOFS8R8j+72WrixzgRhkLzzfj3h60F3a1A2
         gHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568616; x=1790173416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6QT3yGLHL6iAKp7l+6TCtIqZRata/HBJzcHAfxOozE=;
        b=teA6bHZcBWKMn3BketfBF6GUASALb7PVh3+lf12FN4tMj3tR900I4F3/7SPtXJPLQG
         j/AfqPUXTZ80FWypw9C9Q0mKXKzADyBYpKnKYyqMRo2mFLYznbitpEYfLei98WiP+IWJ
         f714W5K0/xHp4XIxUwsuj54MDPJZdvQzkoR3+5fuqBo2RZudI7XyvHVXkCp2eNDzyhqa
         bfEnQKqaxRAcj9Ht/qTDmDQzkvrAZuVS8470JKbKOGb2hAyqFswUPDsCU9z9cXB7dEY/
         7B778tXnllJO1ew78b8lLQnMwqYx5PBhlnzEu26CcaTXCdtxAoL5Zvm7OZhQiC59XgzO
         ITQA==
X-Forwarded-Encrypted: i=1; AKwUvBzItVPWpgy3QmC5wkCEFaLtA7m9JmdRsPKgv8+vW+MqyCup/odPGd0szxozdJL9V0cTtQbhlhfI33vo/wA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjUMfgzlSj+CNbTwQiHhMMkZRFxgPyymxJFuXV7FwoWycSwoXE
	4DYSTIm6RjDQMJtm7VbQFJfBn+rni83VJLRM7MHBJdvCfRFUjz5v/SZ3
X-Gm-Gg: AYBFou2EQEzXFOYXuMXm90aV0omT5yW7jGtCdqhd8gHn0WRK4URGIcfLuX/csRbU0cw
	d57tHduYotilPSn3IX0odWeiDh/MTDrh7ALhUg2AKHM1w6zBdu7SuGf7ApPu21ACknD/6MxFAvO
	j4BJXYfd8bKaEovzjYQ5tH6PvFsHk9nKN0I848syPNjefbVJiKw6+OTkvpuTgd4iUaAZTAVfRZm
	CV28LzKPXan5WcE73pmwxFQBa9ZiYIi4MGZLX4stV1N41tuN8r4cHsAjlG1mUEKwQk57BkXq3qV
	M6iA9UPMcmcSdrlyVJrBgTMxUKXRJFRA2nmac1YltS7WXGdcRsW2slMxYGpKcFteAfWkoThyrSy
	YWza/M0sg1KvrJFDLY56uG9fW0qi1sNG6kJlIQy7k54IVYtr2rgsGi1tCrccZsnJSbJ6a0Q2k7h
	phoB2rqLKMr0aHY9e1XMduSamlwx7lmN88OV7mNj+4X+Ly4mjd76nhbRWwI7baGUIIuGgEheKtG
	9ilhi0feuh2jr2XkGbeGOj1dwpuW7pyPFmcoTAZ6oX+50ytvNKi0kxujidG
X-Received: by 2002:a17:907:7241:b0:c26:19de:9138 with SMTP id a640c23a62f3a-c29e5351a04mr213058866b.43.1789568615501;
        Wed, 16 Sep 2026 07:23:35 -0700 (PDT)
Received: from misharu.home (2a02-a463-a071-0-1562-51d1-d5f-82bb.fixed6.kpn.net. [2a02:a463:a071:0:1562:51d1:d5f:82bb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm105216566b.58.2026.09.16.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:23:34 -0700 (PDT)
From: Hari Mishal <harimishal1@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	hersenxs.wu@amd.com,
	Jerry.Zuo@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Hari Mishal <harimishal1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/amd/display: guard dc_sink dereferences in MST mode validation
Date: Wed, 16 Sep 2026 16:23:32 +0200
Message-ID: <20260916142332.10394-1-harimishal1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dm_dp_mst_is_port_support_mode() reads
aconnector->dc_sink->dsc_caps... for the DSC branch-throughput check,
and get_conv_frl_bw()'s HDMI-PCON FRL-bandwidth path reads
aconnector->dc_sink->edid_caps.max_frl_rate, both without a NULL
check. dc_sink is cleared asynchronously on MST unplug, and both
functions run from paths that the driver's own comments document as
racing that teardown: the connector probe worker's ->mode_valid
callback and a compositor's atomic check, neither of which holds the
MST manager lock that the teardown path uses. The former does have an
existing dsc_aux NULL check, but dsc_aux isn't reliably cleared in
every path that clears dc_sink, so it doesn't cover this.

Fail the port-support check and skip the FRL conversion path when the
sink is already gone.

Fixes: f04d275d94e1 ("drm/amd/display: add mst port output bw check")
Fixes: 5c9b8b27a883 ("drm/amd/display: Tie FRL support into amdgpu_dm")
Cc: stable@vger.kernel.org
Assisted-by: gkh_clanker_t1000
Signed-off-by: Hari Mishal <harimishal1@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 045a7f88b754..7261317d4c0f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1231,7 +1231,8 @@ static bool get_conv_frl_bw(struct amdgpu_dm_connector *aconnector,
 	unsigned int max_sink_bw_in_kbps = 0;
 	unsigned int dsc_max_sink_bw_in_kbps = 0;
 
-	if (aconnector->dc_link->dc->caps.dp_hdmi21_pcon_support &&
+	if (aconnector->dc_sink &&
+	    aconnector->dc_link->dc->caps.dp_hdmi21_pcon_support &&
 	    aconnector->mst_downstream_port_caps.bytes.byte0.bits.DWN_STRM_PORTX_TYPE == DOWN_STREAM_DETAILED_HDMI) {
 		max_conv_bw_in_kbps = dc_link_bw_kbps_from_raw_frl_link_rate_data(
 				aconnector->dc_link->dc,
@@ -1996,6 +1997,9 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 	struct dc_dsc_config_options dsc_options = {0};
 	uint32_t stream_kbps;
 
+	if (!aconnector->dc_sink)
+		return DC_FAIL_BANDWIDTH_VALIDATE;
+
 	/* DSC unnecessary case
 	 * Check if timing could be supported within end-to-end BW
 	 */
-- 
2.43.0

