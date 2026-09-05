Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED20D36AB6B;
	Sat,  5 Sep 2026 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615167; cv=none; b=CporghEkwSx/D4KHl+ubzEP3KCxMO70kxhCfSrUly+aDuWXqw1lSSrGOgWKyNBe+Q9WDjl+oHxhEL6sLZyG6SP+zjnAbng6RVlwZxHw/9jzfg4MtsoHraSAWn3Tp2WGLysIdTt6QlaAyTCJIf6tkZs9wvM1ef3+1gQ3LNIGh1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615167; c=relaxed/simple;
	bh=39RNeenrTlwOEvdzFJLrzh6lqhHDommYA/BWJSMhSUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCRjVHIYeGcrARpm3Ci0S5sI569iLl2x+lFCHd5u9rPNSoO9lnlsKIX9/1vax+tmS/52qp5DqxdUZTpkUiYUmF7/2thULt5MaeYgQvO/FPxMBAjzkxDIZb4D+EAbUOWB3XEFBLlpo8UGmFQlMVAgaOCBioBuSkL+2K0UaYGL9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XTANvVd2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XTANvVd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=IU
	h8sEeF8adx5OCr4odrN9r4bdLCvr4qGD0r4RzOMJo=; b=XTANvVd2aCbIOtIJLW
	zZdDKDYrc0vWpr4clXKuoeJpzdA6eDgN8X2JWZ2bueHzsOvWL9NXhUhFQaPi0HzU
	/oIi8DD95MMJAeKioH+oof+yXColAiRlEslNEngdeW0LeyGIHEe7FADCepHgFxrj
	chWTZz/DYvV1edSDejLgNuHe8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBH9yy3GZxqHhVWAw--.5661S2;
	Sat, 05 Sep 2026 21:31:36 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] ASoC: Intel: SST: Publish the PCI module aliases
Date: Sat,  5 Sep 2026 21:31:33 +0800
Message-ID: <20260905133133.63661-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wBH9yy3GZxqHhVWAw--.5661S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4xZrW8WF17XrykZF15XFb_yoWDWrbE93
	4ruay5ZrWrCrZYgrWj9rW5CryI93yIkrykGFyUtF98ZwnrWrWruF4DZrnrury8Ww18XFs0
	qrn0gr18urWjgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRBT5tUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhg2-mqcGbgKkwAA3Y

The legacy SST PCI driver matches Intel Tangier devices using=0D
intel_sst_ids, but its only explicit module alias is "sst". That alias=0D
does not match PCI modalias events when this driver is built as a module.=0D
=0D
Publish its PCI table. The independently configurable SOF driver does=0D
not provide aliases for the legacy SST module.=0D
=0D
Fixes: f533a035e4da ("ASoC: Intel: mrfld - create separate module for pci p=
art")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 sound/soc/intel/atom/sst/sst_pci.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/=
sst_pci.c=0D
index 44bb11c..1a53c99 100644=0D
--- a/sound/soc/intel/atom/sst/sst_pci.c=0D
+++ b/sound/soc/intel/atom/sst/sst_pci.c=0D
@@ -167,6 +167,7 @@ static const struct pci_device_id intel_sst_ids[] =3D {=
=0D
 	{ PCI_DEVICE_DATA(INTEL, SST_TNG, 0) },=0D
 	{ 0, }=0D
 };=0D
+MODULE_DEVICE_TABLE(pci, intel_sst_ids);=0D
 =0D
 static struct pci_driver sst_driver =3D {=0D
 	.name =3D SST_DRV_NAME,=0D

