Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E348F03F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858554; cv=none; b=dv6FF5+K2Lso/6WbJuNYN2uuJxQnglzJGTSEg3Tj+WdpTcZK9C83aXJATg7zSGFr1Nak1EgqtA49bFW980oNFRvNhlEDTLHoQG1yb0fpMf5WcCh4KkW/J2z2rUSs/BMaE4wZ4zcIfWORVR+RzUw0bHeeWdjSJBaFzkAuZZoj+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858554; c=relaxed/simple;
	bh=dEZPoLoQ8HBxu911Bu8NyaxQGEq0O36z9As/rzJxBw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7gS97E6zYYDR/CLxY4MVzhG1FaoUooj+UEAWx1rgf6RYUy6EOnasI/TR27vtEwKJRL3OKkpvtlluSo9xlf+SkV2fLMLdZ93TEXvBhz00W2HXHRjeQVqTjHVzal5l1F4Yx3j9vALXrsROrp4i/KhsUTFbr2kKbuDfSEoj42GWUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2Kkw3Jf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+2OB06W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2Kkw3Jf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+2OB06W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CcaHG1289079
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	319Mf953qFJrlwKysiqXPkJwGMfgmWFubiyg/ogyw5c=; b=W2Kkw3JfKQMFo8qa
	Y/rN5LQZhaFOwxa6uOZOHBFhqqyj0NTtG3hNs81+2XBLZMiAsinT4u61tnfAOh7t
	DTNjuk0m2JwE9JXYuA8ashMWCjsKgNdYCPDc1iwqduwTWa7MNclOYHrtWGGIR6+x
	ukdfphX1+lRMEYAD9sCfrpa0MJ4E5IKojXSrGftlv7MPAme27eyVwo4KDF1YbSLA
	5lC98GKG1UNpQnHeB28l3R43ksD48z6UiL3nb0ZuU5RnimTBq21P3aZT77VeMlmb
	fbZcDwxVs9IRmAmEoEUJKt+O4K2Y+iCPZHYHr5sNkRanRyw6tEul2fBYRa7FMKMt
	ARjWwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjbyk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:42:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2ebeaa0a4so13375525ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858551; x=1791463351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=319Mf953qFJrlwKysiqXPkJwGMfgmWFubiyg/ogyw5c=;
        b=c+2OB06WfhtJmnAt1F26B0tGVHZAj7ihZQz5QGH0wQix32xsVtfvhG8z3bMSstsvhb
         mDDbKd3SlGbmcUJgIhX3CToFcoFIuMzU/wg6ODq89K76YKY15xW9RvxjfN2ioSvJQLo+
         f8wXpkSQFNaHa/v3rmpXsiR4g52mr82xFRim+ddsh9rm+BFfKu5ZoLEaIwCxlkowv2wu
         tCbSGDX7B2/GYr1Yiph/+CxxqBij9/J5OB/X6ZduKZlKD4yQsFAlvS2Mgtemw+T7KdDf
         8osqg/38bU2ffE4I2m3jhYudpU7kf3TWyRisndwT8fFZjuqIJkhA38BrCH4hQ1qByF7v
         ja4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858551; x=1791463351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=319Mf953qFJrlwKysiqXPkJwGMfgmWFubiyg/ogyw5c=;
        b=1HJBxB+TEL3AnwEU7AH/3PL6Pxx8p/evxzXsR6IlX9cBd7Oz+NeT6gSfN4Xhjw8Aa3
         MkkdsYz91KL6T3eNqxDiwalImLvF5IZRCavouqOWI4RJqsSjzXCKhOFRxeE/dKSQOJHU
         jYZ5urC5RH/EDYPM4IFKVOsgTe8cy9G7nJohB0TY65jX3W1g1f1l8HgrO4hZ+qTScmpM
         39ocj2n64MWCBBUDRSPPrEoWdjOmgsUyHRogAEsmJ+Y+raFIVKyUegzQj3xwfRnQ+7g4
         s2ROgziWpofV9aP1WZ5WoYRS4mriVWreal5Gd0jNskOP1dY2EFylFIgzf4tuJytM//DB
         YHWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9IG5vnm4IvE7gf80F2FFSU5VuAPI6Z9GmqrCEJz+dyqGXcoZbJZwXYbLjqo9b46FzEqHXG+H3UVo8NWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuFlrX2Lz24TaGWnEaSC53FMIYkeWiIJ5kBbo2ADTMIoW8nplO
	AREiA3LPa2xr7H0wU4+jIADmM3+x785GkCmzPRGHeU0DbP+ObHGnl4KXbIdr+sv997HishiUArX
	OIzK8amSUH0x09MRtkogrztG5uO/f4yfb3yxnE5QZLyz7IhbfUL1qjH0Kx7eljJm9eZM=
