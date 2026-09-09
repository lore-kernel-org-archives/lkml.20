Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD8559CB7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957500; cv=none; b=BL3JFh7ZFWetRHz35JdAiv7rtumyRI5O/nHdRalQcfF8y1ksWcRFevtFzZOfKdiBHxkmQzoqWTcgv3YiLahCcQsaBNb2axQ7ek4drGSwjcnPpxLPpkB3QeA0jgFXh9xxqte9CLINc8qciYPN9fKENxzshQcQjgH2Xp3iG/A1yq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957500; c=relaxed/simple;
	bh=BKzogTZn+EJ5XpNLtcpAdHyL4/z3Wux8oU3vlZWahI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsAn/nvoyjjZcDxkVjk+1E9KTgNN532SFlsSrVeCDRFBmYR9hSCnaYUpPnZfAlxyRxuN28aIfxFi6kwUZTUD/TWCfjYcHvpzOog8DHcee12KcMvf5SfGG6xzF/8r24RJkkk4nR3RvE13pDvYRPd0f6t4Lw0cjTFMMdLqOIioIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXoTg1Rz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWqE+hS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXoTg1Rz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWqE+hS6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCxTN3053134
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7whHKW8iAgsbvfjm2Z5LvT4KF4Z64VMEUZ/xaZ93QCM=; b=LXoTg1RzaUTu3qXs
	f1hHeZ9G4NEQQUs8BC63NZSEkOZT6ayPzxcEs2GeD0ZjBDhf0QhodNxp6Y+gnetD
	o21nIrGYJZOoDfD5LUCIhe7SOnkJWylgWoYFPEI6erpq/RI14LEuNRXkgoNnj7Su
	zRrzFQgBqOEZwAXPNY98G9crsYlgkpyCAgS7jsk9hPLPptZt6xFnxzYcqBjDrGva
	/CxJ5Q1pSzmKqIdSPVmjR0ynehrqZnNOC1v4la+kIdp27JKVJXJldspC2s0S8G3v
	5kY3N0AHLlPFvBd7CXr4fmlVRXktofvrbkBFVUUjmiJ+nySGU/VIw2iJbw7FzJ64
	OrKvxg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk79202y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:38:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77969cb40dcso75776137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957497; x=1789562297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7whHKW8iAgsbvfjm2Z5LvT4KF4Z64VMEUZ/xaZ93QCM=;
        b=IWqE+hS6cCV0guJnsxNl2O+ze/gOkGSwfpf5u3yFAnfOU/j5KaOKHuX/bpeiT+KE5J
         c0zg6njjrHEzZOr2uLB9vV6gUmenHm4BRodddnXVNb0KborGDu61pIxdk0vClY509DYV
         J9vAqHBse3zgVCxLi7E5M61JwIoqt/3AlSPZa7EddS4JLTkjWh2fNNQeHqyKDpe11BK2
         R6yq3jF+onbdsi53rVzNIVUbuxtd6CZm8d4BAXchvq7Vtb87dGnLjkLz2Ehmav+R2GaF
         pbMSKq0PbJ0AFSV9fQqlya2oRnZnaHbpaO9L1nWfpt4RkDqPAbBshezAgf7rM8EqJpVD
         jtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957497; x=1789562297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7whHKW8iAgsbvfjm2Z5LvT4KF4Z64VMEUZ/xaZ93QCM=;
        b=JMLcs2NOJGKcWwXdLOIVuCRMUwqAStYOGAJiHbhxpry9Ym/fu8gI7bYzcm8+1pqJ2F
         vEqqoxSgTDv3MOJJfyctIy7dal+UdgQAGdxKmKeGfJQ5uREkxymAivsPKRVcA7gQmmji
         kWYtsHbw+5NkAJ2YNmdsaaSpQrNlV07WDUpD1HSdxAuW3uXgjYOz4pvKPZ/MqZGk4Hoz
         DJaPFedNqySgdFu1FDuNGHQ7Z7/7dswICQPaX96CftYZ8j0kBC85yYLoc+hmgcIYv6ZS
         /5/WMnx8LiAttNZDn/Y7ouUUFzL/kNyzV75jA4fsLqVRR5SqDIFn9zIWJjifqQRiniBR
         qnYw==
X-Forwarded-Encrypted: i=1; AKwUvBzb1Jw363fYEiPC3/5D7lGl+gDDJ6yeVnX93VIxgpEn0IeFxxlES7rmLHgr74TuGP3X+CMUtJ3C77E5sr8=@vger.kernel.org
X-Gm-Message-State: AFuF++l5QhRt94LZslki7zn1JMnpVva18tAYboKP2ExLLZ8z4DGQRcsT
	KHzSevhk967By3jAUMAvzH8dTHMwqHics8Cln0O1c7EW+BRnFr5tNB6Z5NIEah1+2SOu05XZH+M
	PmjRy80ZvocmvXiZGZZWqUz8Z8u/PDlAiYqSocEE2qP9mv0A6k0ANltHnBhOSf4qphd8=
