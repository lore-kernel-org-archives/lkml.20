Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793114490;
	b=Rs7PHVCwmCSVDyRR0IE39+n+8QU+rHiYIcke+F5TPZLzbYgAyQstN8vYJNA4iXmIsR+S
	 7Rb7G6mVCGlXpJz6ZfG2YgIie+55cW9h9d2jQVVRJnQfoycTCSWslavbmD0j+DyflZLop
	 Q7AG6si/n2Q+yOqs96Dckxa+pMKtWVR2KI1P+s/BJoY6IYvCXWmfcvxKXAvU+REgfPo19
	 e+GMUAoSRXW30E2Rn9UElNllVUKf9nSCAcPI9ThqsezQ9yfURGm4guY/j21if68twTnSx
	 4EEf8LjwGnLR4yPCK3R9YlG1pKj6JKfpLHT/WIeNBo6aK7Fhe0dxUhu5pBi/HkYKs2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NxM/SdWC3JhodFrjdCzECkyQ1tsAfroiL6zHs8mPuAM=;
	b=qCqPqL/x9ydFkzH7bQM4yRqiutXCznwCjL0QOKPN9SPxFk6quxlIUY3Aocg0ls++yAEv
	 3A8QlusZTZ1z4WzPua7uJiCUXG7RHF3INdy0pyLq0QCQELAKOXy9n5lcorTp3Ld8CMNLd
	 ppJqAcMnLVRvrwHSXavAqEPwecl0JWpkDkxiYKlWtW21qhV8gG/O4LETVfdfXONDXP3DJ
	 FinhOlK9ew7tM6/fWLpLPdTQZ0LBrX/8I2wmgtQiQE45A+KuKUC629BRQMyxlvGbmvGF2
	 Kjdum3m53PwzElbfB2iijUTNAhrVSG96ru72XfPqVyOh/XgpAM2xwsiDg0I+J+CpTKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VxSejD1G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC0606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CC0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VxSejD1G
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-535f598d126so264731cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114489; cv=none;
        d=google.com; s=arc-20260327;
        b=JF5Z1D0GM9Ly86IOymGNwzrM9KBe84SvxFvPtPX/g7XrsEJdlN2+8TxeR8KvuvnmQR
         3Pms+MXHO66YwEAZA9N8gaIiS/OOYNW5W10Yw6bpFpxhND1F4Gt6tKHc+ps0DS0eEH1Q
         wVqBpQIjltCrALdY7E26lYrG7LAWw+vJTQGaWwARH0T1ekMBXz41hajygY8fvjU+SFOz
         bG69NCmQmD5MjyNTPuDlv0+052ai3tLlz2vrm/G8BTUlNt8sOUZ2CsKdaYk9ctU3jxI5
         7/JRA3dOvoJngltWc40Fz8cPgE6HRnpbp+HSwGS4aSuFpOIVhSokEzjXupcM5vLCBWip
         iYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxM/SdWC3JhodFrjdCzECkyQ1tsAfroiL6zHs8mPuAM=;
        fh=BX0ZK9A3+PGdXb9ksqQ46wf/4T1QVST+OR9FbnMFypY=;
        b=Fxv1yJfrxhrAovpSD702m64pIy52dIbMFyHPvyhn4qx8Gndbvkyiz6SzZA2a3ukTKx
         gV3xozUFrla+Hg/Pi9CMvSwjvayY4tZmsbWdc7IXZe5UbRJ85aF4wTehKqL1maLek9bA
         hZ5iz1dg5rSNg8dCMi3p+XPIM+SJnACSxWnKeQqyhRZbxuLSWyyXPzsMhJF4KFSmIj+V
         fpeZRTNT0hImBlk+y8nKgv2W0qHaUo31seKZtr+VjGyA4KcaUKCILfs/op5wQlNMUh37
         8JDkICQELIrrIH6kQbaC6lr8nx5kVJ1eE8uL6QAru1tyQoeF+bd4qJsj2Aj4l7e9NWLJ
         NpLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793114489; x=1793719289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxM/SdWC3JhodFrjdCzECkyQ1tsAfroiL6zHs8mPuAM=;
        b=VxSejD1GY4Qc2u3eW5yvsiYM9LBwpqsts/mjdAkJVQ/2lULtq9froTo4Cgq7uu5dHv
         DHWfY55AT8HWvd4LKYMeOsmwEfRUboaavssASngFTT5BRbMV57W7++Suo0neLAwmTQKA
         FUagRvaiXngimTt6jzyu2ETpXw9JB1GL/lXc4ZRsqGlzvsxoSFRfG2jmnX5CRNOuzuVx
         +3fsQgjP80RTEKK3IXzsQypHyhKt1ckPLS+duuV4Jeu8IuSIAXeNx8hPlvIc0/9bwYtf
         RueBJIYhFbqJGbx2cbiM7nQiJsCcEKd1Zvutt/C0qoKHtvmUhUKUhl/7jB8sfTsTx0SS
         dLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114489; x=1793719289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxM/SdWC3JhodFrjdCzECkyQ1tsAfroiL6zHs8mPuAM=;
        b=TBy9rgLYRuDSpCjTUBA9kuRbWGQmZIN3GDY4rEQi55Dq9g/FIKDdn39/YRq7Wp+yWl
         PKuvOvA3uevvZT9WMOxiGjh10woNc1XRDplmydJlxjj57zF2WwV2TK2fxWztRwESrBd9
         +gIHoEyhimMkfK7DSfshyEPrq8aV2JqH8Zm9kIfY8+i9dY6Nq1DpdclmdwePHUr66Li5
         TO3OCB+S1iKqz8NQRKGXeJ8B8V90GS43x7+YoPqFAUDzBRJ223dpZq3kgG910BXGq8uJ
         joq1W+65Yqn2nWWurr5YdwVmMn3xb23LMI/iF4H9dY9MO4lmJI9OCGQ0Zm1t/ONBdgH0
         0dfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwlWBwZ6N98HRARISZSNJ0AKE/9MXlUTl+eXWcMo1pvAWPpuaIEsElVpITrhq7w/mRgWaA88tPZ5ZH838=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6okppt1j+Nplre2nfhQ9QwE03Qv3ZZidIBVhGyHqycY4A7BzC
	m5fIYJxCtMgag5rbvdUy4uEvx1Kgz1S5hyd09i2irXq9aefz4okh+FQ0VHGv9w5F1/1F4pIYasb
	TA6At+LiLMxduDxZPROBO+JUslcpxmST7dRAdkZ8r
