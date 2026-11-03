Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740266;
	b=R6KD9QMCkSSGWkdsFBFkw7rvpGzJs6E6o5ywtfixzKlBQ3K4D0E6vm93mqNPB9Dfo65Q
	 vTofiukAPVVvqylkjgx2CZEzmHQmY8uZwDwIJHcOkNpcvORNtXjA5x4Qg8VuztvaTtQCB
	 J7QEo7TSJnyR2vBTqp8lo3OY7B3YFBe3o8eIoBMJ1aszPkQBya8SL6EJPwMAQzI3y5a4F
	 uPSzOW9KX3/ey3MQwKshChoVAGTLzYyFA+cb5yKt7QprTINdEzU/yY61K13/eH0/34pCK
	 9IkW5l+MRCklc0aUK9sDHJDDCIKvKafyrZKQW74MH3L1PHGK9OWlz4zjlBnY6NPVxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740266;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=PC+uKBIcdJkzvIhsvx3tKh7Xa7x6D7xHwxZ5QiNNmks=;
	b=3jJtyVf9Do1G0BcF25HUI+OGWxgstboCpO8igmDtDBQ4tFndN3Kh/bLns3jZ69LdYejC
	 rIawper2BDXrK/MPb2yBA5xjNW4f3ALF8kSbj+mNmgNYvDQTxHkInr5F6I3jUSAqoaSHG
	 doggadIqpJTkyayRfQ84bvQ8EmvBLBS32pgtpPMdLDzKrPGwznCkuIY1DfmggO4YiO1zb
	 i9iN/lEBsV8veI0MLgulspA19r7vhMTG5wB8zr15t8DVkPFh9dj/8IO14A7Mpb7m73m60
	 LJV2J1oPp+JtY5q4uFCy4WAJlkbi/LS8s22jOjr4ttxoRF/WIcuM7bJw7EItigyUgPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rh6YMs3n;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C4606D824
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F34C4606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rh6YMs3n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740263; x=1793999463;
	bh=PC+uKBIcdJkzvIhsvx3tKh7Xa7x6D7xHwxZ5QiNNmks=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rh6YMs3nPjXTROcNtd69fcTIWvOs7ZejQVGsa98YYoJ6URBI75d/3EyCqhWMPBqHR
	 MORQIH/a38nf22wSksAOHLo93mu+GnQyCBJhk4gMKcX02fc0m9iHM+KxkvZNK9Odpj
	 ed5kvDS96Biyp+QruFUWIpOco1NrDfVMCcIpOdAasn/1FOfJJTUPTvSI9Sbq7/cNbo
	 94ua5eRHJwYoN9rRV24QREl1zOP7dZNvNoStklQmBTIqoPR+LjWNvPn5p9YqW+g0sl
	 O1VxlEZOzGHlkbVllb7C3hdXDflObD+BGBqUkWpLIx40xkBpJTzH19DYL66urezv59
	 Gsy/QX7H1jEzA==
Date: Tue, 03 Nov 2026 21:10:59 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 06/11] media: intel/ipu6: clean up fwctx on ipu6_fw_com_open() failure
Message-ID: <20261103211031.1573726-7-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 3aa6b63bad2e477481941db4a33c95b77b213181
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
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
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


