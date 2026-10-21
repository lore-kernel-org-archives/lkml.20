Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562616;
	b=nMPlTWi4M30iNGeLPrWp8QEdO+Gs+0eX7+V0OxR+srb4bLDhGs7DIPeeT/KtYKapuM1s
	 rJFdwbnYFLBVSzUXscBk+iYOWcFun7G7j8BZ8Gb0Nso2/RXeVLe6NLKiizlAUfciZyM3N
	 cwqTneNFkSMXkGuSaarZ3099O5ogr58y8SCArBZeDO9Ci+syViYwbTS7PNdodIAjM9ib2
	 29ftFIp0fUw90yK59OyycKPiPc3cvTp5ZBu2NuwtgUJpz6xcT6l0t+dSZXFQSbIa//Cgj
	 3p3Fbkgq89XlsowWVY2ro5eLJdCjaSxMe08ar6G33q/1ZVYo8/YZBhgwuTH5krfyD6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562616;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K6PgntkWPS3MIVtQtUAo3panagCk/Q0phpgUN6wi+2g=;
	b=J9Kfb5bIAwAmhK1KWE5E48s6BTBceUZQYdnkJocw/Wcagggq0Hde/my9ocKfNwCWW5HA
	 zPAo9b4Vw4MxZa1FBndF1m9Xu17VuaBhr2WvPgTUK71JwDLEQ75uYGFgM2GWgqHUsyPxy
	 TlOJ4h5iWPqfCpo62djqX4dsUdase/pEbFwNTEfCwdNV2L91+Fi43wMEGEqaUqwY1N6M2
	 Qkm60wcf70KYydQfQH7sXiT60yxPIMU5pUB5yAbWzFUdXWM+VNiNU8J4jV/Cw7qO4OhMy
	 Slo3AFSl/Jwd6MeGRaMqsP0klXAAYoU52Qr8z47dzxJMObi+QMu/089+9ZChGumJVTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iM/96gOQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA77606A337;
	Wed, 21 Oct 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iM/96gOQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792562615;
	b=ofJmDpCSkojYHvoXPEesYBbPq4bShaUXd6Rmn6ebTZqjiKCPixvdhC6NSq2HRCkojDPW
	 DEqDYvRiYSk+AjG4ZzHIs0EkmPX5DwLI9wGmnvmxkiDROCLN4f/8ZihOnRv5nI/0cjWhY
	 079idiCSwmlkqAaEn7LmTDwaE+QD/CYwAfVubKwWGys+3mmORFCs2HdB2In7mYcLvauHY
	 6xuvTdhNOA3ZV1XEek5XrbHIfBogDAJDNnckjKgIHM7M/fT5c6Ye501OFU1yCRG5Keopl
	 acpeE0PFto37DdbOpAGOYGiUkZ8x95qbrYig2NSRV3EDUf4lUCSrjPhdzFv4BMGFTiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792562615;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K6PgntkWPS3MIVtQtUAo3panagCk/Q0phpgUN6wi+2g=;
	b=m81DsOkm0D7ewmL/XSsXeBpmKQcEqIwiyUu4yDxEt2kDGeZ4IuN6oiZfh6H3fRjiBKLu
	 GKCsiYKBgJX2eLr0rBYanqFsKmbSDaNojkNjL035RZgSwDa0B40dg0QQOO2QaWR99TRIw
	 1U6xpa4sdX41/Nq1h55jdlV5TK1ha/m/AXwlWjtUVNRvAqmLclzLVKmDAcAMp5gUKLY3e
	 6z4oFNgUHFwEqLsIOHIrkLCuLJkko9cgGD3TdttVM4cc8JZ0RQnNNaOe+zCIl0hyN1Qnt
	 weDJoC/y3f60y7kzZUyzTJ1UzmeR69vCiv6hflZ/m6tozT42FCOuukULaAcsaqeYQXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8852D1F01573;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792562615;
	bh=K6PgntkWPS3MIVtQtUAo3panagCk/Q0phpgUN6wi+2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iM/96gOQmx7YkoNr2E+I/GSf2++gRf2+AdBbRJylMy2rP4nY0D/YGL0iMEFMy7vwL
	 vrjFQ4yTwFlsBIIwZK64dh9bO4R9mYFH3EeeT3GCDhyqzg4ty+8bJ8IqzwORfma5qD
	 mstSqeIh12gQVFYyoaOlSjsRBjFlQuUyWZhZ+XYEhbBOELpNfdK1CKloOx9cg3KPDd
	 9SOzn6T08lyykRUXhHZ0pAefVXvRYoucZhAHr9l3rG1R+8B0dh+SAEoAXbyw1dDMSm
	 WLLYB4ybTPHrxiWQMobRExYjoBGxEV8uAdC9KddlYhn4wQqqx/hrBJqO7wiyCR3lmr
	 xADkjv+ZNUm/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE2EE432DA;
	Wed, 21 Oct 2026 06:03:28 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 21 Oct 2026 14:03:26 +0800
Subject: [PATCH 2/5] media: i2c: it6625: reject DV timings changes while
 streaming
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
Message-Id: <20261021-upstream-it6625-dv-timings-fix-v1-2-5881babdc4c2@ite.com.tw>
References: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
In-Reply-To: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792562608; l=1961;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=2E6vyPI7NuJRNW/ZUJlvYSDjxi4Zgtor1gRn8WvnAGQ=;
 b=8H1ZMqeRTA6AU15ES0ZdmW5+cFygfvrIf05SDnQ6toWayDWSK8TR17jnFk/PZtfKPDLwpE+V9
 V8Xu/Rpli+yBEThtyJl/2jT6EDGDrpSPklKeWRymajhafF6H7aZGt5C
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

S_DV_TIMINGS replaced the configured timings and the ACTIVE pad format
while the subdev was streaming, so the reported pad format no longer
matched the stream being produced. it6625_set_fmt() already refuses to
change the format while streaming.

Return -EBUSY in that case, as documented for VIDIOC_S_DV_TIMINGS. The
check runs with the active state locked, after the identical-timings
and validity checks, so setting the same timings again still succeeds
and invalid timings still get -ERANGE.

it6625_pad_s_dv_timings() passed on only -ERANGE from
it6625_update_timings_if_changed() and returned 0 for anything else,
which would have reported -EBUSY as success. Pass every error on.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Assisted-by: LLM
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 0d3bc83e4e865e55bb9940c7e958b85eedf9869a..a499b5e39acfbb1acaffc077d4f1fbdca3071a40 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1483,6 +1483,8 @@ it6625_update_timings_if_changed(struct it6625 *it6625,
 						  it6625_get_timings_cap(it6625),
 						  NULL, NULL)) {
 			ret = -ERANGE;
+		} else if (v4l2_subdev_is_streaming(sd)) {
+			ret = -EBUSY;
 		} else {
 			it6625->timings = *timings;
 			it6625_fill_timings_format(&it6625->timings, fmt);
@@ -1588,8 +1590,9 @@ static int it6625_pad_s_dv_timings(struct v4l2_subdev *sd, unsigned int pad,
 		v4l2_print_dv_timings(sd->name, __func__, timings, false);
 
 	ret = it6625_update_timings_if_changed(it6625, timings);
-	if (ret == -ERANGE) {
-		v4l2_dbg(1, debug, sd, "%s: timings out of range", __func__);
+	if (ret < 0) {
+		v4l2_dbg(1, debug, sd, "%s: failed to set timings: %d",
+			 __func__, ret);
 		return ret;
 	}
 

-- 
2.34.1


