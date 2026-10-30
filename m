Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392095;
	b=f6lCV+YFWWeyGztqoST5D1pz+tk0+ngJEEUllYmAyK3S4+VpdRMC/Ya4y6RIP+Eb+ahu
	 mZ+qVSfQFrIc6x9ycFAX6HItDGI1wNrfwsIYbyulVEjx1HXIyO10rktOz0n63HBSaLpAJ
	 DOE5uYadpfzQNSwfudVV3+Ii/XDlavxvCM5tuyEtgCR81VDVHFwYk95+w3+TrkNmxDBSH
	 81e5uFDbz9KmcYDk7bZLsayM9SzNSCDpxRUdEIFKXTvp3uSKWVQrt5HmDrAfBDgFTcQS9
	 XhF251kHNt13JEj3OH3WGc2ljQn9rUlSl6qdkhYXTMXT0hRsWuBPf/uCq3+eUoUKf6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mL5Q/qru/61qA3CeBuTxFCjV0LvdujInnspbH7ZeU+E=;
	b=Ug5P5D/KBx1d1qyP4yshyiWdQnBz0q65W8sWL6QH09gbyuRCdNPAT+dYVKnO74cvgZdF
	 GIeHdFhJwz5ZDdUqMWPPXJxI6kVq0HLiQzaIDwDrcowPpfuvU4IqxgGRpoCzQXeKoLIWx
	 BEbi6AsLdwUehVX857DvIxoeC6zYEcPmS0XitXI0vx6/VM9iqGQrnXrvhZrf5Tj3uwhwK
	 rJLyPh+CDkVe/PIG5zW9LDeZUxC25mGaywAGcmipP+qDEwlHKR3qwRWkz0hNKVWLZ6JKf
	 azzJvUQNUf7VJ1G317F/j1P9IkjphZVBfUbXUab9YmvnYef55+i9DvldvOqP0Ri6AJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVqsV7fn;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36988606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36988606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVqsV7fn
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1947187eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793392094; x=1793996894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mL5Q/qru/61qA3CeBuTxFCjV0LvdujInnspbH7ZeU+E=;
        b=fVqsV7fnRLORtmNrhys9b+TantXua01zSuSpB2Y7bHGlXwvjWU4Qn8XIo1kMk//U7a
         2oFupwHlTdGxB7FLCJkKNLn6somUoNpexDHXQMvVjYymZbkcK/Cwufp5CN/neeRgbH2l
         RbO4uZgXHR3qlEGRjhA529T4ZL2zMkPGjqowUw9fyxCwHJ0w8TuVzkDUv9hNf3pdo1MZ
         LKyO1E84nMpV8VRTF5s3BA53DTawdU/oTTFOH8hGH9ELc+FZhjPyX6wsflUUDL4gbKpO
         gZWC+zXejGUiUaj6ELKwWDaRwuMFX+j/QFAn4gNpbaLqexQGeUlO4wT/h0a3r0AktP31
         PLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392094; x=1793996894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mL5Q/qru/61qA3CeBuTxFCjV0LvdujInnspbH7ZeU+E=;
        b=N6Gr/CM4uSY3NBj/Qek8ufMon+IMIik/S1cnHzYJTZsjynVvDYODtt9r6D3DP0vgp2
         bkAZSBeYiTseD/YHQYSbQ8JVqNh25Ey/Sizt2LuG8c5I9hFvT7ogaNJHkvFFtamH2izj
         rwnmyFgXlGsw411WW2Qdsdb2mqwGconhaOEDb37KZl06uiREHdEDovbq5xtEUaocQg+V
         /LaG47WThGj4qWelPFYmdlS0Ap1KVa23cIEUouVap3FWDQ6JQix79slITcGcy44MZh0p
         ag+0YJo9gfTyjcsqLFgN35UKNlzKYf3NH/rOk41bOIVYtY5WeJoler+Mt6rqLSLWOjyD
         CZjw==
X-Forwarded-Encrypted: i=1; AKwUvBw43BJCgNdVRt8jflivEtJLAtyxiI400242NMet9IH7f03VMjkXUzpQyFs7fZQBqxhY+u1szIwaROBWhNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdHhgStsGNICtbZHbBuL/+ZteMY++mcpgs87mN+m2UAEDWzj66
	wad2g0CqCVNBI3OK1sY825RlNXxRyBEq7LIzCI41f4fFQ/4fzrwzlLcD
