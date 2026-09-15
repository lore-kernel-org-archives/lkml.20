Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB38003D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467886; cv=none; b=YUko0WgpArZCCNDl6XHp4ftRddUPNsu3fGtPcKELezd6G9OFwQicAOZ+S5Nrgw4BEQwKTbX0dj2xIu9m+s+Xwmju3OL8pApHv5M0ytirOC+g869pqThrvEJk3/bVlqh6HRTOqQpu0KjKVug9v1397l56zbmD5JzgmiyhQKr6zsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467886; c=relaxed/simple;
	bh=JZppL24vMve7PF81iMLaVhYGDa0udYqAp8Y3dpIqKJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLTBY9k5gxMs0tt6wBsGifvtrQpflG3mS8zYB6kvD0VgdR1twtT/qG4Yaf4+k/wDGnt6LWpp/w+lCZZzaNaRuKPTpgzNV73HzV/No39QFuEEujKaQ1/7dPruQ/j41x3nHoW0Eb4dDzoY/IlrGm6joOJWtgjSHd9C63LL6O8NPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGZI/e2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOJPA9Rx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGZI/e2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOJPA9Rx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hE8e3912008
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gK9LDColQdblweoq+gLQFgbxSyv9eulcJndaBLpP7Ms=; b=QGZI/e2yag16kuW5
	e4FuF5bqSV248C+2dkK8P+ekGmVTIS19NtIjcNST1N3Vw9R0F87/uBRRASHsOX82
	KSVdcZ+VubMoMUmUOGTkF9zwyvc0jhf2NQ5LhrAtLOVXOO76PO8dMPiR3R0jtPzv
	NBea3IsdXyT3sxG3B1dkOsY/+N0lgs5nZhrDm/vbqhpgxQMVmQ8MHf4WcAj/EKgW
	Rv/u44Vv/aVNffwfh9x0k0LvML1a2u0rt91L4i5G47mYXjwSlBISSPlLgmnxqOCS
	bT6qX/vAE9u4bBtXkTaJ0tI3+k4rBUg++wT1VBW4nO64VYUrWdxKl0Tzwm/ejTs3
	BeTGuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jes21p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:24:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1e564fd5so327218185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467883; x=1790072683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gK9LDColQdblweoq+gLQFgbxSyv9eulcJndaBLpP7Ms=;
        b=XOJPA9Rx64wKP1Yd7uCvow9hxJU9EP3LvfjWETDuJ9MDVJ6qWKAMJo0onog0C3I5KM
         +vo/RHXNDyRpdT9bCLFLeXdroI/e5pMXPQFK/T1mPKPalwll4rMz4+HFz22P1feLNi05
         ptaFlbdN7xby/OPbuMk+unPamxk6fgvTV2XIsmU0qzlRAEWPCEUnGnC/0qNWGGdSrmbn
         JOUTlIYXKoFWi+sdK5waQGPLJATG/6LSHYWgwqcnqEgGRe7IyLzb8hdUFRpsHk9stNic
         GmNGUZbqO9MU2zHM6LdLBpONTM68LTJxx8r5BX8YhbD0U99T/x3zMmfVIaGUnlw7me1z
         fuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467883; x=1790072683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gK9LDColQdblweoq+gLQFgbxSyv9eulcJndaBLpP7Ms=;
        b=JfIavbdkAWBzgxo3s/ougBG2jd0AahRxKVQbQ3HNasesNM8yhnyi2idzE7Is+Deb7X
         /iTxDD445Wayq8saLv3pkWNe+0x/5eM9tM3yEbTGA3JpJniMtCCLzRZjgFBqxh4/92BD
         CuxIegzzXOVWXlKoyXnbL4c48eF++n1nqJ+KJavUSKyp1Pap6pTz5oy1xqMAbBruYrFZ
         p5C/X08fBh+GX68wn+Mj+hU/JNxQFt4Htwg65m+9NJq3fWa18fjQpWBlok5ijaL+Hcgd
         WYdigoGwzM2D7JPPV0C4XsuNw0pr9oAj8OYmA7zRVwlGMBO8scshelrIL0AwvglBgPwz
         MM4w==
X-Forwarded-Encrypted: i=1; AKwUvByitB3dCR1yPbKGAAf1ISmXGC/jB0qbZl3fyHF/AINx/RW3OIT5Fm8bbfWeFotUb8YKFdw29t70/939aWY=@vger.kernel.org
X-Gm-Message-State: AFuF++lTQN7+U9p6RjHANLv1VNX7GjCZlrjJKgE1i/pegzCCwsowLTxr
	xMiwqhVk2UCPZBiN+7nkPeDxzx9zr1lAEtx7xQz84co3hEJz3ZNaqbELi1vTzxnAhttL311m8G+
	jz4j+gI0oQG0fWolSGsCpwnHBOWFBusfR/yS78vPysGrS1qJfD3hGx21SsZrCarem/P8=
