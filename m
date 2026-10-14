Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC36AD4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950561; cv=none; b=ZsXWnr2aQjBH2tjnbyJLnBKZkcVSOmtPTjKpk5PG08adzfjovnJifNClslTrMwLjVqcG4QQ472/pDJjwzpqn2cR/SQhPKuDI00gosBbtz+03FGJo9HQ9W74qJ1PzNjvZVnQwJ5YYcRytIqss+iLZkPo87bGrpMPPoHjMniGwxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950561; c=relaxed/simple;
	bh=HH/INY1dmHr7OO3HmDOMe9VFvvq8NM4zAw3nsD+GINU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkKci+OM3p3FkfU5Z82DhnVx6JIT/fk6XfQbUFAyyeCg/2DauKlmR2Im+BkUllHkDeZ7gW/69XNudRI0cHtob1Hjug0jLc2ZB20FEj0av+WodTupOKZS54Hl9vQZAoABVDAPgHqw5KJkU0VT3/mbl1Fi9Dx0yu+7aBbHo0Rw3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2F6jXpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy9A9aWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2F6jXpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy9A9aWT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2JZNS1125169
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpuOO2Gm66RQ1GIkn10c9yAx2q28La2yHABZDw7XjIw=; b=b2F6jXpt1yoBCAgX
	uA730UdaMVV19gd99S4W5+2Umi43QcBbszWoNZLXgi8CrfRw6GlQnKSiAfGiIxhS
	yHwNvqae6TijEYTnk8SDZZUCPZrsY/GHr5cXK/I87nBHZhbn/JnZNL/jWDYvToh9
	I3gYerH0mhDqlnAyx0aCRioOIzcvDPY2Y6GzNvAPljP3oa5P98mRwCYi0UPl/tDM
	8eCwGDXUYa8t3k9xelTmURDeW2ULegq8W0mujCbSy1GCqZDHVN2SJ/P3NWyCLsSm
	0/GYVvpdFKPhGEBNgvWz+dIgsH2MIitOzXC/qXLq++XzwMAycXeXXaoQd6zMS2DU
	STkWyQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg823e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:02:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so856292eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791950559; x=1792555359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpuOO2Gm66RQ1GIkn10c9yAx2q28La2yHABZDw7XjIw=;
        b=Xy9A9aWTL/ly6VpCZnlq+W0YJWL4WQNrLQCrjO1Bi43vJRfEn6OaHLT3zlSPZXqqLo
         v6vuUqX0lSMoBQNtbpxKwPRJYJxB9KyvWKU4gXr6N39m2kKfzRBEYe1/VfPfDXvN+SXi
         qePLUxwtZ3A41vSgYXLw2sArE+lATkW9sg+9SrL3WCRSNwSIsPhcYKe6RaGmcjmB+MNS
         wvEhaWsw0UC0CZvLFFlyGHZzVbKTcG1XT8wz3dq6mLoijdKN0S7EM89cK1Xj6k+0cyjR
         VjlFLmDsAeeshIk1v9bftm/NRZ6W5hXKzNfXM52/pNUK3lL3h8Jgz5ZvM+UBzdkpSLnX
         6Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950559; x=1792555359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpuOO2Gm66RQ1GIkn10c9yAx2q28La2yHABZDw7XjIw=;
        b=ronV+qMr4HPLLGbOLeu/LUD3JoBUwa5ZpH1Vfjlrp9jF8PkPAyEK9vrvVhSzn+BpOO
         OgdgQsAL0Y7rxWqQJplsRZbKr61pwXVVlkedY6kqoZk8cIFFvxlAm9RC77Ocsoc0W5Rq
         2l5/e9fVT0GH5znZlvioKxYcU0uH23b0HGW1NierZpr+aCdjWIfutqUYQGudE8GGpD2b
         MMFGIEwCpqK6Iu/UL8OnCbyOuhYbQfEATTjWhMkMdQwu4QpoyHVeSN2U/Oz6NkBa4qZi
         e1jFErqULsoijvBKW6XwsYNOfjfa1su2EZtx2+vrzC72bIHKmyYG6NJNr8y1QInwkyxt
         OhoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgDCU+o1C3WEnYgIvhjAKVnYcFTyEcBHMLxhqWzrohvnS8IEkGAi5tkCnfMzexDPrAIUFzUXnw7qQTV4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ69G3ikq91K/M62HSK+qRTMbUbIZw6wib49loVNs3s1YPut0ou
	TDtHR6ONoSVhH6iGfXKoXFfsQWFh0yKWKO1QvEbJ0kRqR5sBUR2FXikEXgi1heu8mTMt2FbMseF
	W/rEsgzXyJ7Q2piga9ONLEKuNdOlRb8xPUymNQP4XL8DlP/Cc7a/EpjbxvcEaXAEf8RxknpWmGC
	+zLw==
