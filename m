Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305253;
	b=vofp0jNxLC7YVH2MXEcHhqoBIg25CekZJARATBURBfcFTycGBCvYyFurvEtW/PKQehLr
	 3I7wowaRQZeWW09AQ88n9RYD0hkOC5gHwsfnLzcuh48lTHtXW58Uj/P0cmEnT6CS4fyQy
	 7Aqhglv1X5r9Eusvp5EHmExmhDWeBiWuWsrfZpjpmIoTeboBIzuk88Q9i1k1w/7rB+o1g
	 p8qevJnI4ieHdQSjJUBDJIHh1y4mSsnorIdPeIybt3GjPO8Vq6xYNu2SYSeUFhmekacIG
	 01cTJ27wf1zzQHYEeFS1lZ1es1ORaMj85t/TXtcGaqbCx1PCUQsy/hZoG9J9MmScUqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305253;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UlBE9SmUXrBZ+9pRdgM3aBoGvtzCdKu6oYoX1TWUiaQ=;
	b=zYanhqB6q3hdCXgKlSlvkFF7ATv0CdUHmMwmtd05Gu0zXLs+fjtkI5pPJNw+7aXMaHhh
	 +hpMN/lRyf7Lkhp3TN9ZoT5tlY5HaCDfl1K8saQqlCwIjxhQqvzPFBCp46Bl8JScHcyPB
	 n4TnOJFr46zes7LDEHr1K7g5HNhhYSMuGzoQAnqca9yb/qmPnJJ6Bj9xgoEtkkOHl0Nsq
	 20F9LAUXgdDOOd/6IIFj3cuvJxwTgpybXmVGS7kwO0DSWnV4Sp4BMLqIIQ8f0tk21DNTq
	 GpAVMZkAzW1fyypJa2noPozSR2Nko0SUWCiYOvyXrFHN20waxwSTPGCK51YQ4wNqJKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9u4JIl0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C6606A31C;
	Tue, 10 Nov 2026 10:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9u4JIl0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305253;
	b=chQrEWlAXdPQo2h5w770bMSpnFRU8BlPlx4NRReE6no9J9zta68AlePl67nUpheuqIPa
	 s0QMhvzFBlfPw/Xqy/nkmMTo1eMcSggQcDiSdVdooXamdbNSVYHZNPLf7plE19plL95vs
	 gvk3SCoUkqvNd6LhQ/epdGJrrs0AoZEkPQmJ+2ZOEiFLGysBAtVmqC7srmtj1/WDLHDCV
	 EvBxNfuuHviQug1kTXOtjVTBHCWglC6I5L8maKl4lMgnzh1xIuP7OG3O4k3D159P2rlCa
	 W0j7Hb3fGV86ApnfocNWOJZcJVbpQC2JauBaBvJZAKktr3ARIl5Y9eRn+7OgJUyHqPA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305253;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UlBE9SmUXrBZ+9pRdgM3aBoGvtzCdKu6oYoX1TWUiaQ=;
	b=ONzIbPtuY4Yj7M5k94T8cfBReOBS+uqXKBmMuMCVWvio1jNQHBI3hMwTAtW+xt2olEO8
	 OR3mEA5Eq1wOBeQbI2FpKhVsa5eMEIvuveCdSkA7q1KLkFWmPDOWgDeZRQGbdyAYaLjr5
	 5iBPXwONnKD1vwWgUfLDe/5dp8EJ9jcQrHDtYyD7x2c5awD6PDL2Onk8l8j5yom/jQlwS
	 bTnmO5L+kYJJhYH284KylfzasvejNb9u0TfxMsjlIn+csZTr/ldWIQk1jYfHPvHjUQTUb
	 KSHW1A/BJaWP9o/Gux6foIsNOEKyPJr/8Cm2T4OsXLaYDTZK2T9b7HsYMASuIDZ2PLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 663951F008A1;
	Tue, 10 Nov 2026 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305253;
	bh=UlBE9SmUXrBZ+9pRdgM3aBoGvtzCdKu6oYoX1TWUiaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c9u4JIl0wt8kOcobR5JVDM4kYiAx25BawY+xSD47bK4zIWbBrQIaIFNIbMVp7cX+4
	 C13sdVzmEI06JKtQvXzwZjUsIzjmsrmzeWxe/ZnhJkcb6wLl1f/N5wSUWTq61Nzdlx
	 78MAQ8BdlJ8t95Y9/rliRwC0QuBGuG+UDpF4paqmP/3j0qZqvqns79xI9wOEmkSb3A
	 oUrGxM/Xw8a7Ze+dmTMkKdbvhxdQgDsV6Rjrlql3aGnMEVs9e1aYfkRRDs7vIwo5Sw
	 Q3hvcu70Q+uLVdyKMatjMN4deDFFVKXC6er1rIF6vtPJsxacXggaPO0sZJl5Mjcaz8
	 RJ8qKNYR6KZxw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E0A9E48A8E;
	Tue, 10 Nov 2026 10:07:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:07:31 +0000
