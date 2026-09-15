Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DE478E36
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461432; cv=none; b=kxuisKojNPn4yEY3/RDYdcYr3tJ5RV45DnPiZtUUs8guAi48XNPL7zsuGWSAoadwDMeEB0fgJ6/A2+uB3KoPoJsVxsNlc3hHcGgLU3k4ZDjrXWXOPzwfMxKD7Fle3tZP8Gk4WfdeU/maFXk/Jx7fclPaacWpXFYfWbGAXYDgUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461432; c=relaxed/simple;
	bh=YdR/sKqrRiv7YYNQfguHi7aoV7SCf4GdbKhjott7G9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtgY1rmodw0kaZiOnHFuFna+XSekDdazBHLGs0x/N9qZVFLakYlaI/FnHT6vpkSolO8YYaYKIgisVBh60Y+zpO00KOwdeBhI8hXMbG3o/nRotBecyqyjgX8zk9MBm45LmaoPeIOc/cvFRUJbIXJU8PyVC7hAUSuVvjyOk2/pgUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFbucj0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYu3d4RB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFbucj0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYu3d4RB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z8Xh2249692
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMrZ14PD1b5lu0Pk+aBr+n+H
	IHnLdCKjZ3wX7nYZV14=; b=DFbucj0H19FopdNPJhK+wMf9I9uDX/qZL3ZVMjP/
	GCDqKa/AevPpcGvoOZumXYNpDtueSqkyMb4eXa3UY+PmvRk44t+h/C2J/Nw4bEyc
	iCRuAyabKGrsRXAOEMxJN8Rdk9ufTGjGKgf9IYwhu41OMRSeQS3VKgcwpNiiovfS
	JTii++W83AKWuQ0X0Un5HHUihMq5xzU9JOEJQWYVuG0PEXPxIf5a6pLOo1dD1DXw
	Gp08sY5gDtstyaNdHuevMDCT5xpgpbAExTGvUOYw43kUj2+sEHQyNImMWUvSSDhH
	LxL/KumD8iYvCMN9QrnUQfxI7xOrYz/g3mX/m/5FVFuCmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70ubf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:37:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so342734585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789461430; x=1790066230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMrZ14PD1b5lu0Pk+aBr+n+HIHnLdCKjZ3wX7nYZV14=;
        b=aYu3d4RBCne6K+j25qtIQm5qroGFty+KHGiTaTby2SLOgi/+R3R2/pWanpOTzpJHsN
         YYJE51srdTOnoEKth7ciV2lnFnvjH4VYv4ATspUgzAfsZhkIMtR3wJ25lURTiJL/KwWs
         csglEuFRpY/BfLeBbx2HX4+V6rgGfHasRqPLm7MTnrhq7LworpjXMYDKPU1Kfvs5tq58
         Y44eNEnKs0Bb21B5uNNzD85FuhZvT6dTl1iDgOdxexfumeeBpjB2xSM17kJTYHXXqKil
         DJrn0f1mGYYXzX9GAqCcIsj7WcYb8p33lMX9us1MtVU/U9SBWRYq4mYZgBBCLGy+fuEI
         IqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461430; x=1790066230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMrZ14PD1b5lu0Pk+aBr+n+HIHnLdCKjZ3wX7nYZV14=;
        b=vqaBeFSESWnwlV9RF3NGgNXM9lF0a1eiyifMS42NxG3AYQuc+KnopF9DuvopR6n1hS
         dfoYWviqVQx2EcyGjH/qciaM3u89SW10jK4f86igCe1E91wkhhr/2eEew82bpXYKuW/y
         EyQgN87Utr4ntkXgEcLpfLkYgjE/l6FhR2wbLtSd9haQzSPRo788vGJpljMMnyPipsip
         NWYNm2iy5eX1PgyYPQj1BQcSTQpiV+QAd1pQG7sJrAMmAmbWcyEA6VYmP3SNAWLU+Xbw
         KApsAPIL3iLC1l86f595jlyJZZl2n1j4/r3Ubz3bCYmY64TnQZT9Gz2v27+5EXnzs7ER
         Pigg==
