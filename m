Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391606;
	b=QiG82fFyEC+0TgSF8XRKrRSK6ekgYNUsjlpa0IVNxd6yzKwVox6CfBPteNL+CPu4bmyW
	 nasdMLZGxQYMeebk6ElGAe4+pIUUQ11c8YQyzLtpj8esMckXbrnuVvu1OZGlIJjul0qka
	 Wuv+OEI6A+euYPRgJTXbI6YRtGeoa97PF7kY+HEzGH749ZCDdl0XzS3xXcCXaB80ZUh/q
	 zfG58Uu7BBhLJtvB/jwkc7ie/Bk22d1CYMYIA69XXxGPD8qWyKOlJPXiKc+0ih4JKTFa0
	 Tfl7tn/o8xSG+DdSD6gl2qNRZqUxCA0jjDpaz1MfqEykHU2mmPlEGnklXFP08fVHPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
	b=yZai5E3xa9a+mNuZvZPLI9jnDPfMbqpg4zTB5U1cRWLSakAWgHf2codkK2uU9yY0Bgik
	 JU2vCZgFSTwyXlRmxsMw4a2Slcct7sxSx47wTD/eC8NzZhlWyC2V807WpLM3jle2X9wuI
	 meEfrSkmvZzpBivuXrx3aDIbQxcnqH0gbhOXAY4QR0nKyux7JFOCyr//Ao+I661aCd5pW
	 0GiDoJHX+zqrHNW9KZRu1GTq5dUjGGJqwAGqatXjLa3PGZvTiD/XTTi8OJnSIY75mfEtP
	 H+QitqvsFbRyqOxNcbS6cHdhwt2AsKcwM5DATwfNqA2G5Ch5cRJmEQPYCZag6rS2rzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PCeNAk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bByUs+UH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2DA606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C2DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PCeNAk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bByUs+UH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhTZZ941865
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=; b=c9PCeNAkIQY7B6SD
	CRKBDrmMKqxNYarijMkARimArCFg+5WcKzR43Z3j40ITGS8sxFfqbOtG0JZcbBg1
	mK6Q9NTbvljTcErpe6FCShVXCqo86BSrK0rrW6W6neIIMOA0AntP6Zismkhk6GgR
	aG4mpfXZiEcwLcGa54QEPuQcElxWkHmRTGTSozemjkoh9ScZGgyJFsbuJrmwNkU+
	IsWuNF40mS1vbR7jLwu1BYQAIA7t27W/u69v3CjxAQT7WTZEX/SMO7fSPZ1Qc6jV
	3Xjcu/KfwfJKBcY08vxGlvgW8PjidnE681izC5H4drJEFTJZ8xMHC2BNT3LRg+cc
	VYosjQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s389ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2533897eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391604; x=1793996404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=bByUs+UHHfEk7dqOkuNwcL2IzpKU/+9JEcFI2CEbMS+cvZNXgD8+z2s7by7oa/qosB
         9JRltW4Po3iyZOolezFmsz7DAwQmxNGZaI+F+2wAmNnxAlIic9JZaYBIkMJPa33PXAUZ
         +tjqXizg9JTJroNn+RBmRLEJRhWfKMlDr+VjJ5EdyUPlZhObJhD89/+HevuJYGVhh06q
         2oJ6R2Dc+1HgsHL+Dqok6HI+UJgv2QhQ7wUmwTXW/tZSkyZiEF9hK1ClM4xpo7w2cRQo
         vSIBeyNqlbraXTPTeAf7oNdFb/S00Wv9VqFa3dMDuUHzi4K9Ni9SArITlN7+fF1ZNC70
         V1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391604; x=1793996404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=uj4kga6uXALR4rfKfg9FkT4IxSJ0CAi0XchxpkJC4TIxCPNumrGwrEv6l6Mm8/tWwc
         AKm+1/9najNMxtQmyD5QgL6Sgu7TN8sdJqzH7m3Wg+Rp5Jgl3psITttNWNpFherBdI4K
         fKNTRmVPdkVVSrTKbl1hPzzea5uM+ilmnweHGKRWnLXxm6vd4fIE1kRfFbWwqpQvuuoN
         m156ge7mvM7ygvWwfModclHqOmYFyK/5xS0UflsXcdw1tVT77g93R6G2x3JAJ1EoloOb
         PVzbVQFcWCcUcH3j1o882U94pBYIHvxIAVf5+H4JuCQGjD7CEIV7P5EDUhYK+P3b0nH7
         nBZA==
X-Forwarded-Encrypted: i=1; AKwUvByIAV64wEWgOXy9H0pL7HYzpKYgdpooVYupojIylm7Q/zvV69OQ+XylMpGIDcLpLcLqobi5PTnQ+ZMNmig=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ce+bFzvYp1HY5Yhiq2v7sBBVvn5iyZZ4kVqtSKen1LO+XsAs
	5Pf3+ZpU10xiYHHs7WadIm9d8JkCxTtr+R0qJ1qj3BCtxMCLUcf4muOD6Vc5y+8GREhkNyFkJsw
	KRuImyBjVNAnDI1pJLwEUU2/Pe1ixeXwcICL1ooUH/knZpFJXi5T0P36AU3wcniMZBy8=
