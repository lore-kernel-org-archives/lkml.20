Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF18399018
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895620; cv=none; b=lTYzu35Fa35caFKGDCAaOjCShLHSnupEBQ1cMgDacvH6i/UI2ls7dQRUwZ3/3USzvwSdTziGA47J6vFaXKsfT4l+Si6Nx1GHgXM61M+8yQS4fsI7S6UMqBh1Za0tthv3g9a60iAzjHyFdfVTf5k9wzc5iGTOblSKNU5L1rSUWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895620; c=relaxed/simple;
	bh=2/N65LdBK3aWBuEUGJaENLU/Tj7MhD3XAL/9iOeMu/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9ISZhp6oYTkIXdTc85lx36m8FTu68XQ/yfT8TJAhg2/L0ANiNzWzyXPMesjvxqU9fabWYxUPUh7pz81RFL4NdbhR57asehvs6Mo31tkxOJEBRkUeyzTWFv3smVPjrKKLF+eD0hMAd3p9JDUwqB+VODxXcXO2HWMsVUJs+A0vWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyMydtNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGq5W5tT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyMydtNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGq5W5tT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8R0K2302935
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=; b=OyMydtNg6QsUgyw8
	7d4qSpd8Uz62RhksyfnB7oIC/MZZAVWd4Kc362dRz4XG/x8znkECVA3n72odQOfq
	IHw3NHOT6GKTzZvpgVXGDMxMZfns6nrW9SCxGqGk/3Rbh7z4dm2zaACp1wxnAo5P
	5KpBX2uc6+e3BMgYMTxAgRYBZOfKFFJnlydOVOrPXcx5yXIQbI3aWT4o8AjAHOzn
	vKg7yAjfvHoMlrXGpyzfSWMSR/LFIEjsLQ1H2g3iS0S5OshyMSBdZxe2dHt4QZfh
	3Er6NfErh4lZSUuBaYeo99knZWwA0ey7dTum1Ncv1yTlK7aUUXPESPiQt0KQ30f1
	HRgGVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqax6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso38490985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895617; x=1792500417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=;
        b=JGq5W5tTDJ23Q+ckGAliAqLSHfo9WObuR7Qj93jBmiNxy4jjKaZElx6ivcA6kWM/H+
         7Yodozrl5RldDQJ2g3+5uyftltNRqUF7dBiMYYWVmXL5XNpsKeHe8afAQOVBoVTCl6UN
         jQkpiJrDAYVDRgDX+axGO5EHLLdpz098YeePH+2UhfYKzF4LBhcJlSbrtHF5rBHT7WR0
         sOVVpcXcO3gL064o62s3onpjVwjdwatFV4mcNQbbsr6nD72qD5Ep8qWlz8/TvNMo+bEF
         bKKjvU7/zw1OXiasExSkWJnUAFS3d69PF8SgOCQaSYX1ZQGC8G8BwrDWP5p2uIRH4Mx6
         JaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895617; x=1792500417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=;
        b=XVGMbTk3Ppf+eBHZX2iaUD91kH0gQuh0N5rJEVFccHgzDsMHuoiFVu+2gZ5vt6u/Ee
         2KHnWn4V9P4iZj6fh/hgnETPM6Vons/cmgsyDnWy+ErxxmH2T53BtQAW5qu9UGQrUmJc
         QIDdqET+UQQrFQwiATG/NPf/rnz7FgFWBzfxFDq/gV7AYX2VEbhruG8axtVB98EpaNSc
         +1W435ki5sz+VDQkJpm+qvh99PbvL+ElKLgZUd8LENkfal192RGDq9wEXVJlGhCHJsh5
         Bws/mjzKwtk9JyaqcrC3hWc4GdCfo95e2mtpbpNEE7FgyPYUqvtTBx8d6aEHJosGlRT2
         3inQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc1GtRr9+OSlU8GYxJX5SHVv1yIZUFuxDxTM/9uoXgEk/PNEgc96OhZtEB411Paryn8xT1CImvLXCzK08=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiczAS/vOUfAs7vN/LNm5WaKaKKA0Bjnt7oCs8mToU8fqVKlzJ
	Nx77QO1rP6+Y5PJEF1IOm3L6tnWXaJ5+l0yd4kIXWbHBIZhFhFn4xX3Kx2pJby2TSyKR8iCZTPx
	lAYIFR3ejoXubseWnRJmFbp5PVadJKNn8rqKoBnXUp12bi93yMd9s2DGIjBNjdcDJjso=
