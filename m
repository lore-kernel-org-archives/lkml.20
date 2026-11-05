Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856807;
	b=pZ71uqlVvwaPMnwP72QwJpcXYwfCWXh2YOzbvVWVjg+J07o7n1YH96yrsdYksEQ9hcPm
	 c+UAl8hH4XePwtm9wzenYaW7nzP7gXUAYetbJUPx43cG8bmarK7YBgI3EYMDr8n7/2oaI
	 DhJvkWEF4O+G4ejX4Lv3l8irXMoEFqJYmIqnIph6xVUHIcnsRfYRo92hbdKN4ZA3mZtKq
	 5TpLjQKPhip+28okgTJCTzuxyJCjGQu4RSzmUpw5bvdhez1ault5wGPTWeqc+0z1FK9lt
	 2Fz0drvvbo1ayvVzOYEuVdiOT3IlohxFdCBrR3hxoG4LTtC/htmIk/LBxrDT+s/VXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=;
	b=js5RXgRI+fBC0pBnR1jGSGGiNGWRd8c7l2B7i6u+9ArtKd8atLnzZH5o50PS5etOb/Bg
	 amOGOfqRGwqSeETt5Si8rZ8/3uLF0TBp7usjNndLmOr/48IxVhRzty435zBgm/4EfPqOl
	 pbWf4CQ2jOIiIFvJwNcvPCAq6VZSet6UQuJ3pznSLn6k2zEhCtafzc+yujphYy9f0SbTV
	 2IWwid2j6jGTgeNtlbvDQXzA27rk+UyKRkrYjDzgADkYlZI3zeUS2R0VtKFrxtyo3DPAJ
	 vQDs1PBlYLIF0wDnlJ43Xq35RWjsXoUEzugrTl3MvpYKezB2EKvbv7jvpKXZIXdk84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEyKhNh4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5abHxnb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD13606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD13606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEyKhNh4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5abHxnb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oYn52339828
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 05:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=; b=VEyKhNh4XXvkgpDi
	OMY2Y+5ggSH1HM5rU4kWJvRos5uJxhl/RN4lJr52oZyv8/3b8UEtB4BwqGUafpyk
	1eutvG83UEqM2gScVG4kmNznp5PVhqbzgt5QKY6Pk80q7NhBTkWy8+R2RN2INifm
	g1gG87ueC1DtSMDD+5qzQWNyGRbyi7J2Dtcvv+u7g0Ki0ISj6YYV1Q8p3G6jRSPz
	9pY/6T6RMFQtDnQ+FctTMVy4H9OxY83zAfkvXZwpXX7t+xpZ7WW0tqD6BE2nass5
	+KuASWtbBJ7zFmT/7m0UWSSijVWPpPGKxO2LTBPBxRaTWEpxBp9LaEsBleP+er26
	2oZEwA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r844nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:33:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1892778eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793856805; x=1794461605; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=;
        b=L5abHxnbDd8SsTyHgMh5VAaOU8GbYOjmmrjIad9gINHFXB+OLBkmKmf3iWKW2ib3t5
         3WdPsH4mV5+nsjX0v+8pMp2776olDA/IErVHuGOYnyzWY5RFqWgAC6uiYy4R/S7ev9cw
         /GtvFZxyHLbICIQdfWaSf+2+IyKo3A7mgIS+YwtCcrrKz812j4A9z5yyHCGd085F/naZ
         2k9h1uXJeAfJfKz/76qVh2MRnUnWsq/xi8lE41mI/O97dITtF3Uoab8AHLvJf89l2Gy2
         OPSC3CD+zdLnITSpPConqCYMSQzZKhUbO4DI/nbQbd2FWTJ2NcFr/1ZlLTz1e6I/ZRkN
         JsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856805; x=1794461605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mnfDP717xLwdYJ0ae4AGWYEs+tKg8ErO9fE7F09ythk=;
        b=tXE6j9coUXHF+f98cTIIio/Tmn+lz/qXNUQnIqqKKKpGD8xIogvy/PnRVjc1ATVplv
         tQ2dDN1MmWWQTC5jOKIQer77eml/H0zqeL7Pwe8XaI2hFuw47jsGvw5DLw3ya9UoWnsl
         +AT7sJn06vZZZm3+603oK3ZSkFLnw3MZcEyVPwCwQZAMPQZmRVWdlgyH5ayRTs2/mXCQ
         ei2zTtcZGNNE3PztHcwZ1XctBFSe4LA9AfY6WE1qyClBojtx6M55psOovPG8hHoBisGm
         zBGhDWeSR6lqhAaPxXfYDBdawZkX4r2GoUUmVsw5WZHLGCcD71LoXhZ9v7ea3y3+2yMk
         zaLg==
X-Gm-Message-State: APuU4Z/rcIwWonkvXKr5H9kywY2yXK10tnefK4fsDWN4zt6v4L8YMxRO
	rXUCD5RddWCWqmn6KaQJ6K10Jcapd3vA2GeAP5yvIpRusaXeFrK8VLqajnf+DYzz7hNjdgNZD2g
	dDRVZW2a7O/Z3igMwOu+y6ENg5gTIvDpNpwZG5E6///b+K05XwiM6O7NayPUwv2TVLQI=
