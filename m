Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111390;
	b=i2ukjl7j16JDnfYosxruyzSJnhx4CI8dSSHg/uRX19BYh42RoeYXexWQUHUmx7jJtf8V
	 YMKxVQfHaAvw4YUFuQPElDaGijTOS/q6mGTp5kbRNYwB5tYEP5uc3zXHBAnIPF0gpa67F
	 64KPtAvx2B0+YRRxK9yFBmPXzlLzgiVseIZR6QQVbz0sy6C4Ey0VvCMmXYAREB7Qq5Yk/
	 OFFeYgudTNn8kt2bfElsRqgVwGPTgSpmUsx/kj/vbax4N5z+tVx8NJdFlQk3ry91oHzEq
	 hQ2mp6WnF1As02VpWBn2EH6B6NQfRCaLTRDjHTsjzykCFD+CXk95fY53LY4tuDpN2rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=;
	b=3tHr8EBYwNqMuwap5e64nERe9bu2PXI7aNzRNu3W5sM5hUimb6aIQwhxBhVRyajYNCA9
	 ze4I7g9bjV6yRbJ5Rdbhg5ytk/b8Gw2Y63ruNmnJzpQPlpLE1MSE1ctYXfTskwjYiZD7H
	 69+G9HTYudYPud6zicXwtV0jEEyeA80JKf6qz4Q5TNRwVdFjReOSVtBSliiA9Q2WD/yqn
	 j7vx+XxtJItoHFTCYaED8QRHeJboFTcyROceKkfmWUqzMH2WM/R1twXxmzBDbOz4kXdcn
	 /W5fQHGqrbtNZxsgTCd3f/CpFx/m3oN0qg+5imHAqxKRhiDqEzNS93dp/xkJNgx5bfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ee7cb9wC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSq6TOEz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A6606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ee7cb9wC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSq6TOEz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A81PefI3368784
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 04:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=; b=Ee7cb9wCS4xOkNZZ
	06ssCAvMsvhGZvDwjBrszKltQbNveFITvqXXe5wq8JNkcGfvjwC4Y1JF/+ovoqc6
	uL11dNiBxYn8+4wD7HLdantcZEXWccAmu+o8BnBi2hH5/C7wNKMcTfzzJy/LEDX/
	fpLr7qEoApFfken6e6u1e1ejElEntt4qhYSZgJVF7kpLCJM+Dq/nVNiSnvfmLT3c
	wRp1URZSUCYfc38DC4Q7AzpNk75nwzcbg3Yjhf9tnrhmcmAi7gH3QIR3LyA04aPM
	ML9wZDPyHvrkGFDvSDgf20GjkI4QtX5dAn3aDBIy5CMQ5iQquP9ECui09h3493/y
	T26mSA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99j35y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:16:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso55751a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111388; x=1794716188; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=;
        b=DSq6TOEzD0YKWOWYpOusYl1GlmKdam4Ki9L6dMEJ3SqV7bAAv8BGo9UsB47c7pdFaz
         Rzho3wmH10WBEhrUJQRYlpdTawaLz0184/fDhz+YrmTvHp2JxbhsRIn3IjyMbJvUsTUz
         3yh4v4JxOkr2wSMGgks03VgaclUHAJkvsdcCjbmtRBb0GahBf0Lx0V/bIOQJ3kdwzeJV
         AnEwjac6aaae3YjBsyWiwOPtw8YKyzK8C0zvKzK4UVVAsoR3r9dbc9h6Q7rE0mwdrffH
         ZrmF6VofxdUd/rhho00WEHWis+Or222k/sY/V0ZXI7ed6YkQdG1QiEIF1RZhqiZJvPUj
         AsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111388; x=1794716188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=;
        b=TNvCNLvjKmkSJQg0SgBjbf7uj3Zb9qinqLorn4oJdgLFfjcNA93bdI7xgNGv9cHOZC
         4+dAvjIdgbmi0VvqevCTMZTttFU+26dQapwe0DVGzOv7IYdBV+lT5uy6kz22bU6j5gDE
         muMhW+Ja+p52zLajqfzrsPCzOCAUNaZFyt5uyx5nlg6q28lCgldEDDBH8xuiam/SVrGo
         HfQpJqOXEF3Z8xgIZ/FWYQT6b0iUyg/c/OyIJFzEGxlzFSyL1XzkSC6hQ1aUBL0lHxBr
         GX+TS6qH5byt5IauSrR75mUuRWCTkhZXsrDNC4QVgMreRkk4yV0Ch0bzwTZmhAz6TCno
         njwA==
X-Forwarded-Encrypted: i=1; AL+hErH5Y2Hk3stVQ/ejiZoTRvkXcM+JVYc4uIQVfidfKE1E2FjETI1+VJe716ytloR8z1hcCSHoy+U012BzPhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xh0QmOTT3zA6lkRxxjD79pvbg423MXlcJj1OJsNGQDlv6FAsw
	/5jv0QFnIncdVG7q/R5IgCR94atIZgPAdoCYsDWmhyxsL3TuhPRVXeYF9p34VsNc6TwYBSGPFpY
	HRtwVMzW3bKiirXc5UCArZPMKyCKfrmgmbYby2LAf+FHgvWPxLH3ivmh6B5p54m7KXlI=
