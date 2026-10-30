Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388025;
	b=ESwN4YW1BciCLpZ1+PsBKYfJJ6QzjBFFFJDBqgRUqJ/7m7h6fGOXuuK45CkvXCQ5av0a
	 gJY0qEBT6sB3EEYhtSD82vUWoGVTvFYIn1kvItczXbDQoSHkjUwZXiOyMkL5TNtEuUEg+
	 jANXhds8K7g905X7rA7o45GWznKmZCzWE9OjZ+HIG3+JeKVFekX+O1oqoWX+CSv02LT9E
	 ws1jw5T9wfudMz8Mg30sEYK4js37iaHOZNKIJGfAnI4DrEKawI0/gM+dxQB2IjpYSTefl
	 i57u4KMJ9psN0jlATi+XBoGKPgsRXXcfl+nDZV0T6csL/kPn8GE9farAq7l5ZCQU7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHGhNRMzRi8=;
	b=EeeNJfS7rrmmLNKtd/L+RZDxbkk+24SB/Huau6JqV1Ygc2c1s7KqHYOyEAhF2G51btT8
	 ENGP4aocsp71rDc/bvIJR/PjHaXpyVyAN/QqnaiPMSmqSYp0oJiPMKXT6rh3w1t0zTPaM
	 5VcZD3hTlyoRe4vFgdUnYoFKXhD7g8EWkL8W1bDVprblajomiM3cyUkd98e5SvaY8CwY1
	 KP+VbJHBXv829avx/EHKzjO0zxnG7+CEfJH3s+TjBluA11rwRkgarRgMtwFZOOmXj/7qy
	 0xuaIatQatL2GD4cYdeC0SWyMJhLNX4UtweONLvorY7/71W6gByM9mWvgBe7TuRCuhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RlvhKzhb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RcJI/Yjf";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F7D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RlvhKzhb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcJI/Yjf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhUfw941908
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHG
	hNRMzRi8=; b=RlvhKzhbEf56zUtPosl2dI9UbSsdN7a8c4KbdUEHwlVuOGnDpuj
	Rpr4UoXTo2YZNUQUEQZDBpN1IphR6XgCfxie45mT7eb4iVsU5jKlkEx/4UGkJ3kz
	+CZvIAgFGfUfZT5D/WMby9HVqnlLapKvITGCm3iGgyM5nAO5cycQKDDpvnyM/9u5
	88bdXuDzfpNPNLx0meOgusEVC3WAA9b2GTamzoiVRex4eJwg09gccg9+dNRDewq/
	OO7cs6b8LeT/mXTdSEc9I/+K8C8SxnLUcZqGpHRPq5op2o1ZK44XWGji6L4xzh+8
	pvTEJsJI2SatK3iB8CETxLU8NturAJuYb5g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s383ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:20:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0bf2140b7so19384607b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793388017; x=1793992817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHGhNRMzRi8=;
        b=RcJI/YjfE/1MQ8wSzQAa34lfLMILSAKsWYkQNBcIHnfXvOZKw2ubUCQVKOAUzcZg/e
         OZi+ZFfWJPswST2aX/ojJtryAz7qmuFtuJUHfPtlbo2ISOYV/dqARPJbFzqv4NtQukmY
         4g5DtJxoqdxMLLID9J9FOhi0oFD/N+7TwyP6JaB6P4ycQFcdvu3cAitJlVy4rvPzqLfa
         Vdhv2gzDnLF7wByHzlWkp3Ob/lbg309z6DbGWnkB5g5vMuofQ1WQUPE4zipFDJS6kQ4w
         2+waHe2HZnQsGzAQTYeNoygbmeeP5o8/i1Ccc5hI5cbn4zvymXiLKcl9b5QR5Z2E9vKI
         EmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388017; x=1793992817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ShQl6WYAmClLLFczEcBV6XknRwLtOiivHGhNRMzRi8=;
        b=mMvrUBdG5xAq6TCb2QoCyp0IdcH6us38Hy7wOZbTbSSqa47QOTdrufSIwQsWhDlfED
         XeX79Q8L947Kv4lIWQfFlryWgBQkwH84exTCjETq/zHqOVDvWvUM4mnx4lusxUWlp3Ou
         cRhYgEsTsMwGqPbjDkowKUeus95UasY/z8lzMSkvLESe4+UtaaQ/6G4YkkDpipP+6Bhq
         kIZ3cORgCAWDjwavl4kg8w7ocV1RzrRcQEkbxg/430p1kz0cd8HbdfgBJ2Pupc530ZP+
         BlvmK9TmyPXO1O1M8ahXk/j7ADqbx6L4ur/yTKOt5oTnZy1Ed1eeWdWyElHRUeX1yTRr
         cCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx/qt2SQ0J/+Xn5vodRuH10UcpCrfTaqCUz35DlVno4I+lq+BbSSjlYFJYWIghEvGhmrKROfffhrZ3g+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKUicsk1NGFifdK441JI4AH/HgmZgrurnhGJgbaah8LtIHYVIb
	J7jGwZ3YSif5ZZbAzsvqSsxdQL0PSnGz4OOtB1gsn89YmnixBNfK3cMuZ6mhtM+NZh/DbzU8HSK
	1LK/Vx9T7I5xkRzcCcQgyYCMgt1DxKKNHFyLB3IpezSlJjxT6S1SAZHs13Ab/C4QU2ms=
