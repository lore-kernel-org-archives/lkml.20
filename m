Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894574;
	b=M9gnqTq8EwPe4csvxu4EEVluA6XNZ0j/GeX530NCr/OBJ3LUPN6IMLbesUklxbKNKgHh
	 mJbth580kCT0wEW90/0tj37KeagtdXJQsOK3FpJ4nQFpFI6qK/rpGz63H99VAauSvFHCi
	 6Ajb2YkcotafPo+pK/8Vthp8s6vzV7XzaqHDCqcwOOkrpGfeInskEnMb0L+o/Ol9aBqDr
	 rxh6mfpEVZrCd5vO6d6CUmLAC1qi+NFiksJqpSQ25bMMsTuSd8Rr7uBahyuGMaXFo8mol
	 0P/aGhiShoNAfx8FpQMK6SkYS/7Xju9AnEWNbYWIpjJFOsroOnTXL7M0OhVTd+mGQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v2FodO5hJkj1pctB6tAr/939l9h/HJN6bFy/Ma2rgWA=;
	b=SYXIEU52J7zCwGr6mBQ5BpgRSDe2hct0WpwW0r8kziiR+dAJAIQunz0hCpcBxefTVtMT
	 WJjEqTqfPcb4OwOrQ36e3cZYjMj9EzPQPxgqnOCGl4gv+9Dty41mJaGP1rsjiatJdqDDU
	 hRYlmEBIyrIiU58siBoO0+QjEZI9C9KcIreUmDD9GGj6rxdxdkhfkTxvmEjU5C4IqytGA
	 WDq01zBfJu8lwWrl58GIS7kUkfsEo9Pi5k8x3uMXUMfXjqHftGlBeVfAGyt43+Sj9rqOE
	 XqH22Pqw0QePFs5DLBv5jcYXIyW88GTaWPayW/ejKnQrmKY2OorPsx2Jm+ppNY0u0Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lG41JLr3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MglE5TQX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B506083637
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B506083637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lG41JLr3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MglE5TQX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQFC12004445
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2FodO5hJkj1pctB6tAr/939l9h/HJN6bFy/Ma2rgWA=; b=lG41JLr3fzDI4Kz8
	76xU/mrLryYp1dYynYiikY9ITSTgEzjHW+x/XAFnUIXmaS/TPppUPauz8aibIYx9
	yCOHD9p/x634il5EQURWbj7xJUTHTl7Rz53SSsyobTbdelhxSevSNJbV3sJZzh6k
	ePFkR3WOgYvdeA436eyLaVFQ7vvz5LJctXusx6MrUssOnzukokNaZQbSotDNCP6X
	gLJf0XuKNIsz0zN1ax1Jv6Pof8xSt4k7DwHf/YV1VFk1hnZLimmRvHxnLZxgWuY6
	r23oRDuCS5OcSim/HLsna+i/XXklIhRHRd53C6CAuZHa0ScUv2JfTJT6d2s0ufoF
	dTv0tg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1gys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:02:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so399952e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894571; x=1794499371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2FodO5hJkj1pctB6tAr/939l9h/HJN6bFy/Ma2rgWA=;
        b=MglE5TQXBWDOGvWqfP2ncIxodWL4n2yqBOlYxcFa8a/oqtUvqaE8j1+QdI7ROeOEEJ
         q+UXCdTclhLzdXQ/REJqBLROJdtMjkNnWuUJv6sDhab1/Lu4kRvdFTWqNt+5MaFg39sy
         rzEV6fs2p4Dt+a0EsyRG16dY0kdfcO17S9n8RURL0y9N/6fzQVfuseCg/2Dmp3xwS62B
         XQmVe5nkE/q70p8d45LY36kE6sksCREcOqxImPdWw1tDffxIG4Igz1qTRA9p06HixBn8
         lwelDZU5scH+1wK/VLcbqSDfvXbG2uSPPpNGb1wfIpprsHJnvBtFhcZFWO2dbu0O/VuT
         IWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894571; x=1794499371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2FodO5hJkj1pctB6tAr/939l9h/HJN6bFy/Ma2rgWA=;
        b=wEthgaCYHgoVKxBcDarMDr22kqIvKhZD0g6Pw1ZFjKEMxwFGjECNyC5Ab4ZYNUpWtR
         ac01RX6s1tOL5IntJv5NTEA5j6dVnPSrwwrKvWH6FdBIV443pcAbfbV+UHusZltYWs1g
         vqE54qiXe+UCCAWOj6i/8zcJvwuTfNqVmcm+6YF4zhHR2toog3HyxnMtHu3Xd3egqCYk
         PvlNqUiHSyIJZTVuyUwqddv3hStFJLQI5g3rH4aEikSqtemFMo2IEVGkihMSJRn+l5QS
         bhO/k1HJ8FHVgop6L8LBxJVjc5nJnHEeNGQZxxHojC0VQ2/m6iiy5b7GaRmnQKIsKXmh
         dQhw==
