Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874276;
	b=gwqJ/3CTRQfjSuRF7SCy2p3T/IERD32FwBfnLWdJ4ANgl3xVntPHxtenou9oxbI4Mhnf
	 FzCKUhvow0+sbygtHsU06t/luksAMsnE+GRsb7gklm6hdK74Fk73DQT+kIzumZyVt2G6J
	 uwPCAT3lbf+0he/KA5qxVJM8jcMRtEWpbUnxYUa9Txt0IyG10Tr8zuA+E3kvcbZUiKmV/
	 TIFKsK0E7ByIueRXLNv9YmvkkvJMXG0sOWkAL3J49sMWInPQGgJVGmHLM8UtsoffFQLy9
	 65CmAtd7vKxjBI7zBfy5rqC4DwooQjqp3zlnjtgmkeuUNH6f0K8zfKFkAxrdVJJQ3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
	b=LnO++WddghMK8YmVcuOJTiTAj940/FhKO+hWRUvTSFzug+N/sARWsOl8F8aRleNtoWon
	 kRr5yA3MPGjqBkoBkqw/rNRbo4x/LUtmsBGaWTLR5r1tXVmfBV9g7SON1/uYl9CiCi81V
	 e66ojcyB2rPD4K6uQGSH+MaAWx+65ZL0QMyginx+xRSfZTC8Oa8XjBvL0r5Zbs9f11x6Q
	 zzBAzVTMWRgBROjC9+6Bv1ztac+3HAcwtDu+Z6Axsk3uLKTT0S3hrkCCE7iu821UGwQGV
	 60eRld5JTQxOgFck8V5sDWKElUcMtgMd7Q6OMeX7dEth9pZ8DLxlLIVIxlOzO35IWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/iQnr3E";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz6OHamm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE18606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE18606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/iQnr3E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz6OHamm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tFR1082957
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=; b=Z/iQnr3Ebg/BdsPe
	DTEbDUq7ZhblP5itLN8zCYipNOVPYLBtvUgL4Qwb4/fQ+5r4iKwFweRFJow18N//
	Z36evofEUlMKD+o+mrQTuE9lxIXuWKaq+wyBDTbEC0SjHvxg13uQ7TmW/h8bos0z
	O6jvZuL1B/Kc2sqaVcxNN41Zs9fh8GN/a0qgmnSFSUBYcvb5dARVgnALkafLEZ7n
	t984WvUmsRio+BQ1PwMI9YbojqiV6Ea/6TGJm68xjE3+/iviRy3xn1Ec2IGjl2JU
	J5yrZTBBUGw1DTbHLUkxO7nUqsub5LwmkA0wte9ML3/vgx4z3In9fjIhTD2Oh9Qu
	ANP73g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p08q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:24:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb4c49e52fso1562406a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874273; x=1794479073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
        b=bz6OHammfDyiKxPV+awfa6Ymy9wV+R25RoZ7Pwd0LhAMsPh6JE/duJ8ZX41TzvaM83
         HqPK/m9uXF1/udEPkSFk+TAF16XTxi/EMQF7dP9PY135KQw25uvsUHKh1pht/voiru/5
         yIIrZ1SiC1nlbFYNEy5sy2qPgvgdytKRIcbjf1LG0Vsdw7px/7qkuXUUu5mdB0gMy6hd
         s2Ok+VTAvGet1kcWwhaMNmxJ0z411FW3vu4AIj+PLGa3LelLPMCr4kqi5h6UKmCPg3p7
         f1jcwAtRb+tlIU1JLWbr8s9JZJseKURVCKUAlDyg+RQiyieXWkeKqCocZG2tt6xRQ7h1
         Xw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874273; x=1794479073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
        b=ArT+Hj5NSkr3SpFwowkVlBYEmmiZ25suQe/cnV8Yucdr4Q3rzKapnBDZpJrEZgIsew
         SksOodWGPk26ONEB6811Jp59x8oKcQQCdI+T71IlPcW3DNuj3hpbI9Gh1EuUJWa4QRIM
         d6ybGYx1kZ6UL9X+kM8lrq0kg+cKJWlQglHTcCt0yxhftqgwYZvScDWtBXiHKi/wXRmR
         r8w1L+lC4xOdOBMHTo+DS4kUSMCzD5AgzxgwmSNL6/IWGL9rzhCVtG5KVnTLQYgQpG5u
         MgeseA3UWAHvE7vKazc/5efmu0YDNA6j79dtoSu3/GfgOK+fKXi8hIIa8h/19ySGGtiN
         3Bng==
X-Forwarded-Encrypted: i=1; AKwUvBz3umiI5gacOC2oM1rDov3II3ugMes//FDaTpKA2nVWOvgWsNTnrbsvTVRZVz9D9zOvwl8Ne49sXXarUNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zsiar5pspAtY+ZFYJietRkzKfwZBQ2hhy9Elk7OgpnYdevCSX
	5iGcW4ekh9X+w1OSARhnoIf9t3OwHhuDDo9WKGgZT5OonQCMIxt4rxSW/3XOyYsKUSxY2A8W+MJ
	EFBFJzLc7o/FnnqjEOC3pDS8qQYn0JF6ffDDpybswF1pNKagVtBMVvj0nVQdhkItt1sc=
