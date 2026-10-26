Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042240;
	b=17dO1UJasCsdeFqkvItBkSmTsy8z8WDL1oVdKxWz1/g8j11utarwV2rQlkCXfWv9fVcz
	 n8ZDFRz1yKmwG/nToc95c6sbwnBhV9yWG/i2BSIlzNaVQFkyRPP72KUjSCFh8MrT3FiAO
	 X57oz6HT+2TpPzGIEtJlSo5uG+ty7bDMEQtm2JTslQxg5D18ly6ehZ+YpaCDf9oMn9H+E
	 RJnhCneb18KhCbv25lHCNt8yqGEurjULdyVmQiFQd/rXkO9625a1UgC4moz/k7DyfP9po
	 XDyu63yy/px1t1qPoMlsSuXozlHrApdHtI9jnvduEfNgWAdXaZRTaRlYlsj9Ztz4p1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042240;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fj09/jauXkz5U9D12Z3ZmVr1su41ljj6T2mjBFgcV/8=;
	b=GTi9adN7tobrOqSelDEzuMHjiapV+s/dnr2IjHkWlqRcv+gYpHEG6HO5JjlhOO4GCf7n
	 exFMstM9klDkwxlUGL0wGlljDhjIrbcSFNvbPj2k+ceS9REnbQT1UnGEfgUeKyQ8coDzM
	 iRy54mBnIFz/tQh0+L+Oyzc4u4RP+R38eTc8WI66CHEvbhYVt0W20UrfQKOfZS8oD2hxk
	 aQ/Y1aEkFSKS21r7AUmbm3gkawvQZDhTb17wuJXdq6mjWHsaL2sSGFFhqjmgO8Yg4GMN+
	 KwY/x+S2i/vlpMnGkeZFsAhQyqQCgB4mSspNNIwDp1cYluUFlY5FN+8kg9txu4J2+vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ot1W3rqU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9A60A2616;
	Mon, 26 Oct 2026 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ot1W3rqU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793042240;
	b=2sUkj69HqBdLnhfEyj3veYEKJvzUIr/lVvu4lpPhLY3yGgbmNIukt38cgCueKZCKN1Qz
	 hP3G91hNWiFt70z5fiLsbU5ZdCulJHkv6D18VX14JOssbVsQrdZX1B1h+hYhsAuVFhma+
	 k12r1Vhnwaq2uv5uF5R470cyYA0ruphu/yNpE0ClwMxiiMI8zEzh+s1fV6qwZJrJBqG7Q
	 MICpSseJa8EI/3ui4QCBWgJIkptvSYcHAfr2n+PaFECu9X4rZ2chjbEKLt1pJB7SAj5ds
	 xkEJnhzBBfWPjINvlCpW7SItRcq94h7bVxWVGXU29kmBqpEDzKnR8+YApZaaiVttV4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042240;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fj09/jauXkz5U9D12Z3ZmVr1su41ljj6T2mjBFgcV/8=;
	b=LqooaBIEIHvmhl9oR+hKs67c0+bJ8ilsTV0Lb2eD1ORPnjx+D3BI6bRXADwViHIrkaA/
	 TKoW/NnpKvVoRu0PZ3aqGdq9hR2zt63KBb5B9fXUejL21voQYixBkLCMk0vAqW4bl1bNx
	 nbFQi0tLZCRVWJmjvTI/r3X8ahAchZ2hZ2zT0VNZBrjpzTJtjvSl6kFs3gSOwpyrSVKc9
	 45hZkWe67altKnIc1o+4rYpAYuchm9CBBUzQsuldAiyv+2/j0e+qYlXklOYDG58xZJfHy
	 w5xC7ePA47iJo+Em2SWJTEFPZ3aW/VHF8BkNzO60iLQw5fyqORtuYwgQn0v9rBbnfzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA1771F031EA;
	Mon, 26 Oct 2026 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042240;
	bh=Fj09/jauXkz5U9D12Z3ZmVr1su41ljj6T2mjBFgcV/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ot1W3rqUAVz2AMW37Ple26UIaN0B8z8U9SaUc4OnN+9JE7VPKaU2Ofv8h67GVP6ZP
	 yYrKNqecuuNLQQrFOfx+YHHkyOzIqxhqoeUl43lpsere0QaM4+oG1zZoWFZS54/LRk
	 VJTeCxemaVFG0TrvYA8MpfhIj697cAzow10OZmWlR6z1DO5g75y3dDLR2WCHOMvoAx
	 Kf29DJ43MkPq5xMZ8fPf15KqTWMfU7UFLB2QRVOGvN2EumHUyFtdzbVoKfbxLA87mX
	 uJhSxOUoxk90caF/jTCsjsvdaxT8gEMKEq2BGhZm924hoAHJowhoNNKy68YiNiOlg3
	 V2KtkSsu7pqFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3DCE44E60;
	Mon, 26 Oct 2026 19:17:16 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 16:16:56 -0300
Subject: [PATCH 8/8] drm/msm/dpu: reset DSC_CMN_MAIN_CNF in dsc disable
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
Message-Id: <20261026-msm-dpu-res-clean-v1-8-f46130a8a717@gmail.com>
References: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Xi Zhang <xz.ca.cn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793042236; l=1211;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=wGiN+gugp5FNldO/Kg3sFcSJT75myNdU6h5lxozuNKM=;
 b=nZsMcnqOnHbzY5XUKzRyVEOuXUJzxph+ChWqkFDxajHQLKX7ODGcxSaWtu3dJ/g1DTLbZ35fj
 Bk/lg76NhylDt2yhCP9gqPDgJf7pbvrQ9fVMgbXzok2zcQP0f1LC/fE
X-Developer-Key: i=xz.ca.cn@gmail.com; a=ed25519;
 pk=aRUll5L3eJbwG8Y4BO9uySKGzm+Uy+Ccei9prnRVZRs=
X-Endpoint-Received: by B4 Relay for xz.ca.cn@gmail.com/20261026 with
 auth_id=1328
X-Original-From: Xi Zhang <xz.ca.cn@gmail.com>
Reply-To: xz.ca.cn@gmail.com
Content-Transfer-Encoding: 7bit

From: Xi Zhang <xz.ca.cn@gmail.com>

From observation, DSC_CMN_MAIN_CNF has hardware restriction on
differing values between paired even/odd dsc.

Reset it to 0 when dsc disable to avoid issues when a dsc pair
is later used individually for each of its dsc.

Note that currently dpu always assigns dsc in pairs if possible
for power saving. In the future, it may be desired to assign
singular dsc if possible to support high display count. e.g.
when dsc for DisplayPort support is added.

Tested on Ayaneo Pocket DS (SM8550 Kalama)

Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b3395e9c34a1..b8a330d813e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -78,6 +78,7 @@ static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
 
 	hw = &hw_dsc->hw;
 	sblk = hw_dsc->caps->sblk;
+	DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, 0);
 	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CFG, 0);
 
 	DPU_REG_WRITE(hw, sblk->enc.base + ENC_DF_CTRL, 0);

-- 
2.55.0


