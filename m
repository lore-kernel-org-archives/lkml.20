Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731692;
	b=OYmcU8E3JbZNdIO1J8IAGuaUwtBoHhEiEaehzPsq1n4Vyhhj9G00eOT9qLWCTzttzgPK
	 05zVpXo9+50iR7J6teefcwgpXs11EmSLM0RKg8RwHeHq1GuuuIGjq9+gUMR6OIhshEh6z
	 xDKrcjN7b1/G4Z2iRmG0RACi6YtQhs6pZ+j6HzKhve4FaBkPmwMzERCok0HelqmYMS+ju
	 Yf2+UrAn2IcnherUCimnQnGrbaCin+/CS7n2h2h2ukhx2LkzJlwSedvZ2kQ0oS7iGiZCJ
	 2L0fUwsXBcmAicIyjdsDNohEyn/HT3W6fvBh9V1TGB0VtYM6A0SB3HwUbEaLxvPJJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBnuvWXr9TI=;
	b=025rNe/546bazmaA9XVXzaDw0jYvIVU6bESxN1AVgDLAfGc0e54u7PBVbHD2VWBdwuS4
	 CBhjwPKz7c/LPNyVcX6vtQWTdHwiI7cqwKmRqP1QFFovH87TIKQ3x3IHdrtv8o3740vde
	 oTSFyD6boWbgRtezDlzJ6D9uTJYv6alCd3JBZUy7m4FJdan0V5lI0aoeK3BBJG8l5e9n2
	 xbVSjufyeNtM7IoUgON7XRbiomu2OPf9VxWO5V96c3M8uxC1Qh+KG7e5pJ3WuAaOrHmUF
	 Kma3OpuZYPh/z+KcKMBOv0LJeFbra6DapzQbtW8TGVaCAbimVgfVDAinL7KwP9DV9ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cs9l87vu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVdLCmiY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C919606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C919606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cs9l87vu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVdLCmiY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ4Rb2586382
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBn
	uvWXr9TI=; b=Cs9l87vuTkVvXKfErCXerHgC2IEiwf9KS52H5bytsUWb1nIYeiO
	8R5gWcf9aiG2Mups64cNpuDlIMYznsKj4X23Mexik38GsLJlZprq8BIrp+SKrAlN
	PvVeaw4dMGvv4EePRj2A9B647jR2lUJrkDvoUfGSggQ4VwoZorI4D64RcysvcOLd
	BMRZ738q2vRZWisPF4CCIAUyTfwGk8YKMPtiZA5tAOWHqE5wb8ssr1v3zVWx8gH0
	6Yjb1RMpwFpRhOjX58cr2sjV5GaXX1KUzwp/fCFjL6FEvs64NCjip1PL2SB7bdoP
	rwZ9VyLmdMo8H6Em6LKpTGCrJ2H4MWveSGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbr5rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:48:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso6132860a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731653; x=1794336453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBnuvWXr9TI=;
        b=VVdLCmiYNE0p/ckxwtIpOrnBWNbUQGzWhdxVTsJ1K32in1Npnp3uSp1NjONbbP8wBK
         RWW799auLrBgRMsShzGGdisthPvqvahfMl4nSVw7YW+Bu3BjmaNzODXwONTPsC1K7H5X
         XZePaC7ym2rtj+Kn5GZeApPUpVI2vZlK6kZwa6l75cCIydFB6cA1aXPAEronjuI9DSBT
         WgBr2Tripl1AhGJ9lyrDJHxZCkk488/Q5q+arhmSNvoGK4rwSzufiZoC4jJ1IjrRknWj
         DJTDskbkDK3f/jmifCd9IMZukKUGpTyCqC7FeVSE8bYREbuzr1VT6+p1lNJA7jIJeOOR
         uSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731653; x=1794336453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAZJuTvAB1Yu8kSVtfgthhDvd6V0vylumBnuvWXr9TI=;
        b=jbij9oMrYHzS8K0dW3aG3/nfQH37iq6J3s3YZuqcnQGS6kpC2VXAMx6Vm3vT485+lQ
         DKfeBCFewcpayuX1A35KXUrpjyepRNO9a0cdLE0X267p9747RG+xhJ8uqGFUP6Fkb7P8
         VpdbC44UeGclB/6yqGcSfOQecRXO7O9EfH009BgfdLxlv+vw3wZH+AjtsH0p5UCLkpRm
         ASghwcFNhIp2Nw1GZcTjAyXPKEr6WdP5xszAmhHwgl5VvwH+Ffkj/JKzHkarCTMAmVnH
         ljYfoEsbSexSRkvrK92xBYYBwpJH21qnqbxGOa/+9cjmCzkYNOVk9W4A6nUExruE5gnP
         pHMg==
