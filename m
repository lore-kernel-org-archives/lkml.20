Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0C2FBE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788829488; cv=pass; b=sHQo7bK+2s2ciMO4zeBdLo01G9tD88TmQZK1DB50IQx4+SXAvKBrTKO5AW393IYx7vZPzLLO8iSTv3ggY2FqUizOR0dvey+6Vqf2eP7mjNpJVzaiYpNDUdvbcDbYGvv2VWJ5mdpiP2QAAKUkNlMg9gZ0e4aGEyUfXZ71yz2CEIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788829488; c=relaxed/simple;
	bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcalyPgMuU8CJTeRwMWX0VfAjmfYk9ntZGGPWwlsz6wsr54nZ8eu08MHM0SffKXKpmDCKB4C1r8z3eWctNfPXQNChDB6391r5j+nqhqJ1Ub69nUsaJ6y1O4pPBywO5O3Od32VViVksfb0SzZOW25TEse/qsC3cQSwGLVIX/NUVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gJmT+5uE; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJmT+5uE"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso365301cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788829485; cv=none;
        d=google.com; s=arc-20260327;
        b=A3LBClmctGFUeaRPqRhLdMCn3cgFKGQaMWwKJcrCw2kgsNjiZAPYIzTIFgR5pijHUY
         JBqDEDZQuvl0gmqokUfBl+KUamX6Qw8Y7NhlHF1TIzq9FtdpKbqZl/9y8ASNP2W+EhrO
         6kqnLoP1z1FrFSFL4FQQAImbMsiXF1gQHOIewhhhl3PK9T0wy1K8ZTEAamdEmS5BPGYk
         tdNhybiH/cwVu/lLyMYxPE9vSkgFMMxDKoh60rqM+i9Njg2lS0QyTnk6lsNDAcy5mhoQ
         aMCCLXBpjQ9jymfajv3V4+lmXpj15wVI2WDL0BrJoDNfDN/x4YdgbDacr6UgXsbOFfhW
         VLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
        fh=xk8ZLOnvUMqj7MyHtwe+UN8YgLaAQuG06t44Z0+KskY=;
        b=iPod/jrSQ/OWwrCesG07m4/q9IvIzRpWxQ7/GPZjQYLZWz9jdHCNuBY1UANOdFI0PM
         VwE4+aT3ZaK76y99jPl/Sx6CiUhPDgOatZ2k6lkVWu9PBVvikgy7cWkodCiTMsaDZglU
         JmStLT5lb09gtOz7T3SgXkvgfkLE8TKoQEAOD6Q5sSqWWf11DVU5CvNIMA1kbadAdMjC
         cdXWiyPosKkIUR3F6CMoGFxLoOe9Wy98pxTgeHyCMraMkVGMO7j98YGrnAdcLoFsw3UG
         PDHp1X9cI9SRkDfwToByj53YI4/HNZS4et+T8PAgITBudahpU/rOkXUxyRRkKX2MC0cT
         SW0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788829485; x=1789434285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
        b=gJmT+5uErd39oXoED5mFtQ4vLRzkju5/IvJoaRgV56H48nbHOt6vprWKNQwLOtKw2S
         lU/c0o9PG+poWdRIO3Z+ULp/OuAkUrsLTytKUTPaJVd6PQySuFMJfSISYoONT/ESfgb3
         1juErdND46faECiuidgPEmfyBMhXlQ6lpkfOJ2mAdQGMOadKpJCi+OtxfY1dOcuaEtVu
         JKut3ZuJRPKE4suQ1osejG+x63cTDJgssIJJ45SbZzBis+87LWjqlkDDZqAiCA5DfJrh
         tcoscdb8DAvkvn0EF4gDsLxUBuaN/M7Heo7o8GZid9Vc+AqmnPoJMiJ9XKE5AiA5koh2
         AIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788829485; x=1789434285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4XdQovADM5RSeHI+/ZuPheISmstJfmeHSEtcR5uyzk=;
        b=a2u6Lsoy8s0te0Wdd9aiJSxUfVcXQUwEtXZSrPH8arRxln0buw9p4vO4ejbtJII1aQ
         sQ0yMRqiyndsA3jLNqMp5yAUxE4obECffHrYt5oIPp8ppHzJ0cjEtbmygeHacVag2whx
         PYhJaAgbwg0N8cS9rXq1ZJCwOZ99ob+tvUHvPmDp6xE+kOuYz3Q5pzpbDV+8JIBSIKr7
         mkRljWQAuWgdxReDeHvQwwxyMAG+W5vSAguzWp1VUHZVvG9gumCHZLlBcSumQL3mFtbN
         HqMhD6/5pnrSE9Z69+g21nj1gMdtpuF5g3ir0Nt+MfKlVPOuEvj3NwGaL3a+sEzFHSrA
         2Eeg==
