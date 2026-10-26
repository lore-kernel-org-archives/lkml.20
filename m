Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793052624;
	b=z67fowdiiZA0A5o5LBukwjeNJKslCuFVurg8eLVr+kVVpwEp4wdvcOd/7ysGLtqnWuOu
	 mQUApTrK2OnffCn3hGw0KVN6u4POzdwvZ5cqHpznBtN7RwwkKyB8Fufrc+WXmby9/kKaA
	 eV3J60TkMtlrNuNPQIfmlI6KO8xrwwPMtKWuBez/R1q9MoJwInmYvfFnA83Dn8aeeHjFs
	 23oheQlNTQXB4w1ssBJZWWMVe00gNxDc3zoY9PLQ5/6UN7zKNwCs3zxoVYFq+s1H5LzEX
	 AyAHYO9Oa7inrrxxUZTk16uJQPS5KcyblwNXjqh2c3t9aL3xnK1KedXUEub6NmXuRlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=Jf+loG0vAvnxt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=;
	b=gIgq7S/WNN67s7/KVLNgbvZCMgF1T3GdCgLquHQ4EDe/6/BGCXD4sePiWhrW/dl8u+/0
	 /6oESjOVIX6BZQ7dVjKocbPd8uk3FpWKnxcmUEgZDeIQOj/jZO2bjdzhQNp/ywbb6ziZ+
	 yPTSDZG/YE+/C9H4UyTJVCkMcGV6AKVOH7kkHh8ihPqMdWrNA0XQDu4vy0yR6PFdm9Xm1
	 Kkfx822p6ZXPyOji9Pr0JsTtvX1UY5VLOb6FWFQFeemexMSdqlr3tr4BaKabvDEuVO6ac
	 3nzk90cvzuBsAEr3BkWNi1JkxgnhhosqtSmssl0ypdGxXAQRuY2MZJvOiw1VJ/I31dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dZ9tR9L1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67834606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67834606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dZ9tR9L1
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QImi7c3655990
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:10:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=Jf+loG0vAvn
	xt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=; b=dZ9tR9L1/IcxcsH4mEsKPx0GW5e
	UTGvTAWR0q1qhi/B1g7OHS+XHoohqe5XI+h4y/PThlpFE9BsEbWgJiN7eBQlxbFk
	c+8mY+yz8bMouKprc8O3DjrQU3Akz4oTvZpi4r2DjPk2vqEtNi0gM420ieQ5TBGQ
	OLZnhdv/E4lSiGhyExxYkBHSxocmkny3xTMO6kroAjj09D91kBCL+7qodbBM+UfB
	Z/cMVDLbA4rw5O2SP6MupF/qOmMi4axMzQQM+aUiaVU2MBQB2wI3Po4/YvMr8hp2
	zb5Z2ASgUu/S8qEr+ZMjM3GYoWb0Wyrhh5iLDNjyCR15YzzgAKPjekwpR9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgr03p9nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:10:22 -0700 (PDT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so4801642b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793052622; cv=none;
        d=google.com; s=arc-20260327;
        b=JZC9mqKPUxaMjw/yfBpInVByQFUd0sDNsJ5nuyKyun7fSYnD81oyVY3hPgRmi7Gyoj
         whzFCaoBGvNX5ReLRDRoRYASAupSjMkKREKqUjsgBUVPg47a59MVwP6rDwX4xgvAwp+x
         zwfYFjA9eknSW/Ynl005c4A3+5gxMOBbLE14J4N1NOOhbL7CTYj7JOmyA7VNlqjwqZ1W
         0QLjVh19RyvjKITnIi4dH+dfQUXprStjumEWgwofyjbIFKRF9VVC/lKgyoqnoRkq/5ws
         Mx1JwTax9Bm/1g3RdFlZh67wrJPr+B5Urc9eD8AWjyfuthDGyT3DKv9Wd5SjcC4CUAZa
         HjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=Jf+loG0vAvnxt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=;
        fh=IwwrGlg1wMPsgmO1K7VJC5B8OBf7AnSekwZOxY+XeYg=;
        b=bzZ9MeGHtIV/1ZK/cTrTunAq6y/FPoZuyeVPRwYsMgP0m+7dg15Y0TsCziLG/ZNWST
         uukm9UaOQfT9wugiM79ASQUV13W6EFRjH3xFQbhYj6maqyP4yXlvCs42Di9BSeASKCx2
         YmrSkFvCN6sekE4Po/l4yzZ+gI604nSsXxV0KLwvkmgexqloYo594Si6tXA5kxqghqYY
         5U4lZvjAnqP0unreLYAewffUKZr4T1a2SjcJNUpuh3v7Z/A7e6HyGiwpebBj1hmDX7j3
         ZFlsd9HUBHQY8te6c01O3ZSDzcoPf8wNxaST6LsyS+KpfmlIPr5x4IUGYsasxrrNWP4h
         xLPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052622; x=1793657422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jf+loG0vAvnxt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=;
        b=ZKZ9c6qfJwSMFM7AW2zZY9DKYfW7UjDqnN3Tev3qRx9nDH+7Plu9UHg/+Pt4v1qYBu
         9AERO0x3c6ojdgnsWd2gp1Xg3vkCfQXAPS8MLl7tF3CtGoioRG3VPxGOaA6OgIpbnTzr
         cx2Oit2JdFgqTymVNEucqnwmP2tonMn/aSSwk2VDfzT0vei8LlVf/r+d3c9PLqKBFYij
         isHhBRyMhmIPa9M0npm8zGPrE6xurDFy0oRznHpOEF8w0Uk1iME+BYDeMGIHGRUnKYvr
         WrnNaewpRMQPt1a7mZrfzP7TDyKz/R4vJvGsm1/GyxjHkhfCu+6z9h1kWEHPkZwhp+04
         bGfg==
X-Forwarded-Encrypted: i=1; AKwUvBy4nXwbynNpgww5Yxh7c5mWi7nR8cabb9tDweTG1qIG0moUAe1DfX1k4/e5eDEYDaABcfLof67c+h8ppLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg48my0rh+VZZa3QfriLnRH9MkVkFFvgIrK/3JOZiOSrA0H+HD
	q4Zg0Hq+C6CCTaUuu38muKGrVvhWiqiRyQvioXTJKJ2HZxkMs68Wpl4tbcuKRLY83hmb5vPJcXv
	kQ5+SYFrFQKzCzZG1eXr+qRERl9yoxByW+h0DCbs+IUmuhwpnb6wVxA3ctjpZGG5TQVJ8U3jwIa
	8wwKgQKDxiae4uphvf0jRxxY6csrh+BqArYinIzSs=
X-Gm-Gg: AYBFou2KGJZ9Zcbl0SMg5rL8P+lA2BPJwYQqKOOm10a0tdnuDzY+xWmJSuG/CEC35Zc
	oBPCMbUOiUCDRihoNKQDJa6ziPmqv9y+IQwVjp2uc+OyzNowToB9hGqr/xlgjJtcMWhZgoi3rAu
	mfT7tFuaze8OlnR1X/pS4Vo8dv7eTzCaIN+eGt/HJIx8IBn47raNYyTltYQOmeL2sY0DYosxfCm
	xeQQK1yU1MB/fIfPAKdtVWpKeJv17trigERZeZJ4Vn5/CFQ9fo=
X-Received: by 2002:a05:6a00:a211:b0:887:3fca:835d with SMTP id d2e1a72fcca58-8a36772cabemr7073931b3a.29.1793052622073;
        Mon, 26 Oct 2026 15:10:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a211:b0:887:3fca:835d with SMTP id
 d2e1a72fcca58-8a36772cabemr7073902b3a.29.1793052621627; Mon, 26 Oct 2026
 15:10:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023234640.1459291-5-toddfreed@meta.com> <179288570316.3134.17338958323067090592@kernel.org>
In-Reply-To: <179288570316.3134.17338958323067090592@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 26 Oct 2026 15:10:10 -0700
X-Gm-Features: AclHuK_YNIc8WR5zn4HQHJZd6E-TfuSZHowIMObN80et51S8RIsFb5U_2Jx7cYA
Message-ID: <CADh2yMxPi+eNkQSVo5hUr=pNsnG21ZLjYf=GMFPS5eOtyedrAg@mail.gmail.com>
Subject: Re: [PATCH net v3 4/4] selftests: drv-net: psp: test ipv6 tcp socket
 with extension headers
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, borisp@nvidia.com, saeedm@nvidia.com,
        leon@kernel.org, tariqt@nvidia.com, mbloch@nvidia.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, daniel.zahka@gmail.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4OCBTYWx0ZWRfXzdMAeuNSItWv
 Kf+SYnppTaACX+ODqadXPjeH23DCYhOhPMFfLHvWs8Oa/3wRsuim/xhNq/EhehtearqzIP1B24B
 P+LrxWmp5j6Ln/TkWHOlZT0KrNg8hgh4Atlm+vdfG7hIWY6yZejtkbyOoVrx9M4fBjd+0w/cykI
 jFSHweO7HQnCBl8ldEzBFO98HF1iUX/FFyUbuPjr9kW6aKTltuRGHJ6eKiN0pMpRivqjpMpjcy7
 UV3B8/bytTY38DFKcjNIjUTq2MXu3suqR8PBu699Tzzsrybj1ER1B5WA+Husv4kF5uQKTq+2CZe
 HUbQukJ58vRaek9d8zo5F622RPXZYQZd8gdbAyNbEw9CKCeGhojAe2X6uvQ6tMqtsLTZuUmYIVw
 EgRTBeedf7bfjUEKhGVGrSzkGrAO9d2UrSfoZyxXjjsO4qRnklPpH+Zjzx0GJD+Q6gIyRz8FaBi
 jWUAMqPJUHs9YWXWpjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4OCBTYWx0ZWRfX98mp5j3lJGsa
 RGUDyXpLLyNfx89LIAGQnBrjK5Vc0myyJMgRadSZbasutuxrOK7hrf1vKApsFvvHJfgm8tkksOu
 O5OaWZv4nOrxneKe28aJU+T37XIry34=
X-Proofpoint-ORIG-GUID: utgyWn0aRUgAQ_OvSpYxfzqtU9p-u7P_
X-Proofpoint-GUID: utgyWn0aRUgAQ_OvSpYxfzqtU9p-u7P_
X-Authority-Analysis: v=2.4 cv=DLUacCNb c=1 sm=1 tr=0 ts=6adfcfce cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=8elwO82fXORLTBIkMd32:22
 a=wrF_2KVHrNPQTX-trsUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01

> [Severity: Medium]
> Can this skip path end up reported as a failure?
>
> Could the remote filter be installed before _make_psp_conn() is called?
> Another option would be to finish the key exchange before any early exit.

This is a good suggestion. I'll apply it to v4 if it makes sense (though it may
no longer be relevant based on the other changes I'll be making in v4 due
to the other finding.

-Todd
