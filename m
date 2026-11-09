Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196953;
	b=QB/980P/Bjfy0etNBM0HrqrI/0amMovpRftMYQziW6ddY4Csz1oLZgSEwgA/ds3B0WNG
	 wUdqhqoeSihD79wFT1p86uDl+GdboxrTxbXzkjY4A6lyDRkbKNv2GdDzM1t2hHRVIlLkR
	 LuZguuqW6mdgj02DfOOObbh0Six2OhHp+6OJCpShEOzx0QK4xOpqAclMaD3+AXdRRCMrJ
	 Sp6o+of72AaSBp4/OPuYbeCregeEuOM4EB//Ue7L7Y7t/XI2vK1Gp3H2o92swiFOfkYRf
	 wHnKDH7kLMd0EK9uyEMg5Y9EG5DuAbIWvnoyS3IKDLKMWLhYR20l7og5szHzCptwECQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
	b=ijuMUJS8YXNsyVSrig6SLRo4tgTngJkyihPv17nz0QYLmyioPNLcdSwFX+fy+A1Ibdbr
	 Vv8SgEHpeuKLgv/WMnxyL76UhXeaJY1bXGay1kYZ/wv1JaV1tm1enoE84886jNTkG1IMz
	 tJH/MAzz3xHPd5n3lYITnxMbLPmlT9F2Id47fKt8EExfs7JTtbaXrWc9UU5UFuizsESsf
	 OtejeA/MYML+XdvJId8j3apvlkG1vfNWbtll3TDE/dAHHFOFVfsO6Tb59JMErvazri/Ei
	 o6sCVsHW9eJ1NzKnrqsNHQNKRVnWQ+WsX2G+RFg8Nzyzo24XQ9jp6TR6jq9usyOCcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDOiTAdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwU4uHIJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81656606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81656606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDOiTAdm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwU4uHIJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KXIx1650326
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 04:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=; b=pDOiTAdmr9cXisFc
	CXuOhoe5qaukEZgNK66jbOkle9aT1U1h4l2Ay2IvDH2NnK3zcdoi3Iv471yhaPAB
	RrqBjafzB0ddn/FVUfMLakALSpAZlbs/HgpZQSTKwpsoU1iLZTBf3AB9ZwnVzQFg
	tryyKmlp9JMx9Zczg2B24TDTK5fSWlq8BzAbElL+Jy33MmP+ImFb8Rwg3LrMzDjV
	gKCBYRBE7Yllg312MdeuzHX2E9+4DFeYB+ipaXZSyFow/a78+3wcP9ZONA15tCyl
	XRlRph99CPXWbMmRv3dzKeigsrPmn6ZB6D1pF0tGZWVgUQ4N3alpZ5u+Y71QRFds
	52pwKA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k4ebn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:02:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso2419172eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794196951; x=1794801751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
        b=ZwU4uHIJNiPy+lL5JIKl3QKEjV1BS/cuG9QGrGLUHw5Cs7aSVa/g1Y+CgoAjkTwv/L
         Cv2sDk9reYEAMC60TdTgiksf5cvoHt3zM0sCg0RKEl46OHCHUXtTzJUO+KNngX5LWmKq
         BLRPmWarL14GdOcbYqfVw04eLhumOoiXSPxZPaUCL/i7ALSg66zNrlcDu+y77bxwk8Xv
         Lp53yK36IsNjWmlUyjcasqvjbIIOeUL/cbduPyNMW2J7JgHBBHwZdoD5g1Lz754pR39M
         vC1OF3li/sTsa1pPA9DYzYByhLYA3wHhoQyF/L6Gh+YVHYmcjdkc8Ae1oBhPg2CDdnpx
         ZCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196951; x=1794801751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
        b=j5u+MFzwlyjjdLK4Z1ff0d4efnKuvwlCCfbZB5rYw8XSOH3IFKzUDt2UdPNm8RYNAg
         w5xQsfRQHcqugxouWmnDKkDrzDXYFQiMGQS3zvUp/JhveBXKEoAiCmD1Z7U2eqfevybh
         NTXlexYbWaaKg75iRDQ3ghp1ORHrWtk+WukUDp1wQ4wqZJ0don8F+I/OP7I/79khxvO+
         yywxluP/0QDK7ip+pTmU76U+f0pf4s0g9k1z7ltmhN5nivu41ySN/ERaKx8Vr8mTlXJV
         DaqcpKFoU+a4CQM2YnpWovYRtlhiieyiM0r7YhoAeGEK6b35kWrhOhmWQeew1PRUfIbA
         foMQ==
X-Forwarded-Encrypted: i=1; AL+hErGTAPOnK8poeufFPmMLn2eNZM6KzTDgYqf61599M1NKQHLnsV2rFyc9sU46HLje4gv5TyXyJYgIL7oIbGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TUq2bShj+p04foBOyGoTdNLZ7drZg2ipAniMViilOK7fxFMiB
	fzx52FgxIThXOaOOfZ0O2waygVayg5b6I13olz9Kfm/UYGC/aXBjdT7e4WMHHsyNhj2ZNHKoGLE
	RUcRgAoJUPtkxZh8Jc62UCcn7vPiFDfs+EgEO4uOIvXBvyiqsTaAxkSqpFHWP3m+I640=
