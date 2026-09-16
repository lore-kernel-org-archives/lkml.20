Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57446D2A5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546571; cv=pass; b=WecB+TTp90+LsA3FP3ttc9V0f3xf5+dv0TWrQlC/hWMAnRnCmDfTJT2TYirpfgpcEF6LjpaoPl7pnsBCCUkxpb4o3saMuXkslpXppeR2heLtKnYrzDz3lTVbKISbiND8jQdjs+BNyb8Hir93ps610p6PKofYtXODhWZ+VhUPU3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546571; c=relaxed/simple;
	bh=9wVpS69NbCuLJV8aNpcze4/Dm30Ali008Uwd+6KAa3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdKyLFm9QZrZIFX2aQJbrl/tcx7LYD/kfygclZcYDjy1d3CU3lAvE8SA2QicjWzTTPFALVfXKyjXJzZ6ljJeK/SYF+vJS38/OChD+iJv7aw4Fahtb5qVvfa45oDP72sv8hszVc3FUPgydYbeHYRyRFSAZijmBNHklT7OsQfOQAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=claw5/PQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmsExd88; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="claw5/PQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmsExd88"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G693Oe1333366
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=; b=claw5/PQwPgEkA6R
	gOWj7y+8gEf+AEzC8YQp3V15E2t47LCjQnYj9rCRqmO89OG5slDVwnmLUdM+NDTu
	mBAsdzHz6YgM6pA40lHZAjWjwvnECjRZWChpEPwknUorWd1F8G22uat6kEVgSVim
	sf4KqgdWKN14vIJEiANg9g/1GBL87Lm9b5+oZN+BWcvZPqvehCL/yzPIZ1yLZOd/
	U7KJgJ4VPRyKRxIGZswIvrIuIAJp3m/7ddd25qGXlul/mA38RngjWq1tXFd54N60
	5CvvgfqdHrJhnhZPipE+dMz8Yc0WX+y98e3neS0kzRbgGV5J7jm5dIyXFycMuqkc
	AOFAKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnjttv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:15:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e1bbe2c30so957655a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789546553; cv=none;
        d=google.com; s=arc-20260327;
        b=nLGG40z7fCXRdUoijHKgzg9c62z81MMmucWbt/7Whp1mYd3XXTZrnbY+vkRQtUMxAM
         xP8+W3BK15oVn5wXUeyLYKkffFoFtjiNXmB351VaA6PImLdanEuQgSZf3ghUQdh9OfbR
         mHj2/SlPfWd9/ahkkKnwvCk3Mc5Yps/ltlKp4ySTWjwvo2qQAlaTITLlBo/ms2P7ZZEC
         QfdjrW0Q/5UB2yIEXihMKPge1VQrcuZ0Jl0P+BzrKWnbAkVsLKu4pw/4y+J+6DAvgQRi
         sO2Q7z95Z/YTmeU1MeQkZfcMMWRABg6MrOciZtK1nZVoxk1e0x6NLY+knsorUVyPYGby
         HKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=;
        fh=s6qf9RXsCffLMIDJbz3B6i8CeEkAOzsFHXlRdLoKuCA=;
        b=rctJxTEBsiGsG6GAci3DTNah9ba1ffTwZvmXCkJoykDNrFCC6cGVKYGyieTeOaW1Z2
         tTX64KTKi6r+1Y304cqI8WPEvbjv7H+kzSt+II/Y4VEzwS9zdXU+ip8tdN7xg0YrKh4N
         7US4MeiFTy6q2tkW1vWhRbmL8xHxhQ2MbBjoWK/M8TFyzErxpXSWVhr6NFCmmtTGD6pv
         W5ftIKOr8BnqgTPMc5VA88DHqFDk+wsU0xO6xQjLTxloU32MxAb2FaPlSWvkFiS1/gyM
         DWP8RVvmJjLTdDviSeB7y2UpVg24Yqxt+VsCTHIeFqJcOBkGdniWxkTj4oVQsRIjHjIb
         YW+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789546553; x=1790151353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=;
        b=LmsExd88Aj6/lfvyfxeWNw2gI49Dy23IaBrcrgKBA0rfEFTfGbFQ9LswXETSA/Jzee
         yuK9fU30kus3sMV/pyR9yeRYtzzp4gvAB+sGoniYKYNrrlrOzf/4x0i8vtrX8uDF9Oa2
         SFVp1PgAOEUFWblARp8AaP96Z2XYBimAeHB/ENCnt/EBQPmE3EwYtPNk6+pE0typ2TiJ
         Q3Ohzg7C02+2PMYYkFEZmnyjxwO574k9LiSxGIBUQPQbwaFSOYqOzrU8xiHW+YnwSzCe
         Ed9k9i9buAhh6+y44mNcLjbcvoICwLt4Oao6QwLiUSrYxFt13IVqWSMInDthIkwXp0XF
         OY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546553; x=1790151353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=;
        b=y0LBuq792XXKFHnJrwyKP1Hh3YAC76FUSqoKvDWe7CUNtj+sz4R6jfFZ1twt191YRN
         RuA8K6Q7lmDHK7eSEWbAbnLk8ORhfBwSvtAPTG1cV3PMhYDuVEnT4QCdqpHIMLe82yPf
         +AGxpAc4wE0u8vqiJ/kmYuuKePvzL4xiTCUP94q+oKT/G2GqqXhFdZnaL5yDyujJohLh
         TyadrMNVD1oS0qLCOIiHADwHxbCxhFfb5BvrCTqE55cS9/IlO5rtrbaBKcAOhCyTDOej
         SCviZIzZrIiaMXLfUvv8H67t1CwLhhWGL42K4FZYP81oR3nPux5/TwQLlORVP0xPuVJA
         u2HA==
