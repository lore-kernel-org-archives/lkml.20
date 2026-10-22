Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639627;
	b=37RUGW5ZONX7I2Oyfs0ANWeIykbKlR24FqrguvbvJgGWpqkPS7FP3a2LMjdfc3Y3Z//N
	 sGUCIdIRgPBYjeh87Y2IDu1Z0rMJu98GErUrQqZNWRWuiLY7pqFJrAqywhQnl643/L/Y0
	 x1tE9ryuBB22RvppiZ3Rpq7ZpsnAv34ETWch4DeawgoUt1GsgmjCh2HbgboC6YA0iqLNk
	 Xk1k0mzE32Bv/PJ7V2+4nDrf3hKzTkpoV9d3Lq0RK+LzE22aXHGgc67kjM25vBVikgKa4
	 NtyscXrxF63OzcY7G77tP3alf9J+Zdz2D5RFuXn/3k5tJI6udkCQ6wMf80kJOTI2fHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
	b=L8kI8YmkO7mkWDv7GeNkSsjtH0cWkK0a9eeKnzLDY7vabZ+Or1D+mWCSDMNlzV8ujlRh
	 FdVkOAjsMpOsHvXx74fDxCOQqMn9lg+ErvghkYPOx4Qy2R4ShPIbiBXm6DxhNja4cuT4J
	 wXyHatYDBsNF0IrUjZOag9T/lV93mPG9p0gn6zyVlBXZIsMY8DI86aFfcvAJuTu7F/m9j
	 aJq01J+VKIrQu8twdk1pgptJ4yHgDz2T1NmLaRCc2xQlN4TIEOtK40NrQa8Kcog9kRCYH
	 PDC31UIf7fbkOSbTHjX6hp1kWiK/3784hKXI3NydPeJ3ehdLKw64aoJdN/kn4lCjphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phO3eKgp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pii21JKO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D59606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phO3eKgp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pii21JKO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1j5e12900648
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGmZmli6XEiqC9WcTdozsjPu
	YlwvOxi9MxEGhwdmAzI=; b=phO3eKgpY/wp9HeFoWPJLOFWRlM1OzwTbpzxGa2u
	lNdCkKoH1oLccrWYbrruuN+KYF774iz+2skToZakXZlWL/ctzgyQMGk9U5oF3oJU
	O2GLjwTQPqt+AzSw9XzdCFt2HswSRw4IBawDZsbP8428R6JF9umjqsdJkCfnOvXr
	KH0ajGUv8//6uFi4kFUKRVCjOzIQE0wlEgdQy79898jtm0jYo2B/qwU8uNHVJm6Y
	LSLKB+Ql6HEsgqTZ70Junp+ueEogCKCeZ4bjTwQsTik89CjlzmroNHMIooqG0ZCC
	Z6UGMMk4/TOeaFviVlwV1B/pAcHZSULKPspIq1pcCf9Hpg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c8dyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:27:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3316105eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792639624; x=1793244424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
        b=Pii21JKOA+7a1HFfCqBwn8A9fxtGhIyIYBlnAkjSixur7eOmG1Boe2Dx6n+x2etO51
         gw9wHCkXHa8w0YQlZtjbBUn1M+grXwIj/sEhKWmPBylGWb8wsaCXGx5wt5MtpAcnhQWb
         X6meJnMrJH93+VKhZuHSK4+DOFNths3jMrdVIy43sT2bIdCJCL90QpyiLFmXiWxX7WYU
         vQ2IhOD7bVyK1lCG4+wqpVXK6dMeuMHWpDDfxdY3K59HwjGCXtO7SfCIPOeFqs6SlhsF
         msmIrprEE0h1APBvl5ljs+0SL0ngEuuV+96XDBQMbIbpMHc81Ac+k0kki+iU9wKcwGn2
         TSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639624; x=1793244424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
        b=hzTt4zmKHGKmDQI7uNm2+UPgVpHvLmVNFm58vripuWQqHJElXNcpoyEo+3I/K6U2Av
         NkgxEbgoFPUtY+6W6J9wvaSdFb5gV+q+sFW6btBuoE1vrXHcMGqgazqCZaoc1qb0MrUt
         ff52qMR2WCtkbQsFzCg9TI4u98U6Ai19jdLJ+k2L5IoWKB/KYVcz5i0xfKE1DBRDNhP7
         WfHhW6Kbe4NnhfCnMdBT8gB6FD7ocdz+4oOnl73tILesaXG1/pq5Yzvy6Wse4XJAq6ci
         LY7yW2FKJM9UJRQST6OYwt8fwVuSaG+yPQazWEIMuGorntmI5hLpfQozkmhh/oZYMp85
         HiuA==
X-Forwarded-Encrypted: i=1; AKwUvBxAnxIanL0sT0jo/y+y8GiG+/iEzIVZsY9NH4mvLz1pv4KA51MkKGafx+y0THrhWk5w3fThiwo00a7PvCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCE/+CAWkK5NY4NkZe4T0Q+OpdetfsJzFEYMMpsbMoorWNv3cI
	EGdI7GhODg5J11D4Sx/VK4fJPJLUtb1zA0e5J37UKyiZtcSrTz+axtdgDuOz5em5yS/Y3pn8N4u
	Vw3k/ZzSVx/M+ZEpeIV8YqNCvTsqIgTSPQU2z97kr2oykoKROGCDIP/ls9cW8b67VQ+M=
