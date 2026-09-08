Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD85A0AA3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905111; cv=none; b=Bu4VuGX2UAQFIZ49jcYK/RLGwooyo9gjUGmqel6iYr8mKjGuPSODqCRglFGzRobAyEeHpNXwGzr/AXGxD+zbZBToyYYcotRi/qF7Ad5mtyVf1vbdAlqWj3X/xawsBcDvCqTyg0nZrgpDyC1v8OnETmF4XlpKyo1ALygNd8uVDVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905111; c=relaxed/simple;
	bh=zwsT/pnGyFspWzYneumucjHa2ZlO3sfy0p84Molq83Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3Nx9y4p3GRD64+SJntdVpiPOpKFBORCECnY3kCl5aXGEV0LZBg6hp617DZwr5hj8T2CRB3uTqWbR8o0Mi4YUNPiNJRQnPOnF6wCbvrFOzSbhcEGF2gr5WXGMK/hdjK4F5jLfjm4JGtxlx0HOHaQYqlR51H/Av3TuYlyHk2a2UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vx8Knk28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vx8Knk28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF07D1F00A3A;
	Tue,  8 Sep 2026 22:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905110;
	bh=81+2lTuoLtNrrFz1cjX0UEXbYP1lwwUoV5MIK36Dgqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Vx8Knk28Kc8ND3QWDC+qXD1kMPPNCkoFWn2f2bq+y2Y01KjrSASkxa+vvAJEpDuiG
	 hkOprJXcJgAaduSVt/U4DDEXe5wtxsWX8Iv+CqhtkbG/AeeDpswA31fA3iHOFReiXb
	 J0c8QaQJYkS9FVw+sAYrXSuL/7rgioC2LruYeWkAE4Rb7xPhmB1hMEXwqAnEnk/5r3
	 k2yqu1fkFSr6/CT5AAPUjnJX9oBPVK6goQLW/PtNAgzftq1qzTqdbvLWFvTkF0uxEp
	 wYgbdGoMZi38LcNkxKESa0elzDjITzU7Npb6XmtzxRR8HubCwX6g6YnP9mW/gEgtW7
	 NKA6p3rq0U5Dw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:51 -0500
Subject: [PATCH v3 14/22] accel: ethosu: Account for feature map element
 size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-14-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The feature map bounds calculation currently accounts for only one byte
of the final element. This can leave the tail of B16, B32, and B64
elements outside the validated buffer.

Use the feature map element size when calculating the final byte.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 11aa3f4dd0e7..974cf562ef49 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -426,7 +426,7 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 		return U64_MAX;
 	}
 
-	if (check_add_overflow(addr, 1ULL, &offset))
+	if (check_add_overflow(addr, (u64)element_size, &offset))
 		return U64_MAX;
 
 	info->region_size[fm->region] = max(info->region_size[fm->region], offset);

-- 
2.53.0

