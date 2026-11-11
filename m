Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361219;
	b=ldXmMqnUn3bWJK4CaWBbouJFilFXqIsONH+MrWSMqrNRcdqYcuMtVe+QXJYTB6T18Yva
	 S2PH7NkBjhBX51jwzD5Ry8iqmLWBJeiKaUBtbxSvsjhafnfFpi2Xki56AnSE+royVEUUz
	 gAmGWz6vWGRwKqzqsDtSbzZxDNvGl9xrdb5WijlKCWmbk5jldVundkuMvkT3RnX49bRWP
	 kHhqWMJ7I1zJWfWdCtUxN2LfpiPjTyBTfWE+kB3NzUj5VIBdQ+vNQDfIC8DRbskBcVECd
	 m9cYAhzTIVFD9mUwy8TjXcLYox+PFN5Wh/3J/fjS9eJvqD4W2s+ZMZGezTvs20wRrQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Xua9KrF0O3LRzi+yunjF88sRtaGrQ3t1jbaGl4lHsUs=;
	b=TCVZfWRc01zFSfsHULTys2UWbz+2D8npqe0v//c1OtJQwf4WMu7I0u8d9q6EuAzHIJmB
	 7B4+CUOGWoPXtjlHMlaZYvmMdtk7bK/jErxWLobAKAy05thSnsDdmSGuAiXYOtBINGd/1
	 jmr6Gbu9TNkSn7gEzuO176Ng+K4fexH3qHIPyzvJ5Vj58QLfl9zQ/2HXzIjFbSa1YOBvH
	 Gq5Phuw3aMCIZR9qKZZ8UXj2SVvNzBjMYPlF373G4yvh+cgi9G8HYfEozzjiPlLsECNwK
	 MZkPlCCPhVyJ8+EU4CPzrPrxJOsaY6IhQ85zopo2sfGaA5z5KGAAse+9Q3YszcnYD0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UjVWZU0k;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C73606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UjVWZU0k
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdd89d84521so734297a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794361217; x=1794966017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xua9KrF0O3LRzi+yunjF88sRtaGrQ3t1jbaGl4lHsUs=;
        b=UjVWZU0k47XX1gLMOok+NZ87n+y37CkAuC2N2Y7Whd7V8dTrya+YJTqE2R53K6rHgF
         oGfTKOL+OdqgHADBER8BCkwTcvWCni4OYrUbFq8nMXnBah5sQdkNoNhXVVKredMsLf0C
         Ns72cfEJpeD7snMHk6V14igmVg9R2+8qFO/4/HyEDFBM6BjT8xPIYb8JyDPss/gxE9RC
         xGk0t/OWbZJWAFUtpUGIZvjb0+7Vibq5eTjkUKgr53VHFM2+3IjUv3q0hXLzztGtPEkz
         Vd5hgmiWEi20L0IsKD5eH/inoAPxWN4Xc4dMzLeT1T6lSZnhJLce9EW0v4Mnpn+xOccW
         o56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361217; x=1794966017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xua9KrF0O3LRzi+yunjF88sRtaGrQ3t1jbaGl4lHsUs=;
        b=FMRuEcWYQ1B3IrdSVsE4cdDea+Bk9MkeSLiALJ2RWHH9/dEeO38v9xTgDTUpJwBY0f
         N9CAK/RmK9nJzUyrPF5vqZdh7hBAy7ho/iLBQW8ULRCAJYvHRtUJcJv/JlGt5N9GApA0
         aBjhNZvW43xUy0dcsErROpGR1F6K7myk8zDqMb5k6pV5I+3ZJuabuRc6YIstGXSwD/5G
         t7ggdytx9DXcuQc1CNnaB/C5GwUY2I1p/Biky5HaKc0FLUMH+WD3zMxwiWd9xxznARQd
         ykFtvYHj5cyIQFlRDYcC9dZ/baGR62SlFYIDvmc5m85524W1XHRdt+zD043qhqMZC4BW
         J3Kg==
X-Forwarded-Encrypted: i=1; AL+hErE0cJge24SIFX8JCYD8w3036XOtJgO+1GRhJkddRae62rT2TK4s12o1Ev0S/D5UzPBxyXwWUN7UYctCVvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M8G8cZo/R8V6juhXlJ07zTGmEt8y3wccxFPszHJSz/1Q6QHh4
	vc9/0qmY0cUZHN6VY8okHoXLdE/hm1WWdW7RsvehQnz5CQskvAFxcJDFfJGNaHwGd08=