X-Gm-Gg: AYBFou3xiJRs2h7st7tK9eJ0Szkqr3O26Uehy4o417/A2ClCUxUNALwLu7mtfs7cKoA
	7rdySJPPNzugKWVrA870wFGX9Uzr7nUKfOCHeughyNterwAieq7frDQl4dJhTBlCFNouU36ufZ2
	BZdKcbxGJH9VOUMB5ir9hHBtqFwtUzN5NhTPmlEHBI3Z6b3z2cd4vM8V5lkwNc1qBlYeB+dySjo
	sFXvfeCJD0nE4iwLtBkIvsF2fZBgEP5489PcC6NaUAx3xlklO8gQ8DLLDyH+RaSKkmKTAODxWyn
	cTcr0sbWWDA/VLGXEJmXaMz6cQHRWkY4UqYLf+hk4BF0eoGZelxojpDPDCSF9XmtAYWKrBMtHFY
	wTxcDciBoIPFh/bMQVgVMjOpq7tf9Vg1v+rDJ+UHd3rnpd10wvJSbIX5qU/iKhC3NSYYp3qA0Ya
	wm+1JjYGUpgmesp1EKvCGLCSmQTsiZPGUfD/KCeXaw0f/K2KET7AjjtRtkO2ONuaq9KYDiPK/E
X-Received: by 2002:a05:7301:db8a:b0:36d:394d:e690 with SMTP id 5a478bee46e88-36d395d342amr3970072eec.40.1793856804897;
        Wed, 04 Nov 2026 21:33:24 -0800 (PST)
X-Received: by 2002:a05:7301:db8a:b0:36d:394d:e690 with SMTP id 5a478bee46e88-36d395d342amr3970038eec.40.1793856804160;
        Wed, 04 Nov 2026 21:33:24 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm12148541eec.15.2026.11.04.21.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:33:23 -0800 (PST)
Date: Thu, 5 Nov 2026 11:03:16 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, qingfang.deng@linux.dev,
        shuah@kernel.org, thecharlesjenkins@gmail.com,
        cp0613@linux.alibaba.com
Subject: Re: [PATCH v7 7/8] perf tests: add noinline to __test_function
Message-ID: <auwVHAC4iPfdXD4c@hu-himchau-blr.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
 <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
 <CADRr4bctCf-7xBER1G2vqtQm2Nda+h222UzYShMQXw+rtBwPzA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADRr4bctCf-7xBER1G2vqtQm2Nda+h222UzYShMQXw+rtBwPzA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: kfd7F5hPa48_wrG-fuCcVFBcQCX6sest
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfXzh204+8/MPmG
 KlCScvFTTc6+7QFBF4780Bu53E6eJjm/GMlE9yxhWgvA1ATyiePCGy9YRprcmxs4zOH17N8DNEe
 3kwasnRSFMUt4Tgn1AHeUIK5V7MAVd2TrkMKIJ7kZP2b0qemVJ6hfiFgaMhZ7LdgHbpCewv0yCa
 R8uq2r7QGg4AJMrDnDY5sHUEvLvZL7LTVU+YWJ3T+gzZv8UedwF4G7wcMj/8JWkGGsKUGuJLu4T
 9AsGe7abqn61xrTM7a+IXw9Kuf2iTYXFvtnuOY/6EoyXOORYcXWhpCKxUNdAcX3nTG7mo2JRRg9
 MRqg4mtIbh/Xyj+Vnk0eaZeXOlt4izzlZsu1f1J4N9MtGRmugKhrd/+Nh4e8exYZjqwpIdetDqm
 QzL+k0YvCf2yDDMf2XJ7NuyFckAckRywQv57LTqTQcH0Bs5Ac0VKHQanozj0rqq5FbbAQsooccU
 vV9If04NuaETDRl6YMA==
X-Proofpoint-GUID: kfd7F5hPa48_wrG-fuCcVFBcQCX6sest
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aec1526 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=3ntduUHgHJ2MHpqTwYcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfXwoplc63iD2l8
 uE5TMc2JLaPGk2YvbkqtqfA7hIqaUSYT94LjfGSpUHIxY0d8CGG/f3iiQlM3eB+bfCX/LE5WLHD
 NsMqtu9/y72KZa/nO5ml5asS8E6pTzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050021

On Tue, Oct 27, 2026 at 03:52:20PM -0400, Jesse Taube wrote:
> On Wed, Sep 30, 2026 at 2:40 AM Himanshu Chauhan
> <himanshu.chauhan@oss.qualcomm.com> wrote:
> >
> > In the breakpoint signal handler test, a breakpoint is set on
> > __test_function. Compiler may optimize and inline __test_function.
> > This causes failure in the test.
> >
> > Add noinline to __test_function so that it is not inlined.
> >
> > Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
> 
> I would resend this to the perf list and not in a patch set as it is a
> separate fix.
perf list is already in the To: list

Regards
Himanshu

> 
> There is also another fix to data_breakpoint.c‎ that i have been
> meaning to send here:
> https://github.com/Mr-Bossman/linux/commit/db4faa52a66f6b7265cd397a2d44d7d38c3fdfb7
> 
> Thanks,
> Jesse Taube
> > ---
> >  tools/perf/tests/bp_signal.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
> > index f580ba7486b1..cc4a27224884 100644
> > --- a/tools/perf/tests/bp_signal.c
> > +++ b/tools/perf/tests/bp_signal.c
> > @@ -54,7 +54,7 @@ asm (
> >         "ret\n"
> >         ".popsection\n");
> >  #else
> > -static void __test_function(volatile long *ptr)
> > +static noinline void __test_function(volatile long *ptr)
> >  {
> >         *ptr = 0x1234;
> >  }
> > --
> > 2.43.0
> >
> 
