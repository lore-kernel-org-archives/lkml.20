Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947455;
	b=qPSct2QQsX07qZ+5in4tJ6rfrtq8QGkcR6DQ8HJHdfulNLdcEKTKV7EOegTocfPwi3xs
	 qO3xJhOrfPjusygLrxtD+GOJy0ZUkl8AUkUOcJo907Irvhyn45WOyU5ctnh86YGbtnhNO
	 MnTeLPnBOcz1Bwmd7HJ0tq+Cjw6kEPoY+fH9cyro63QXUcrs4q7TLFJPePWNpCDL06Nra
	 Ld2s4eSxg19CYp0NgTshz4Lw+6GnBnNHD0Y6JDyd1dN8XPQBE9ksT5Y1uJpFVKs/WAxSG
	 qcbRHDdvp9ovTrXVNXyHRBnqX8ydhW/H1+5NHJ19/7bbCdHxeSSRDb2wK5QhYcEOqdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hVxNmv4NODysBtkUxnOWYZEs/ETH9HFkkGqgOhhLEl4=;
	b=2PZ2sV6JQfjfiOjj2McrWSjtwrE+9+J+aKcdlftIuFdgxWRochvhKI8sG6xoX4oX+gr/
	 uyezZfY8PTbwEGeiHAU5kibD7ei2gTE6uUE2hMRbR3n14rGTm8orXamnsrL//SVqyJidF
	 6XjGOEN+EwTKaDT9WgFCPCi2y9Ho2Cjavpp13eKxk/mX6QBjoGiPxswUjVrvMJhqwIZuT
	 iTsTrwtjG7wed0yj+9AYcuTIGmGr1NPhFlEMdDTfLLCDt0mJJpKP40KUzzNpbgWcQeJ/Y
	 /7mkMKLRnQqXnV3cn5Npoz0+MC2Hjp6ggfPJcCsuDSdjysnpQLaSjlV4FA8UtqDuXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="d2Ei/vhj";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3D606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F3D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2Ei/vhj
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so690258eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793947454; x=1794552254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVxNmv4NODysBtkUxnOWYZEs/ETH9HFkkGqgOhhLEl4=;
        b=d2Ei/vhjjILcWqCIc+EPg7V1QI1Aa072t+IMKv9H1uv+f6vQmzqFPsvQGpxVC1/mYZ
         F0bseLkJs4Bkm0vkXDljfdr5M0dhPwOrZbhvL/ABrQnGZCi3CrNsGxkOZoAfBFQe7tLR
         yOYOXgMW/DmdPRUbxj4AC2tpxPGyQro4rR7pJOUjRqvQDsHqCJoUuEHCzACZZJExRPUk
         WgE2Oi7jrw4xnugjrom2jk1HDWIFefzNol88dNnmjyMNvGKfWmTsEkm2LjBb19byN5AW
         OYNyYKCn+DUN6f4IF7/NNxbtSjQjSAc+xeOXit5cDrkPPSsq8xtBH5RYfXtreDPzdXGt
         MoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947454; x=1794552254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVxNmv4NODysBtkUxnOWYZEs/ETH9HFkkGqgOhhLEl4=;
        b=Ax54dnGCBK+RN66O6iARHQdcjcxWvug4ExSoWeDlqDYzjkUKkrH6qOMq0Mg/moWC1V
         Hbl0VUVNjhIBqcQXE5vh0kXtjc5glDZ3SS9kKd+vw1RveMV3Zii+dcNFvsxqgr/lqc27
         VXzvghW82U7lhXAO9X042t3OkhXkud6IgZbS1FTaTNKuxnc2H1JGssW0F+kqkm/Au8hT
         MyFFebUOWey7LDTpInF/4cduMrA3a2MfO6fxRmLAOSlBbaPUh2nGSwhuPoTGuVwa/FVu
         o8dh0UJ3OkXcOAJkJjpfDDB0IcK0ALz2iJapRLGqh1+G3Gr/nxd4rP2neGf/gRGPPWwm
         7CdQ==
