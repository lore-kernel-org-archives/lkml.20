Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0352636197E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066864; cv=none; b=cr2Qv+OROrP3NrW5/l+XLPCpqkbgpqKqQzQSJnlaP8nF840Cde/RlSYE8ukhFKDRpmOBOMz0kSzgYjh0BVFsfGrBiJ/Xaq7p2DqVmDNJmq9nnFsBFufEFSJ0svbwrNtyLVF1Ie7PnwQezpalgMY13j/c/wsi5zJu7v7RXnCucXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066864; c=relaxed/simple;
	bh=MZsKihnsh42z+NzLFhgoVBvRi5WxBMJgFXfhbbvqljw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKfMdRuFRYX6KIX5P1+wG/OPbU2HqN4i5GorBm8sVwzUQLP6KEzwM94Wt9kXpVPk3Z7zuCu7ra9cj7f5BNcPpvZA1XSYaxabS+050LA5vxhvUPd9ojMiJ3KPuLQUqQtr4GjudiCslWvJqfQsljSdB6q6R80R7U2GHHrIOo+6huE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saltyming.net; spf=pass smtp.mailfrom=saltyming.net; dkim=pass (2048-bit key) header.d=saltyming.net header.i=@saltyming.net header.b=YZ+KCkfI; arc=none smtp.client-ip=152.53.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saltyming.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saltyming.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saltyming.net header.i=@saltyming.net header.b="YZ+KCkfI"
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net; c=relaxed/relaxed;
	h=MIME-Version:Message-ID:Date:Subject:To:From:Content-Type; t=1791066861;
	x=1791671661; bh=gJau9VyDPFgEfF3hH7ONstNvxWwbZ1HYDG0FOVTR6EU=; b=YZ+KCkfICz
	ZhrLcM9b/+4FF7pyL8hfz+WPtGIUcDb26lkjrcwxqVKnhZSmw49zHxSmDl8U9zUWJv+huxj5UlV
	aYk3MDMwwLuJ8RU39aCmpeSPzFBk+C3I5Fs2H3Giz5+LW/PfggjVo1MWO6NsBR7WV/eHg+eLCVB
	IR6IYHkvUOXENcNLTdH+g2Bcc/VLk41loPUOe5DZ0Kl2Fe3M3FQhghJJP6/9+eszxsTvDD3eFvw
	4f4826VABQI1AQhl6lIFHb6UACde88WxIhMceQS7bVw5BxfPmbe51Wu8/G06yUOtCQrkWLceqsm
	ErftFwd1BW0bY/6XJnRvInSAajjIHyfg==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256)
	(No client certificate requested)
	id 424a49ec-2730-4e9c-97cc-b10e1a25fa10
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 22:32:52 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none, av_clean, ham
From: Hamin Sung <hamin@saltyming.net>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Yonatan Maman <Ymaman@Nvidia.com>,
	Gal Shalom <GalShalom@Nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>,
	Hamin Sung <hamin@saltyming.net>,
	stable@vger.kernel.org
Subject: [PATCH] drm/nouveau: request a privileged CE channel only on Kepler and later
Date: Sun,  4 Oct 2026 07:32:44 +0900
Message-ID: <20261003223244.63133-1-hamin@saltyming.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy
engine channel"), nouveau_accel_ce_init() always asks for a privileged
channel.  Privileged channels are only implemented by the Kepler and
later FIFO code, so on GPUs with a copy engine but an older FIFO (GT21x,
MCP89 and Fermi) nvkm_chan_new_() rejects the request, and every boot
logs:

  nouveau 0000:01:00.0: drm: failed to create ce channel, -22

On Fermi, TTM then cannot use the COPY0/COPY1 classes, which are only
available on the CE channel, and falls back to M2MF on the graphics
channel for buffer moves.  GT21x and MCP89 create their copy engine
object on the main channel, so there only the error message is visible.

The privileged channel is only needed by nouveau_dmem, which requires
Pascal or later.  Request it only where the FIFO supports it, and keep
using an unprivileged CE channel on older GPUs as before.

Fixes: 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy engine channel")
Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/427
Assisted-by: Claude:claude-opus-5-5 sparse # max effort
Assisted-by: Claude:claude-fable-5-1 # max effort, review
Signed-off-by: Hamin Sung <hamin@saltyming.net>
---

Notes:
    Tested on a GeForce 310M (GT218) with 6.18.54: without this patch every
    boot logs "drm: failed to create ce channel, -22"; with it the message is
    gone.  Both kernels report "MM: using COPY for buffer copies", as GT21x
    creates its copy engine object on the main channel.  I have no Fermi to
    test the M2MF fallback described above, which comes from reading
    nouveau_bo_move_init().
    
    Found while setting up nouveau on that machine with an AI coding
    assistant, which also wrote the patch and ran the tests above on it;
    I have reviewed the patch and the test results.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2c7077a49888..ddf6fb74f85a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -337,6 +337,7 @@ static void
 nouveau_accel_ce_init(struct nouveau_drm *drm)
 {
 	struct nvif_device *device = &drm->client.device;
+	bool priv;
 	u64 runm;
 	int ret = 0;
 
@@ -349,7 +350,14 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(&drm->client, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	/*
+	 * nouveau_dmem copies need a privileged channel, but only the Kepler
+	 * and later FIFO implementations support those; older ones reject the
+	 * request.
+	 */
+	priv = device->info.family >= NV_DEVICE_INFO_V0_KEPLER;
+
+	ret = nouveau_channel_new(&drm->client, priv, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }

base-commit: bca45af5998a05f34b13a2ef11e639bac9c62643
-- 
2.55.0


