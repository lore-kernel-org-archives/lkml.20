Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8E3469FA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394158; cv=none; b=KuLioY8kWGTj6yBRl/mHQAKlmoe70xlPSpNZ2No52LWT5SgDNwjM1jkc0gZ7AnyWn4JM6TxYrj0x44Qzj+N2HKWVOBwu6wQCt62gZp4Hlts22cm9zsqSImtZh4fbEL0Zw2azqRt5N7/r/TBGSvRQAV9oJV2PFfCY6J3QkUMGO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394158; c=relaxed/simple;
	bh=Y0GhnFIcFeCVmD0EqeN4T68wKEAHbtSMvc9SaWMPgKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfhQNKCUp7MnkTmpUOH3o7ZFab1l02TstaK1//+6Pv7v4Jlag6OCzH+KYDmxr882z/XGuM68NX0p57Kk54PVA5xb5qkiPfgQHarEpmMFsP/OS7K3VkgqSQE/h8bsT5FtUHXR45lF2SOmzwIQlovnw71xDaGnDXEKmIvUDk4vLN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ScPWYaED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3a6mJvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ScPWYaED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3a6mJvf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jPxg2179776
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4MJT6YeGZibiJc5UkweyuheztzJk0NqPeuQLRZjQJU=; b=ScPWYaEDZXPmjJ10
	lh0BDztgXADdYkXLkFXqlkLUG8izVusL7yibYfS0p3FyX149joZhW2xqurASsQF5
	1ShdgTUVognEBo63ZSYEGxNMorHGXegLhWxrlnI/cNULHM2VtoJNASn3AEVdjj3y
	tCUa0mz8nGEdImafyMAoYnGYxlT6f5T7SUD6w6atYbMDQAD0SrDRzvp5tbdWf5xl
	VeTlkjpOAoYnxzlqGZr0HXqvueK9+9yGifaj9A3btOBEmqHjbtp1Kc+2790XSrHl
	shlc7IdHRN6hUQgX46u4n0SSomXi1y+Yjz0s0zuGFRDlHHYh0gyDtMgk9nrtrzkw
	zdVuzw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hg9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:15:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35d4538fd74so6663544eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394155; x=1792998955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4MJT6YeGZibiJc5UkweyuheztzJk0NqPeuQLRZjQJU=;
        b=e3a6mJvfOpjT988YnfFLHk1ysUL5Jvina5JG+TzDlkpG0dN+x9RuS3oIC7goyW5Ief
         WDQ9xG/VN71tW9Q0pmtV8/IXyUda4hm11u6WkHpUqXvGzDPADim8W2YmNECo0fm4U+IV
         3fmZX1+7538XMjn50Ij98/BzSzPiyRaNnYnpuQLfWtqO4/2rOUbNb4ocEx7lHKfSoDdP
         WdKt4lx6Bu/wHZ3CGKwwcHOGuC4v+1TfPrU9+hnkbEJAlcE0viQtvcSnelUbkHm159ld
         6NpNnP6cSefDf0aNTDJjZC6kmBfBi38KCnpJFgbFYhYONNX8Rl0nuVb+1o/4cnaHlaPE
         Eheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394155; x=1792998955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4MJT6YeGZibiJc5UkweyuheztzJk0NqPeuQLRZjQJU=;
        b=kKcRXdrJt5POWn/68nk2xKK/dco9xe6s9/tDDzMua8NqgDGA3Umx4FyAYQAeowlK8k
         AfbuTSRhIvzfphpRjeVenAx0O+3aTqEaw/CtHYNFYT/kdjf3tQg47fEynpkwaIVELDq6
         KPpl6lYItyK/zg1D03ZnW9G+yOQkPSoyK6kFtd8uW1ffjZKBxpLM0gf0Cb4hr9wEvMJr
         3CRwvOSJBc2xrkGrF421li7XmIlTgPZVceWzHaPVDPwS5M3A4KyKLe5z8KsxgnrBU5Gj
         ZfWyrYjB85fxu10O+wqIIW69JAlfx5wQ26Km2HKevnXQkUSUG7nN6BFxEk9rAmC0c7R+
         jvAw==
X-Forwarded-Encrypted: i=1; AKwUvBw+ZRvgep209fYJz9s5rs5BFJl6OblxSTOdeXslhxOOpIW+zEVwjQAvO61/NSNTT+6KfwnzH1VqQ8HEAN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkD5Cl6/Io2spCKKZnhpDFA7cmkLexNn+tNPcBR9NKvdVm2W2q
	e8D219hrfADfMXLlcTkRLEISvRUIAWUTM5sFQWULSV76OdZ+TV6y4OopJvatHUOF52d6zV1739m
	GxLPmmlSlim2XHpXx6KZ0C26KMAFXcYuuIBCyoB+pQuQ4oGufaKLb3Nv1/vPX2TO9TOw=
X-Gm-Gg: AYBFou1fZkmnJjn58M5D2djl4Lx5rwDKfb/ptIT9F0EcKWP66zzIBBlPUs3gzivKTca
	ps/Y6FLxf6anUoTYnKLTcTQLH3ZfcznhIGEWcjF9423bRECK4M4oahWOfCyw1MrXFlR6SLKMboX
	iz8nCCkhDxPpfGzGlLyiCJ+zSbhjM764SaTlnDyhpdV9plu3WauOU8Fl7OAmbA4Hv9UyyVV4PlP
	4VA01JSkKVQkbqoBZH4kbielGV870q0lqt/eFMprPKUCDzVbMM8BoITShxI/dKu/uE1vPAdhoci
	T9JwAE+HnMBRBdtJuFykKPxDq3kEtXRPYeL7dR3gRtVfyFC0ND2keRhV3Ye0Gn0PYB9cZnk5tUK
	Kz8V7GLeAdf5/EKo2fldaHzx3lbUvCQ==
