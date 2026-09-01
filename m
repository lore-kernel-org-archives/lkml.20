Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E053B4CCDF4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237081; cv=pass; b=hOh1uuMZbbthYVoP70bcYV72Qz/EUKcN64Lvj8OCJe2Ci/gSysVdgb3kZWWENPwbIKhFokY4gBYUNiejEF4mAZCbyrulnu7KgAPzQuN1iFJ5IWeWhjpm3hWC40zfA8Rbv3IlelkUZ1nxUq4Ph4YDAfFFJ7Fm7AwwYA4iLh4g9jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237081; c=relaxed/simple;
	bh=FX0nhEKouXbN0cOaxQkUE4HqDcyHbyV+RINDYZ62VQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3547iApSgAo6RTLOcksdvpgV4sJdocOPeXqvfp05nzlrK4MvCbJ2vytW9zcxvT3gYR8w9VobDKBYssJ3musGoz1YJdDY28aQn1BA1HCxx5OOeEDGdj0fHirbyXkI/nxJjUjGB6gGDmVEWkqnNXeN93wd7Oy3EGcskMmJoP6deM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bcvnM0Ev; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bcvnM0Ev"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c10e86e52so112501cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788237078; cv=none;
        d=google.com; s=arc-20260327;
        b=Xx4z128EJUSFv46sd/jzxDaZdeemkB/S3JUxRUIff+R1H+b7qnsw5dQgWSPmrJqxia
         XTCLciZDawu8u9JCLnaLOlu/K9Wu75adiyAzRjsrBFr3rI7QOX6gCJvyZKvXjVOhSxWM
         kJDjDc4hIu/NHN2+1d0KiYN/g3T6pRUM8ESxUHQ2oc8TEptiiUnbZ1y4ArMtqX2itXrq
         J0bHErmzRgp/JVa0/U2y5DuG0Js7LWEytra16EJi3BPwkkeqSjGjuEVI3PI86USJlwCk
         Wzv9wVD1i7Fm6dWE0OYuca1wT0QFcTs9UZ6GEt0K8fdbU+FKhQ+pQqUGxunREvqMPmDa
         hz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEJ7OhBX5NB/UHZTgvDkxBk1HpXEXeGzsORVysWiviY=;
        fh=40vBgA1HYe4NxgCR8gMfx3WJNXeprL98kc2IE7JRLFU=;
        b=KfY5Ipaq+g0ArIVEfNkKLdTisnVuOkHzaEqhip0OaDcNoyNQgTUSej51Fpqlhf08k9
         BE0MT2V9npcZ+9pSwdUTjw4UL+Cb/qo2VfoKg2lqcksgory8lI/HdZIm/x2PHW6LZ/z5
         dA7A7kaJiTlIajymokk8x4QSrCr2ja721xrPAwi3FE1yQp6McsraxcByRFd39TWolUVe
         gFNgaI1iSgS/MHb2Fg1rrHCeFwYIrkP2y+072QipgGk48DDLsKbib2A8XpuHvoiZz3U0
         QFixWwR1b677Ipp64/7Tsiq+cpAEO/2kFTBErIchiOaRobX/hBcPyH6ZXKM7UVZ0N6lH
         hMOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788237078; x=1788841878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEJ7OhBX5NB/UHZTgvDkxBk1HpXEXeGzsORVysWiviY=;
        b=bcvnM0Ev1rsjLH4d9NysaloWAk6hH35T3e+vJmZKrUlrO9claYdXj5mfE34ZzGPsl9
         zmxh6PMIVyKikRDplT1VsSwsRjOkGDVaRwHK7hXDXjeik2PuVUZhTBTEg0nOA21LEzN8
         qFPqP887U+Yn2a8PIYiOvJfPM/fT3y4lADjplwdyTiHAH+OWvnsjB2Kc07hTiDgKobXH
         oJqfBIXmriHuKoJZg74Im/voBwDc56+V9C6UTFugcln99MCGFhbYFP1qvguqF8dt9ErF
         D6J5HxPAzhZkxczPtWWT9uJd2TTCMoaVSnJVoCe9SfEXq8QnpKvMu24Iw4QFEsbs/HuS
         v30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788237078; x=1788841878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEJ7OhBX5NB/UHZTgvDkxBk1HpXEXeGzsORVysWiviY=;
        b=dCH1GSGsJ6oUFtHPVpwiaErfON9q2s3Py4XRMTBxxlmuWdhoJUbo69jrKv9jdvdo2q
         Xvcq99CxRz0Hjb/hFxTb35sXdSnjpLRR12GlLCEo73tihMD885m1aww+0PG1NM8606dO
         rQdy4Mxdu6XvKjtdgNN6/YGc/xWcwnelNt+hAju3DSJCG5FnepGBaTuh6NYt6C7Osdrn
         9YueQi4o3dkMm9GQoizRbSwW4r2hkgwjfZTTg1GAveTejvZ6WfDYFBIaWEKNYtLkQuqr
         JDTKUE88xzppa6B7nSEeSrMXFM3pi2UmMeRuENy1YmhrkdklA659KjSJwviMO0PS08Gj
         ylLA==