X-Gm-Gg: AYBFou12swTgJ4NYWRwVKcYeKgN+pKnOKC1kD5mkppYK05Pvct6C4hDzgoIQMaHPMtf
	OplRPl1VaCS/uwIzcT+L6fiZbYjHZiuSkWtFgl51AL7TqGcOPwHlGMf0Lm6HrwYmOmFq6WfbMki
	A8FR1HFxFZYYKfs81hZ/8EMlIHUF13BPQJNMKHXmTbz+lLLvS6gfbVXhEQnlbpZlyM4jJfkYr5X
	mH79mVojm23wCeHC+Z9wvLkPBiHJkhi/Vb2xJ8oZuRWzEJisUagjAXMxyWk+z1x+VhCuCLU8Wcg
	vGzG501/wpHUW4MLh2GhSAoKwens/1k8WkjALD9tc3pgTbOs12nB0j1Lscf99+ImDOFMmTn93zB
	0qGTzR5hiwTrpJ4Jt74LK/mwCtyMd4M//40RVTFCkyacPr8GU+fJCHqlYAnxkCUeTkxMEYoT1+j
	AeJx0=
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr5087169eec.30.1794196950912;
        Sun, 08 Nov 2026 20:02:30 -0800 (PST)
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr5087127eec.30.1794196950284;
        Sun, 08 Nov 2026 20:02:30 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm8823911eec.18.2026.11.08.20.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 20:02:29 -0800 (PST)
Message-ID: <d7940676-abee-89d6-5e2f-3e2a2c5b70c5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:32:23 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Joonhoe Kim <26rote@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Birk Skyum
 <birk.skyum@pm.me>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
 <20261102220526.1755-1-26rote@gmail.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261102220526.1755-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNSBTYWx0ZWRfX5x4TH8NfZd7q
 Gd+qJw15mWNsMDzy5jcqxbwYXmD7q8pZIuONoyC9wmg72mBpkNLoH1KYVSzLbamcjMLPYji48Fh
 98bzUTi4Nc36BwJy/nA1oMC6WwtEsCBNHInuOU/JfekDMaP+Sbqokjln6bJj5rEdJuEnPVv9pmX
 5zZ7cb7rCUaZip6m0+zkVF4UKSrWhAjRRYHBdI/tloZXqCZdnxo0L8ks+Vg0vGmh8X3fM34/9Wt
 JfzptkIDz4C2RMEHEYO5GgnNkDChwFQO9sz6NZuPqVqquwPDxfuTKjDHu9dy0KBF6oUoHwx+i4Y
 yjmjhDEyUs0W4+GaUx+CfYSRi+iYpp1Fxb2l63gpM62KEZeHYd7wdkxkSiFo/dGkB0tBeJjRwHJ
 IcacN7okZv5Dm0FMdUnWXqx+xzmlxBsAkSYqZwo1xZRMtdtudMkx3xnLaj5v5ZS7ypuHxEkzk+s
 /JOSibMwU7ziskqM+XQ==
X-Proofpoint-ORIG-GUID: 4tWnri3PuFMuVr41JOV2ssg2M1QRc6vS
X-Proofpoint-GUID: 4tWnri3PuFMuVr41JOV2ssg2M1QRc6vS
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af145d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=btcJMxBC3-se3phSy3gA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNSBTYWx0ZWRfX6rW2tnZWyd7l
 UZC1kwhVG5hTTJ5RBdRqk7a4YZEMbcteApaJJrcUSriA4eI+sOde45eT2ZfCF7GV17V5VNW8xKv
 A6ymdXBb7t+BDCqRxJ6DXmUzMeIi3YY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090015


On 11/3/2026 3:35 AM, Joonhoe Kim wrote:
> Hi Vishnu,
>
> Without the series, I hit the same deadlock on a Lenovo Y700 Gen 5
> (TB323FU, Kaanapali, v7.3-rc). It happened when removing the module
> right after a decode session. rmmod waited in __synchronize_irq(),
> and the iris IRQ thread in iris_hfi_isr_handler() waited for
> core->lock. A loop of decode, rmmod and modprobe reproduced it in
> round 4 of 20.
>
> With both patches on v7.3 and out-of-tree Kaanapali support, the same
> loop passed 60 of 60 rounds. 2/2 needed context changes only. H.264,
> HEVC and VP9 decodes still matched software decoding.
>
> Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali
>
> One question. While core->lock is dropped around disable_irq(), some
> callers take core->lock directly rather than through
> iris_acquire_core_lock(): iris_hfi_queue_cmd_write(),
> iris_set_clocks() and iris_set_interconnects(). These are not held off
> by irq_disabling. Also, in iris_core_deinit() the firmware is already
> unloaded at that point, while core->state is still IRIS_CORE_INIT. Is
> that window meant to be safe?

Thank you for testing this on Kaanapali.

core->lock is dropped around disable_irq(), and all power-down steps run after
it is retaken, so the hardware is still powered on and queue memory stays valid
throughout. A command queued after the firmware unload in iris_core_deinit() is
dropped. I didn't see any problem there.

>
> Thanks,
> Joonhoe Kim