X-Forwarded-Encrypted: i=1; AKwUvBzc8xKJRYOTLN6nDOWKW9HuaUbZ60V49cntOfmwy7j1P7O76qqjxNND98FdzcAD17GIIQnmqp66eS57WKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z99kr86zr4bEd2aCFyInjLoLhu2h7LHu/6BQFrH+m/cuRe9MvIT
	0/JSmyGYu9ehbbpPCEr1qTjRgEGQMLxensUxcOpo5IAcfAFZzNqUTet6lsWakbD0uo7naTHOIzj
	kcQBYPQNw+YV1VOtjc5cAB8M17y1BfwwA23hSzvTZv39QPqJF+lF3V8MWCrX9jSIE1s8=
X-Gm-Gg: AYBFou1StuHqRCf6HFAfFsI2KuPWC6rZeIvgUzOhJkMBTpxAsp8hlIXwMfL+nj65hza
	ZuPsu1Gjdnki4/QIurQD3n0pXAbAvegMmJbm51rHPTlNUefOpNvNp8zLFI2Vr4lMFx5l0RxO/hW
	flqEti6AP2yfwVQmlA83q1hrPmseaB3o5+lF397PHbyt2+KQK6XkD+zi6Nr2Gptap/GG3MplSBe
	BHd1TXZ9WCw2xu2/2ERRjTvk8TTc0S2YCbUeAlhRmVwaXB9LujkkKITnPwoTHHCsotCoXI6v9G1
	zYyhXEH5YiV4fmiWD4CDXTszLpyLU7bhfR5OAptoBL9VfcNSGsKH50cPIIdOylg/i4x8GNCzcVi
	vYSjiFZu4o0kBEo25ebbyb+DOboP7MBznrrWDqweOP+CO7Qf1bCkfPdTTOonhzTgSbnLGwSxsC1
	bdhwzkLbEUHHkgewKnEhKEQJVyhcBwhF+rVjjlVERO6f/IqWf2wPVWSfmuLFs=
X-Received: by 2002:a17:90b:5868:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae8980a25bmr12072990a91.66.1793731652595;
        Tue, 03 Nov 2026 10:47:32 -0800 (PST)
X-Received: by 2002:a17:90b:5868:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae8980a25bmr12072722a91.66.1793731643317;
        Tue, 03 Nov 2026 10:47:23 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm5704537a91.0.2026.11.03.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:20 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 0/4] drm/msm: Decouple IFPC disable and sysprof
Date: Tue,  3 Nov 2026 10:47:06 -0800
Message-ID: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: yF7NxRzypQO8hmqXbinHhWt-CYgTPLVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfXw2v3fBtNu+0d
 VSWZlk4JCY6uMHh1ekZ9f2ogb0ukb/rYbQ2Qo0mgVmpwYhSIOTTWizxsMKHK+9wq/GTHqiwbs/5
 sJPOjj1HkzM4+b0k4Qeo8kR3+fgThGVTQk/clYpJtPd/Rk36YUsXbGdoeXD0Ll18/PnGmA1wl+P
 IhHVGljzcgt//n9iRAOLgI6jhu1Mosp2zIF2xWQ5T/YodOtpYqUjKvIyEIihb2BYE0K0xkiaLm3
 XCIdVE02p6b/gsJJaXnSw4d1viTlbcLHaGhjdwpe6wlx3wI7xOpSj7KvTqC7J+jcRVlA9cCbp+b
 H4FffPFEE1xOTXS39HqyptX/6iQrlNmUSMr0Nr8cDzbzOf7Bqgs81u6FmJ6vPhkKsYMioWvSO9z
 bsFHIYHFGR0we5lwHiCcfPpkdNOWYcEQNS4xIwQy+SSUZ2vMGW2/UUafaFX/wRlFUCMR71QkIoC
 9ABdBmGq3L7JeDeTCSw==
X-Proofpoint-ORIG-GUID: yF7NxRzypQO8hmqXbinHhWt-CYgTPLVz
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea2c6a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WAnUiRRfp7J0bigzDMEA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX7bntSWAFRfjo
 gjK+j8xLIeg5XnmDyKA297BJnssQcwUkI6AfKObn5H5FEJIeLugdjf0pWAIWB7PsrvTT5GlJZR7
 ZRJw9F2Pc8CeWxS+ZHbEs1Pd5tRvP6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030074

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

v3:
- Rework IFPC disable harder to play nicer with hw_init().  If we
  need_hw_init, simply update gmu->status mask and let hw_init()
  restore the OOB request in a sequence that won't anger the fw.
- Link to v2: https://lore.kernel.org/all/20261102190010.720443-1-robin.clark@oss.qualcomm.com/

v2:
- Fix double acquire of gmu->lock
- Fix missing a8xx hw_init() path
- Link to v1: https://lore.kernel.org/all/20261101174631.23637-1-robin.clark@oss.qualcomm.com/

Rob Clark (4):
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 34 ++++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  5 ++--
 drivers/gpu/drm/msm/msm_debugfs.c     | 31 ++++++++++--------------
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 +++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  7 +-----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 ++++----
 9 files changed, 73 insertions(+), 58 deletions(-)

-- 
2.56.0

