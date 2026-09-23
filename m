Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884B53A3A5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178143; cv=none; b=DvOLE6jQjrWwHZvvdpB3T2bA+ZwpgeLfWdbaMF23xMsESLkzy0muGeV/r4MyjC+CsiT1oxzt5I+H38nnJFqs5yCzsFPwZluh51lj6XiDKUTLvEQt+23sNYMXyNRduNxA2zC2e1pojqgQCNbhVNlfqyvNir85RvxtU+VSVSQKzGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178143; c=relaxed/simple;
	bh=m4SroQDjW8TNwKldqJ7a93glAT68I1794bo+GHS0J6c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=uyuJpdRHzk/aiitWW/gtd0/xtW/QytuqXF90wP4DAW9wqc509pZAUMUucwoLuMMuJ4Kc7zFVZDPWFQf+SL4YLxsrLZKdgLbIUQan3kRGLNOBzeJDcyeHz4b8REVe4HMa6Cfwko30YB3zOncYlSUm3y8XdYCkfBSKWlsq1O6MnnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHOVjEwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLbSx1nf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHOVjEwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLbSx1nf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBba4e3295729
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=; b=jHOVjEwh4O5Fd5TV
	s1O4AgA/k83pSLHZXHr4MCtkqPzjalzaR8gQnJeLLql8C+fZtkxV5fSBROrqZowY
	cn+WqQCfLkPs+qAkMBFHpsXVb4suhO0wkNo5plb4HeT3ekACo8kX5EkTKwTcRaD7
	i27vMDQbe9PEwDgFw2ya9MQLbOzGboRY7T53860rPRLuEMLzPHzLguhtRTO7zp5N
	/fQIW77qNgZ1zdmnlCoqOfSckoEUM7WVxtkKUyTejkRA9dHpV9udyaVR7bBs3Vb1
	XVCpdlCsR41bs8ksQZKG1mmZtcgwtI+Ev7GECaO1PCmZB47sPGE1z0db2gDkcZcc
	5H1h8A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9mxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:42:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8d95121cso296784241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790178139; x=1790782939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=PLbSx1nfhVVprFKkywx1UnzjUee7xJQH/VSz2BKXwoWNZivOrfFY/sIZzfHa0vej2F
         uh6ZPQthNzlm26RveBfGPorChNCOeLcSzsFdp75dmS7W5d4DtEEBZpqrIM0kzmxZ7wx4
         53Kx9DlbC9ln+5O5tW1r7g9b5CvD0yGAlz9KBv4aE9kC0poDh1QOyUKZtkNULnhL03KG
         gacvLQ8QsO/nYn2e/pTN58pI2CE7rEeXw3uF5xYIX/CWUUQM62uWIFbVPtsA25CcbDbJ
         sEIVkHbJ/Bbe+q0CjodqL02teNZs2waX2twWjXLHSk6N2TyPuz2wba9GgQOwxDVn7+Gw
         r+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178139; x=1790782939;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=t2IEVFevufUtTAKqFWxg2PbTdEtvM5WPAX3d5mjJGP4IW7yWOKFwA3XLiJvmGkPM5f
         Rgs2+yI+4kwoH3M/axq/LXaOV65kShhZaiYOSRe4GrsvEsuC3h3cRMCBtv5r01ZBvZSc
         KlFWH3di4Dvy3uXQlefkULlvyGS1qWzr1LQhknp0SLKVTDMJLuHFUuyq0diam+sGIk7p
         kDLG0vIMQgRngI+jMnpEq4L+f/R8C+r4maA/CzNAWNPFEs2tBCLR0WD9FI2rkB/1hYpd
         NvhTRTriWtiR+l6UfJi+KrPImQlbaWZzmXwtltE4xsUEkYsULefZjvUZ+SQFq8CnpOti
         PHBg==