X-Gm-Gg: AYBFou0NIfN63lBSZsKRLzrk26xANvmYADzI5qW8uQnjdOOe+/u2Gn5TP0OfmAIMFLy
	vNc58oaBP4B16zF/wPs+b2dCCS5+lSIZQeK/B6zmDu+uolK/69Csg7P6kLcJ2HOv9vjM/Vl3zzT
	hm2IyMWuHXz3iuegAypBJE7IMlBWd4Tr/QG3P7XFp5y2Jvr9snprym9jVmkOoTdt8viQB7ns0Jt
	l0e9p0bwtod1rmr3p5fbbS2X6/q17Y+2d/QJtDT8CShyNFncypmMTOwWB1eLo5X9PzCL053csmj
	pfMSjW8/JOxxAdJ2285jaElNGilSn8g0Kz3uXl6L0hA6jFOGovY+MbKTltjtF20Fh8237LetXyx
	IP7kJcK1sDHCu3XluKQig9jDTEUuS
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr20245648eec.7.1791950558424;
        Tue, 13 Oct 2026 21:02:38 -0700 (PDT)
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr20245598eec.7.1791950557704;
        Tue, 13 Oct 2026 21:02:37 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm49774934eec.26.2026.10.13.21.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 21:02:37 -0700 (PDT)
Message-ID: <b773e022-922d-41b4-ba1a-17d570551a1d@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:32:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: fix NULL rpdev dereference when
 session alloc fails
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
 <20261001-fastrpc-probe-fixes-v1-1-1376d93b8b3e@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-probe-fixes-v1-1-1376d93b8b3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SqkgV_y4NXEH0Qo4JT1xiL6Ogcpw6KVi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfXxaqxfnj0eSF/
 Qcssl9H1lfWTC6I47v5bQS18MWgXZpu7k2ObcFMLfmWsR+Qt7ytLdGSw+IzJkv48RXfGe6tH/eD
 WUpfYQpfXkfdvqjRwV9Qrvhdshjqowc=
X-Proofpoint-ORIG-GUID: SqkgV_y4NXEH0Qo4JT1xiL6Ogcpw6KVi
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acefedf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Hi5JtN4IBsk8tPmk4jsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX96k/K5PsR8hu
 Ib/sBKW9fmKaLebKE3/qmKkaUyZ54F4qq8smv9FNG8n3RaM78k8It8TH6Tz7CIZZNwgujY0j3TA
 uuomAnGYg1JBnaEbJP1kKPMfdCPDcI39nI0CjF5GgCbxnaFV3xQAPEYvSxAs0q4diHghzJkySet
 AIVcuec0xtpaxoDbI3dO8buJm9wMK/sBTWwQRhhRS4zZTogGK9oXQnMCavxPRR2i+pzRVwnx/xW
 mpfN1kFrbK8b7/YTCQaSGIo72vuu7eVrhmsNH7gA1x/KSYdWkJ2CwMxS2qEXI/8QLD4Mq6wZYbI
 WAjX8HZzEZBJbGsLV6VCtMJ+kjoVynvqAQF/siZlzGw9xsFOMipoKStRXpK/jNKGmwQpqJj43es
 dzumm00/9oCvqBEtYg5Wsx/CnbcurHqj/5tf12iMXX5lDffkOKdSeSzAizyUP7bUwcE+yezAybI
 yJVaCM20FnWHcJ36HFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140015

On 01-10-2026 16:31, Vinayak Katoch wrote:
> When a fastrpc client process dies abnormally without closing its file
> descriptor, fastrpc_device_release() is never called and the compute-cb
> session slot is never freed. The abnormal client death on the DSP side
> triggers a glink channel teardown which propagates up through the rpmsg
> bus and calls fastrpc_rpmsg_remove().
> 
> fastrpc_rpmsg_remove() nulls cctx->rpdev before calling
> misc_deregister(). If a concurrent open() enters fastrpc_device_open()
> in this window and fastrpc_session_alloc() returns NULL (sessions
> exhausted by the leaked slot), the error path dereferences
> cctx->rpdev->dev causing a NULL pointer dereference:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>   pc : fastrpc_device_open+0x1b8/0x258 [fastrpc]
>   Call trace:
>    fastrpc_device_open+0x1b8/0x258 [fastrpc] (P)
>    misc_open+0xd8/0x1a0
> 
> Fix by moving misc_deregister() before rpdev = NULL. misc_open() and
> misc_deregister() both take misc_mtx, so misc_deregister() will either
> block until fastrpc_device_open() completes or prevent new opens from
> entering it entirely.
> 
> Fixes: 7c11df42d0c7 ("misc: fastrpc: Fix device_open when no session is available")
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
