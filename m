Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910349;
	b=Vh5oio5YIh7GhnDi+p0X/tunTuUMV2KrO+81E4qH1dzXKJsinQXrVa0nXdtJzaTE2+zW
	 UzX207aHJaKlALb2XTiQ5In+rXXRmufJRxhhOiyV1PmYBPVr7TPMcfs6VuWbJfIvyxv/q
	 RXFAJNqr6fHRYGwbx2I/9QUoNVoZSDlO9vs6AViLEhveCtQhiBtz9bgA00t7tmQZPf/zd
	 0EbPGfL80o5qlnRU/cPPOWDnqRz/ev5MJTcJikWjD1OMWlPCfEPcVZrR7dmK9KwwkyB/N
	 aTNjHETUbxrmkG2sKVhMPOAcbuP511815iFj91gVZSq1Qgbdo5uC7QhxpFYgKRN9rjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=kn14ZXxDAPnsi1D1MdxQ+eGeMfE5jnb56rEFJ8sn5og=;
	b=tcUJu/jTvz9kQ1mSk8G5wHUw9CWcSBW3VhWokJhImUrZNXFug7JIPp1XbU/GANmSaXML
	 fYUeS0YDAvvRG8CaBYHCPbueRdxHduJbcpOsIBBxSRq/gtTF6GoyHj/5tymt0SEyuHRMp
	 acQa0TbMuHC8IKHO9hboDjgJD0bAgeaWWWF+IlXB786fhsLsUPIUyGbL8cO9dXYfQqThZ
	 QKOhRpFQqgHa4BjUTfc5MAI4bnrlPp5+9UHUYUj+cdmHqImojoy+MjzUqoviMsRCXxoUZ
	 TcCp6E9U/tujyWBLOpnyvNEYg5TYsaKx+Nga3g57wENPT1DYnUHwEtZJnO6H20s9mpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fb.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="hML8/8//";
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D954606A31A;
	Sun, 25 Oct 2026 06:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D954606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hML8/8//
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P6YQD1539422;
	Sat, 24 Oct 2026 23:38:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=kn14ZXxDAPnsi1D1MdxQ+eGeMfE5jnb56rEFJ
	8sn5og=; b=hML8/8//78BWV8Rz6gggLqj1CZEeqBmkFwsb/bXvDtDKjVonppAy1
	PwdMrVgMG1zw2mQnOSaD4nM356s1PNh/eiCJHaGYSpTcJ1LVGOloILwjoEjeBrnP
	HGcOibC7R295J5y4hXoTr9BjWDWSq7S5xM/GsISHcYKCfKXTzn0druz9WW3Cjq66
	eeaHbYoxF1KuhCGCjx53Rxv+BquLKRVOZdMXuE87NrE2wvbtqWHvs+Ht/hxNGkpC
	IawNBuYvu/xbEl2+8Xt1eGo3HxvcR/tYHTgQbVal3HKVKv0xzMUHcjvxEd1fMk5Q
	LZV5Lz/bWaUrc31RPZKnwbpmeAEA/1lHQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtg6b944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:38:49 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:38:48 +0000
From: Amir Ayupov <aaupov@fb.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
CC: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan
	<skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
Date: Sat, 24 Oct 2026 23:38:44 -0700
Message-ID: <20261025063846.3112301-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMAsx6cvv6XZY=LdayuEvBAXV3NN09Ru0KCcdaufscCtMeXoJw@mail.gmail.com>
References:
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Yd_X-BzwIRCLGK9SunHtx8tIog126Len
X-Proofpoint-ORIG-GUID: Yd_X-BzwIRCLGK9SunHtx8tIog126Len
X-Authority-Analysis: v=2.4 cv=OJqyTiaB c=1 sm=1 tr=0 ts=6adda3f9 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=rCbvo_beL2p0TiC3b8AA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX0M28iCrhYeNL
 uc2hUyommR07Lr0orWEssKAgCqjR1dYAY3sLIxqe0mxFupU1yroGy5empw+WMB8d//0+PmgmMuG
 1VouVi0Bo3NJQH1HgNdEPqU8l/l/svvMw9rukUadDBGjuPVyYPIgM6tTNGu4kxPQsCcnC4t4lMY
 sNYZY2+miIkMwBpDcud1g/L1NF2j5TdMsk8mpFrAjsNfsR7CWShX7fTwiIIIfWPvRg5uHgonIRe
 UVV4/s7RK5r7sS6MzmaDQHPGmm6K5gukqZM3VvPpf1w8NnVNJnpszcdnRspNbIq4sHmvYcPdtge
 kcgiVlGpfYWTPJNTTl6mD+0QqMnIZx2GOkKSrUs91Wrt82MPtuMDFuiGAm62vcIHYtHrANxO8Ll
 PJWD99wzcd+gJFg+szXQ5ZMpfeEQvT8eORx9M3u5cjA0xuRZJ6W4WWDIIUhusKb33kGlQ8y+UZX
 r9fbkzGzZ6E56/bZCKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX6vECQcFUaeU+
 lQnLvQeGZ6n+wP4Mv4lpYFAZ+FsnUBr421DLtA3x83dKaKGPQoLsul6YYk58ZH5+TB8a1UJ0wwS
 hFF8mGXtkHMajmo1kBqVot2RhGZKXuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01

On Mon, 12 Oct 2026 22:09:35 -0300 Daniel Pereira <danielmaraboo@gmail.com> wrote:

> On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
> [...]
> > +  perf record -T \
> > +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
> > +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
> > +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
> > +    -- ./workload
> 
> The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
> systems get, while on devicetree systems it comes from the compatible
> string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
> after the example, along the lines of:
> 
>   The CPU PMU name depends on the system; the available PMUs are
>   listed under /sys/bus/event_source/devices/.
I'd rather drop PMU specifiers as this is not something this patch
series focuses on, and examples above avoid them too.
> 
> I applied the documentation hunks and built htmldocs, no new warnings.
> With or without the above, for the documentation part:
> 
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
> 
> Thanks,
> Daniel

Sent using hkml (https://github.com/sjp38/hackermail)