X-Forwarded-Encrypted: i=1; AHgh+RpmreqM4UbVlGqTeV+pYQ3H+JTPAALSWlGfTDzK8kt8zNmNUtfJGIszV/b3RtpwuCEk2h5l0whyQNBP8d8=@vger.kernel.org
X-Gm-Message-State: AFuF++npL8WGhIAV6eNA0yjOmNi/NejLPftAWP9i85gE+i2E59WDgbVc
	9TvWpGT0PNhfOzt9K9oxO4+C+S9Cf4bDcrYDHgXhkWoiY01u5wSghBWRzzeB7gpANYVps8H+7fj
	Z9krM2yB0V24OvJ6qi+PDcaWFm3zaNuEWCgIDyRF07VlFORHDbgsqqf9IXk/Adg==
X-Gm-Gg: AR+sD11t/dATzU8Cm9P7pUXAxi3VDBf1czdh2DciJUKfrfyptktrw7cxxUX7qNFRj86
	A1epyylA61tPUA6vuUg/H0ZZM1P7qiPXs1dbBBA6OaaQ/syGrWrOrQiJeTTf1Ps6vo3ACsa9EOJ
	XvfSkgluhxLU1W5I93QKrcT9Jarqr1KZ3MvcoOovaDw4/jO7FfBHYbmrZm+HUilziPtilOYL8Kq
	t3La7k//RxFzxgdIb/NAMTgiDBc1psvJaPSOuvxLiGQ2tTTcYe4Joujd0zm1YJWczPR2569G8Hh
	T6Ho485ARteogbcx7Wy4Qya2/IFPPVu4MWkERIzrbaPtI5qFA3ZQ6cIVp8FiLGF6S3oeHcfp9UH
	S7g==
X-Received: by 2002:a05:622a:4d08:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-53024dbfce4mr7950491cf.4.1788237078025; Mon, 31 Aug 2026
 21:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
In-Reply-To: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
From: Pratyush Mallick <pratmal@google.com>
Date: Mon, 31 Aug 2026 21:31:06 -0700
X-Gm-Features: AcwNN1W-OquKi310z5tOIsz9OK7PtMpaQzdifnWmAOLie0upZ2KKAIgtlk6wDn4
Message-ID: <CALHaPKcyxUMja5-eCcfWq-SOBXzzu_cPOzZa96gewUW-0Xttqg@mail.gmail.com>
Subject: Re: [PATCH] tools/testing/selftests/mm: add missing .gitignore entries
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the fix and apologies for missing it.

Regards,
Pratyush


On Mon, Aug 31, 2026 at 7:18=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
> switched to a pattern-matching mechanism to reduce churn in .gitignore.
>
> It however accidentally excluded the page_frag test's-generated module
> intermediate C file with .mod.c extension, and also the local_config.h
> header generated if liburing is available locally.
>
> Explicitly fix both the issues, fixing the module-generated C file as a
> general pattern as these are always intermediate files that should be
> ignored.
>
> Since this is a trivial .gitignore change it doesn't seem necessary to
> treat it as a hotfix.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  tools/testing/selftests/mm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selfte=
sts/mm/.gitignore
> index fcd892ed21e3..a306d7754786 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -2,7 +2,9 @@
>  *
>  !/**/
>  !*.c
> +*.mod.c
>  !*.h
> +local_config.h
>  !*.sh
>  !.gitignore
>  !Makefile
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760
>
> Cheers,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
