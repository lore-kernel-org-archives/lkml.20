Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C943DAAAC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041242; cv=none; b=AroItOIzstdwZ57Oj3SNC2Dkdf5oo38yCKJrwQ9jRsktfBtGhqLg8Nlb3kTvWGzo1pdN2mFvPJvNpCHLU3fSvDFN5Z+TB6PtZ7Kpab1TPA0mZh22I5tpovddDDRGG8Nskumen8nPUJPA6yPevNuHznrUjJkfKaW3shdtjIL4R9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041242; c=relaxed/simple;
	bh=1Q3nKA6KNvqRtkmwyNL/Y6jz0H/eCXypkz9DjWJc6Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPRI5v/EBrcQTpCrf6ema3vRb/8EsE3yycgzfOEm/ba338o/Jf/KsiN8KHX1UqcXMSRw/kLfkvrfgVc3uaxS37MA15pOXjIEfU7g7W/lkXKgh5npSCAG8rsWiAHZVjXcR2vjyVJ9qLDC/STRL0fmiWLmMfgFRzQsSVs2xEMRrjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieuOe3H4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTkzn7kM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieuOe3H4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTkzn7kM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xBQi1640485
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=; b=ieuOe3H44msy/Bs1
	oOmfp5ipRKg8d1FKAnX1CyjOCaOJxhVqSnC7p2iDR/IHpMg+FSLfeGrhBL0LVGJK
	CGPxxWrd3dAWSd7d/l0qG6XvNWGjvCE82Fr8hxAuG7YoUqWI1VhCPx7CTVy8h0li
	ttaxt3ZqpgolJI6D1a8jT5GKSU6+wDmplSAm8iuWi75m6iy+kob4vjZCO04yvFsH
	Pex0/sz3UYcy7xKGdizYa4bTi9RmN0svWEt/PV2DRkMiLZwVSuE8pHk/EjEXNJLY
	HLmewteVIE0a1mex3L7r67sjq+w8xBoJmwnqt4V0jtQ8mJiyRqj7JzSpIU15CBDX
	1IhEbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhg7q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:13:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so5529153eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041239; x=1792646039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=;
        b=OTkzn7kMjN8pZyvwcbd5VdZQB3jeswSgVUqkeHmRbcf3Y/Z1hYA0RPpFyvbKtD3gNw
         3Dc1VtQd5LOLgZR6gpqSBnkzRgmd5ZH+7MCd8aRheB933jrS2n22Q/EPtDVsGaYIGvzz
         67dYPz6WXSPhaRxBFpsQCMhXMDxzGx6eyVYu9jS1PKL5uKx3NoLju5fq+1VNvsqJUHNK
         f5bJc42DURPJ3+OQfhd9hUcsosbbxJwjhevZMAvDLbYGSaKJdotU13Ggh/1p7BNiSQ37
         lgVYxguosI4nNRsttwZe7Q5pad7tRcFiN5ac/Duwbz5d58Be79ReMxny5q97KZQx5BFz
         01kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041239; x=1792646039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=;
        b=Tc1K/yPdAk3RobQtteY8DVLB/O30+23YF1Are7dvrGOiUIlwz9MvfcmpHObXzu2RXd
         M3iLhFOmLIBzEe7jBxad+drmHDzWAtnFM+P/umn9DKAk+85lxVqhzG2LqfmiyIkaLZAk
         qfJz/cZNSmhx0Ez9WRU3SIp/VLBm81ET8kYmjK5NGJ0Tp7E9wE4BddDebi1DPKjmNsvl
         JItEMBQQH+BnrpRDL1Wn2hWSWVKZgmOYS7+WkZE2g53BJE2QTGKyDFWZj2KfA76GCOjc
         Y7ke3eCFHVZK3bEp9v2hAYYhflKz7vkWffZscZ8FWmrRaJVNuFbEZYsYDXqEOpevvC8n
         LctQ==
