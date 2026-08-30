Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E81F28C2A1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061934; cv=none; b=qrK7Q7xkSxUGjapB9XPTSRwlTLLRHtTsHjrsK1/2aCEm4cHA6iBExRHt/kPOeUhl2lONndDueTUAsG/ADH34KhqQKxO+3k8SUkOL4CMrIRKxFP2pqeQUIg2YKG+fltVL0Q3x59m+QgLy7PEbNCE61OGizSgebbEQQUKFUELoiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061934; c=relaxed/simple;
	bh=FiAT8Y4Baa5dFZFKeSF15n+QhOknhExAlPkRUi5GkuY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GfymgfkD/EZZhzqsDhgFVmPecV5rnD08tzkAyInnGpgJxnY1KdcQNlGarcx40he3HZUzLKgT7SPR9ZdyFUMMr5qvKd7b1bx5TLAZqntqlt85YcPtVL85xxEUZx5loe1I4SelwGZ/EHjjuPSqA5uvM6iXul8NDI+2LMcfQxu6Ykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZKC61E0H; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZKC61E0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788061924; x=1788321124;
	bh=jnji4+6IgYi4Ks1u6FUqTfrHf09mB52dg2/DurOipCQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZKC61E0HlqSWJ/6DatUJJrWJULEPaw7xB/kSMwT+Bnl01LVekS07P5pXxxH3KJmnA
	 TLs5O0qHkF1iYlW3gGXEkveaUF6P2t/o9KLAL9mQ/zuNDw0Hn33bQiRE9URPFLEyss
	 40CraMSOPVYFairLWKGdDNCqP19wdalwamb30E5zcjDzGnPhU1t1vtThkOuSpm8C9U
	 H1g7VriwxqctPMKF4zaAjFJBiBcROPsl94k3jxLXzYgd2ELp4WO2w2iD2C68EFWbPp
	 KIsPa7TIyaQn8PZC/iMhtB4opoZZ6MVaQWfNfwzKcYI36rzwlLbtbsO4yB//EAgyeT
	 /FPaW8Fks6jXg==
Date: Sun, 30 Aug 2026 03:51:58 +0000
To: amd-gfx@lists.freedesktop.org
From: Satyajit Roy <edu042sjroy@proton.me>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, jerry.zuo@amd.com, wayne.lin@amd.com, yan.li@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Satyajit Roy <sroy14@alum.utk.edu>
Subject: [PATCH 1/3] drm/amd/display: Propagate HDMI RGB quantization selectability
Message-ID: <20260830035120.937992-2-edu042sjroy@proton.me>
In-Reply-To: <20260830035120.937992-1-edu042sjroy@proton.me>
References: <20260830035120.937992-1-edu042sjroy@proton.me>
Feedback-ID: 147615787:user:proton
X-Pm-Message-ID: f4cf8d134f4afb49c85062f7dec4c0287be81f1e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Satyajit Roy <sroy14@alum.utk.edu>

DC uses dc_edid_caps.qs_bit when constructing the HDMI AVI InfoFrame
quantization-range field. Although DRM parses the sink capability into
drm_display_info, DM never copies it into the DC EDID capabilities. The
field therefore remains zero and the AVI quantization range stays at its
default value.

Copy rgb_quant_range_selectable for HDMI sinks and extend the existing
EDID-capability KUnit test to cover it.

Fixes: 6eb4c13a3845 ("drm/amd/display: Support "Broadcast RGB" drm property=
")
Signed-off-by: Satyajit Roy <sroy14@alum.utk.edu>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c       | 1 +
 .../drm/amd/display/amdgpu_dm/tests/amdgpu_dm_helpers_test.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index ab15ceec4da..e49a8dda512 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -218,6 +218,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 =09edid_caps->edid_hdmi =3D connector->display_info.is_hdmi;
=20
 =09if (edid_caps->edid_hdmi) {
+=09=09edid_caps->qs_bit =3D connector->display_info.rgb_quant_range_select=
able;
 =09=09populate_hdmi_info_from_connector(link->dc->config.enable_frl, &conn=
ector->display_info.hdmi, edid_caps);
 =09=09drm_dbg_driver(connector->dev, "%s: HDMI_FRL [%s] max_frl_rate %d\n"=
, __func__, connector->name, edid_caps->max_frl_rate);
 =09=09if (edid_caps->frl_dsc_support)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_helpers_=
test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_helpers_test=
.c
index d4232648d8e..b13f258740c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_helpers_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_helpers_test.c
@@ -412,12 +412,14 @@ static void dm_test_parse_edid_caps_hdmi_frl(struct k=
unit *test)
=20
 =09/* Drive the HDMI/FRL branch */
 =09connector->display_info.is_hdmi =3D true;
+=09connector->display_info.rgb_quant_range_selectable =3D true;
 =09connector->display_info.hdmi.scdc.supported =3D true;
 =09connector->display_info.hdmi.max_lanes =3D 4;
 =09connector->display_info.hdmi.max_frl_rate_per_lane =3D 12;
=20
 =09KUNIT_EXPECT_EQ(test, dm_helpers_parse_edid_caps(link, dc_edid, edid_ca=
ps), EDID_OK);
 =09KUNIT_EXPECT_TRUE(test, edid_caps->edid_hdmi);
+=09KUNIT_EXPECT_EQ(test, edid_caps->qs_bit, 1);
 =09KUNIT_EXPECT_TRUE(test, edid_caps->scdc_present);
 =09/* max_lanes 4 + max_frl_rate_per_lane 12 -> rate index 6 */
 =09KUNIT_EXPECT_EQ(test, edid_caps->max_frl_rate, 6);
--=20
2.51.1