X-Forwarded-Encrypted: i=1; AKwUvBzWmV+pIaDTmavmEeaJSF0xgaRBa5xOaF28sqvj0J7O7EvIiun3guKpuSNnKbUOqwJgM7Po6WpJ10U2TcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJAZDyQDjMu+t1+EVBu0JDNkVMK+1owaAspGSdH1B+ypFmiTdi
	b4PPofpoMBzvBzoYOL+I/5/bTJmjIdwOKW71ZQcHz4QWFtHfb/v+PlxjJ4cfnCjp4LiktcIGP20
	qxAsKV7NPDDPNunurVnzcqtkowXOreXJYM7thEMUNchh4LXmYzOhh7wO2ezVcGzdhfB0=
X-Gm-Gg: AYBFou3IPMj0eySDgd+rKNAwrMRCnNeBE8VtgrdbJUL2xxV3WkSmpfmXb1LLL38FeL/
	W8dOJOqgxREquI0f3AL0g+bOCvrPMIem27u4PwDmO67jHPdV/BO4ujlKkRCC+XeoYm+fEeFImdZ
	N4UUw72beWsY+CO+GgT/rLpdqmbNE6/R/9ssoRBiIR0X2elE6CtvpQir3cjyokNghyfaN8h0TlY
	cCC05Cu7Mb8uoRkhEYABnUYHyvND0xYSMe5xqPf8R8rGPHFVssZAGTW3D6ScNSnrDJ8MiqM/it7
	LWvXBdtsYcHtpC/v+imnCodq3YGwoKwzV4S8Gd2UiFRoi1E8rVRoeIMZvGwVFWuFRI6avBCRFGs
	3zv5T2WcMmodk7A==
X-Received: by 2002:a05:620a:1d0c:b0:939:bc7c:15c8 with SMTP id af79cd13be357-93a29a97b1bmr986442085a.45.1789461429558;
        Tue, 15 Sep 2026 01:37:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:bc7c:15c8 with SMTP id af79cd13be357-93a29a97b1bmr986438385a.45.1789461428954;
        Tue, 15 Sep 2026 01:37:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d695677sm54843475e9.5.2026.09.15.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:37:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:37:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
Message-ID: <kn36ymkh6ky3dakcq2hrblnqunwc7i2w3ny7c65tramfpbnomo@gx6e3glriqgw>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
 <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEyMiBTYWx0ZWRfXxO7RlQ8qpGOx
 Qn7AsNjdt+8IVVevuqf7lj/WNvms3kvj93Eb6qnlVZAXihNlqwR3QQ+zSX2PVWqxaIqEeKUWFna
 uNDph1o0C3HgHdZdZ9yuXDeu81Une+N8BJxWvQbqmeayqjgg5MKRvwlSEg2af/aoH1wZEkh5Ooi
 tkx7kWXpU6uC1CIugeA3zqlTsoUAtTY2vXJhRdkKSWJkxbP3TYTpLOxpXf5pfujivl8OouLuvtn
 69V9KkIjPIIfCh3TqgiZFvO15HNoQqrqeDOtoIbbwIPSQwiQKXOBsGfY/0yNFap2riYH9rNAMq9
 RUu4Rts/wSM2Dzk/Qncy7HKON1WNvH5/gsFfLUe4OOa9KuNuWZM5rGcvnjeyO9vGXpXhhCPoKlD
 pqtAIo/B0/4N84kj4MspH8LGOMg1aiMGGAp2zS45LnZngLk4YzFwVxXPsXfV3IgBnWMxh5NVgN3
 HgiKgHXMzRlslc7rvyg==
X-Proofpoint-GUID: ARqf_5aae_5Afr1U_FmD5oygjdPHeeK_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEyMiBTYWx0ZWRfX1rFH6+Xr7plM
 Vjz0xrDy/+Le1h83ydmPFZkuO8cGTc9cVmKir8B0wmyNvxTBR4p/OkwkE+xM2582ENBwpzv37AS
 L9Q5RNADOoWdPH0HIWp6tDw0hWQpZUs=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa903b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VEMV0py1LmJu7ly8yMIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: ARqf_5aae_5Afr1U_FmD5oygjdPHeeK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150122

On 26-09-15 10:13:36, Konrad Dybcio wrote:
> On 9/15/26 10:02 AM, Abel Vesa wrote:
> > Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
> > constant. This documents the selected RPMh power domain and avoids using
> > a magic value.
> > 
> > Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> > Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> MSS is the modem power supply, this should be CX

Correct. I'll respin with CX attached instead.
