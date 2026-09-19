Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1B3ABD83;
	Sat, 19 Sep 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820028; cv=none; b=M3S+qaqjzGHY6w2g9skBGFC7i9AuBQP/U7LOGVqpIrO1OJDikism0L9OiOtNDzwdBzE4KvlUMeUxCMf72X/dXFDItIBqXoiSWJjREf5goWbmH6ryBMzwC3eaAab0H6iGhRHjRpAX5HvVJZy6c6bpafsA6rrTIenDAhj6oQsOcfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820028; c=relaxed/simple;
	bh=z7eMdvlQx9PvIYZHBu1JAfIPukPeaIey41wAcOzoRMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aBUXqgOBJwXAnONcQrMuIC9jWXGTi6lNnA0NEd2we5Rtf9XBnZmFWA2XMWmykovsjXqiuKkPrU1e1SJ3LfuXhZHIE1teVZwx9y1lUTMaiVqRF1inG/G2ELs6ZuXRrQpjADdMAC2xncIufS2J4jO6AvNShCpC1V90GsDHfhRVne8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=eRmwdllN; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="eRmwdllN"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e5f6a4a9;
	Sat, 19 Sep 2026 20:13:38 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: amd: acp-es8336: Use an owned codec device reference
Date: Sat, 19 Sep 2026 20:13:17 +0800
Message-Id: <20260919121318.1618315-2-lhfff@tju.edu.cn>
In-Reply-To: <20260919121318.1618315-1-lhfff@tju.edu.cn>
References: <20260919121318.1618315-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0b996204803a1kunmb5cccea33e6263
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUNCVkxCTBkfTEtKQhpCHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT0
	9LVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=eRmwdllNI9A5RjK+R9TUJ5XXirhzAGCgee1R7K8A9EE/LNRs1CsYa112MPwhnldO+OmW96DWAmpOx3gvAHj7tomPXjxzOz++SprzKS7NBnL3P75cZqvdWjZNV5HSCIBYtGeAgcnWC5sGeKFfdbzIi+V/z78Mzfbu7C5C7OxAbsw=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=TXgjFmb3ndhMdUp3D9bE/kXip8sQ/TVnNWE18k7qvDg=;
	h=date:mime-version:subject:message-id:from;

acpi_get_first_physical_node() returns a borrowed device pointer. If the
pa-enable GPIO lookup fails, st_es8336_late_probe() puts that pointer
despite not owning a reference. A later physical-node teardown can then
release the device while device_del() is still using it.

This was reproduced on current mainline with the real static late-probe
callback and normal platform-device unregister. The GPIO lookup returned
-EPROBE_DEFER and KASAN reported a slab-use-after-free in device_del(),
with the object freed by acpi_unbind_one().

Use acpi_bus_get_primary_device(), which obtains a stable device
reference under the physical-node lock, and release it at callback exit
with scoped cleanup. Keep the reference callback-local because late probe
can be retried; registering one devres action per attempt would accumulate
references.

The same KASAN guest with this change reached the same -EPROBE_DEFER and
unregister path without KASAN, WARNING, Oops or panic. The test directly
invoked the production callback and did not emulate a complete ASoC card or
physical AMD hardware.

Fixes: 02527c3f2300 ("ASoC: amd: add Machine driver for Jadeite platform")
Assisted-by: LLM
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 sound/soc/amd/acp-es8336.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 9f3f11256788..0cb0ee76191d 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -30,7 +30,6 @@
 
 static unsigned long acp2x_machine_id;
 static struct snd_soc_jack st_jack;
-static struct device *codec_dev;
 static struct gpio_desc *gpio_pa;
 
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
@@ -191,6 +190,7 @@ static const struct acpi_gpio_mapping acpi_es8336_gpios[] = {
 
 static int st_es8336_late_probe(struct snd_soc_card *card)
 {
+	struct device *codec_dev __free(put_device) = NULL;
 	struct acpi_device *adev;
 	int ret;
 
@@ -198,7 +198,7 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
 	if (!adev)
 		return -ENODEV;
 
-	codec_dev = acpi_get_first_physical_node(adev);
+	codec_dev = acpi_bus_get_primary_device(adev);
 	acpi_dev_put(adev);
 	if (!codec_dev) {
 		dev_err(card->dev, "can not find codec dev\n");
@@ -213,7 +213,6 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
 	if (IS_ERR(gpio_pa)) {
 		ret = dev_err_probe(card->dev, PTR_ERR(gpio_pa),
 				    "could not get pa-enable GPIO\n");
-		put_device(codec_dev);
 		return ret;
 	}
 	return 0;
-- 
2.39.5