X-Gm-Gg: AYBFou1KVhm916x1v8CPddj+kAdTcIu9xUH66usOPi2sdilbQ5FCgyaZ5CEWptkSIXp
	yc6olBtRasGYWso/GZelcEv5pvNbsthdBed028dTxXYa9jQPwKRaWah6GL7bZ6089wlNKf+fbK+
	KcDGjZpeyXYOjIChHFegMArSHc2NwEAZSR2kVZ8KXKLeax2w8fGi6O0iX87TW7JSCJokK0P7H1D
	xZaPnIfc+ZXUUmcerFGRPb1DPVyVPY5ISoZkpSdKOm5FHpayZU3hNpfAmsct54YSvX00c1wsen8
	20Kn9yQFCHK89FdJWZYEfJXlbW6qPnTQCy+7j5LWP8C/9m6x1R1tPbs469DgslYxY2+t2IAMJfX
	x8xE7LOK7zPX8C84OkDMjEErrPxUDzUyo5BcQgGIhfhGn14npwQkzcC62BM5rShflVVNQzH8jSw
	MnS6xKWQ==
X-Received: by 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr4432699eec.26.1793391604437;
        Fri, 30 Oct 2026 13:20:04 -0700 (PDT)
X-Received: by 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr4432655eec.26.1793391603841;
        Fri, 30 Oct 2026 13:20:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:20:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:11 +0530
Subject: [PATCH 3/3] media: iris: Use firmware reported count for output
 buffers
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
Message-Id: <20261031-fix_dec_seek-v1-3-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=w2OxykH7sbFu9wsbTswZwhTlE3jYoJAIFTL8aWVq6mc=;
 b=/7IpBs82XJf7ZOkyCgyvFgHeKM15bwLLOH6zmIi1T1B6daJbr34n7vn2DkScsKUm+/zR4obkm
 udz9xSEoYXGDRx55vAjNN/Gf8K2dX35xni5P4a4WOyhkmfiTtif480u
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX5ineaHYV62JA
 0QLU2dLmzGc8INTUlXV0UNlQnlsb1dWg6HbVLsQjIa5c11LHzJ/RdRrBKQUfTkSWNUcw+FN8F7x
 wyAKhXlDVEbDkiuNeoGdq36Ccig0KJADrhz854KUDoD7c0Ccn2oVbjdM6Ed2lK/ZQCbD1Zw2VRG
 i9uyymd1ySDPKeAW8+8segUmANA0eMJN7ANWx8AgQkEQ7u1o2KeYa5UUSKdbpgUQDGRMQan6bqI
 tKitXCVU8a/8GRUmG+Xij8TZLvKJzIouV/AVUs4PtCAXMh2TRaUMvDrMokoaghzWPi8rH9Lw76a
 VlQbISkPM7Z7YAp/qSygGI55dvNPqMDBQeZ0n8srHZ8yF093ZFPH52I9tommn+WAcmSNyHks6nJ
 rO3JnadGgioJywM2pBvPpnYukamzHwYPs4Y32rPH4M/cDBkCuDi2XinJUmToqDrqD3MvzSXWrv+
 Iv/hYs98J+uTpmixd9w==
X-Proofpoint-GUID: ztIPvlADKm7SihJhb_2yY-7yo9UT1y07
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX5CcLeeTpvCk2
 U3EHdB1eR4H+D4S5knXm/griBOaZjqLvWIBqyi30mh9PnQNFiaSyuABQgXpqDKl2ic6+2hDbeW5
 JnwynANT31XppuFR+xOA8tkEOsijhbs=
X-Proofpoint-ORIG-GUID: ztIPvlADKm7SihJhb_2yY-7yo9UT1y07
X-Authority-Analysis: v=2.4 cv=XMul2ghE c=1 sm=1 tr=0 ts=6ae4fbf5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300081

Once the firmware reports its minimum output buffer count, the driver
still caps it to 4 for VP9 and AV1 when split mode is enabled. After a
seek, the output buffer count can be lower than the minimum required by
the firmware for VP9 streams. This causes the firmware to report
insufficient output buffers and the seek operation can fail.

Use the firmware reported minimum count as is. The driver calculated
count is only used until the firmware reports its own requirement.

Fixes: e1f5d32608ec ("media: iris: Add internal buffer calculation for HEVC and VP9 decoders")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e6..57467c952f42 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2375,14 +2375,8 @@ static int output_min_count(struct iris_inst *inst)
 	int output_min_count = 4;
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
-	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) &&
-		    (inst->codec == V4L2_PIX_FMT_VP9 ||
-		     inst->codec == V4L2_PIX_FMT_AV1))
-			return min_t(u32, 4, inst->fw_min_count);
-		else
-			return inst->fw_min_count;
-	}
+	if (inst->fw_min_count)
+		return inst->fw_min_count;
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;

-- 
2.34.1

