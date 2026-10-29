Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273905;
	b=ZCOLq+aQuIohXNBW7+LymOfP7h5ZHiMdrL6qd+QT0xVs9Yp1iew3Qx7bs9bfQ3LMRcnJ
	 I5z4xS9ToOM1fPf3A5+U5i7yUVzuzaC5OyYRzchf8jh6pRfE/d/NSh7jdEQ/9RSiKdAXZ
	 8qpkTILP/+ZjrBumtR5eELG5REHtowgDA2zx+f8gTcIEZewrtUor26iDXfpsv1DGwRdqX
	 Bo2gaJ/R5GScZ0s7aSP4NQRGFWF0oOqFlpIj2cHiGD9IL0FP5aN4iDrx86d/MULOit+63
	 F/K7dcgKGAaoehG3oxmtCrgJecTMN/zY82n55gdpQGyI7lFn7u8mqDF/SquYBXN+x6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
	b=1RwaXDLfLR5BKFHdYiF9W/S/i/jb0Ar/jP3zaFwjg0Da6H2Aaa7z4agx/Gopg3E2IE4D
	 0DD8o951dS4aR2afQraQHlGGhmZw0QAW2Plgu5tOOysXDAS2Us2SxSr201BnIuaNBg6Xu
	 mtbQ9rpeBMeu8EV8vpUzFe3dGEz5Lp1MEz+3b1XPnQQZRQMia1LRKLRhCgk8ogp/L0EZF
	 OX8/QgN11ulHySAi2JeIvg4HmVau9qyUm7goGSMwKVsqI0LnDQ2mcKt8aEHsV6Qj3g3n/
	 4CRfOBm1ZfZK+xz4rMvx0f5iAaOuVR2HWMv95Sr3DjGuhKeLQDpsIj5WAlfMApHWzMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ButymcXZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B77E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ButymcXZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vE5d3824988
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+gMCI5zJ/0ncCjFjxtCwKE+
	NZWsbIHy4vH2hFbUCDM=; b=D5ewi8Si/yyUEb4CJLgr2xpoJW6pK614WmguzPBw
	J5FlTgxUj9XZAh+NE9KOm3uJhnohYq0oODVnzC0zXuWRlnWGEa0EpKshXqVexq/V
	YeIqos3s4ctK6PgTrZ6nDAyJaIyWu7IfJZ/H5eVqFhw8q/upJZft8UhNmy5g4gYs
	5v8oEy86bTKoZ6WTVHwQUa4cduU9NSj2a4xh3DaIcSJ5A2gq/4mbwNdYKh7xEi5s
	DKBN7/aB+9Nu0ERYvB0Gej2xy2JSoBHcXD0V+8L2FOtcQj8jg7gAI142AY7+jX4L
	45TLVh2VKZ9QfCGDALDlCzP6GcXAKCzO+bqGPqH3BCm1Ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3j5qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:38:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so3319434eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273904; cv=none;
        d=google.com; s=arc-20260327;
        b=kI/47iCIoJhct1JSf0cCpVxC2asqaBcQ2xwuSDEtLp4upL1d3goOerD4I2f6QgOh/V
         0jFi5qpB1G5zJAOxjY5foDIiEUCDdLIIJswlEVOlxprSaafqoM8aW/vz9k7TJAdlNJFg
         TLilZSjoQZXO3oVMbOgsrw5wgOMEaJXYrnqTKhUPRDtcM03spsFaE2YtrWYWu7IxCjfC
         k6W9b39ylaEMHb94Pi0rWYaTuBhl8go7JneYOLvyeLOPHKxVjcgyqyRiPtBveSSzEK0t
         XQQwd4nw/bOuRMeGYoPRexn+RUC7XaRzbQBbWaqKPQaO3gRMpJ6iwLTzNZFZgXexa2L0
         KsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        fh=bZCXLBgBUVNCBfJVk7YPL3v0clduD0rwjvJxgnfgq3A=;
        b=nYTlHcJG0pq44ieztm0+mp2qEfZNQ+QEh8ohfRqStzeEIaR7ULqZOWawzPtA4iuzg3
         /fMnQibaFITJ+VlE6Gii9DJ8AKcWURbFNqeZ497XRBHkt/PFuwnpLcmSW1ncLdB6R6tg
         HFaVvIE/jLoi+qrCgtOp/w7VPSRqkQ7ou3v7jO7W8+efU64uNDnPT4wSCEzIDbfJbfui
         BJfwlHrmjdlm5ZntdY+BhWeeR9ljI2iDH6MRfAG6n9d2fTisYKKZ9BQ4DsA/qwOW7lVw
         hjLvLo+JavgNFz6hluVEB4ylnHw6khZqFOv7mA6DWNG5kHDbsAkDK4Tu+yxeUFHewi45
         93gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793273904; x=1793878704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=ButymcXZfc0Waii9DJ0T72l6Uvi/Zrzco27bvXxYF9jTsh9AYzmGH6HwTZ0sov38Uf
         aStY4Py+kaowk1I5SZUme7PVp7X6OZEHCG/L/8QcFF+YHrMpdbYF3NJwDau/uwcoX2a2
         ToOkgaXgM8eIpVjlvKRpRhyu7GEQ4GnkdYyQtmOwdzZavjJ+uk47K7vpYpdJWFieE3tD
         EM+W1arS2GQ60K8qYWJm+l/z1KzWIqKoaDKEW3f1+3Xkb1BwWTS1r/qlkN5WiX802hxc
         OJTGUtQ+XoBGWC6TAkt0IbIdmeud+Bw68m+BQ13lDMLX8urlhHmsVAl9gOr1qagk0mRz
         FeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273904; x=1793878704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=zS/FbWWqyHy448YHVuzULoc/Iqi+M4We1MbwP+nbe7w6vF/uRhYRRWOWTIo4Y+RgBM
         3Gxq4ih9+KTvYWOwbuVvjGVhxDpHv9eqekbvyluvapoNrs9Pw75VA5nXAIB6tDCUa7Ug
         MvwQM2jiBLU/ID++4Elh9S3gS162UhGWCdkupesF58NmX9Ki9U+dpZDEOx6XYCZfMWDG
         NdYahv0nbqyJhEMEwNKJlCSImUbVUZ8s4mhvyyHqVn7+fi4VbB/+TWBJ8L/J5jjqVCr7
         jsNx/VlgyItPKWhDaXNWfX46lQlPbZtu05LF1hwy0Oz+848atSgwWxXHcVwcwhEKGPCE
         EBpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxblZoLLVLLdBjZ+g+1kBYckqFfvLQv0jnnz5fljrIVePY7DMKJ3s94zkNVlZ7OAUF0jzdD9dxDYQzdt0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl6B0B6JgGnvIIVdRoMH33ZcD6NTXKmVbBwWnzOzws7pZH8m1G
	ycpEQykT47TcGt+vhLVM7b2DPBq/G1uChkRPYv+FhuCR57O/m/kJ6TTs3Y5E2xDiLKbfgxOuHhd
	WI3XHe9BPP6f9ujO2VmtwUwGg1VvBsyhHBPaBJl463WymqcDt1IWHylgnaWam+APhihgRNa5eDW
	r89MNJOZGerH8or5OlmC7CUUc619SLEoDyS3E3VoVK2A==
