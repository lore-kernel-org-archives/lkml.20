Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1964E56C7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976951; cv=none; b=Zto0j3Lq8BqwfU4bLhGFRfpO6e1HpWqjzDha/uaWBWH7JAKXyXQIIAs7nxPXYI5FD6fkJgQfv+Ql/A1dlqGPPWCOQon7kT4BSSIt5SsCyDLf4hkUSekCHfQY5AWNwInIeqveLMYyYz5jTl1LRxKc+39w91y1FLGgiy2SGniCJwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976951; c=relaxed/simple;
	bh=nghA7EL28OfNEM4e9sWQAgadJqI6/vgmN/VOre/IdDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrXS7Gvuw6TrJi7vkdTOCQmOriFJZuUO1WxcPu+QW0Lzj28PFbrEEREX8U1DZ7X5TGVAvJxEN1iqb3nKxjiHzcgZ67/Ad692W+frvKOImajAdfG/yukOlnAfkYjbzKXp7EKHDSf+vXKqzD7bLyJ4V8Fwwsr6XVZZ4XVSES1a94g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbwGiBWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPwWm3RS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbwGiBWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPwWm3RS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9pjoZ2222109
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULOvsH3n2tUueS7iXn80SHHQAfBQb3QoM4qM4FM0XpU=; b=SbwGiBWRRgrH+SNj
	luovR9GAANXHx7sK0CrljeCvKxSrqgYh3JPldEv1AFpQ72Hn/zQZg3ILsZkfAcb9
	7oI5bRMcHaBmckKiv4BQVh3//5udIgmeRUctlKHQJ16dMK11WNBNK3r56buYdXFz
	osmtovfZ19J/GrACiTI7Mv8Ux+d3J+GyJIAHWjyr4o/RZFdQ3umvq7bfDtv1uTwv
	uE+iaBxS9qN3z5OW7LUMQWhHRo33B4ek5zBqeBSW9u4tSye0D4FdgCIZLA/2mp7p
	mPc4CxFNIR1CxGe7bUZIKo2tCrTBEtZR00b/fmGYRAnt03genwEyJkVv3iDrBLre
	5lVvSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbbj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:22:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so49455385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976945; x=1792581745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULOvsH3n2tUueS7iXn80SHHQAfBQb3QoM4qM4FM0XpU=;
        b=aPwWm3RSn2w5FNoKkmmfbbeygQziH5O3QSLhUAF6RGBXmKldOnD+zUzAAPa+gaVEMc
         qsDUgVx4nYD9+qf4+dcV0/KhvaO2IABlSWYAwCHLdHFRZN2Q5YkpRscegJOelReHv8HK
         5SY/153/w+mO7pG5Mod89vpkb8lDcIMbU8R99NGtRPqMDyJS2rsV6+A6z8smMvoZI+8Q
         TudzoaCkHNJdU9lz2FY+bWiAf0ecOyS84MgQSQqhXrPAtgPPjhZgNbTgPs/I4p/myfIG
         N6u+FQCTz2w+anD5fsj3s36GAQP2Q41eukQWmxrdUX45xkzij7ltG+4xxahy5uoNs+nF
         ldzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976945; x=1792581745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULOvsH3n2tUueS7iXn80SHHQAfBQb3QoM4qM4FM0XpU=;
        b=qaZyJ/RYUfe3ck3NASIblEUi0UFvP45JkURM5zuMZBIl/BnJRc8isYbxs5IgROSriK
         lpwdj2SdRcdqK5JlShM+1Zu4/Eh0PHvHo2IAM5uw3u7mn/l+Gd0eLGXA9MR/egqrLtXe
         Db9DhoxfPcs1c3CBVqnT+xyY8u5Aj1qH7fs3SRysF7x+8ezJ2fPImyMdMmMkGRu7uTBd
         u2KtP9zya7WCMvmhPdtn3DI4171a+8QYAzUoY4iFVnEw5Y4a/exKK8HVORQhescK+MS5
         QXuzk8JTiuGpbaOXPWuEg1PbHJea2KEXDCL+4JtbNWyD0wICrkoRSMwVO/5ux08xgnkd
         h/eA==
X-Forwarded-Encrypted: i=1; AKwUvByGrpemgUQ8xxDxF6j29hYjx+qhxg3NEXNoqOTfd93kQUys+zUUZTGNynwXQSzibGlDYdfM+ZgAtbwPCiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1WcMRJSOdhRJ66bHrj9QWzyQuVG32zHB/mm6uhZyImoAap+P1
	MO5l409/8Ez+xFwAJ72No41lpd1NlWnXe+XnspRBniWxUW9uL1yCjXg7daw0mJtZLPa6CxWZ7im
	4G5zgGcAGc4ZTfakV1Kp/WkY6jWOg02eTP2QAR/DTPfePu7irri0+95d9kQKsb+M4AuI=