X-Gm-Gg: AYBFou1kq4N6Em5/wq3SjizfvDshP1DyZl5FYA8r/g/mN/m8rgy399gBPZgQQdakQrc
	mz7V/orzO+Cjmn9MTIIfjvhLmrYrVFr79Mb3drsqg4SJe0/ckQlvw2sHP1LOMgP2oBbf8xMSxH5
	SML1XQDznvNR9B6H/WsmCPq8HMfs1gvOA1TVEiUzJSqYADBQjFN/rj9Db9Gs0JNk3GJH0AskeFn
	UFJTmxSS8KoU4LN8Q8PxUKmWAjboyd6bZJDzBhlJz7n+EfMjixf+KFp0hiD2mAZJeCtyxX7r/Os
	B66KXl30tKA2Twt8Cz/Ixlu5LBpLzFLugmDuR/OByE6pXigLL3uF4eIBydSf3WoL3njVEVBP6oR
	sq5JduoGUAWQGk6/HMxwB7A==
X-Received: by 2002:a05:6102:91b:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a6082a131mr3898531137.0.1788957496696;
        Wed, 09 Sep 2026 05:38:16 -0700 (PDT)
X-Received: by 2002:a05:6102:91b:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a6082a131mr3898514137.0.1788957496296;
        Wed, 09 Sep 2026 05:38:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98641f38csm1237305a12.13.2026.09.09.05.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:38:15 -0700 (PDT)
Message-ID: <85ea66bd-65f0-4e05-9928-3cc2e23f02ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:38:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa15339 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SpA6wshyjLPcRYPzmHsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfXwAs2ZOEkc+AI
 LdfR5XnbevfemdEA+SgB2xwQtAx6fUwK78exgPh/SRUAIJCnjvueElDqfhTDme3qRUgSDF5P/5E
 JkVtqNwfABKAzI5oY9jFxy+blI1NeR16Two89QA2FlHYZE7wotTLydU2ssWEIyxE2Xu59EraWTh
 fWT00H4AMkQ8NG7mHgIgQiR2uxfDCnWP5gmv3MlP+LyT2ul/ro13VQtLL9scTPac773B/GH5hPZ
 miqkTmsH7OWYuJdCf1usy304jLPvFwZF0WYLgNnZqXQlaRUuLGCObLnM2OtJnbuDzLW3U9bQItF
 w5Z0vcLLDzszZsWI6se545CQfwi2ccEsvpztpcLgzSUIqacFg1QftUWaUxngokm+k7jjLgQUsoe
 Ua+kuKLGLzBuZMGmeZnwLckYxzJDYPSH4z10LJbz3pmPm88B0LSbMi/lQ7y0ldVgEUlIoD1uSkM
 1BcQXfQZIU7SQPB/EMA==
X-Proofpoint-ORIG-GUID: 3VIE6jxIULffMVmQu170zHNraXcWkzVq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX1SrhPy1TAVvJ
 9PyJMqMOgBi9gaYiarI1eEWP9ewUfVGl6U7dtkxECZQL1uB37wIGc/GUmVpdpR2LPpPMkb1syO7
 WBM/CdL/uIdLF+Btc+8EDMsLdikyPVA=
X-Proofpoint-GUID: 3VIE6jxIULffMVmQu170zHNraXcWkzVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
> During system shutdown/reboot, power/clocks to the PCIe controller get
> removed regardless of link state. If the link is still up when that
> happens, it can trigger SMMU or NoC errors.
> 
> This series adds a shutdown() callback to the Qualcomm PCIe host driver
> that forces the link into L2/D3cold before shutdown proceeds, reusing
> the existing suspend_noirq() path.
> 
> Patch 1 fixes pci_host_common_d3cold_possible()'s underlying bus walk,
> which aborts as soon as it finds a device outside D3hot and can
> therefore miss a later PME-capable device -- something that becomes
> common once patch 3 starts forcing D3cold entry during shutdown while
> endpoints may still be in D0.
> 
> Patch 2 adds a force parameter to  dw_pcie_suspend_noirq() so that callers can
> set to make dw_pcie_suspend_noirq() force L2 entry during shutdown/
> reboot, skipping the D3cold capability check that can otherwise leave
> the link up if any endpoint hasn't suspended yet.
> 
> Patch 3 adds qcom_pcie_shutdown() and wires it up as .shutdown.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v6:
> - remove return 0 in d3cold_possible() (konrad)

I re-read it once again and I'm not sure my comment was right..

Konrad