Subject: [PATCH RFC 01/10] media: hevc: Add H.265 syntax definitions
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
Message-Id: <20261110-hevc-encode-uapi-v1-1-38ae9fcfedd4@gmail.com>
References: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
In-Reply-To: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305251; l=5826;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ARtrdOY71bgjOX863jlEeMj4jngoondHMmdlHpEGOOQ=;
 b=/CP7h1Y9LF9/fyKgkLEDbHpQN/Ug/7330HdsaDxP2EpVUw5JmKcCYVli1RghdWf/1agCO2UAg
 +aBwhslsRlkDLE69AFxmwgQTbjQ93xgiyK1Mj6EQ9HmlKYvGQIVEhE8
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add the ITU-T Rec. H.265 constants that a stateless HEVC encoder needs
to produce a bitstream: NAL unit type codes (Table 7-1), profile IDCs
(Annex A), access unit delimiter picture types (Table 7-2) and the VUI
colour description code points (Tables E.3 to E.5, shared with ITU-T
H.273).

Also add small helpers that classify NAL unit types (IRAP, IDR, BLA,
leading and sub-layer non-reference pictures), since the reference
picture set and picture order count rules depend on them.

These are kernel-internal definitions: the uAPI carries nal_unit_type as
the raw H.265 value, like the HEVC decoding controls already do.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 include/media/v4l2-hevc.h | 132 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-hevc.h b/include/media/v4l2-hevc.h
index 973c96be16be..cc649b212a6d 100644
--- a/include/media/v4l2-hevc.h
+++ b/include/media/v4l2-hevc.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Helper functions for HEVC stateless codecs.
+ * Helper functions and ITU-T Rec. H.265 syntax definitions for HEVC stateless
+ * codecs.
  */
 
 #ifndef _MEDIA_V4L2_HEVC_H
@@ -38,4 +39,133 @@ v4l2_hevc_pps_num_tile_rows(const struct v4l2_ctrl_hevc_pps *pps)
 		     ARRAY_SIZE(pps->row_height_minus1));
 }
 
