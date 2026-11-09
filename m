Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236441;
	b=FUR1D54+dx2KCHgeslLt7jVrMA4TCI9kd8rAnKJE8FdXdo5Cb+DbF4GDZMw7BZss7VAY
	 leMVlYbnhyuuLAGYuHhKyIGx2qEeY3VefAIQqbvq7t5w9BmXWcvtZuPY4HubjVeDkAN+6
	 UZEjaBA9CpdyCr7GxW0XI40ep3DgbM3BuUp9nPU1o5GKvHPqgCXcyUxoOD2UM7aLJDfeE
	 WP6bkx6jxspKuP2Lt97DI9dv3UwfYycZo9zuUppOy3Qo1Shn1NxesLCJYXgdtjyQy2eAD
	 R6K6Bz2LjdPikkm0Jz+qFavs/7tp2FB5BaMVEwOGcWFBGTVTWkQ3QTKke+Ao50+icTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
	b=5KqD5XrLvXS30JfWKy8zKfcOmIqCKs/nLPvZyDjUspFNuojS7FLKfHm8wpKkaIdtY1gc
	 aXXtXscj4u/+exnWBjyU6bcB49gcxl307oWMv5t5JNeMUxrYVeRiAwLZXfEDTz58g+SmD
	 /VN0/iUwlyGPSqfUDFiN69v4dvZU+Zy5PuD02CStoZqvGzJbOkA77BhJE2hGUNL24vVtc
	 g979AbsNzEYFCPYwQqw2ePF1Il1CX4bZXDQFzmGg19LELzmfSv3qLaaUA6+l6LwxjPFzr
	 21uWRKtSsd3rJfHisF6b6QlJ+8yd6gJTeEmAh2+CFSmQaIyaqLJzVgVfv9dEAoWFCAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UF1Seq3E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7C4606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7C4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UF1Seq3E
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDke337317
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=; b=NctNdtZcMYdvTKdT
	/9OUZD/qmpDdrtC/gm7Dhj1O5TpiNZw9NlN9CRpWh3eB7qlyBIIHgLN+sV1rX8zV
	MJzpTe48JkfeUiRyNCyeteqMHnGAAmhCVGAcYKVhen+Of+oCYTinBibwY2M9FPft
	ijncgMxHX//+t5JRbYO0jkXtW0w5IsTGj1KhEDkQyuqaI7dZquDM/lOU1itfcVsw
	T/GB8ImYwPcIAiES1xdoHvcwF3faS24kVpURJinjg2emlZdk91+COykXUDXO7vQk
	r26J9x2Xpz+2YLx+kpeEdVFQy01oaWh95rIFUMdp3VLt8BJaS/mbouLk2o8GnBXT
	B1y2FA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rtbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:00:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed077a15c3so10145745ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236428; x=1794841228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=UF1Seq3EcUn8nFb7fvChEz0YBuWONDZO9NkUySnJiOUkPMAIlcI9vLuuqMB3iq6dm1
         lvIFkwYAuw4pBfenTFR4GEawPPwK4KjlgiqId2HxrHNF4Z0KslUSETBMjIlns3/PHrdV
         dwNoRSrW5vfi8b2BaJRSmQFLfp+ILOtHlZef0OuY3OSzMaxYTCETZ+QWsFYhKEfQEi8M
         XrciqyDdoIk6WubXseeb+JN3vCGyKO7Qlb512bwna5PXmAlA+sR4pbpyuVZXkquYyp6k
         z9k3E9kd62dUpJHjnRm2M/3y+RD1E1UzdWgshhvR4vEUdnHm1or1lp8syV6gQmpZJk9v
         Slpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236428; x=1794841228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=SGcUwIgsUPvEi7o18lwCwAm9jXLUk2NeOQUOpQkf4mfYuGekg7nwEBeYSK9HOt2+e6
         ycfKoWMI4dgQDU7Ql70JTe3h8Kz5v05+orSVhdmyLJEHIvXbe9fq3IEXN2VeOdS2rsJH
         wmSqI74dBALaZ2VVddGlBSC7c/Pi8nsF8YYARB3wUUkclwOTGGefcvsA928GL7JxbmLP
         SfbafX0bANKMT+JJrDEzXGW8QS2gQOh5dB6XtZJ/wLKspOEhEeBAdN0uT1Zov1r7v9dh
         /so/MGQeOBn3ihIIbebehMoeHXddWJ5I6L5pIEzfqGE6xh1/le5bPcXBMTkRlntKYmaq
         snww==
