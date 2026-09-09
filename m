Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616553D0AE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953109; cv=none; b=LyOzAcISZWX36r4EdEyQ1nWpaTehEhumAuksHeGXQmmRgM9EFYvzgzMOptdbr7oef6sDoCN71cGriB72dxYBFjZvH/0baqFW8YJi/eNl7rnrLZ+DtiP9aFv+cxr6Mt3Gdk6O6AI1AlKl6Ega8jTd1WGXLxO9owjfJZyAleqeUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953109; c=relaxed/simple;
	bh=Z09T1KtKmhwNLXiWVpHaJc9LPvi/1qHau6NWWjZF04Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bViIgc5Ize1dwah2kGO8gADrP9giK/2V/NHYGxdHVpFNiKTY/tVFB28QUK2dO918Ih4rTzx69NSKckLkG8y8Rq0Rq7eptNsvzvhQT4Yl2/OdbWYpGtS91j+gsHQCClxbGr7B3iQBLw5G10GTpQLu8Qn4hdP3P/BH7lt0GHB3MYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvu35bdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEPsbGi9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvu35bdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEPsbGi9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AqHK31640998
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=; b=kvu35bdvj/2kTlnr
	AmEQcrS2WB3tRsgh3yjrsEXxH4quAHR9QtFzNCeisv/2PaZ9vXe4D51oR3/0PDtD
	TBewfHUy6GzQvW/8aOwW+ABXkzA3TskbuJ9l38r5ZIOeHHtQnKUkzo9vUqFEM0Bp
	KLABwX8LUA7loUJdhZmvJKM5mo38M9qdUo/bUusVf5dYjwRimfR0HnSjaxPlq0bL
	IZWJJSD8cttC/p+J8QPeXpVcZauWndKY6+DSGa/L+9+FXAGxjArMkgpaAWTI47x9
	ozQS8nZmxbiediOZTxetvFW7fxmSk6SKEig811q4vSbRpVMuPgRuhfjfzpNgq+PP
	iKpeDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnr9qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:25:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso57150285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953106; x=1789557906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=FEPsbGi9hGj0d2AATQNExfHwK3/1lgW+hbYYe/4t9OfLK0UVh9d3mG7QpTEWJHssH/
         ZY2vDIkfmNy2kUa41XVCiz0UBytzZVby3DHCYHhe5mkXrmzBRUbaacSih3ya6dGVm5Gq
         HylThGHX8Vg6jxTGGKhTiMlHSIrvl+RbPGKS5FwhxgRbyXZ/FwrI8CpB+dyPNfQHzvwR
         /WIuPjDJe6SwFEdZpR6OVwR7eRK7dZx8vRt1SmMxm2GrDmJ1LB3+KFZgKr9LQ7x82G+7
         9CzZ9j8x1yziptjskqA/3Nim94OzQjRJrEHbPUM/ltLT0KVluvWf3xfxmscqCgOku7q2
         KF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953106; x=1789557906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=Iw3e/a6+tX+7oActpx1CRWuXTa07jbmfJGyn3KXJRg7539Yz4Qgh+Kv7l/ZuouS76C
         sLwrlSVgfI4fNhm9XBCsvSr2qZBlNVw9OP42gkP8cj9NjS79tqvVD7U56zOT773bGaeM
         WBkIn66LCyi6Ud05tohEQuogrP2WEEhbBYxc0nkhAffvVklBdvx0Mlgk7Tfr04TVhH6R
         7BFYLhezjYBck4hroVSOylinE9794BW9dYy/qpttSKZnSAoSKNSEesOlqt6cUC2o7PZs
         wMooq7VB6V38+0ipheVfhmij7HoVqH0IhqmrGGk8mInfJa7Ow1/cnzM+C5GTJ/Fsxuk5
         V1Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzHiYTnPEjiJx+b+wiirmcycVBREA6N6rwJW5Iesj9t8m0UVWXvMYmVFamXqLMUxnGPMwdfGuSiFgJclNk=@vger.kernel.org
X-Gm-Message-State: AFuF++mlV/2hrZzo9LhszZ5vrNhJHXAmdbWmLrnxy0HJxgcfzwHnK3Wi
	BiGEjj9fWOzuysl0nX3IgDijgfTFWMUCMYbW8sLP0eSM4c8c+alQpBpDgDU6taBFulYGeCcO2z1
	VR7eke07TV2sm1TX+qZs0KcNYrB0ZHbGsNSebc+9iV+04U3hRYkfsh7KdR61ZPTXyds0=
X-Gm-Gg: AYBFou07KHKC+hCJSJGS4FeCBsXYhXqRO3SIFTepQ1QI5kgtbYzXc8WR5MPTBwHIBaN
	zQ5XNUT7PHF6SO7j1T3Ehu8G0PCdiXgvr/nlfmmVAUPRcDA/OdrW52cvO4CRAxCgckk6vHwFWI/
	5h+NXNR+VyJLNswMuwhUc9UPPDvFOmrGRJTnu5J29WE2fW2iBm243TX7fsWLcH6ZdZOTn1L1rOL
	74c8fUhis2SF/YmQbC4yd+Ele6wfJ3eJpXLZgoXhyQ0p4ejnS5TCVThlo9wZ0JOSze2aLuA9pze
	TW0SNIlpIyzvEStqS2jQ1Tk5ZEIkx+qdEpetJ5RZ0qfLgRMApszVZy57rS7Mj0rXGzPsPbBV/Lv
	8a1PrOjDi6Fw0gdg4opfS2g==
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560512185a.4.1788953106001;
        Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560508385a.4.1788953105607;
        Wed, 09 Sep 2026 04:25:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm545162766b.33.2026.09.09.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:25:03 -0700 (PDT)
Message-ID: <c15d4fdf-0e78-40e5-aeab-56692623b6ea@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KfJGHlmCb6nkYnJfL0WgNlcRZ1Pl37Gl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX89nZgAqw7oQk
 beqcrY0vgJ5vZnU+SQMm4vodEIwPOpcV+kIql/lcMg99UO87nPjugxW6eIJRmEbeE1aMyJlsyfi
 H9iQEUVEgBK85ncFswEqwqV3WX0skHA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX6lghP1pCy91F
 XqNCs0wNoY1E8r07egxg9GfMOrEsrsDtyyin0q+87JDw0qCX6bnPTAzwozHAI7/6MQio45pgZir
 zoS/PEbMq4ORcH45oVvBXQO0hcL38EXrHOiPU0mUMPeINGyYVYX4d8HkARKZqGb5vkZ4lMFbcfd
 o8c/b7eFttlBA+RWv7jKNyMmPYGwHjQzUBVPP4Tnq7Ca5p9u0mM7r4yR7Wd6PcZvato0Uvc+M/n
 /lJc2vlj46vT97Y+vzVamedFdXIYPytc6WuksF6BODxe25/2Z5nGSgyRUdIBp7H7kR/BxUv67xq
 HQNKjrKCO2XPkZdsqEQCSpiJWrSjVgQ5vUnibwvKErw7i87jUM4DJNIU9bH00dAxByNiMwhmGVX
 VPX4ThkZNDsJq8yArOA3YIkPOvJH+W7YOeCGaC+jOZwwnDhYgmseIXUniuSE/N/tTiq2zMBQg18
 TOlLjIgWB5Jntnvgtng==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa14212 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KfJGHlmCb6nkYnJfL0WgNlcRZ1Pl37Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090127

On 9/8/26 7:47 PM, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
