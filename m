Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA136DA1D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486823; cv=pass; b=K46SwClT/fLi5G4KLRPKI9N8PFkHCVjgvDH+CtkLbYRvTwyUqRv20qYw6cA+/K3I0i026Nt8mWvLROyMs24VzEbDnjqM5vmHHBVJTfMveKwalJa7trAEtS4MK+aobgnqVVw/in+FsLk8KTeW4h06/c30bzfBeAeHGfVfIzavDn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486823; c=relaxed/simple;
	bh=SpJphGXF4dhlvH7pBoBZzsINpwiYk876aHliTNz9M7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pw5hj9rCfD7kbB+XNEBNkKTxAEJZvoSW9P6CwmEiWmg6ZSiJr+kPn6ALH2QF/7dOG4v8azZDFdhdclCmEAP40nWUg93YC/NCtaqrOW6qnfF5lXd95Oo6kZf+lfV7bow6g8NtlYa2XIyAEQhscdssfPRoxKp0NQcY6hlWIyaOIF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9GmIfId; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9GmIfId"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so539371a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788486822; cv=none;
        d=google.com; s=arc-20260327;
        b=E4mPkQ2/EYKpwGJ7ot+7YzVOWPWUfdsi3TzFyyOaNSaNe37V0kEZhFjaG7ljW5qj22
         O6zz86xUQqGykP+ZQdcbz0SysPc9RUXfJZtfqY9IWclJtQe0jXtMg5mPhg9It/5kuLwz
         YBoGCnjmkLMaDZB6cE6BJPyxF9Kk0nECuQJohAUPZPZRkohN9DJUz8J5kowVmhWjkwsB
         XNGiEqjXwe/qZGIK9wVOL4Okh/RKE0fcyZ6gKsNJoZ3iTPAHMoHuUFCN7D9GjByxiztD
         MreTD4DjOYiryRE5BWIknkT8mdHZYsQOBTx6VXSc/cPpsn2wxG+VVLimMxJykgq2eWSx
         iLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SpJphGXF4dhlvH7pBoBZzsINpwiYk876aHliTNz9M7M=;
        fh=S3iIl21sT9EvFVvZsmvMd8P+MtcmyaIzsqj9apTwnjY=;
        b=U/M3NJuP85yIEKtzWtgzqof2G0LCFS+SRO45M8uwSZ+F8MhU9h088dcPepoiyWnyo5
         m8NMTuhDD0UKDC2QvOelGcOWyFW1HAdGQgVTgQRGLvkEqWa9JN2H8ylllmyh8M98iz0V
         ncPP4wydMyHc/QQD8BBVIfpcbU0uGBB3zXbhsEx8NexNXAiLgRtp7zwHRQXpKhBPhK1c
         DJAwhtCgXi7j5XGdQPJyU6c1RhF+XCmeCqoZ3+tnx39udQLdQOVup0m2Htxcwx8BGpLl
         kHmO4nvx9dw4G8BaZVCTXE0YXmo0CdYwtKpw4LDp2uUywgFL66utOaxiZwu3+/47JRTd
         rwiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788486822; x=1789091622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SpJphGXF4dhlvH7pBoBZzsINpwiYk876aHliTNz9M7M=;
        b=h9GmIfIdgMlKOCgjGLyMireRwGahrj6ocPHyxxVD/8vTTOszqH9PLeNgqLNuJoO2Wa
         puXnU9qnf1O87kKaOAZXNG6M1lY6loH7c0buuDerUiKvEhoS1xiuRUS5I1guVRZ+CJpX
         Z+YzcPppQxdnUCbm/NUVl/x+pULvq1roSGNihl4LmN8B5fTrIKNCgpeksk9L0hWRJIIL
         asw9SLNBIlzLQxnldySCjDYfZ+1Mc5ZzwOPDkO0sLOaGRYaTuMWGCMMZgTMxxd1Xx7Kd
         sDnNj7du7aARrylICH/PQNNghZVwG/HrjW77k2IumwgOABCQK6YZUOD29SanUUkxAEiu
         VAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788486822; x=1789091622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpJphGXF4dhlvH7pBoBZzsINpwiYk876aHliTNz9M7M=;
        b=smLocCA/7BOU1YlwyIvbuai2DvBVx/HsOQ3M995uOrO1bdmx20e4pqga+c2d1G7mIi
         SCoRcUSEw2iaAuBspB1orpBF7HyuFTrxjHr56NSBkctFM40aXZAdKM9n0OBdTXQsOubN
         gPhECLraZD+a4NIxSY2U9m719Oea81kkJ5H7TpYhekVGVVyf7YCEMJVPcfeGcFVze25V
         OGzNB7sY6MaOPdvgLzFEYS5arVkNa8cyWtBjuS8Wq4MJwIdkTouG/SA+v5ZmBobOitEi
         VItQVtnkZKgi99HcD9RjBi8dhSg+oGsmR22AP1SISnGRnkElVPN4lLcFsssiMGZn8F+X
         wA9Q==
X-Gm-Message-State: AFuF++mzNgCkcqPeLc5xyJmcSL0oREtrriKI7N5YbVRHxlTD6XKC/iLQ
	dJHe7u3AfqHLd/13sjAzyTpYT9lvLtkew2TPNUP/awHcUcw2h+/iBrvE8G406Iu0wHu8BrfOte2
	X+7YhFGA8u+GH4NfE0rafrSFwew0VWa4g1Igl2lQ=
