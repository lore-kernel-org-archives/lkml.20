Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17744C50E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989053; cv=none; b=i2XvygpUPZOhJ9KwRTVYN/v+tMTnT89tIUEDg740NECoJnZOm59h+vikTRVj1ZkqKmUfNYSYdpBc4gu7Eb6o4YOGvwz+K9Kxr2UwbBI0hVaxcXVSjUZQ4q4KrRIqtLJqdd8w4jVTfn65Uk2OCx/meYZcQBJO09mA0WOVE800QfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989053; c=relaxed/simple;
	bh=zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnIvkrTlnUsXEz3Zqil5JZNMby5FTDRsbOxvBbKVu5kFkQys+CCBYZiokb4IXyZh+ZpyJJmOYU3X//LhNsSyETVruokVzYRR/mAvy7oU906NQyn2t78uXszbwIi7rL3JIyN8B3xzr9Vb+bwuU8Pjrw692dkEUMZQLsUGDhB3Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7e8JBON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XI4CGvgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7e8JBON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XI4CGvgE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdvEm3818640
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=; b=i7e8JBONAiXXKK4Q
	lpdqo7alndneFLzoUNWLrBCZuoAeFmIkdBc2ILMSlRq3GNinlG4VAKSptMxAaher
	N4mGx0oY6DbUidSUtvkgwQ+6apktN0UyMA+2LcOR2zW34Lm5ErBmbJIpUhCmrn7E
	19eM1sJ9OSKcwglsEwQHBgOq/hzsjPp7niQUMpTRCE8eynuN5N+WiJBvgMkukvUT
	hlEvsU0CAM4RPqG5vrNCy6MlEcj7GrCKGUC7QB3bRN/RzLP/jG5iPDvHwgdfw76p
	q3wYIb8U5Zhy6mDDCYZaBkOvDEZTxyHFjZqe7WHPOR0zKhw40ng1uKxGHtzPydwN
	ZHjK1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79ab9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:10:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso5311877a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789989050; x=1790593850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=;
        b=XI4CGvgECsv7jX40aXezwpby6V4FeAs5IYMPst4H1oFcrp7lYQAkID4jdbgU63zSeq
         iGTgsDzokTD1kl7xIOarT3/ESqxAq6ELp+h0faLI961X0On+c0OgUzQfgTAVLQr8RNjt
         1tijoNTI/vWvGoWuGRNF34DjZ+zR7BiZW4JHafAjeMciedVduL8IuROPyNfxPn32jugf
         UiWnd880cz0a0Rt5UfpG9DbNweSlPLxVilynA/8v44BxjgOH9z/1m0qnY1UWKTZ/HVHC
         y/rap1Xfk+FoPVHXwolrKmIt8xttg+UQNwylcw59z365XZL337uV8LaHFIYdOaxUxbk2
         TXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989050; x=1790593850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZANITfBAADxe2aXB4OWVwHM5pufoz95Xh2AMggtPoE=;
        b=TiR8+9rLqk40WXuhUOjMLyFjIAhX2Q9Pf8gdIj76+GQgBVi/u6rSd0ON+U84X6hV7M
         TUiR8VvSA1G8Ri9tfmSKuxioXMKtGwlHliZZRiGKUWBSZ9znRhfEwsrDccFkkGYwWpmN
         zKSwscApEncpk6A7NjsTib6wV3kyJpix20o6rH7lW1xCU9kvdzn2uGnF2ukwVWQGihT3
         0dMvkufLFG7u7fvGEuW6b8Tx8FN8YrvxrrXgl7ZMp6+3sPjuj1aBMtYz3KxECPd6KMCp
         /VPoTrtv3+17FhknQQhi9TPLHqrb6G0ZeJmLv//doBe84DghyL4d4cbNQuUptdQVDn8X
         93yQ==
X-Forwarded-Encrypted: i=1; AKwUvByLaFHms+BkNHkxOdeFYWxr/UTqRgrOdqd5uDziqBSpLiXdbRv47FtFyUKnYtrRa06n2GSEKJud/QqR28k=@vger.kernel.org
X-Gm-Message-State: AFuF++mH1K0ChNu3kqtRddG+CXPnPQEHRCzVnDP/HPgJxOdsl3JNhabX
	evTrgAFN7j1TD6i9fOmlmm0bdhfKB6kw+Rz0yfy5CFUzQ7lBiKQPtp8W1b9bYcLIl5WPZ3m8/wX
	RSxYPSFmnyEGLuT8AufPSA8nxhZy/39TWUu6C3KntMnqa2jDil8/H1qkHu381xRMkJ3E=