X-Gm-Gg: AYBFou201Xq+jClJV1dQGnNR63qzED2KxX5KYjajUX50aY+pvaKtRA3OOGuzKaqSmJP
	agpK9yp100Xmi1QY+7LWjPWZHHvsA3YHNyZOdNrBOtLmzz/EoNcY01ccHjk5HR4MUJy19yAMUEM
	HCSanpKbjzDdxc4lLBkRTCi4/ayk7g5mnaM/+gExPqHr+/pwM6ddD/HKJbHaUD3t69Pn2D8/xCl
	bdnnS4FvBAuT+AQ6VgL16uSCloFzQGmuaX6PsXX44KcRM/UrnafVu8VHkYoOBQb88tVVVAk5oAX
	gStwJvygWKCf2mh99GQLngqJu98CrTmi6IUzHE6ll/W9VsrcF2Z5k1hG9bWzsAYhFYGY3QQA0nh
	45dhbtN00989iQiqaZ7g2YH3tOfXt9V5MTM/r10hIKzMbWVI0
X-Received: by 2002:a05:693c:8803:10b0:368:8ab7:2a4c with SMTP id 5a478bee46e88-3688ab72b28mr1840511eec.30.1792639624390;
        Wed, 21 Oct 2026 20:27:04 -0700 (PDT)
X-Received: by 2002:a05:693c:8803:10b0:368:8ab7:2a4c with SMTP id 5a478bee46e88-3688ab72b28mr1840490eec.30.1792639623830;
        Wed, 21 Oct 2026 20:27:03 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm17373764eec.24.2026.10.21.20.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:27:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:27:00 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: fabricioakio@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a
 host with wakeup
Message-ID: <atmChJYMtjPtW_ZE@hu-petche-lv.qualcomm.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
 <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMyBTYWx0ZWRfXwEwkM1N1q8sh
 46OXM5SdcA75HoY738LcrsEnjLkemv5+g4F6/3lrtmUg/AZylDpUoHW4Rosp23AjgzxmU0E4eXT
 q1iY0aI4Uvdeb8LM+dzkOxtzQczb3yo=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad98289 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=QFNGBFAix9GFkXGs:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=uQVJHn5EHz_PyVhorDgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gulzeleEOOiRYBrUFfqAdv6fzX1h96dC
X-Proofpoint-ORIG-GUID: gulzeleEOOiRYBrUFfqAdv6fzX1h96dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMyBTYWx0ZWRfXzmsjXYkU/tf6
 yWkDKLYi1GfxGxKuYdKJFnTThf4pCqeCPZPlNLi99J+s78wcSJVDwTaydQutYASmD0FVNDv/DRl
 U3bZ6LKf8OnmChqEzCeyPictm1Kns22S3c9bplJjYk6VAdkHbGiEEgi4prffJdpTKd23VDW9uCW
 rEz3kUn/Jc/+RzDwUH3iLQR5464y2rOzzlDroiPMMtomnsVCtBNPRWBHBj1ftJaf1tugicnNODY
 mJhAMe6xK9BwF79y6DMUbZLo/z9oQgD4p8dgEQIScZAJW+lZIEGK9CraYYVCEtqpX6YKOpW5N5Y
 lO6Ou3k6lpFfjp0O4AY2wYwqzZOIOrBld+JIUGSiFFDPVvTQxC5F1cSDihcH+tAXgPNYz4uL1WU
 mvMVkYk84YMDh/Nsqk0dFxbL5FHcsVVh54JcxuMynXjeyTv0DuEuu0YdZrwC0/hsxgDwuT6sBPp
 HkhpS8LgEKuOZ0bW6gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220013

On 26-10-21 15:44:52, Konrad Dybcio wrote:
> On 9/28/26 8:16 PM, Fabricio Akio via B4 Relay wrote:
> > From: Fabricio Akio <fabricioakio@gmail.com>
> > 
> > In peripheral mode the core disconnects and powers the PHY off before
> > the glue suspends, so the link never enters L2 and every system
> > suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> > the one case that parks the PHY in L2.
> > 
> > Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> > ---
> 
> I think we should be able to retain the link in L2 in device
> mode too upon suspend, but that needs more plumbing on the
> clock/gdsc side? (+Cc)
> 

From what I see, dwc3 core just keeps gadget (device mode) disconnecting
when dwc3 core enters suspend. The reason is probably dwc3 core wakeup signal
(through .dwc3_gadget_wakeup or dwc3_gadget_func_wakeup) is send by software.
When the system has suspended, no software has run, so can't trigger wakeup.

For runtime suspend, current dwc3 core doesn't consider link suspend event
(eg, L2/U3) as low power event, and doesn't put dwc3 core entering runtime
suspend, so the link is always L2 or U3.

Thinh/Wesley, if I understand wrong, please correct me.

-- 

Thanks,
Peter Chen
