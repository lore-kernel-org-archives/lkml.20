Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785350;
	b=Bvb8+3Jb5IJ1WIdQA9Mpc97ag2lMBNpnwmeET1arHvN2btEWhJNxHM6rgySQk3N0EbNb
	 bXGDJeU3d1pm8FS3H/mvRGxNbUFZHXeAWfNn9aa9/JdH0rQBiYhKbPc0cFrKFEjyWD5EJ
	 GNMSUgoZW/uBPzxtCtnxr5bq/V9aUJx/6Mtv0ubuG/Xrs1cGXKT9fHZvg4bKu20f+Gyi4
	 2cNaS0yJyTH5n4Fj7R41JglAMXQBY/HV6zC2dJl7n31fRMV5UJGF/n1bGSTVFMyYwycJ4
	 WxfF5siumesIaM9v31VyeYu66oVccdC2Bo6XXZEDw1Q+0nmxzql5HuP06c5uAWw7xjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785350;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vdT1a4Pw/YTLbaed8FSmFt8HagIufL3M0jEHQxnTQSg=;
	b=GclBTBzqnMlxkzqU7y4vWl8zvZ5pkLsSmCytbs4eD52TZSuJj491o9ozZMSXNmEnD+ga
	 QHcGPqOEZfeiba/6qAMGFGwtWhmmoseED/E4ZH9pxCx6KGzBSfQCLI1WNESdASQy1IUy+
	 ONWcNBs8H9Op3NZw/sSLKUGgCblpyNLN4WtQHAmtwbD8J+f/Pin36VggavJUKMCiF0S7G
	 14WXdcCHj71qaQ5TkCmtttLvdBNVAg6gRG7T+iZNWOEaqqmFfdBakmAZF8wQMfo4rYkT0
	 6PArcUp8uNcdkntzuzRvbDV9Fngn5pj1XCpcasSPp/Uz+3x/5kH5RGBirMh1BSdrM9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=W5OLR5Mf;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128E7606EA4A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128E7606EA4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=W5OLR5Mf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785347; x=1793044547;
	bh=vdT1a4Pw/YTLbaed8FSmFt8HagIufL3M0jEHQxnTQSg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W5OLR5MfDeOTHUa8RKaVx4/cjeAh7ysdEtDtoALUWGtv7c3PJdSG1lwB4pu5q9nsY
	 9y0MlxVcKWa4VSTLmtphi7vIaxTMCGC0qjzVlKSDGunzw+OvI1hMn0/jGfFKSJ1LBu
	 Usc3vlW/FadOxbO7ueAz18QeaNsBTRJjPzT+moAtwDmlc9EKDXtYAzknBYtlz2Dv6x
	 Yh7MhzhXhkfqS8pjaoclvKDor6oyUvIEztM70tCSEgRtX6Oi9ylNnn/eJN3rK0eNLR
	 TNl8WaFhg8NmwLdFft2HdXTPtazkk1Hrd87h0ydddcd/q6UtW+U4jZtCEm7tiX0Fbs
	 eCkPw3Xvr/WYw==
Date: Fri, 23 Oct 2026 19:55:44 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 04/11] media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()
Message-ID: <20261023195446.22578-5-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 6211db852f15d5754737f0a2b5668d0ec08c38ca
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In ipu6_isys_csi2_set_sel(), sel->r.height is clamped with:

    clamp(sel->r.height & ~1, IPU6_ISYS_MIN_HEIGHT,
          sink_ffmt->height - sel->r.top);

However, user space supplies sel->r.top (__s32) without bounds checking,
while sink_ffmt->height is __u32. If sel->r.top is negative or greater
than sink_ffmt->height - IPU6_ISYS_MIN_HEIGHT, the unsigned upper bound
sink_ffmt->height - sel->r.top either becomes 0 (smaller than the lower
bound IPU6_ISYS_MIN_HEIGHT, violating clamp()'s lo <=3D hi invariant) or
wraps around in u32 to a value larger than sink_ffmt->height (allowing
sel->r.height to exceed sink_ffmt->height and storing an out-of-bounds
crop->top offset).

Clamp sel->r.top to [0, sink_ffmt->height - IPU6_ISYS_MIN_HEIGHT] before
aligning it and calculating the allowed crop height range.

Fixes: a11a5570a09d ("media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-de=
vice")
Cc: stable@vger.kernel.org
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.c
index 1525454279..a2491729d3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -821,6 +821,8 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *s=
d,
 =09/* Only vertical cropping is supported */
 =09sel->r.left =3D 0;
 =09sel->r.width =3D sink_ffmt->width;
+=09sel->r.top =3D clamp_t(s32, sel->r.top, 0,
+=09=09=09     sink_ffmt->height - IPU6_ISYS_MIN_HEIGHT);
 =09/* Non-bayer formats can't be single line cropped */
 =09if (!ipu6_isys_is_bayer_format(sink_ffmt->code))
 =09=09sel->r.top &=3D ~1;
--=20
2.56.0


