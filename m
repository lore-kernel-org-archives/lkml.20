Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1646AEFA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981494; cv=none; b=buXCEgte0ML5fo3I1VJb7me9QOz5E0CwDyOwTGUlpExwkHVfKg1i17hwuyuSpGU5X0CGrt6w0Z3lF6FeTvPLiSbLvVElFbguJ+BR89Fr6Wyv3seGAqaA25XYwoWSnI5oc/6jdYsYQniecEnW3uBmybdXpCS7tQqlp4Frv71Wxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981494; c=relaxed/simple;
	bh=jEBYADh6Pm/QgGCjfLduaVA9Ni9fajnnIW9LNWroBjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2df7FIDvi9xy8WcI9+LTeHtcopQ3PvqMhdycI/FMA9AdnqASYce+sio0sfBVlWPvkSiOnE0d9b1Oapiv/rEWyg5RDomTaFQQmafrB49hJdhPmBhaQA2DBH86Xt9ONYqyJcjTSoq6U7NY8abL/xxrQ9O7o0ebh3nGzVYtU7XiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkPtMe/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQQLsGhJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkPtMe/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQQLsGhJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A2kY467388
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUUrFoUQtlt0KsTR6YssW33mXsm3wZKqvH/mh1SHp2M=; b=XkPtMe/d/BiFeryy
	Il9alrrYeU2wH2poyyiJrM1J6Km/mExrhoJgepvenBnFyjgzLdjtyPHH3af1DdR0
	woqDvDDxIs3VC+M4RiCXdrlBcSeggXfDU4aBEw2RVlV+/YrXp9NLe6N8jUInoPXO
	nIOxW+BKOe32boAdTgd7wWpEcqddsEUeHSbLTj5wn1I372XCXf+JoxeWcgAAUjXg
	W3ulbYIBYSp4ymoGzri2i4Z5iMxF9isRJoISg54oN0/1GSIhAphxOYavaqpndDR3
	qQ8OdUul5S3pkHoLcVjrMtUy33rNzPurjuaqVNKyzZLiYHnWWKVGEl1f8CzhSyLi
	JrZ3aw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9tkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:04:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530d04ab694so5342991cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789981491; x=1790586291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUUrFoUQtlt0KsTR6YssW33mXsm3wZKqvH/mh1SHp2M=;
        b=OQQLsGhJpBZpbc47+2aHj1S475Tgy4iJKULjTZnqTEchz/reGsi1PrBU0lWEf1/cMR
         Nr6Yi6tyGlH1x0FjuEVrlk9Y24c1uoDxGA953O/T2XwHrUfDfxXMcdmQPfflOdM1tkC5
         W7zZfuDQwtebVC8ZIJc0rEBAFbg5fGC2PDHNBFirGksryKWKt4yvgatvrXaeCq9LC+o/
         V9Lf7W8eKVk2dNBSSHAjOL4qJOY9u+AXQ/5WhRwD3RLPH72HrKHh15rvPdoPDxlSEwkX
         k5E2/a27dnYsrZ0rysO5ME2Y4QpfR8sNNPnJrQzwOMHnFEOHjLNLK4inwQpICpPc4oi0
         CDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981491; x=1790586291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUUrFoUQtlt0KsTR6YssW33mXsm3wZKqvH/mh1SHp2M=;
        b=yXLhuPfrPP+igBNl5gTuhs1Qh2U4FoDaLOk5zmLONakgtWgconVaV6fxunyIvt+BOs
         47RYQCSiprMavmtUlqg0ARfcn9kxllvwskme7/ytafXX7gAumt0y0IU6ClU5OOjws0/M
         dxJ/SDe4ezXREUq9o/6czWHFYHCZD2HkF3nZzGzCUSHKK1F6wYtFL2zTDPdoVy/9sX5J
         cUgEF+hal0s5jWDGwxrrIYdVB/WqUoX/OtksKrX7sgzYqtTRHNO6ghCsBBaTazP1RKVH
         /+bwLlZxuL+YL4k4+qKXCE1df/vjQHndzqmc0lWwZN5dkBVEEDMM10EHOMJg+nQ+RmJB
         8Aig==
X-Forwarded-Encrypted: i=1; AKwUvBztjrB4oHhL1g9mm6RhpS54JENlctSgF7yuZqWWKV/JDzWdEYz71MWV6kCFw+elURSmPrhFxWCEIvGYvRk=@vger.kernel.org
X-Gm-Message-State: AFuF++lLw+zGc+WTs73lKhkDtPh/Felt9IJAWlDO2UJxjkv1RjN7/9Jp
	scGVbiFwVliVcatlqyhcV1nAvGicYGZw7J/rXxVHNb8q6QB9EGCqM6TPWC2Rd7AocOH5cZ/aSFh
	S2Sk6gznN4R209X6Q71PoYHxFeru4IiQ2DDys2TFlvFRVfweCOawCBmdESkMfTxesohI=
