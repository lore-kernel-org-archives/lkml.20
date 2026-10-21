Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562613;
	b=h88SfJKUP3Z7gG2ImKKg5P36kNHZTLQTtFZzn7FSIic9ttdqFdZiaOpUrxO40iwYuySN
	 coWYv325KbtFLTdYyDci6h4aXc9sBfegzKI/RtUDOeiHc6iWnb1OJG3GDCud04DZUarlY
	 sdb6KuNjXyt4MZiQCeMyYmREEW56Nq6iJNOWtUcH3AXZoWJDqZFcl/oQzVgXraveVDQoC
	 4CYQnzqf5WCNQqvzvbqMnskSthf6wSpKVze07IeFXcwEBA2gmPLP8BSnQXK+bZFrm+Pcs
	 8Yzs1xA5hD67JPdZ255G74z1zJ4r87w4m28Z9kue9aFOwy26Y2BXPXPAoizM6Pz8Mdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562613;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TsShsiHUuGyVRauDr3DFZmpxJTbR+e1GArSuq/fGiVM=;
	b=aUtAmdnplzkWwS0Z0T2FW9uxS+s1UKqB5ID0sGVNoEK21OSpUCmvVV0UVaWUtwYQHFIr
	 9jlCcheUdi4+i/lAFuz1mAlIqnAtyfZQTLIkvllsy/E9qGkk/xUJgxQwSd+PjyHTf7QF2
	 +T1LU84kj42i4p54QB54uXYIucYlTOmK50nRhmNtxFmnl9pkz5IjIaqLqCyNYIEO1qAft
	 Lh2ptbv0OO29o6crSl0DXzgX0Rkwz8HpwWKbTXhOA1GbZwCA5DexXnPj+SQSx7m4bVdlS
	 xypMfzgbJ9OKDoMeb2uVQxpPis34IPKOvvgn9WY0yH3SQz1nt/UmzXJXgDdvNrK9Khw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUOnh3sp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F71606A339;
	Wed, 21 Oct 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUOnh3sp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792562613;
	b=ujv9xQTsKL35/EfssVnC7nt5PxcIVJBDQRulX27UQqc5Cdb2QqAVos+aWVFKHMNylInJ
	 geOC1h0cDzwzqnqbm9wXc/AOZu4VfG9SpHSEUNt5dwCzW3dc5Ixxarpaw5FntP0FSd4Sx
	 MTWUs9xrKo+aC23NpmPitEVKZvThyY69g24ciQkHscCOgr14tSXS7zS0sEG+1ol5i9cdZ
	 RHHWKaf1nqvbolhlUpP1GNCiWaftSviWMFTmp8rEnRqIVDkrUlOnnbYTi3ApFBiUAw9AK
	 ANRlBqfSSjom0yFL74I1ztLcBezcYS3ZiXZd9DTj3tTXzFLprHsLSNXkACYqt15QtFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792562613;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TsShsiHUuGyVRauDr3DFZmpxJTbR+e1GArSuq/fGiVM=;
	b=Z4dm8rqr0nv1PVaAV3jP1cdUTqtuoEuH/hMDanM8rG0D/qp2XaEp6d3Nh44lyYQUc8ee
	 Cw0/nzw87/KDOftISoyORy6mEQc9BdWA0zxJ5Hc6wKbMVJoe7Jy7OkSK/d13jzklPoUIR
	 eMwZaLAT3TcqB0Q4kWHJqmutsOXpefi9inBbQvO3RoNGc7uwu5GowXqbLlMcLNOWFVcL4
	 O31+NcNHEGyaRT1iMiKyW8D8fOJwvyySjm0Pw4yF9KwJmAdt4SH5F9GSAlvVDUC6teQL8
	 UnW/oO/Xu+drkjXqe47p6LS7QddHY4YnLSdow8FN25y1a/gf+lCxlVnGd2tLxmfYb9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 879211F00AE3;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792562612;
	bh=TsShsiHUuGyVRauDr3DFZmpxJTbR+e1GArSuq/fGiVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JUOnh3spSWjHttJfjFaWi5udf/29ejFhAme27/zT2KWBtmQb/J7lCyc1bggowTv/U
	 hroFMiSO53wLq9tFhOLGh379pBWvDIl2hrMUUvhwHDzJf+KwhgUClASAo3LEIBB5H/
	 E335M8oPLroKW+UrwdIwF3p6BXqc5kqmJ1KPx3ochJmCznoT+vCkABp/zmSGHSiNBK
	 kz4GY+HTKrdCx0HgjiT6kjKjKnUHg9GODB34vDsbrs+1xitYLWoU5PYEfqKYvgtG6E
	 a0wTB0nmXVjtQ4Wl3Gi/sn0Fy0LOwCB51/nLON2E6hcsCkhr/h8iQEJb9p65jqi3QR
	 /IhxiTNNxfDGA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 07E26432E3;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 21 Oct 2026 14:03:28 +0800
Subject: [PATCH 4/5] media: i2c: it6625: fix the second-field vertical
 timings
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
Message-Id: <20261021-upstream-it6625-dv-timings-fix-v1-4-5881babdc4c2@ite.com.tw>
References: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
In-Reply-To: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792562608; l=1952;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=+tXWpzhQO9nz0cPJe4L9nOkJ3NgwRhQoCzPJRB6pouQ=;
 b=O2G3n7ogoiFa+ux3lUL+YNr1dNrbW0FGp8OUkv934KevqMpC3SAs3q6DD+psOj5jiJRZLw6FY
 B0lfKpz9V7KCdFbd/P7koHEEjbFS24bADRNevgKHQG+Qm3kWrrNHQnP
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

For interlaced input, the driver reported the second field with a
vertical sync of vsync + 1 lines and zero front and back porches. A
1080i frame then totalled 1108 lines instead of 1125, and any rate
derived from the detected timings was wrong.

The vertical active, total and porch/sync registers hold the values of
the first field: on 1080i input they read 540 active and 562 total
lines, with a 2/5/15 line front porch/sync/back porch.

Derive the second field the way the CEA-861 interlaced formats define
it, and as the interlaced presets in v4l2-dv-timings.h describe it:
the same front porch and sync as the first field, and one more
back-porch line. Without V4L2_DV_FL_FIRST_FIELD_EXTRA_LINE, the extra
line of an odd frame total belongs to the second field. The detected
1080i50 and 1080i60 vertical timings now equal those of the CEA
presets, 1125 lines per frame.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Assisted-by: LLM
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 85f10d10337130565a0799daa32311510e312a68..75bcb8304c02c7c0c5feeb02af6c93378fcfa5d7 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -839,8 +839,15 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
 
 	bt->pixelclock = it6625_get_pclk(it6625);
 	if (bt->interlaced == V4L2_DV_INTERLACED) {
+		/*
+		 * The vertical registers hold the first field. As in the
+		 * CEA-861 interlaced formats, the second field has the same
+		 * front porch and sync, and one more back-porch line.
+		 */
 		bt->height *= 2;
-		bt->il_vsync = bt->vsync + 1;
+		bt->il_vfrontporch = bt->vfrontporch;
+		bt->il_vsync = bt->vsync;
+		bt->il_vbackporch = bt->vbackporch + 1;
 	}
 
 	return 0;

-- 
2.34.1