X-Forwarded-Encrypted: i=1; AL+hErFssfwECUKNVJ62XPIwjc/WD33yaGVGdpyrS6WEZj/BHu8+a2GHKPe2+3Twkb0md3B+kqh12XYrgwSUN58=@vger.kernel.org
X-Gm-Message-State: APuU4Z9meshlUlQa/hzlPCvuLdRgVO4onDPDSvcqZUG91+loWevSpnVJ
	xaDIi94CO/WYhKZg2RkvWYdTa8aZ0o5VYDbtKEbHU9G3kF6srVAO2jTsI3PbRKSaa9sgIkZs+TR
	+JjzSqyZdniLCsaaffRVW62TodbpMWyKk/gsQTjmSuWRU2aWrvIxBSYyuDjkVff5ykY71xezHHf
	A=
X-Gm-Gg: AYBFou04Zd9bNQfkS19iEyXh43UbzpCH5eQYV6Ok1B/UZRFvJJe3vqgVpI+X0uZLMPM
	y1CJ0XcezRIGlVX+oEDIDHVZMzFMT3kZ7Y0LPMNRerXKkmJAYwGl/6HdUBdbILhXVxSfvDJtJRr
	NNwQTIPZr2TZR336KO5NPIi7KPWpNdSIx58HQjbAnMeCUnOH8Q8U6rd2JUCdjLyfU9TIpCCduXJ
	9WOCJF8liAhBmRFQb7jF3YzS7ljJ1P692sAL/eLdQgknJ71MRYsqJd8WQzbX6V5MOEA1tpS/M5P
	XruDkVne3nc+pWsDX9HrVyAecIflFj22vfo2UnOh0kTcIBSuRMtS3K2W1iRXykWWhH7vXmxsbOp
	Y8Zg36pcKWHIIPadvyjNDDz+7XBSjCTj8lbogrkuxJjE71hN7eZB5e+YTidtHuhYc2+34vmQND8
	k8Xz67aOHwsx2NSXn8K3eFa6NVvnDUu2k=
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48200765ad.42.1794236427766;
        Mon, 09 Nov 2026 07:00:27 -0800 (PST)
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48197085ad.42.1794236424114;
        Mon, 09 Nov 2026 07:00:24 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8173a8b2sm12837335ad.67.2026.11.09.07.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:00:23 -0800 (PST)
Message-ID: <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:00:21 -0800
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
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
To: Wentao Liang <vulab@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX7NGGWgOMvLsc
 1f9JyQAk6NL8KDgecAUsVd+isqqJmDUkdSwknjMXblIKXqEibHvspDGivxzi5EgIysGqvdJ25sV
 PB0GmFusXWlw46o8cHpYljei8PeJoEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX0Dr39RDQKV83
 4ZnO/4JIXvQ8Rv8GoSZs7pNVjQJb324cHZ+MDs3rSdKmMtjL+sP1vnxhXcdbmVbfugF9tZ23C1e
 bD8Awn+/Pk5hcT//Q6wUFi6pWpksKwuabM+22HKmbJFtkiL9NhcMdP9z0FTgqDapYHhZeyd4dLO
 +5AQTpQI5IQf7It1gyZ+6Vo19E5qdHOxxPaKY0ap00ho0cfPwoWWe4VDtKEiSP70DEW71TRzg+9
 JMNwS4MxvltiAIRdy5tGMq4F+BZH3tLZttDpwcYtIT8epLTlMiqgWKkKvQI+XVmgNPro3EeLHwC
 UR/KSQ1mOTpl8BX7xtxbpbp3pDfPQugFFRw7Au2AR31nEAnYj5nCOxRRhkfhZcMrawi9jR0H+7I
 vjMhqpAPrwd8OySa9NLaeqqi5zC4P9QWrPdsNIXU7HgpoIgi1oAcVGLfiG/s8/c0/nA/m51YbQc
 TuyPJ1TYUDE55zss68g==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1e00c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=mvyCH3EIRwqJGMeifaAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: b-UDaMInqVO0VRDcVfDERxUz8Jl-otSO
X-Proofpoint-GUID: b-UDaMInqVO0VRDcVfDERxUz8Jl-otSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/3/2026 2:29 AM, Wentao Liang wrote:
> ath11k_core_get_rproc() looks up the target remoteproc with
> rproc_get_by_phandle(), which takes a device reference and a reference on
> the remoteproc driver's module.  The resulting pointer is stored in
> ab_ahb->tgt_rproc and never released: ath11k_ahb_free_resources() only
> tears down the firmware resources, and the probe error paths after the
> lookup jump to err_core_free without dropping the reference either.
> rproc_shutdown() does not release it, it only drops the power reference.
> 
> Release the reference when the AHB resources are freed and on the probe
> error path, so that repeated bind/unbind cycles no longer accumulate
> remoteproc references and the remoteproc module can be unloaded again.
> 
> Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

+workflows

I am no longer accepting patches from this e-mail address.

Go away or use a separate e-mail address per person working on this project,
with that person actually responding to review feedback and adhering to the
Linux kernel etiquette.

/jeff