X-Forwarded-Encrypted: i=1; AKwUvBzAmdW8p8dM87t4jOTCQ5TUkN6EDj9lnVp4NWhuNoEIm/PfDNrdMt8gjrixk5agjhmkjqJyu85Be4dvYFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LCBc3FWTd2PSHi9wWrK5GsV2biKHLxnMXSgvnOotILSt9HyqS
	hWV5fakmMgYNTNtDqnhlaQg+0Nmxe8GRPP7vMlqDfvebFNPmNh1+Ghdbu1CWUBTbyc5RP/SOO/s
	j1nddyJx0S9HsYwIi0mAlqxdZMYDSGMh99cV/trpwFohKlyXJKvUGc1NAZapQlq19HGI=
X-Gm-Gg: AYBFou2vxgC15X4h7vNmvs8CJWAiUTYDsEd9fqYW37EQR9r16rVhHRJylmvw1jbHaPT
	RU9v7oEYbk4Gp2xduswJry8vdY3RovCWIYnj0bBXGkuj6RiiUHKg8oMfxxgbYgHc/FfVZqSAdSS
	ehvwUKa2EePQfbKnMMsFIV5wdLB8gjtNnX/Rot2YMb/phPWySKrhVK0Vmv9/wISmkOjIs+qgRly
	FvW/UZFz573D1kMXlEKdP3UK8VPd2pR9CoFmNDLg1NU5WIk47BBSlW+1eD1u+S8kLHy0GZGQEye
	W1W/SdHjAsJ+tgCEBDCKbsARMCzLdvX9GHGbYMrKYFIhn04M1JmLEahLU4oTPpzPXds937UXl34
	hj6SNI50lM5rLaoI5jtHCDk6M1+cLUFS9EvRusj8w+Hs/YkC0oKuGMkLegg==
X-Received: by 2002:a05:6122:787:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec689733a8mr9188957e0c.20.1793894570639;
        Thu, 05 Nov 2026 08:02:50 -0800 (PST)
X-Received: by 2002:a05:6122:787:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec689733a8mr9188854e0c.20.1793894569740;
        Thu, 05 Nov 2026 08:02:49 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm11065672f8f.53.2026.11.05.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:48 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 18:02:03 +0200
