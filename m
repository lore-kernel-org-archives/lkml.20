Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785356;
	b=TUKN/LWuQyRXbfrYKmkamwgqiO9FvzLsOkfhLpZbLBcAgFWxjkM2CYDmDzAM9Nboy6ez
	 6NxGffISy5U85mlDuuM6qBPOEmIQVTPbPTJTQSCCqqfpLpKBzpLI8qC6DFxc6mW+i40ww
	 3ML2AZuUWNeJe7SFt/bNsNzZU/flx8Tn00HS3EIE6xpynVAlkeCKy/IfJVxNWBh2KySiS
	 G/raZf2pBRlMGtV1PsoflNLyCcgSKBmpdC2NiZi4QkmXLY0qk9f89g1Y5Vt6slaPEO6MU
	 7fcCyTfeaVELycQc1Rqd6OsaJYqqDp9HsV/r9vdK3+nyiTe0hJHHbxZpxM056SfurHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785356;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=yW2cg5jvxZEB9rQ3JlWbnr0xW2iaxYeazAqhP4FPfYM=;
	b=pCFzjjwLK6GI1H4bbcJ4VWug9lCUVAQApikeXxsI0U8igF+9QbTnBqWseezwW2M+pM30
	 UrUIdYkiGxjHbzzpr/JMU37LhpbNPOmFeKTQxJ21FZdpA2BDfThPQv1ndmDXwDjC/7ymV
	 9nLAcbHziiV+4sbcB76bbDVMLMbS8d3wJKsatqhRs8IjRFGGvMmCVFk44lsCyY7FDK7HF
	 jNN38lBTVXRNP2G6HGHF9JYBzayNA4GG/f3tuVUYUmHAk9QGXhDXIXNPj9iReXHm3S6i3
	 KfgPp7tpHzVBKIKpkD9/4WSwx/rVguTqVX5SMIZfaPnZivsYniwAB56Bw4Epoj1GDSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ZgBITB7w;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5165606A905;
	Fri, 23 Oct 2026 19:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5165606A905
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ZgBITB7w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785354; x=1793044554;
	bh=yW2cg5jvxZEB9rQ3JlWbnr0xW2iaxYeazAqhP4FPfYM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZgBITB7wD8Ybt8gI7Ow33VyGt9IS+ebDk+YTGxIsHMA05xe8r9RFobu22l+Qtaqvu
	 po17D/PnlN0TGnlOrHJ8lBU5axXMMIJ8SzPK0fZ9VpswwR5xVN5V+OUZVHEnLy2RQz
	 Qc+/OvZKRZj+k99x7ausB0vkRj5I1GduXk6T8C4bhglfLrybtBiGys0PYdyfkTRl0D
	 NTOZR9JMpdUxxF0muxAIjB5Y/p9PkpPO7hILZqRGueHSrs2WS6vCLsF5WeRJgYRNnA
	 astyFUhRAumDyxYN9QNyWBI0zzaYyqd/qeJP+5j6XiO8QxYTt1QFaCQLCj3DgJyR/s
	 Zx83O1PJUGMzA==
Date: Fri, 23 Oct 2026 19:55:51 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 06/11] media: intel/ipu6: clean up fwctx on ipu6_fw_com_open() failure
Message-ID: <20261023195446.22578-7-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: a9cdb72b98821508fe4224e4f3d961f7cc4b1c68
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

In ipu6_fw_isys_init(), if ipu6_fw_com_open(isys->fwctx) fails after
ipu6_fw_com_prepare() has allocated the syscom context and its DMA
buffer, the function returns the error without calling
ipu6_fw_isys_cleanup(isys), leaving isys->fwctx allocated until the next
runtime resume attempt cleans it up.

Call ipu6_fw_isys_cleanup(isys) when ipu6_fw_com_open() fails.

Fixes: f625e8d7ffc1 ("media: intel/ipu6: input system ABI between firmware =
and driver")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index a36d64bcb9..5d95fb9234 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -350,6 +350,7 @@ static int ipu6_fw_isys_init(struct ipu6_isys *isys, un=
signed int num_streams)
 =09ret =3D ipu6_fw_com_open(isys->fwctx);
 =09if (ret) {
 =09=09dev_err(dev, "isys fw com open failed %d\n", ret);
+=09=09ipu6_fw_isys_cleanup(isys);
 =09=09return ret;
 =09}
=20
--=20
2.56.0


