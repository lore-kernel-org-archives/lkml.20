Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B31FD4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750280; cv=none; b=WkSmaJsCaUK/cwM5coD/eB7Wm1DFacaMaCXxVx3tyB1rbArFf3vTy2PUNsXjpJppigeO3eEdzQ9GD3lqu7s0dtvD77VfvhbhBqcWgqm404WAyEZioh5h8xtXNa7XhWG3uM9cEZhMqu6UQpjVK6GTU4zlOOl9uB3Rk4Lu/1jr/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750280; c=relaxed/simple;
	bh=BYDsTpoHZztHpVH/KB9MIt4S85CTFk7lYHBkXkgV+nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RaBvF2fiyrEMAPwdSUIe/8z58B4H6P2PAZsfl7Cbhx/6DEza60rpQ0DyEsE9nqmLXU6oO/X9Y8jpKgWS6zCxxVYTZC5aj3IEQEgz+9UxOjq8+UpttaR9sjMv2xDNynBlWqV4XNcUCv5YGh+M5RmSV8SQA9rcLW+KJ2Jnc+2k08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFBmXjrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwiBaWuo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFBmXjrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwiBaWuo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBj1W3983079
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=; b=gFBmXjrd0bXAHG1r
	R8/tATY6zngKD0xcvCkn3tiCgsi6wIGAwzpH0mjUV3GoGyhMdGGKOmfZ6XtxI9hK
	kObU0MuJ4yFt0gUW1SGU9g1TMyxNIQ7PNBb8ZolH2tcO1LNatYFTNLJf3iOMJQNN
	fzhmQVhxLfgWCsbBH+6trMDyDqDk68AD4aPAey98vgRG7oLGVOelxmRnwZtoK4tT
	lmbrnuq4hasJd8uvcIcZvgwAGuQ1jsAL6/dNxrReTNxeFyQ9VmP6SUmVPr9vl9dn
	2U0y+03fmfLeJl4D5UFfo5+Yx293EF+8KPxUQfj5iTLYOkzTJSFJtu0zNtzNtIKP
	SqL6tA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqrueh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7530aaa7212so39016137.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750273; x=1788355073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=;
        b=kwiBaWuoMh64vd8BN3Yn8RYp83AUevy8dz1fHV/vKJz8WhVpMS60tYrduGwhY5SI/m
         /Ys+/UWZTuu6Z7FtsUrj706wd3QJKCDFPX59FiJUKeGF22XCCeUoCEIbAgsupvBZGgt9
         d3l/3SLmULMtxPCSX1PjCCa6pozpy8aZ4O4l44jmUgltp2wu4CQ1EJDKQii8Jj9vWoD+
         5KS+shjhKqAZvpYNnKfWYyy5C9gA/OAIGcx03o2wdF6v7FgPUZyOGOOGVTkUlo6W07fR
         MlurjmcUolR1MmdGEImxMNqLI08UKorcF1f97JNZe5bQq4jSExKGxRIZRDfmUrdwY/Qq
         /B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750273; x=1788355073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DELOI9rOA6Bm04F7WLidIklLxMdtsGlI2iiw3Tgfc7I=;
        b=CLCoIwXGNyB4y7BvxFG/owTpTHz0IIN7Kw10oVe/L4r6SFeX6Gcg25zxmP2rc9+ycN
         ya7RbF2PAkUYIydpMeXFuGsT9GcrYqZ41xWGAnxV4h5X4Z7QNMzu14Js1qYwOJhgcyLd
         01XaY6P8PTrNqPaBH7qrza5SoNw9Fj4ZF0p5R+Va8c+ADVzHiV0hDw3QDgkihkz5QAVr
         IR0q++Yk9kriqRIT+yTW9CXvie45RqmyMlclXcsGV/5nSXZch2kwjkzX0sWAinBE7cU9
         2oujajnRXRSo0nqjdPMuxcMM0WtSmwOsf/txWIrtaO3pkb/ln328gNMdD03aB3ycL7jf
         +hYw==
X-Forwarded-Encrypted: i=1; AHgh+RrJz+5iEyIIBflkwBSuNC9zWt0RJu99rI2/BYSY5a61GoPVqviLUJ8h8zv4c2K7vofAoGqAft4+rxK3oxk=@vger.kernel.org
X-Gm-Message-State: AFuF++ley33sjP4hzmDKsaGgtQ/Jb0VyDJSveA6KGHh5cHP8jgYGkWoE
	s1gDO+3P+SQ9g8FdaTJgW/N2oz0Ea3TyNqEjN3TiKCiv9EbOsGSJ7Wd1ieLY5mV2mCu0CBiUvMf
	jnRX7v/JsvpBoGlakpJFmPO/o1wxYPIGhMJsaWPLfyDnkitEZImYz/9QfKKwLV8DMhWcDE6g+rB
	4=
