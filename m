Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675112;
	b=DolHBq5hwjzZPp2pjfldAv1kH7waAa8xTFIl+mk19mqnJmhmHlpLi8K1sVC2GX2h8Hhm
	 /qFRc6jvfAgh6DGyXTQsDvpjpbLHckpnZWd3T4YWNOij4NrZ/bQCVHqnnunHZ6SrSm0Hj
	 9by3/tFNOjb2I+OE8k26XrnwnQjdO1HfGtiCwKd1U7sJyGXE1DnrwdomyJhJ5Is0xBUXg
	 8tnUUQqD3bbOEkvZq0dt7ex62VkEULpxmDKiUa+qKIyMN4UOW0e6ORDewxQUu+4yocq13
	 lnt/Mt29R/zsieUVpV8WGnrEFERzgrFXRew02JriB4+NNlzo6sIvaf81Bez8Z2RFvgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675112;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kHHnK2Z228+3LbVabUI3OTlIJX9/nugwhKizt1uuMxs=;
	b=OxwJvDVxim48PIEzJV7riBSxjEmDTYT+8MFzCUaiH5pce8aR+x6TGPC3WqdYxV7eQ9ai
	 YXHJ4/gFv8jlLfWSsTP5CtEo3Z1Igq2tzqLbpVyET99Hk06Ctd6ZYWxG/Pi+Um7WKKqGG
	 CFJGxUi/iW8qrF9r3hw4u8SiHf5qPjHgIo68/Tbzt4FdhPrB1S8Nrc/vF4HfIy7nm5t+V
	 Nds8oGujeTL7ro6oHemiq1muOzrVi+/2SoP7iKSg3ZYUJcRJB0+9/CDzqsncAecY8dt3R
	 xNTbYE6/DHfEC9wwtBZGkkz5bR90BK8yQX9fijm/DU7ZB/9BjebbPaNq1PQeq2QHwaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJCbyqJc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE2606A32D;
	Tue,  3 Nov 2026 03:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJCbyqJc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793675112;
	b=U+yujT8irliyhO7vSFQo+54eGWXLcl6YIiejHlyTF1gfLPFFUK+eozHUDl0NVXOeSWYa
	 L1I1T24muQ/PWefXzX9IuJy7DDHDUPtrU5PioVv3dbi2UajB7o7hVX71lnSjNVnKf08z9
	 J5mREE22XeX4y2SFdt0IDQEVrBhu48tlvvZPYQMkNBaYFbbNgzyGYfX0SY6SeGGRB3wj0
	 3kIPjOfGzwt2QpsihVdA9guuwDS6aolg4qKgfiZZEf03kXLgdXVMTp82+Gi9IGZIgjwev
	 SIRoQADUJr695ypoPYDJnqvBz4ewfJVyf2CnnFJEDfQqNOjGmT2ibI/iG+otu+LZBiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793675112;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kHHnK2Z228+3LbVabUI3OTlIJX9/nugwhKizt1uuMxs=;
	b=jSUgsdKSkKcSHSo6uvYLb8mXccEfC+jeQrobIb5LY0ggCLfI93wO8Lv3s82b1J1wy9jC
	 Nsa/ZhVyfbJD5MMFP8zTfSGKWjAehI6slMQVdMOuBO78MfknjwgNsJBwQZ4SEh/nLT2it
	 tF2xzR8ulbEgWpYERMVYW3ABzwOcVYaf62aPSgMVJ6jNgYuynrPofP1FZy3X78S3Y4S6M
	 G48j75lcnzlDzq3Nu1T9qpn30ftJ815XAAhAYBhvaGucOQgX4jQLF3PkjCvaaOtsn+iG4
	 CCvXV6sDq6dSgQzUsQWWK+mELMDYosGkPMQwk+9XWFlM5M/EuoqnX1LY7orxT2mYTYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22E531F00919;
	Tue,  3 Nov 2026 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675112;
	bh=kHHnK2Z228+3LbVabUI3OTlIJX9/nugwhKizt1uuMxs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gJCbyqJc0dKjk+U3Cho9NJqJFeZSS4Z34mcYmO0wwHcQO3dOWzHNQoqpe3+C7T3bp
	 D+uF1nkf2EqLBhrrAsnIhxlHHvoCUeJAwjYmowTAIU4Pgb2Yd+RvTBdZP0PB1q4+5m
	 1bcPZjwC/hmOfJQDcSrVsw1lbsKRwaS/hEIRjvHK5FQmhsalKE3QdVvxoUpYHK1Z5t
	 V8ClxLv6jfSYPAyUeQlxtd85Fvp5aSmepmjMQLefE1Y7VvnFm+JqyMBEo8CCf8Ltjm
	 CURZeaL/YO5ycWeIO50gje58jfW17cQBjIO86Ri0DAzk7eUpHxaK+2ZIBUwKedYbgb
	 BuYaGnNai1Oew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7615B4676C;
	Tue,  3 Nov 2026 03:05:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v2 0/5] media: i2c: it6625: fix DV timings handling