X-Forwarded-Encrypted: i=1; AKwUvBytfNNVHupwfD+Z87GDayp0DRAxD07sEFdnRo3cw9jI5B50xJJXlKTFZvS0QB9M41vtGzy/cAsSd/Ptc6s=@vger.kernel.org
X-Gm-Message-State: AFuF++kGbMeWv/gjdJqx5Lhew4NpBVb0KGUX02+RVw684pPEfGzUaV1h
	CZUeYrILtCSB0jrSaRHvRp7+u9lgs9L2vqj6gaMHUTQNq3jG7YLNGbhd3UlUd9Tl7erZuigjU3a
	LV+aCiq1Rbe8zH3kWmkJyAscsAYTiSL0+VW1GBBNh3REvoZU0GWycgSBvHVaO6QHNA3pVAeJnv9
	dyXiKuy1fM47506Zv3eQdD8lFNK6BfjCQxDwX7tGPJ8g==
X-Gm-Gg: AYBFou1U6Q7i9QDt3x2QhfgLPkFhevrARbae5ElDzyExncnzoYv40JgU11fbJrGC3PQ
	gBkEfV7jIKrU/OWnxjCYfmroKkNUeve9qsR7znuSh+7CwEW0b/uzFFBgQLDWYXasmaRVxoS4gUp
	TxYoVbZMj3aqltJY2ItZk4mwry5X/NBcW80q0Qa20tNLv+Nx47UGKHC+iCWlY=
X-Received: by 2002:a17:90a:1650:b0:39e:248e:fdeb with SMTP id 98e67ed59e1d1-39e248efe80mr1347687a91.19.1789546552793;
        Wed, 16 Sep 2026 01:15:52 -0700 (PDT)
X-Received: by 2002:a17:90a:1650:b0:39e:248e:fdeb with SMTP id
 98e67ed59e1d1-39e248efe80mr1347640a91.19.1789546552255; Wed, 16 Sep 2026
 01:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
 <CADRr4be9p14tQcx=v-jVwfXwka0eBV8MWPfj1G4qcqv=yfxjfg@mail.gmail.com>
 <CA+Ht8=Y3CJA0jq3o0j--jA-avcBm576zm-54+BxoRfm6JB72Hw@mail.gmail.com> <aqofe_pdCdPhpRpD@blinky>
