Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281001;
	b=z/jbIyfWW1hUY5V4GyVP0Qxe0C6uVOmr6azjQM5+bSnrheWbtyNIP+re1d1qurT6cYB+
	 guusLV/32veLEX6o2mx5DJXWnDOnTmMLy9saqXxYMZbMgFJs/bjm49Qj7vvkmIP1wFHt8
	 MmkS3+c/tRCgkXZ8smE5dik2l9eLANOtJs+iOZykmoJAvtO9kxm3yKgNdtNOzCQZPChlM
	 JSaO8bqCDaWWG04fFI8d7GlM7cGdA5f9CCvQoXlc8UJTl5F7AXkkzXDyfkhq8gOSOfCMl
	 zwbIsJCyw3wxyhpXXx13Z4yWycUbzH83nxjuiW+iywLX7x2EY9z1v2kO4IzdmHUo9kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281001;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=77trVxyKnux39gneimvVW1eMxqF6fzx5+oISfaMgLYI=;
	b=H4tZw0lN+RuXt+ECfm75aQMNOW4iGzzeKjIQRy/llrONgMvINRrTkIhsR5ddCWKxcgbq
	 OOGOJ1ZjIMMEXu936geSjJ6udczXm3xvSGvZAJU3jECDYjwtYNFBgNBks+D3XNt1fCfj+
	 U3HrGjC1m/gY6HvePh1aPdq2hSenQUAuJ3KmfYKwefBbAk+WHQwUllFu/jQ5A+Nm9LDjw
	 wDDlwRuBWN5f1RjAdkg2eQQsbAo9kevjc55N0CGrWKLqN2FSYReVodDSdW/LBvMC7kww5
	 GcvbdHJWbn8U+B7LiFNGqVdU+VANWw7nWyuj2bXqxcVBkC/YXdChL4L8nI5w+KJbiNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQj1QmBm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B360A2629
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQj1QmBm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC111F01825;
	Thu, 29 Oct 2026 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281001;
	bh=77trVxyKnux39gneimvVW1eMxqF6fzx5+oISfaMgLYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EQj1QmBmvTE4O9FQ44adDi+BQf3aK1lAqMTVEQT+y5uM9wF20LjvQZyrzGcDwVkYz
	 fDUBX2Q9ZXRP5odtVEZmu4aKoaRj7qyiOdF1kXm5fG0BsIYAGMbK53LFJENoDj7y2k
	 1sYJATcuOJb32i/c6MWAsJ4I5gUg6SVGErhaqM5lg426bpgcrRxuIwFSSYgqaaZjL5
	 QmO9OD7snY2cx9YKmXcHVPCnbWa5FDCkxM210eR33nig/uPMgteQMRvh1eLPBXUJ7v
	 r/NUfznSdoSKHhxJ8fukz4FQlD57JecdAa+AgQrhTdLdH0njQX/eUZ5AvR6qceyiUA
	 HZWkjn2ov+FyQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:04 -0500
Subject: [PATCH v4 17/31] accel: ethosu: Fix NHCWB16 bounds calculation
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
Message-Id: <20261029-ethosu-fixes-v4-17-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

The Ethos-U NPU inherently processes NHCWB16 data in 16-channel bricks.
The NHCWB16 address calculation uses the final channel of the last
accessed brick. If the channel depth modulo 16 is less than 15, the
hardware will still read or write the full 16-element brick.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Reported-by: sashiko-bot@kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 24f88696c18b..67c7cbbd39b8 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -415,9 +415,10 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	case 1: //nhcwb16:
 		element_size = BIT((fm->precision >> (ofm ? 1 : 2)) & 0x3);
 
+		/* NHCWB16 accesses the complete final channel brick. */
 		if (check_mul_overflow(c / 16, (u64)fm->stride_c, &offset) ||
 		    check_add_overflow(addr, offset, &addr) ||
-		    check_mul_overflow(16 * x + (c & 0xf), element_size, &offset) ||
+		    check_mul_overflow(16 * x + 15, element_size, &offset) ||
 		    check_add_overflow(addr, offset, &addr))
 			return U64_MAX;
 		break;

-- 
2.53.0