Date: Tue, 03 Nov 2026 11:05:03 +0800
Message-Id: <20261103-upstream-it6625-dv-timings-fix-v2-0-127b879da6d3@ite.com.tw>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9P6WoC/42NSw6DIBQAr2Leus8AVWK66j0aFwJPfQs/AUrbG
 O5e6gm6nFnMHBDIMwW4VQd4Shx4WwuoSwV2HtaJkF1hUEJpKZTE5x6ip2FBjlqrFl3CyAuvU8C
 R3+hGskJbI8y1gRLZPRV9Dh594ZlD3Pzn/CX5s3+nk0SBbddJMxhnG6vuHKm221LHF/Q55y89+
 1lczQAAAA==
X-Change-ID: 20261021-upstream-it6625-dv-timings-fix-dfec06cb0b34
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793675109; l=2462;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=UcIRDjG/wP3+28YImg3sXNpjg7bhMT2E8pkPtqOQ9/E=;
 b=ssDTR/tmzHKTAT/ilNVw1I5XoqV1zvNeW2AnYdjJsD9+MhO5CF6m6HLavUDyh8pJfvOe/1Ruj
 q9hiG4xPc95DyZDVquIiVTKvZouXXzb7iHufJEApN/z41wLEKEOjNv3
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

This series fixes five issues in how the IT6625 driver detects, reports
and configures DV timings.

Patch 1 keeps the configured DV timings and the ACTIVE pad format when
the HDMI 5V state changes, instead of clearing them.
Patch 2 makes S_DV_TIMINGS return -EBUSY for a timings change while the
subdev is streaming.
Patch 3 reports the detected horizontal and vertical sync polarities.
Patch 4 fixes the vertical timings of the second field of interlaced
input, so that a 1080i frame totals 1125 lines.
Patch 5 lowers the minimum pixel clock to 25 MHz, so that the 640x480
formats are accepted.

The series is based on media next and applies on its own. It does not
depend on the pending IT6625 reset timing series [1]; the two apply in
either order.

The changes were tested on hardware with HDMI sources, with the patches
applied to the driver on an older kernel. The configured timings were
kept across an HDMI unplug and replug. While the subdev was streaming, a
timings change was refused and identical timings were still accepted;
the change was accepted once streaming had stopped. Negative, positive
and mixed (negative horizontal, positive vertical) sync polarities were
reported correctly. 1080i50, 1080i59.94 and 1080i60 input was reported
with 1125 lines per frame and the expected field rates, and 640x480p60
and 720x576p50 input was detected. No video frames were captured in
these tests.

[1] https://lore.kernel.org/r/20261007-upstream-it6625-reset-delay-v2-0-c5d6b2522bbe@ite.com.tw

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v2:
- Drop the Assisted-by: tag from all patches.
- Rebase on the current media next.
- Link to v1: https://lore.kernel.org/r/20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw

---
Hermes Wu (5):
      media: i2c: it6625: keep the configured DV timings on 5V changes
      media: i2c: it6625: reject DV timings changes while streaming
      media: i2c: it6625: report the detected sync polarities
      media: i2c: it6625: fix the second-field vertical timings
      media: i2c: it6625: lower the minimum pixel clock to 25 MHz

 drivers/media/i2c/it6625.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)
---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20261021-upstream-it6625-dv-timings-fix-dfec06cb0b34

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


