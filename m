Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B837C903
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740675; cv=none; b=VjJ0atu9gH0T2lzDjGlLnZ2fwNHMDNc83ht2Fv/5ixHhs3jRANH7IFMpqfwxDkAoHgbzM8vD/DAGgig0VJejanssGbMyvGkmYvbO2eGfzok3IFDP46IUyMO4ZzDBJrxg1cituHMKem9DPfwoT8yIZ7pcL99851pUkDE4iwW2f2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740675; c=relaxed/simple;
	bh=HCnsPH9Um0ZG08qyr7R6UQ8BhsID58x7zuxQpv0mkBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhJnH91J6ZdJHaKdO/EtQRXtL3m9BSX+TAI3ZUghKNLDP/h0MJosrAzK6hG3bQ4DPABSkiZXtBeWEit1W5havJsmBSSypO9yPYlLkImeRYwFbWrMDESUruj+06z5WMFbx2xVRtPQfNvLW1h4QYipokogA7YVYQdQ2N5KVC0oVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8vjvI+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXGPQwci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8vjvI+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXGPQwci"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOXQE745828
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=; b=h8vjvI+hCtyQSqIt
	/BpIsO/apRrzPDQlk6taMfJvhv0e+2LTtyQhJ2dBpADJjIxdbD0y/GuFJS0LrbW+
	FoKJfsV8X8EILUyERuC0/Wqd0rXAkdiWUofD8Rgv+3zYr9hj/VJT9JmlOVmCRFF3
	fkqI3oD5BfttQK1PDQdsru8ypfBgGAxfcgdoeWhpkmZJkqf28mjDYMcnxGX95TEu
	GfsocAtH9MBGSn0paSjoy+S879PeC+TssMZCa0r7NBGCQzskbdKPAB18/1RVP3gJ
	WBCJeTapQHNQooXcz/DnzfnEHw4jtM+OE/ISaTF5gcysKgK2BtIntePvjjWO+GBI
	U/i6dA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2391888-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:11:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98055f91346so530956241.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740669; x=1790345469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=;
        b=gXGPQwciIcPsW9G/LL0nSoWntBsDMouKFB6sfLJ+CDXMc26WRqxMyIdBu6mAGEAfPk
         /qQpE48JWz9G1j80w6I40Pa2vmUqctrbwa1Xy1S+fJV52skdq/5MqqNwu9ipWr3/Uzx/
         iUKmAJpQJ33myBFcQjKG9HqBTY37m1+6fuPiXOlzXXc5cJ42xyDQvUHsslknNYKOrRhI
         rbybCwUqaToUUAZRUCACvk3bQm1k/DPT6+C4q4TIHBMme5DTuQGxu++Sys6NkZk1ugRY
         eWQoZjD7Eb6qKvOndsodwaHbef5RYNJOdDwrwF8OGpYhwfL6CJCSG0Qdl3aHuldRjsTR
         gReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740669; x=1790345469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=;
        b=nEo1pLdSwBuPIP6HgObRvGyzbFF/sN++Ar3KmXQjdm7TglE1cuE4aOBfn9qgZsOTo+
         I+JU2/U4XuEWzf5R1aRq1xJ4BNUcNtUKYe7xEoMLvDg7ihytj/anlYtRy1dZ63KIPEqZ
         8UTUhK+SaTeA3P7KFE2abSn/IEl5ibuEjBMj5JB1uTlUjtt/Q+LVP/5ZHiUt7Tw+y/dL
         Wv140amGXFkMWotNawXjKqQAilGzeXAboJQFT9iMRYhtxWCs5tZJ1/x0AZOn1BKbfnUu
         WnuV0pZ1hrYDULBcoAnNA0PbfxeINmL1XUaBrPBGjV4VPeK09725AmfhUyrd8X35WES4
         c8Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwiBwYeiU/BJhq0/C875oaCTFDp9Qt4v/dldEBXktREzbt/c+qV6tf1pHC68e7VY16jRCHggho/EBIOpSU=@vger.kernel.org
