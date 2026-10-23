Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748235;
	b=eqJ3mxKsHDdJ1qEzRS2Kuv5/rN0MAVg5W7AOQvUqSH19G+DqdhCQpPWDkc9DsPAlfo5+
	 g8BwrTbYpSOeOleWzKBjPadR221JsGLmcJDqMzt3+eXqT1APOPE+RMYxXcLt92ax6uP4c
	 my95CEDCSUCIpo6Ozy2Q2267B7O5SNnNqd3znlkJ8B+L0vdBJh8X5bvmfbkJBLnqewNrD
	 OtEHkAfzlxmAswrnj8ebjPcYaCBNBw/2DsBHzofTh47ESNt6W02mzIIMICZzkxoXC0pmD
	 9vatgOkEMEsbnQCJCU5gXkVBS8C4GwSmE367XPSEXdXlvRKMvnojz0ulvpHaZ1jaPFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=;
	b=3M61DG+aXh1SeluzmkWGYfgxESjUO/PtjO+SOPXBlxJBMC/kbAjVjDpTEC8AbzXhyYd+
	 dAenstYOER3ooGwbZBZBD2+BxSNkbyOnVylimhzaP3RdqJ1zHCXvK0YPdULmdargt+z2w
	 oZkpJnTYMGQ4qJr67c3+bY2uv/iqQxeWGRTy0WXzZwJrlOUgJFSX4LLSW0FstAWqpLdOE
	 UcmNclbKB5VDoSrPZtOrkQvL2L051czy0WQGIYM/6mhj+cwC4ohNodJuAvYgjoNUlL/ny
	 LpL33A7UbsEQAMloZuiKzSmVofI70PGvo5wOZ1kdZxN3n6GtJo80pb3dmSy1nS+RsMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCOwcxZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ4+80En;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCOwcxZy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ4+80En
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMPs2572486
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=; b=BCOwcxZyeo7EnaSu
	EyLA5DyH3FioyXZKt0nqvQ4PLcOfe+KQJ08NjWH2uFM8ubEy9auudJQwotjFl4Wy
	VN40n4oLRt/upUeeSJon7tX1WxzusV8rl7v2tp24IZy0o0g4uQaXv68QPvSBGQ3W
	UtL3t836zzUZnDlyrtjwx7V4vapmkWW7CEjPIVewiu0EojtsKlVlckycVoBerEu8
	Fa/kDYMyfl36iz8NTHei7dB/d9wmSrKWpZ1e8N3Uza7nxWdjKYz6d+fNbuykBfBl
	kCyX7feHObdRJi4+Rh1KQP7wo86Gvh6r2W/Ajy7/Y5+QVLZxhTvEEyUa5GS/axoe
	506lnA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0khes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:37:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8862ed0539dso892371b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792748233; x=1793353033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=;
        b=JJ4+80EnIb+5jX6tyq6ALwmMBpgJLqK7fs+Ym69i2+BC7OqNxPz1R+MFGxW3eLyjRk
         XdT+Ds6zBVpG/CqqUc2OqcLQj1nNRaF6gYznfPiUe+2EAClKDTeIFXRVBzFQ5iixRXvx
         3KtoCSQ6GuLYvbIcIzN4G5SvOpx5aaQK8dgnZvfYV2pMa3FEkgUvypQJZAaeEbxnr1gX
         lBM4QDm+YzRbgmIrGagX5o3hMSIC0erNLMjit3Pswtx9hwQrGwIuzqESgjE8RqWORPR8
         I62GovkZSEKkHq9IWTvGytF8RvDeFQo8IJaW4zSD/npIvjD+CK8Y4WH73sX6q5398P3z
         cmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748233; x=1793353033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=;
        b=EVCVaWVTHLrfi0LiT6bVLgMxOuqAMpgjjJJNSUdNMZja/CDZA8eGv4qj6xNtyYA8cV
         S2GXZhu5lC1HPgtbfqNGLibIyDo5twpIorMPt2gYDHQaBJZV2eFwxhGBol/Ax85pMiUO
         jg7H4VeikeEVV9pZtWLzg5NB16kOpOMf0E/0BOdRzK4V0M+DCK1J6lnkTDSDfXtW12YB
         gQvwAQHQaTJV3RQ8zdPTNqEZOECHGUyQHWOYrRanvw8+Qv8RxUm+uzsYYoODDFIGZw+E
         u6wlH/yEE3qddErP76vs/llgqWzgsH5ULo1RFUQga/KLtOSR15lGzFTdYssipnqk7h5Q
         4sxg==
X-Forwarded-Encrypted: i=1; AKwUvBw0hXkuNSMkjly7shd3vRfX02wZWCdXq4oPBP3TfdZXSxaSS77ahHEZnSjcSoC56/W7wQz55rEdNijaNAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGmy2QEI0iAE8WfKEgPKMG2h7fqLMNwYqzHq5cBwvz/ti05QIF
	KH8MXyWryQc/xjzKa39fT5/lM9UJZZd9pR4ffIn+eiDo16LQmmqOlwbdR4MBz5WBDEvZEzqQ2wO
	2RCN7fHtdNpTLl3zvlcXg4+PCFDsxTOZfjZnAC7Uoc9uHtOS/CBLPaMobLjOs+rxA1F8=
