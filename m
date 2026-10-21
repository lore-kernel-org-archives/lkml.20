Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555864;
	b=qlaa7CvlhV9C6V2To7uwjQ+vGa0bljWcVQM6OMB0eUJc4bCbKKjwlNH31Jh5S3GGBYzc
	 1aSr7Uvh0J5ltKGsJI+oQouWoTLXAdjQWcdw3j7+yWD/SSwXQOKDsSQVX66eaojIzA3qJ
	 ZIJDUbxzK0OKXJK/uOrfWeW52QBejFS++NRmwPFG3HHuG5OopwMPeItPCu6eguvCaQNGI
	 OsugtOCgv82MYu5ipO7AztZffB/Lj9wI0Ymr0kLyjmaotw8rweZyagmSZl+7H5uuQgL8T
	 qAKmTnM5R0QEyB6Jgmgh6cjVS7dmQBvkRLq38e/GrUmB1ezbfxD0mWYEzZwxzO7QKag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
	b=jrOxOQye+PyEMNJ0KgIHoyWXP7JhAWQPMfLn0i1pWJb5AQL/Yi5B5bXGv6f7G7jcGfs2
	 0MBOjp5yNUmLtUT7TtbXhTfAXx708w8TfCngVXSTTLmSCkSvLVsGNnX+8bc99V2UQG/yL
	 mRcqOqsUpSMuELNt2T9BDQBvrShhgI2tNhEDYieT1PyQUKmZ0pIpE+03fLeRpnIi9xJmy
	 7pama1nCQAfJoy+rTudklNQi1ihQ6A1r181bTrnMwzN3vhGNDeElRHGmGsXxXk87X9fGN
	 ILfprVo6U6hAaEGEFf2u5Xkrw0XfZyarmZlPAtnD6yC6NnEMSFVTIka5LPqnSkCfgZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dl9bYCHd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tKTbc8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5541606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5541606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dl9bYCHd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tKTbc8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F2Lt2897912
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKf
	to/eg58Q=; b=Dl9bYCHdXyIwzUyCF2SeUA9h6+mQAojQV0JJRQjd/I2qcojmpyE
	HMOYzLUrvalVi6CvMM5kEqYTuEWRFJKz0RW1Tj+suGcXJ6o5gPaA0el4MfqhVeK2
	0fbASxwlzyWzs9zTh2uqHmESWFxrwrDd40Pg8qYAnWn1kjKpEJX2s4ExPDBhv2yp
	R3TlzxxVNGckdg90CL42xSpYYEuZajc0hR0KM3BFE/wGy6KZ7/IL8R3ke4UyNy5t
	f0f5bDsRcnHUjgU4Y++bPOIl+I7UtXJTG+CYLK+uKwvtr8yO6qrrCDpjsDljTCu8
	Lm+JCzxM5meG84GKrWcwwpMJuIez2Ot2sGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0hvve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:11:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so587066eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555862; x=1793160662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
        b=E5tKTbc8k/N6cpreQNznQflMHw+T4CaWLFtXqeYgrd2Y4gPACS7ZyWPvIKwctDHgCv
         PpW2M6QNpZzd4xQQIKkslqaKKypkmItfy6q+CH0L+LOnBwd81vn7tbfLrbDTb5LQReGd
         /4fhCTkznf3HqIncp29pJzFSZfbS8VAyMaTGjptZmUGLv39njiZSq+SmoLTWWXqQaMMU
         YTHRYboVajDir3pXb9oAAkwZxxJlA5srK2NffT9qbmkT00+go/e9gp3z8kI2yfBmn1ub
         C6uUcH9O8sJmHAP96n5BTrHO0ukqdQkZrWXoql/raUK6eo6RgmueFntZ/qXAXNytWhS8
         tDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555862; x=1793160662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
        b=DHsLK/UOiR0wWTJhC0pFaEgZgN3WVA8aIqGXtpvnfKYJiVqYKYJhKGCISBnOfPAcZz
         dQJbZRF1p8R0q1wF+qZ9kLrtsKJLDDm7tYdKqUE7ntcZqrRgsYZ8/jgO+cqf+eQssSDu
         MuURgP9RfuqEZAiHEbSIfzUQpw9XFagjMwkOHB9Gw6YUI1+loZnuoptmGQLyFyvYPl5G
         bLfx5f1p37/6C43MVyRcFgYJIXYTQgxI8ZQ6Wy5tIdDY6Bj03zrk5aRs0g+otOcpjlmD
         9wDC24PgQGpP0NtXDP3kefxrMzWqDnQx6gg3m75eeptV2GIikJB6teHR4ExILas+By5/
         0jyg==
