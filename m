Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177B3890F1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760024; cv=pass; b=IUNq/4YQa3Iag3IfBkQ+JLrg0wJHatlAYVSsGgbkKy2cnVldbXCGy7eip0tE6UCe+Zb/22QgedRrAEwGwjARXWLiN9k/pyy9jtmdH9Uhn9mtqok5tt+zf4Dhs05sgxw27JF2CiDaPAzxm9zNJByV6ACs461ISV8F8l21f5jxRoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760024; c=relaxed/simple;
	bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abKgcH6MiQdNIezksQ++EERsXyPcZOnBTmB8X7JTeCnFvNaIcgUocQqyTaxvTuE21MIlTgGtvKBEYX9ISAKftvkdzTfHy9I+ZoihfaBv6tkTurHGc3WWA4DFyv2Ajrgn2tydkCaNaORbbT5UzZxHUKDdPkIP7kowli7DtC+MkJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkamvXQD; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkamvXQD"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso254291cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788760022; cv=none;
        d=google.com; s=arc-20260327;
        b=QgTcP7VmKBNL2Q4kHYVgIBjiUQG1RlROoP70+D/4hASvVgxGq4GuxLNpfx4BIYPSJ1
         vMNe0i9IKsKkLUPfuixuS32axCjmGFC1/AZuM2E7jX/HzAYdGz3Kg7/innatYLc62KXt
         uJpWl5TinUpcn4yrwZNlLEg8G1unTaqmx43w+9q24ybNvI8CTEdKdH/HMadBu2Df+eeL
         d0g/rcO9zDre8nUc8DWqxyY1F8cC+4HS1tQ4vnV+oi81/ugpyTJKiJ1jWwQNHTmGH2ac
         vPwl0jjew4YWPEVABSeWFYTBsVcPQC+FqrnvpVCiGzHdktOJUIXVGce345b+mHRvELl3
         wSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
        fh=xGuUE76gPL0T/9upRzHII35N3w/NDlF44kgDtq/sy8g=;
        b=nqXBNUCGelTPzcpRl2/OOA79MgAO5CcOKWpBnII3KQXqzajJCZBCOu62D4NXVtGU6h
         lQkPH5KsKKGknigYeE11DfNkiPOwys1J3/CTR8qROFOjoX8g3waxfsBSDNEaOZiZQV7T
         1AhEtJTcR78DnVlYU21H5M7NHO0ItuGHg9K0KxaTWqPUFHWfj6JtASsZ7ziuqN/PUEys
         fcyC5QNGWqaAOHkvXBAeOFsTAtIPQg+22l9EuBnhLJjp1azUuWeCI7Eszo/OPJ3Sgk3P
         dbfhj6jv2x9O+/x5LT9ajjp3IWC0GM7IA0Qoodvs2IrAfYZmIM1/pVepOiXGCAl1QPpl
         y/eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788760022; x=1789364822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
        b=IkamvXQDnUCwsOAsZYjD+ZwShl62rlw7OIeABI1Pobtyljv0wOXYmEWk4mh4CLxoUH
         pr6dTP8SukVGHPvsoCXPmLeCWOHmxwy0Q3qiw5KyiDNeVp/897bI7LifuB3uNxgIcjZJ
         AQK72jd0PMRWeVPhIDJEQC968/ItcxQK9N4lS4jepeFpY1p3/TkyOGX73X+5+oWKefJg
         K7owoRSYh9UJ9BUCpRAF2rfXq2a2y/BUIdfoZqdLapfkjc9EsfBKaaz+Q3nl//vLJGI7
         vxmplUQqGcZO1B1LlkW+RjeT0xnyUAgfklLVfIkxGzpZh9loHKzlGHXKacWbIfilqWvo
         +nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788760022; x=1789364822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUgzcORyckA+8dmosj3W4O7LpXuF1V+EFIaKxpkao/0=;
        b=bAOgYrBaAD/gLavKyzR04JRQ7954yuEFWH9Clek4DVRqoRTFrGuKORRrNbVYWj8fXY
         ejj5qsY2VLa0e4lsX67Aerh0ncYTxXjQZ4b0D7RQiG2dDxRQNYX5oUyVBevQFgvG9P67
         FFnBHMjHmrK6XFZ93buOKA0OkDUIqKm1xUA+D7kk2LOXtjtGefIcXhjG7ocq0jN4eFuf
         D+SQHzWMJP/8ytINaO8hpYMBXCSdxoIHDvk3Ky+b/6tQskHZREqj+P2HcLVtXin87CsG
         9GuNympiFXGlC80Q9YjGzng/vdrDRhyReMIb52F2BtnN44lF3StxL5zDArdvxM+BCJ+m
         in4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcPxwSETkiZO+1VbVnVo5Ccf31pxSGsig8670bDVUMpc4KIS9jqm1uCOzinbaktMjRX9GF97ZWyu2RwLE=@vger.kernel.org