+/* ITU-T Rec. H.265 Table 7-1: NAL unit type codes */
+#define V4L2_HEVC_NAL_TRAIL_N		0
+#define V4L2_HEVC_NAL_TRAIL_R		1
+#define V4L2_HEVC_NAL_TSA_N		2
+#define V4L2_HEVC_NAL_TSA_R		3
+#define V4L2_HEVC_NAL_STSA_N		4
+#define V4L2_HEVC_NAL_STSA_R		5
+#define V4L2_HEVC_NAL_RADL_N		6
+#define V4L2_HEVC_NAL_RADL_R		7
+#define V4L2_HEVC_NAL_RASL_N		8
+#define V4L2_HEVC_NAL_RASL_R		9
+#define V4L2_HEVC_NAL_RSV_VCL_N14	14
+#define V4L2_HEVC_NAL_BLA_W_LP		16
+#define V4L2_HEVC_NAL_BLA_W_RADL	17
+#define V4L2_HEVC_NAL_BLA_N_LP		18
+#define V4L2_HEVC_NAL_IDR_W_RADL	19
+#define V4L2_HEVC_NAL_IDR_N_LP		20
+#define V4L2_HEVC_NAL_CRA_NUT		21
+#define V4L2_HEVC_NAL_RSV_IRAP_VCL23	23
+#define V4L2_HEVC_NAL_VPS		32
+#define V4L2_HEVC_NAL_SPS		33
+#define V4L2_HEVC_NAL_PPS		34
+#define V4L2_HEVC_NAL_AUD		35
+#define V4L2_HEVC_NAL_EOS		36
+#define V4L2_HEVC_NAL_EOB		37
+#define V4L2_HEVC_NAL_FD		38
+#define V4L2_HEVC_NAL_PREFIX_SEI	39
+#define V4L2_HEVC_NAL_SUFFIX_SEI	40
+
+/* ITU-T Rec. H.265 Annex A: general_profile_idc */
+#define V4L2_HEVC_PROFILE_IDC_MAIN		1
+#define V4L2_HEVC_PROFILE_IDC_MAIN_10		2
+#define V4L2_HEVC_PROFILE_IDC_MAIN_STILL_PICTURE	3
+#define V4L2_HEVC_PROFILE_IDC_RANGE_EXTENSIONS	4
+
+/* ITU-T Rec. H.265 Table 7-2: pic_type in access unit delimiters */
+#define V4L2_HEVC_AUD_PIC_TYPE_I	0
+#define V4L2_HEVC_AUD_PIC_TYPE_PI	1
+#define V4L2_HEVC_AUD_PIC_TYPE_BPI	2
+
+/* ITU-T Rec. H.265 Table E.1: aspect_ratio_idc */
+#define V4L2_HEVC_VUI_ASPECT_RATIO_IDC_EXTENDED	255
+
+/* ITU-T Rec. H.265 Table E.2: video_format */
+#define V4L2_HEVC_VUI_VIDEO_FORMAT_UNSPECIFIED	5
+
+/* ITU-T Rec. H.265 Tables E.3 to E.5 (ITU-T H.273 code points) */
+#define V4L2_HEVC_VUI_COLOUR_BT709		1
+#define V4L2_HEVC_VUI_COLOUR_UNSPECIFIED	2
+#define V4L2_HEVC_VUI_COLOUR_BT470_SYSTEM_M	4
+#define V4L2_HEVC_VUI_COLOUR_BT470_SYSTEM_BG	5
+#define V4L2_HEVC_VUI_COLOUR_SMPTE170M		6
+#define V4L2_HEVC_VUI_COLOUR_SMPTE240M		7
+#define V4L2_HEVC_VUI_COLOUR_BT2020		9
+#define V4L2_HEVC_VUI_COLOUR_SMPTE431		11
+
+#define V4L2_HEVC_VUI_TRANSFER_BT709		1
+#define V4L2_HEVC_VUI_TRANSFER_UNSPECIFIED	2
+#define V4L2_HEVC_VUI_TRANSFER_SMPTE170M	6
+#define V4L2_HEVC_VUI_TRANSFER_SMPTE240M	7
+#define V4L2_HEVC_VUI_TRANSFER_LINEAR		8
+#define V4L2_HEVC_VUI_TRANSFER_SRGB		13
+#define V4L2_HEVC_VUI_TRANSFER_SMPTE2084	16
+
+#define V4L2_HEVC_VUI_MATRIX_BT709		1
+#define V4L2_HEVC_VUI_MATRIX_UNSPECIFIED	2
+#define V4L2_HEVC_VUI_MATRIX_BT470_SYSTEM_BG	5
+#define V4L2_HEVC_VUI_MATRIX_SMPTE170M		6
+#define V4L2_HEVC_VUI_MATRIX_SMPTE240M		7
+#define V4L2_HEVC_VUI_MATRIX_BT2020_NCL		9
+#define V4L2_HEVC_VUI_MATRIX_BT2020_CL		10
+
+/* Maximum number of temporal sub-layers (sps_max_sub_layers_minus1 + 1) */
+#define V4L2_HEVC_MAX_SUB_LAYERS	7
+
+/* Maximum number of pictures in a short-term RPS (7.4.8) */
+#define V4L2_HEVC_MAX_ST_RPS_PICS	16
+
+/* Maximum number of long-term pictures signalled in a slice header */
+#define V4L2_HEVC_MAX_LT_PICS		16
+
+static inline bool v4l2_hevc_nal_is_irap(unsigned int nal_unit_type)
+{
+	return nal_unit_type >= V4L2_HEVC_NAL_BLA_W_LP &&
+	       nal_unit_type <= V4L2_HEVC_NAL_RSV_IRAP_VCL23;
+}
+
+static inline bool v4l2_hevc_nal_is_idr(unsigned int nal_unit_type)
+{
+	return nal_unit_type == V4L2_HEVC_NAL_IDR_W_RADL ||
+	       nal_unit_type == V4L2_HEVC_NAL_IDR_N_LP;
+}
+
+static inline bool v4l2_hevc_nal_is_bla(unsigned int nal_unit_type)
+{
+	return nal_unit_type >= V4L2_HEVC_NAL_BLA_W_LP &&
+	       nal_unit_type <= V4L2_HEVC_NAL_BLA_N_LP;
+}
+
+/*
+ * Sub-layer non-reference picture (3.132): even nal_unit_type values in the
+ * VCL range below RSV_VCL_N14.
+ */
+static inline bool v4l2_hevc_nal_is_sub_layer_non_ref(unsigned int nal_unit_type)
+{
+	return nal_unit_type <= V4L2_HEVC_NAL_RSV_VCL_N14 &&
+	       !(nal_unit_type & 1);
+}
+
+static inline bool v4l2_hevc_nal_is_leading(unsigned int nal_unit_type)
+{
+	return nal_unit_type >= V4L2_HEVC_NAL_RADL_N &&
+	       nal_unit_type <= V4L2_HEVC_NAL_RASL_R;
+}
+
+static inline char v4l2_hevc_slice_type_char(unsigned char slice_type)
+{
+	switch (slice_type) {
+	case V4L2_HEVC_SLICE_TYPE_B:
+		return 'B';
+	case V4L2_HEVC_SLICE_TYPE_P:
+		return 'P';
+	case V4L2_HEVC_SLICE_TYPE_I:
+		return 'I';
+	default:
+		return 'X';
+	}
+}
+
 #endif /* _MEDIA_V4L2_HEVC_H */

-- 
2.55.0


