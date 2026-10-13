Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB5280CD5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895755; cv=none; b=Achyimi/WfuQ4ERZfh5UQKhOBB4q7HsUwPPERIbmbY0EVhXer7sqKSQHOSbI8rAADfvMn4glklz3W9haVBGEc1Whv5+T8UOgktcNqA3bjUKMdlQWC5cQ4jBWh7Io+vxETK5yIxBjEnLhdXZogRn3svoaetOs3XD0ne5sduBfWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895755; c=relaxed/simple;
	bh=Y2nhOCq3e5obtIKrWFEWNJ3Z3gLydgJkCSXS6s/8lrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snS03oxKIOCu9byKE6oRHSpGYiX+ftqQXDICywrhJhMIiGt5KdO8lkhjP7L1ZcaysPHQsorpiOY6qylUmpshIrCqVGgsrWaY3xA5JsvDNVzYBFB8pqVPSrseM6d2fuqDBHtIfsQ0eZYhJVYXE9N/GRM1yV/tslRD8GFFIHcF2ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9SWrRSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1JDDEB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9SWrRSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1JDDEB1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8LtEU3908692
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=; b=j9SWrRSfeCHX1JMO
	Z0ondfYsY+pNvVh1XN4AXYK60rGASjVkCkI2Y5/vDCgYzp2CF5HTRHbGy6ypINKP
	OSD28RaH8KtrutYeLdNlRmRzngfCH4FMBS09OSm4ZQFmBLAaCgMoL5qT3p9/F59S
	U1JElEXcRbTMDsm1e0jpNMjKN2pnDYuLVUXm0sjzuouA9l6xfULu71x8p/ltx7DL
	7pG6u2RpeRs38gJTCiOx2/2lgVyHqdyGVec7jkiDqctPrjuPu7nCqoD9iCb9kFdb
	ebtE5mMe1I3xCJV87plIz1m6aKAsQHXKkbjXFTcWj5Tck23idbOEVjvwQurg9v5+
	gMYdzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xquk7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5352eb4510cso4667891cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895752; x=1792500552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=;
        b=I1JDDEB1CwnwJ3buu+nnYRcj6ju5awhIz1CXgSOMtRHFSAWU84PKOkN0H3RPoz4R7G
         ivC8Jia27emxZkS3SaT7QIqn3q7kjzZfr5w4n83Q/Vk0tSoHzuptEQM2n04i7lofImOq
         lOtqk0maZKzvu7g5YZDd8ZZpDna5zG7+2FnxxM0iruxOOp9/KbrB5YuKVM8se+n/7VAz
         YVKxnObXbOJfpbr7jtHvcw6RQAWBjhTLNMeLeYixKpmB9h8Tp+w8ciOp3+VEVhfQAlD7
         ejPBWCNc9uxJUxWlkrgta7i+M73PwOtf8ucw7xe+bt993CTBtrdviY05w+Xf1My8L9dy
         j80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895752; x=1792500552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=;
        b=llTthlCCZpxfw1adn7xiouQQRPDpAbOlrM+T+Gh+VynK3cOpMfqJwuPlUHda5EEzRp
         1LDnAatm+OHuNUJ6Cfg9aMYqNi4+1Uuc6WcUTqELMjcvD/YwVEIosoDDd70Imt5UNSLv
         u3PUW0VLupZDZTM36igcugc9GjQ25uOVZkiOWOxuOAsidZiQc0RsbeqGfTGLsjRcTk9v
         boZBK3a7aUm8SeJzF+XmSO1up8uBIpxtO3mi2jP88dCVoZybA4Mp2VYaXndg/gHH2VZA
         6ymey+CBuzqs8VDB+q7xIFOS8YH0K+xkMg9TKz7m4crui/v3AFpurdfIcozktBbC+1ze
         GISg==
