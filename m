Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562611;
	b=yBtZF4dilrWlRZKVLCgfe4CODRVqkWIF/vvcwkMcSPO2fL+DVYubZIKhOmy5+xAgiqnM
	 BU4k7lrG9Ik72QvfWC7V6jkzxZpmd/FUvv08LqTCZCX7EMxBeUr385Q867Ra9e0FzCGFB
	 6bcP6JPFQYn3X/wZ4oJoqsvqjuMlzNUQ3y+jMoKICpi/XiKdYOiUNwXQQTz2N+1/zbPfb
	 tjeZ8xMzxVqLHF3gMHx3NsVr7bKqkaETIkqVg0REbGDHfPAEZMhSh95UOMkbyDB6ynyIj
	 rDNZifKdj0gT0MwaB5ie19Pr5nrtYWRXAINEH1nA7YiiIsx3WNUmaBNIvQzmPscxikA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562611;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jSgjCmeNQY5pAXGyXja2sQXpxtou2MJ5qqmcbjnK9Jk=;
	b=zykeX15IuDeaDThpKcppJkxUt+JNsXLAZvnWOeXFU3vy3BH5SA2xpw0XR36HTcheC5RD
	 ah9xQvKm+Dp27ecqOwT/p/yKQjbVidghG/BwfUaXaim3EpZDGzDPiw2l3C50L/KR9I+sW
	 rXbbaHBNUBs2MPccPAB74n0SV9ENx3yvEYcNO7o9yBYgGZqJvLeMQ2kx5QBXESLV2kJYS
	 YI3s/nThpBpDBBeDP6yTFybEuNIrXRcnLks7aNgUSWHXuX8ZOCuRamcYKg/NrTOYl3VNK
	 w9J/KyD/PU1MBJYRy10sGcE1UCfd7zF2YfnD/OTo9NN3qfA6i60MlyJJ8Ax5r1qb/Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pf+VUPYp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66246606A322;
	Wed, 21 Oct 2026 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pf+VUPYp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792562611;
	b=d2gacOo0DsktsxL73GTjMoneXXWMd+iEh9TyxvtPSpVXLqfW9u5aQ/+vxuUATzsdCoA2
	 x1uPqrWZpi0/DypPsPxd6ezKhnaLPYvnzKB52dtXBylvVKFHmxbCO5NhQrytDNB7ANUu3
	 vn4L1kRQ8Omz1yHkXMYW3XO7z3qXvUrGZAxsVr5r5c503U31Sfzfv+sS5cDh2JXc7eu96
	 JO+kEhBHfQKdGzYHOXAxtnzk1FjaVIlaOUFJUQJPoWAZDZy9mdOpuRCxHerJTaw0joAox
	 uu0Xc/nOd+IAZknmrBsaYgKgRq/viQVPWlGFxNtY3cSrP1gNbdwfy9qiq+XksWV/v0g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792562611;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jSgjCmeNQY5pAXGyXja2sQXpxtou2MJ5qqmcbjnK9Jk=;
	b=N8YXTBUHx4NVXwusx1cUJDfUqRAIBRH0YCWdySjESNc3HdzTZto9aJoVx9sBwDj2MjE7
	 we4HyyII+kOOnDl3FrMNOQpODAIiwD2EfQhs0DNA9+sVjkYetvNR86j5Fwp2fgNyajldH
	 jtMF4v7uzcV08K1zw6alx5yfoj/WCQRybeNHL4EyL4pq/iiQ+T9GXl2aUprKOb9uLClWf
	 SM0n41cgRiFAMycfksiQ94cbgHwHfDQCpK/uP5T9yEwo0f7iNvxNpdCBlzU/dipxHajgg
	 e5I9gB7vqZYYX7FXTs2bf7eYp6W+sX4isxtMUKGwzovsmQlHbJeClP+0VkhzFpF9eFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86B4F1F000D4;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792562610;
	bh=jSgjCmeNQY5pAXGyXja2sQXpxtou2MJ5qqmcbjnK9Jk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Pf+VUPYpEmXT4Uau3tr3ryrM+fLG7E2/D8B+yUamPqfGXefxNGKf0k6KO1+qfEwrp
	 o5iCHSG97vNdu8lP/vKrJiRmQOyFKkVNyEfXcmgZmqXCE9w7H8AUFt+mQfq6LEH5Nv
	 GMBebkdMsPA3A2giSbCO7tyTvmAvE7dWfuCeZX2ayom+1Sl971/mMs2SoIJoPbSay0
	 g8+mFIzvjcLFZ7Khhz6P+JEbVE1+zSLfBWP8L8o5cmw90dPT518RzLXLnQrSdMKI+r
	 cGo7QlazRmo7sEUyI3R1EKB6dJKKb0UgwuCfjI66LWBysGMP9l29AhGEZmjBQzRu/b
	 RA55CLcRtVmaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DDDF3432D6;
	Wed, 21 Oct 2026 06:03:28 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH 0/5] media: i2c: it6625: fix DV timings handling
Date: Wed, 21 Oct 2026 14:03:24 +0800
Message-Id: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
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
X-B4-Tracking: v=1; b=H4sIAKxV2GoC/x2NMQ6AIAwAv2I62wRQGfyKcVCo2kE0FI0J8e8Sx
 7vhLoNQZBLoqwyRbhY+QgFdV+C2KayE7AuDUcZqZTRep6RI046crDUd+hsT7xxWwYUf9As5Zd2
 s5qaFEjkjFf0PhvF9Pz1icrxwAAAA
X-Change-ID: 20261021-upstream-it6625-dv-timings-fix-dfec06cb0b34
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792562607; l=2245;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=6szBEJ3MNX6NVlImTnsjsidGTgcwJHtOC3ALX2KDrvg=;
 b=oBjuweC38apxOJ8YY6nQ+1ouYccnRATufFcidtVKxzk53AGTvYkW8j6XwuIUl89ci8A3Mn+Ma
 5ud9flEFltcC9RlgqOSC36xmoBboWLBNQd5FHu1dlSW427zG2znzTjL
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
Hermes Wu (5):
      media: i2c: it6625: keep the configured DV timings on 5V changes
      media: i2c: it6625: reject DV timings changes while streaming
      media: i2c: it6625: report the detected sync polarities
      media: i2c: it6625: fix the second-field vertical timings
      media: i2c: it6625: lower the minimum pixel clock to 25 MHz

 drivers/media/i2c/it6625.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261021-upstream-it6625-dv-timings-fix-dfec06cb0b34

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


