Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116751;
	b=bdUb7Qhq9rMdjA5o41zHzZFjq2RTdHxCeImkLwzdcknHKGK2FrF+XimD27TvtH2VG7VA
	 /7nxArFmwg1H4xQxCY0+wlpj2qau/j7Nw7+zLQOIqJw1FDl3PxYuK0bpCUVQC38484Df/
	 H1ABPcYOHSsKOukbhtxTN87IDcw7k/vgPNqs1AztS/a+MYi02H/MLeatFcQR8CEbyYjn2
	 58L9a5AtgXvvspAEhaqGHjSfdXscf9zkxRyk5z9s8v7Zg8ILpxOXworN02u47V3mhuHUa
	 jdSPsM/p10MXeROGFk3gl4rsUQGzmGncJKFrCFOjJ/adsAJjb1RspVQTulLM5hmcIaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
	b=05pajQqG9+2wtiLUPkuP0nF4KxHt9JV11gmNo8dvJvpEmTFQ2+op60agTAXFtmZmINAS
	 5v6bRQ/tjMVXBQs8ywLQUDUU1EgEsXW/7xv4svjF+i02TRJzioB5TMVuM8Wr0kEle8h2H
	 a6uY/3x5ao0Gci4q/IRtQpUbaXCaenLZK6rtTrnFm/BVND9XqHQSM7E+R3yt1MuoWcyKu
	 ClJt9UDIO+lCll1ChvwG305FK5aRa1jm96J3aw+9Mf5I+q2+/SvXMbXp9wU3xz8H8tu8P
	 xokDChMq992zFKQO55UtzPGe8xVE/kZFMEUztr9Lfh+E6kxaLa1SoSHFd7W6MoFRyPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4phRJnz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYBFzOY2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320E606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2320E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4phRJnz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYBFzOY2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKsX91521202
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=; b=I4phRJnzrUKYK7Br
	ACWx3OOv3j4NjeHcrYd6Xi6dk33MBsrOIp0fJlH/lEz1JMsJ2XXmV+omiIQjxpcq
	8oTNs7g0NG5bPoEQfOUwDUrBmAqZBbrLX+9N9UVK7IAxd7MpuKfy7xIbw9pgbw2G
	XtWbmpc++GA5r9ExITJBbVU8C4EdTRCxX/yxEof8+5bDfEpKfDLaU6ZM9T9VxrMB
	IC4DuXNZCpyd/4LQ+o3i5v4iS7wjk0gLWo1HHEkJDq1UW1yNkedYyn89C3jgEQnX
	KL8MtAYw7rW9G5V6R5kIsnUWCQqTwq8Abh8XtFima3Zg9QQ9yuROAvyYMYrqyzHc
	kzzJXA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98xdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:59:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc59bfe25aso97029137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116749; x=1793721549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
        b=RYBFzOY2femEOpAp/VinqOCHifwaLHqsGb/uVhBOAt4F0SGP6MRbCZaejX3XMvO76O
         ObHqoywn2wAsC89gvb4uMbRrAH1ThcPeX3/TvINmAWP1ugOln0KAE7CJU9VbmqEIDT71
         oVzfGFTYJZkAs+APukcSUFRM1L1ecME2Ppi1IoF2eNm3MAT210cufuJcyvwFreuAP2Q7
         cMiLBEo6kJPv63s7K4FqjGbHvlYzWtvl/SUPwVdE7/dOt8lK8Yz+g4N7JrNmpqJOyBWx
         TNpVLXjeDAFrrnamUy6GIF924ftx6ClEugDYU8asNwdALMnmjskfhM4lpwqHgXxId24c
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116749; x=1793721549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMN+ruGYxORaH9Ni1nvqyO3bP8xaG+U6mlmhg6vR8Ag=;
        b=eH/UGs2/q39ronJ5XmifDPJzsxEYNVL/KmirpgSFCi5oBrtcUA3RtsbfmpdEtCpC0F
         +glqWAhqBYQbpHPoTNWbsKopAZxY5w/OJKQwvrLNzLfeM3tFITJCl67e+CeXhi+6MA17
         Y8zeckr0THgoYTG2q1YqycpCJileuEdjw8Lbw4QhfU3SBLiTyB99k1RsAH6FsMEcqYes
         +ikO4TGuTcrzh11H0H5dFyGtLzW3C+3m2c/bwCOG1NKAD6ymcUqTDAueTGxB2r5223tz
         UrgCtyUVexQRYc1c3oq3mqrPdihA35pUvz0vul3FfbAJ4IkqrpFk9T3yXaTsEAoMxy/6
         f3lw==