In-Reply-To: <aqofe_pdCdPhpRpD@blinky>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:45:40 +0530
X-Gm-Features: AcwNN1UTFfJ6I6-UOW007DWbngDs9XjQy_I5mhiVO6AT8mA6yf6wpB_-UGiw5wQ
Message-ID: <CA+Ht8=YYsG4w3G44M0qmXrg88j3G9McunjTqLghwZ=5iJVN3dA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] riscv: Introduce support for hardware break/watchpoints
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Jesse Taube <jtaubepe@redhat.com>, linux-riscv@lists.infradead.org,
        qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa5039 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=JfrnYn6hAAAA:8
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Szl7KQOmT0g9m7oTZp0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNiBTYWx0ZWRfX3WmGza/BvG9a
 45JrjxXD9XGHa9O6PXVay3zrfO8BuM0I/VTzSLRv2ZRfLzT3xpPfkEtuTgrFHEnUosbhqWrRJFZ
 hyDQTHJayDCwo4cgFM1h5H+xTfGLT6ta7D+HPpvOFidK7pWGXGQzKmGR/51aNQUNqvvOsOvx+Mq
 BaloWaI7i4Q4UPAFYgoUvI/Sf5cJQ5cXnnY0Bfi2K1URiPASqfWtMQKFADkeuFFhjlOU/vKiDsG
 r0H2cjP1QYi2e0QZSrMdb+SOLeYY+Yahq2WQdLraV/PPutLrpk8UBCfKBDPK3Px+U9L/rsJwygu
 hTQ0i9SDL5koNTZK2bGKWBkwLYaNbVWcQVRxDBtCLomzldzF3OLEUd+w4GAIMTAmyfPtvleP5qG
 Jub6U5uxyJ1oRGGf7lUZ+9kkp2D4W2pnXiR99ye0OZNdfwUqSM5NrSQ3KDBIJnuE8zLRX0WhGkD
 lR7HLl6yhzgkwvuWy0w==
X-Proofpoint-GUID: XuulSO_BiE8OY0ubJQEdBLySTCiSP4wJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNiBTYWx0ZWRfX79ghID0+iTYL
 tAOUT55C7VG6PAUQEs1ZlnsRT7xnhj7ENBMJyUyJtxfOuNSzsiHhk6usvibOj1s0o36IgrLINga
 NdeGU5gsYezjP73+s3DdLFqFJeOk68w=
X-Proofpoint-ORIG-GUID: XuulSO_BiE8OY0ubJQEdBLySTCiSP4wJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160106

Hi Charlie,

On Wed, Sep 16, 2026 at 10:18=E2=80=AFAM Charlie Jenkins
<thecharlesjenkins@gmail.com> wrote:
>
> On Fri, Aug 07, 2026 at 01:30:09PM +0530, Himanshu Chauhan wrote:
> > On Tue, Aug 4, 2026 at 10:42=E2=80=AFPM Jesse Taube <jtaubepe@redhat.co=
m> wrote:
> > >
> > > On Mon, Aug 3, 2026 at 9:49=E2=80=AFAM Himanshu Chauhan
> > > <himanshu.chauhan@oss.qualcomm.com> wrote:
> > > >
> > > > This patchset adds support for hardware breakpoints and watchpoints=
 in the
> > > > RISC-V architecture. The framework is built on top of the perf subs=
ystem and
> > > > the SBI debug trigger extension (Sdtrig).
> > > >
> > > > v6 extends v5 with two new patches:
> > > >
> > > >   - ptrace support: debuggers can now set and query hardware debug =
triggers
> > > >     through the standard PTRACE_GETREGSET/SETREGSET interface using=
 new
> > > >     NT_RISCV_HW_BREAK/WATCH note types. A simpler PTRACE_GETHBPREGS=
/SETHBPREGS
> > > >     request pair is also provided for direct single-trigger access =
without going
> > > >     through the regset machinery. Thread flush/copy hooks are wired=
 up so
