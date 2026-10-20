Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792461912;
	b=K1zABwwkyHRD13VFZIyKH4E5IcXQZI/MXprtJMVzx2xOVLujF8Q7V9fE8/Tsdo2iGDND
	 AtGGd1wxRWuSA2IUwXiohSIvnAAiPVIfYorSv/1Vhr4OtBKekAci8s7MeXKBGgw/pe5x1
	 8gLfFmj+RdwDyGHo6IePoWNs+MLFbwcJWuhiidOlhOJdeTeSTx0EHJwbg/YKcoSQGu78g
	 ZDnNYTWuAIB/w3KdXaaGhfiZxUfqhh070+76jMlwgqFeexQ1fTeb4nbbW1FKU8svpHHwd
	 IgQp5vAmaiM7dRTFyF8Jc0rh5QPzfS5xPgYLlkUeDg0qagGnVWZ+LBNLoFch5v3Lp5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461912;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eGj39CsSEUy+czLqKLB8z/AHZ5ouwpJVjuwLQbfBmcM=;
	b=bFWehWl1+lrb61yxle1hnZ3tVU04/CTWJ+NIEAs9SwC2JCvtuA/wWjrS0yrcvu3BAZDC
	 HLlstTbQqegtXY5IVUJ3pi2Dc6pAscBqsNZPxgBCTQKwG9wj7eZJ3oDhbQ23ySwJ2J7OD
	 kfpXRBwWo7/d7fwuqHXFFAkksPN5WPn23ZAS0AllubumIJ8J+w3heEfy+6K/S9nMIwOYz
	 XZcr2UvixHDm12tn6nJhgMglVdw5pFDCVA/gvGZHOUaRSE+HKoLwNpRgwqm53UdMmkKT8
	 VEV5C3Dej0gy93Bikn0Uu0qTCFurpsX7ofOqCDKumEh0t6/dL3D2kmeQak1ZCs+z8TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhJalj+H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F4606A319;
	Tue, 20 Oct 2026 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhJalj+H
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792461911;
	b=zY3yCuu5wYiCLPIC/oqU5Dx6/Cs2CL8N35MdBe2QA84edhqxZiLQRv732YeYWdd1ljpn
	 tQpG4VIeKhnKkzkzWIJak+L3ONe50QGIw5KdsxW1En3nDRm5AhjR4EcoQar5HKR3YPT2F
	 pxDYIer5GuVX5b5Cpfw7JKNNS9Yqml7rsWtb/NtasO5MWU+DqXQ9IJEXu6YsTyoniUJX8
	 wXDDJpB/zrPeJHwzb31VQLEBAYssPMVWdkTzl7rkki+zqHrptS4WsfOXW1JdvA80LbflW
	 BCoiDZ6IsHv7Hmhysvo3ss5SUCJeZsbDrmY4qslTdEQt/gso27/USoYmS9vdkxAk0Lw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792461911;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eGj39CsSEUy+czLqKLB8z/AHZ5ouwpJVjuwLQbfBmcM=;
	b=aGnlvb1wane3z7QW7HL7PFHrlGmwWRDo0qgZECXs6OQQG8jI6wgn7aky1bE86RDE67RS
	 fXOgF3NyklhGUKTvKHiJkFZYg6bTlBwnTVt1j67cXtyV7GcVoBax6qTbIfO5vSkaeh2kP
	 qwhNnfUgD1LGBr2+WdUQHhsUU367/UuqkXoHkGYhVrX++snt6vyW/BEJHgJz1pnNGmSlH
	 O15dab0p0kwAQB27e9KkvawWuOHoDXYDwJ/du1mwnIrVk2rgVmXg79dKq7+IPp2AIi0Be
	 wffaG3CHnMGAUf6hJIcTObVB+RRmbluvvV6v8/cto/f/jVLCod0u2OXHw8Bo6adjQlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A43131F000C4;
	Tue, 20 Oct 2026 02:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792461911;
	bh=eGj39CsSEUy+czLqKLB8z/AHZ5ouwpJVjuwLQbfBmcM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=bhJalj+HpBmLghByVAdsacSIVxONPrIL31lp3gEkLFygdTrpJZhHFEq2sDdvHOl+1
	 PnKGqjhBc0ffnJjIhJ5RwbqnAuiTOtrZc1RP0MdBYJbYEps0E+PBBPTRefMNDC/OMa
	 AAdnNdZuxBhAtllZ2ga4KQdAxNXRa4hCNZuzo/+ktklQXOtvZ0FwNhd69IPZvcoLqQ
	 JUMU7/BJLDxswkxwwXRHTE8q57suLoP8p1w11LxzQQOYaYDauthOdP7vntvkFyV1hW
	 t0YHFMWb92mwHPjcKu7Ex8DSW+iTcSdUxfY+bfIE74WZ/7yNracdwdefw7mN5hDWuI
	 uLSEVnR0Yy+DA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 213DA406DA;
	Tue, 20 Oct 2026 02:05:10 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] drm/msm/a5xx: Fix GPU stalls on A508, A509 and A512