X-Forwarded-Encrypted: i=1; AKwUvByLPpfiaDaPRg9HyqphXUKBYFWohrugw6+Kq3MkWt3ypeOj1aTyXQb5sPVlR5qXsCqc+VzbAHa6wlvk95I=@vger.kernel.org
X-Gm-Message-State: AFuF++n9UEkcpc8zFNfNTrch6Gg8rRCTRrQdNhOSQxof1l6QiKuGGmE0
	FHtjOYyIfHBgOwP8wh+b/YrcorK+PS1rdIZWtY6J0Sj6UzCWj/0qWEl9AUfckSzmhZaKRpus3K0
	G/bE9xrfk0H/CX4ZfseZsAiY6uaBXQYfh7/sza3zh
X-Gm-Gg: AYBFou1u0EqUZtni+FCx0Lq1YLReco+AU62wRAk50bBsWGQJzraebEUcf/08kcgSJDi
	ol2UsIy5KISvCJj4YgdH/ByE9ct9aD+kI2KxeXnh2fOFFHT+E3Qh6Lo8vfhf6anMpONmPkHD4ry
	ofiCkz0Q0K9h+6H3kwtt4fzhdgTQdLTvjnEekfDmyCaUNYkqlGYkLrkYFEV+pcyF3GGn84oQikh
	VkLUR24sklYs848I0gC+OpEOrEChonwXLT1So2Ux+YOlAY9zra9NPtMcA2XepMj8O6SHBcYj96m
	jwjhlT3/VjMkXFVA1hERNIGNUQ9oQyjfosk9D21edtCf0sSuN6QSqRREwGhzPtO+hkTE4fzQa1o
	oMj+1FOGjfOD8uqNf3yN433xPldHO
X-Received: by 2002:a05:622a:e416:10b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-530810b149cmr15210511cf.7.1788829480213; Mon, 07 Sep 2026
 18:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904031912.2133476-1-tweek@google.com> <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
 <CA+zpnLc-WAqE9rA0PsjvOFe_YCZOdVj9YAzuayGXx0nhpqtw7g@mail.gmail.com> <534e5a3b-5160-4619-8b2e-27a81783e17f@linux.dev>
In-Reply-To: <534e5a3b-5160-4619-8b2e-27a81783e17f@linux.dev>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Tue, 8 Sep 2026 11:04:21 +1000
X-Gm-Features: AcwNN1VZYaBih0XkaS7qOeRNbkcxHADyZeWVg_y6k7B5EJaVTTRllbZ02cIFTKY
Message-ID: <CA+zpnLeiZrmvNeatnbA1RSRUVFswXBsJc1S0=mZS6cF_g1UbSg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: Move verifier failure tests
 out of test_global_percpu_data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:24=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> On 2026/9/7 13:46, Thi=C3=A9baud Weksteen wrote:
> > On Fri, Sep 4, 2026 at 4:07=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev=
> wrote:
> >>
> >> On 4/9/26 11:19, Thi=C3=A9baud Weksteen wrote:
> >>> Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percp=
u
> >>> data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in com=
mit
> >>> 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu dat=
a")
> >>> two verifier failure tests were added (verifier_strncmp and
> >>> verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).
> >>>
> >>> When bpftool generates light skeletons, non-autoloaded programs are
> >>> skipped during loading, causing the loader program to store subsequen=
t
> >>> program FDs into incorrect skeleton struct fields (e.g. dump_percpu_d=
ata's
> >>> FD was stored into verifier_strncmp's descriptor).
> >>
> >> IIUC, patch 2 will fix the issue totally.
> >>
> >> Better to add a subtest to verify both the issue and the fix?
> >
> > Thanks for the review. That's right, patch 2 will fix the issue:
> > bpftool will fail to build any program that is set up that way. That's
> > why patch 1 is necessary; otherwise, the existing test would fail.
> >
> > Just checking your suggestion: what I can do is add a new test to make
> > sure that dump_percpu_data is set up as expected (fd > 0). I can write
> > a new test_global_percpu_data_iter_lskel, that is similar to
> > test_global_percpu_data_iter, but for lskel?
> >
> > I can also write a test to ensure that bpftool fails when light
> > skeletons are set up with autoload=3Dfalse?
> >
>
> imo, the rejection of autoload=3Dfalse prog when generating light skeleto=
n
> is not friendly for users. Users should not care about mixing
> autoload=3Dfalse progs with autoload=3Dtrue progs, even for light skeleto=
ns.
>
> The users-friendly way is to skip those autoload=3Dfalse progs when
> generating light skeletons.

Good point. I agree. I'll send a patch with this approach instead. Thanks.