X-Gm-Gg: AYBFou34BX2kLxsvWzIL9LkD3jHU2Z0dVeVlro+6lH8q3XBeCGP8ZbfS+3r000gbS+j
	01C9boAw3vDgWmLcg/gE68MRiIRQBLb/2Re/vItZA9hKVdo7iTzSTEWEw+bLvOuS07Lzs92mNAK
	vvuEKd3GbvZlXf8GvkhZcPmvmgOjX2Ey1towj/aB/uI68omCiD4EeIHCWQ2+rkj7a23DR47lA97
	zNmLH1y1BiN0+K08VxcEvDneMbGm14L/zgJhsODtrTY4EV2Lwx8UcWof4Rf8m38UXBNSBbBczCa
	pJetNGvDjbPdKjLnlyP6z8x7oSJK/jPca1mgkqihLksmK+0gIIg2DunCQz98QX2Kx5i2ddbn7kl
	ITwSVkv/KJtsMXK/CHp1tKgTRklYlzjzBAEqxlSpXgh8/gkZy8QpFCJWDvsYNfuS5R906Ipju6J
	GrsIj9TgFT5lvRB2X2CenJTKsGRTGC8Q1+RA==
X-Received: by 2002:a05:690e:4141:b0:674:e0d2:7e12 with SMTP id 956f58d0204a3-67ba508d010mr2233311d50.109.1793388016777;
        Fri, 30 Oct 2026 12:20:16 -0700 (PDT)
X-Received: by 2002:a05:690e:4141:b0:674:e0d2:7e12 with SMTP id 956f58d0204a3-67ba508d010mr2233286d50.109.1793388016327;
        Fri, 30 Oct 2026 12:20:16 -0700 (PDT)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b719d2d5sm13185767b3.40.2026.10.30.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:20:15 -0700 (PDT)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: fall back to MX when gmxc.lvl has no levels
Date: Fri, 30 Oct 2026 15:20:14 -0400
Message-ID: <20261030192014.694393-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3NyBTYWx0ZWRfXxbBmrpA7hos5
 oO7cfYsUDQCsrsjRooqblRJ89PFc2+euu+rsXZrkQUhRUr+VnQvilXbgZO+IvRGZHQ+zDo82SHt
 Exi0FGH8MHuWuHim50l4BRP5KA4Vif4ncE7pcYRB6wC8cJG3a+ewE9SULrQLZKdD1u6K0LrnUFg
 INB9CguGYLTXL0jMo2xSb1CSQ8iciDTIh10O4LBaKEX6/BZswMZwC+E2+JQonB4G2olnPQrN/SA
 YRsghSN4BW22hPEDL+7D3LXDMedrCXSfCAX1werQ/FtIbD5JhNAkNBlEUkN2hmcyEto81qAAWt/
 tPndUKBhNQOzSYl/UBMsxMbFhxbx06Qw3O4NkPeaumPG5o+bTnDo94ifQervY5cSttPFsd9QSd9
 880PplXBHzCKZ4rMy/J0qqbmhObseVElBBe6nV6cS6wlFadLHyhqWI88B49vwDtloClUGCJdNuM
 nzNTaQUae07DJ0ML3Wg==
X-Proofpoint-GUID: RFp1ari6YDSK1YDtBk0Dtc5WQJ9at22m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3NyBTYWx0ZWRfX98+5x+EDMeKl
 SONu90p8h8IoJ3mAfT/JyUjAsQbSXE87UdOWV9eaeyc5TbcJWmSyxcSyLwNzi0Eu84skG5DAPBn
 Zzl13tfqebLE0Cj35x9xYSmtOJtTO+E=
X-Proofpoint-ORIG-GUID: RFp1ari6YDSK1YDtBk0Dtc5WQJ9at22m
X-Authority-Analysis: v=2.4 cv=XMul2ghE c=1 sm=1 tr=0 ts=6ae4edf1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0bFHTkV68l4dVm3UfdEA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300077

Eliza's command DB has a gmxc.lvl entry with an all-zero level table,
though Eliza does not use a GMxC rail. a6xx_gmu_rpmh_votes_init() picks
any gmxc.lvl entry as the GX secondary rail, so building the GX votes
fails, a6xx_gmu_init() ignores the error and the GMU gets a zeroed GX
vote table. On the A722 the first GX_BW_PERF_VOTE HFI then times out
and the GPU stops responding. Before a6xx_gmu_rpmh_read_arc() began
trimming trailing zero levels, every GX vote silently used level 0.

Read gmxc.lvl with a6xx_gmu_rpmh_read_arc(), which rejects an entry
without levels, so the GX votes fall back to mx.lvl.

Fixes: b5269bf0e1ad ("drm/msm/a6xx: Factor out RPMh arc-vote helpers")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d52..c42e0d4fb946d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1887,15 +1887,16 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	size_t gmxc_lvl_count;
 	const char *sec_id;
 	const u16 *gmxc;
 	int ret;
 
-	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	gmxc = a6xx_gmu_rpmh_read_arc("gmxc.lvl", &gmxc_lvl_count);
 	if (gmxc == ERR_PTR(-EPROBE_DEFER))
 		return -EPROBE_DEFER;
 
-	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	/* If GMxC has levels, prefer it as the secondary rail for GX votes */
 	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
 
 	/* Build the GX votes */
-- 
2.47.3