X-Forwarded-Encrypted: i=1; AKwUvBwR+iThHNyjgB/fuUEXSvFub2z10Im527/DIvduI+TcBrvy08uapPUgerSiUYlRYc7A9iuRITLA9dnrjyk=@vger.kernel.org
X-Gm-Message-State: AFuF++ntfZ4V/pXXcEIU/i2EkBCyqxb5fugfheSZvfk+opyu2uNr0ixF
	F2oHeCXRPwdEYYD9pFOsbDLFsohxTE20ECoSINxcd+5dhf7sW/kluRQXydxf+UZtjId/BR11SX2
	R00joDhEl1dJw3twHV+FWWQsaqJNRU0F/KwLGzFyt1/+KKLw8CsWh+4ONSzbz50WANlY=
X-Gm-Gg: AYBFou2WBJcTsJGPlmReOm+H1Ib5t/DNhPdLQC2Lem6XYCOd5F1DTvVfuuhK09QS0//
	+OBnxBiQWLB8Zi4neQLUk3KGMxGgXDyyHu0YKUUoeN5ivsVMo8nB75esqLkMfpknWNCENJRB7nF
	UxFPJnay3dbUWkVih9tf00vx8+8X+WO+GsspgNjfgLyySOkmumwNWbwyidwjlpWdzQigqyG2n13
	3aOPg0EtCty2elQo1FYpyCjOUxyzlQen/SRC64KCSEvJ1cXokHls++6byduDEfNOcAQAInt3+fE
	NzE8QlIEvrpL9vJSreemHMlLP5/LYhbf8MjAL5UpcLfth8ivjrPfNITeDxbPc7Ieuv/jNclTS1z
	wc/XXvqAkCirSeO+gJIFyhxSKY9UiH5/1UyAQn4lB5DTykTfYKYJGjsOwFG/OUt01FEGdm4rLUy
	Y4CYCpZLMfKNuIoqxVMhqBKOWlmnSTYFu9icPXxDdHCK2pIOZNDzcR2plShwQM+GoNAQ==
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601061137.18.1790178137723;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601039137.18.1790178137281;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6022sm144907666b.14.2026.09.23.08.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:42:16 -0700 (PDT)
Message-ID: <839b884b-9db0-4215-9715-40549d1c6a26@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX6ea/MnGtdcNC
 xy90oHoe4VZc0PvWTQGsLCIvjuoj0P/sTch6mrHnsw/xGfiV1SDQJnC6d7uBP9ljnEk9nUPaXEz
 An+3mF6O99v8C6gPuib3TX1CaDq3h44=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3f35c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: Sgzei7dU6NAscGnSYvac1IwxWfzomhMu
X-Proofpoint-ORIG-GUID: Sgzei7dU6NAscGnSYvac1IwxWfzomhMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfXxoYoK2gHgS2M
 ETTyvVIoKuVSFiZdZy+kHPG9XAZlfpddQSGKoue0CrSNjhGltamnRVzeOcb+vWsGrZa93kd+yHx
 KUMQNP26TBFPYWJj87PzF7e5bul1F4OT3HDVvVb3IEYIhRvqqzkMzHSJ8H+1m2zS839yPfeae+Y
 mD3iFKIEOSr+cxZs6ol651Y7B80EYq2oUDuYWDsy1r8tZRd5OGUUAxAbucSLBTvisqc9rmlZ5fF
 BhUg8fwInlNdOU+i+pUQtBgnLFKvUumeX8NlxuCuQYk3DeqioCl6YGSyy+GCLOqOpG216P/4kwr
 Kp883Ila6ebg8cljQK790Y9RkVXaMUED4K9rKV34JJEZW2eN3pIrrl9ZvRQhf+1owyubB+watTk
 0pY/3iPWX5G31cNFERadI8puYTOOCxJZwWztTkZs0r9p/U5ZhjoPZyAtUFBYu+7Ym9u+oMOx3mw
 807t/98JuItmSdVpreg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

I've given your for-next/scmi/updates branch a test run and
the scmi-cpufreq module autuloads correctly, so everything is looking
good from my pov.

Regards,

Hans