X-Gm-Gg: AYBFou1PqCEcSm+XdT48hWjNFA/H6BPI0P7Ptwod49MlGvvJTXiagAPcMREoI1sbBU8
	d7ht3zvE2EZMju6NpK6QlGMk2w8cPRB0WITQSUZg7cqsFNe52PvUh8RsFu/l1bPGjJvd0kcPswi
	5xW9zDlwxphB4GhaL5K6RpQB4G/UPjHPE4RtJ0R6WOkoJa0tTM+qtNnvWXPPRa+c83DliP4TYBy
	62wZ+1BngEO46nfo/HJwDSf+BXK2qrdqygH2UPvqc3GGCBqvIX6NxfKqrkbbszhRhUJIyG7KSe6
	/CXxlFeNJZ/cjRZ7/pIiRCPtlzZOYJfMJAxifnt9cEcjNs1iDtavyy8sLXdKOGM18YG+R2gbzsP
	sG/kVG5MXd2ybB1or7SxHhw==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2219330485a.3.1791895616696;
        Tue, 13 Oct 2026 05:46:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2219326385a.3.1791895616121;
        Tue, 13 Oct 2026 05:46:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caacb0sm38641251fa.20.2026.10.13.05.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:46:55 -0700 (PDT)
Message-ID: <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:46:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX39321ENgi7e2
 +tmTEz3sBKKSOhmKhCy8Cw3Qf+humH8y/ivRYFRedZw/GjNtaL5Iv+Ota/Q2vsMcaaj6eNySzzq
 bxIJF4ndv5y31FBaTUuR3M0EVxyWheBVao4efobF3s3Iu60SyuOtLX3j1X+lFCGkaph4TBKxNlH
 74dGUZJDxs390wqFTQRFfEHNS3KWk4wfDq0yx+4RwE3dn6ZGULUrFpUaDcdON6LHk2gHTl9kNCy
 mSjmtWuoTtzGvAPJgJSPrBReVKdGK5moIEUWePxMBstxVYYwMimPdlc3Ekjq64vbZRqvMmD/6Iq
 aBEu7oUmZBHvBvYaeB2N5BISPapbxhcs+cGWEZYBeeUgsAD8OhyL3XFVPBrCuUvcXWQObWH2Cqo
 Tgsb/RWMXfq1SJm/ylUSYv1xYAjXe4ikVWrjeRjaAPPXD82PA4rpKMAuXeVlsTy3mnavGjXyxEH
 Rd8HdDFYByJTGXtOZwg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace2841 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uzhSaxHqr0uYvXhH--oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX5o5RHHA/94JF
 Xyzx3Dd/52LeG/cRoKfybMMe5aNDd8O9TFcqPlFBxKMHV0mqLhz/+8oTe20ve+hZ0ojOAtWnO8C
 p3LmBrAbCgWVdK6T3nKYMwRQMgKTpBc=
X-Proofpoint-ORIG-GUID: _il5sQ7KLitG72PyJgU4-Ok0oOKJTRPg
X-Proofpoint-GUID: _il5sQ7KLitG72PyJgU4-Ok0oOKJTRPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 12:35 PM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETM,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
> ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated always-on
> rail. Add a power-domains property referencing the corresponding
> cluster_pdN domain to each of these nodes, so their power state is
> tied to the CPU cluster domain and the runtime PM core can power the
> domain on before the devices are accessed and let it be powered off
> otherwise.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +		funnel@12080000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x12080000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {

No need for power-domains here? (also same question for the other
platforms)

Konrad
