Received: from mailrelay-egress15.pub.mailoutpod3-cph3.one.com (mailrelay-egress15.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6DA488757
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718789; cv=none; b=JcmRmQ8jxt9lhHcgm2cK8mof9fm/GDHYFdAAb/KVR9Hve5ibNc4gpH3q92LE7D+ttz17xVI3LHz0bBrm4SSj8/oHGmT38e24xNySltUHzhljD6+tYzhkAnQwXNPl/GWQVjqUM+Ae+mOKrB5sgs2BpWeWXFgQMIcIvMtqIBeFPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718789; c=relaxed/simple;
	bh=tH/YIgW7cuBjiPySbxTYCNjWnbGErusLwCFzsKVTIpg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=uoqGlFDqL1j52obqjpeCZVS0BF3VVrpb3zlaZWr/WkIX3Liw1f1oXtAtsF8jh1ktksvlfHx+JcGR7UvAnF15ZH2mkfIOinmVlSNNJFW834z68jidP7L9oyjei93We4Kc3skIxsxa+zsHH1SR716tzstE3vALaKWwLHOwLAQ2X+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=androscientia.com; spf=none smtp.mailfrom=androscientia.com; dkim=pass (2048-bit key) header.d=androscientia.com header.i=@androscientia.com header.b=Tj7aVOdf; dkim=permerror (0-bit key) header.d=androscientia.com header.i=@androscientia.com header.b=4KD2I4Gc; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=androscientia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=androscientia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=androscientia.com header.i=@androscientia.com header.b="Tj7aVOdf";
	dkim=permerror (0-bit key) header.d=androscientia.com header.i=@androscientia.com header.b="4KD2I4Gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1790718784; x=1791323584;
	d=androscientia.com; s=rsa1;
	h=content-transfer-encoding:content-type:subject:from:cc:to:mime-version:date:
	 message-id:from;
	bh=U1BRGFZMWSg2a8DIJbbH8hQOCpiW3Dt4xz5oU3rMprQ=;
	b=Tj7aVOdfjzQ8F5hGMEr2XlOJQRwc0DSdd4Zs7GPePnDaKrroWjPXTSnvhrvOn6nzYg13dreFORC+P
	 tw8+SbEvyCGv62ESS3V0BuLjMyUfn8kgShZhqHbWbYgupS57PoFkXu3JMBVjEoN+euafLdrS/zWXeL
	 5wSTGu5wIWVJWrOKSqouCnQAeMa/rKuPFSCLeZWlYCcsNbklwVG8fjI+UkWpW9vUd1CpKPDtrM3mgZ
	 a6kx90lLeRuRoExg8h55JkKRdmJcnk70W67wKsj62KFKs9YBSmcsJ8x73C6IibFlB9yjx7nEKbqv0B
	 MMc5202CU1cscxo9S7DWIw4LOkcHEBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1790718784; x=1791323584;
	d=androscientia.com; s=ed1;
	h=content-transfer-encoding:content-type:subject:from:cc:to:mime-version:date:
	 message-id:from;
	bh=U1BRGFZMWSg2a8DIJbbH8hQOCpiW3Dt4xz5oU3rMprQ=;
	b=4KD2I4GcyXrDUebv8O9DHzNJ/C1oYuZbwkoui1SBXIgpnjWevlKiLIe84UTkFT3Bls9BQmfwhV813
	 yLU8XYzBw==
X-HalOne-ID: 248d24b8-bc50-11f1-9cc0-154560f4cd7b
Received: from [IPV6:2001:2044:db:f800:7717:9155:be2c:9362] (unknown [2001:2044:db:f800:7717:9155:be2c:9362])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 248d24b8-bc50-11f1-9cc0-154560f4cd7b;
	Tue, 29 Sep 2026 21:53:03 +0000 (UTC)
Message-ID: <47904337-8887-4623-83df-c370a26adf03@androscientia.com>
Date: Tue, 29 Sep 2026 23:53:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, shenghao-ding@ti.com, kevin-lu@ti.com,
 baojun.xu@ti.com, sen@ti.com, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Andreas Axelsson <andreas.axelsson@androscientia.com>
Subject: [PATCH v2] ASoC: tas2781: Skip calibration data for other SPI devices
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On SPI-based TAS2781 HDA systems (e.g. HP laptops with two amplifiers
on separate SPI chip selects), each tasdevice_priv instance services a
single device, and the SPI bus glue returns -EXDEV for register access
addressed to a channel the instance does not own (see
tasdevice_spi_change_chn_book()).

Commit 513480da5e9c ("ALSA: hda/tas2781: Fix device-0 reset issue and
handle -EXDEV in block data processing") taught
tasdevice_process_block() to ignore -EXDEV on SPI, but
tasdev_load_calibrated_data() still tries to write calibration data
for every channel. On each instance the write for the other amplifier
fails and is logged as an error on every boot, resume and profile
switch:

   tas2781-hda spi1-TXNW2781:00-tas2781-hda.1: chn 0 r0_reg bulk_wr err 
= -18

The owning instance loads that channel's calibration data itself, so
skip channels other than priv->index on SPI.

Tested on an HP ZBook Fury G1i (subsystem 103C:8DE8) with two TAS2781
amps on SPI.

Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and 
leverage SND_SOC_TAS2781_FMWLIB")
Signed-off-by: Andreas Axelsson <andreas.axelsson@androscientia.com>
---
v2:
- Rebased on current code. The tasdevice_process_block() part of v1
   is superseded by commit 513480da5e9c; only the calibration part
   remains.
- Resent as a new thread with the patch inline; my earlier reply had
   it as an attachment, sorry for the noise.

  sound/soc/codecs/tas2781-fmwlib.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c 
b/sound/soc/codecs/tas2781-fmwlib.c
index e8ceeb0..e250d38 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2631,6 +2631,10 @@ static void tasdev_load_calibrated_data(struct 
tasdevice_priv *priv, int i)
      if (!data || !cali_data->total_sz)
          return;

+    /* On SPI each instance owns a single device; skip the others. */
+    if (priv->isspi && i != priv->index)
+        return;
+
      if (data[k] != i) {
          dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
              __func__, i);
-- 
2.34.1