Subject: [PATCH v3 3/3] ASoC: qcom: x1e80100: Allow userspace WSA RX chmap
 override
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-3-29e06613115f@oss.qualcomm.com>
References: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8385;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XoOR3cm4qVTMMv8WRHw1TamUUuoGbfY5O/C44BLC1EA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7KihNYU/BoOtJFuWVU6/OBJyEqwz62HP8sMtG
 LN4ftH8q72JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauyooQAKCRAbX0TJAJUV
 Vo2LD/0T54aWR7czFnb4Hy62PITJ0rlH8TzuSc6iHS0LNLgaGLJ6JtrYCqd3sj73he4ilS+DcmH
 fQYQsGX01c4aLRvx13E3u8DvV3hYq57TZvT9lcsRObS45Pjo3yNibqIcJGXHnt0dxJZcmgIJt7q
 Z53Oihi0BRPLKVu+d47jlqv9WUTHJOucgGkF0tm2ydJidLFUY5DRr7zI+ZSj4aa+VpWbGgzEYK1
 CWs0ZwtInbxbPVV23dBv88B43BMzuJUSGrE5kWoAuhFNLMlXNFon1V3kAPWRZROLlB6gXtWeNA7
 2htI841cipXvruZAO6F2I1gPQOMpkFldXu/9nybBoT2WMkCDU+lL+QHCzlNgtK0fZdLn157rsGA
 X/8oZ+AeHgHoe1bBGrKK828tzWVXQjUTx/WUU/LYMX8YBsBYCaK4cd97UU34AJ2K8ZTOXVjeIP2
 KAR3gDpDn6y05wNuHMLrU0jNXEX58YXUoXkK0Ucy6EvwwLbiC/4Ws2jtDSDo8YaG0aEkELeW84S
 2YS1TasAjMRjXrTNknd5XcE/gRq+BezO4iDcEL4imvtPQGa8ose0UVy9aPvELwQtOrV8lWUQO8N
 ChbvxTy4hwphA9MAKdF7PJjhBfWSbdwWUT4xW6x0wZg6XUyQNO0lx7F0DTn+GpP0Y+iQdwv4FqI
 kD7u7xhNt4vSUsw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX/LMKQA8yZcoB
 Ewasgn3CSBmAqF2IEJa8Dondvl3C+JRfoPlWGW30IAb9fW1axqUupp5TZBRxvDwEBItafpIVW8A
 eqrfgGA35z/ABHi85zaOH82rzbDH2kw=
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aeca8ac cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xnt_XiUjAw3QdKs5wcYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: _H2MUtAD3Ak-0_icpWQj9K42Lv4e5C-j
X-Proofpoint-ORIG-GUID: _H2MUtAD3Ak-0_icpWQj9K42Lv4e5C-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX7k7fPn9vVzaM
 kh2Z00BhPgaNLBltCKTSTcIGs9DtQf+EL7eLv7/Ue0kUi+DRb4UY38V1tmkRyJf09L14F7glwjn
 bCAezCee/1DOp2KKXGoYX+QhomuHGRcOCxaZ0+sv+K9EO0TYYHTRniu30UTirkiC9ZrHbMYJ7Gc
 n6tOjZokNE+Z/9l8RY6m47+S7SNvK994TEEeDAhSfF5AwIfNQKtjEQmJZqYyogGPRx/zeVtK8kB
 kRy7TReX0L7tq1mRzY1lZG9y1l4oY+iyVjTlRmCET7KiIHbl/NwAoD47p3rYLIbstWRVRdOfIeq
 ZuXFdiQOOMONagaJA+8d9jcftT/aOChiHEKuzB9pPL/sNIZWbX75sGQtfGmD5Dh2N9tuNDA4jJN
 fyyMiIO8zQg8v+r3FstniCBC/nIgwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050063

The WSA RX slot mapping is currently computed entirely from the channel
count in .prepare() and pushed unconditionally via
snd_soc_dai_set_channel_map(). Userspace has no way to express a
different channel map, so any map defined in UCM is ignored.

Add writable "WSA Playback Channel Map" and "WSA2 Playback Channel Map"
controls on the WSA RX backend PCMs, using the standard ALSA channel map
TLV. Store the userspace-selected SNDRV_CHMAP_* map per WSA backend,
translate it to Q6 PCM_CHANNEL_* slots at .prepare() time, and keep the
previous default mapping when userspace has not provided a complete map.

The controls are added from the card late_probe callback. The backend
PCMs are only created after all DAI links are initialized, and adding
controls from the stream startup callback would take controls_rwsem
under dapm_mutex, deadlocking against DAPM mixer writes.

Allow up to six WSA channels for Glymur.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 193 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 189 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..6a91b3581c75 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -15,14 +15,117 @@
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
+#define X1E80100_WSA_MAX_CHANNELS	6
+#define X1E80100_WSA_PORTS		2
+
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
+	/* Userspace-selected SNDRV_CHMAP_* positions, 0 means unset */
+	unsigned int wsa_chmap[X1E80100_WSA_PORTS][X1E80100_WSA_MAX_CHANNELS];
 };
 