X-Forwarded-Encrypted: i=1; AKwUvBwMegglLh7v4uyOMbpQuL/3wF/KzLSRio0za+tdSE4sSu/fyaZR+BISoWHJCpeDcJ+M72HF0KvLa0oKJCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5c1k4GuWBU3LuMoE9wZwSmoML5S2HgOfUpwpETindUT+1U6Z+
	vxNhmigZo09FHMpvHMKFoh17DKN2U+eOaE85ApLJv1c7PzBgwA+VPsAdyYZfXl5OqdIdeSw7bcZ
	fVJUCqiaNZCDm35ditzeLeMlmas1GyaKbi2qY1gpT+tU8WIKwrdR2zLEFcuNfiBTS/aU=
X-Gm-Gg: AYBFou1PGEjz4whlSXvT9nC3ew7Htr0f8hTTvHKlQnjZuazdeL0AK4FxG/uoi3gvw0z
	IFLAqiLDqoozYUu+Pse6pZNF0yBS9RRBhNE7cDdcP2SJqavgAAursNGt4ikv6+58/ajnpogDN1D
	Xel3pFR/voF3OUb3k9RKfmqDW3mtFKONj3wpUNt3FpSiUt8a/Y5ooYI/+9JxYuu8G45ofcoNqEK
	GIEdRLvLTuZH/19v/3yIiZdKZzj70C/ymyatwJS9KxW/2+QHkMEtSObIwXIAcqlAPj3m8yPg0Ah
	b737dKk8zPGdYs+Ia3UCCITUbII3SGf5Wwqi7UzINslBfVieG76cjBRMukla/HUXhJK9faWCpF2
	W0V1oSNAy9ulCOqj6+LNuOg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2434231185a.2.1791895751533;
        Tue, 13 Oct 2026 05:49:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2434219585a.2.1791895749845;
        Tue, 13 Oct 2026 05:49:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34722912a8sm272313266b.34.2026.10.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:49:08 -0700 (PDT)
Message-ID: <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
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
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX6JIzJQ6Ep1M3
 yKYs8xCdWIOPRowuyJgYc4LRRAaNCpMNBGmltkCYJOb4nKsZtG2mO+HgYZSHMho5nT8NKejTIq1
 tBR/mvqol4GhKURO9m8LaLeRaAycyP/LKKWlRQxvKNajTr6aB53UP1hHJWqd/3r8jrLSquVDnnl
 27N24A+2HUoVJzkMLpgUVWKkrvtuJmW5YlzhvRfomv5xDuP9a7TY6gf7cEASG9GivNRBc3lIccj
 5E1iG0jhMpT0lHUyaLhr6T9BV3HixuF6iMqczA5EUalmlhl9CbLyac5CtvjsZb9qXVEW08BdBxP
 32Wjr5E0ebjQhaYb7Tc8Z5eNy5KA+h0xXRSIVHxWu2ffIdncKhZxu9KiLym+9Iq+q7B4YBpJGEH
 uGC8VWnka6Vate3XEqruJv+v7Ad+9iSWjD7yynN8y/4T4JR8cJAwjTBOgGXUWjNrmvZa7JgSIua
 lyL2GF8mW+pRpBoSisg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX9sVhijgtKYHj
 u+8HHy0koXYEAGTMryjsHKkSid2wHquXF+wrgOQUi0KtZoyfMMD03YG0O5HQS/bZdapNdVybiJM
 576nVdlJGGogdW+WoYj3wY3Uo6rEuXo=
X-Proofpoint-ORIG-GUID: k6gn5fDRt541OC_vLvGvHhzV7jFRcA0X
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace28c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uzhSaxHqr0uYvXhH--oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: k6gn5fDRt541OC_vLvGvHhzV7jFRcA0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 12:35 PM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETE,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
> ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated always-on
> rail. Add a power-domains property referencing the cluster_pd domain to
> each of these nodes, so their power state is tied to the CPU cluster
> domain and the runtime PM core can power the domain on before the
> devices are accessed and let it be powered off otherwise.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
>  1 file changed, 567 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..d9313de53ee5 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>  		};
>  	};
>  
> +	ete-0 {
> +		compatible = "arm,embedded-trace-extension";

No power-domains for these too?

[...]

> +		tmc@1d029000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d029000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster_pd>;

Is there only being a single cluster_pd a mistake on kaanapali?

The CPUs have a different Aff1 value in the MPIDR register, so one
would think there's 2 (also according to the cpu-map)

Konrad
