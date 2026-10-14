Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69778286D60
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988604; cv=none; b=RhuAE/Sl3FJrU5AfBtRK+dR4UNPQIjqdD01osqiF+z18O3b2s2BxEU7uGSqYNB5+lmK2bOulKCH8DOyuCEQpLZsym9GMQv20Ck4Zk38VORi9i8BlLU8Q3LQhk6orhlNPZgizrUqqphNesxuBhZIJidAPhToCQFiEGTkQvVTPcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988604; c=relaxed/simple;
	bh=vcKFUlMHhzb4aWhwKFgdD+usZHVbdciqtOJ1LMttT9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAkJ4hbS0zTFVdOyPDMLx3t1SOTBQKLdvxYEjoijJa222fSMTMrojiZMkt9r1hvsj/YIu24v1tTm8AOMQKdIipTLWkewdhDkgCZ/X3gKKw/OkDiNehG09W1YxHiAFsyG7fQuq2YvtJVsvPg2+BZ4HCg8cag6wMaE0PU/EnONyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGrn/8JY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuCZLcgH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGrn/8JY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuCZLcgH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ED7f032874770
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=; b=MGrn/8JY+3+qM2Gp
	T6czweznP6UkfQEiIZ2PHZWPsTiKPScMY/h53E2AuZVqUsuJOGuqwfL1bMO+1pP9
	YFzowEAcrVf1+p8KfYLhe41CFdR6Ff2wM3daFNRx6dEIQEYDLpqsmQm3eEF5V/lX
	8R3GwYVoe3AopBWl3i7U8DlBhRHL4zPjiwdzwG4J9MC11QmFFFi6hmKBoujoMaBL
	idQcLCjzHKVmHErLw46/7mLBWXvurW0puBpr2S85j0ot7F3ZFONo5wJBx8pHUMlB
	ymTWbND1uofE73G4gm4Unk5Lmy4eWD/oh9XZQz2xFOwLWFhw48VfElZMVGukx6XI
	rUSbaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphk1r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:36:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so53897885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988602; x=1792593402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=AuCZLcgHNVp06LHfInZJSRQIWOjhks+TH2Dgau/fYgXC6tRQm4/kHPylTEcEUgbYWq
         IUrqAUB88DkaSZt8IUBONMUHezdbDakMawhiob/UVkIMFUtot4XvMkatJAC8iXmIoLxx
         5zpnCN2JS2MatWql5YHQ05XjjZ5eQ56VMh1O63AW9jUmYsTR31YonFqPeoYkHgsXR1qF
         mPpouvDwRhBkiABsEzV5zhqFe0nK81JafYww3IaVrLtufAKKyCp6vdK+iawtp5ZRQGcK
         gMbU0x9XsGzFtZDLCu5i9I4PVdA1wNB4zHVHaojroEHG7wW+myCzTUe4crkvBcmLSPcB
         4D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988602; x=1792593402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=asDJ/egQw0a1j+QGba7Yl7/EhRm9uoAqj51C4IGHZVDVwlIoPFd8IhhUGpZv044vSo
         ZRSx7r34fEyO8LuiRTe3mAypZ6ig/+ElmPInWwD4WLKUcwhrlYJton0EeD3l1oCiMXTE
         qJK3lGLw5F2lCUav5bbPLBJgCGKbqwZWhgqQSTKkeiXQuCWFWVR+6R+2D4VAFuB7zXxT
         asiZHjGjxn/5zTH64+tbZP5WoKgu10Dbzrb0u2l+Cy0tSmfoNMmUswtobBtHIJ23HqGN
         2d29wOOP+vK4U6hQeOeNmcUUeZIJ2IRzsAb3nxdff84YZDW8MIffqjKfgWXEeXkWy9Ms
         /J7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6XXrbLbvB2bLg6zFaVGPKACq/11RbnIA43e0YqymIsuCMSiU2GAq05hyW31L8NAQbihr/XvvM1IakD2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWd12JR6r9GpMjSj0CaQS+NOP6HbHVZ2tOVYxbPmVBvIBvIDWQ
	dsUMY657lroboxJG5nGoj4/26lL/OkHfM9b1KFuD3pjP0wlQHlgBxQ8NkvDxIeKd5jlfcq1irSh
	6R6XgeJxekJ0S3Z8mTm2I4BkD1dHjqIRsa3B4NEisN7DfTFS4pAnntT/tLVUt/Z7PLis=