X-Gm-Gg: AYBFou0i6AISF33iykHbDM+IvXCBHJQDux6lrQz444+fgW8WX5je26AOiBZw4ebRYBB
	UHAFdNEHK4Ix5MW1QSvcwQToht3QCXzrk5GZfKQuHiYimg96eTO6MM3B2CMawWp0alP2QTZ42xx
	7saBawScUdjtZ+oFuwev0hAUUQuTUYKVJ9n0yZxMTYcHzuLEcPAtP21wwJUKAIvnydC304AzJhi
	CZqiIaC0kDX8YejPkFmXNLiWD0NISpXvq2/o1yB0o+d3v4v/zrdNVOdXlQRcuIpMUP43XBH4PM1
	eFjRABF3ogC8RsFfkiyDUsyxIdCo8bETyf5hQFGwjO61Vo2oT7qqUekxwV2yP6EYCnPNoGLY6VU
	DFAlhSadiA+eHknCSLxDe6Q==
X-Received: by 2002:a05:620a:2a09:b0:93e:6618:f4b0 with SMTP id af79cd13be357-93ebd228f49mr2901475585a.4.1791976945268;
        Wed, 14 Oct 2026 04:22:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93e:6618:f4b0 with SMTP id af79cd13be357-93ebd228f49mr2901472885a.4.1791976944797;
        Wed, 14 Oct 2026 04:22:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm689583166b.80.2026.10.14.04.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:22:23 -0700 (PDT)
Message-ID: <056e06ca-02cd-4bc1-883d-a92bc4dc675c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] i2c: qcom-cci: Add burst write support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
 <20261013-cci-imp-v2-4-6873326b44a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-4-6873326b44a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX3coxA+/XUGZB
 hp5SGhn/HMrlxVRRidk8obu0psYIHwd1vbipBkj8mm/O2HfyP+5Z4yT5I8s8FL+iRvrZ+9SBILj
 y5iV/Sz5fulJYkJLlTy/e7xWG/El3QIHleSVbwnj32xDwA9ydt3iqepmPV7LmMfXR6RorsgBQ4m
 gJYYjoBLRqNOdPxZC8hXfS/1CDXKl9V2Kiy4UoUjK3EyOHHnnXHTinNnREL+Eb+T9cxdP+I35et
 5JnGjHx+l46gLuy/p719klxMsSOF7Xbbqh0elcexkM4R1sxSyUb5DJG5Hn+UUqI4CSc3tLHvH4k
 ktS8xz+W5hBDAXSb6NbpsgChUZh8RsRUXEE+tnYJko8BsjuJz5KObx7jW9hAALYpZ5Hrw9FdQZl
 kMuTew/K/yXflyjp075WCcGLLNf5F3UWFTBZVglhqONHRF5SCDYgg0M/x2hkuym8oyMeYIlL+WG
 HuadRBffm/JbQmsOaVQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf65f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_CiVM9ECRzYkMLiNPFUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NSBTYWx0ZWRfX7femCIDTfFjD
 9KanizCV48vVEcW+6dib4g0hAoJxHEBLrLnggsQpQFnjwnUKQsPEFF6cIxSBzKX0taKKb1O9lQE
 NfKNrMwd+8nGyR8v03CRGqZUgtAzIbE=
X-Proofpoint-ORIG-GUID: MRLNAeDAABbydWbzAvD0DI1yk3wwcrkg
X-Proofpoint-GUID: MRLNAeDAABbydWbzAvD0DI1yk3wwcrkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140045

On 10/13/26 12:30 PM, Loic Poulain wrote:
> A single CCI_I2C_WRITE command can only carry up to 11 bytes,
> so every i2c write was capped at that size via i2c max_write
> quirk.
> 
> CCI v1.2 introduces burst mode support, where consecutive
> write commands (marked as burst) run back-to-back as a single
> transfer.

[...]

> -static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
> +static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
>  {
>  	u32 cmd[CCI_I2C_WRITE_WC] = { };
>  
> -	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
> +	if (WARN_ON(len > CCI_I2C_WRITE_MAX_LEN ||
> +		    (burst && len != CCI_I2C_WRITE_MAX_LEN)))
>  		return;
>  
> -	cmd[0] = CCI_I2C_WRITE | len << 4;
> +	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;

I think this calls for FIELD_PREP(), but we can do that as follow-up
cleanup at the end of the series

Konrad
