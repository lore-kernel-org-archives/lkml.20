Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476209;
	b=Cxs+gcmo7yRZU+k8HEG1htjZk5gpVBpz2YaXbfe0sWRY+y+5U+5i9ZpQr8Bv1TjkFFiC
	 PsE7pShJVha0WwrpvRjQ5JKuT1MdbXuAH0+N7jRWyQxnOiyeDw5fRPHtqETsq/E20eG4N
	 nbAyhXxEXibq7K9ylUm55qM9WRTcpwSOtZ1D2pNP5xWB6tDaXKtbRLlbLmU+v1vju3byL
	 bsLKbG3PAOXr1ZJZ5UgV7hXR7oLvZKDTEZ+RY+jBS9pCOJqH1o89tudyOr00B63eVbWEo
	 vjqhv0r4qX7nirMY6EbnEVruT46ZecVt8gXo579Q8Gs6Upv6XA4VhPFiwYJaRs5a2FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=;
	b=aKPxZK9tEmK/43CEq/NYK06etH8gBuipu+dySnVY6EveFS4008m0inlmFVadrFWsSGyL
	 ZtlcGQyG+LjwpYAEAtrT6kpXBjGwgTioLC18QJEt9mM7l0ctb//2sWlnJKEnHVxrzOXnh
	 Z6V9LNV/3IDwCzorJYi5AWQNX7cwDXFxkqERyaEWC6Sul8VOhrs8sxaE51zAAFqTgv/Kw
	 y/ukTTWj1yzfGriZSINE5+t3NnTisft8ftPpn+zsy6lI1+STZtfq0PK3TW00N/8jUXoNA
	 ZXgXHPFa5oozKOfKzwE1aWL6kf9ljkC/kluEQJDG27rOTooy0458J31GDeeqUwAhcNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsyykRCx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He4L9fa8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F41606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F41606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsyykRCx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He4L9fa8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t5ew185852
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=; b=lsyykRCxmk0X2yMV
	fC0SGhNT+34pD5YUjJp7LEeqLhnm/671lV9hjYQ7GpUiL8JdhBFjsQ1BkTneatSq
	OzcBJMLf9+nfPk+yWvMpQR9N7HVoD1SG+dbYmOyF6Ci5v2d9gn38caRuw+SGFLXO
	TNdE+sMV8Hm8ny6ho7RzOJ0Muqn0x+9LQvQIEWYd7tsJ/79v8KJY7c03/CNtkLVY
	rh4lAGKQNDwvT5ouWvBTXUJ9Nd0YvqMJzRncjmuDIqENR0pkF2EU09pp8wHNoYzp
	TvnVJEXqhrMDgjoojBFvfJzNPMhs17mhXMI36tl269a1kAcA2lUkz+mBZO1OOEyO
	IFIJjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:03:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso54721385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476207; x=1793081007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=;
        b=He4L9fa86t3Gv7XrM61vN902fWUmrLK/qPnB6z+oGm+G32Z6aReXhp9kwcnKDbOhXK
         K7FEjN1zJ4nueR7s4s46iN3y9QTpNa6l13rHUAzzG0Fe/IYVWegLjMvuzi1RXqMhBPoy
         T3fEpeTCimeTTv4K81PxJac5dRdLbqjMTmWDFIqtbM0vg08bBWDXZF7ujR4/ayTYCnxT
         q3nVMsOzT3pKXnuy8PRLbttVhPFLsolWrt7sqJB342flOWeYADZnYvBKa/FyvfWk6Pq2
         YXO8qzlfTLg6aoclSmYWiJ9kh41y53hZ4MWc2STvKDXr0ewneTm1sdFFAKrrLtp2tSOF
         SGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476207; x=1793081007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=;
        b=z0FkvGCt+43eVGJs9fIbYx8G9QrhA3OkMzZHcP6RwZKzbTG94LSEsj8nBI5NUjIQo7
         bBYFSJXlHO56A2oBLgyKIo+RUlZffGIgOD+f0EYgdWdQNykAsB7hRNIuz7PsCoRBFizY
         m6ePNFG+rWGSUDr92Wi4qLJQ0NBz0nCMWDNW033K5VL2wg+Sb6arJ9lTo/oUy5faJ7+n
         E0ggBso70JfaKbNLUS4QsEJpVmr/iMftGv8yPCmTa9LDFf7iz8ccalGdF6jSlN8jnW9t
         BK510wz+jDyG4DmZnRNvp7M0rSF+08Q8U78+OJZh8hwqUusPj2eLYTeavQnHJsLVskVB
         0ANQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQcey/gEymQuxq2fjg1WOFMBQd99RRVIl179bGkw9rzySCDdTjS4lckMhL30okJyqFO66Drog/2nq7oe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVULxEfkpKfGlCpFB/DUE06fVJ8dH/PkOtM917LhC3we9QHDfb
	FQaWDr1HL4oDchQpp1FtYwg3DzruZ6DHC1HvJmd3JKFDJL1Ys8PocwAJYyd/RUe6k6MhZ7lJMWi
	KhgPPmpZM5mjlQ449AY3owu6kNhb1DeK79mzayJRAA5PtHSOcyVXdpMVtLaSKasOe1PY=
