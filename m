Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461937;
	b=VLXgKUiaLY6wqIaGHo42IvNrQN0e5eQ1OuEkDXab/Tx5nH9GCcaUSYrHdtGdEwI9Wv4G
	 gFM3QLlEdHryeZZop7beHslCB848Nmz7zB13OftV3PG/6DGCMpvLpV5x1EuayMflxZCJc
	 VGEttuqg9nzwWn8Z+Z6Ul39eHpmD/C/bMDIvVZYOL1y7lZxvUubd8eypnqmwj1vZgrXYk
	 oT7rNuqE0PXz/suc5jCjdh+yWwZuvc0sZdU30uqY2AzACydJ/MgLheJ7kWFHHcnV8dSGp
	 5KTkt2zxL0guxKTfqSD+SVhAOZYNMsWR069yZtmSvkwT98qx+SE2dRR9cDIrfwfQdqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
	b=LqlAfrjriAMTWdS/U549b4CHHv6fWBSuQ6LZaTNkW0OkJ840O5Zl27qTi5rkbQkveEq9
	 nu5fkWMYEQjS6skbpiNnufl7x9XRyxL5+58AGkrhllLgQRLbDfLGSISs9XvCVdD8PlUJe
	 H0ce9HIjLnmbbJVmBcDLEy4MuFfvJNJMhrsVzfWR6ZXB4O0VC7ig+bGhouJtASKGGmYGV
	 zYbw1rxwFGx6Cq8cZsjLiKHQl0ofciI9WgwgFoehsApz7NTlT9fyVJ0QQFzeUj7YtzPfA
	 WjmVuxcb0Fpea24hIY//nU1wGPMkk9GZhRnyRAmAZxjqN3XJmfqI6RoR0YStoG5OELw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5+fGACB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FF7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5+fGACB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tFPI620201
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=; b=aZq5hCtHuETxGA1d
	ZgBXVhAeq9Yo6J6HkuY5wNC/RzzrWWWntLhjFbb3RvhB7BVaQOjaxailEjrVz6Jh
	j5D9TwTFCSrG50hNd/Yr1IabXFaJXsdnaBWme5gVYQZr4mXtD//Lh5YdOOe3gZtW
	OVkFusIxmL4UYUmRR6HUt7gkFRb9dzo+uyn0RyiRVHxQ4gXAdQxQTKxq49PXP+YF
	FkkEX4E6zb/2euEk8c7ABOg1nSAPB+HKexzfroUiIpQj4ptVIJNx0vK6LrVvsO+A
	vDzP45Fb3dQ3ZwjTL0UOd9n8fG/dDUSB0xpsDOhk6Mm5OHrs3pUXgxU5mk95sqUH
	4k0SLw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nrcep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1772572c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792461929; x=1793066729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=g5+fGACBsDwHKA2wsysbxgV23NaHCPHB7Pb/GRy+Z60Uoor0VF6VPEGLVg8eTs19H5
         ExIlsznIw3FdQIk6Ciq16kXeuNR5Y3g2mw7AgwEyDzyA0wmtjInbGnVLLmOXOkA7bAa2
         qJ+gjeA+oKFcjFvKqfwS/Asv8ZtfsiSEPmTs6DNfdYXVdBQ2yDcBIVwysrLuRSTHJhHp
         qlowxh6CmQOQ5pQiVP2oPTw0n8bPwB9fIjSDd6irWLnCkKLdNYks3Zgdzdc48I3ewj2x
         cotzzRbSm/BPERFA/afSBTJcplb/oNn6arN1zSG+zYVKybU2YaVzL8KsTYjobL61UOT4
         I5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461929; x=1793066729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=lKvkQcOlvagFeuguy3A/382kZFZk7BUz6qMhhZk+HxJ1Hwl3aVthwFXdMyQNU604j/
         8ZXO43s1XzNgq3jAH0NrIcI/dbx43pYDZfeeHVAdNBHIn7uQhYv631V9oKkS7bOqEs9T
         iTmPeiBzlOO7E+0FZC0Lrnr4Uh9D9ew6wOa3YqUQDHOrEwq3iChnKl13Xgs6lHmEPWCM
         QhI4qmmPZE30rm62O9lIZwOYuVruQifu7cp29KxaWmrZaOCsndK8oS+6WncjIr182pd9
         VODIHpTafxY0DjWYH1v7Qg86S0mxYaYTZ089QmjpfLoN1ah7xiWJiuwnNP+xyRqMMhGd
         02Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzSu4LXcVon1E61s8JLZj0j7s1s5/slqVBS2g/7AlaYcNPlVxo2b7tObNe1v13o8XQ4e8AA46b1w+3gylw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLVlhLF8trx9vQf+/l1gBPnx2JRAKcOgbfdyVbXfOZd7FW9FDP
	PZUCjGLSa5QDQXbgjFTx4yhsv06uHHK1THKwJJOgaVkrf7cad4lBEp8HfNYfl7h27NrlaWWvgKp
	cVCqzuWoCQ5Abuan/MEA+ByfHN4/oTa9+r/tIoey9XNtOsV51McL2RYALYKfmnbtCwoc=
