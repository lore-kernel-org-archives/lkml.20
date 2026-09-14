Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8844213B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388735; cv=none; b=TjrXfpLk10mDlWplYVcOxHgRZyaA+Nyb/uPp0F1m9wunLXK00sUzvhwLmpYAKzlyN1w7C+oVXjEkOSn042Y09x6B5mlD2vdZ9y++xEOoSK3wovsRIZDNn4A3zKNkMBHUVKr74TvAeYfenRoB+2AbOA0rBFi1uEMIibDY+I0oCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388735; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAWyIgItvQxusv0d6gc5E1XWQd0k7M6vwngzUWYMNOsaCPQxEM/N0TvUXMO+fgS7AqjyLZV9l65iLFoLB4cecFHwc356Br1tmLD80abtC7xb/lvSImdE0LsLKP71ilkAwg2eK8KmNpacfKhfRbhMHTTr/oEPo4SUIlTUEpis74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oolOfKaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vl3gqKcE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oolOfKaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl3gqKcE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMit4032527
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=oolOfKaKlcUAYeCm
	L+Ihy/VUWmCMVT3utmGA36lPUi0IFOMhEyzwKHkgE5kGHYy5Q6yKxGtfUPd1HJVY
	1aaSJObzucVeeXchPqXK79dSab3OAcKXy15nxR92aiYSIKEAlay07hH3c6jcNYYb
	V67C3cpiX43ntkI5KkNG+qeE1nuhGkLPmLSU9cw++yDKNrWZlimWvYHHRpA5/bRW
	QDbbrwP9GaiSP6zqVucPSZEb71zgs30RLokLAIjtx0JAbmjFxOqWbMZLFnrAIEJX
	P6ByqK/irNe3Dqwn7PUerZqmaw8m6seiU9/YvnNX9VnnMoK1nTHiw/9KuZTnv4fi
	z5MecQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8h1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56682e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388732; x=1789993532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Vl3gqKcEL4lXVXPJZlzdhtEQuNjSnJ4hg8Sbt/jdGgZB/j0w/EhAZbMiVMZoTbe7SM
         pF+Sf+gmXw6v399kfy6yWr7D2OTeqCfJOxb8Bvfi6otanp8WZ5+zlnXXb1ZaHN1q/Nvj
         aZdAqmrn7hYMnugsI5rNyw380wOZ0M6NJbCZVSW7ZPK1EdWhnDf58z/BzZHBLgRfQD8j
         8OArCYy7G5l/njEd6U6O4sD2VL1GRkPzZfa0I/PSufyQrywaHEMgPxEu2ma8FvqWGMUt
         cVAGh1X94/+2PoxKss+WmaLvF3AhYlCQolBxVddsKZnVdDE5FhJzYAIF8yqsTBsyfekh
         rG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388732; x=1789993532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=grpeSVeChZLXDu4i9PxFt6xJi8oQUcl0s8GsqzhIMFZhp3EtHsm/NTH36CZa8Ja58l
         H0c9VM+w8YuAwO8C9ry521t9mMSsV23/6U4GFwHgUJMJ7MY1z0MNCSMeERrwuzIb3h74
         Ntr5vWGYPSQxQUvM7N9UmS/q7nZkoxyLOuoDkss9SgdPK8LPNiq4tMXXQxa/DkOvRElb
         E/muCtl8gFvS+n8deRUjpRM22Tvu8W2BaMHCc5wP8LMaD2UFbhCMTcdw5D1LdjB0tUF4
         BlKUTG50ZTI7MgGKLfyQNIPfo/esjxO3i+eiAcpmJycZQHGgsBdTiPhWOX+/QzDP2zBk
         P2Bg==
X-Forwarded-Encrypted: i=1; AKwUvBy0waepYPhK2U4Hlo97nTECd+ywZQBKP5xpKVZmheTAes1J19koHlrnOYvR7UaT7p7xfVDpx3cEiLuhnVs=@vger.kernel.org
X-Gm-Message-State: AFuF++mW6TGKQbDkQP9KIacJ5OFI71jzPICChve6BGBfM4u/CBqEw8wI
	KlwfhjsIYxH9pKhwPMpmJkrO6ta9uAIFKw1G4hSOt99d9vn7vFy/AQ603SoE3xdU+OqfSTO9jVG
	z0/N9Jlx0HOHSadxBCrYmPDHQ3pJmHzqDEEKEarnh/puz3jcrYCvylre9OR3Gav6zNGY=
X-Gm-Gg: AYBFou3XrEaI5w5jDM5epAkYEAOXA7hcRj2DkmHVuUZ5XSJX3CZuld/8bsp0f8HSjeZ
	NZ2IJwM66SGrMOt96ikQVEM4RPddA7XqyMDGHY7H81b5nT0wHgKk+VOshX26XHdD2Aqh1YO4lgE
	7yYIGbcr0luZSzLlBe1mWvkFNjh+nVKYSHehLwpSBlUSPZQ2m24NTB13nlaTdUMdRMTQ+d8CBs1
	MNCKVqsYSppGZb9SKd5txigLq1Bey7SdekmUGdxhnVjTI8v7ZcUuvKPLfCJDJR77HmQGsjpwZVU
	QaRGhCpuom1+KOGmWMQWosGcHQf4xRBp5dTT+GZIDxNq9zYrFC0/QsDQoyNnLYkD7yhO9jqmzWF
	wUq2YVdfrkmzfQb2N/0EM8w==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr373559137.2.1789388732029;
        Mon, 14 Sep 2026 05:25:32 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr373537137.2.1789388731529;
        Mon, 14 Sep 2026 05:25:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3326aecsm26638191fa.19.2026.09.14.05.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:30 -0700 (PDT)
Message-ID: <38b674c7-999e-4210-9834-66917e049134@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+6RtwIU1FO7i
 jnI6/JS8qABTP+xoNogRUd46rOmaijzBQ0tHdoRp1DufIBex31XRFzRI2fj/uAxFv1ID81tEkZj
 HABE7TtEDcB1C4OKK3RexfcWTzzz3mL0B6Y8cI8Z50lFm3Q+U+7pXAWaxe266OTX3ie3hFV3JEt
 Cas0/tyFJgzO69Jf9bfIC02wO1LeFvvqNClvqeAz7Ca7yLYlC93BCNHJ1y+1B0UX5FvFA/Qlmqw
 WlSw1AH27vidrfuPU1EL6KVm6JGJt0MNI/Yio58di32DKS3W7rCLcvaUKXF112CM0I982BA6sOH
 ULtkuxZ2YUS9UPAk/9QYFtlUF2sgFbbRxqmDbmYGloMol/6mNaNgGT87816gh/NWgFjL7EHSww9
 /hC7ZHnwarkqmf0EAViWNzXuIzh0s4DkYhCNsm+++ic9RFH0WfSwusua6A2o/wDFha8mHofjGNd
 xKlcQYl34sARVzg/+7Q==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e7bd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: w8ozhDRLo-QXuQ1RyXTpAw1Un0C5CF6M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8MHrWkebUNci
 ai+tKqOgAJzi6mcRr2MtNY32klAjs7WKCTOaLSiqug2/CBP+5UJ0fnggUHWsrtDl+qXtn9hZ0mj
 WcjB11TIJye2Uy1FAM8gaPeynsjYNUI=
X-Proofpoint-GUID: w8ozhDRLo-QXuQ1RyXTpAw1Un0C5CF6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
