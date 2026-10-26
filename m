Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046367;
	b=NQexIpPGk1o7gvh5nsOdjzlqiT2CrOHIhcOs2nRXHcPPitLwF2mYv8llgCASLhD+/jBl
	 T7JxyF08RiZwKu4plDGDbfFrjvNlZIHJigGdoN4iVMn8d5tCvO6Yn91MASgfOXRbMj8zx
	 j3OhAGaeaNCWx6Ps2BkfYlmUAPRBleafSeTZqh0gwO+nLy5Zkv8+6ZHByr4ZvmXFWm+lD
	 3DHS+DkDPkeAype1yUloenPtWQQWva7PIM5ocep8nt4i+i4CudzRfoNGCLc/uACAMFnsA
	 DqtM7nClkVBb1IlG3tqRlkGxXnMWOr0Z2YjIROBMfqxsMrdvlNMRWHKBVOb8JquUSug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046367;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fj09/jauXkz5U9D12Z3ZmVr1su41ljj6T2mjBFgcV/8=;
	b=RZDtGcBtOi/h6KYwtiloit8hySP1fpRk4OfncoL0JYqMyNW5T/ZLYsqFfwez0XmNS9SC
	 IL+pKs16uUp6ApcXY/jVWF6+ELhQgkn3N4BTLlSC9ZWXpvbnFSOQhOC0Zo9doNtv24Rsm
	 qD38QAH5GlQ+jJb4bVG7m0nY0PUjHx3E748bfVwwvLmY2Cj1dITT8FQON8DG8pn2eXW23
	 xPVTkBRzpymPn+VM6Y6l3XaP+m5S6aRxlf7T8OeIUeCE9rt2gmd+Vnfp/EjehsPTtIP3k
	 J5E+OK2h3V2kL7C/Fck/e4l9tDfuldu7rxbEbEp6whTfOQXwo6FVkyKkZGKFhOIMTyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgWpmS0Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31289606A333;
	Mon, 26 Oct 2026 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgWpmS0Q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793046367;
	b=Yu2t1aEpOw6wNn95iEJUN65ukLCvlqa+DWIchOy0dbp0cBz856iZt4gQvFBVKKazW4vR
	 6qblxFFKfdjRhYmju1Nug9i7EEwfJBe+OLtPMe0Ag4FgZX2lMxfKvaoV9eDppGCyVx8Xy
	 Q7sI0Z3SrqkRtkwsP+TaNTlru7uRTw6WnD/XNI6BPgVXbLQv6CStg++kbwXb1g85Hi4ot
	 Y7pyNni/hjGAvxVnFoy39OYSg01dbiJKoCpONWiDEUYY/B+QFIZLGagzuNcds2KuQyHjo
	 s1J0Nn00tOTKwiSa4r2t/D9tDzmMRo4AWCYlzqOKgzZnK3gSOh/miDXWhngC/hBfGjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046367;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fj09/jauXkz5U9D12Z3ZmVr1su41ljj6T2mjBFgcV/8=;
	b=Ng5wKfyfvtHsP9xVb9XghEDFgGQzjUw/GaKeLt757psuFhV8uewL6YauY5FEnr6g6Ykk
	 neG+g6LFflkK3lpcW7fig49Lo0M16l2G/6zMrpP5roPZ5vUKX44QHG8LIRTbwNBDPkB+g
	 FKuQ3X61GFgM/27x/zXwKD/3QNxgI/PQVMRqgk8TCZKQM6T7CACYbeZYL6hDi+TkHIDp5
	 r/TGk3roIKFMe9ZOilEnWA6upOcGDdZsTAm79qNxIsQQzLEYrS6WuWOJp0eNV2+Euwl20
	 EtwIOM2te3gJ6PNCrZatTnZQFnr7gWi76h1Lsb6zytx9ljgTTac5ebPGkUatOCGi4bw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 828FE1F031E3;
	Mon, 26 Oct 2026 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793046367;
	bh=Fj09/jauXkz5U9D12Z3ZmVr1su41ljj6T2mjBFgcV/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YgWpmS0QcC4H6aBnhXWT+fckGg35zG0lM1V5EY/FgQhtxCFcBYP0iF86qkKA7MvfS
	 9rsw/yGkxmImvGx1YWPrc1in/x9EKuVKrNg6GfJpkxjOTn4V6LwtMkWZE8/Q1prSMA
	 Dq7LXllU1Ss0kDJ7oCfERkwkYcD5dzZ4xOJjsfe9Eh0CxIz+NCP17kQmAhQQwbEFbJ
	 kO+UI7IxLybrsZmA+1ux1zFWqYQGTe4qvnyoOW/+gfyoPdfDEVpK3Msfvbd0t1ViAo
	 sQMHj6gCkI5ocWqYmqAoXztwSmS4NwpR/TnR3cG3AJrDjVplvI8Ddd4Txoeo79gW7I
	 s8cl3Gu/WSZEQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A51244EA1;
	Mon, 26 Oct 2026 20:26:05 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 17:25:47 -0300
Subject: [PATCH v2 6/6] drm/msm/dpu: reset DSC_CMN_MAIN_CNF in dsc disable
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
Message-Id: <20261026-msm-dpu-res-clean-v2-6-3d864435186e@gmail.com>
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793046364; l=1211;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=wGiN+gugp5FNldO/Kg3sFcSJT75myNdU6h5lxozuNKM=;
 b=XeYvMeWiN8pWxAujZwv1lVFeUuZWtbYdWkRtqIUxjFcwFi1t9hLTcgJplJAkouXRs5pRxEzHJ
 Wlwqz6H2XOcBbB9Zf3kc3ceKOK6LDAw72c2JuTWnlB9yTrzm0Lffg7z
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