X-Received: by 2002:a05:7301:b13:b0:357:e9:dcea with SMTP id 5a478bee46e88-361a1863976mr9222057eec.15.1792394154516;
        Mon, 19 Oct 2026 00:15:54 -0700 (PDT)
X-Received: by 2002:a05:7301:b13:b0:357:e9:dcea with SMTP id 5a478bee46e88-361a1863976mr9222017eec.15.1792394153891;
        Mon, 19 Oct 2026 00:15:53 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm49525855eec.28.2026.10.19.00.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:15:53 -0700 (PDT)
Message-ID: <188ee6c7-533d-46ec-8c42-1fbefba54f06@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:45:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] phy/media: Add generic MIPI C-PHY support to
 CSI-2 stack
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <pFAaFSKH8thStYg6_Ew1gWdIvj5lbNBF36QKdamV1cU1Nc73wEZfM_KdQWL2NmB5fvaUpMPen7qMOzjHZ9ROIQ==@protonmail.internalid>
 <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
 <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PqaDk1zJHBPbDBK7C6yp88yUSQFE1miD
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5c3ab cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9L-LwuC9zpQyaOcaYhsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOCBTYWx0ZWRfXxDcAA8QjiQQi
 /+kXaMDA8dn3PzbJVoJSlobe8f23g33T/bU5WPqwUK8pO+Jj0N0hbhFm6EJxc9DG8L/CgTwpYuZ
 YKqgDw02KZF0ALY1arxqPWb/pebFFAc=
X-Proofpoint-GUID: PqaDk1zJHBPbDBK7C6yp88yUSQFE1miD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOCBTYWx0ZWRfXzbx3yjHcZ7q5
 RwweubdFdC3LcxVQXVBSnXlx87lHC2uGOquS1xIqkEybSVzVJa7rvwjhTo/tjMx7R6pz6m0TTdE
 a8ONEgl0w7ww5g4N0SybT3zR2g9LgtviBsJWgMzeRus6E58F8BthhI1HBFUsTqkniu5wvKEcozL
 zYOWWcbwWKhOPkKufXBInYDk9s3u9wRU6P2r02ccsBbPdGBY3T8rvjL0zubPIWFKhggL58WJ5jb
 vqt4Tf8JSuEqIfctInzNyGNvmkx8I9vGYDugRPbPqf0vxWuzIP4wVXt52/fkeEdIlyy70yZOmcg
 Qg2zpjT3pIfNJ4K2KNbm4UWOYCofhj6JHxgp6EJgpJWQhd/AZZU27vpZ9crxxx7G8Iqxf7uQ+k/
 uvEybbU42w8v7nASnMmioJN7KKlr6bUjdOoFIFxHfgaF2aGw9VP6vMVm4HKWyfnfkU6m7NFNvx2
 FAGm9XgVAgQNmQ5Ntnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190028



On 18-10-2026 05:09, Bryan O'Donoghue wrote:
>>   drivers/media/platform/qcom/camss/camss.c          |   8 +-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 159 +++++++++++++++++----
> 
> So on thing I notice about this series and like is that there's a small change to the existing 3ph-dphy.c
> 
> - Since it supports 3ph-cphy the file should be renamed
>   3ph-cphy-dphy.c (or something)
I agree with the direction here. Keeping the 3-phase CPHY and DPHY support
in a single driver looks like the right model.

> - I like the progressive nature of he changes in this series
>   as structurally the right way to add stuff in. Small digestable
>   commits
> - I think the missing piece here is data_lanes[] and lane_polarities[]
>   per the other series from Qcom
> - Another thing is the other series from Anusha has
>   a more advanced mipi_ops data-structure for CPHY.
> 
> Basically I like the approach taken in this series for a smaller change to the phy-qcom-mipi-csi2-3ph-dphy.c file.
> 
> I'd like the best of both series - I think there is alot to resolve on lanes, data-lanes and lane-polarities in the other series and looking at this series, it seems to me we don't need a separate phy-qcom-mipi-csi2-3ph-cphy.c, I think Konrad observed in George's series that really the file deals with 3-phase PHYs and that seems true enough.
> 
> Please work out between yourself and Anusha what's next.
> 
> If possible I would prefer to contain 3ph CPHY and DPHY to one file as is done here - at the same time the definition of CPHY ops and lane mappings is closer to the spec in the other series.
> 
> I think either you should take Anusha's structs and lane definitions or Anusha should take your approach to minimal change to the phy-qcom-mipi-csi2-3ph-dphy.c renaming it.
> One of you needs to pick up the patches from the other one.
> 
I can pick up the CPHY ops/lane mapping pieces from Anusha's series and
post the combined common series. Anusha, if you prefer to carry it instead,
please feel free to take this series and fold in your CPHY ops/lane mapping
changes.

The split I suggest is:

- Combined common series: driver rename + generic 3ph CPHY support + CPHY ops/lane mapping.
- Follow-up from Anusha: Lemans/Monaco-specific lane/register programming.
- Follow-up from George: Hamoa support on top of the common CPHY support.

-- 
Regards,
Nihal Kumar Gupta

