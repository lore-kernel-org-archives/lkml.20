Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304710;
	b=kBVEDJznEnSrktQNVNaXIsf/1cBFXZ+G8MpeWbK60G/xqx5fGKNE0MR8SIlLEPOSd53D
	 KBzhIDBGgw9w1/T3hKcUicsNNLwO3vdV6y97jF5m72pfAK9tVGgGx7mqhmA5L0e5fPQqd
	 SPyDh29d9gz9e/+QdyU2ECDLQx4x6EnbaquDiopPLmEa0jBbf5Cob3x4Ng5kWsiY9vJOO
	 xMqHDfcb43pjGboUEU4IKILPvQnUDumMqnHXPwYPRKUb5AW1gHsNtqIZOKuZBO+GEBSKJ
	 rFMDHU8/oCrfLJL3j169+z20Bcs85frACHMW14dVEjhEfllCKBwcpdok0tt6VAiT+cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
	b=GXvypfw0inap5ojCdPtU8ubgzfXiedDglKzvTEhDVjQS1SL3EWljBJxEXk8nUNJbBL+N
	 QMuPV7+tD7dk3ORtLA4uPkYKdO7/pFWw7PniMnrOr+LvAtJnWCcEEXUwVpjzsQLdYbLNV
	 U6Wkc+xbq5PLDGdlc5DGcgoWlG7O9lOBK3DXcrbNZaw/h5GaHNjDs6PD86EDq2YdBeJQj
	 /H5LJPxnKDJsBkF9noycTuIe/1wYUvapoxAme9VpQXbw4r8x4DHG5hn6NnTPKSEViHOF3
	 ZDgvTTfF+HuNm9+0Ti0qERGInsgEhHl8pLB1OGm/kyKOj+jTcs957Q58/6atFavZXFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCBIJFac;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxArq+YW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1096260A2623
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1096260A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCBIJFac;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxArq+YW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lG242240852
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=; b=nCBIJFachyn1nAcM
	bfTG/ySiVrCPW6gSlwvWhLPoutyqyBjmCNVsk8fhT2z+jPiTMJBCGEiZyw+C8cVb
	FoLFQjsRVP9oNrcaRr+jkwniThjiV7ovDqRpxxVAIY8j05mKOq+UpgVT8jMcYI03
	U/VAunD6PTxnFsvqSb3SBiqX8Dtqhr6RDMeUWKhhlNl3gf9sl33uwxmvy7M4CBCK
	KkHKKMrQFUNO9T5IESADpSMEUZxGtnAklT2bYDJ1Ph1+Bbh4NR+hEdBqnCvuy9QY
	SyUONvR4jdS2edncRq4nezYLHMqHuniIp7w9Lf1YGrkI/R8nQj+nqRSEzZ+3ms0I
	F4B4CA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1ena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso2351785eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304709; x=1794909509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=YxArq+YWom/w/tDrNMK2pE9uxOiRQMMdH8tRBNf3E3uYjNnK4DVkBCHLn+OSaUtcvz
         Uztw4K/OXtRhw0ztN2pYWFfNSMPsBbVGegueC7g1ovsNTpjjkt29UMvQxjBeN+ZH+Guw
         W4aFswJIiEiuPUTmNK7K2Y8at7MMV7uBDhIBXN7zMVHINdiQvabtGNgWWvLHuqmJOJmG
         NuirCR1ob9AfyhuArWE6bZS1pnw5p8mg/AALOWah2P/WRRIm5TbNgCsl70qmvt+qvFnB
         hxs/+4iKc/Em5N/mPHGLiON1yp1C9tCvThbAesUS8dZhahmBFLeuEBQshRHzGYDedYLd
         pjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304709; x=1794909509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=bFVn2PzKSZIQPiwILrJ/eUf9y+IoB1VZPH3afIcD80kozEPMB9Y5BDFdTeAUDgxu9R
         4pGWcl8reHqNVJndXWUjfJoJ3rc1TUKYQtwBOM9NUGK7HP6NpDH3d1oiU85aW2LxDvLD
         o6IZnZJJ7Bt/8/le33UaRFIm2jPzPNHLRKSk0yObjl9sEG3789lIZK/Hiwsa+SgifvhR
         peqa7qOzjuRfz1AZ3WM4EClQwdRlL26J+0FY/DD7NodC1UTQb/3UNdds7idobKFPY+0J
         dA0Bf4Oh2wX4ZU+ySJOm3yXeDJA0tcYrmtLPB7UA4EbD9mynOtQ6gOvLwL1qwbxcnExd
         3nqA==