> > > >     per-task breakpoints are cleaned up across fork/exec.
> > > >
> > > >   - Extended selftest: the existing perf_event-based selftest is ex=
tended to
> > > >     also exercise the new ptrace GETREGSET/SETREGSET regset path an=
d the raw
> > > >     PTRACE_GETHBPREGS/SETHBPREGS interface.
> > >
> > > I would recoment addaping
> > > `tools/testing/selftests/breakpoints/breakpoint_test_arm64.c` as a
> > > test.
> > > I set up a test repository here
> > > https://github.com/Mr-Bossman/dbtr-buildroot for anyone else to test
> > > this set.
> > >
> > > Unfortunatly this set fails `perf test 15 16 17 18`. I would like
> > > those tests to pass
> > > before accepting this set. My set addresses the perf failures which i=
s why it is
> > > more complicated.
> > >
> > > I would highly recommend basing your set off of it as it fixes many o=
f
> > > the issues that
> > > I commented on in V5. The first two commits in my series are
> > > refactoring duplicate code,
> > > and can technically be dropped. Even if you don't go forward with usi=
ng my set,
> > > I would at least recommend taking a look at it, especially
> > > `riscv: ptrace: Add hw breakpoint regset`
> > > and
> > > `riscv: ptrace: Add hw breakpoint support`
> > > as they are significantly simpler.
> > >
> >
> > All that is taken care of. There is a problem with icount triggers in
> > Qemu. Once I fix that, I will send v7 and It will contain single
> > stepping.
> >
> > Regards
> > Himanshu
>
> Why did you decide to renew this patch series without pulling in Jesse's
> patches?
>

I started this patch series long back starting from drafting of SBI
DBTR specification and PoC implementation. I had planned to add
support in a staged manner but Jesse came and hijacked the patch
series without intimating or consulting me. I had later patches with
me developed well before Jesse sent the hijacked series. Then later,
Jesse abandoned the series with a lot of issues still to be fixed. I
picked it up again and implemented it in a proper way. I am still
doing it in a staged manner. More follow up patches will come with due
credits.

Do you have any concerns?

Regards
Himanshu

> - Charlie
>
> >
> > > https://github.com/Mr-Bossman/linux/commits/dev/jesse/sdtrig-rebase/
> > >
> > > Thanks,
> > > Jesse Taube
> > >
> > > > Single stepping is ready and test but to follow this patch set.
> > > > Virtualization of debug triggers are pending
> > > >
> > > > The SBI debug trigger extension is specified in Chapter 19 of the S=
BI
> > > > specification:
> > > >   https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/=
v3.0/riscv-sbi.pdf
> > > >
> > > > The Sdtrig ISA is part of the RISC-V debug specification:
> > > >   https://github.com/riscv/riscv-debug-spec
> > > >
> > > > Changes from v5:
> > > >   - Rebased to v7.2-rc6
> > > >   - Simplified Macros in hw_breakpoint.h
> > > >   - Took care of the review comments
> > > >   - Added ptrace support for hardware break/watchpoints (new patch)
> > > >     - PTRACE_GETREGSET/SETREGSET via NT_RISCV_HW_BREAK / NT_RISCV_H=
W_WATCH
> > > >     - PTRACE_GETHBPREGS / SETHBPREGS for direct single-trigger acce=
ss
> > > >     - HAVE_MIXED_BREAKPOINTS_REGS selected (break/watch share trigg=
er pool)
> > > >     - flush_ptrace_hw_breakpoint / ptrace_hw_copy_thread wired up
> > > >   - Extended selftest to cover ptrace-based hw break/watchpoint pat=
hs (new patch)
> > > >
> > > > Changes from v4:
> > > >   - Rebased to v7.2-rc4
> > > >   - Fixed rv32 build error
> > > >   - Added pr_fmt to print KBUILD_MODNAME
> > > >   - Changed type of shmem_pa to phys_addr_t
> > > >   - Use per_cpu_ptr_to_phys instead of __pa for per-cpu allocated m=
emory
> > > >   - Print successful registration/unregistration message when no er=
ror
> > > >   - Added RISC-V DEBUGGING section in MAINTAINERS and added myself =
as maintainer
> > > >   - Fixed warnings from checkpatch.pl --strict run
> > > >
> > > > Changes from v3:
> > > >   - Rebased to v7.1-rc3
> > > >   - For watchpoints, check tdata1.hit via SBI_EXT_DBTR_TRIG_READ an=
d keep
> > > >     STVAL-based matching as fallback
> > > >   - Improved watchpoint matching when STVAL reports the lowest acce=
ssed address
> > > >     for wider memory accesses
> > > >   - Program execute breakpoints with SIZE=3D0 (match any size) to a=
void misses
> > > >     with 16-bit/compressed instruction addresses
> > > >   - Updated selftest to avoid deadlock by replacing unbounded sem_w=
ait() with
> > > >     sem_timedwait() timeout handling
> > > >   - Updated selftest breakpoint function so it cannot be inlined or=
 optimized away
