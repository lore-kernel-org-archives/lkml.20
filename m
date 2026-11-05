Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843151;
	b=GaBtRKFCxk8Ze/MkzM5f0XxNe+/ZKAIbnFbLCqkviNTgcu+blAdAfxp01C51xY+Fq9zF
	 pIxq57Hn6On7nJVZTcYmbVN4IeyALX3pDQ4QPodNzcacguLPiaziZzvDyrCy63UWSVhbi
	 rz6Y8bwEhXhpxt1/6l9uWK4128/L/lc27i62iJMeYYCA0chV1l5Z+3BZ3FpOqEwlRNqKb
	 3SlxHbhCdKI+bCEtVGWcoYffys0cXEO3GjXCrrtDgMCu7uQqPU+K9DhTLrQBbP8Rj0aC8
	 OrhwwIlgT1hrq094uIAqGHqP9/8QikF5qkn0NoOrOzbUhtqSbIFM4GsgZGszcMFBlhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843151;
	h=DMARC-Filter:Received:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:Thread-Index:Content-Language:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=DEhtPKvaPfer98HDB/+YfltTs1IatZZughDbevQu6YM=;
	b=BY2Asv8UyIjqzWkyeEp7130UctkCJwjzY5Oy0Egs9CbiqYRqbBlSyUyib16CHZ4XDARg
	 w29rVOrW3HE7XyUQhChX2CcsjtxY3OtUAjcszfiWe7a36DdfdiLAA+k21Z5fFTtEEUxmj
	 KGTX0HyvZT71ftKnREF7u9doOGtcLMAn2BJu2a7IFmKv9bkp/K4g5qy6/JoLT89dmzGgB
	 aetNZhzcypEKqS5nCMq0qyM4UXI/nz99IEHy+lLcWqHaxlBMIA7AxiMA63lqlbUYDDhDh
	 LvmzTuNYUemAfB8tfDoFi3+Zm1KPEgSstgWL/PtYMd7TU+i6d5F2Dne8KYXoUHWzJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=EOK+gFUT;
	arc=none smtp.remote-ip=103.209.128.44
Received: from mail-m12844.netease.com (mail-m12844.netease.com [103.209.128.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A229B606A31B;
	Thu,  5 Nov 2026 01:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A229B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=EOK+gFUT
Received: from Wangqianghua (unknown [27.38.136.171])
	by smtp.qiye.163.com (Hmail) with ESMTP id 538ba163e;
	Thu, 5 Nov 2026 09:45:38 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Aryan Sinha'" <sinha.aryan03@gmail.com>,
	"'bo liu'" <bo.liu@senarytech.com>
Cc: "'Mark Brown'" <broonie@kernel.org>,
	"'Liam Girdwood'" <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261104150155.33157-1-sinha.aryan03@gmail.com>
In-Reply-To: <20261104150155.33157-1-sinha.aryan03@gmail.com>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:_=5BPATCH=5D_ASoC:_sn624x:_use_de?=
	=?UTF-8?Q?v=5Ferr=5Fprobe=28=29_for_the_regmap_fai?=
	=?UTF-8?Q?lure?=
Date: Thu, 5 Nov 2026 09:45:39 +0800
Message-ID: <004901dd6cc7$5d1d5cc0$17581640$@senarytech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIVECT69IlxfdJHo62NjHEsqVRnULavbZCQ
Content-Language: zh-cn
X-HM-Tid: 0aa1a9620e4909d8kunm55e2c912451fab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTB4ZVhpIQkIYGk8dS0geTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKSE1VSkxKWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=EOK+gFUTd/5WmQB+MINFW9V2f5jS3NO8+U9n0Rwph8XZoCg9weMu78hXXrXDrDfET2J4515AfQAZlmrGEWit6+j5O7iLJNkiWFgaMVpYmqhP1/DMl6tz0O8WxDLxMMz/Dp/489604vExWn1GSnZ1cuavquJBHZ+bBmX4O8vI2TU=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=DEhtPKvaPfer98HDB/+YfltTs1IatZZughDbevQu6YM=;
	h=date:mime-version:subject:message-id:from;

On Thu, 5 Nov 2026, Aryan Sinha wrote:
> dev_err_probe() prints the symbolic errno and stays quiet on
> -EPROBE_DEFER. ...

Acked-by: Qianghua Wang <qianghua.wang@senarytech.com>

Qianghua Wang

Email: qianghua.wang@senarytech.com
Website: https://www.senarytech.com     =20

-----Original Message-----
From: Aryan Sinha sinha.aryan03@gmail.com
Sent: November 4, 2026 23:02
To: bo liu bo.liu@senarytech.com; qianghua . wang =
qianghua.wang@senarytech.com
Cc: Mark Brown broonie@kernel.org; Liam Girdwood lgirdwood@gmail.com; =
linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; Aryan Sinha =
sinha.aryan03@gmail.com
Subject: [PATCH] ASoC: sn624x: use dev_err_probe() for the regmap =
failure

dev_err_probe() prints the symbolic errno and stays quiet on  =
-EPROBE_DEFER. The sn624x prefix goes too, dev_err_probe() already =
prints the device name..

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c =
b/sound/soc/codecs/sn624x-sdca-sdw.c
index c9e690482..1a83f0a11 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -1736,11 +1736,9 @@ static int sn624x_sdca_sdw_probe(struct sdw_slave =
*slave,
 	regmap =3D devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave,
 					      &sn624x_sdca_regmap,
 					      &sn624x_sdca_mbq_cfg);
-	if (IS_ERR(regmap)) {
-		dev_err(&slave->dev, "sn624x: devm_regmap_init_sdw_mbq_cfg failed =
(%ld)\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&slave->dev, PTR_ERR(regmap),
+				     "devm_regmap_init_sdw_mbq_cfg failed\n");
=20
 	ret =3D sn624x_sdca_init(&slave->dev, regmap, slave);
 	if (ret < 0)
--
2.46.0