X-Gm-Gg: AYBFou0yGpP8iYsQhZZDGc4Ls/cpZc1BeJ0BYSUTxgvjN+lOebF0ejU+5kKCU6kjvyk
	zAwG+ZqkTdh0e2N/ZGiQMlvsT5+uqPKTMdAXoTyiPk4STLzBmiMYIKyKJd8+m+qUto8M2O5Gh9R
	CkoXsmXB+BzAOr1mGNH0jLGKTBTYOwSgiiyKcpPeXdUsqKFS2pQfDMtyAcH6NnLxvwNhv4tKaXy
	RUbC3b6VACikhblts0wz5XtOHuivNS7Yw1rgnM2AYfUvWI1CdC21w3T0frgQcGeW5Nd5qPyj4Lx
	IdZdFd5K4iEYA9oTOGV87P7rR8Dprk1xBlUW2/4hkUbzN4LQmx82UXIJbO/KUqVNtnu4RY1CHY5
	6w9yDOLJaKViIP1k8tsU2OQ==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793508685a.2.1791988601713;
        Wed, 14 Oct 2026 07:36:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793490485a.2.1791988600134;
        Wed, 14 Oct 2026 07:36:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf06e3sm361049766b.33.2026.10.14.07.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:36:38 -0700 (PDT)
Message-ID: <a8bdf3fc-7da9-4017-b61a-5b4f605ae0a4@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
 <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
 <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 50MlvIGshEck7oEUByHT18sefuY_4nUF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX0WSTY79JgNLd
 73HvcaRzfyFkMZDn5ynyBjPcX/i+XKq3SV5YQcCMiRuAp0M1/rMO/0LBC6xNkNvrlonWW2EZIwt
 txOr3y+QiQBPmvoGH68wLYre4FZNCKY=
X-Proofpoint-ORIG-GUID: 50MlvIGshEck7oEUByHT18sefuY_4nUF
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf937a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JPrUV6RX21cUErznEBYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX9WJTNUfq8Tlu
 OKMMc945tI7uIaxF7NWav7fUfQzCe93neU/YKqH44rVHkYnfRoxKd4KXEueIMMtD7FXEOF+8894
 J5Zu6c2RRnJaza8VgFm1dx3vVfN/TMMFxBw8pC0EJhh/6+cNyjDmC0OdQEmSm4ViTnp94FAkamB
 /8KlrHPaealOHNXKhMlVHGdWL2V0Tyxuc1DC0s6BqEZOz8TNXLj3CV5E08kBY15PoDgikWi1nTO
 noCZp3l8DvYirvxwHhp/XwGo9RsgHMD7BWy7MI/BTnmmuRSCIuiy9m6CWpRyexr1h1OtJ0VAJhv
 ijQPJV+IhFxo3j6z2LL2SZEpKZcg7561RiWFhTsCgXK/4bDBdN49jrHvRLnHMMyslVqpk0L2nex
 QmomV4y98y/E+FdpzcwTAMe4ehnUi89GsvPNmj4s/JnRWJTrsFquzufegPY7itjPVWHUAVZk/AU
 MG8JRKG/825aS9/Qt2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140058

On 10/14/26 4:34 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:20:54PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Clock controller power-domain attachments currently become parents of all
>>>> top-level GDSCs exported by that controller. This conflates resources
>>>> needed to access or operate the controller with actual power-collapse
>>>> hierarchy.
>>>>
>>>> Allow callers of gdsc_register() to suppress parents inferred from the
>>>> controller device and its attached domain list.
>>>
>>> I think, each GDSC has a parent (in the hardware). If we don't represent
>>> it in practice, we likely need to fix that.
>>
>> The next patch allows setting a precise set of parents instead. Perhaps
>> this commit message could be improved.
> 
> Or the commits needs to be squashed / reverted. I really don't think
> that we should have a parent-less GDSC.

FWIW this commit alone is a NOP.

Konrad