> > > >
> > > > Changes from v2:
> > > >   - Rebased to v7.0-rc1
> > > >   - Fixed warnings from checkpatch.pl --strict run
> > > >
> > > > Changes from v1:
> > > >   - The patch adding the SBI extension and function IDs is already =
merged; this
> > > >     series builds on top of that
> > > >   - Added breakpoint selftest in tools/testing/selftests/breakpoint=
s/
> > > >
> > > > How to use:
> > > > ~~~~~~~~~~~
> > > > OpenSBI:
> > > >   https://github.com/riscv-software-src/opensbi.git
> > > >
> > > > QEMU:
> > > >   https://github.com/qemu/qemu.git
> > > >
> > > > Linux Kernel:
> > > >   Apply these patches on top of v7.2-rc6.
> > > >
> > > > How to test:
> > > > ~~~~~~~~~~~
> > > > From the Linux kernel directory, first install the UAPI headers (re=
quired on a
> > > > fresh tree so the compiler can locate <asm/ptrace.h> and the new
> > > > NT_RISCV_HW_BREAK/WATCH definitions via KHDR_INCLUDES):
> > > >
> > > >   make headers
> > > >
> > > > Then build the selftest:
> > > >
> > > >   make -C tools/testing/selftests/breakpoints/
> > > >
> > > > This produces breakpoint_test_riscv under the same directory. Load =
it on the
> > > > target and run. Sample output:
> > > >
> > > >   # /apps/breakpoint_test_riscv
> > > >   # [perf_event]: Breakpoint test passed!
> > > >   # [perf_event]: Watchpoint test passed!
> > > >   # [ptrace]: Breakpoint test passed!
> > > >   # ptrace(PTRACE_GETREGSET): Number of watchpoints: 2
> > > >   # ptrace(PTRACE_GETREGSet): addr: 0x82888 control: 0x8080
> > > >   # [ptrace]: Watchpoint test passed!
> > > >   # [hbpregs] breakpoint readback: addr=3D0x10472 type=3D4 len=3D4 =
ctrl=3D0
> > > >   # [hbpregs]: Breakpoint test passed!
> > > >   # [hbpregs] watchpoint readback: addr=3D0x82888 type=3D2 len=3D8 =
ctrl=3D0
> > > >   # [hbpregs]: Watchpoint test passed!
> > > >
> > > > Himanshu Chauhan (5):
> > > >   riscv: Introduce support for hardware break/watchpoints
> > > >   riscv: Add breakpoint and watchpoint test for riscv
> > > >   riscv: ptrace support for hardware break/watchpoints
> > > >   selftests/breakpoints: extend riscv test for ptrace hw
> > > >     break/watchpoints
> > > >   MAINTAINERS: Add entry for RISC-V Debugging
> > > >
> > > >  MAINTAINERS                                   |   9 +
> > > >  arch/riscv/Kconfig                            |   2 +
> > > >  arch/riscv/include/asm/hw_breakpoint.h        | 299 +++++++
> > > >  arch/riscv/include/asm/kdebug.h               |   3 +-
> > > >  arch/riscv/include/asm/processor.h            |  18 +
> > > >  arch/riscv/include/uapi/asm/ptrace.h          |  53 ++
> > > >  arch/riscv/kernel/Makefile                    |   1 +
> > > >  arch/riscv/kernel/hw_breakpoint.c             | 677 ++++++++++++++=
++
> > > >  arch/riscv/kernel/process.c                   |   5 +
> > > >  arch/riscv/kernel/ptrace.c                    | 507 ++++++++++++
> > > >  arch/riscv/kernel/traps.c                     |   6 +
> > > >  include/uapi/linux/elf.h                      |   4 +
> > > >  tools/include/uapi/linux/elf.h                |   2 +
> > > >  tools/testing/selftests/breakpoints/Makefile  |   5 +
> > > >  .../breakpoints/breakpoint_test_riscv.c       | 765 ++++++++++++++=
++++
> > > >  15 files changed, 2355 insertions(+), 1 deletion(-)
> > > >  create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
> > > >  create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> > > >  create mode 100644 tools/testing/selftests/breakpoints/breakpoint_=
test_riscv.c
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
