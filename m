Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628815;
	b=Jx2MZxUgDVfaPtO5B9s0IxlJAxYOq6Qw2I7WKjfOwXCpNfRfrOcb9ZDVmQj81w3jMhRc
	 Cd/WhdGwIGLQAWcL0y87lgvgy3qwVi8nMq/qY3suMvaHfuU1bWtkaeGicu3xb71FN/kEJ
	 UXc7QrzOIPs+0Lha13lUZy1q8pG9T9IFFH13mPHDr2eXXEjJ7FbyveqYlvpEfAQE9KCr6
	 MYxZ3KMGdBAF64h3SBzsViMZJIy4DcTN4KbCe8HpTHa0V0aW1SnjHC84oYHHADebvDnN+
	 H0v851gJI39swpxZLPI4O0SRFcSMpbdw1oYLqlko0/uCRSOD1HcAiAg/R7xnP/IbhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
	b=ueawo+IQ4tmm/On3t4Kn0gR/bFCT6M0Gb7sJKhQ1Dt+1MZkxK4jDW/j6/sIin9kMpCn5
	 SZApwF6pW+bKSHyBx1GVoNEKt6kXzWxqUQuraFEtEbf7V7scjed40DBox90uxqSCkNsrt
	 dMiWzkmcrAupq0xy6mS5WlpeA2Wy1v6fJG697v7PxcxY7cx/yj0Tws1pc5pRqlcrV1ooW
	 1h077EcmfRCkl8xcH4ElxjQZjduvLqP6K33gGND7JmqpGu8Nk8Ebj+qCAXfH1r/Xj5mDL
	 bVULc1ud0QMhDzbZ031GMd/gG38OAgn9/kzDMPSlRKMalattJng3zydwqVnET0HHVDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSPfiE6x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ6JP0Q3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C35606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C35606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSPfiE6x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ6JP0Q3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpStQ846155
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=; b=NSPfiE6xDo/8ghGT
	6+PlD3PTv13crzBoIbAabwHN+sUM171Dsg0nNyn5WVfwt+FAcdD+TS8V3OFfYkJy
	eGBnFGmi6oe9vBGlWyuViw6kKM01FxVeB2sIY9rorxieaw4+yp0VENa3lh2NwTaz
	G8XE8qn2L/GfIw4rHpKDcikxHKxInEy9f7AHaUWnZ3fDGoivVY8/6d0qiR2OxX84
	5IEApv/Lqb+eZ6LJ452H4S0yDCKz+1BevqEP4qb8C5+JXZaF/GdHCCxlUiKy2Z8x
	mlyczYI61o5nzjLuwHbCL9qH4BGbBKRford8bYycfHwO+F9DDvbkV2erlr7kSLzL
	QaMCdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1syev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:13:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so7253273eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628813; x=1794233613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
        b=jQ6JP0Q3AT5LTg5mjngOu4+nnonZ3bu+jiRFUZQNCOEvz/ks4ba7E/UXm0DYj1kulD
         r7LNHjhw2ooyZ7BGtkna4LJoDjdcIrK6aHFhmkYL1i8sHPETl7hO6MtR/uxrpf4Gl0TX
         vs/ky0VmOWXCh17/lAjZMfZH4vPujucXhi28q2bip6hsF2FZ7kSGu8hijwTUZQ0n6n9X
         eGrcIWzmw+AS+flkmzyaiQgX4GBg+i8qzNPd3Yzm76hNVb/xyVYW1tW4HiMsW7Q+scYi
         N2YDeRdJMG++e4VdhqGKF1k+D1/NLKKelvfIO/U796ZOsw+ay3kbhmH8p93vVtSRDGNv
         FEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628813; x=1794233613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
        b=Y2bNtyccoC55sXlIR+VfyE++2MxdiIhQiy0AusTMlmv/sLppMZfFUlfeEHfaw2wTZ4
         8KPPu4inY6dyMpR0CVqOZnAeIHK4jeM7Th5lKxWsJO5PtdHKyGXMWwnYzJeRdSM/doi7
         +C0TgYKjU8BHXVZlYbeaBy8XnQyDbV88dJd8RFh53LlhWotvDMd52NalQVyf4ICu7tZD
         aW9OzdgSCp9k+HTWPPkYtigVks00xxta8tC7R/0zCu5Mniauv2MX88++NrUZeq4HuTu6
         sT80zpTnXp0UM3/49Sh9Iixane4ZSJNojiax2lqKQwjyF7+5tIhxNyXIR8/iguR6zDI9
         o0ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzp8c0YhOxQ+ez17m1o/lzvu8ya7raXuIP6JkzVdP4Yufzu6g8VWHJq/kPtOFVUfvhdZED/2ErI57iPOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W8OmCHn4zkEQlE9XmI/xJ2e92vCAvvOMbviygqegs1ftyoTBE
	Rv0Q1cpfaBBCKuQLF4uPulR6xTTqmaTU6N6+RFn7LGuOIVdyvILNUQxFH3kTywy7H2qz8G9JaDu
	GC0lOeSlKqo9hT518ACks28oCiq1l6qzj3Kp+7MNmPx8jwdTY95AKhZv3X9JX4I0iRbU=