X-Gm-Gg: AR+sD12CZ+wsCj9x4GRZqYl7FOWvUe0jcShTNJdTAyCrlI5uIDE9akY4MF3WTWwHb+y
	hkL52OIzu9Urj2uX0TwjBLhA5W+GCWWD0zdR1Kh00QFVU2b196VlEsdovOrFWke8Ncq4Oy9YAyV
	SX48aYCxvG8S3MdNxZmMJ8tScyV3u7VtBYeTVL3nObI0IT+LBn+3IMeZGJLGxOW9lCItqsOuep5
	PU5EVR0WZcvAE6tAGzJhEfyMKOkXqtbyU9MHeCWkrw3snfhH6479iT4oL2TxKDgFz0PqZG9zP16
	lL2iBBJbCWabh2uNVMRyMoiPx3B4gaL1ZezO7aPZT6kiODArdcF4C1lqrAcFfB0OToG42/NTOnI
	bEPF8WILAImd9nHyUJpQLejya
X-Received: by 2002:a05:6102:3166:b0:783:73ba:7df6 with SMTP id ada2fe7eead31-78373ba9fd5mr278613137.1.1787750273435;
        Wed, 26 Aug 2026 06:17:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3166:b0:783:73ba:7df6 with SMTP id ada2fe7eead31-78373ba9fd5mr278603137.1.1787750272973;
        Wed, 26 Aug 2026 06:17:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b235csm376838866b.44.2026.08.26.06.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:17:51 -0700 (PDT)
Message-ID: <0d493aed-acb5-4905-83a2-6dbd6349cb49@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
 <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
 <ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX9VGf1TkO/3Ed
 uXHQSolEg2lA0Ls7TCGnDXMrL7hZF94O/gLvQvoYHoivAJOF3E6AOGpmuNU+3pSLcskJBG/Hk+M
 YKZ4i+F+8uhjY6qwTQEY9apU+3sbK/g=
X-Proofpoint-ORIG-GUID: 9ASKD7GYypQsPf341erA_GCc0rbYEVuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX5barGukpIhLK
 dxd0fAKqFuYwRn82I3yHxQRPaU0hiA4Jjf99GJJqcYZkfo/m5/oZiYjnWhNyocJ/70Nt6tHJFPP
 BO1c3MXGXQ9iPQK/PCsoLPSnv2UeOqDkkP+PbmpOidXGUx+0V3U10kd+hIIArw4xE7giuHk53ue
 8CUHYgTrqSnVh+KSsTY3DzFbEqHOODLdTlsJ9I23ss7mIKTNKICftvFh81M6u5VCE5nzKtufZ8W
 hoTg87fsA1y+Bzcf9C9aOX7FSzkPZ+fv4Gs4hwgXX4oXgqq+U8PWsyefZqpcbygULochYEQOW9B
 CYu5FwtDKQak6MTVH5xbGfeFve+OcpS0Tfx/14jTfMb21bla3tqa8FDvRhmN01Q0TlgcswifZBS
 DjZxMWQ1eaJ9GvCIF20wuMJlkRs3JgwlxiOSd5/FkCmvT1NUa0n5gm83ZPWrVbt9k9CvcFgHrZa
 8rT6tBtrk9slr7i5yjA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ee784 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P5qJYf1CprfF32mA9rkA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 9ASKD7GYypQsPf341erA_GCc0rbYEVuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260110

On 8/26/26 3:14 PM, Shawn Guo wrote:
> On Wed, Aug 26, 2026 at 03:04:33PM +0200, Konrad Dybcio wrote:
>> On 8/26/26 12:27 PM, Shawn Guo wrote:
>>> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>>
>>> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
>>> table. Nord supplies the NSP memory rail from this dedicated resource
>>> rather than from the shared MX rail, so consumers need it exposed as its
>>> own power domain.
>>>
>>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>> ---
>>>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
>>> index 96e4bd2f5a14..717c44d1c39a 100644
>>> --- a/drivers/pmdomain/qcom/rpmhpd.c
>>> +++ b/drivers/pmdomain/qcom/rpmhpd.c
>>> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>>>  	.res_name = "mxc.lvl",
>>>  };
>>>  
>>> +static struct rpmhpd nmxc = {
>>> +	.pd = { .name = "nmxc", },
>>> +	.res_name = "nmxc.lvl",
>>
>> The commandDB sources suggest this shouls be nspmxc.lvl instead..
>>
>> Can you dump /sys/kernel/debug/cmd-db?
> 
> root@qcom-armv8a:~# cat /sys/kernel/debug/cmd-db

[...]

> 0x300a0: nsp3.lvl [00 00 01 00 c0 00 00 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x300a4: nsp3.tmr
> 0x300b0: nmxc.lvl [00 00 10 00 c0 00 00 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 0x300b4: nmxc.tmr

Alright then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
