Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712862;
	b=FixmKUGhmPF3/Hh3ETjdJ9+A8EjhxM2EcruYF3emoellzsmQb8PuSYIHCL45P3NNexxk
	 HOXcUc80ZVQkwKBtYZZekwtnmm2kVAgHB688dhUwGKqxpKQnqWK8xxvuPiZY9oliXDn3K
	 Cj+89vAD40EIhpYLb47R/VrKMML/Y8msT9oWQg9P7HZ74VygL/E/f/JsAsUW56TOx0I1l
	 36CdXfnrr6TRHwkHmPQEZIZoBE6l47PfGGn2c4YmEosCLn5m3TokN5bcO8YmIzz2gfMou
	 T/Uv+8XeuC8/wgg9ekfwhhSHYEemdOmlD7/ZeEna+U4c6SNBXt26YigHQoI34os6r2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
	b=ONgdHbETkbbqv4vEqAwkqrquYALgSug4Q8Ab2HN4ZOTfeMT10p+mjHERSTt0YAHKzlpa
	 kuAHbn7sah19BmcMPzzy9iX+Iwl0v/5/0iWpMiXg1Av7icNaEPYe3ZRNA2FzwP8D9692G
	 kVlFX/veX9ryP3OS54CVOqW8fdV+4JVy+5MNzwg0YcTye58flNGoZWquW+0z8VMpWCAC2
	 ta757mV1b8pbdbMDaD0DtjDWmjZCiGgb2QTcRMDfjWwlqq6zdOoXtx42+Ba7SgdbxD2mF
	 gXW81fNxWMoItCUbBpMsFKwebn1rBt7WtMaWSw00f6BW0RMd5E2liS/xlb3Av8lS1Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZGiqkMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aagYIyVj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838F606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7838F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZGiqkMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aagYIyVj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF0wDSG1022091
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSp
	zOZqoDXE=; b=TZGiqkMmHeGm4yVAh4UduXar2iwqTnsWa3pMjlOyaAc6awINfja
	aoX6R6itDGStu4vGIePEUd2bNdmXJdebKvgZ0CBcLi6vkedBaR79iq7s3s5jux7G
	6MmX5OEeMQASrtk4JsjL1n1m811Grw+DHonv0VL+tGBinfN/fj/N9x7qLZE/jEiB
	XZhEV7FuJBol4fiPAQCYV5jMkIdO5HWUBNUTfVhWyMwAOH56f52eHCMXRwkZFr89
	o5G8KxAM6i4KnK5mTv8Xaijjp1R9zMWM5NvTQ6gO44Fc6C+VXosv8yTISoy9No+l
	OGd+KU/1ISXwSa17rBsInbFiAoHZWyM5Y3w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx29rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:21:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so1202425c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794712859; x=1795317659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
        b=aagYIyVjyJLc0oDXsoXVUAnrcNsPPLdm1AMM3JLcX74sHr3MyUZPvazc4sNeFMnObZ
         jQ3p0LKVzs3FT882ObGz+kTRl6PvzdqrB9wuTc7IqyMHiOe9poC6H1QCtIGwIjuvTV53
         NZmOnmbO3xp8O7eixttg13Al95Qb5ZLaA4nA0yEzIDv6sRXdVNGNX29TeDmMvEHRG101
         j1YIuvu0R6NYkhLbgXC+mIHAJkYwc4GjDxTKL2Ya5/5+g/NhSdDFpNNskg6Zma+OKeNJ
         xaxiTjfNxmF30b8/1JrqFGxn1L0GOe9Zhpv7uzAHvgBPm4T4BhJXrDg0t+N5BPOIKiTN
         D09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712859; x=1795317659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
        b=W5QQTIHlaLCASyGuko3WG4UQGAQsq88S194c2BTF/m/oXjUXfAlYZu9o1rFcPAFdH+
         YhkvoHBmKvPvjozuyfpJxk1VOMZ2oWqU5R13KlKGCCPGr3Xt/fZJdR6gSS/BxL0FN9on
         EUVCLZWq2CtjuMFOXNdi0AtE1umYXd7GoAjtUIPkRqBawLzfN7B0+wvieU9fL5XPJTeb
         6BkWGM8bCM0GVBb1alXwv/gXbCXOMFASfRqsi2ZrDW5qAczgynD/VwWxYpcitaTiPCFY
         mrsd7zxaVhKuOwa4FfnUGCX5bhGDtuqkBbEhIMdEoIMoMa7DCQm6zb78C5bLnzXHjpJV
         WeBg==
X-Forwarded-Encrypted: i=1; AL+hErHWGrMtsVCMQ/wRW+QCq1D/xQitSwpery7p5wYIC8MizKO8gZrVaGOJHsXXrTL8uxrISzlHqkzpb3fnK+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9giwwEviNeeU//j1eCWtIAZjcNjP80tIOqBpIrwfTrFy5WyFsg
	6g182MCyHixUOX6+Y22KYkq00kd70ZsanHGfdk3ci8bYYJsn0066RQiAi67lSF9YlTrLGrVisM/
	zr/bNs7qQAnGQjdwtqn9Zdt9ahtJXwVctx6xeXwThJJ4Q8YzVH2rzbk1WRts3P4ceBnI=