X-Gm-Gg: AYBFou26d73XOfQRYo309zC7oPBjA0rVpqN0gLTXI2qPNuw91g7onWuSh4HJu73emtD
	TtnYw+QC2kJrVmXIrugZTCC9yPeUSxjSfPzjIYvVakEvOYHHn3o/Tp3dF9Ckyo6SsE5QLDd1hJj
	f+b7HQpSADNZa3k/WiaaTJt48ZO8pPPP5mhAi3qv6ZODkKJ2lT2AHGyzyNoeQ5CZDa/W1MGwvYo
	K4j+ApimTVm9IMhxlmsj+LAS68FpZC0GiTRtEVgyUNvDd1gbH8iuHr57YejIbceVzAzYjSaWJZh
	NRTClNccf65BLCQJmkmwQf4eCeD+NW/KfabWq8KCMTaX7q20RnN84sAinzmcPRlqUqtMbdNnsfE
	0si5yfl4Mt9UOT2xUkUsNtXxtpSDgudUDEVwWRGQ0GXSvM+K9YmxyjaXLFKtUm7NsT3Y=
X-Received: by 2002:a05:622a:4087:b0:535:8515:b4e5 with SMTP id
 d75a77b69052e-53e55c28435mr21394481cf.6.1793114488268; Tue, 27 Oct 2026
 08:21:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202610271154.69RBsOlq045164@mse-fl2.zte.com.cn>
In-Reply-To: <202610271154.69RBsOlq045164@mse-fl2.zte.com.cn>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Oct 2026 08:21:16 -0700
X-Gm-Features: AclHuK-Woavtv1Cz-seB3sJDtW9u6Dt6v2zVol6SMqMjeJi6wKjBOrgCgGvWdGE
Message-ID: <CAP-5=fUbpxz9HQV+BRd62Yk+mQ5Bq-G3XvcK8ea3W8E3BqM6jg@mail.gmail.com>
Subject: Re: [PATCH] perf machine: Fix NULL deref in thread__resolve_callchain_sample()
To: lv.yating@zte.com.cn
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liu.qingtao2@zte.com.cn, he.yilin@zte.com.cn, zhang.cheng35@zte.com.cn, 
	ye.zhihao1@zte.com.cn, shen.lin1@zte.com.cn, dai.hualiang@zte.com.cn, 
	stable@vger.kernel.org, hu.shengming@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:54=E2=80=AFAM <lv.yating@zte.com.cn> wrote:
>
> From: lvyating <lv.yating@zte.com.cn>
>
> When recording with -j stack, resolve_lbr_callchain_sample() can
> dereference a NULL 'chain' pointer while resolving the branch
> stack.
>
> $ perf record -j stack -e branches:u uname
> perf: Segmentation fault
>
> Fix it by checking 'chain' for NULL before dereferencing it.
>
> Fixes: 29be60c93d2d ("perf build-id: Mark DSO in sample callchains")
> Signed-off-by: lvyating <lv.yating@zte.com.cn>
> Cc: stable@vger.kernel.org

Tested-by: Ian Rogers <irogers@google.com>
Reviewed-by: Ian Rogers <irogers@google.com>

I wonder - this failure points to a lack of test coverage. For LBR the
main coverage comes from:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/shell/record_lbr.sh?h=3Dperf-tools-next
Could you help expand the tests to avoid regressions?

Thanks,
Ian

> ---
>  tools/perf/util/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index f86b3b7df742..10a88c070814 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2858,7 +2858,7 @@ static int thread__resolve_callchain_sample(struct =
thread *thread,
>         if (chain)
>                 chain_nr =3D chain->nr;
>
> -       if (evsel__has_branch_callstack(evsel)) {
> +       if (chain && evsel__has_branch_callstack(evsel)) {
>                 struct perf_env *env =3D evsel__env(evsel);
>
>                 err =3D resolve_lbr_callchain_sample(thread, cursor, samp=
le, parent,
> --
> 2.27.0