X-Gm-Gg: AYBFou1qpsSQnOwrsdWyydwhd/56wo5Pvhua2DFpZPr2pNoR8WhkUyft0vViRDYWPRp
	mpZK80ifFkJrV2z9mWuCx2CLlsIjYwfRewsfqkOlMcG0dX4GmkjY4AKJ+Wf6CHp0KMaufNpsVvn
	KEv86KlDQuKc6RtpLbnyBvMWtwOuOnINDbL15AmldPBjE4sad5UOnwCZmIxBJrxBYxDRAbzf4wZ
	MPs365RCi1o5FQsSDBhluzeWR4PVLOks/tOR2iBSoB6W/NjZbKevCu1uFkuAXGrH5tYVcC5ml5R
	IECETAZXD/EMjPOgTbO1rw6YZUetTN+KdnZVHuo0C6c2CPKslBucp13dhrAHDrm/KCcTl2XovLU
	3aqb8qXp8KGk7qBJAVvE/Ig==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1879896485a.0.1792476207155;
        Mon, 19 Oct 2026 23:03:27 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1879892685a.0.1792476206592;
        Mon, 19 Oct 2026 23:03:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239a167sm448288766b.84.2026.10.19.23.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:03:25 -0700 (PDT)
Message-ID: <bbfb11f6-0a8a-4952-b372-fa3782c96aef@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:03:23 +0200
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
Subject: Re: [PATCH 2/3] soc: qcom: spm: don't clobber the SAW control
 registers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-2-9c7ba3fc2493@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-2-9c7ba3fc2493@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2jvJhreYO80KrCQ4RIetxL-zJzrnRhG8
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad70430 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WNvXFvV67iztUfGrp4YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2jvJhreYO80KrCQ4RIetxL-zJzrnRhG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX3hqvYfel3rCo
 XC+KSCR+Ae1dkRbSKC3xsJoS2PJXNjcQNjI6NMlAKQz1sulKfR4DjE6D3ihh38iGcF8Iav7nVv6
 vfbzyQBijzyYaYHJlcf0PYJWl5VCyO2MVjIOJiCdMqua1WUxIb80U8S7X6atbF9RF4TV6tCp775
 n0DZrVF8HeUSFdsYUHPJuOXyDTGBnk04HFGWwmAIc6puEboIUVPRKnlLg7jLd776llaBpN6589X
 wKPwFl0rTIHT/8vJU/VNTH06ghTc6yWOqj3ZUOohI7vYu1ZlE7oGVTCg34TQYjfOK7BzY/ydPTk
 mu+xVb8DUaJs9g6vRbkh6oDNzdE5CpxpLJy85aTxFr5QUXUFqmm5zXdRvF9+9ILd+GUYIE1KPF6
 huaibj5dBZdiLdA+gqSU5m210PA71hO34X7oOMQn53Vm9PK+18KP0lMWQh7vsAe4801nmjYJmec
 Qomuqo86e69Is2zhb+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX2Z4PjtU1ud3y
 j7Pm1qSvmz6qvnbk3tMs2q3d8ht7IO8L+WzCv2JnH/EZTJ2bjtWpA7mFjPjXUBT/FCEh9EgX0Wc
 pCH2ByGKjoo/HegvtJx+Z/jp/SCZdTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200023

On 10/19/26 4:39 PM, Dmitry Baryshkov wrote:
> The SAWv4.1 and SAWv2.3 register tables have no sequence entry, so
> probe copies the all-zero sequence buffer to offset 0 instead, wiping
> the SPM_CTL, SPM_DLY and SAW_CFG values the boot firmware programmed.
> On MSM8998 the firmware then still powers the gold cluster down once
> its last CPU goes offline, but never brings it back: PSCI CPU_ON leaves
> the first CPU pending and the SoC hangs or resets.
> 
> Only write the sequence when the SAW has a sequence entry, like the
> other registers.
> 
> Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/soc/qcom/spm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index d41c94d32b51..6f2f14eb9022 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c
> @@ -528,9 +528,11 @@ static int spm_dev_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, drv);
>  
>  	/* Write the SPM sequences first.. */
> -	addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
> -	__iowrite32_copy(addr, drv->reg_data->seq,
> -			ARRAY_SIZE(drv->reg_data->seq) / 4);
> +	if (drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY]) {
> +		addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
> +		__iowrite32_copy(addr, drv->reg_data->seq,
> +				 ARRAY_SIZE(drv->reg_data->seq) / 4);
> +	}
>  
>  	/*
>  	 * ..and then the control registers.
> 
