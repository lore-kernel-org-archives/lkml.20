Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C88B3ACF0B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879241; cv=none; b=ufhGtB6EklX7LqIQKFByNqO9OQiOvU/FMPPndLV3ugKX1tI8Wsx0V3KqMYCeNIHI6eUxzJ4UqbbxOn3buI90g0zyDwOMJwHFgPyC8m9nqQ5REUaCoEC/vQZ/aVME6U01gfvytOvFzEp/R3NXEUFNfncDrihGilsHktB3sZj9Wpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879241; c=relaxed/simple;
	bh=KB48VjcwJcdFoEyL1UN4JBUVOXRybNpELXvG/sYq2zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wb06BRqTLMWH9tffxsladmI6N4yc50VzwMhO8kZ6NkB8ionepj+ulpDsu41UmtFf24twijcn+FdvW7lucL6hP2fYPvwfdtsR5o4WxSkl0cKWRCntkds4KieWKKqXlYhELcZ2Yi0mIGTuzaFF9sk/y2jxifToev/9csJyGsAYUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akl4rTte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E06oGQD5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akl4rTte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E06oGQD5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D212wd4071816
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=; b=akl4rTtetvUhueYG
	lX71wEvuTkaEw+ZVwYal6+1bouF4goqpDDD36wZVv2tXzlRlAWhZwOdTof0hPswV
	eRhYrEWF3a71sOjjiNYYyQXVTKkfPmgpSemMXdmH+zl0bHlg3BzoUjuGS1e8zfCi
	4kPWIAsUcPZPUcC/lr6HZvL31ALeBFIDySgrwG4qCArjEl7CgNEcf98p30QpOy9n
	oy659c7XwiCTs4qNAtmX2mzbDDkXf9OTsSUU5tzveGOvb6gir5oCg5T7//TUDoXM
	Cme1KNzybjqFwd9/NTCDH8zzQCDIvMulDJyMbeMeMZkrOIkuQr/ZeGcrOvNElQM+
	xwkNow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjufqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so46192585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879238; x=1792484038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=;
        b=E06oGQD5wLsh2fmJ5DWHzYAggFZJfzpoKRItWDWjuF8DNLOWtgUQrfXLsNqrRaAn7k
         C1DPYtjnExt4r5JnOoJHWP+gHEYd2XbkEu/v0VWVZ7XZZztbe8J/YyLF/lCEa5e8Vq/w
         Egd8k0jE/5/j+HLbKXGEMr1Ehp8RGZCHoH0TXFbyjPX0u/RqUlJCUqCr8OVFDT/PzSeE
         bnSMShSUJmJ3UCTKC2dQrHaRbm/Z9S9sXdGBMrj85e0hA5JNbabHEzvBZUW3Bv+y+dgN
         4FzaZRAWLTe5eEWlNqnnFfD8PbwOnYD4rRr6MOI0O45fE0mA+xLlwP+9wBh0UISf1k59
         ZU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879238; x=1792484038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJdzVCQH4Qf/a3uv4uEeaxQnvMeNIwDQPXbAQYhpzDs=;
        b=FEW4aSbJk8UjIZMBtEUcyOWx9JzIjgXncOVJwnEwjInuKGBULf6FB2VUFij2PLbHgv
         sY/1PU9pE1A4/SPL1qPT0GIrEKPOi1Pz9OCqcaUDsn6cqmyUI3fpW8zCp55PcZbVUa6T
         DwCZSYrNb1Nz5nV1gVtArVv9Wg+ytElTA9lkAa8MUZVW9i3ZePq2WF7rD4mmINY8M1bK
         kmG/tBlboKaJIRDzaxDvAQ0rLAFv6llKHzpykhQ08WO7Txk1jv2MHXNJ6k61poxgf9h8
         VKiIqLbdicJfi6JJmOHuDcg/Ihhf/X7FHLPK9I6VmZXKmfVBsUiCuvdrcpXyYtnEhWmN
         vT+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxH2uoFWFz26NgLUtHGYdQqzp+vhVOHvGYtRK907wm7ZR2gRpJek2l6fqWYw7BG8XA/zbDMujo3+vdeMho=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZMz1hvnM5tFFpFIoeS/njD3IknxFPL+YqpX4kn8mnBORJx5Xf
	TQ2H1JAvA6GCAQIhhpmuvh61IsHKlHC0SNtHWJv7tOVNWWfhoGD6tvIILy4gmXdYBD0UloyGSnz
	9JD8ZkzG/4ceK9HOARftTXBMs+L/oGETyaw079T573+y2RsAjhCZcNfrC+K7QDZlabTU=