X-Gm-Gg: AYBFou2KD77eg9SkELfIiQf57U0fj+Qj+kO9ESCFXNpg6ZVLfCj6ZOWAHIMX32OQ+xE
	pTfMXdOQTi0rF+rPtWM/Mtdvx1vj46TzZXTMG+fNcuMN6pzlCMjsQPaZwiTzItflqsRaV/XB4+s
	/rKLAwjQJz9N157O1Z/qzjUJ0/hr5dvHJIL0iqHtY15G9ldJF4FAiX8pNyEg==
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a20440ab1mr6660864eec.30.1793273904000;
        Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id
 5a478bee46e88-36a20440ab1mr6660831eec.30.1793273903447; Thu, 29 Oct 2026
 04:38:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:08:11 +0530
X-Gm-Features: AclHuK9mkpiY9HLm48B-7iSzfqzEzMPXUUWrIwq3MFK1djLB6MzLTJk2GLxddQQ
Message-ID: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        yuanzhu@bytedance.com, yang.yicong@picoheart.com,
        yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX3I9GYWRc05iU
 DAjRKpxUwyT+aOXPGRSs7mu6uDRVM9+Pf7+iK+0sAO23O7eLbECxag4Ks0gWoQvDaueJZraVXco
 kZfxVVAUp9ipjwMInJ23cXfeIbcIDBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfXwWvgnYW6MTv2
 rOuS2zsplb8Fi+kYn/lrFcoxIVJCsE8dXLmhHo9eeByZnbz1P/XlN0kntgvVo3a7zkR1d5/xbKp
 AVXJxNPYP0F5PzQl8BtfvslcMy16x2ownVZ0w+OhSRW/XUw0mvK36y1Tj4nmvp3mFhQRVso+QO2
 3Gd2EmWUT5eP2jpErS4veTJpoI1qwXCiXKbD/C/5ZNOBN/vJFxritmq0LZtGugh57RR8RfhaB8K
 SEmBeFeaC0V61dLdU9GOeQ3vFthCeaDOmmdSfVfDLQGDQ+2iiJX90AW36zN2Si6S7fewdkJ9Yfe
 6l5xCe0P+4HRAvLaoTGrTCAxwW5kRu60goOxiHV6qYVPSiwO8KCo0YK49nIC0jLRVxnMKhUZifS
 4CbyqtkPbY/PJMPXB9Q2xg+D5Bj0tVzBWae0PNYIg7WzvMso3syjXWLbWF3nLfUs3hztovqANGl
 EaE4B3a2lbtrfaiduCQ==
X-Proofpoint-ORIG-GUID: RgXsL3qPqrQ1zljubZdr8CIyJljyiNeL
X-Proofpoint-GUID: RgXsL3qPqrQ1zljubZdr8CIyJljyiNeL
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae33030 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=ojhntA04eiNvkV59mfQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045

Hi Zhanpeng,

> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support

I See only 8 patches out of 11.

Regards
Himanshu
