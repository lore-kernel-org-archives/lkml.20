Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3E0489863
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352218; cv=none; b=iAMmO0ldf0x8hR5IXQrQhyMIsBxivv00281cWBc29lDDD4Gph482ZpbQqibjM37htQs/mkGAPB8Y+v4d+a+PPepTsiNGUclzTqufEk9+6PbIQHs2ULqPPke4myjVFvbFO/Tu0lv+wguqxd8R9SraMj3Be+1Q/GaFoxjaFtF7Wp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352218; c=relaxed/simple;
	bh=GFpA75rZV2PlUyJl3Nf9VvN1LxwqkpXHxSS2KKq2Zgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAKH4f7LaXtFJd60DgK4StmeovzqfVUZ6IKZtz3FaiwJrn6WmmsnmdL3CFXTIEaII62cFX3SFXrhyktxSg66vbuC+nuOXrgsv8Mqcc8J+bLteEav3HEKE1eN+hY8nvUBVZ83x9iHWFJG9034nRz8reuUIZ9YG4FkC2/teK1vDPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCyjsSvA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCyjsSvA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so1097328f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352215; x=1788957015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYhGoOWQOPsCFTYCtiD4blv+QvJT+32JjL57CVsslHs=;
        b=ZCyjsSvAFlO8IPLctKM5Qv6CczUKjtimbQKTKrrp1LMt0T8wnbKco67MAg/ZPQmQCX
         70gZP5DMkYuuY/h9kWhZN7W4aNCJxwFTbLO4AKm+r7fui0jROVeBjsKeXkWyZf9M4bqz
         7OuzX34sE3yatMGjFDoh0dfegysjStxNe39/EoZXAwKnKtEPIxn4hVM+YS3Xx9q0qGoi
         in1xkcVz7/8oSjP9G1p1AD3oSsHgfHR/514wMSuztMTXkvLapGEqHD/lNwI1m5t/DCab
         7Bcdpbm/dy2dexe1uIaMQlpbGaOPPFmHCsKXTFoDzyljJ0QwZ9T5xhcfcLEU12xQS50G
         EXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352215; x=1788957015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYhGoOWQOPsCFTYCtiD4blv+QvJT+32JjL57CVsslHs=;
        b=WmRfo7WHHjO05jbRRaOdzPIC4CzdEHkII76H+aQ77b3xo8YaKy/dk24l/68KSmQMhf
         NFkvQR7Hvn6Gd1BwrwYRXO+nFR4Cu1hMlieEHoNo+y7KnoT/sPAsYTTS7UgASbIn3BEr
         5RawJWjHyoLt38VxzrfgloUnhn+8IlaTWlOSgztLs7Is+SfYM8n+gUAs1tkXaazHP2iL
         7SGPV5oQHBwNRzjtKK4nK4EQ63qZY1pq/WEJq4vJkSGcIUEU7lzJy0SgyUCEcljj+sJ9
         Ebmp/w0D79JKy7mban6TRGYf+4wsnVejpVLXWlHfzjrbLkgkM/4t1hbrK5rYI5CANhnz
         ++zg==
X-Forwarded-Encrypted: i=1; AKwUvBzWVjMyXDlRQKtYM3IOR2fA8P7zV+OJ9Fz+4BZYhIeP7aMOOhVVa7aCISQojjPquvF99YaEJU6FjCre0Eo=@vger.kernel.org
X-Gm-Message-State: AFuF++k2qdcSEpgQPGARPW3KPXfw7j2I15hIleuvfy2DPp8oN8/er4BT
	Ur9KMDD2GIUJi1I0fb298c/BCRYceNjPNO8G26cbHNaOWtASX2f1TbKCLigxa3Ek4U9LAg==
X-Gm-Gg: AYBFou1+1bv5U8zRYoKvzKJr8zoqFJP2qQL5BMSkcedYdNBVRByZvnbVdSDXAkEQyL6
	Y+JmXvoio1Ly+9lvk141T5sF4C3/yR9HSYYlb8/Nyr6WFV+SP5RgZTT6Wh+217YEmKqQF61IAjz
	LcaMCXcZgejVMyiPTe5KV2W69HKacs0S6C3fZBcxqArkaBa2Ajd+qBObseDCWWt//J5r/Urk1Z2
	gOD8LTIuDyBYuBiJy4zzYiCWGERYYCI7erO0Ksn2J8MW4T9XsylDNTrrX/v8ewYuFvHgLrqSfEB
	61Xo1Q3EPkdvaSjLstshKVAhz6c6UlsDtaR1kRI6ZOomuuz310NacmAtykV9r8h68PYQAxjTAti
	+rNcf2Fjz5BHHF+QZyWgUw1/0QX2LyNrT2/+pp1mSCQ7clVJrtB7AycAjOT9URfDrhV+ocHdJ6v
	685Asx6zqPpwO86vv6q0o3ydND2/Zr1WKmf7NOLAYOhkrIMOvr+egu7g4960M/aE/unI+ePvLhm
	0ypNZYo2EtwTcLADEBHyMEfvdM6kEMriwr1jzljiDD5a8Ykcvc/Zg==
X-Received: by 2002:a05:6000:4014:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-484913b85a0mr8236171f8f.14.1788352214492;
        Wed, 02 Sep 2026 05:30:14 -0700 (PDT)
Received: from 1Z10 ([78.211.18.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm5824276f8f.11.2026.09.02.05.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:30:14 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	jekhor@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Wed,  2 Sep 2026 14:30:07 +0200
Message-ID: <20260902123007.769820-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
SST firmware and board names and the SOF topology name.

The Intel DSP configuration selects one firmware path at probe time. SST
loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
sof-cht-rt5677.tplg through the standard firmware search path. The same
kernel and machine entry were boot-tested with both paths on a YB1-X91L.

The SOF topology sources are maintained and distributed separately by the
SOF project.

Assisted-by: Codex:gpt-5.6-sol sparse
Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..442ef30ffcc7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-rt5677",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht_rt5677",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