X-Gm-Gg: AYBFou1l8/hDDr2RkbKv33haSjA/G3KvQ/xRFZWDCxhE50zfZsMA5/UrttPuGAibQpR
	HAweGiNdeLnzSG8V1cBUgT47ACK5rJXXhHkiHdoppzsgBvlhfjg4rAMTjtqIAcQgIsV8LoJ29th
	sakWOa1pDnNIKGz46hV6ih+1qqv+J0cnR26iXvvbqZB1SEMYWc+wNHawabUkbyWk5s2f7kpXLgA
	irqi+lEg2jLjLRVt15QdGFzr7NKyhYD0khjju1YIJ1C1DVzweFxqUAOd4J0rl5jiR/WdKGC24fR
	aFJRXjSXKHKa7zwTD9h3jz2ZfHd9mZduWgmZm7fcsDPV8mVNqn7/kroqkwKaw7o7KqeM96svomI
	CKm0c/LWfnO+WGPZOPs6tXyIOyA/NmAUgGjl0AqC1fHqnCAtR0KGN3uGaF5IVuqw=
X-Received: by 2002:a05:620a:2b89:b0:93a:83d:1d0e with SMTP id af79cd13be357-93a4088b012mr16145985a.38.1789467882968;
        Tue, 15 Sep 2026 03:24:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93a:83d:1d0e with SMTP id af79cd13be357-93a4088b012mr16142485a.38.1789467882575;
        Tue, 15 Sep 2026 03:24:42 -0700 (PDT)
Received: from [192.168.10.107] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef2e117sm54501265e9.1.2026.09.15.03.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:24:41 -0700 (PDT)
Message-ID: <92fcf594-9b39-4af0-8bda-47abb0348bd6@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:24:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
 <zacwmavu3huggr5tb3f4pqxw6ca7hsxuaye7okqgoh5fnnf6zf@73yke2jd5eia>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <zacwmavu3huggr5tb3f4pqxw6ca7hsxuaye7okqgoh5fnnf6zf@73yke2jd5eia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX+yajzQ++7Tl9
 6SZCk6Csd/18uRi797bKAFVezaH+jlVAFucBOEvJI+dLeanH9vcl1DQEZwNSM8s7MJLqIkvdaRo
 cIwpUNDLGSLb88cmuDdTUUI8cPQnwkQ=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa91ceb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mCxFjdEeA7KdPADpqcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: eHjkk8UoqaUwC1SezIDKybb43LIoYh19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfXxNgjIdQTRFAa
 OHDPx7XJ6fOohGsCxu1GMARc1QXGmcvQ+RUXdAXpEPvpZLrE80lAzOiZlGcwrzeFjydWQjp61E1
 f5jmgl7o//jro2oxINenF0Qz7g2u6EnuDXhdgNCz9vb6lSksoij7H04V/BBScOGGj0qkb676nv1
 Z1DpHZTO8Q2ktXnl3bc+P7Z/E8Xp7RcOrvQ1eEEtpksg1Ys4Y2MP1TeGtsUn1025ClIsU+IqFzw
 JUvs4ItJLc9QJRWStTrDs8sNsVVgmdUck7gBOKNnW/lCRlax/DlQ7whWn6odScLD32TUSbauHem
 SxrRS4AEovECTzYeiZ6rxdvLUijE2/3MSSDBG9Dt4veP2FRZ+frpUHFgmkqt/yhd09EcczOSF2r
 +g8R6Lx/YZsrC3rmNBZVWvrtmSyY98Gx9B1/WnbvJVTVaexSMhkoDE05uNPvRnWl6WmJefDlYns
 nt0lKlSAQGn8WxAKFMg==
X-Proofpoint-ORIG-GUID: eHjkk8UoqaUwC1SezIDKybb43LIoYh19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150150



Le 25/08/2026 à 09:34, Abel Vesa a écrit :
> On 26-08-09 17:59:04, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in monaco.
>>
>> Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.
>>
>> Add polling-delay-passive so the governor periodically evaluates
>> the zone during passive cooling and steps up cooling levels when
>> temperature stabilizes below the next trip.
>>
>> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> With Konrad's comment addressed, looks OK to me, so:

It is unclear how to should be addressed.

 From my POV, it would make more sense to send a separate change for 
LeMans with the explanation regarding 200ms vs 10ms

Otherwise it is a new v9 already reviewed which will trigger sashiko 
again, forcing to look at sashiko comments again and reply to the false 
positives again. Just for a sentence in the changelog
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