X-Gm-Message-State: AFuF++lC6SPjLq8Hce73Ca6fTgiT9iNzpZIn6Dpx1B8XD8zX8iPe2p+z
	1Y8eyXOWc70eSlkqvkvWmiotA834pQ5rqskpesJetRzlimlVEEIc0JyvV2o1+Gs5bGuaWfEjz5S
	gPOyFl8ZuCFSY6zJBYCkNAPWSE5vJr3jj7IUPb8+J
X-Gm-Gg: AYBFou35uDeVMOhztDjohtbiqWI5hU1Ihg7aolROLTt3Tm6WjR7idA3P6VwuHr5dlXn
	y74+Lh/xS0SrFJH5HQAWcQ/Ye4lN6kztzF1E5gmrmOuCkPpNFOHqBx48U6b5e7ftnvyvEWW6YHf
	mI3+mbQJDcwm5a2W96SJyKvhs4mR6EEv2lzcBwVmvLn8ZqlYyPsplulxUSrMq0oJdjuNkugzHJE
	ykVZlkntPRgLYRRSNetefPYlG7PNsFa8G3uWxkacaWT4JMy8WRsRdsBHr5A6PWOIU8t3v96RziL
	WcAwIfC1vHtsgjlojpN1sQUsNb1gbyprRrhxHCUwom7Mh9GOztQsgnEf81HBVr8gPv7Y/w/LNEX
	hnnpiUCqPLbPW5Al/g9Y/q/bwXOE=
X-Received: by 2002:ac8:5a56:0:b0:530:5ed7:50f0 with SMTP id
 d75a77b69052e-53084da738dmr6405881cf.13.1788760021899; Sun, 06 Sep 2026
 22:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904031912.2133476-1-tweek@google.com> <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
In-Reply-To: <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Mon, 7 Sep 2026 15:46:43 +1000
X-Gm-Features: AcwNN1VHWc43-sC_3CoGJGewDfaRQRVxmRUaVlq04jRRQFeRsaJdgNEB0GaZUNE
Message-ID: <CA+zpnLc-WAqE9rA0PsjvOFe_YCZOdVj9YAzuayGXx0nhpqtw7g@mail.gmail.com>
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

On Fri, Sep 4, 2026 at 4:07=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> On 4/9/26 11:19, Thi=C3=A9baud Weksteen wrote:
> > Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu
> > data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in commi=
t
> > 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu data"=
)
> > two verifier failure tests were added (verifier_strncmp and
> > verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).
> >
> > When bpftool generates light skeletons, non-autoloaded programs are
> > skipped during loading, causing the loader program to store subsequent
> > program FDs into incorrect skeleton struct fields (e.g. dump_percpu_dat=
a's
> > FD was stored into verifier_strncmp's descriptor).
>
> IIUC, patch 2 will fix the issue totally.
>
> Better to add a subtest to verify both the issue and the fix?

Thanks for the review. That's right, patch 2 will fix the issue:
bpftool will fail to build any program that is set up that way. That's
why patch 1 is necessary; otherwise, the existing test would fail.

Just checking your suggestion: what I can do is add a new test to make
sure that dump_percpu_data is set up as expected (fd > 0). I can write
a new test_global_percpu_data_iter_lskel, that is similar to
test_global_percpu_data_iter, but for lskel?

I can also write a test to ensure that bpftool fails when light
skeletons are set up with autoload=3Dfalse?

Thanks,