X-Forwarded-Encrypted: i=1; AL+hErGP9kxWH2l9zM7dNfB6KfncUPjMP0NWvksc4DNAHDN9bcXLca5Cm1PGQQn5dC5MU9SG+kDjK3fBScuCnQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j6xdK2u7FMe3Rsh1gcNAuVeQJz/qWyrR711oV1nVmpHsIu/4v
	K86Q374lXSYbMp6PlketXyzaVeAyDrdQodNBrg0CSYwiLoGzIIJK1Gu5
X-Gm-Gg: AYBFou0ne0EB0qmB+ANLbXwS1ExLueDeeRouK97QmQKB1qn3tK3+cqmuut+AfNLCp1m
	HktrWcgKToSVSlayr9UD4rHGWa+/jvrQn8k6hIzQvSAN96NM1uYrym6pTiWfiCIK2WOup87g6PE
	vNXRhs+Qk1HaRuVGuOpIWyJiONR0CW8yeDcUpCo6ueaS2g9cl0hlx2GUx6XcRvKqn/ZFoqrfpY/
	ehPPoKzyWPOMdczp/CZjAXJdPGuxPlM8ispgPwaXhRb2gTqCTQVLdD6hPpIFRr5q5Wg7VfivHuu
	GPZshH8pPniuDKBh5XM3qjKyG9sZN3dmrPCGRWh+E/6xffqGTlm9vDsVZqq2bj4jyYLdcOz8Aps
	UCsD08SuS1ZUh7kr2Rqc9QRqBDpB0U/0fKi3OCSDzhhAtJ0X90bT7VZxIE54PaDCbPGOHG+/c8d
	fI429KAiMDdFsjYY2D4azKQDGNogwDF8td1UlIHiz0leV0SfdpHG+sbBL/e5DCPfKOpqzgnkPVD
	hYiwfjKfcaQ3Xfk+xXRkmLldyP/pCEXadV0SSoY7OAZQTymHxtaL2knWqB3RTw0gMfidKuIeM8L
	gLhq16E45HRADUoc1uICHNR5nT048mxgOA9n5qUp3ZCMSng8MnaIpLiIlr7NF4Hg7vfdyc/tLUt
	iar13NqCweFK84VKtkbnf8JNq+3CHexu3iRPCq4sE
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr2114771eec.40.1793947454399;
        Thu, 05 Nov 2026 22:44:14 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm4157057eec.10.2026.11.05.22.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:44:13 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420
Date: Fri,  6 Nov 2026 15:44:08 +0900
Message-ID: <20261106064408.2224910-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 9420 (SKU 0A5B) is missing from the quirk table, so
it gets the default RT711_JD1 jack detection source. With JD1 the
rt711-sdca reports a headset with nothing plugged in, and the
Headphone Jack and Headset Mic Jack controls stay on.

Add the SKU with the same quirks as the other Dell Tiger Lake SKUs,
SOF_SDW_TGL_HDMI and RT711_JD2.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Tested on a Latitude 9420 (BIOS 1.39.1) with this entry on top of
sound/for-next:
- with the jack empty, both jack controls read off (on without the
  entry)
- a 4-pole headset is reported on insertion and cleared on removal
- mixer-test and pcm-test give the same results as without the entry

Booting a kernel without the entry with snd_soc_sof_sdw.quirk=0x22
gives the same jack state. With quirk=0x23 (RT711_JD2_100K) a headset
plug-in is not detected at all, so RT711_JD2 is the setting that works
on this machine.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64.

 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 72fe013fffe8..41cc0969a428 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -139,6 +139,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2),
 	},
+	{
+		/* Dell Latitude 9420 */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5B")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2),
+	},
 	{
 		/* Dell XPS 9710 */
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