X-Gm-Gg: AYBFou2vFZ+qT+ngqifaDP5oWsfpsgYyOgIgzifjjTeMX6mIVcoK05XY2UvyAO8YR6t
	vZJaqRVPDYUBq2J7lJH5HGavRSV17NQgEDXN680zKF39S8lvw9FdXyObwkdmbr5yUn/HBcb/vGz
	Jhvg7cm5HpX/YN+00a1otKqTU2/qTzeqsnYcxznz4FxYnDfDDhduP94zTCjlcED4CsOPwmVou2e
	gJgT17YWqYh8koesQVyEnZG3vUNcAkU1j6UGGF420YKTyab0GirBRYYwURrkf8sSrE/Zr5ncZZz
	vWaiiJuLXjb3IEEfC2D1cWxw9Hf1nBlnSAwIGaTnEix2I7fZ9e/aqMk38n3EN9rMMh60x0VDxMW
	EBryLfvwSGmv3B1pu75oSO4PhVvQPKI6jmcj1mqHW8IdVhAJdzPNiU5iznTJUVhU6LlTyBd6+QA
	q9uGXhxg==
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr14614532eec.5.1793628813259;
        Mon, 02 Nov 2026 06:13:33 -0800 (PST)
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr14614496eec.5.1793628812636;
        Mon, 02 Nov 2026 06:13:32 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm44416221eec.22.2026.11.02.06.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:13:32 -0800 (PST)
Message-ID: <97033b9f-8fb2-4571-847e-7ccab661b93b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:43:27 +0530
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
Subject: Re: [PATCH] media: iris: fix ltr count rc_type validity check in gen2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S3GUfNATtVBFz-XFFZ5X9Sip-GFTEcn-
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae89a8e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PxXcNx1syzcY5Y30yX8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX7dNiGHDPpVMm
 ylse2wRKjf8k8qPSVGVL+ZMO/Lwr/skUgsFMqWd2gJRMHgWEpszqPrnq89VGWQ6sS3CHQoY/OTB
 9zqCzpZkSsAVWria0N5zhRXE5MghS+dA4TOMx3v1VfclBBVnU6hJLwnAbm+ZQ12iK8yWrlWLIkc
 fPCrmse9DNSpomyGAxhHRIbbnlQW4OFxcFrSoet5BErRlQnOQo4u07s9ELvbHgYkF4JTm80RMEP
 lSRETHLT+5q+DlddUhXSC8NURYMvqKC7np8alme0xeD1PiEPaBdZwU1H7BcZ1MSshVJn8zYN2I7
 nJ3D7H+JDyB3RkV2L9Z49WOCDOKqocksRaomyOzMzfXdWIGPRfzBM+D2Pk8CI8FOfoqewEGS5al
 RM6u5NUZNJZWxlGr6P8iFUmeQ5l+4NzDQE6JK1udQyoe17jGIpaX/UsW/X1dmMp3NnP4x6T93x/
 DFOKempequnezzAeO2g==
X-Proofpoint-GUID: S3GUfNATtVBFz-XFFZ5X9Sip-GFTEcn-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX8xx8i7bsDyFA
 z5Wznr3HSxJ5UPZwuFjE2Pxt5L+FsHtN41GY2PAXKqJTzyDepa+LhUucpWnKalYllO71RGvXM2u
 +ulyvLCkM4CSw/fIALavzlCJj5TsIV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020056



On 10/29/2026 8:42 AM, Wangao Wang wrote:
> The condition was inverted: CBR_VFR, CBR_CFR and RC_OFF are the valid
> rc_types for LTR, so reject anything that does NOT match these types.
> 
> Fixes: 6870381285b8 ("media: qcom: iris: Add Long-Term Reference support for encoder")
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
