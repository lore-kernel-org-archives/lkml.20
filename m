Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089948;
	b=nmLAAsP7EvfI6Qw/VsDuzSOb4IzxrUBz8i5EdDCMXiD9zATeNbjXLC4TQRwSh+egKUyZ
	 I3hAhc+1u5x+tQRLcBf1rgFw5O7wk7GBb2Tyly+DK7coeNqDMG+CRd7PhQaiatYmk2lVa
	 7UThqlznJLQhu8mndGjM80EtMc2P770BfOauDeeHn0ai1Y9t3Or0izyBw0PW8UZgR2Nd/
	 KSEVkxY6g2HXjcV7VfHOVDr+PYE4dKzerTwToeILTCco55IxuArvP80BvfTKI3qVYp4jf
	 jALrkCZoKq9JYvh3Xs7g+OvYFAol78JUQhabs/4fGoSfqucpYoqZBYTcoquyvPPa6/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
	b=OA7WT4j1DNlTBg/J4kcbXVojXjrYPNejj25TrWfxGZG0eUp0Pp4Lo2hMYwpe2hY55GS2
	 jx1eZCic6KWj0gceG/gLSGrMgvBH7rMDpUj18VeXxhBhuzvOVXWUBYCJWACTvuTUN59rU
	 O8srnXu15ATF3KNbDR5ndq4nOpbLC6UmZNX+uclCpnjTgZiMsHBa4Qc+yZgP5lRMAN+Vm
	 EzXv8k6i4pnpndLLdRbFny0i3Qm9JSdWaRgpZvLXNPgSW8oLin6KlX04R5uCRhyjDgbvz
	 IxKbgAE/68FHmergS+3syjPTMBagMr4o6PN8vuY2CxjeEKQrXgeJ/xok/WE1+eLDfzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnY56bfR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CC3606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CC3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQt2Um62;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnY56bfR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iABu403980
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=; b=TQt2Um62gtkMeC33
	k22+7dsfMQTEI7Kgd83HTKTwp4H7RqL923gCm8XxzINjxyHejBhRbEmmmaC7Vfum
	PevcXHhi3S+pCtKRgZRshE+q5XdPhT7KIssVXYeJkO8QbghKB5k2RocHTIoXHMWj
	EgSdBXIKJXMGmlitoV+fo7wKULJQ7O/qPd8wDwDnPvBqWfKC9cT4/xkIe+W7X5Eb
	Jeh71G3cnVriK+q1nLXLxwZo4yyqYXNE74OhipIao6TGexJ9/yzKB3Rr9P4vijrr
	+M2hobyAxe5bgWJBnCFyAQtVykzuqmRSrTmCby97G5eDXt4T3/W417ZUqJ9sufJW
	Tz8p4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t8kf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e869e00005so63413785ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089945; x=1793694745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=AnY56bfRrCjM2X+JiPn3aPRTTPsA5KeKrsovbhCMsJLIHXhb41gw8xszL3bd9mIaee
         +iJ9Ni42lbtqzAgaibnqS6Ik/Wh1hVjUgDz0tC8Jeu4YrdyFXT0oIDeBoKOOTkPjEsK/
         UWH3N9TLtPr++rHMtDXfDWN1Mzoaz0eoHV8uxX5xkpK0Pi0pYhp4vKRqi2NQgXLpuw8g
         iEFDveqBxt8K/cQd1aFwZ35wK0xFjFzQp66BtSE/8/qq+uRfRpj9WXk+cEXtsvrI0QTX
         axnOXjELhUXwDfKPb932aJm6QlMSYwLwfH2SX+rXxStzNKxLdw0A2baCCrKhtifpq4jV
         En2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089945; x=1793694745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIPK7vTkSczwuA340RrBsGKB3O73tDTHXNTr7rnt74k=;
        b=zxCXdSInfyYrDavWgoND/j37ejpcN/RwuET1F+itbyb9LY7OFihEPW/25dQajU1MYE
         huQScYnnuYyhKW3htiQLfpeAGHOrYvPN6F1yfMKpfbY9coCfguEiamqyO3kjsi2LSsH7
         4yZAx3bp43RcVDa7kkz7aWGAHLuWn0e94pSnb/uxOT2p5uHvj0vHiSfjgVNZEVr4qVIV
         779mLxFc7alLdiyExoiRtBOEJM3B2j7xWFfIe7T4x8SM9ZzQGeaDFQxx6ll9m9vLwDvX
         WZuJvApBRK0o5htY7CXlGK5JvlxEO1aYYEx2EcVEoAgu2flrQf+E7Tp9hhgg9u+jJysq
         7syw==