X-Gm-Gg: AYBFou2CGy7/tIzxRKYm38g4CM9AwU9FpTsIBOlKRit7ZjkoDblMrF8n5ZV+FwlCuxw
	eOdsKPvGu5Hsz6MbTd6zOk1gIjQeL2N29yZoTx/baSAhZF6e6ctF/xXCDw9ouhDKOpBoLHqO6y3
	lL2OMIy+tC9awx44VD9Q8Z+FoMEiMRhWUxvKPn9+SyieoHbGuCb4M+PCnC3pnxVAe+pBiGZJBJy
	QEgfCPxae9tOOAbefNyp8w+aAr2w7+E2tffZfKYRqI1ZXbRB4J6GTQjifR3WXg8DGdEO9q3WPpf
	urPXFLSAXsiCEljJ4B0enj1GDK16sFztE5r+6exeVpWbxavhA80CcMoEFWAIu9TFjOkoq6yJsLH
	lH2YGtSrdgDTzYS42rwp/AHwc3FhhobFhNck=
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634915c88.3.1792461929302;
        Mon, 19 Oct 2026 19:05:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634870c88.3.1792461928590;
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm36101206eec.13.2026.10.19.19.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Message-ID: <81aa3d0f-cce1-4f78-9610-67815507bba4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:05:25 -0700
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
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX93M3zU9Bxm9v
 C7be4gaC2GnmIppsUb3vMvWGFNpQss4WTe0dDHcKbcTJ+Lm2Vt/WnKgXhvlUorul1Nnul95PfI1
 ebVjc+Yt2iwIGE8En/lItkHoWSkWDgQ=
X-Proofpoint-GUID: ijYwbfigYmGXhHj76z12d7CiXDwrWZ8J
X-Proofpoint-ORIG-GUID: ijYwbfigYmGXhHj76z12d7CiXDwrWZ8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfXyfZLFhiYKdkX
 1Ql7l81eJAs7oGmOStrUFQBbE4ftAKEzJu3O/xTe2jdCw26/8qS3TEM/lLLeIwpXtzhsnR0wfaI
 sg5FCixOORDbjnQpJDL1G/fMtZva+aEhsT3SUI4CLbb+jrh+VoleSjRnP6ESl2Rutqg4PkKOuU4
 5zKGBKXLU31GPRJvz7ecm6U2KjRZ4qEmIOkr1ZArhYnKnCsGbXtu3QOmKh7wcL0oM6hNdeMTd6x
 UhUCsJ8QPbxkdKeDs1FYQvp79pLQLsszHtkmA0imrpurVnLSJ6dyCbUXqDRFqUd6cuJj7I7bLSp
 5TK10VVjUZ7V1KogvB3t4ZZ7FeEOcLmYtg1xKvjkLI9WVhr8YLTy7VjRVjNdtrWOBn+u+e+qUqa
 vIy7mYbmZ9v28Dbq1vEMJZSc1TECyfkjOTiKXezltDDUbQvjui6fQyrpnj1GYnsd5oR2eIF+9km
 kNKmZ5TUDRKlqDVVmYA==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad6cc6a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ra3kV2IsKW0ovCRCs9YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200008

Hi Krzysztof,

Thank you for the heads-up. Apologies for the noisy CC list — some
internal addresses slipped through from a prior workflow. I'll fix this
going forward.

I'll re-run scripts/get_maintainers.pl --no-git-fallback on a current
mainline tree and switch to using b4 prep --auto-to-cc to manage the CC
list properly before sending the next revision.

Thanks again for the guidance.

Best regards,
Anusha

On 10/17/2026 1:07 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 06:05, Anusha Arun Nandi wrote:
>> The new (non-legacy) csiphy_stream_on() introduced by the PHY API
>> devices support only built a MIPI D-PHY configuration and
>> unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
>> sensor this makes phy_configure() dispatch to the C-PHY handler with a
>> D-PHY opts union, which fails validation.
>>
>> Branch on the recorded PHY type: for C-PHY build the opts via
>> phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
>> lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
>> keep the existing D-PHY path otherwise. The shared
>> phy_configure()/phy_power_on() tail handles both.
> 
> I received multiple patchsets from you. CC list looks really random,
> half of the addresses are some internal ones?
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> Best regards,
> Krzysztof

