Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024C2DEA61
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359197; cv=none; b=JEvtqincRbGAFKwoChE6PBnpGXR1LraH2a0rNOBf0hABS/GrX80dnk8IwqpTdfGbhL7RunBFewlVZ9Re3AsbM94GY9zI+H75woEqB5/IVA5HLJc4fgJMkk+0QZY//0FQwKtGMX8FoRgW7S5jNSWuIKVVdJnXTB+SkkOOKL15AfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359197; c=relaxed/simple;
	bh=hBifg0/uwfYYurxI69hDuYWgRC3zfISOPPI8JGF/J1k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kIZCoMoS3BYLNxW72xfeuJvGhE1ZaeUBfqnwTEDIg5wrYic7lg0zNIgBRc1AyA3u1HoRxT92UAs7FKj+knJFn/RqVaF7JYGCXjLbU+Olfstn30YfpaLh32diJJh0Fd6+yS6RCCk5MioH5XXO5nrBqGC6JOlLzATjLAQ1huRtr1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5XW3jfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVDFXTdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5XW3jfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVDFXTdm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jiQx151961
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nB9iwTZpWNJOzWkXU/G8faBI0c0O5OddMDPslkUTVWM=; b=Z5XW3jfCgBXiO8j8
	nmpF/YlCkyqLFK66UB6EDbwH91A5PRXytP2X7lNYDJhb9xQzdLIUGsBxWjgOdYTZ
	uXc7d+7nvmXZK1E/AkGD9p9n+RUK3SqppZtRjdbIiN614TcHhuboQmKrit+4/9K3
	TV1FAh5fa7oWlFNc6kk6Y42iKtUXd4ePQYHt24G2LcigvjF8kAEi2IlmLI7ulUEO
	p6fCDY4yvxfzwlT4MmPwl6NL+rGXe49pp3eS2umHo5h/cuQ97msjHFUI+tX/N3RS
	sGZrs7HPcQkrOoXe16IGQuNpiWQKXZBicFzxJhbe3MC6QGkoLboeJ/KltjLQxx8K
	gA2jAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c7194c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:46:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso805944885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359194; x=1791963994; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nB9iwTZpWNJOzWkXU/G8faBI0c0O5OddMDPslkUTVWM=;
        b=AVDFXTdmJzJL1MukJ4vG2BOYXxcYFGhsuhk7pLo9cimo20PwsempoJZNmYCC6RBCvS
         zXUv7vqxqcmWLesr0nZk1IZmikS1Mt2b6500JqIpFxbS75VkrXrfjHP22z+WYqGYndvH
         W2yiGfjPIl1lzPvQPGow7DLt8eahBp3lMokforoHv5dpyyPJ8nvFHJzQ15DzkCnKZZT3
         plUwvtWQDmCij1CI/20iR5KBFiY02phfulKYdi8NwmpmJxZbsPqTZuWXvjdEfwzt5jyb
         Q8WsTb9J2yyvZcwJNWsvwSJp0BEAGQq/ljr5KRs1q0R1YfIMMp3tIMUu6BFvH6S/C7Oj
         oREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359194; x=1791963994;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nB9iwTZpWNJOzWkXU/G8faBI0c0O5OddMDPslkUTVWM=;
        b=studWJ/cE/UUHNSCxlNZhGJJiRIVqDezonyXQBa8DX8LUtZYNEo6agSfJ6E7Yz1R4v
         ByCO1+vPxOLt8yQgHGWqepPjRLqbU9ISIUKTIzaGwS3itSp59zeFeyWPV9bO1EGAPaw6
         hjmsZxKEstdHqchb32yLpl8hYOwUQuq0Q+ZSeP0RjvohfWJOcZ0w25glATxavwQ3ykSN
         leKoFRXLApttAx8tzNB/spvHbOtJYO00cJZ0PL3WbIffIiPVLrN0jXwA+ZhwhfrfZVGU
         PeaEBHOY4m4mlNRAF6Xyc2zcQ+hI/w4aDAYA9z9H4IMdch2/oi/Qoua0TI6edtZqTXRN
         86dg==
X-Forwarded-Encrypted: i=1; AKwUvBycMZkI1iWrAVMgix3J0KjliQ1+zJejiho99hrsnx7VGHnUKnpT/qd1acckR/Q83aorFB2dWR5NJMzRPxw=@vger.kernel.org
X-Gm-Message-State: AFuF++nrOxvDH/r84jamsoFpDMMWXUoHsR337msRmItiI0hVNq0K6Wzu
	cqKIo1P1Fe+qWAt/TECTWnG0gWP1RY5PP2M5dzI3SrbGK+D88z3amZd7x7g9NsUmjoKrHOPlsEU
	Ck98jX7IZtoIEv61gFp1dBY3fsD8a7BsDpLEYXZCWNxYYOqzfxGFPgMRUunYLddG3Cjc=