X-Forwarded-Encrypted: i=1; AKwUvBwh1oBey40CNkHFCQSIYR7OEUiqcAfxj6XcxGZTSBwG99ZCkhfiFdDRPhvzhjQB746pUrOrsnRy1fHIf+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuGbgF4kC5T2/mvSAW7GHlHM4/qiZFKUODjIHHjq7YPSyDQK1j
	OKwazZLFHwoAr5f3xO9NGS24PWicZ5GSu9FMlrOzUTCbD3sCzTv7Jv2L+si51Z6g4FT8PRaeiyh
	ECzoaibZZBauc9r/CuP2u8H2p6LFRGCGNXRn2XK07B12RNZ6AjVxXlBvtfWnukHExi2s=
X-Gm-Gg: AYBFou0o5bLWa9fyxA9YQlBAPx9AoRqqie4x7QhHK3+InUxC91dM6npwVyciV6YttsE
	nke37lJqm47kZRVhJlBN5E5cMHDYBLg6amYzM9cW9fga4jCIV4tOfmE+j8WGN3peOqllAxZuhCR
	MK+smQPdK9fvSMcCWxXEoKpqWqW1jU0iYe0IHthuoles5lPSa0xLo0QbhPYD03RBPajlkxGxnns
	CCdB6PYztSc889VhvgKowALIdNiIJuZ5CfwaOcM9VUfwCJhTcPFHpimrTpzht3adT/INTogax3z
	rjn62Th29Bfvi4SKjT8lFDbjFmXFc/dyZAqcK9F85+4HVHaEEH2ULNJdnvZwkBQ3U4M6AEGqh/m
	FMI5tAKkQmv+V8/ghSxakoAjlfR/TvFUFBJOAk8rHFwpxkKoz0r2+VBT4f00=
X-Received: by 2002:a05:7023:c019:b0:143:7001:7645 with SMTP id a92af1059eb24-190a8f51d82mr965140c88.47.1792555862066;
        Tue, 20 Oct 2026 21:11:02 -0700 (PDT)
X-Received: by 2002:a05:7023:c019:b0:143:7001:7645 with SMTP id a92af1059eb24-190a8f51d82mr965116c88.47.1792555861468;
        Tue, 20 Oct 2026 21:11:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Date: Wed, 21 Oct 2026 12:10:41 +0800
Message-ID: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX3q/XYwSJfdSv
 vMsp4Yx+w/4L0bNaAhoSzxi40D8YjcH5cUHc4SHGF5Wm7w8UHwme43brsFWLXmKik5Jc/ndHuCi
 UfRLDxcS8IImQFczxEh1c9aj/ZCwMX1Azb0ehzFbfHdhBxCqfdf3CkwD2qhjSHL64Krbjkp8HVd
 Q0qeaPFqZliKXJgcvfK/dbIDkT1ZClkD710PED2jNup17gdaek01bh4YZrGFogp343fXKmcARlA
 m045ana+lMMXtfZlI8/S2nRLyFiGX+sV2EzrfpSHFSLzgFUzYRfbX7vwEzs9WSbjkIB4Q/HuUsA
 uA69NiAFZCz7FZi/8jBU9cEgEZJGbViPrk+lQNw2TEJGVzjSTCiFQ0/7hYE9L5yOEo59HywNmHX
 5aPsWkV0MPUo66Os+8WlgVfoE2laDT8l83uqPEdOiNr06jo9HJMcqWMcpHhsDQCxGakLH82/txI
 rHf1+p2o6CLCeVBjY5A==
X-Proofpoint-ORIG-GUID: 4XLumE8S7IJWHG7BQQWtkTgKazxT8iEV
X-Proofpoint-GUID: 4XLumE8S7IJWHG7BQQWtkTgKazxT8iEV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX/lLOhw9L6qOw
 IdJCsnWQ82GAjlRamIfAoHesYWMIjiPR6UabyGnaYlCoLSqx8f1B+QC5tyZkEJRGBu1xllZjPbW
 QYtIc3drRL8e80yJn36eIxZxSSXB7c4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad83b57 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jKFkqTp6JJoCw1ulDCgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210016

Since the early buffer mapping, q6apm maps a front-end's DSP buffers
once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
few problems, which show up when the sound card is unbound and bound
again, e.g. by unbinding and binding any codec on the card:

- The card core removes the components before it frees the PCMs, so
  the topology and its graph info are gone by the time pcm_free()
  tries to unmap. The unmap is silently skipped, the DSP keeps the old
  mapping, and the next bind fails to create the PCM:

    qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
    snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

- Once unmap is actually sent, every command stalls for five seconds,
  because the response handler matches on the wrong opcode:

    qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

- Unmapping the position buffer clears the circular buffer's handle
  instead of its own.

Patch 1 fixes the unmap response handling, patch 2 makes the position
buffer unmap clear its own handle, and patch 3 moves the unmap to the
APM component's remove callback, before the topology is unloaded.
Patches 1 and 2 go first so that patch 3 does not introduce the five
second stalls.

Tested on Qualcomm Ride board by unbinding and binding the PCM1681
codec.

  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Add Cc stable tag and pick up Srini's Reviewed-by
- Link to v1: https://lore.kernel.org/all/20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (3):
  ASoC: qcom: q6apm: Fix unmap regions response handling
  ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
  ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

 sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0