+static int x1e80100_wsa_port_index(unsigned int dai_id)
+{
+	switch (dai_id) {
+	case WSA_CODEC_DMA_RX_0:
+		return 0;
+	case WSA_CODEC_DMA_RX_1:
+		return 1;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned int *
+x1e80100_wsa_chmap_from_kcontrol(struct snd_kcontrol *kcontrol)
+{
+	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int idx = x1e80100_wsa_port_index(cpu_dai->id);
+
+	if (idx < 0)
+		return NULL;
+
+	return data->wsa_chmap[idx];
+}
+
+static int x1e80100_wsa_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int *map = x1e80100_wsa_chmap_from_kcontrol(kcontrol);
+	int i;
+
+	if (!map)
+		return -EINVAL;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		ucontrol->value.integer.value[i] = map[i];
+
+	return 0;
+}
+
+static int x1e80100_wsa_chmap_ctl_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int *map = x1e80100_wsa_chmap_from_kcontrol(kcontrol);
+	bool changed = false;
+	int i;
+
+	if (!map)
+		return -EINVAL;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++) {
+		unsigned int pos = ucontrol->value.integer.value[i];
+
+		if (pos && qcom_snd_chmap_to_q6(pos) < 0)
+			return -EINVAL;
+
+		if (map[i] != pos)
+			changed = true;
+	}
+
+	if (!changed)
+		return 0;
+
+	for (i = 0; i < X1E80100_WSA_MAX_CHANNELS; i++)
+		map[i] = ucontrol->value.integer.value[i];
+
+	return 1;
+}
+
+static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
+				       const char *name)
+{
+	struct snd_pcm_chmap *info;
+	unsigned int i;
+	int ret;
+
+	ret = snd_pcm_add_named_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+					   name, snd_pcm_std_chmaps,
+					   X1E80100_WSA_MAX_CHANNELS, 0, &info);
+	if (ret)
+		return ret;
+
+	/*
+	 * The core registers a query-only control. Make it writable so that
+	 * userspace (UCM) can select the WSA channel map. The card is not yet
+	 * registered at this point, so the control is not visible to
+	 * userspace while being modified.
+	 */
+	for (i = 0; i < info->kctl->count; i++)
+		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
+	info->kctl->get = x1e80100_wsa_chmap_ctl_get;
+	info->kctl->put = x1e80100_wsa_chmap_ctl_put;
+
+	return 0;
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -92,9 +195,11 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+/* Default WSA RX slot mapping when userspace has not provided a channel map */
+static int x1e80100_snd_default_wsa_slots(unsigned int *ch_map,
+					  unsigned int channels)
 {
-	switch (num) {
+	switch (channels) {
 	case 1:
 		ch_map[0] = PCM_CHANNEL_FC;
 		break;
@@ -113,6 +218,14 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 		ch_map[2] = PCM_CHANNEL_FR;
 		ch_map[3] = PCM_CHANNEL_RB;
 		break;
+	case 6:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LB;
+		ch_map[3] = PCM_CHANNEL_RB;
+		ch_map[4] = PCM_CHANNEL_FC;
+		ch_map[5] = PCM_CHANNEL_LFE;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -120,19 +233,56 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
 	return 0;
 }
 
+static int x1e80100_snd_build_wsa_slots(struct x1e80100_snd_data *data,
+					unsigned int dai_id,
+					unsigned int channels,
+					unsigned int *rx_slot)
+{
+	unsigned int i, set = 0;
+	unsigned int *user;
+	int idx;
+
+	idx = x1e80100_wsa_port_index(dai_id);
+	if (idx < 0)
+		return idx;
+
+	if (channels > X1E80100_WSA_MAX_CHANNELS)
+		return -EINVAL;
+
+	user = data->wsa_chmap[idx];
+	for (i = 0; i < channels; i++)
+		if (user[i])
+			set++;
+
+	/* Fall back to the default map unless userspace set all channels */
+	if (set != channels)
+		return x1e80100_snd_default_wsa_slots(rx_slot, channels);
+
+	for (i = 0; i < channels; i++) {
+		int q6 = qcom_snd_chmap_to_q6(user[i]);
+
+		if (q6 < 0)
+			return q6;
+		rx_slot[i] = q6;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int channels = substream->runtime->channels;
-	unsigned int rx_slot[4];
+	unsigned int rx_slot[X1E80100_WSA_MAX_CHANNELS];
 	int ret;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
-		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		ret = x1e80100_snd_build_wsa_slots(data, cpu_dai->id,
+						   channels, rx_slot);
 		if (ret)
 			return ret;
 
@@ -164,6 +314,40 @@ static const struct snd_soc_ops x1e80100_be_ops = {
 	.prepare = x1e80100_snd_prepare,
 };
 
+/*
+ * The WSA channel map controls are added here rather than in the DAI link
+ * init or startup callbacks: the backend PCMs are created only after all
+ * links are initialized, and adding controls from startup would take
+ * controls_rwsem under dapm_mutex, deadlocking against DAPM mixer writes.
+ */
+static int x1e80100_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int ret;
+
+	for_each_card_rtds(card, rtd) {
+		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+		const char *name;
+
+		switch (cpu_dai->id) {
+		case WSA_CODEC_DMA_RX_0:
+			name = "WSA Playback Channel Map";
+			break;
+		case WSA_CODEC_DMA_RX_1:
+			name = "WSA2 Playback Channel Map";
+			break;
+		default:
+			continue;
+		}
+
+		ret = x1e80100_add_wsa_chmap_ctls(rtd, name);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void x1e80100_add_be_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -203,6 +387,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 		return ret;
 
 	card->driver_name = of_device_get_match_data(dev);
+	card->late_probe = x1e80100_late_probe;
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);

-- 
2.54.0

