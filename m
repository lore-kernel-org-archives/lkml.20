Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562623;
	b=xxzocpGGKqol3ZROBfSLiV5vX2qlvPtywr3ZjET304Rgo3ECQEuDQf142lJCa0D6JrsL
	 ge5mgjak0rqA7Mc8tZdAuygZOiojqffDvvWde5oFCkPM3YuOdeQel2+VjSVa93jALfc7R
	 JztHjMMaHV3u2PkRQMRya4tyqZ2Hv494ujQZQ9PL95pOpHmP9RTjN4iOrGNzsxS0d0dHB
	 ydwf7IdlB0g3GznWXhxJWIzFZd2lUkUetHN8ojcnj7Zv8BHV+T2Ei/cgq+Je+xsGt6401
	 1SYmQfJFcrGYYjwYN24o6tshrfT/6WF0KMG79PjMrz/gLEuE13R6Lf45EoJ4sJ9PwBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562623;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ep7Ww2T+FtQvzhxoYxdmZr4RCZRzuoB5nE4UdbUykWk=;
	b=u9eCbAm6+HghylmYU78OkbfGDLTd5r97c7Lqif1e1rDLwSPmVgd2X1d45Dm4M7PsdUmv
	 dJr9DByYGddlLRrejT7a/4maLKNYN7zvQmW8Mcvsu6PqXW9MAxsRMdVCrm3tNlYllCGyw
	 un0ucD+LCYaVB1BHP4MMOLCRSW/nINXJ1Ddg24kORChutBV9iN08qy9PtioVfaBaTA0cG
	 rhy+YO8Nbhfr6OqX7cFD5WLUuIJg92QH0/ayacqld0IgdJ+P7NfhHlnvf3DOuF0S1Fby2
	 kddy5yI2IItE5I9b4DcdfiZVF91GH3F28vEtsQ8X+YI4NDA7Kn29yQLAB7vJ8kz75qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k2lpmZ7o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C63606A329;
	Wed, 21 Oct 2026 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k2lpmZ7o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792562622;
	b=uDcqk5tSwktQhPDs0NHLyFNa7K5eWBHvtTVUsjBLrUjyDtxaD3vePFxO5O0aCSSKOC4S
	 z/8Jnse7gg1bBgMRVRjAKFqEmNVRxXnqaMivD7ldPKzDkJ+Fapqa82/ikuj0ydIj/AG7x
	 iNU7tAsnPeRezNblfxLqCY7uEBLXA2ZSODlB4DsQUVwisXAFo9qQC76i3rOOxPMXmpcRM
	 xOE2k4Bn5iXRDl7IjuwP4EGNjnsjOvpd7jsgd7ug3wwRtcWiydOyejU9tUHjVGPu3jA2t
	 uc/nhhTQOjlESpf7WMEU0WpmELPtv8pKaXQeK7FkjCy+L1d+xVHOSkv9X+8SN9aewKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792562622;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ep7Ww2T+FtQvzhxoYxdmZr4RCZRzuoB5nE4UdbUykWk=;
	b=ASkP0Ffdc5b1kZxOFBsFv/EheUu4sRCzn2Sdh2sgyVCeGFf1vXGV1o+1msREivh684ad
	 Mqcg9WrD8qsrygnqyOwVa3t5qdi9sCRYrjo31V5DRVt0VdUGWhu1pSkjXb4hvOIBy9PTW
	 Xz6xZycqFVVOSP/jFinY/wmZYC8zF0v46YpUN2MvDkCOo7eeUT2+l61FHAR1MFpXdMveL
	 pChblRMNIpZi7sMzrsuU1e0meKrVRuVydh7QOrJsqB3i7Yn/cJgieRzGBUpUF94CipThR
	 VHbtJT2pXYj0Olrg2Ln060zmmU9cX1Ftt6pcRIq0ToJ5zqEujTNqSIBj4hZeBGvXt4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 980EF1F01575;
	Wed, 21 Oct 2026 06:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792562622;
	bh=ep7Ww2T+FtQvzhxoYxdmZr4RCZRzuoB5nE4UdbUykWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k2lpmZ7oc8XaIL0lqi3dnbjYW0DObN3Yaa3k7Ga/Hu9l2aqp7v1PR7gEPXev76APl
	 5K6TYee3UaZSjOKrKTVhfEtJ3YsACuXBSyALHmNft9zSIe4lSfgSekKZAcPI6xQyXr
	 gpxP9gcbVJyPjZkfikEIX4i1DVJXlxC7ubScUtufLbYLFWl1H9wBV6WEdz9k0AiGda
	 i5DIESk/hbePpkwKjXe0rXHboMCC4ST/OCinXVB5jGtS+H3bUf6LJ8aOZN5VQLjTWF
	 lDGWxJj43/LQ8So/tGdGpEJWkT5isCJlqHOQlBAEL5ct6r9t2wJJn5nCEFVuGqbyCt
	 mOWIpvU0NuYfg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F2EA432E7;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 21 Oct 2026 14:03:29 +0800
Subject: [PATCH 5/5] media: i2c: it6625: lower the minimum pixel clock to
 25 MHz
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
Message-Id: <20261021-upstream-it6625-dv-timings-fix-v1-5-5881babdc4c2@ite.com.tw>
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
 bh=klea6SVvI1iLUVpDr4o27dnQb1TtSzgZeTrQd969SJY=;
 b=z48XEC6FXP7koznRc/181L/fyA8iDSMjKxI4/uZhUiVKx2QfKNDhJq+F65SVfr0ZDrDyg9TGa
 HGS0noITa9fBRQcFieCEsfaBLKSDe/iwIAZ7t3PUB0Wy+nT0QKc5pMd
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

The 27 MHz minimum pixel clock rejected 640x480p59.94 and 640x480p60
(25.175 and 25.2 MHz), the lowest CEA-861 format, both in
QUERY_DV_TIMINGS and in S_DV_TIMINGS. A 27 MHz format whose measured
pixel clock comes out slightly below nominal can be rejected as well.

Use 25 MHz as the minimum. This admits the 640x480 formats but still
keeps out the 13.5 MHz 480i/576i presets.

Change both timings caps. The minimum doesn't depend on the CSI-2 PHY
configuration; the three-trio C-PHY cap only raises the maximum.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Assisted-by: LLM
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 75bcb8304c02c7c0c5feeb02af6c93378fcfa5d7..561e5b5f75d887da01755fa292d6c04e4fb22c16 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -342,7 +342,7 @@ static const struct v4l2_dv_timings_cap it6625_timings_cap = {
 	/* keep this initialization for compatibility with GCC < 4.4.6 */
 	.reserved = { 0 },
 
-	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 300000000,
+	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 25000000, 300000000,
 			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
 			     V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
 			     V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |
@@ -357,7 +357,7 @@ static const struct v4l2_dv_timings_cap it6626_cphy_3trio_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.reserved = { 0 },
 
-	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 594000000,
+	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 25000000, 594000000,
 			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
 			     V4L2_DV_BT_STD_GTF | V4L2_DV_BT_STD_CVT,
 			     V4L2_DV_BT_CAP_PROGRESSIVE | V4L2_DV_BT_CAP_INTERLACED |

-- 
2.34.1


