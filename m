Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4830341660
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812649; cv=none; b=OHqQ9ZnMxIQlHskABmkGX3JGIwxZwy8TjQ+fYAT9JUJtkZ/yIw5CN82AauVTezwOqGoHGgz3vFHfrpoxAMnUM19i/pIJvEuFQgmQLFUkJxIm70EKD4CRucJcVGeKlnVDWvuZZmwGyFYOfLaxuwjoXs0kkcrur4r6OtXHQNVTHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812649; c=relaxed/simple;
	bh=qHnjHk5ujIR9xyBxf0VSVQPElSSwV/cboQAyFOMBTUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trb9BrcHOxFeHz+E+rC2E2kg9YJEVBN0sH0c1D2o1R621nqwAnPYuMMBhvE5z5af7LYg0UcSDJQTeY9fDLBh0AjVOvYLB7OBXMJm8GCJM9apcNrinn0ePlGyU6kndLR8/oJm0x+mTa8i4zlt7q24Pk2CGtW0W9VokwJQ9mipQfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQYfz9qm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=De6jbM3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQYfz9qm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="De6jbM3Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Bbb2275899
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=; b=QQYfz9qmqRuEHOTF
	hHgLWSVt/mJ2qx6z5Zuor5oKTjphtj6ORKylzDIeyIRYXe4tWaH5jLhT9WW90VH1
	vws9zZI5kuW7z+mOsJ4qNRPpWvoY36m0NTvXkxaiK2l5JYvL24S7n2a4Zb/XwFpy
	tjpanKaKR8X+pRtmesE42GlZeWlHFvtiRry/VLZ7w+p7YhR0yTj4O347h/d3bTOr
	43iM7bOXZfSdt7NJ4iWyKCBZjdnOcMD4i35Q12grLqnOTFD4mYR5NspCtMp6GP9W
	0yidWB57BLhSrynbKIRCEt/BcU+Fk/Nzwf0gxQJsYk6vhyFQoGj3S9yxUYudgVkv
	cbABuQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1k8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:44:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso3477227eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812646; x=1792417446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=;
        b=De6jbM3Z57PQ3IFPnxPbhMD7sY8a4vlC+/Du7q7vNbwBFHf//DwVoiH+Q9o+HdOaus
         u1N1i5ayFzseyxLq8F8CtWDzigI3oV3ns+kNRfowXIfxrL5bQd9um3h01nakuRCWMIJn
         88b/3p8sbTPDZe6yNlF/XrN1jdUbjshidYgfCPf4WpjVPuzYOmvpgxE1cTPOg8PcCvQW
         Z6f6N/rJgrf3Fvv6rmsHXdQJLhCtDQ0GL3vCYivSpaRJNTtRx21BGpI7vwfYm/0LF32/
         q1LEco+D5oOu2iDCnCEny3UG+bHa8Eck7T1qpwS4BQmOUWfXJ1J/hy9m8DFHrw9UGczs
         u+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812646; x=1792417446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=;
        b=KxYxbFUO6B9+GYZWJ7xWk0oLUnxWg+hDulFbdu+ZeD7SmNJgPovGeWXMvpN0e9sAVS
         dVNkaymFlzIesE9eKhSjgJHyK2Ne6OAVV/gJ1LEYy8ukb2+jYZDkFW6S48NJ3bQDnkqf
         F+LFInT7KsHV6WJC6wGCyQxEGbDVsuBjfqag+iy6H/R84VqgJB8BG2YlpfrQn6WMlDE7
         DpWuK1e+Qlx1XXHaggmn6/2FlRkrLzlHHF80QGkwAArhhZzxya1lvDjEZDev6rMc5zLL
         BAB+1gbg7oq2NLAIJciDSpdkdipeHD18n5fCc+CdbNLW1XpOyKwtJ9qqh+F4xfc2e6nT
         VaVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNelII5fwUY2nbmJgoT1zuV/Cm81k4Mfpesn4EQ5Nl+ddQWhXN2x3C90XbdLnMgHzeBjgErQNVTKDYgCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrvVPbDL1w+wsw6wrRwbPyBeWGlTbfvH/hyn/heuMU8KBXWFsT
	6PdPi96khEsA7UVEd2mnBoHhgmXJVqdZY6LJRVs1xAHPgYEVaRha89FeL368xRCdepJB99auWMR
	aC12Rqv5cb6QONtjrAqURnoSe1QYOZzmNJIcxT1UIETo9Dxs7w/mc3FR5mzy0Nrbpwjc=