X-Gm-Gg: AYBFou0UKy+/RLK4aQsgMvhqwJihSBqgt3YXMTxzYHJz3VmnO2N9bUJB3MRiEnBLtzW
	HsCwmnJ7rBuQaByyHPJGpUG8qW2HlR5doamEnDFILfJc7Sq+0XdMz/cpV7LlYbDP/Q/sN7+au/1
	+XEn/gq67VefJ5UnWqzOUnUTqVKwOin4mCxNTL7Hp9SHMfO04mrKfcu5wvjN11VUBiLqr50pUo1
	VfcjuBxA02ORtjTtY6tPuY+S+xupEK50tTya0AIdHpGD2f72ikC7JXnfzqUodyd9sygk84tv8sn
	p55ezicTAWHRAXPCg/I9pgzNXPT9iUHqb55iSzUX95oljTtsSaL0gOkOZJdblCOq8nh+4Tdvpbk
	hZ0WGSp50AvWjVxZxXlB0npWoGkH/n1xAkRKfDuYi0Rtj0k8UPTDyvPh4Laz+WKhq76JvxoBb4i
	TiwcaNn/e3IohQIPDF88hGconX/Zc8zqNKUZlqdSoDpbgST0KBcHTLuj6o1DkS3dY+GwnFvcpYw
	jDpLXQ4Lh3vZy5W/YbSzMKBKXOROkzX0HCjPMwwYVlhNkncqDiPls+xyUoDtK/EEqCWhIS+G5du
	ttTShApMzzB2JfkeoRZxvOLoymx5yUyPJvptqORkFyg=
X-Received: by 2002:a17:90b:4aca:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b182e0c282mr596738a91.5.1794361217607;
        Tue, 10 Nov 2026 17:40:17 -0800 (PST)
Received: from myarch ([61.254.29.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm1912111a91.15.2026.11.10.17.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:40:17 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Opus 5.5" <noreply@anthropic.com>
Subject: [PATCH RFC v2 2/2] ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16Z95U
Date: Wed, 11 Nov 2026 10:39:10 +0900
Message-ID: <20261111013953.4011-3-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
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

From: Jaehoon Kim <jaehoon1744@dankook.ac.kr>

The LG gram 16 (16Z95U) uses an RT713 jack codec on SoundWire link 0
and a single stereo RT1320 amplifier (unique ID 1) on link 1. There is
no matching entry in snd_soc_acpi_amd_acp70_sdw_machines[], so no
machine device is registered even once the SoundWire path is selected.

Add two machine entries:

 - rt713 (jack + DMIC endpoints) on link 0 and rt1320 on link 1, used
   when the RT713 exposes a SmartMic SDCA function (rt712-vb check).
   On this machine the internal microphones are routed through the
   RT713 SmartMic function; the ACP PDM controller is not used.
 - a fallback with only the rt713 jack endpoint and rt1320.

The existing jack_dmic_endpoints cannot be reused: it maps the DMIC to
endpoint #2 for rt721, while on rt713 the SmartMic DAI is the second
DAI, so endpoint #1.

Tested on LG gram 16Z95U-GS59K with kernel 7.2.14. The "amd-soundwire"
card is created with these PCMs:

  SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1
  SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1
  SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3
  SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1

Headphone playback and internal microphone capture work with the
stock alsa-ucm-conf (1.2.16.1) HiFi profile; headset microphone
capture was not tested. Speaker playback through the RT1320 is still
silent although the stream starts without errors; see the cover
letter.

Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
---
v2: rebased onto broonie/sound for-next (v1 did not apply).
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 83 ++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index c2f0479..b492cbe 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -583,6 +583,78 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint rt713_jack_dmic_endpoints[] = {
+	/* Jack Endpoint (AIF1) */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint (AIF3, SmartMic function) */
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt713_vb_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = ARRAY_SIZE(rt713_jack_dmic_endpoints),
+		.endpoints = rt713_jack_dmic_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_1_u1_single_adr[] = {
+	{
+		.adr = 0x000131025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt713_vb_l0_rt1320_l1u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_vb_0_single_adr),
+		.adr_d = rt713_vb_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
+		.adr_d = rt1320_1_u1_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt713_l0_rt1320_l1u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_u1_single_adr),
+		.adr_d = rt1320_1_u1_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
 	{
 		/* left */
@@ -820,6 +892,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt722_l0_rt1320_l1,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt713_vb_l0_rt1320_l1u1,
+		.machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_rt713_l0_rt1320_l1u1,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_4_in_1_sdca,
-- 
2.43.0

