Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.182.77.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827270;
	b=QBPLtVkWW+gSxXgGm6Fn5W1lhXJa5khpI3NTXDX/FYjYkp/nqKT7hYKhdRwHMeR/5utH
	 h0kkpvsIGO2fXhlBcW+oTIkM8ra5gH7zvyhV+xK+56mwqUK7KRHQUsyW59YuQYwYWKnKo
	 H8oEWpTq4kl7YuQjjfiWZyX9e/gy4ex+BsdAVyDASEv1cy4gloCmNT/0Ts19IWfKFxcLn
	 yHXhx4fsQo+U6P5YRjuNNqbZdqAMKMH4lKQCCKfNcCv7MUzIdfC+yThhDE6h+zNf87VyC
	 6N6q89zBKJiFn66FZ4JdEs/IqT+9vCr04j+XyMEby40xyHVn63btuMJF3erYxnXHwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827270;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=mSKHltzBGWAj3KmddZORQ4Qcz3ohrAZDhoh6LxxVyv0=;
	b=RrIfTdJVVjYNx36lD7IuOEd2+naWRbRWdu56z16m70/0CckxwXpL+XiBDKwv0/NtC0vl
	 hWzTN2RI+Enjmlr+mUckRCbdsUscTGF8Lbzr4+f1/Oi+NU4HQI6wt4C8RWC28mjGJeutu
	 wdFHEg1kjWFFyf3wmq/PPaTJERR9Q+5PszS0eT2D1HM/yIuWLJjyylRVgKpPGYA+DBLhd
	 rzBhb2lcoMPzlKECmICfQYtCs86zx3EeyJ7+jm61wSXXTE4bCCMd8Dz66S0wmZ1wcsCII
	 Z/fT8DHRfaa2//s7fTJtUZwLN/0DNeOO2CC3ex2PEKoc/bugi9lYdkEUx449pkhakJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baryla.org;
	spf=pass smtp.mailfrom=baryla.org;
	dkim=pass header.d=baryla.org header.i=@baryla.org header.a=rsa-sha256 header.s=dkim header.b=HG+C7W+d;
	arc=none smtp.remote-ip=217.182.77.61