X-Gm-Gg: AYBFou0ihYcdFRNR1BfcUb3LzSO7eQkNZ/lF594L2MCjMe3bnjVphkv1Lfyr6h77rd4
	j2KbwDctdeuPf2N6nILHibPmcV6PBMSSRXuufvCxjuYZR2yywz9n6ALZauq10V+j4viITHGrR0W
	E6r6uPWw9hRn7aUspmIEbmC8MieOu1meHpnYcZ5jEU6khsmlU6z0NDvAvXOLJWrMRQa+rFY9u3B
	1ag6YRZtzC3DhVAiI8FrJvAN+xDRCfNSxxiKLTmsWxEk/CDnYQ9qlbIgquLkTzHhV+5DBTRq8Nw
	vHplORK00GYgtInmuY4MBEPE63FUU/zXZH59w7duZN3oIimXxFygvsxnwzQKs565UY3FgsM+bUJ
	KJJ5fjsqhTmLAXNe+YPNHwpnZfjayPBeVUiD+KVu8Mx64vih51elx/APcFcar
X-Received: by 2002:a05:6a00:390a:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a2c787c1afmr1496033b3a.45.1792748232999;
        Fri, 23 Oct 2026 02:37:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:390a:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a2c787c1afmr1496014b3a.45.1792748232524;
        Fri, 23 Oct 2026 02:37:12 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8dfb7e8sm538052b3a.36.2026.10.23.02.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:37:12 -0700 (PDT)
Message-ID: <f713be3a-5ff4-4157-ac87-47a19e3f0a86@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:37:05 +0800
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wr1Uyc4O-MFJNgalkK0-u_MHySHYMWv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfX8fBNypoOQ7zM
 nsv4zUKma0V5GFyGDtOf7G5f6cP3BNa+pvvZPA4eNn0Ng/bTOZIl1NgimjOLKV5bNX6gww/a+7V
 DHD6ats2AvWeTCWEv0YkpxhL6au+bc0b92cyinBGqnxDl076kNXm8oHvUVWqxBJgiVQXh33nQkf
 0kZSxImkpIaFNQSlQ/2j9/fMBKp6l2sECv/VyRi/AUsZtegQVIKWDmVSTCNg7S4hW5+u9FRO3ad
 fdvEZZQp7GHp4sIIH+nz7qPzIVx2kjqZULB73f+EZCF6oCi54X7V9GqjWXMCaYxnntlQTFZOmJp
 0M0116aMrMUWDVTQgudXHFkizMYZwMZAvGJPMmFi3NtY0TCyhp7hPMFXQS0SNyTPsu+xuaiQ6SA
 h9TGU94xT6OOn8rnkmS2ipOv9oxrEwewxTMJTAItXk15vT1+XFAelLMQQvrzfd4BF1ui7R2Zc5H
 iES2r80rLrWBuqle2aQ==
X-Proofpoint-GUID: Wr1Uyc4O-MFJNgalkK0-u_MHySHYMWv3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfX58QZ4M17M87J
 ouCa0+WQgyDu538o9XM2T9sR9TvHcSsJiyIrxpxW9T7LOHGP9rb/CyFIXuDC8HgBiOcXzb0kUo6
 WApuV3FO3YlPu7zSni80QSms96G03xI=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb2ac9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=-Nk8vmC4l4_uGId51r4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230038

On 10/21/2026 10:02 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
>>
>> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
>> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
>> lane mode on a rework camera module.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&camss_csiphy2_in_port {
>> +	camss_csiphy2_inep: endpoint {
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&csiphy2_out_ep>;
>> +	};
>> +};
> 
> Please define the endpoint in the SoC DTSI like the glymur submission:
> 
> https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345
> 
> [...]
> 
> 
>> +&csiphy2_in_port {
>> +	csiphy2_in_ep: endpoint {
>> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +		clock-lanes = <0>;
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&s5kjn5_out_ep>;
>> +	};
>> +};
>> +
>> +&csiphy2_out_port {
>> +	csiphy2_out_ep: endpoint {
>> +		remote-endpoint = <&camss_csiphy2_inep>;
>> +	};
>> +};
> 
> likewise for these two
> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Hi Konrad, there is one subtle difference between the Glymur and 
Kaanapali bindings that I'd like to clarify.

Kaanapali follows the X1E80100 binding, where data-lanes is required. 
Therefore, the endpoints need to be defined in the board DTS, following 
the same pattern as Bryan's series.

<https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org/>

Moving these endpoint definitions to the SoC DTSI, as done for Glymur, 
would cause dtbs_check warnings. Would it be OK to keep the current 
endpoint definitions for Kaanapali?

---
Best Regards,
Hangxiang