Date: Mon, 19 Oct 2026 23:05:07 -0300
Message-Id: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhOAUVX3sOwKGWAMUJJCwRDu
 LuAW5cvef/9BQJ74QD3aAHPkwRx3Qb6FIFtTFczSrkxaKUvpOiGJp1nrPsR+xarNCtswqzj7Ar
 bovdcyXzUnvmPw1i82A57YjcaCYPzn+Nuot37X54IFVKpbEyxoYT0o26NvM/WtZCv6/oFp/nJf
 LgAAAA=
X-Change-ID: 20261019-a5xx-gpu-pm-f58bc4ee2387
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792461909; l=2141;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=ww0IS2pCRUm3JGopuPyKyAKswNjkjXYoL6LMxImCPLY=;
 b=FcYj4QkL2ZkDvAG/1XX6YtqZNjPmzKQjMCcPsoJy3GwSKkVWM0lsnLQa6pROcr7rYbeH8HamE
 5jP5k7O8TidDRseXvttzlFya7N15nfc4+p5QZQEoNTAlxi7MQBMDxcD
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

Three changes to how the A508, A509 and A512 power up and down, found
running a phone shell on an SDM630 phone. The first resets the GPU on
every resume: on SDM630, SDM660 and MSM8998 the GPU's GX power domain
belongs to its SMMU, so a GPU resumed soon after suspending keeps its
state, and its CP runs stale ringbuffer contents and hangs. The second
holds a CPU latency request while the GPU is powered, as the
downstream driver does: on SDM630 the GPU stops executing while the
SoC is in system-level power collapse, so a submission overlapping
such a state would stall and trip the hang detector. The third powers
these GPUs down after downstream's 80 ms idle instead of the A530's
250 ms, so the request is released when downstream releases it.

The second patch adds code next to the first's, and the third sits on
the second.

Tested on a Motorola Moto X4 (SDM630, A508), whose board file is not
in mainline yet, on sdm660-mainline's 7.2 kernel. The stall the second
patch prevents was measured with an SDM630 system-level idle state
that is not in mainline.

---
Changes in v2:
- Patch 1: take devfreq's busy-cycle baseline again after the reset,
  which clears the busy counter (Sashiko)
- Link to v1: https://patch.msgid.link/20261019-a5xx-gpu-pm-v1-0-1d0c313a1412@gmail.com

---
Fabricio Akio (3):
      drm/msm/a5xx: Reset the GPU when resuming it
      drm/msm/a5xx: Hold a CPU latency request while the GPU is powered
      drm/msm/a5xx: Use the downstream GPU idle timeout on A508, A509 and A512

 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 21 ++++++---------------
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 drivers/gpu/drm/msm/msm_gpu.h             |  1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c     | 17 +++++++++++++++++
 6 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-a5xx-gpu-pm-f58bc4ee2387

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