X-Gm-Gg: AYBFou2O63XQHLWgrlCc0u6b3H3sqOK0vG11Z4kRlvzl2/jG2hZCtE/ipo+5F5Uz6X1
	KLKhqVOR79JOiSoZgqwZXQ8d1a5PG8MW64QZBpmF5LeiXJnEGViXD+pPYIoryVqCgWHwo2Y6DTr
	zK+yORwLzoIcgmpGiHGX12WtFer1op9rpsnQWGcUkWGMtoWmCClgYAEkgYr8I4znruvYDA2Vztv
	rVxSN8om+Qcgkr54AkAoVv/jHmh1+pavtYsLXZWYc7V0ytvnZ3k0/wIWTEdD66W+IbJNjGqbQwT
	uVbip7u9K3qPCrXjzCAIQDTISLHhkixvDQm/MeLDM2zRQIH114A0MRveQBmJix3kEYjP79SnCjq
	6qNDGi/jvZWcENQPABFAUqH22r1PdTDMw7A==
X-Received: by 2002:a17:90b:3fcc:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-39e6c6936a4mr9598903a91.60.1789989049708;
        Mon, 21 Sep 2026 04:10:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-39e6c6936a4mr9598852a91.60.1789989049167;
        Mon, 21 Sep 2026 04:10:49 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm34170227c88.15.2026.09.21.04.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:10:48 -0700 (PDT)
Message-ID: <f2324e26-88a3-4411-acd5-9645552c4a14@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:40:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab110ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LDKDF4IIlJaBd5xfOUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2MSBTYWx0ZWRfX8FoPp35BVspl
 5+PGfpFOsD2AFxrhkhrRmB/W7gOsKXlwnLhDK3PvS34xuMZZif1BqpjF0VldKa7lApI83S3P62N
 R4o5MWWFnVnaVVs20YL7QoYcY+XfbFo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2MSBTYWx0ZWRfX+dkFVkKJmtZz
 wZfplAWafGZhaPbsUNt0NIdifKysrG1D8tkMlq+nXeoH4j7dFGx54+NjvA4x3RyV5flL1j7kLC4
 RtlDbfpwDM4MuYMVVAJPeW7HXamVDcXsC962NHmUD2o4AOLjYOaUpyt+M+1a7WPfREf85lLfs2x
 NKHPMj6L10wQpd5g9KG+jAEtXcgoXJrULXrBaBPZt4AcOLsxd0I3WOVS2f+l5VuONiagdcrtVmB
 9EnjCulgSKdMG0EMnjyX18x0lV257DzMVj0B2Mr/Sjqole21slYNKolHOGEiYARYJSa7yUkg9Bn
 BPzzrwGywYTt2sPotpuhxba5G8Zy3q46Ri4qfgrLe0u6oMIinmXfdnnXJGKGhIiVldVVpc+Qb0P
 +0VzfJ+0W41L4oIhzxpehHQSNOEUGkTyHKcTctbwg6HXaEBj97VMEalbZpFUYkBJWE+xWhZQZw7
 f7VDBzJT60AyGhgJlXA==
X-Proofpoint-ORIG-GUID: jInkt-0Vzlhp8d3gavuUhAMIChyJjuqj
X-Proofpoint-GUID: jInkt-0Vzlhp8d3gavuUhAMIChyJjuqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210161



On 9/21/2026 2:09 PM, Konrad Dybcio wrote:
> On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
>> The Qualcomm PCIe host controller driver added support for parsing the
>> -power-on-us property[1] from each Root Port node and programming it as
>> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
>> this, T_POWER_ON was expected to be programmed correctly in hardware or
>> by the bootloader, but not all targets support this, which can lead to an
>> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
>> behavior.
> This is a good problem description. Does it have observable effects
> that could also be mentioned here, beyond perhaps lspci reporting
> an odd value?
we haven't seen direct problem till now, but we might seen some issue due to
incorrect LTR_L1.2_THRESHOLD value.
>> This series adds the t-power-on-us = <80>; property to the PCIe root
>> port node(s) on the following targets, so the controller programs the
>> correct T_POWER_ON value instead of relying on the (currently incorrect)
>> hardware default:
>>
>> - kodiak
>> - lemans
>> - monaco
>> - hamoa
>> - glymur
>> - talos
>> - sm8750
>> - kaanapali
> Because you said "currently incorrect", it clearly applies to all of
> these platforms. Are other ones that we support in the tree also
> affected?
yes all targets  will be affected, not sure about ipq platforms.
I added mostly active targets which we are currently using, I can extend if
recommended.

- Krishna Chaitanya.
>
> Konrad

