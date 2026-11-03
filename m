Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740256;
	b=1tzV2FcjffMtoDELTILn0pEuCfnzZnKZk5HYEVmAkWsO+kwOqEzeosQFcj2/L5KavYQ9
	 jIXan9JnE1ejwg8dj/Sjs1yNBD768YYW92MTGK1A7k29Mou0wTQmkVpWYNau9tA6olu0B
	 3sI37zdlvyGRTWC8wbz2bgStUWCFb+lSGsJrL8ANYeIg5hsuzbd1nxQL9AwZg+U1sJuj3
	 56UVfB4OD0wy1yPRdPwJaUz1zSVOWVZm9Psb3tJcYQlUI88TYaPrMHJenAo36VsF3nkD+
	 6WCVez/GXKSqOjf/MlVjQMV8EeuoLzWju1W2pmR12MgSnOWO21W1YExAlXFr+a0AWFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740256;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=41vgPbCEbDbBepgZTq8SEpgvXyn7f7xFoxfkeeuQ75Q=;
	b=YaVmRA9sv1H/vJjTls+WY2xLpOb49X6/cxkxkLD1QAuDS/bsqDtH/A6867QYHcAmQWol
	 wWBF9ooSYSX5DNwc5uitA+wLzpGiceqT0GWTHy2y3cAT0BSx7hwT5S+4pD9eRBN4zd4QQ
	 S7wE/MddPqo/KguvZxcwbW8MvK3B+Esp2TdJwJ6PEFBDR+dcp8ngGrUPP5A3BuUwQ2h+F
	 lMSX55bdeiyhW8/pNIx1/6LlFd4C1Bv3xz5jKdS6Oq3zTSMwt+rta/c7ECBSWh5Sv5VWn
	 26j3J1WdqJxl1/X0QydEYdzXToE3QrpS2Sl2MQPmFPNbcQyAzMSgT0ISoMDnxjSIhpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=gFcCmA1c;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34A606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F34A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=gFcCmA1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740254; x=1793999454;
	bh=41vgPbCEbDbBepgZTq8SEpgvXyn7f7xFoxfkeeuQ75Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gFcCmA1cChvdriRNntaMo4zvAo+LhGs3ih4cGntvSBQ5G9eW3BNxO6XF6Kjq+KgpV
	 zI5CSwcoWVAw0Cq9yv0LIdsg1k9Tbv6VV2L+qEKK9qqG7qDLBti50lMXdiKUMdYXlA
	 DAb0/yPJqDPdO0hMFDqfHkVLl9bPDP+hyN0EE0NkBMl6ZFTLzNdi9gEoV3ad7LhRC3
	 YBOCdI/qEFKJRoiL+VdZ5OmBEsDBl7piYab0kPJNtrrz19350+AcW14+pnrHvNtwaf
	 4ksyQ0hrUKuNHTmqQ2A/HpC+I3hhsJl9Xxkm/t65dTjDd1pr65Kza1a5K4U1mQAxcZ
	 sJD2YGYaarc3w==
Date: Tue, 03 Nov 2026 21:10:47 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>, stable@vger.kernel.org
Subject: [PATCH v2 03/11] media: intel/ipu6: check pin bounds in ipu6_isys_fw_pin_cfg()
Message-ID: <20261103211031.1573726-4-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 2eaf51f66b4a68faa360c4383238c399f90ab193
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In ipu6_isys_fw_pin_cfg(), cfg->nof_input_pins and cfg->nof_output_pins
are incremented without checking them against IPU6_MAX_IPINS and
IPU6_MAX_OPINS. If more video nodes are attached to a firmware stream
than the firmware ABI supports, the function writes past the end of
cfg->input_pins[] and cfg->output_pins[] in the firmware message buffer.

Validate cfg->nof_input_pins and cfg->nof_output_pins before
incrementing them.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffe=
r queues")
Cc: stable@vger.kernel.org
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index 56bb67869b..a36d64bcb9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -778,10 +778,15 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_vide=
o *av,
 =09=09ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 =09struct v4l2_rect v4l2_crop;
 =09struct ipu6_isys *isys =3D av->isys;
-=09int input_pins =3D cfg->nof_input_pins++;
+=09int input_pins;
 =09int output_pins;
 =09u32 src_stream;
=20
+=09if (cfg->nof_input_pins >=3D IPU6_MAX_IPINS ||
+=09    cfg->nof_output_pins >=3D IPU6_MAX_OPINS)
+=09=09return -ENOSPC;
+
+=09input_pins =3D cfg->nof_input_pins++;
 =09src_stream =3D __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->in=
dex);
 =09fmt =3D v4l2_subdev_state_get_format(state, src_pad->index, src_stream)=
;
 =09v4l2_crop =3D *v4l2_subdev_state_get_crop(state, src_pad->index, src_st=
ream);
--=20
2.56.0


