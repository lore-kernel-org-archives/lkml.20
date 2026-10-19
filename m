Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908E486E5A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394749; cv=none; b=R6AvDS11O3YN257YWSP4Ut4Wjqsf6ap1XFjYYrmXpVZdjGLO2DnJQVQJXzJ+kB8ONkU8l9eZqQVL9jnpJPP5p0WOb+3TP2W+syXQzvKRl8fKYQbNhxEVF7KJ+nV28Wuip4azwfyO6/AsWmY0A+Te9PCQLf4EFnNr4XFBoi+deBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394749; c=relaxed/simple;
	bh=0xQUeD5kuMCGhhK+FQyGwuZHoSMJnIxmG3EWT2YgZuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUIMHWPeqrsc7CAQN4szvUEq44luVSe5ZSVhd5fP3MAVuy/R39FwA13S8zDnNavBpwqBCna1S7kal3nv83Gg6g830hQ7lv0xKrS4DLEJ4vSqwK5u2twD2V6G2d1Ipil8uY4IiJG044E4VXPQKKS8FQZKgxPc0k+2s6zdhAVsUew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNYbOH2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G01N6IaP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNYbOH2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G01N6IaP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4iumn1405365
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfEQlfKriOoZNiF29x59T585s1PSoDwBql762uznc+4=; b=TNYbOH2Td/6mbw6T
	2/pcZsReh2I2+54kXl6sXTBtpGyTBa3K63+Tk2botHPQZvWalwe92OP8Zn/IFLig
	oVPkDxOk5BKaozNWbHkBWFjEfG5cvPm1D1oGrUI13sqyPuNeECNG1kOvapi9PXmZ
	wXnF4w1VHjPntkM76V8bJj1TMUwi+f/FEqJPkciYb05oDFFIYQu/bkfwlv09Kmkj
	DcurPDVSjlSU+MCWemYH2IgXUnxIDLpkjSSYwuwAc+WLIrNOC0D9Wgm12GX3uhGc
	ulGDQrBDJZTeO/eGOBcONckSSa238Lnmy7o3GIHFt3p131FDOY0STpWQHpfdU+vg
	Ki2xBw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr8qep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so774834c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394746; x=1792999546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfEQlfKriOoZNiF29x59T585s1PSoDwBql762uznc+4=;
        b=G01N6IaPLOBmrrgOTHpMoSCJAHk7Oib3ukKS8s0uFVdY4HqytPL8JjZ6FeUSjmNdRe
         2l0RrKzjb6JjXUCk0dCWCzi0jYXcUSehEcZ7UDyJrLr8bPeC6tZXwgkwX4FBFkvrN2x+
         ZnLSeyHYIF7EpMEJBc0k1gD6WL8Gypvd3nv3s4lidUV3jocDT1DeK+MAgAvTvNOisl4i
         fYYxYjfK3u9wUsFyadZmFHylAuld8yYQ34z+dr3jXNJNNbfNkbmL46UtpjoR5AdqBc2/
         6J5f0upi+lXB2uctl8K7R46Hj78KWB/b6djzsvWiHOn/K9PQetq7xPLHp0+QDfncMGCB
         1mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394746; x=1792999546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfEQlfKriOoZNiF29x59T585s1PSoDwBql762uznc+4=;
        b=R2ECgKxlyFZ2s13jf11/K8klU9mHOARdkP6Lwvg1eD4zJ7LlI5xb09FRZ7bb+j0R8q
         DlnRomFNsfOy6Z2s9c5ac6W4UgXu+/G2fSp5w6/dbQz3L8ZM5sRKD087YRvu9o5JLGBV
         5BKYVFgJIIZ6S7Kz3K2IenGH0zQNKDmzbwb2HoMcConFbAYFPGynd6PPvQWVF9WNcApI
         4yQnaxETakRR4YutUVXn0l0wDtUMdah9wRojwzJn8JEJrjIE8HqpXdLc9v5RkUH5nI5Y
         ArzOrWpwYIi3KfEl9n577w1gSDhL0zb+NIapuY/mwYvW6JdWqk44IOTz4sMeTIliD74K
         TtNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrtG3ISTqxm6iXghvxn9DX6nPuvqoSW+lhTefJ3N4fTFtJdEA7AQlF0W5YJqutVBDXa5UqDs82xYG3VK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqmjqGEQM5j/2q/0YnEPe63catdZzVFKfJ62Rmqmx+fUbCtW+h
	8AC9RlfxZhd+oEezf4bdh51D1Dv7qCbT73cVMlPhPUub+hMTHSd57bQJDODci/+A70W3Rc8ynAu
	/gbZNoSbPkXEnHGQxQil/Rb3bKdLsTfo4nm+MAJIcvtkv5l63+3KLAdtgEyd9ezG16dQ=