X-Forwarded-Encrypted: i=1; AKwUvBwpVZUj2luzFmFDKb2AmB95IY3YVRX1psMCEIjwKJXK/S3qvxxMOvQnxVgFsq9GIW/ZpE+YpDbV6KLwvMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxkuqYcyF8TYrzXruyYdUT/Sl5UQlkfE7bFCoDe8MyJ8qCD2yw
	6HDWWZHDmb57/on7RoZOdukxUA3ANMJeW7U5XliDg1dHKRuJebW6ecNubcvPtt4Pg1KhDF0f3FU
	/A0ObamTi4i8lfcqOVAzLtqSSqtQZPVDLzA6O15QBaP0N8VzpFdS8GRXOSkTslr6z9sV5Qps3bk
	k=
X-Gm-Gg: AYBFou00/4/95PgZpc8sGpHyxMmkjzBr2cmoK3csGZcj0gxlNrq/sa2UZHm5MNCL7/G
	E8GOmoUGlwHGwLMg5t58aC15VTFVXBj4Zf6MMMSw7rrk1a69pR6vaZAhI30xFImHX+G0ggpvSwc
	JDRykDJTpExZjchO3/OjJIBNkB+Nq7g/nZo0uzzs5PEI0ExFxBOWMQCLPy5+fIvpI51r5K+VQ61
	Gsu1R9rEVQWrpW7hK11ohfbN4yMU3ixrhQdyRL3B0eVGuJZjsU2jwt9GCoDO20+Tc5hKrtuubCO
	Hug2nbM1lnOSPy8JVzdOMbcoFD1To08IavQK/rBSfdvcHlpuMPvrp8jIn/Fs1yK0mw9O0q+1irj
	6rMLIgOfwTV1SlXrh3ZeQYxUekwxeryCm1Q==
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69648005ad.34.1793089945455;
        Tue, 27 Oct 2026 01:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr69647855ad.34.1793089944998;
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce0f45sm5545525ad.70.2026.10.27.01.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:32:24 -0700 (PDT)
Message-ID: <37a69bec-db13-4acf-82c9-854fdc441ece@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:02:18 +0530
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
Subject: Re: [PATCH v1 3/5] ASoC: qcom: q6apm-dai: Add 32-bit sample format
 support
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0619a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uxQCGOQySBFxhreOsTYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GyyG9HXoBbahgp27kJVz-HFFLvtCPmGW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX5cX6P0DOGdXx
 6K94Stf7tlaLKf3XADqETMN+kMNyyXYrFdMKbzHD+BZ13M5NhLtmGWklnmBdWovMY7Uso+gWn6b
 PmT7nbOhKYPMZquI/ugagdM2uExkcXc=
X-Proofpoint-ORIG-GUID: GyyG9HXoBbahgp27kJVz-HFFLvtCPmGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXxHlgtCRnxw7N
 F41D+1XcaXcN8JDlz50huUNZ7SD9QUzK/MXAHf0mLZ+uxoUVFHB5nNL7zJjsZfqtOHQgHiwAErM
 UmSHF12SQ5xnbuSr7g8UvAUgSv152srsHaUCrrzlS6/YeG/I+7mvUg1WEotnMpO2gpLzhVCz5Jx
 KaN4rwsy59IQDeLWwIuWDRgCxnZBqhefhhGbHKdJIEfuksu/sd95WmfsEnAcy78l9KXA8ihi9u8
 uWbcuiyB5/rvixHIfp3nBSZFWNUi8DH5vcJwP37IKS85xtOhxq0Z6+gh2P0zyZpEj3BuSim8rH4
 ZGe+xiaO/wrngLzXNxmzovWdfJg33CQWthzQ2t8XY81QAryQwLCtPR5wlBmJ/HCbf5gEdrj1jtr
 cj0rqD2+B8d8JeWEUb1rbYdgFL+EyzW0aXmc7Gt6Jz9Qe2l9G0fYzWZHYBJab2I5oftcamsUZNP
 PErJ+56dLVMZhPBsogA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033


On 10/22/2026 3:13 PM, Karthik S wrote:
> Add SNDRV_PCM_FMTBIT_S32_LE to the supported formats for both capture
> and playback hardware descriptors, and handle SNDRV_PCM_FORMAT_S32_LE
> in q6apm_dai_hw_params() to set bits_per_sample to 32.
>
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