X-Gm-Gg: AYBFou2WR9oFFA5JzcfhBNshfWMimEkBdtJ/sxDt2BMTUVlisRANuzdOJLIgrTjBAeC
	GN38K83T98aD8kqt0HgbT9tOKTEeiYtnm9sniWAL2W8CG3k6PA8+f4J+kBjW4ANO9l2oIdJCyBx
	ymB1SOPT5iHrRNpqCkkmpuBXCA9jHQmok+AV6B3modRpa+YbGibtLBvEca6maRC7rO/vLj/dYS1
	nASYnhC7vKvj4lBcYb1T2vBiOXC50WdLBrMvIBHIPr1IItBIKXpWGoQmByUyj2QpvRsBr9SNwOu
	UD14zGUGAAZUooC5LkJU0dQYIM/vbMJjNfKCNTwYDFdS4dC2FiF1OsZiMPE/D6dycbw1xAzh+mV
	q2kaFjr5QRNuKNmd563PpsOgP8B+vGEOJ
X-Received: by 2002:a17:903:2349:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e2e4ba0b86mr36266355ad.59.1790858550587;
        Thu, 01 Oct 2026 05:42:30 -0700 (PDT)
X-Received: by 2002:a17:903:2349:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e2e4ba0b86mr36266145ad.59.1790858550088;
        Thu, 01 Oct 2026 05:42:30 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e3005844b8sm10215005ad.1.2026.10.01.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:42:29 -0700 (PDT)
Message-ID: <f4dd3bc9-9ffb-4d1b-a408-136d6d2b49ae@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:12:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
 <arKjhitHzi1rqKCV@sirena.co.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <arKjhitHzi1rqKCV@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe5537 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jS2PUwK88M1Llq3_maYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 1a6dkegVheGv1iEHQOngFs_l37ik1deq
X-Proofpoint-ORIG-GUID: 1a6dkegVheGv1iEHQOngFs_l37ik1deq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX9no6FtdsMOGS
 u1WVnMJNTsjcMF0CmqyhLnzFh4IWxMdXsHShV0scp4z6rdiYY10H7rJ9ekLQM0QElsW5gpxEH+i
 dMW7mggmOm37lV3DK/LprYpkh+umWR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX1CnUUy+GYxyh
 mF20Nr7MUthRO77wXL4SyifTDBh0U9pTWV2FtmCSJbuEtOuJlnd/xFnDiJ1Rw0FzMGQ/23Hou6i
 uK9fVS8Rnfzu/zwvpy0xnHKTcDZfQ9ToUcbfnb7sVwXnwHZAGWYUmwfNRZUsagJ6M3qmT5Ld72Z
 DB2+eksuHhw4+H4rc4SpMT40dKcLnR5w6AXjYrwNW1eUc0q4K8zIaqkf5hBC3t3ZPNGx78N+thV
 bjVv8NzAFBzaXkz5ddAl9W6/UyRT9K29Su1B7xjNea4FIDQXVqUgY9qoMDUOfYgkgxoLlTR3GHn
 5BKJE5rpsPliSHC87dlhBjFUVOyjxb0eCNbiBXm52b9BI0XisJhgUZtr1gFXAihmNOKLjyi9kZa
 Y4yUX11iiKkOtwGWBVBQpbKX+shW/YWtuuBs2quVCgAbw5/QNqrFLE3a9/segl66T8oq4YZsdVz
 qTwbeOBKDdBhOHTXzJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050


On 9/22/2026 9:19 PM, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 03:12:36PM +0530, Mohammad Rafi Shaik wrote:
>
>> +static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v15[] = {
>> +	SND_SOC_DAPM_MUX("TX DEC0 MUX", SND_SOC_NOPM, 0, 0, &tx_dec0_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC1 MUX", SND_SOC_NOPM, 0, 0, &tx_dec1_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC2 MUX", SND_SOC_NOPM, 0, 0, &tx_dec2_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC3 MUX", SND_SOC_NOPM, 0, 0, &tx_dec3_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC4 MUX", SND_SOC_NOPM, 0, 0, &tx_dec4_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC5 MUX", SND_SOC_NOPM, 0, 0, &tx_dec5_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC6 MUX", SND_SOC_NOPM, 0, 0, &tx_dec6_mux_v9_3),
>> +	SND_SOC_DAPM_MUX("TX DEC7 MUX", SND_SOC_NOPM, 0, 0, &tx_dec7_mux_v9_3),
> There are existing widgets of these names in the base widgets that are
> unconditionally registered so these should collide and get an -EBUSY
> during registration.  If you need something different for the newer
> devices you should move the base copy out of the shared table.

Hi Mark,

Thanks for pointing out this.

Yes, this is the duplicate-widget issue. I will fix it by moving the 
base DEC widgets out of the shared widget table and registering exactly 
one DEC widget table

per device version. Older devices use the default DEC widgets, while 
v15/Hawi selectsthe v15 DEC widgets through match data.

This avoids duplicate TX DECn MUX registration and preserves the 
v15-specific mux enum and DAPM events.

Thanks,
Prasad

