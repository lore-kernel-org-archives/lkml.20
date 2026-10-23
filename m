Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751098;
	b=SMVEdWGFVeCGe8GjQKEwGu5YiIYZW4/2YleCJ24F2wqcXktJvV3ld2gBuiTP+NIVvzne
	 W1ntFMwKo+37ZAnCXtQvRiBsQHgdjgPK0JBce7YnsRIbfHLLWDIHG0Vo7br4PWJiqpEM3
	 OFR1Hk9c0h6OjYv7okui96FYgC9JLA67tJjZuJkrOOh+o777LQ53I2+ZQEgIL1B9DldRQ
	 ymOU6RcMifwrQ58QWpyLgqHIbAWZYbcQjJQzcxRligwzNJ55MrEWxiuhYfCDHaYB+HjJu
	 A6ILnn5MwVmxK6LtWcHVbOz/AlHlVvfqubOHdSA1fDEXOl4cj10lK36xz9RNPOzzxzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
	b=RhTZ344FQmWogS6magvhCIgGH3jL/VKGgGpVPe5F0jCuHfEKk5RapvMW6bEMm4zPlP8w
	 C5GRjbPa98U/RzIGyIPbj7Gd1VL4IiLX0xaE1j6xCtr5EfCPM4x6qHzAgMio5FMlUTlvn
	 3/+DSqLjw0SLT5/nR+O4wLSvN/2BxrEUPkoXjS7Yynq7GuMhf/onAhyrCYxp828d9YUcd
	 4qK9750ExLY+8UnBIff1UcdR5wvUaJnUd+Xel6PM0AIwuua5uZ/g+VKvecOaNsHBDYPUp
	 Va6ly37CSNMNbw4EaQZRcRNEeGRriP59fOAubYrOFqbYPkAx7T/yU5IMG0LjM/1lgNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTUuZtHO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmA8qeZp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FDC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FDC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTUuZtHO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmA8qeZp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUvQ2164238
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=; b=bTUuZtHO9M0g+BSr
	G5I5Vs1nJcoQXL6/nL9gEGFKEcdTkN8+9AJkuDD/AL9NE6zVEftceZebyzrzjDV0
	CZHNWNwRdz9wKQIY7Usn+KElNRC3wR0hzHNKLCYiVx7BwPoJz3QyAPPAwj1D0Dsy
	Oem136dReW1uXyHbBxuco0022N+Nquycx67AJG7cLZI+Ah11DTpS1FZZKzil5qil
	JBtrRIiPqedM89aW4F2gux7W7deTC4dR4jwwRiyGU8z4Lrncs4eAT5HlNfakId8Y
	wxiBknlCjijP3xtnzX0uVMPfovSwbfFFDTNMvJaQqSnzfINiU2uSC/f1DXoL/zd7
	A6lwfA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahundh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso1813786d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751096; x=1793355896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
        b=OmA8qeZpW9NBuSD3La8dOUKOOTLN/NHVqOAsiQirQ5GZMJ2X5yJaA73AoqX9cnH4UY
         +MOGyNT/pNAdQvIBv9ZCFm8q7m/R/yEoeyAVQiHXFXa9QysnDwkTi6w0FrHD9YeonePT
         i0qIClY/YtzWtLYRET2yQkWhmoBvTZr8l19jYSZaHVdS3a/nZgIX1uSbY7qoeV8r+tI7
         5nqAtABizWV8Suv6Sm/QYYiv7gRkbrE8kTKjPhws9ymiJzuoTAnO10Ho21rVznfEpZI/
         BEyObOW+Jr+2wPbClz1mCRHBH3tcA0p65bk6aS5tFYACXoO2c2EGnSqdF0J+7YCBsfFV
         2xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751096; x=1793355896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
        b=wwTSSH0CbgfECOFeIrJmOAEKnQlh+jgKmMAK/cf1laFXDNCubE0f8FLUpEX7PXqFb7
         m5tWMIexmotePxGeNF8Kmd4uAIWeaERM6Q1G9C4KEafW2q9hViODie5m+1ebQ96k0SxT
         xuAabgwWCqRgygyuXBubfawv4B+9uftoBqylOEIVg7fzMnmallZ81DmitNW1D7CiCgrn
         SzIhcS98FULDmIBzfxR8J6A5KLp2oZmwV0lV20SDdT9dpieMjRZGIbtNPdrtoBhoN4P6
         oTT9+pCJA+KQ7/pBHZM/L1BUusEqPv5ROOIEOjR03QogTXsUWxq82XmfecozH20B6Dzm
         KkeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRqgmWnXgB2Yx3RwPgu8Tk4WQZzcQe0Rnk93zrEWZYPNzqd42632eLbmA8h2LNgf/d4b6bKwr2G5L0ia8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCljtMDoLyzUKuydk1/ZeXlEhLoPG3qTRHVPkV1dklaL4KrxwA
	MTdZo+PAkJYGO/sOJjYu0XFG++6CX87x2KhIGtzTZdA/TTR+Dhmjl+shFZRgDQzrrH4wRpk3gAP
	p7b96afzqNk+kals3d3HnluS2PtOc85FNmFnnrRUPb1BqmH2N4NAt/Nty6OAOTRnAF/w=