X-Gm-Gg: AYBFou2TEXWcQqZJyE5DuhINUYYKYDM4oOv9TIWp9u+ildWGauKjPx8fvU2QoIT/JEF
	fKjd7NfTKsrf9elQJ0pqG1plh2/MpM8yV+udgxiELEk8qP2y+hvJpAyJ0/pEAVjKcp0WROvDl2g
	FZInhUtNbEn5V6l+YgfCSp5WiJQepYcosaR25NzBDqdrn6G9Ya+xzfXOcCb4U41j5c+kz1eK+2D
	fjYDBp9EAnsPX09NoOdbC8E6j9TfNSP3ZEQhw7nxgJkiDqIL/x9I8pLyEobY8iYVmcwdisc0jBA
	jHyAUDdhuGjZzwslwQ8n/HMhCSoyuL5fX6uOyHc+BaYhqjJ8nH3GsWg1EoKmjNCOY08BwFKf7OB
	ByOaSZQ19cv/OdULq+/D7oA==
X-Received: by 2002:a05:6214:43c9:b0:910:2f02:8c4a with SMTP id 6a1803df08f44-9129152c8fbmr111423346d6.0.1789981490915;
        Mon, 21 Sep 2026 02:04:50 -0700 (PDT)
X-Received: by 2002:a05:6214:43c9:b0:910:2f02:8c4a with SMTP id 6a1803df08f44-9129152c8fbmr111422786d6.0.1789981490390;
        Mon, 21 Sep 2026 02:04:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eab75sm273091266b.14.2026.09.21.02.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:04:49 -0700 (PDT)
Message-ID: <4fdb234f-4c8a-4719-ae11-96da45d1fdb4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix runtime PM imbalance in
 iris_enable_power_domains()
To: Wentao Liang <vulab@iscas.ac.cn>, abhinav.kumar@linux.dev
Cc: bod@kernel.org, dikshita.agarwal@oss.qualcomm.com, hverkuil@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        stefan.schmidt@linaro.org, vikash.garodia@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20260917095741.2145688-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917095741.2145688-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMCBTYWx0ZWRfX9MIelbpkOMnv
 nAvFyqRqwVMhh+GCV8enOb9pXwpws4wV+2MdZkaMyjh089jeou2iKa0sSE25greLcsrE8chL5RG
 MhccP0/da21n93k2H2nWGMrV5pFp0fhYlAiE2djCfa2CnSmAoiFIlkY72hKVRvpt7vzhK+iNZb4
 0HQ26uLpLGemyFvmDyVJRPfuhPKlIUGOSjBxABEDJ1Q9IoE0zAg8g0rKs2Q07w8HJw9Njh8IWlf
 0ILhmfxHDYgP78ICSFksxY4AUVeIY9Bf2gPZH2qjg0A68JAq6AbpJ46OXmYQ007iTLtUoKTZD15
 m5BxjUNUKF+AiLjJmJ87OK1p/MCfMCUKgZUKUvtB59S2OD0M0kWfSs5FTa9nNn8eqfeA3HhY3MX
 Fm+20BHgsx7TQrBKBCLcNeg/Tc9ILhSNTWPe/8SE8KfFPSnX5FZnFtC4ITYZBd2PIgDF5RLuNP0
 L8t3TsvG0dXIJcOO/Yg==
X-Proofpoint-GUID: F4wblnDqQAPdKBDNNYlNUSy-EhcQfg-K
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0f333 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=JcJ8pZWeGoTqregMEaQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: F4wblnDqQAPdKBDNNYlNUSy-EhcQfg-K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMCBTYWx0ZWRfX+tSeGTKuZvzX
 +hFoTjDrHLvywOw7ZoMKdoCyloMLFPVwpgx4fOx9OgTPWZZR8veXVbOk2rwjE5Gpc8vJyeYchH7
 F3xIbbC72+agbluPD4jwg8mGHVZ8glY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210130

On 9/17/26 11:57 AM, Wentao Liang wrote:
> pm_runtime_get_sync() leaves the runtime PM usage count of pd_dev
> incremented even when resuming the device fails, and
> iris_enable_power_domains() returns immediately in that case, so
> the reference is never dropped.
> 
> Roll the usage count back with pm_runtime_put_noidle() on the error
> path.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---

Already fixed in:

f87d7eda07fc ("media: qcom: iris: fix runtime PM reference leaks")

Konrad