X-Forwarded-Encrypted: i=1; AKwUvByK7DfKpExMfueNqiTnwH/ABNT+NCtucAj8YDZaTvn9Sb2yEVbf63scPIDsjFkO1bIbOtHGyzLS911jeQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKZdE/w4W+WdTWqUwEe708GTHjW3eNTuXK3DarpdQf9Ko/H8ix
	IJpu1UYfiB2638mqKkNjPzEOYzRmgCvl4rvrzeJcheKIiVVsgDGkEdRj7BYYYF6VVJ+XxyJCcTx
	KrhAckCXk3b9u00gkodZBQRGAyjXipYzDmcMPe2mCxkwWjqIKQuj+UwBH7ftRwNP7+Go=
X-Gm-Gg: AYBFou2vMyWzWYZpMzlDYoLRn3WOa4D1iXCg1p7sbDWgDNvxb0OCBrgsNyOmwpsiOTr
	mYC51sPxwJvwHyoIItctYTNDS3rmTYAHK4jQdhYwSJMB1zHyFWl0gAkf3Pe4+SpLNMivok4owF2
	TBOGljFwQryW7QADiNfGCTnxgATTbJwpvAptEU1XyCpoXaAZsTYZ3UQXkot+uVibRmolUnVKEOQ
	RXQ3UyXq0MNYW7soLRrEcKe6u/lY24RpUKRmDCf9dtPo+g8bMwYwAX78H3d6LQvKMshyABLrjwi
	TqvfbgkJgZaF377CtsSjFV9RlD8Qh9Fp06eW8enXkTlVInYJg5BVrtIZqFUscL74vQbFaVYW2TL
	JJLYG9PEH0yRpdt6YDypgkg==
X-Received: by 2002:a05:6102:a1d8:20b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ce5ccbc119mr3653035137.3.1793116749447;
        Tue, 27 Oct 2026 08:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:a1d8:20b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ce5ccbc119mr3653024137.3.1793116748950;
        Tue, 27 Oct 2026 08:59:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49807e07fsm148356a12.25.2026.10.27.08.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:59:07 -0700 (PDT)
Message-ID: <f6018fd7-8ae1-46cc-94a1-cca06ae318f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:59:03 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: Use PAS API for video memory
 protection
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0ca4e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ws2DSkxJg1jgmxyaqeMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: FmEMeQMIyAD4zSbrgMDZT9wdXdeZdKcS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX2WfZk/eJ6cck
 hxmSxB/VQad5l1zmxrMiVbHvE/X4TFk4VGMftDvgpzQ8R/xlQMZhu9mvTPDcTmiHaR683qLXvVY
 pw92kcV8NEW44mXpgoniOHEo1ppAuXVtwdtrcsefs1d/5do/XVRwPxTpuXwXnPsYsBUwohoJ+po
 LgN9wAfrdXnuOkOkxBLibU3zfvECxDIG178SvcVY2MDVtrWQSL16ehRYZLxBMVUNTtpzTWXBoRo
 2kJyoFsyllxgnGwTM5JkWTdtLuNyfS3qLvXS2KNOVLuUQOPMcvsLfzyc3OdZ05tBtTOYmauqaZa
 CwJNqWhR/2299u2eYgCMHvqbu7cfN+LYFDfQLl9gCVAPCYZ9jt9xEgBpjJxHfKX3t8GkaxqnN29
 bAtXW1OJePYdIyO30tPeDfnOroY6M2g9GbzIiKYVbwuiG6//yzV3pFe56LQ2ZmY7xr5WrFhrOfe
 IfSrue9+CEitm6CXrww==
X-Proofpoint-GUID: FmEMeQMIyAD4zSbrgMDZT9wdXdeZdKcS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX9QnwrbDUlV6M
 MTw+6RRrL7LLBGfWl6QeUIt4wWOIj1qgRTA6shDAJxYaygrJeRTTNzdmBThybJyZ7rq20CSllzC
 OFeABsVGlQnCdpcL/zqhIfPfO4b2ZPU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Replace the direct qcom_scm_mem_protect_video_var() calls in venus and
> iris with qcom_pas_mem_protect_video_var(), so that the call is only
> issued when the active PAS backend needs it. This allows the video
> codecs to bring up firmware with the OP-TEE PAS backend as well, with
> no functional change for the SCM backend.
> 
> As the video drivers no longer call into SCM directly, also drop their
> Kconfig selection of QCOM_SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