X-Gm-Gg: AYBFou2Ot8LkshRJpFOMTAA5JwwB4qmmB3E2Vz7/H2dYQ6rM8EetcjObnWqF57ZQ07n
	lqdA1Zmd9G4F3MKaM8UK7wGtvszTLfo9l5j8RgBPYFrrxPSn5S1DXbrmdJ/5lcBSG4S7h7yGWiF
	Nu6qcuIxhhb0RZnAZ4K0wo8PVjXPlxw+RzZvQJOm9RngyeJA56I4wnFb1Wx1VtlSY6wncJq+bBD
	bKaQALd4aAjQ6qnsB3kz5xHT+VfQ0xxYhxz1Mo1QdLtTlrj/QVy0JisA4QGOhSjPQr1pjWTqC1S
	nw1u46Ypvk9wAR+JHnMts/gac+2OWfexH8n3WN8JbJhCfvP5zGC057b4hvlG327WNbpLMGhtfwm
	69n6HEbRzIPKwNI+lCmblGCOAIcjb2SJ5EYdqzXLo5y+lDT9/W3/iBfupSXf3B0YsyYLFBvfqwh
	FKDG0=
X-Received: by 2002:a17:90a:cb18:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae897eb520mr12487834a91.10.1793874273385;
        Thu, 05 Nov 2026 02:24:33 -0800 (PST)
X-Received: by 2002:a17:90a:cb18:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae897eb520mr12487817a91.10.1793874272947;
        Thu, 05 Nov 2026 02:24:32 -0800 (PST)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094dec0e3sm3488352a91.1.2026.11.05.02.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:24:31 -0800 (PST)
Message-ID: <9a6c67a5-cf3e-4ddf-93ed-87f0d3dead70@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:54:23 +0530
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
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
 <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec5962 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7PiysLyHAn3Bg6R4OYIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX6c1wpfw/4zi9
 gLqlJSstPdaWkqLoGBcl5604tfXU6u34A9QxAll8SW/Jamx1kIDb9huwQWt+VdYbZwAhAD5W24k
 GIicl3TWqAQDWbgD2aN+QLZbgL5rylTO6aZN5l8O36TFS2yKIJhQVness3kzNYnRa5QQ5goXcsE
 rlAKqFbWPnxqKIyT03Cqpf4PZDwjn3dxUjBrRQalCb3YkcdeoyxhDcR/EMla7OasyyNfK6B1xOv
 ADR31b9wi95y7tp3jYLfTi82Jt7Xu6Zl+Sgh+2OgjK0bWUxwhGM0VZIKArKL/h3TzbQXzwwIy6D
 O7Wo+MeBt/RFX9doDme8OA7PCDwwXM0PNH64ngbuy37gmQ9beFXpg3NsxG8+cmKZDW6u8+Y88bT
 LLW7c5dc95UcALfQTX+YYSTGtPx+3EEWZgr0/uEX7R8RcXAlzLQOkJKXHsErk/3l1jviDCATKzi
 ZkTVBplPGNETy6pGjsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXyh0HOTkxeixX
 dKhBn9wq8KkoqYvZyuZ9Hg+BxB2DVSb8C4PlUaccFLpD2bp3U/YdSxEgBeOFnde+Tur79UjCVuQ
 6xucKlJhKuAZK9SmFPLZPz3dAYb3ZzA=
X-Proofpoint-ORIG-GUID: o5zijO_W1uPZv4iv4vxvZWSeorK1pbWz
X-Proofpoint-GUID: o5zijO_W1uPZv4iv4vxvZWSeorK1pbWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041



On 02-09-2026 21:59, Konrad Dybcio wrote:
> On 8/26/26 1:24 PM, Monish Chunara wrote:
>> The monaco EVK board supports either eMMC or SD-card, but only one can
>> be active at a time.
>>
>> Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
>> configuration from it. This allows storage media selection to be handled
>> through device tree overlays.
>>
>> Introduce an SD card overlay that enables the SD Host Controller
>> Interface (SDHCI) for SD-based storage on the monaco EVK board.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&sdhc1_opp_table {
>> +	opp-100000000 {
>> +		opp-hz = /bits/ 64 <100000000>;
>> +		required-opps = <&rpmhpd_opp_low_svs>;
>> +	};
>> +
>> +	opp-202000000 {
>> +		opp-hz = /bits/ 64 <202000000>;
>> +		required-opps = <&rpmhpd_opp_svs_l1>;
>> +	};
>> +};
> 
> This only adds to the existing table, not removing the existing
> entries
> 
> Based on the previous discussions at
> 
> https://lore.kernel.org/linux-arm-msm/de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com/
> 
> I'm not sure this is intended
> 
> Konrad

Yes, this is intentional. SD card only uses these 2 frequency options.
The remaining ones in the base files are for eMMC and woouldn't hinder
the SD card functionality.

Instead of maintaining two separate tables, the common one can be 
utilized.

Regards,
Monish