X-Gm-Gg: AYBFou3uBZ07T8/8t2ztFtt6m3RCASMScbMpWoeAmXkUyFSoXflAVM0AvMb8xn6Bze7
	2V2F/r3U0yQsYwe6nL2Dq6q8svqc2KXsPsOwJK8BsvTc2LjKEbT+TdWL/SNZIQNFmPhliqrMZpG
	2NTsAX29JPkkQVyXE0xa9CumC+LFHhwKkrDjTFMmI8x7G0ke8QN3kCo9QyV6uPwAjxMBEVIy1cv
	lOcyi8G0mQcOc8QyAXvw2F+NgwCYNjwCEZRvqUrgbQQ5BG0BEU7C/9mjNM3vCNSzvcH+a7c3/C6
	W3dq7Sth2HjbGzrtrw0RvwhQo3FEKYhtX643Olxazw==
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id
 98e67ed59e1d1-39b260d2eb3mr3899330a91.7.1788486821763; Thu, 03 Sep 2026
 18:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHoDJCR6pTNtp6zbZ7V3ewsmqH38h7O-thjaHEYTE8hAhKjuQA@mail.gmail.com>
 <17c7fd25-9cc6-44c0-8e9a-43fa6f6aa451@arm.com>
In-Reply-To: <17c7fd25-9cc6-44c0-8e9a-43fa6f6aa451@arm.com>
From: =?UTF-8?B?6ZmI6ZGr?= <isxinchen@gmail.com>
Date: Fri, 4 Sep 2026 09:53:30 +0800
X-Gm-Features: AcwNN1UL3KtU_fz_2QdI6Z-CEIRd20sQ0iB-aGXi-1blbSWDwfrrFhlwZSfoOdY
Message-ID: <CAHoDJCQP_=WP+Btt3i+GWoJ6AFf-Zp2-NV0MohiuAximxF=Pzw@mail.gmail.com>
Subject: Re: Question about quantifying Linux kernel functional growth across releases
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for the helpful comments.

Your point that Kconfig counts may be dominated by drivers, and that
some subsystems reduce configuration options while still adding
functionality, makes sense. This suggests that Kconfig symbols may be
more useful for measuring configuration surface than functional scope
itself.

My broader goal is to build a reproducible way to compare kernel
capabilities across releases, and eventually answer questions such as:

* how the functional scope of the kernel changes over time;
* how much of that scope is security-related;
* what subset of kernel capabilities is relevant to or enabled in Android.

Would it make sense to treat kernel evolution as several measurable
dimensions rather than a single "feature count", for example:

* userspace-visible interfaces: syscalls, sysfs/procfs, ioctls, netlink;
* subsystem capabilities: filesystems, networking, security,
virtualization, etc.;
* hardware support: drivers and architectures;
* configuration surface: Kconfig symbols.

For security, is there an established way to define or classify kernel
security capabilities beyond simply counting CONFIG_SECURITY_*
symbols?

For Android, would comparing an Android/GKI kernel configuration with
the upstream kernel configuration space be a reasonable starting point
for estimating the enabled capability subset, while acknowledging that
configuration does not map one-to-one to actual functionality?

If you were doing this kind of historical comparison, what two or
three metrics would you consider the least misleading?

Thanks again for your guidance.

Best regards,
Xin Chen

Christian Loehle <christian.loehle@arm.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=
=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On 9/3/26 06:13, =E9=99=88=E9=91=AB wrote:
> > Hello,
> >
> > I am analyzing how the Linux kernel evolves across releases, for
> > example 4.19, 5.4, 5.10, 5.15, 6.1, and 6.6.
> >
> > I am looking for a technically meaningful and reproducible way to
> > quantify changes in the kernel's functional scope over time.
> >
> > I understand that there is no well-defined concept of a "number of
> > features" in the Linux kernel. One metric I am considering is the
> > number of unique Kconfig symbols in each release, since Kconfig
> > represents a broad range of configurable kernel capabilities,
> > including subsystems, device drivers, architecture support,
> > filesystems, networking, security features, and so on.
> >
> > For example, I am considering collecting statistics such as:
> >
> > * total number of unique Kconfig symbols in each release;
> > * number of symbols added and removed between releases;
> > * changes grouped by major areas such as drivers, networking,
> > filesystems, security, and architecture.
> >
> > I would appreciate the community's views on the following questions:
> >
> > 1. Is the number of Kconfig symbols a reasonable proxy for comparing
> > the functional scope of different kernel releases?
> >
>
> My intuition would be no, many subsystems even try to reduce the number
> of Kconfigs (with steady or increasing features), as long as cost is
> justifiable.
>
> > 2. What are the main limitations or pitfalls of using Kconfig symbols
> > for this purpose?
>
> It'll be vastly dominated by drivers?
> Is this really part of 'functional scope'/features?
>
> >
> > 3. Are there other quantitative metrics that kernel developers
> > consider more meaningful for describing the growth or evolution of
> > kernel capabilities?
>
> Maybe syscalls? sysfs writable knobs?
>
> >
> > 4. Are there existing tools, kernel.org statistics, or
> > community-maintained datasets that track this kind of evolution across
> > releases?
>
> I'm not aware of a functional scope tracking.
>
> >
> > My intention is not to claim an exact "feature count" for Linux. I am
> > trying to identify a metric, or preferably a combination of metrics,
> > that is technically defensible, reproducible, and suitable for
> > comparing kernel evolution over time.
> >
> > Any suggestions, references, or pointers to previous discussions would
> > be greatly appreciated.
> >
> > Thanks,
> > Xin Chen
> >
>


--=20

=E9=99=88=E9=91=AB

Tel=EF=BC=9A18600991213
QQ=EF=BC=9A177854940
