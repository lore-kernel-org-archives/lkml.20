Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793909832;
	b=10Z/AtQMvpvpHYfTIhsUlPIN4X1IuqRUE/dxhz3X7zfSybgnTCydT5zCpzI99SKIJ/3o
	 ibfK3VV/n8NUak7DZ+AKRT1ctWHtbTOrfENyxTo8HuK7OMj5g6sPUW5VAcvLX1N7e6Nl5
	 w0xI7lpCFrT2TiKN+uuLywVYOQ/0VysMP1tLgIj+VIO5cu46olexwI5skAJEWYQb4Smul
	 PtOGo0NMdpV5onpVXUnHSzaaWZBYj6Fh76Cc+APEniEzR2FFoGpL+26T4c2hsCRCbVE6Y
	 OQo7pfILKb6pm9cXDXK/VgE6afj3PcmGVCA4D0Wb0yC49pJ0Zu9egNpo+unOxBJS92Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
	b=PtAdAEWpUpVaF8s7eaoHxiTniDiE3o5uSOuIjH0zKajjjNbwWCQHfC8uOgrRpZYPWr8s
	 93cpQWjSZb5fSOP5GNSNuk4LG/hHMyQI539VWeNtWV2JY45NKaYAOZpnJki7/x34dEX1s
	 CnJKH5/d17vRraKgvZ5lnJfOPY7ZoJyB2NM8EC0zS5c7qV1gIiYVCFVq+S31BZx5uKYQy
	 KsN1qV6INWh+lJrVKJPX8T/W+oVNpkkwgWHKBwv4iEGmbqBFo/DPWvAj4JV8Yw91CL3kw
	 ZsDKf3pTRG+W8Qg1TPdJTeLokoM/ftLYDGouUtuQpNWDvKWquIU0jO5SfUAFPt7l8Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b="W6zw+k/k";
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b="YaQLh6/+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEDE606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEDE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=W6zw+k/k;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=YaQLh6/+
Received: from pps.filterd (m0354652.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5GJ9uB3207722
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=; b=W6zw
	+k/k4YX/v09rDfDHhSHoxIruPkCZtWCkkSujL/PN9DDRH3HuoqT851AP1kcOmh/w
	QkHxJFdhng6lJ1K0WQUFNf2Bo7q4RXedv3lg6EgvpEOBkZoUk5Hapmigsc2ZUsdP
	tQ/gGoVTWKJFS2UV6xokQggdjp+Dbin2V18IQ3q2EFEFNV9Tz38aqZFRnQZRFiEM
	5Kv3il4E5uBmkVmr1MtlJVROBri5CIBsAczkPdl8wk2sQeYeY7fdaj5zPswf+Jty
	SiwqVnbMFeNZ93mW3ul7O5N+a4i8yoxfIIc08f6AUrJhRWdNm9hn++ZGkf20BA1d
	Ocb9LL7d0tA5i5H+5Q==
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4hrpuhjh57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:17:00 +0000 (GMT)
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c3613c35145so101060066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793909819; cv=none;
        d=google.com; s=arc-20260327;
        b=csXQ4rL3JETlv+Avvqt9yWPw4U3eaqtQ0XW8egHNJfMdlp7qoTRDPQVecPCl++afm6
         3lWnyfgA67p2ZVzSBaT+QJPKVHh24qd8kkFYC62Kn65XMTLuKM6DavD3TOeiVC8JXa4r
         0iE1exaWvqpx9vgvhBErzN7Zhs11xWMFZ6a27Er4trpTMMQjyNa6m2IjlBo9z5cPo6eC
         aqNweEvswH4CI2HfqwAy18KFmtLg8BLhAUzHqJvLrby7lpalQ1H78VDKwdtWh8vEDjGr
         WXsba4108IMEEQT7Y1Lkvk6LJHN5s/Td6t8eNrLy/pJvU6aOzzPghl4XSNl+Wk/4vjJL
         smjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
        fh=OyQjkPsjcF9dUDY2a8QIu78/5d1WbuF1pjYTZp8MZnM=;
        b=kteUUkoWter+R//v9nOcd9cKmMazHhKT4g8rui9gAFGcfccKpTEdwovW6WJxylNplS
         hmbzSDSL73AUNonfhNeScDYylCoJw2SGSkfLkPRaaK8srQDR7V38I5VMYry/KIOWmQUc
         iHeVOIRLdHBH0EpcVnRUJApDKAopd+7J6WrrflKM3w3u1OTFBZfLsE+NSVDhaexH8Y8L
         6drys/rC8GDQdAak1cagmEo3d5R7a4X/y4gZL3Pdk469h3lhocP9tyWFmXONLy7aOVAu
         nnDuUa4Hq61utmh9EU/6IkjcO+Eon6pWIgwbJyi56vnKPMPr+xjD3H3SlAw8x4xllNEy
         0gWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1793909819; x=1794514619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
        b=YaQLh6/+K8sPtKjGPQPOAziPmomRkm6opHGV8g26+gImx/ackxhZZnPiBfm6x5KN1z
         nmrQtA9w+WUeAQDWuQzXoZPYeS+/xFwF5hhqTlpPS0rIPum8aPcrbPIl5Bp+exFzmZgC
         1ar3PYSlhjpv/RsFL9NMgjEqDSE44qoXpTaOf6vbNkdq+Tod/t3EjzdcqaQYvKudQV4J
         Kg34j/2HdqQ/P7EbreavUnSX9QALo3MKiezpY4ZYUJY0gFtxEL5rcpooplcMfuJnrDSA
         S5uh/6GESv5ALq39c30/+La08rTgx48CdAw/8Ymz+DmnFRgHYmhkqhxBZ+KRq3HI2gv+
         A5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909819; x=1794514619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
        b=mrcSYXGptPDJHJAovqmQFwpy/kdZFhg+bYxSvYYA37/Wji+95WnDy3+FSsN7XSSfgN
         xp+cpfT2NsjcsDPDrFBC/nx1ZOl54lFY7lRgBK3pza4I3FMzTpyRLi2cTqy1hgtQtvZc
         V/6UF92Ld4Fj1vcsS7s2Mo+TgDebUJSbIUQ3xSbH2epVlIKUC55+J/TJixc+578MhBCP
         IpD46CIryUNcoCURGNqoHX9QMc80xVH5htU4kj3p4kh2JUQj/eeoblE3SJTlg5xBIC6F
         +PyJMcYjvxFJXHzdVcYE72LZPiVNYtVKBmHn0kcq4RTqCvnHW5G7dQfKDKBaModKdHdn
         d92A==
X-Forwarded-Encrypted: i=1; AKwUvBykKV3YnMe5KR7zY6J7U92fNdpGvQ/2fvotqDejmopK3soIYwdFf5kavVlk11GWD9Xno7bLtNpplCLvb2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hsieh7AgabMtnBYGLUiyVrTfAO/RN+HyPbjUZyywV4yqgUqzo
	BVMOouQ8wbX4FykT/eJF6KfZGrn2e0gXb4hi8DEm9YbTsaTwTJUREYTiwOVFAhGaaTzedh5p7t6
	Oa7LQ5GD/WBSBYHPu5LET9Kpz4bwKfCVOfoAfA8CBfjvUIVXbLo5Z+KSLIa8YSbRUx88YLfbnDt
	ES+0mR8Ij6vkCQ3UUP8RZedzqKI+bqEBOA7B6LDM/V
X-Gm-Gg: AYBFou3h1C3W3Auxs4LvP3UmmpOPgRQQ0kkqojftnH2tCQFUH1UOAq5wHAAE7BBLvDY
	JKymgCPL1gXK4fVTdj/2wikxkr5nTGlhHoo1Yx5xZj5KyWGHxmyoXb4deH4XKz7v1LT2bBBjaOB
	Y7nBYVLpHoUCp1karwYTZ1Yk7LYtT7ZJc7CBNmaqQxf5vyRZWPRwLGhErjXkCSIPLmcYYA8T4Gn
	LAXPT2srnmQztcL33xwfSBEYzse8Zm6XRIxL2TZSGnwBmO+iHa1YY3TiVrto4eA1VPXO0+wRrHl
	dQ==
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id a640c23a62f3a-c4d35519e9fmr43190066b.27.1793909818796;
        Thu, 05 Nov 2026 12:16:58 -0800 (PST)
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c4d35519e9fmr43187366b.27.1793909818311; Thu, 05 Nov 2026
 12:16:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
 <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
 <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com> <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>
 <DMN0USP1E59A.34N710IJOO0PJ@gmail.com>
In-Reply-To: <DMN0USP1E59A.34N710IJOO0PJ@gmail.com>
From: Martin Kelly <martin.kelly@crowdstrike.com>
Date: Thu, 5 Nov 2026 12:16:21 -0800
X-Gm-Features: AclHuK8JgYiZJpf7c-VRiUqEK3vIdAU7ZjKP7fLp1Y2VHxGJrDEumK1dGFkMIGM
Message-ID: <CAH=2mMCmmmjq0HEA9xxtFyaupDy++zJmd=aAJeitEHtSmoXxyw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Mike Bazov <mikeba@sentinelone.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX2DyRGNElKKsy
 yrQjH6JC5psigITrTS7CyHTdlCnTZLWOZ+wHVk7SXZ53Ray5Njkf/xf7JjC+p1bthOp4Fd08roT
 z4whhwYdYkECOKadA71RVITE+T9Na4p43wvMf2+5Pr3yojq+2WDi
X-Proofpoint-GUID: 4Wa4QiOJDBD0QdeRJjX8qPsO74oVOvay
X-Proofpoint-ORIG-GUID: 4Wa4QiOJDBD0QdeRJjX8qPsO74oVOvay
X-Authority-Analysis: v=2.4 cv=Rc8FmFtv c=1 sm=1 tr=0 ts=6aece43c cx=c_pps
 a=Ak8bExYEjeps3Jj0Zi+cTQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=2KvRFfd_T_-xjmS8C1aD:22 a=pGLkceISAAAA:8 a=BM2dtbHZsqdhYTBwM7sA:9
 a=QEXdDO2ut3YA:10 a=IIT_bRn7abC_HnDGr_W6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX8Cx8XR9JuG6P
 RZwKGdhRk1FbZJDcDikynvlNgxE6+LP5JwFdMQ3rGT4KPtf+KlM3IjN8u4bo3xpxGoxraH2m0+B
 HLX3HfMaIeuOlYCDVrIc/Gx61HAagl93/eJjzSs271Kj/MgaWTUxwXUMJ2S7yt377tuPlxuq6HX
 ZLBbDHKcRur1VB/uJlMv/yXrCXVpvh4tdSiGNRqXU394etGHQP66p5QnUCdGnkfDZfNeifimSmN
 TZKl1KD0Ubg9rbeRC/SlQd4PJoaxQClKGedlGvcWZ1yDMpK0eF6TNQXQ72mbeW0WTxioWEnvc2y
 AJS/ov6bNB1ko62lhml+Ho74jkKFYVFpkU1aUZXiWz+aIVN9lwM2TGA8nic0YhS8BKVG1LuE1+A
 adhZW3HfQYP5FeJEemQbU/ELkkgr4cyqYfr81p6ijedVgpb2oYxWM7+kcRDoNThgDYEtAclYgao
 9gyAUuYq0RAxVIpfEZA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050080

On Wed, Nov 4, 2026 at 9:18=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> what do you mean? the reentrance prevention counter works on PREEMPT_RT t=
oo.
> per-cpu array are not corrupted there.

Sorry, I should have been clearer. The issues we hit were with using a
single per-CPU array across multiple *different* trampoline programs,
not a single program exclusively using a given per-CPU array. The
verifier doesn't prevent this, and we hit it on RT kernels, where
trampolines have always been preemptible. On 7.0+, this issue is likely
now exposed on non-RT kernels too. The per-CPU issue doesn't affect us
since we stopped using per-CPU arrays, but the recursion_misses still
do. Since prog->active is per program, the per-CPU exclusivity only
applied within a single BPF program, not across programs sharing
maps (which is very common).

> Thanks for the numbers.
> Are you saying turning off HRTICK is not an option for your production?

We support many different Linux distros, so we have to work with what
the vendor provides and cannot change CONFIG_ values. Since it's now the
default, it's starting to be used by distros, which is why we're
noticing the issue now. Changing it dynamically is up to the customer,
and if we changed it on their behalf, it could affect their other
workloads. Debugfs is also not always mounted, and it still wouldn't
help with the increased drops on 7.0 kernels, since we have misses there
even with HRTICK off (1 in 61,580 on security_file_permission in the
above data).
