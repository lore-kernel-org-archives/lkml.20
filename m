Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD24772AD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150001; cv=none; b=rLyazcYP6tdvIvZ0dsSDGz6rzh0w/jSA4gA1rrIdK2zNmMwdy8lsBepd33LXvUGQEaDf7UtrZZwN9OgbxCSXMIXnyecImK1i3zUuWlbmlMRJ6xXvXf1N+NhJ0xS1BEvnMiOMok0QC8nNoF7pbunFbRLaGfWTSSv0PwLNTEa8/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150001; c=relaxed/simple;
	bh=xWgFo5vR+4z1f+gJnH8XH2etkKb2UlR+IkIsYtDDmOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbhrlPwE7sBOKovKC3tBvEPAErjTBDqSY6VPIj2HRANZ1loQfm0rZbLrsrasKGnw5Iq8Kte3HS7c97R9/CLe4nPCHVTp3UEdw9hcExYec82dj5lY4JZv/vTfpnzc5MrT0IORkpDhTjC9QcG9EP/MoY0yFB5W8sZYHbLulFBFsUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJdmx1KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kg1cCL1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJdmx1KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kg1cCL1N"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA24g942592
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14Hp6kTWchGTGJxGKqMn8VuoWecOh0DayZj1TPbhfcg=; b=LJdmx1KJOV0HJvY2
	MSKB0SnutGjmbtpxx8SgeipvZTTiQ0FZVHXZ/q4/OlQeL8AeSkAZtpVnLbdCxbMm
	w6GZKfWju195RnEIpjVi94Dnd3fIFwaWrGEhx/qVkOacgTRAcLwSyMIZsxNrvVVB
	URQGCMiSQI77jl3jv4FAiTtOj602pVGo145ujHE2IESfyKb85oOfyxgUFvyv04d1
	NPUKvFjZua7p7npX+TI/DZ6xS4byQSAMUPhm3Lx+hZ4dZBWPaLt2GtI3YQ8ba9T7
	xUnyaDH+087aECDfiACHiiz7yBx0PepvINKmVCTR5OgJA4JEm1KG/JEP1z8VpKwe
	Fz/PDA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur0965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:26:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso7778847c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792149997; x=1792754797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14Hp6kTWchGTGJxGKqMn8VuoWecOh0DayZj1TPbhfcg=;
        b=kg1cCL1NDC+j9Wd8oXSRb75bTnVWOYOOQoMo7Igdh29d70OGGHKZBEkj4yUt9Z4nSd
         xlDAaRt4O2MQvjkk2qCTPZRtg5L0Sile538KKGD0Ry2XZBd3nTNggkk/btzT6lPLTS0i
         5ViKorT7a0O+QtyqbC1rJY2bSC5nzYr/w8ccd4z+rzgdF0U34ZhalyDw6U38k0LtSEYe
         6UKolXyzPlRpd3jr/AVDEREyUOLsPSV3utqPABmHvP6h+oLv5jhLCoyrI4+X6A7o7n2R
         STolAKfjNU6KfoCbEp744rQWQukdPuUYOZ6x6p9AeYCcFmrKyhitsOvpJLbo8Na8tOrL
         TqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149997; x=1792754797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14Hp6kTWchGTGJxGKqMn8VuoWecOh0DayZj1TPbhfcg=;
        b=bBXd7dwR9B0Vl3WU6Nyx7f4cIwxXullxmfFcveuA8lQTO2ENnmsZVlh2B3wVQxH95J
         wRlb+4Zvl48QDrltKctjIvFyMicJQavNtp1GUTdLLbqLi7pKcX8ZTO39sk/KZbT7kBN6
         pMnLDcUnA2xS/VUtEpTpZKTU+d+y0H9WVhOlcna/IfB2WzCVnRyAx2ujLywWY9rTxQTA
         gsrstZdrAq/NLYJ1OJnpSkVh4UCL4/LkSd5ro2ehQkN20M0/ivGWJlOkGDie6g/ddoDt
         BkMnQp8W5f3VxWKOUhprHtaVPTNmKrTOGpRXvEg3BGLEAxJnxdZL8aMdrolxTm0gQB3a
         cdIg==
