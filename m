Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1716833CE80;
	Sat,  5 Sep 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615143; cv=none; b=uwZ6T1KWWoATf/pfGilOZk6LRwiQ8cRjWEataBuggKmAdsCZIVAsglcjB35rYMo9YY3MgOmxU+GOY4vTFRW2mOIxBOerb3wprBvs/DV+4uTGGbAtVyxRV0oKfbA0mTy/uqwFKNQuzxlmz/O4LNgs+bfJyKMfLq1sgzqFIDZHfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615143; c=relaxed/simple;
	bh=AkGCboHeKL/E8JKKOkn8Jepxt41Iw0mI1g9sxmOE8jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txoJNWM8oLUkfYf6IIiLsKkJyYmL19RnPvX+Z6E7oNp+0/Jj2LUtF/ZoWTpNV9WYCidz2FmyCq9EXh4CEi/momGxcAylH9f8gSpg9+jnxUOTyt5FaO1fSoJhbQLVLTQkq8R102P98+nkEkc3ZPkzRxM+5BIdBI21SeEQmOQHia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SGYDN7t7; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SGYDN7t7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tD
	S3whzgWPJLTrybC9/CMy8IqgOwtBoS2S5qFaqjzfU=; b=SGYDN7t77hWiAjuDlE
	r4G6s9bRExDq8tMKjOih3AvLgCnk9XI4P5kO3ljVKxKKymtDSZLM/fn3TxtDyxik
	sQBTfT4CmGYZHEAQf8GnHc3B0wxsq1qObmK/uhVWZahJnlOhhftU+m70BFY/UfxM
	kZtKD4u5+8WpRErX7inFRvYuw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDX9CmaGZxqLghWAw--.6433S2;
	Sat, 05 Sep 2026 21:31:07 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Li <kevin-ke.li@broadcom.com>
Subject: [PATCH] ASoC: bcm: bcm63xx: Publish the OF module aliases
Date: Sat,  5 Sep 2026 21:31:03 +0800
Message-ID: <20260905133103.63432-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wDX9CmaGZxqLghWAw--.6433S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyDAw4kGr17Zr17tr45trb_yoWDWwc_C3
	W5W3WkZrW8WrZIyF4SyFZrCFyxtr47Grn5Xr40qr48C34UCF4Sqr92vFn7Zr4UGryxXF1D
	Xa43XF4IkrWUGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUHGQPUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hsu9mqcGZtPnwAA3J

The BCM63xx I2S platform driver matches brcm,bcm63xx-i2s using=0D
snd_soc_bcm_audio_match. With SND_BCM63XX_I2S_WHISTLER=3Dm, the platform=0D
bus emits an OF modalias but snd-soc-63xx does not publish that table.=0D
=0D
Export the existing OF IDs for module autoloading. The PCM companion=0D
and the probe path remain unchanged.=0D
=0D
Fixes: 88eb404ccc3e ("ASoC: brcm: Add DSL/PON SoC audio driver")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 sound/soc/bcm/bcm63xx-i2s-whistler.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i=
2s-whistler.c=0D
index c47ed1e..14d111f 100644=0D
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c=0D
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c=0D
@@ -285,6 +285,7 @@ static const struct of_device_id snd_soc_bcm_audio_matc=
h[] =3D {=0D
 	{.compatible =3D "brcm,bcm63xx-i2s"},=0D
 	{ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, snd_soc_bcm_audio_match);=0D
 #endif=0D
 =0D
 static struct platform_driver bcm63xx_i2s_driver =3D {=0D

