Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814802;
	b=lTRiQg/J09iFBcKyOwKlyKStnWf5+R7e9qKROT+WH2ACD3yjM0n8ouL34IoQ8p6M0SnD
	 K9Az7O2XIz4blWb8Mw0j9c/eUynQZHv4kCYYOSDI0vaR2BdOKHn/RD/GifoK9JOkegqke
	 ENAwYTRWqtWeroKpifPPYLOYZPqD34bIS3r9Rwc19JbXKGAzpqBtzLrmbfxaTVsKdNJEQ
	 7Obawv4WE8I4/G4I9hI8tpgZ1VJwssa984xa885ONpDJ6eYYqpz6TZXT7aIuZLy9VW8EW
	 PQ5N5zJ7jNsEPEMqyKtq4z9mWcvYGi6UlX1a0vuq8RAc8WiKVveEnnAHjXolCcVD3NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814802;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8Kon/6Uqe5Kpe9D41AWo9kl1LoUswztrLzTZdnau53g=;
	b=TjxQY4yVnFq3mc84iW1v3LoyJCZ0HoVaG/1SpojT+hzEaDyCf4wtooKF1g2H2crQJ7mc
	 Kb9jKMZ5/O3x2LDvSbVuewnD+1QI4az//6r8286J6WLuGqPGxKfA5ouPke9uCdAhjYTWM
	 FyPAWMFlVjZXtsvr0YRpRTUldEDw8VfTa/gQLxj8rbkUywEfAORD/PD5WVDUE25Q6emSI
	 ZIKk8DzRJUbUSvAt5LDo0p5axqXyAKbGQUgyOoZYdjPxE3gFBkPm7SwPspRRksFFGuoq8
	 ibAtk9uXkEL89ECzfnOGfK1CrAHSpWzeH83Id5szicm6p1nz+f2WiO1JotrriBYImEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcGQszKD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5F606A883;
	Mon, 16 Nov 2026 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcGQszKD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814802;
	b=O4jkz4DbMS60OTm+75kIr5WrupT5pM0T2U96Y/Kmr4Jup3zfAbme+A7xzuHq2FfvjgZK
	 HohrkX0Ys4bXXAYtQ2DElNd/GcAJLXY8zT5igUNb/s/m6fMRWUJR8LtVSUxVVL1l10E2D
	 OOa0mYK53sha+vMwoXkSw7GHv2rrUuU8RMfjvua5M1yhaT7387ujWvzvrMP0bZEOgvX7U
	 /ydqTteBTY5KYnMz+JR9mMveYatSytlXJHzPW7ihCB/ns56ydJOZhmv0lJ1Z85QzzVgRe
	 HMhXLpaWSMbXievrPAsslSXvA6J0GESqPNDr0S+tY6pMr92gkbDsJuk5OllC33b6ZDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814802;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8Kon/6Uqe5Kpe9D41AWo9kl1LoUswztrLzTZdnau53g=;
	b=oep9oZ0WllzEdDEi/D/PkM6VDvQJHzouhhVkSL1JJmIzkXiPXb0YNWGxmMXMnTCcRLGf
	 ZwStu09qF4hMUgnQ9+vrbZv5eydLc2qPqJoYb7GJGOdMbjD2qUXAY5JtpKpfvGitHyV0Q
	 maY80xRvaaNCf4jsIdpcls7VPwDgNFqPGRCi4zp07ZdmHm1ti/5AsMd/zSsBWlFJoikSL
	 oD3hvovQxeBiv6ue5Ykf9DY8fPDN9wYxvYLCNQ9KbG6OheD/SRTDKEy3fnm2gExGewo6Q
	 vd3EpcbHTuXDB4oG9kMLveaX5Mp1BX8ClijhoXSd6IAqT8suW+I90NzK2MbtD0ff1qw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CDB61F000CA;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814802;
	bh=8Kon/6Uqe5Kpe9D41AWo9kl1LoUswztrLzTZdnau53g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mcGQszKDrEaNnZix1zz8MWFCNNfw3YbcJgYGIkIZhPUHmo2HCnmhcvEkT1cr+hIxZ
	 COlzWXI8IeVIPJ6w+Cyo+rrL0QSi/IyBMCTg67xuEb+t+RnYUl4ryq1BfgvXv0rm0f
	 ReC0jTz3jqLuTT+S1zG1qAxLaaNeyF1WOJXg9JLUd0coJhG6oICPYjrx5aCxI5Zmhy
	 LvuRpHjbQPBgiQLP91IeMSIjfgOfdE+tboVJJpk1HI6tYemWzfToV1AOqV2zClYCE8
	 /VUphpi6UWvmjxZKel+6I+cD6EQrTT/xh0hG8K41it9nPx1n4lMJIOOPNWphM+iKzE
	 ibMPeqvMAIyoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E2974A39D;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:00 +0530
Subject: [PATCH v2 02/11] soc: qcom: socinfo: Add SM8845 SoC ID
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
Message-Id: <20261116-molokai-soc-v2-2-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=723;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=u3GVb+FW18KBEBTsCyqY576uTv9UwXATV3TTXWEJaAI=;
 b=WfT+0AlMZTcwLtG4i80A32c06+mykbcApYnSYZCUWQQL8ZgVTBsZ6w914U+g01P2wZoM28FNq
 ZAcEqLMe1o8DjdEhj3YwnGHoF1D4JutO6sbw9BBR96MSIKq91I9D1gQ
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the SoC ID for SM8845, a variant of SM8850 (Kaanapali).

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18105ddcf04d..718d1fa7e830 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -541,6 +541,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SM8845) },
 	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },

-- 
2.56.1


