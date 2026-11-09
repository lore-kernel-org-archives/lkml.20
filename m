Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794198073;
	b=MyHsxZkHhkakUjz+kobjwea6nu26iz4D5lsSg81TMZ4F2oWriLEZg0vTBifOd+ezFFHl
	 xfD14TSBtx7Ikw4zGakDgQ/Ym1VDPxgHJ5Qet09mQKjEkTMiLzyN+D5XkWQA3ZE3/bTG8
	 Z4MEI+Q6uJBbkU7CawEXr8BJ5LvHJa8HrJTF75AnqVw3WDSR3gS2wZImGfvVbiLw/OXqh
	 OzjYYZL2A8gmhJRZGXkhqnD07MWs9nvtZnl1ebxcDA19E+Mhk4DOiGSEnabHAL+UFcAfS
	 YVDdbmrd7lJSaTW6tMlhqFGy2+3ZgOOOZe6aNMMe7zD1/Z/c6C+CBb/EBu7RKHkf+oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198073;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O2b614lVVeTj7sfomvIqV/r5J9Ys4n/Jig4zWu2KTc8=;
	b=qUMG/vAuLI0qg8gXkEN6HRk+qtnM7SwNXfRM+DpVzIEbfrs/HmnDXa3+lEHxVXE2/LDt
	 uXHuMtH/98AZBLshyUb2UmWzzWd4HOUTdQVx8bPLegP9o3NI/GsfRrmNuP9z7Dcraz3PA
	 aHyISsSIxij8w6Ma5wVmIg42pbSzO/ZFxCtt722mk8y7WddMqhTYjd/mkXI0idEivF0Oy
	 pLvs9x3XsjNf+DsU+PEojBYNfY4WQF2AsTf/BTvwOCJ+Dczhb8aBKeW4dCmwhqMjKSixQ
	 aJhdoMF0G/hXKcD1e5NLrzh6emJQ8jRVsyQ8+tFKRj0yF6SvZTBzpleMVZavcGnjoTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q1Ssqn7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF2E606A321;
	Mon,  9 Nov 2026 04:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q1Ssqn7z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794198072;
	b=x9cMbgdEmsvVNc2jNvszdlBAm+0ebAUWuQUvmVp7UsengWJMfO3baSa+EkV+tFD1vYVi
	 nciyTOyaJjeN3ZI2jMB7kXrNOWkkR+mLuc3L5T2FMyMUMve7mBWwmEcTK8VWmWRCNo+3a
	 iiyKzxYuL/ZyE4cGVZKjktDzREmoKuuzGsu08EluEcmHXHTY4L6QorDK7g3FCUJvJ/bb5
	 b/ZrhjwyAtlnWEsttZT/vw6R11VqZd0qaL1vT8JNYf8hCodPJsvBgoTZRunMiaCc5UUcp
	 vWymu1I3n8LqT1OqzDjySNuY7j8PVxeZOhjYR2fED4y11J5Z/0e4GyQtPxtazc7IaZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794198072;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O2b614lVVeTj7sfomvIqV/r5J9Ys4n/Jig4zWu2KTc8=;
	b=Xs6LliX8T6dA/oMMhnWgS95VTWMGNhIFQzPNifqEoV68sgNVa0k+mqlapAK8iwBbB/hj
	 UhagLEIx9hcfcxCDE4FpkMNy3XXNORxEg2w/WC9eOqiDPMdE9u4wtPEJsfEI0p+HsFx9m
	 A3usCAon3RxY0qmyeZh+TApufCGvLZhNLy2vsdQsHdT5uhr6Nf7VH2bjUgh7rqACMSspB
	 +C+TB+QgfVCmNxmxx+7omp5jE98+nW2esMhLR2tubFIyFb/qvsuSxIKUCDADf0tm52slw
	 /Lj1tanW394G22M7UtHcJQqL/529pZnqOnxM8ijb8YakS7U3N+b8eJPfBKjC8WwCZmg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 292DA1F0089F;
	Mon,  9 Nov 2026 04:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794198072;
	bh=O2b614lVVeTj7sfomvIqV/r5J9Ys4n/Jig4zWu2KTc8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Q1Ssqn7z2GzM0b3l5hy61CH3vn/PvTskGpFqlayamhkd3n0Lr2JioQRnZ1odlo0Lg
	 DRQ5RlBczJh9Y0Y7AAh4aF4zX7ghhTY2j/06Gj3nS/5rssgbwhXIUzt9o8aPPMmLt+
	 7LNEnD/hKQN7rBkzxN6yGlfkL0RcWpiFEtD9mh5xgR5RjY7Y9HAuK86cQv0MoOhf26
	 3B7QizilD2IsKTwU25F/NNqEKqcTIxp/CDSIvvz4083cdWEZfgGXDWtA2OJ4VfH/9T
	 P8Q+h3+bGjXD/etglq6BD2YOUbP0pVgpX5ZxTovXtM21wZWbeuC8FiI7kmJMHNrY6U
	 voAPHSdlIM88A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 75BF048290;
	Mon,  9 Nov 2026 04:21:11 +0000 (UTC)
From: Ivan Verbovoy via B4 Relay <devnull+ivanverbovoy.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 06:21:11 +0200
Subject: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
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
Message-Id: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNL3eLyolzd3NzMfN3MokLdFAtLM3ML40RTk5REJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaADAqLv5xAAAA
X-Change-ID: 20261109-swrm-mmio-irq-d896783a54da
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ivan Verbovoy <ivanverbovoy@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794198071; l=1798;
 i=ivanverbovoy@gmail.com; s=20261103; h=from:subject:message-id;
 bh=QD1XMeeWI7Z+Najg0/8tSfdJNHSFsUN6oXfbw01Un7k=;
 b=dyI7A28T5z0Pxt+gEo/x6FzCwS21fQFt9sHAz0v7PjOVIHBrMtGeSaaxFP6JY1DD21QwNFVtf
 vZPEuFileqTCciP7rRaDs7T/qXhpT/vH1DtEUbqskwok039s09bRimJ
X-Developer-Key: i=ivanverbovoy@gmail.com; a=ed25519;
 pk=0AchqTH1hJFToIUeFfQRlVzzuaWQDs4e75SxT2y3s8c=
X-Endpoint-Received: by B4 Relay for ivanverbovoy@gmail.com/20261103 with
 auth_id=1396
X-Original-From: Ivan Verbovoy <ivanverbovoy@gmail.com>
Reply-To: ivanverbovoy@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Verbovoy <ivanverbovoy@gmail.com>

Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
qcom_swrm_init(), which its message does not mention. The enable has
been written for MMIO controllers only since they were added in
commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
master devices"); a controller inside a codec, reached over SLIMbus, was
left alone.

On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
the amplifier no longer enumerates since: "SWR bus clsh detected" at
boot, "link failed to connect" at each resume, and every stream fails
with -110. With the check back it enumerates and plays again. Shikra's
controller is MMIO and keeps the enable.

Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
---
 drivers/soundwire/qcom.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 147e55b7a600..99c1b6398894 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -995,8 +995,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 			0xFFFFFFFF);
 
 	/* enable CPU IRQs for the selected EE window */
-	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-			SWRM_INTERRUPT_STATUS_RMSK);
+	if (ctrl->mmio)
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+				SWRM_INTERRUPT_STATUS_RMSK);
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-swrm-mmio-irq-d896783a54da

Best regards,
--  
Ivan Verbovoy <ivanverbovoy@gmail.com>


