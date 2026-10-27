Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134392;
	b=boXUOS8cp1VEOn/YMT4W1w37IkOWzKLBSRlqparh1ZOHgYrAV3g4e9r7mIse/nyn1bWT
	 /S1DhIhfKCz09BdOACTJv63azelU7bpx+QxeYBmC3MFjlq7gkM2L3QB3Dd2p2D3LK64hH
	 ni+G+sy4jTkIctF/hdXyEqWB1bXuQVfRx77WTSq8IO8gWGU0GbUb1yg3wNUCOJBrWLAir
	 Bvs5JBn8gG5Y67u7uR0iVGTitKBZ8nZ/y4ORoDNZ4GEHJqzOUvuWqzqM9oUYzIYzgGpC9
	 p/nSM1RIdYBJDBsFJio8Tfw3SMcShfrWU9ZjmT19SzSkzGA6roJwbj1C7hvRc4IZH+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134392;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=lWejj9rHypdqBmY0mXAGV1pwX+vAx9YbVp7L3zkMuDA=;
	b=R0qqrcfClCB0ikG+Tr7DZsIizv/FYs8FYJiSegekcTMU6ujxOmf90YjKwgL/BNeUXJUY
	 UDo1Nzsf7Jler+58tUg3PKaV8rCph1Zm3OlozMLEqS1fghgqyrPnPFZb+EVC4Tp0LEvXN
	 PYYiFBWSSBvHRHq+jEWrWhwv7B+5hh1uZxZ4cuSKFB6bQ7TvwzSm6CN3RnJ6VlyXPncUs
	 fv49CcEwND8NRZmIY7CDd/1uC/92mRUqmPG9WFRzVkBLBHpCgSX+AAleKi4JY5+402Ppj
	 CH9zpTuzRseQlxi2Cu7Xxc3gARuQLcJbimcjLbfsEtgCXTZs0A9ZPkfJPa08LHCGJCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=qIU9p4rk;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB1606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDB1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=qIU9p4rk
Received: from abreu.speedport.ip (p5dc557da.dip0.t-ipconnect.de [93.197.87.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A50B84C442F908;
	Tue, 27 Oct 2026 21:52:42 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/display: Don't warn about vendor infoframe for non-infoframe sinks
Date: Tue, 27 Oct 2026 21:52:22 +0100
Message-ID: <20261027205229.268908-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1793134363; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=lWejj9rHypdqBmY0mXAGV1pwX+vAx9YbVp7L3zkMuDA=; 
	b=qIU9p4rkT/VACRarJGq44ej2L55T25uy5eSxSwReNRkajrcYErpIVe1dwvfbDHYFx4/phjLX6bBP
	B3AKUvqjDKffGLbbtS4hyX4/FqoAKWieuRRVh53oQMJaoRpUf1HM/IZsGqBHzVvoAJCifll7xBFcDp
	fUHZfF8Fwvp8ohuUvPi2yOiXsvUJCf10okP8HoUpwjLkDn/k2RogEcNN9bBmekpUDTek9gLyh/C628
	UXS3wIqcZMCivRhbRF8dXEaN/gNcobZO2Ekl9m9wwg8Y7SOdMQFQWzLYCgszh6jm+IAYuRQ9RzT4rx
	NDaMH6DTahA0Rja5/rAHj3m/FGnEFbOA==

With an EIZO EV2781 connected over HDMI to an AMD Ryzen 3 2200G (Raven)
on an MSI B350M MORTAR (MS-7A37), Linux logs at every boot since v6.16:

    amdgpu 0000:30:00.0: [drm] Failed to setup vendor infoframe on connector HDMI-A-1: -22

Commit 6027cbee1900 ("drm/amd/display: Add error check for avi and
vendor infoframe setup function") started to log the return value of
drm_hdmi_vendor_infoframe_from_display_mode(). With `frame` and `mode`
being non-NULL, the helper only fails with -EINVAL, if the sink does
not support HDMI infoframes, that means, if
`connector->display_info.has_hdmi_infoframe` is false, and its
kernel-doc says, that this error can be safely ignored.
drm_parse_hdmi_vsdb_video() only sets `has_hdmi_infoframe`, if the HDMI
VSDB has HDMI_Video_present set, and drm_parse_hdmi_forum_scds() sets
it for sinks with an HF-SCDB. So an HDMI sink, whose VSDB lacks
HDMI_Video_present, triggers the warning, although nothing failed.

The EIZO EV2781 is such a sink. Its HDMI VSDB has a payload of only
seven bytes (source physical address, Supports_AI, and a maximum TMDS
clock of 250 MHz), so the byte with HDMI_Video_present is absent, and
the EDID has no HF-SCDB:

    67 03 0c 00 10 00 80 32

Only warn, if the sink supports HDMI infoframes. The infoframe setup
itself is unchanged.

Fixes: 6027cbee1900 ("drm/amd/display: Add error check for avi and vendor infoframe setup function")
Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5025
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

v1 → v2: Add Signed-off-by line.

Notes:

claude-opus-5-5 (Claude Code) assisted in analysis, code change and
commit message.

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index ded8e21897f1c..636dd2dedd73d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -941,7 +941,8 @@ STATIC_IFN_KUNIT void fill_stream_properties_from_drm_display_mode(
 		err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
 								  (struct drm_connector *)connector,
 								  mode_in);
-		if (err < 0)
+		/* Sinks without HDMI infoframe support make it fail with -EINVAL. */
+		if (err < 0 && info->has_hdmi_infoframe)
 			drm_warn_once(connector->dev, "Failed to setup vendor infoframe on connector %s: %zd\n",
 				      connector->name, err);
 		timing_out->hdmi_vic = hv_frame.vic;

base-commit: 77f548b127c6de34ce271fa09ba270cb1ef9f2da
-- 
2.54.0