X-Forwarded-Encrypted: i=1; AL+hErGvees7ACFnCHmXCB9QtCCgRY1IpdhDfNlUCVngk96iju5uYmOO17qgxt/kWttU3EDSkHAqS8XW63Vdezk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CwJ6oqXC3ZwRkp0FDdN60BjZ8YZ+3pbLQ9otNZQLBYhjXYtfr
	AnSut+ych5mhEfUDMsv62ATCA215EMArh3hsNRvarcGUuMv0vJxHCd/U4zph52XbJ9rWUv7nsgA
	nxVaCM2zKVxfMh4f/bA7rj0NFTzYu6U0ANTJFQDPvhO1O4NMtLnpHuOgB0xsfM12XEr4=
X-Gm-Gg: AYBFou0WCetPtqTDjue/3blyQYDjjZ5jYZyg37lXywrZ1ComJgzBtQ+UKlD8WrmvDsn
	HZYKNuh5M9mrPAeSogtyxKlihdgl3A60ZM2cFIRWhqDWLEH0z67NEoTUfaHpXrtw3q8e5mM1sqs
	JRou6/UsCqBxdE3hXCooIMpEvR8xbYU+tJiivBE8cLVSVbW/A7xz6AYtclJ70wkZuS9L1NuhBFl
	RZz7xLOvXzp8fZSOVYFy6RScKE8gEVh48k3vMWvqG+TTPLXeA6q57Oa6i4wLT6UezWmZqvjWFDF
	EInPpvt4Yo08/S5xFptfajAbdM0t8W3LDY+PpIRkZgrhg94BSt49GF/wX0XsGmE3+WmJNPOdY5q
	nQ6MXVxqzzEfz/4ofrDY2OmOSHUm8y7XxmgpZJFhNfgORtgPw5m8SkO9gOyn2CEIIPlnlwlOjha
	6lVRk+Pw==
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr2779895c88.29.1794304708396;
        Tue, 10 Nov 2026 01:58:28 -0800 (PST)
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr2779872c88.29.1794304707825;
        Tue, 10 Nov 2026 01:58:27 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:27 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:15 +0530
Subject: [PATCH v2 3/3] media: iris: Use firmware reported count for output
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
Message-Id: <20261110-fix_dec_seek-v2-3-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=1644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=w2OxykH7sbFu9wsbTswZwhTlE3jYoJAIFTL8aWVq6mc=;
 b=dnMxMPuhvVOA5TkV/Y8KsSgljPBw02l4Bf1/AwRdFsliQ35CijLJMXKxTHFymnUYrWUOItdbA
 HiE0PHibsA5DyQdP/mIBIMC97Uy1hR8/rPC3ayDjMvk0ybhLtqAHtdj
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: AX79vuJI0m4T4cO12yNChIOaSf24vGzc
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2eac5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX7wmHWGLNSQwK
 di4yYkf9K/s3y2gP9iJLRqyMEFIRjyXd/YCuyiNdynXiDItHPQKWtoYjYqIFZJbEHHeeSGJQCcB
 y8TCHCX7H+KP0yIKGEG0X6BPtTX9f+UyBbuJAKLtbkhXbiQQyirKbahrLTRWZxLblceZhkjtRlb
 Kr2dauHeb+a/e1yuK91utZVfAtvJT6JIk179kO5Tkt1DGo4UBIsKQt1zlfNOraYY9r8KBKJKuAE
 e2RPd1gTe8ZOTNAyAMzPwkf0CiuSWhTq31ogfYDgamXcmZxV+HUJvdl3HBsA7Hw8qOlqy356SO6
 iUE1kVMgN1kXzJbgSKqW4AU82ATYV4EmALMx+mPS7ZeqOjO8VuIkfNmwo7n0pe5IEhb9U9h9tFl
 aoRx+hNHP+eDILATwai9nVpR1MqT53mXXymQsX0O3UVojX32/ohGA1pmLVODNwb7CyML7j64ksB
 cc2pOmY63YwqEOn6vWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8THhcZSzj4ri
 9EdWb+7Z5OUtFjjiblLj6bOH3RXIjthcLdnwk79LN1XRkRnTNdFmgfmKu3BmaLaQRZTtxMQh35j
 SqjRBdacBjufu2ZthxtZ8BOz/la1oLk=
X-Proofpoint-GUID: AX79vuJI0m4T4cO12yNChIOaSf24vGzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

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

