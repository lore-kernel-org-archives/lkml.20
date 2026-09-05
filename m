Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A64271450;
	Sat,  5 Sep 2026 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615202; cv=none; b=lf4VuWx2SIR8M/ZnYrZQvPyjzbxTGsZcA7t4EkzCbq9trMkvexYNaxrZl/Q3ggf9Y0oQW77D0ValwypI4T3aW5PMedLXgtLjGCZATx3sSG1t/gtxicfLZa3Hd24VLXti9I6IZ053HmC/LGkj5J1FawmKIfcn4neU+8YHWrUauj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615202; c=relaxed/simple;
	bh=1Qv7JfjGhW/7k8Z2oYogvu1+3LYgK3QU+AS3mGZ1jlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxhwP9pRR7d+VfxdtPnUy5wm9lJvcnrCCeWuXoYdJMUVIBafbI6ZuH8cpFT4uBZ1C7cp1M55eCg/pAClaLgwRR5cwRc6/VZ4zqYsJKQuBl8zLZ/1n0dO7dtmHliFwYXnLZHiqQTPHLlBkgVGrEEBoGZz1e6kG6CW5MQqbtzchYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hRbSmjZw; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hRbSmjZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Vv
	5oyIV+iTroIryK8q4maG4WM3D8XmfLPN5y+EKtsQ8=; b=hRbSmjZw69hGPwR3A3
	ipZw9GJiaGSslzOOkNu1xKXAswe05ODdCp7nz4P6xdJnrB9x8/zjd9UJAuY/uQlr
	mJQ3aF/l0+S9fVJB1gc5EjivlKhxz/N/APQzbCiFkVDDqo1UDRP4gXESMLl+lJ03
	AUnJcyyrlT3YqSyJY/HBHKO5M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_wzcGZxqt90VOw--.17760S2;
	Sat, 05 Sep 2026 21:32:13 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Kai Chieh Chuang <kaichieh.chuang@mediatek.com>
Subject: [PATCH] ASoC: mt6351: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:32:10 +0800
Message-ID: <20260905133210.63803-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:PSgvCgD3_wzcGZxqt90VOw--.17760S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF43Jr4xXF4kJry3XFyrJFb_yoWfuFb_Cw
	48WayUurW8Cry7Cr4YqrsYvF4IqF1SkF1ktrn0kF18Xa47Xr1rZrsFqr17uayUZ3Z2qas8
	WFnxXF1ruFy3JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRR9YFtUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R0-CGqcGd1OvwAA3E

The MT6351 codec platform driver uses mt6351_of_match to bind devices=0D
with compatible mediatek,mt6351-sound. The codec can be a separate=0D
module, but the OF table is not exported to module alias metadata.=0D
=0D
Publish the existing table without changing codec matching, register=0D
access or the machine-driver configuration.=0D
=0D
Fixes: a74d51ba0e17 ("ASoC: add mt6351 codec driver")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 sound/soc/codecs/mt6351.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/sound/soc/codecs/mt6351.c b/sound/soc/codecs/mt6351.c=0D
index 1768c24..3be0491 100644=0D
--- a/sound/soc/codecs/mt6351.c=0D
+++ b/sound/soc/codecs/mt6351.c=0D
@@ -1478,6 +1478,7 @@ static const struct of_device_id mt6351_of_match[] =
=3D {=0D
 	{.compatible =3D "mediatek,mt6351-sound",},=0D
 	{}=0D
 };=0D
+MODULE_DEVICE_TABLE(of, mt6351_of_match);=0D
 =0D
 static struct platform_driver mt6351_codec_driver =3D {=0D
 	.driver =3D {=0D