X-Gm-Gg: AYBFou2zgQRK+1f4xTPZXrfcXiZLHTzzcGBg+llVwcbd8MxB4s0aPfsghJjdmRTU+Sx
	PZSq7Nkq6mPXbAwSdX6e6ijnBjH+edw/xLGfmewmv3Phso99uAq1uvu0rG3rVHECPramseA7Lq9
	p8ng89hnAmNLnlj9GNGtqc4UleUtqzU72RSXxh1l2hgiyXmJiozJcoFHZqSs9XNejhTEALvEY85
	DFG5m7slcO3iVigTvJ5KOoa88ZqaknZWySrwuj6VZx/9iwCRq6JomHgRsqAhJSSH6OG7jUvh4uf
	Vn7uI0EuZABVIoXrpCxmps0VcIynTb9bqaHcokuA+MgmKiIIjIUM1tBItefANJDgNKHfi00wX61
	S77grmpU/NGi8K3WwC+65b/XHPup+iM2ajQ==
X-Received: by 2002:a05:7300:ac81:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3537ddd6fb4mr19975495eec.3.1791812646294;
        Mon, 12 Oct 2026 06:44:06 -0700 (PDT)
X-Received: by 2002:a05:7300:ac81:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3537ddd6fb4mr19975450eec.3.1791812645696;
        Mon, 12 Oct 2026 06:44:05 -0700 (PDT)
Received: from [10.92.194.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm33512555eec.30.2026.10.12.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:44:05 -0700 (PDT)
Message-ID: <c5bd025c-d32e-4681-9644-11c4350caf99@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:13:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acce427 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=06DCG69OefxHWCB5cYgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfXxI65PstJIUsE
 7tnnRngTgIXM1I0xJxNKge29pnH/gK06Os9uLpc3yF37aKI/na+dqagiR/Ilahdr1LX5khyKE8P
 tGZZazqBqv+tkrYSjtWS6sOXFM6UgNI=
X-Proofpoint-GUID: ENPVRodMUE52ZZcR7N7FseP0nES_SmP3
X-Proofpoint-ORIG-GUID: ENPVRodMUE52ZZcR7N7FseP0nES_SmP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX9C/msjZBFIm1
 5Tdm+1pch39L8YFmlc4bLSEMuIXzJASV3Q69r9+fyakrPAMiy+aiRf5HRnrTmmNcLBSaF+F2Yzl
 dL1I02yFJ6diTReryuvnCDnec2xVVs9nakSRljBxuRsf27qXsHmyjibFR7OStbWegw+NfL2eVK4
 Q0jj2kBXaVkLGa6r1ljjDhCxFGSX2fqs8BHZ4dzWNQG22dfGxqJrkLEY4/drqwTnhlVRTzFWgc7
 1fUPtBiplnbv5zc6wQrisxWrihY6SHTMpTjfbakG+bRFeL21dFI+cZaQDmOU1C+ZuQA+li4slwl
 77PigpgrORze6DGx9OVSf2opx9tDiJso2N7SqaleuW6p4LaMF9vGbZoa1qYCZcT9q7wG9DhMeNu
 ygTVGJwTyCb00yNlppkUg8Huy9bvJsfV3geZEnWZJJEEWqGjhzyrJyuJr6p1CBXzqkGj9pc2zLn
 KuNoYBpODUpFoCwqQRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054



On 9/28/2026 11:39 AM, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. Support upto three 32 bit magic values as arguments. This enables to
> support for a 32 bit reset_type and a 64 bit cookie).
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
> 
> With these enhancements, the patch series enables:
>   - Arch Warm reset and system reset cold as predefined reboot modes.
>   - Vendor-specific resets, configurable via the SoC-specific device tree.
> 
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
> 
> Note on introducing psci aux devices:
> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> psci-reboot-mode probed through a common PSCI aux device enumerator.
> Reference discussions on this:
> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com/

Hi Lorenzo,

I am planning to send a minor update to remove some unnecessary headers 
from psci-reboot-mode.c. Could you please take a look and share any 
review comments so I can address them in the next version?

thanks,
Shivendra