X-Gm-Gg: AYBFou2l3iDtmuRfjj5JH/twG5zxFAV7vEx9/gjslQlBHBP9hz1EiuV6nZQgWEXnW35
	ltXkpW4T3CHpJqtyvmYD1ZTIIm+1xgEhj9JQkHKXC0YiQaq32Lp2tvNsXXH5UanDbZGE44Q0wmu
	8QndneQuPpPpbt3W0RvvzGFXTIzUG5B7Ml4dyPf9ROCFmoymaukJiSqYwyfjpCSC/zWnVu6+qNo
	d+SxPe10976C9ARZ0ovbUN7th+mPo9YNCeuIOVIx7Vte8ZJwxKhkxasiwtnLSyDtrsWHz3v7w5F
	iIn5v8WrtxULHmnNLWe7yq138EUdCpLcv0SR46HoohHCj5R2wAoGwWfZi+mA5PSXAe3+px8qspT
	i7Z8VFnHCEOQIB/emmIKoXllIy3OlBVoHbRvFhA==
X-Received: by 2002:a05:620a:4693:b0:93e:980a:88b7 with SMTP id af79cd13be357-93e9b893306mr288026785a.70.1791359194480;
        Wed, 07 Oct 2026 00:46:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93e:980a:88b7 with SMTP id af79cd13be357-93e9b893306mr288023285a.70.1791359194049;
        Wed, 07 Oct 2026 00:46:34 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2d563sm3896568f8f.41.2026.10.07.00.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 09:46:31 +0200
Message-Id: <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Guodong Xu"
 <guodong@riscstar.com>,
        "Zong Li" <zong.li@sifive.com>
To: "Charlie Jenkins" <thecharlesjenkins@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
In-Reply-To: <179133089395.137225.157195939155119911.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfXxJ1nv4Nd3/en
 /J9Rkrb4dK7kVbysO+lFKKu2shrKHafZMB07YMZ9yW1aRXrX0kqVTSmwmEX3cH8j7KIJcXeC++I
 YBIFkuv/KdlAoYHGjAnUCiRc5ncMfjo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfX+VDd7WpZ8wd5
 LnC57szrdaLMqWfEbJMUunI7jTt3/BDhuC2vnjDXbZWd7Wf+yNe2cG7FRuAGPcJa8lbPmw71iGq
 54QPLlbx5JS8wFnjhYd2JG/b7MPO6JTsODJJ135PeaI/Dr6TuwAGOIxtjCtmJQwupVhjhgPHSxI
 G7KojaEHfAJme9P8zoQWa79DPDROzSUQFh99uDjzPPhd4NbF80n5y8VxIbG0KRmgDo50+vLqOKq
 Qi3j6Jn25W/h2yrVXgWh6dPxt0BfwhQM4Jmlz5mBaBYZ6P8q8tCbuL4GwABI9rcD8IpxGeNjCIb
 OAUsijKfMJGR4q3BNleLudckEbllf9EvfkHVDZYWhRTXW8yK15a0SkyqHMC6ZkZPXCG4TB7YQY8
 IoLXTO8fT0XpiVpewtAcSrKUSjE0ss4FBPCeyNan9LGMi91uDNo9RZFVKLuH4cTP7MS/mbUJqdf
 zbGrwjunn6eT3hv1eDA==
X-Proofpoint-GUID: yCWwNlWQOGHrFyPYNcnS7WD6MY-mAgoO
X-Proofpoint-ORIG-GUID: yCWwNlWQOGHrFyPYNcnS7WD6MY-mAgoO
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac5f8db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_j74ZTOZETwGzg2yP1kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070030

2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
>> User-mode use of Zcd, Zcf, Zfa, Zfbfmin, Zfh and Zfhmin requires
>> non-Off sstatus.FS, which we set only when has_fpu() (CONFIG_FPU and D
>> on all harts).  The vector floating-point extensions Zve32f, Zve64f,
>> Zve64d, Zvfbfmin, Zvfbfwma, Zvfh and Zvfhmin require it as well, but
>> hwprobe gates them only on has_vector().  hwprobe otherwise reports the
>> extensions from the per-hart ISA bitmaps alone, so it can advertise
>> extensions that are always disabled in user-mode.
>>=20
>> Report correct environment to user-mode.
>>=20
>> Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and=
 zfhmin")
>> Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into =
hwprobe interface")
>> Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.co=
m>
>>
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwp=
robe.c
>> index 7818e1d32622..b57ccd116bb1 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -146,15 +146,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>>  		if (has_vector()) {
>>  			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
>> -			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
>> @@ -163,14 +156,26 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe =
*pair,
>>  			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
>>  			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
>> +
>> +			if (has_fpu()) {
>> +				EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
>> +				EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
>> +				EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
>> +				EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
>> +				EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
>> +				EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
>> +				EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
>
> The vector Kconfig is gated on FPU=3Dy so the vector instructions can't
> ever be enabled when FPU=3Dn.

Right, I'll make the commit message clearer in v2.
(Zve32x and hence has_vector() can technically exist without CONFIG_FPU,
 so future implementations might require use to remove the dependency.)

I think this check is adding a bit of sanity, although the platforms
where it comes into play are already very wild.

has_fpu()=3Dfalse and has_vector()=3Dtrue is possible on heterogenous
platforms since the filtering/validation of floating vector extensions
happens on F extension support on that hart alone.

If other hart doesn't support F, all harts will trap floating vector
extension as mstatus.FS=3DOff, although scalar vector should still work
because has_vector() isn't keyed on V support, but only on Zve32x.

Thanks.