X-Forwarded-Encrypted: i=1; AKwUvBy215R2XxJO36InH75j3uRq65xNjMuk9eiRT7a9QialgqLwRrBfeR9DkcLvlbpcf3aAmbC3FW//tiYEre0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFKejQKiy9mT8f7+cdf208ZeggMKwB4M2oD/DuMAj25Ol7PyHC
	gEkzxIPwTSmeiz2/Sjf3GLVPJ74ZDrHNHbZUXk1ROfI1cSBKj3fFKksh7xFAjTkcAktDUcTznk3
	gUSuqQBQFtlTOszYJqG1HWuRchfWYshBsGUd29gRJEposvM+8r2aoAv3mh479NREH6Wg=
X-Gm-Gg: AYBFou23kPmvg00LrCDx3PHYRbN/uUjLsDruyJ6UWtgi7Zsupz0hrro+l5UBvIRUflM
	peAhDrz48ogw3CAN99GZiR2eBiNA1QwvCf6RRTiFZkZ0LHItMi2WZWQ+DQbQ6pbgd2aMaN3HtIC
	fCcOCVpS+QRW6ZMwcQDX0HLDXE1f5NfYhGy2SvsqQhC7XchJKC0macqYDfYyrm1KdHqGlHRr69V
	/6vtKfZ3sIdUVsPmLHDUU9lbWfBF53fYmojiPBvU+oK3cvrkzrrKeRPcl4ok/XLLmU17TLLGH2O
	UbK7Vm9IBoTyvp4QFuu2qR5WeHTIHmysKCaUhJBAm2o76yOpqIzojWr46RxXeuaoWrKdUbBDu6/
	IrJklEtIIwtrZmyOISfBitJoLYvbreoFx
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr33213602eec.14.1792041238941;
        Wed, 14 Oct 2026 22:13:58 -0700 (PDT)
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr33213570eec.14.1792041238403;
        Wed, 14 Oct 2026 22:13:58 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm62494806eec.21.2026.10.14.22.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:13:57 -0700 (PDT)
Message-ID: <d7f782f8-56ed-41ba-8d01-5eb235f873d1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:43:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXyD9AZJF9Von3
 ZUavqzHYQD2q65YJSJNfYaFYAVzb/V2iPmVQaOLeTewSEAjflnaKAIJI1OIA7nDyYqbCtfQUVmz
 lv2Mvom2fV81h+vM6CLX/b1Bt9nQbpD68tGbfc3UJQxusDeJ+Ez0B5iQesgHTRigrbB6NnWyNT9
 eZswRDXXla0/K6af7jeMeQQenQuVtQBJaKV8sk+xVl6VqlNjgqkKjDLQ+9fNbPQwBmlNEhVsMpH
 MqlA0I+49uEYW/XZeTSmA8YR86V7vJjXPWOZVVYzLKPt2/OQOdMraOmsNQSNwM7BDKbYTZ1nxzX
 edHAcaTCvMV2griO6Os1y5wRs2dHlQP2QR6etVl1sqQFSxqZrNky1gigpqrEO1A0sKC26S8OghC
 EctCeXbg4TgktzBa71tZriinUwghPSjs2McZle2LJLMVrPgEs/pv7z8e/0Pm/LEhXM67vXA1aLn
 Td0fVDEQhrWAT29Ifvg==
X-Proofpoint-GUID: ibWS6G1TKqanoFcA53Z2IPlVPklehabJ
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad06117 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QlY0LIaGgR1dm1rbm6YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXz1h1Rek9q0QE
 YVlINWDAgav3bWns1uz5m2yNYvpo7ws2PM/0fpQAzeprjjqEJDQMbvxjohhBy+5463DNihNp5eV
 D7ij1wqvt2HwhkX/Lqci3lDIvAE3YXk=
X-Proofpoint-ORIG-GUID: ibWS6G1TKqanoFcA53Z2IPlVPklehabJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150020



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE
> source clock, so the driver has no way to compute the divider needed
> for a requested baud rate. To work around this, firmware instead
> exposes the SE HW supported source clock frequencies as OPPs on the
> perf domain device.
> 
> geni_se_domain_attach() now populates clk_perf_tbl from
> the performance-domain OPP table, allowing firmware-managed
> platforms to use geni_se_clk_freq_match().
> 
> Call geni_serial_set_rate() unconditionally from
> qcom_geni_serial_set_termios(), and use geni_se_set_rate() instead of
> dev_pm_opp_set_rate() so clock programming is handled centrally by
> the GENI core, independent of the underlying clock-control mechanism.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