X-Gm-Gg: AYBFou2pulzGbmcevL4a29n5UR+r3Z6Q1974j3663fP15eGsiY8eAiDB4GftLPZBjfX
	bmaeDLUzdqk0i9+FErxJRduxNdFMdAr+okv5aPsnX2cEJ6JyKNDqc2ZEy0AzNzWT6Kck1mWX7ok
	8HzoKB7GKuVIXnLqYgf33wHE0pFuKym0p6UeGy07n5OwnSwihc+ABOCat9YcjYPa+fd6V8Hgbut
	20c5qhl3JboethxvqOAeBIJs8D3Xdu9N5AvCYqYmvrEN0KsB44pilz6pFgwkOccQsFKWanwmP6M
	Z+8GFtsyxjXjIgC3TWwqkjItIhlsjNnntq0XhNr92BCp6c18xbVYuWfEPwxhrgrmC/xfXVYAGC1
	3NB/b/FHL9ax9ADMV+/i/JuyzRXFW5d8TW1bdk2EIaKWBVq7uxYq3IBtjo9Z+lW5wRjBaSiTyoP
	Y8FWKKjnpERlKPEl+OdZ3OYLGGA9iYBljF
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr6379931c88.2.1794712859080;
        Sat, 14 Nov 2026 19:20:59 -0800 (PST)
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr6379913c88.2.1794712858434;
        Sat, 14 Nov 2026 19:20:58 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm21300791c88.14.2026.11.14.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:20:58 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: qdsp6: Fix audio after an ADSP restart
Date: Sun, 15 Nov 2026 11:20:24 +0800
Message-ID: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfXyiVybgHCb4Ql
 dHEcdiDQGimGDlPREXeSAc+m/vc+xhUVLX2FWRe4pNDLwLXbq2OMwg2N+kgz2mP7bp7ipcB+KJl
 PyjfF41WR8O5bZSKHCHd2XQXv76uOlYC/imqjQNLLU0m2vYvI5zEAQZDxzrBkftDRozglFKCm/x
 mv/HIDycGDetp/ab2jy5scRGSFxatH1bHnixZTT2fcJAtGdgbBsXO+VXYPVA37JKUiwpQWFIFh4
 iFjuAGXNAnr+AKGxrztmNaV6tQqVqYJV9GVHqovyJQ02RJZtUR0hunp0fXp7sSBcSexhb6Qngtq
 1t8VjiCrAJ5ggP/UcqlB+E+nr4PsBxDeQNE2txhP+08rWhlRb5h2yLYa0FpIyE17Lqxcaa7GfzR
 Gcu8ODvrsjnMt/ooWm5pCB+6V+mwf2PIrpgUCX14sCin6eqj2KAILAT+c91mky/OzzP9PeZLN5B
 Wg62sul0GG4FNZDBPPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX3mnY70/DSNpq
 nj2tbFEXP+QLWyPB/g+T1pAVV68TMohXPuer906gArEwLD36mZqJ5/gyt9a6/39zjs4vj8cb623
 zV68s4RYv3SYWDkgq8caEuTkiHOnpBU=
X-Proofpoint-ORIG-GUID: 1MB1tQExju0uI1nJRMW4MiQb3L_VjRWb
X-Proofpoint-GUID: 1MB1tQExju0uI1nJRMW4MiQb3L_VjRWb
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af9251c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=G7n33azJLpTFfIg68gsA:9
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150013

On Qualcomm Nord, audio does not come back after an ADSP restart
(echo stop/start > /sys/class/remoteproc/remoteproc0/state). There are
two separate problems:

 - The sound card takes 5 seconds to come back. The q6apm GPR service
   probes about 0.5 ms after remoteproc reports the DSP up, which is
   too early for SPF. SPF drops the command without replying, and
   apm_probe() waits out the 5 second command timeout before the card
   can bind. If the card binds earlier than that, its shared memory map
   times out and the card fails to come up.

 - Once the card is back, playback fails:

     pcm1681 0-004c: Failed to enable sck: -6

   The q6prm clock controller is a child of the q6prm GPR device, so it
   is unregistered when the DSP stops. Its consumers stay bound, and
   their clk handles are left pointing at clk_nodrv_ops. In addition,
   the DSP forgets every clock request and vote when it stops, so
   clocks that consumers held prepared across the restart are no
   longer running.

Patch 1 polls SPF with a short per-command timeout before q6apm
registers its component.

Patch 2 makes q6dsp-lpass-clocks track prepared clocks, and adds
q6dsp_clock_dsp_down()/q6dsp_clock_dsp_up() so the DSP service driver
can mark them lost and request them again. On its own, it does not
change behaviour.

Patch 3 makes q6prm keep the clock controller device across DSP
restarts, parented to the remoteproc platform device, and calls the
new helpers from its probe and remove functions. No DT or binding
changes are needed.

Shawn Guo (3):
  ASoC: qcom: q6apm: Wait for SPF to be ready before registering
  ASoC: qcom: q6dsp-lpass-clocks: Restore clocks after a DSP restart
  ASoC: qcom: q6prm: Keep the clock controller across DSP restarts

 sound/soc/qcom/Kconfig                    |   1 +
 sound/soc/qcom/qdsp6/q6apm.c              |  50 +++++-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 147 ++++++++++++++---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h |   2 +
 sound/soc/qcom/qdsp6/q6prm.c              | 190 ++++++++++++++++++++--
 5 files changed, 350 insertions(+), 40 deletions(-)

-- 
2.43.0