X-Gm-Gg: AYBFou2QesiVJkE80NRZ29d7Oi4Xj2jdX4d/zRgJcofU9w6/I1sC7+W4A98CHsS6uze
	yfJO7Gknvi0S7y0wAaOsafu0F43aNf+wLBYJPO1qjvrUo/L3A7HBrHjblDilDreMdAHrzcPBPBw
	WVOVaqIsKpBfBCgneS5JJAxdaBIfFRe53KMSTs/dmz1ghIl7SyTXIIA3fnh+rErivm46o1Co6Xa
	kwjdXpKx80E2tsZGwegSZF4lSGQdR5iVHZdVp1Hg4e4wciQuj0WxwKs9eNkEKwqMMUqTb2dsahJ
	lSr6Ii7t5JZVMcwq9ZKwWioT93RoiZleoKn9Dj9DWpEGX8Ygx4fVjBGbqbvX73YDzjHqWfm5+QB
	hkMzcTh3n3tYOqNC7l3cABw==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1998189985a.0.1791879238323;
        Tue, 13 Oct 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr1998187985a.0.1791879237824;
        Tue, 13 Oct 2026 01:13:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0751sm197267466b.35.2026.10.13.01.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:13:56 -0700 (PDT)
Message-ID: <cc9c2f25-aaaa-4113-83d8-4965822e4fce@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:13:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0CIpiwJoRDrgCV0pnWuBQRMsEWz-Wb5q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX0bETNecMNfss
 9A1LeNJO86L/Yj3WSY/L9KgFaS5YsbbouU/Eh7O+P9aP7oqqmSlQHbdI+hsyr+J7+oZ2E5F0cmh
 +XlCtzSeJjy503axDYnTfvxaDk9N/24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX6rjUtSGp3WOu
 du8yTvcxLw1V0/fPJu90Z4ltUeZGmOix6oaZWlXRQzTfw3OaxbLkHOzq7QZDcynXa/db7LEPLFW
 6IZIIZjLJwN6jNbuL2Mt9OUyghDbTH57MpUu/a+Mj7suob63VWVDz58K6CaeDUqC5kbh+q5vlxd
 QM+yKC8jIiMFD5rzmssVZfDuGvZNuOfs9q/lgc2Ct1bSRpZTfQOr35PVDmKOZvgfwC+WmjRk1xk
 KfiW71dl8erUu5o2eMAaVmQsw55hlVTQoxMhARV6T7FZ5yZG53Idsi4hbbUplhTmtGEsxKUd+ci
 xuPgIN5TQxnaC9cb+DdzvTRrvoPXGtqGId/MJAP0N4/eNtuWvt0UMIf+8wVMuUZKiLbRLe/n+Dp
 zNshbTGNhJcWMbIUqg73HVhmz35AXUp+eygJSyY4cJAVcDJsJTJBtYPIOI41l6qiilm0rJB/CRu
 xZAnH5cSJamwGiVvXHQ==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acde846 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=UqCG9HQmAAAA:8 a=39_P3G3aOQwE9Waq5pMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0CIpiwJoRDrgCV0pnWuBQRMsEWz-Wb5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032

On 10/9/26 12:34 AM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the board identity, reference clocks, PM8550/PMK8550 devices and
> keys used by the v165 board. Retain its inherited debug UART alias,
> stdout selection and QUP wrapper enable. Keep peripheral bring-up
> and the Android bootloader memory contract in separate drafts.
> 
> Describe the board from the SoC and PMIC includes, rather than
> inheriting all peripherals of the SM8750 MTP board. Reference clocks
> and key pin configuration are retained from the MTP description
> included by the existing Warsaw BSP.
> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> 
> ---
> This revised minimal board has not been boot-tested. 

Please test it.

Konrad