X-Gm-Gg: AYBFou0+eWXMC2V3+bcJqcdQCG7l6DlIs4qub9dW7KrBEbJqK62XUW7I6CqbeuPoUxA
	pPdE3ArXs3nI/50SxGiCWt5SiFefsHR77y311oEOgajeH5MSLf/sw2H52AN+88Guqj1IIAaEljM
	yvbZ+fUl3v57xrHI/ruCFaAtMUEvsh+TRDj2SmKR+zUTlTVxRTPs3xZzCgeEKodavz1bK4WCc+Y
	sDZT/ILm1L/Xn4vzmFODO/2jSR+y2eYj3a4jRjGMCo+rnVigwZX3H2f/pnvSvBvmJafqYUXOkey
	haW/QpjBWWHqh463U4iz8JEov0GP+MjtFx/5ref82bql2t4McVa11iYInCncs6CNXLKUmbK4n0X
	/Ng0nV7QbCmo58dJrzzdMy9h4aL2/6Kt4cNOETc36urSvZ/VPBmSU8KNlkxiWSrxh9NlWwhC7qM
	bKExZR/rQTp4yg5dtUFV+HdcTvxd6cy8kt3voNj1CXfXe0dzQJrFB+ErEIsqOosk4loxC9Jm9SD
	ICSnyHenzSR5Ma7Ltd8k7X36tXh/sptz5F2dS0WRNhITzcZGzP4iPD5tmm4OaUggoW1A65/LBpJ
	QlCuo+i/R8hEpe0Xb2WLzQAszu0klZSxfmvWe0E=
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr4738625eec.38.1793392094038;
        Fri, 30 Oct 2026 13:28:14 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm10976489eec.22.2026.10.30.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:28:13 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Munique Feitoza <muniquefeitoz4@gmail.com>
Subject: [PATCH] drm/nouveau: Fix CE channel creation on pre-Kepler GPUs
Date: Fri, 30 Oct 2026 17:28:09 -0300
Message-ID: <20261030202809.28723-1-muniquefeitoz4@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy engine
channel") changed nouveau_accel_ce_init() to unconditionally request a
privileged channel (priv = true) when calling nouveau_channel_new().

However, privileged channels (func->ramfc->priv) are only supported on
Kepler (gk104_chan_ramfc) and newer FIFO implementations. On pre-Kepler
GPUs that expose a Copy Engine runlist, func->ramfc->priv is false,
which causes nvkm_chan_new_() to reject the channel creation with
-EINVAL:

  nouveau 0000:01:00.0: DRM: failed to create ce channel, -22

Specifically, this affects:
- Tesla GT215 (NVA3), GT216 (NVA5), GT218 (NVA8), and MCP89 (NVAF)
  using g84_chan_ramfc (GeForce GT 210/220/240, 310/320M/330M, etc.).
- Fermi GF100 (NVC0), GF108 (NVC1), GF106 (NVC3), GF104 (NVC4),
  GF110 (NVC8), GF114 (NVCE), GF116 (NVCF), GF117 (NVD7), and
  GF119 (NVD9) using gf100_chan_ramfc (GeForce GTX 400/500 series and
  Fermi-based GeForce GT 600/700 series such as the GT 730).

As a result, drm->cechan remains NULL on Fermi GPUs and TTM buffer moves
in nouveau_bo_move_init() cannot use the dedicated hardware Copy Engines
(COPY0/COPY1), falling back to M2MF on the main graphics channel.

Only request a privileged CE channel when device->info.family >=
NV_DEVICE_INFO_V0_KEPLER.

Fixes: 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy engine channel")
Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5e1336615..0a15f1281 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -337,6 +337,7 @@ static void
 nouveau_accel_ce_init(struct nouveau_drm *drm)
 {
 	struct nvif_device *device = &drm->client.device;
+	bool priv;
 	u64 runm;
 	int ret = 0;
 
@@ -349,7 +350,13 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(&drm->client, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	/* nouveau_dmem copies require a privileged channel, which is only
+	 * supported by Kepler and newer FIFO implementations.
+	 */
+	priv = device->info.family >= NV_DEVICE_INFO_V0_KEPLER;
+
+	ret = nouveau_channel_new(&drm->client, priv, runm, NvDmaFB, NvDmaTT,
+				  &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.56.0