X-Gm-Gg: AYBFou3nxfrdqwYGuzTm7pr0t0avI3mgysjBrlejLPHI88hPA7ySvr5czRp4mf8MHih
	T04LbGNMlGZsvnjFCqe78yyDmQYq2wLRrxYzAzxC+/9MHOu8Ga2NP6xmDjGIt4i7XB8bBJV2Ueo
	Ustt3vtyi5byA/BGujf9SwtUlNHwkrT+HhCtD80yEUeIaAErFi3T0leuSRsI8TPnDKV0P0A71Vx
	CQF25Gk6munOO40SpBxwdXasbV0hNXTFG6DKC+npGB7fwxbPxlZ7SvOfi1diDkSwnUpPZIpM2P/
	X8cYT+H5RcvahhNrXGGPLdw/24wuYwffoYxnhzAZ0PFeKx9BY0p6vQ9PlErEcHxOphirva64+Cv
	Scq70wypEqWeB1cpy4bcamJMeEHs2s3hucEQvj0ETs5OaIV+GT0tUDvnJOFbGfC3nIRhZ48E95I
	sN9LYJL8Qn
X-Received: by 2002:a17:90b:4fcb:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b12d305c87mr431255a91.33.1794111387609;
        Sat, 07 Nov 2026 20:16:27 -0800 (PST)
X-Received: by 2002:a17:90b:4fcb:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b12d305c87mr431235a91.33.1794111386835;
        Sat, 07 Nov 2026 20:16:26 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278cb8e4sm1391223a91.9.2026.11.07.20.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:16:26 -0800 (PST)
Date: Sat, 7 Nov 2026 23:16:20 -0500
From: guodong.xu@oss.qualcomm.com
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>,
        Guodong Xu <guodong.xu@linux.dev>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Message-ID: <qqvfduegawuoerrzwnj7drxkev63gxj4ddqaw4eqtrhsalugrd@sodih7ytwhos>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
 <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _x5QN5zw7LZW0fZzUGVbDMj2wrc9YY8I
X-Proofpoint-GUID: _x5QN5zw7LZW0fZzUGVbDMj2wrc9YY8I
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6aeff79c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=DETRMP3d-7gSuzmK8icA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNiBTYWx0ZWRfXyDVgPo+frkTg
 dSHXvUCJwrTnelrtXtElFmkIe/7eKEYfvw4NavzFe734sWeFTq/pNXUnXdNn/zNupvyOqhHUxC0
 bn9vmUXDmiwPwjEEF8zeKfVsWIngtyF6HR8OUb8jrlsKPWDTWhOU+46kwpMMplkRxy86OF8tBxx
 /AfGhzXr2wiKfvTG+Mc1desTYzHmHdOG88g8SGEGxQmEFtAG6lzhX3hJj8aCoZbH2FJwhNK4Q8J
 RuoGA1RTVWPd92lFJjiDyAJj+qI6zSq53XxIygnLp0PH1CV1RZWFjSEgMVQoMKNyWJZ97bQ2tiu
 bG5nJhj+pRqO6puZsLCWV0F+j2qsknnPF3QBH8TPtO8q+tz1iUzkFC3Pr1Pq71NrjyBuTaYja67
 TzY/1Snnpo/drFnrXJwUWBOQtmnD2eZ9U7uXh/NNOOH6jQwIO/tWIYXluAFgmJezXaPyuPDZ5mh
 IwlJzbdJQXSYiFp63aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNiBTYWx0ZWRfX2OS8zDPAM5vz
 qWBf6sO7UBobpaaxv8qjM4Vtp1A7EL9fIj/cn3XDQ2M5NK+LAu0NArvvjwdxftReqqc/KEpKI2C
 vrseu04igzTLvHpFurcIoPbD2uh/Tdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080016

Hi Radim,

On 2026-10-07 09:46, Radim Krčmář wrote:
>2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
>>
>> The vector Kconfig is gated on FPU=y so the vector instructions can't
>> ever be enabled when FPU=n.
>
>Right, I'll make the commit message clearer in v2.
>(Zve32x and hence has_vector() can technically exist without CONFIG_FPU,
> so future implementations might require use to remove the dependency.)
>

Do you mean dropping "depends on FPU" from RISCV_ISA_V? Today it reads
arch/riscv/Kconfig:

   config RISCV_ISA_V
           bool "Vector extension support"
           depends on TOOLCHAIN_HAS_V
           depends on FPU

Today that dependency also gates Zve32x, Zve64x, Zvbb, Zvbc and the Zvk*,
none of these touches floating-point state, but they are all being gated
by CONFIG_FPU, that seems not correct.

I noticed that the _validate() callbacks in today's cpufeature.c for these
non-F (non-D) related extensions are checked against V only, but that
doesn't change the fact that CONFIG_RISCV_ISA_V depends on CONFIG_FPU
(from a commit 3 years ago) in Kconfig.

I would agree with you that should be fixed.

BR,
Guodong
