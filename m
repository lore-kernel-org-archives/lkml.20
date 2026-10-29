Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281020;
	b=s1d419Ol1K8eta9HO4WsWj8IjL0/+p5njrDQBvNpitYzsDvXr1xhTkiGh+sUpam63DUi
	 CqxF3fyc8S3v8BhzBlzjxArWk3Rzp+3N7+Wsd+k2+q4SHughtTy63ZLNAdl2qvfEbUwd2
	 EA5R6kSW0E1yPlV99jejpiQOrnzhdMjjRu2ketihsmGw/SehgGUtiKFHrcPk3yCwDzV1K
	 upvPWaksFQL6kjI90zTV6Ogq/Cwh86IDM2NvjkcjDGYaQcXRmg3tBc0VpgTcsYFxRWoln
	 HlRHvQl3m2t9dVw+kbh+7Gv5D8HFNSRx8MbDnFC3DYPBgGuuF2lSPs7PVWw5oRe1NKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281020;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Ps5AXVGEkzhFdZfDreBUAkliDLIoFCykB99Kc4r+tnU=;
	b=bwzQd6QpKZoabPnZCvY+rz2YhzUxo8ejNNDsHsMenyJMAOq0572b1eA0wsJY5vcclWaK
	 tOJ0QL3U3zqSt9L/OATWSMe2q2NuTomy4rXE5WhFlnv2Gddb0q6yjmg2PuyEwBeWqNbgP
	 W+dkhRo3tM7+5vG8TY6P/TWNY07EO99LEjNy5X3U5MAXEVdbAhrRpxbr/QiXuAtBnEKJR
	 unPh3O09dJRbRuSSgJ7ABuqG27s14hI4ugwh4NBCpVgWVY/QUo2/VDmR0H7sMOt7GyISU
	 onIr522DmexxSl4L8drkScwblFGit9dD1YJjz5PO+fia8HZBx1Qcq4neZyXeoCkfcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPWT20Gu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A183606C33C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPWT20Gu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3211B1F01825;
	Thu, 29 Oct 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281020;
	bh=Ps5AXVGEkzhFdZfDreBUAkliDLIoFCykB99Kc4r+tnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SPWT20GuXnP07sNiBsq4tRjfLR7XL6oQOUtA3wPDRkrh0WdhWS4kllqgLkejw94Na
	 NG3CwEropcqzDrPDJ4UqHy8/XByQPC6+o4r0ic4AFtyh6xGkCR20Lyo1UqRpNqOZwI
	 KZLRjs2pyyjbrUwY8Sxe03UQub7NtXedug/xnDT/zF9vwW4NLgjOX8/yLVcwe37oeB
	 u09yI/4zzvjlGRHn336Yd4QMvYj9dS8xjsVaxZ+0WsHbtE536Dg7mZNBgoxNbLUlWw
	 L4FZ42dtIeQ/2RSlZadoA60XLDApGlrbvdE80RgXvseOH6dCWxR5n9Jtz4YpL2Pi6E
	 nvTRktXDBkBTw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:16 -0500
Subject: [PATCH v4 29/31] accel: ethosu: Ensure cmd stream is multiple of 4
 bytes
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
Message-Id: <20261029-ethosu-fixes-v4-29-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator consumes 32-bit words, so reject empty or
unaligned streams at that boundary. This also prevents QSIZE from
receiving an unvalidated trailing byte.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 0b227664afc7..1935440fb815 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -965,6 +965,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 
 	if (!info)
 		return -ENOMEM;
+	if (!size || size & 3)
+		return -EINVAL;
 	info->cmd_size = size;
 
 	cmd_state_init(&st);

-- 
2.53.0