Received: from mail.baryla.org (mail.baryla.org [217.182.77.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0E606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D0E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baryla.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baryla.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baryla.org header.i=@baryla.org header.a=rsa-sha256 header.s=dkim header.b=HG+C7W+d
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A82E74613A;
	Mon, 16 Nov 2026 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baryla.org; s=dkim;
	t=1794827261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mSKHltzBGWAj3KmddZORQ4Qcz3ohrAZDhoh6LxxVyv0=;
	b=HG+C7W+ddYmt+VV5/VQn9z38cBy7TRBXaJDvmeW4QOLjEhwJ+Hcl8lqgtLf7HwL77DiuBf
	v/gRDXrGWLHSftlR0ZqjccV9icfDt48xBbp4QiTjNZA2FKFt/CVsn3cMkiCLpSnxtMf2sP
	Mj9MKd4EPwTt+KBZDDQmc0Egr44F2ozdEDovrKGIqPEfbMCPwC68Cj8upALNdzuKJhLxX1
	KCuUp8qCYnkjN5I7pX7vXoPAykthaDKOkSGd+t8nMB5sjjWYa0DE+OulIb9gwcPlX3uQAN
	KDsdGg6pTiJLmlBUqLSszXtdmu7EHnlYJw2iXdPkvKNZLK9mT5fTkoI6zC9aGg==
From: =?utf-8?q?Karol_Bary=C5=82a?= <git@baryla.org>
Date: Mon, 16 Nov 2026 12:07:33 +0100
Subject: [PATCH 2/2] drm/amd/display: Add KUnit tests for the MST last link
 check on logical ports
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-mst-logical-port-v1-2-6b446ebe75e7@baryla.org>
References: <20261116-mst-logical-port-v1-0-6b446ebe75e7@baryla.org>
In-Reply-To: <20261116-mst-logical-port-v1-0-6b446ebe75e7@baryla.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Zaeem Mohamed <zaeem.mohamed@amd.com>, Wayne Lin <wayne.lin@amd.com>, 
 Jerry Zuo <jerry.zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Karol_Bary=C5=82a?= <git@baryla.org>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Check that a logical port accepts a DSC mode even when its
DP_LINK_BW_SET describes a link too slow for the uncompressed stream,
and that port 7, the highest physical port number, is still rejected.

Signed-off-by: Karol Baryła <git@baryla.org>
---
 .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
index e624eb55cae1..e33a9daaebde 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
@@ -2943,6 +2943,51 @@ static void dm_mst_test_port_mode_last_link_synaptics_quirk(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, (u32)ctx.stream->timing.flags.DSC, 1U);
 }
 
+/**
+ * dm_mst_test_port_mode_logical_port_skips_last_link_check - logical ports have no last link
+ * @test: KUnit test context
+ *
+ * A logical port is the branch device's own internal sink, so no DP link
+ * follows it. A DP_LINK_BW_SET too slow for the uncompressed stream must not
+ * reject the mode, and the link settings are not read.
+ */
+static void dm_mst_test_port_mode_logical_port_skips_last_link_check(struct kunit *test)
+{
+	struct dm_mst_test_port_mode_ctx ctx;
+
+	dm_mst_test_init_port_mode_ctx(test, &ctx, 2500000, 1000, 100000);
+	dm_mst_test_enable_dsc(test, &ctx);
+	ctx.port->pdt = DP_PEER_DEVICE_SST_SINK;
+	ctx.port->port_num = DP_MST_LOGICAL_PORT_0;
+	dm_mst_test_set_link_settings(DP_LINK_BW_1_62, 1, DP_8b_10b_ENCODING);
+
+	KUNIT_EXPECT_EQ(test, dm_dp_mst_is_port_support_mode(ctx.aconnector, ctx.stream), DC_OK);
+	KUNIT_EXPECT_EQ(test, (u32)ctx.stream->timing.flags.DSC, 1U);
+	KUNIT_EXPECT_EQ(test, ctx.aconnector->mst_local_bw, 0U);
+}
+
+/**
+ * dm_mst_test_port_mode_highest_physical_port_last_link_checked - port 7 is physical
+ * @test: KUnit test context
+ *
+ * Port numbers 0-7 are physical and only 8 and above are logical, so a too
+ * slow last link behind port 7 still rejects the mode.
+ */
+static void dm_mst_test_port_mode_highest_physical_port_last_link_checked(struct kunit *test)
+{
+	struct dm_mst_test_port_mode_ctx ctx;
+
+	dm_mst_test_init_port_mode_ctx(test, &ctx, 2500000, 1000, 100000);
+	dm_mst_test_enable_dsc(test, &ctx);
+	ctx.port->pdt = DP_PEER_DEVICE_SST_SINK;
+	ctx.port->port_num = DP_MST_LOGICAL_PORT_0 - 1;
+	dm_mst_test_set_link_settings(DP_LINK_BW_1_62, 1, DP_8b_10b_ENCODING);
+
+	KUNIT_EXPECT_EQ(test, dm_dp_mst_is_port_support_mode(ctx.aconnector, ctx.stream),
+			DC_FAIL_BANDWIDTH_VALIDATE);
+	KUNIT_EXPECT_EQ(test, ctx.aconnector->mst_local_bw, 1257120U);
+}
+
 /**
  * dm_mst_test_port_mode_upstream_vc_too_small - the upstream hop is the bottleneck
  * @test: KUnit test context
@@ -4143,6 +4188,8 @@ static struct kunit_case dm_mst_types_test_cases[] = {
 	KUNIT_CASE(dm_mst_test_port_mode_last_link_too_slow),
 	KUNIT_CASE(dm_mst_test_port_mode_last_link_cached_bw),
 	KUNIT_CASE(dm_mst_test_port_mode_last_link_synaptics_quirk),
+	KUNIT_CASE(dm_mst_test_port_mode_logical_port_skips_last_link_check),
+	KUNIT_CASE(dm_mst_test_port_mode_highest_physical_port_last_link_checked),
 	KUNIT_CASE(dm_mst_test_port_mode_upstream_vc_too_small),
 	KUNIT_CASE(dm_mst_test_port_mode_branch_throughput_exceeded),
 	/* get_conv_frl_bw tests */

-- 
2.56.1