X-Forwarded-Encrypted: i=1; AKwUvBz6rVNqvXd1AdZWCDn+ty50zdAh723vUwB8zfsY1VyGtHozNRcqNYjJNze6N/43F8gxllj549UAXZwBiHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpUAteuqrRtXSAecGmH7lXeTn9Kv6sOatAcr7ZNXwKlsmipt7H
	QMgRjLvneQO833jsh4AmSojbzsGhDhPEiigOchvGGo/ydwdpY0MVSpAjdxAByMpMDWjUb2GPoZc
	6ms7/e1345DgNsorzOwAsKE/2EEurMzMCcoqGIfBIs3aBzK5vfbgORc1wo/x0wHXhjxji9DuRbG
	8=
X-Gm-Gg: AYBFou119DwgZe2p7emGO1u27A63VCtHZ1PJMApTKBOnsWiufkNnvOUAyP6Yp5uCWrD
	KgbdHLCWIZ3f+IVJ7jH4lx1V5jyfVHKfoScfqHLqjYujEKQHQ4clnUWXbZPcBofvlDj1wh1ViPk
	wSiF8YS4icz/OMC732TTwxV+zASrR6Cbomd2uIx1ipgtpyx7bLo8caA1divixziV8+3F3SRG5Et
	nrCsO2v/2Fiv9lzC6zEzpQW5iWP3ZXnFVYZAr6zs5RmPvWTlXfNR/tmUMnN74tFkHckrb3f2jsJ
	1TJgBFg7BLMrmdDzSMD0ElZtLNADok/ip84jQo60/nbx+wxJtWpeKgDxOWb7N91Aqa0weU3k2sF
	ouXi3jChaWoP5R1QCOpaOOIvoEg==
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr28008387c88.2.1792149997089;
        Fri, 16 Oct 2026 04:26:37 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:147:a685:9125 with SMTP id a92af1059eb24-16a56c9f443mr28008359c88.2.1792149996325;
        Fri, 16 Oct 2026 04:26:36 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm6534333eec.4.2026.10.16.04.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:26:36 -0700 (PDT)
Message-ID: <68e8b350-9d32-4eef-840f-f2f7fba27cd6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:56:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP
 clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfX5IM200zr3iXn
 EZ/9cKtu1GtTnF7J2pv1eB7k+Xy4p3dMgBgUW2T8bp9AlY/eKuGV3aMROtafQ0Pf1X/s8RJPRIC
 WjZIfxbJuIb197LVRI2VNIdQ4nJ1kuDpiBys1BDoj4FZDtDX7L77GZMtVsaBwW8UHU6O/4Lh3qO
 CqLsKWe8o51xHcaLNYW0T3hrnRxsFRyzCqm63H+pPqX2c/c4mr08nZu3yK+THWkmdR3uliWAe4K
 fye3uGdkkfN4feudBw3s8jwjCetmhpBCTFMoK4NeXNFUVGgniGku/KW8xJSem4NxKfzMp7Uy8pP
 51AeKOhPsMQKwaTNy+Uo/ZzpmQJnziC676I7l2m/04DwKoxDwWmZ35TGEn/ThFEgegX2YSMg9sh
 cF6iLi+0mEZGzLQrCNfItSIBHkuB1DktOxtjRfpgtcvZXEiPR1GAehxQN+PtKtR/kiRZViQnxuA
 tvbyIurClhhAJmHknXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfX/sFLXLwB6SMo
 1nfYjF/gJLkYDDIAGvTwLEqCynxaWMKDsmr5nO3PUT9LBdcK7+L3n9kxF8gUPx+tcsaxDpTWVUY
 XlPIFqDWkZyufV4CKuWb5v8Kfm5z6m4=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad209ee cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZjhuaSGYQaDxmet8v8EA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: ciIiiSuGhOChHx5lIJGMrvRdfpLl1hvj
X-Proofpoint-GUID: ciIiiSuGhOChHx5lIJGMrvRdfpLl1hvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160045



On 10/16/2026 2:42 PM, Imran Shaik wrote:
> ---
>  drivers/clk/qcom/gcc-qcs615.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index e096af7d82bf..f205de3a9361 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -419,6 +419,8 @@ static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> +	F(10000, P_BI_TCXO, 16, 1, 120),
> +	F(100000, P_BI_TCXO, 16, 1, 12),


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