X-Gm-Gg: AYBFou2eBK+LAyBikkNdOmA+ikujWSd9nIj6APNJktfk6afih1jufkpIjxNp8NyKmc2
	gHKYN8iZYhzq14jDrDjd3CRyJwj8JX927BWfhWGf3yR/hSE27HIz/5v+09H/Dy3W7ST5Gt0ViTr
	iMdHVI3ADkcbNAT7w0aETz40CBMOH6coPJAYpOum0wvO/Ou9IgeGY6ttM4x5pOxhjfsuqNEpWh0
	v4/qyk6+NQzfhhgR7FsxJ+XfdUIY4vvL/hlFXSOJsPc4qSGV6h4wvyVPqVsPJcDMowzletzNvF5
	jAIigb4LZN8KsHsOzKclIeM1nvVgvJh67mliPKzcob+gZrtMnKUpzf+W5eGjPwYuEnVas+F0lZ2
	Qmu/yppbU0qug+5rWEno1bCMzjTeDIA==
X-Received: by 2002:a05:701b:4309:b0:168:3243:c91a with SMTP id a92af1059eb24-18511eb6891mr11403406c88.13.1792394746228;
        Mon, 19 Oct 2026 00:25:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4309:b0:168:3243:c91a with SMTP id a92af1059eb24-18511eb6891mr11403360c88.13.1792394745648;
        Mon, 19 Oct 2026 00:25:45 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm26416418c88.7.2026.10.19.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:25:45 -0700 (PDT)
Message-ID: <7766382e-5187-465b-aa89-ff1bf9a16588@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
 <20261019-funky-real-skunk-eda6dc@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261019-funky-real-skunk-eda6dc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfXzhjOHrHXgVQw
 M92xC2EvRMWkxuV1ZtF/t3PhyLyA5EtaKjDXeaoEoXxj0yo+ZiFXrQaYfUiN9cHFF5y2jwwX7IK
 uYYAuwr2lZcluoVeFduy1Ofmq3bSrEd2EfqcdQrTfxnalJROrn6v1AJrIUTDzy+3s6QLSvKWP5N
 HLEhosNA5T5RInsI/vgxpdyVghD3S9LmMjQvk45BDCoWNoIl7LFXghu5v9wl6/uDPIGnj/rlgGC
 41TQ9yHBx9w4WZHDKNKKv6tkjaLru/JqtWAPMAIkZrb8r0QIm0fok5zJuhN8isHifZqgoY9+X4W
 DqyhPpFChy3gccPemUjY+bVkbti0DBUd96MiM0FDKeLa2GigprGMAHNijGAGmMyq6RaExydUXtV
 p99CCJ3D6Yq4ef3MdflF7Z9Z+I6jlUgsVh9XsGYOOYrfwHf2QoQUhs7jfFADO5UgFg8QiqYtmNy
 JxLmQcIm1043lZVJu1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX3Gh7tMN2G9pq
 MMbjh9n8Za1VxrH4+DsUz1Da7ZbeByaFDf9xvGkCEFtj8ctHPZLHqSbs09dnVuK8jRoTRfekqFC
 QQWnXnpLRrL3gtu8p0v8AhVY+7K8Zpw=
X-Proofpoint-GUID: Or6QIXtoBTxYk6-G5oJGjf7jLY_khV48
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5c5fb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=K1xP-2VuxSs3Jipg4doA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Or6QIXtoBTxYk6-G5oJGjf7jLY_khV48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190029



On 19-10-2026 12:43, Krzysztof Kozlowski wrote:
>> DTS uses 2-cell reg but binding example uses 1-cell. Please align:
>>   reg = <0x0 0x0ac9c000 0x0 0x2000>;
> I don't understand what is supposed to be aligned here. The code is
> correct.
Right, the DTS change is correct.

My comment was about the binding example using a different address/size cell
layout from the real DTS. 

Krzysztof, should the binding example mirror the SoC bus address/size cell
layout here, or is the standalone 2-cell example fine as long as it passes
dt_binding_check?

-- 
Regards,
Nihal Kumar Gupta