X-Gm-Message-State: AFuF++m1Po78uyXPuDovC6YuknGJT/cehIlydu7Apiw5rdV6+PDsbfHT
	EC0ZiG0sPBJ/xeL5YfxJmHKV4rvQVFG2MqAMQxsb4QkOV0CuiwAIS7BGi1MDo90NUqIH+TofnOV
	r8Dc06NZ2qsu/NzccWPb/ONdS/XcUTCfCk/ZpppsKi6Mu+l/w9Zk455yrpMKsWWqRzOQ=
X-Gm-Gg: AYBFou0Fjo6NiWIvHk/9IRIhIS1MkPwiiapYRu0B/yEV8jnEkpoEmPEInXnefpd0XzZ
	POnGSNi4d/bqwNwuZPuCx3XFR0KfAyivlDhfrVodwWAhYiAd9y/u2s6lcvjUxEiVCTInB1Am7VP
	Z2rnnzCtNLddLFt46WROmcoirxmK6q/D49iWhoovQe8JhfsCaTlVgFM05cuME0J82wBVVrBkqUr
	9EtWkmYZ7qwIUC5xRqOKF9WF9DGUjNn6HORB5XVO6ja0zB6fDUuF5hgrMYvGSuZVxtH53fBa0ad
	dg63FDjkvUv0E/BvJhrnxMgR7IaTGAMV2ztQBgFuCP6M2LE1b63RWElTzxwdHEgZbE92jJq8ynK
	flH05u9XUEFZYlU5rRFAKzl/rR41Y/VvA8GuOspBMSnTwmniKQImTul2FjoiuxNU=
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr1053363137.16.1789740668685;
        Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr1053328137.16.1789740668303;
        Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d1cca3sm55062285e9.11.2026.09.18.07.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:11:06 -0700 (PDT)
Message-ID: <b01f8d1e-353a-46d4-b52b-0f16ff63eaaf@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:11:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom,pm8775-mbg-tm: Document
 PMAU0102
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfXwKjXQgYNf3Cu
 Jv5tggFzzeUlg1X6rdAIASe2UAcsCvK67uoUqXXLNu42X8xNHRHck9SRbH7DpatJjW6W/zIqnEL
 oa07TfSdrK2wd8OcVWi9Cw7gty+pgbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX4obytvKJ5wbD
 kbf8iRpwLm8wRVlJCrHyWghyhCuk3aaWDTSEw+p0TRk9xWeqbQJp1Lj+zsOHj18WTGhag5xv6HR
 N2VWOHyLuKdmQFoo8xJEjA4HQekOcIMPIuUmSUfgm9CvxSF+jbEOcWQQwDmlf17kx4vmbckmiSk
 b5YvjQ8b5r7/eFSd3OsmfsYi5Kff9eh424QVQEvdBoNPQoZbImoldzirfGVJ3O62v1bkJe42wlg
 Admua0Lnlo4N0HMDS1q1Y5gn1Vd+TIckrM36FoaZKeIam8tcubk0luID01eID2AofaIPYGHprrZ
 CX2KuYNhC1rxWCzhbc87H7G6FrtKY9ru9VWDUHZGz55fGRI6ePpNpJ8z6cioz7bQmgdDLkralqF
 VbckzpI33HcGU2gJSN5u+qKeEPzlMaQv7qi8i4SxY63Y4htBgCUAQ4XqfywF/SnAEOZd/mH0QMK
 al/A6Cwob78IZ1S05eA==
X-Proofpoint-ORIG-GUID: 3CNSg2h3ORI41IUwjGBuRkBkC0WgP9Zg
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad4680 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4cE7jvQ2eA2NNYLkAPgA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 3CNSg2h3ORI41IUwjGBuRkBkC0WgP9Zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180201

On 8/30/26 12:10, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Document MBG temperature monitor on PMAU0102 which is programming-model
> compatible with the one on PM8775.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Applied, thanks