X-Gm-Gg: AYBFou3TLYh6MOF5DYWIrtPRz5gLVy1zdBvuCMXgKeLkJLkJIDuC2jTrwffzfp42ZRn
	R2cwud+pudBVbvK3cX/wBOkzNrluPQVLVq3JlxdbM6xdorZtMzHV/AwtWPm3XoxSteHvy+C9nWb
	MDHXqPesRCnSZSJNpDXcT8UcPOWpeTUo5gyacWa8WJYzp00pzmnir7UvigC6CJkkD28rXi///xg
	OziBriaOxoJ7TzQPbN7KZORmFtUuqYVOXbstHYJKOFZDywV+vdZKU9dEuU27phtyjSHEo8vAUAh
	2tTJuD/8rvGPH8b6HBsdgeET4asxyaoLfpDgP6MQVgRl/R/LHKRutH3BSklPQkUwEVGJgoFwDtX
	imgCdXJK+GmjDQIqsOctJXg==
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr305994185a.5.1792751095983;
        Fri, 23 Oct 2026 03:24:55 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr305991785a.5.1792751095492;
        Fri, 23 Oct 2026 03:24:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b07f4977sm34567266b.31.2026.10.23.03.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:54 -0700 (PDT)
Message-ID: <2755bde3-a969-4ec2-9106-38eb1a69f43a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:24:50 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB
 headset and Type-C accessory mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX6CjC6sDVAxL2
 6rBSeTz4CB5LN/LndZnRupRQ9RTWB9ss/g9mzWXno0sPs+XZ3AwzgBu+AfcPmuoR7XpxODjqAz7
 s87ZWq2tZAFFAux9RVnwsoEPEHfTkCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX0nWAi1gzecw2
 AAFlktFmtN0V8cjIepy8Zk9Wl0i3tF7MU6pkByt/nvyK8R/yI0t3IMw6SL0RDBkkg+tV80NJSN9
 FObuX55mmRuTGSVlbCDXAV9Nlct2H9cTlI5SoNUWBJLt1o1V8ZuS3Fwp/l8828MCFMg1jF9ljLP
 ip5kPe+TdW6be8KLz64LbGOdM4zzmHtkVaS6HNUxGylM4S5ZXmIXt9Wy3cEvQXtHzKcRZDpth0n
 /QDM1If9D8vp+j2T7h2AMuK8Dy1jD8vP4WzCeTPlTyGwLd+5ap45xcI2mUSKCKV5NhiQKaS6cRd
 adviZf88+aazJs3hmyMQgMEKnrdkbn4Wn3MfX7+yiWwbYB9DaSB99tlcu8YFr0wSQ2IZHAfHfgh
 HrKn8nQ9hqZKpf2/aXpp3Z1DxEffdjFwlTJ0pCim/JrBVqTX1H2u0uqaSetGnjN5HXvBhZBlWY+
 APQoT1DYkg1D7h5g+Rg==
X-Proofpoint-GUID: _lipra3evovSAN3nsDpp4ficL3pzEgCV
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb35f8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vVu4xHXG5oYAYlB2ed4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: _lipra3evovSAN3nsDpp4ficL3pzEgCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> MTP does not have audio jack connected and relies on USB mux (WCD9395).
> Add necessary nodes for proper audio headset support along with USB
> Type-C accessory mode and orientation.
> 
> Set the I2C bus clock frequency to 100 kHz for the WCD9395 USBSS mux.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
