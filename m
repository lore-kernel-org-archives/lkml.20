Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2F493644
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101898; cv=none; b=UqEHcCmsR0lmNQdoyWKKMljkjXfFW85y6tSNvcUhVNRI+IYb22JKv+szIgfnNX/uCJhrOawya9SdAPbYAw90qAzs8MEqC+OBWCBngGUREe6gZGMwOw/X8x3nkN2C1kmQkRtH3g0J+1tdFRkLfpOgE+Nqb5meM6m+PFCGBAe2LTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101898; c=relaxed/simple;
	bh=yWlRsj2VmYWLEwsE7rqPaBEfZ0LkFJBnk3HvMYu8raQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BpKj0L//vxGX5azPssm/nRoMGTbAU8o2gI5vGe8g/5ufPlqOLAKmuaK94UQW1trig2uAP38lxRSsgsZQ7G643uVGQ2lX+Sw7jga1eJQ9Z9gLj5qZiYZeJc4ziWmbyB3RUlOl97oAshhgRph6/5JbDCfVUoZe71osWFbU4k4XgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=p+jsXQLT; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="p+jsXQLT"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so261477a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101896; x=1790706696;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWlRsj2VmYWLEwsE7rqPaBEfZ0LkFJBnk3HvMYu8raQ=;
        b=VAEH49uAxr2mCHyAARrYV6h+bGljlm7QHaYVj27qp27qHgSUvFjf0WohUJDT5kHL7o
         6lDWMo8xsznfLkcO2AdYp5fMtp1+SasMkzbmzEt8f9Us7JwpTAN1ylQjxjsiPW2fRLnv
         Vda0OeucVnwujnh6xJEclrYQ+8qwjghacGt1gRDKsJJQ6NA5fGu+u96lGXsZAeEg1cog
         bapOzGqTzxLJaIBcRbwNqaSvhb4EDU/5vHwPrEbGSRWHVLrE27iGC8Gz739/lI4ES8BL
         58XtNb4FepkOgQEC1XAYrDbwZEjMVB9TJuXEplvNCoD2SKjBMv1wuk1yhwJeoid9BCeq
         DshA==
X-Forwarded-Encrypted: i=1; AKwUvBxaIAuRISjkrFVkER8hAMjpwVQptvfbkgMPOwr0aKTOoQbyxXGSKPu+A3i0nycAAE752moZMdLHykqMeO4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIA9iCXUdT6VAL8UFShvv0WHp4KON7XrzRdY6JRUGqfPRRqsmy
	IXKA3NyfzeBQ7IEXYbYwSUvKympPBLmepQvrFVJrWCWufOUB99z4NRyB
X-Gm-Gg: AYBFou2sGw+pnGOFnQTg8Lt6X5zJH6nuGjMecs64k+RnVa+sqF7XPILBda6hrG3oGV8
	QlB0rhezm/+TzOgvYW32tr70YAz+4QKqM5spQgMDZS8hSV+PXQ1JDFv7Bqw65jcXyU9aMqaPFqo
	8SVHPodUFEtAag+N6VKj3mdyeS/9e8VVhBGLSzQOQjDv3dZsM2uRnfD/OSac0S8VBssj57Fodsw
	YEPyCgr7EWmC95hdwsofIe6AIAU9Lsr9wYYelIRVALWIz7ePLlLUmaGxkBoPwEdMsjn9j1IBeJN
	Bu7VLaOY530Da3qHfaj7vmiKmohbaMg+zdcouWJyOAB3erhMd4/PmMpQcrTcwcqG2KNiUz9Glrx
	kyVAF3tDlP1nFzCtbaRIr8ItJj9Jk+95Y+19fC8QBS0Op9z5qnbKt+yVSOLJuv8qO2n32BT07fC
	KLs9TSaBPD/bEKZjeFtafnqYI31SB65d+oWRUy16IPDKgZvaX+EthyJItc/LWQybstJynplE87/
	TZtPVajR81h096pp+LENET6IMnSd6VhqmQ4ggYgAKXEJYgxS6h9Wbjr2Pk2w5JHbPtATOBtCk31
X-Received: by 2002:a05:6820:f028:b0:6be:7782:5a51 with SMTP id 006d021491bc7-6d2d00467cbmr250934eaf.10.1790101895616;
        Tue, 22 Sep 2026 11:31:35 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908efd733bsm365466fac.18.2026.09.22.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:31:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71C4F60C83;
	Tue, 22 Sep 2026 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1790101892;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yWlRsj2VmYWLEwsE7rqPaBEfZ0LkFJBnk3HvMYu8raQ=;
	b=p+jsXQLTluWpAJryr4dItCOuD5oOk7c0F0XWrvwH8KuPw1Uo7Aoo1Xkhyllm/UlJNsKRKl
	KQKeLR/aP9kkfHLTTTJon3wSf/dbQ68sFzUWJKdleVN6q1hQpZKMNCH6jXmRMPDTA/LXpF
	qdfRU3hEqou5I2Xim2B0X61qErlldZQkSsGsxhoMtnsgDsN7fI+YGEq56l/WuiWTCgPrWa
	eCYLSa8fSDDZgU3Dhp7X6V6XtR/3Jyq9/AYhDL5znrK5u/QZgwIv83c6u8dFClMysUC+Vi
	QiEoa/qARYboYVuizRS+UEgWXbf4WlGrOowF2DU+WhNNdqygt8F0ZEFSn5CohQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 15:31:25 -0300
Message-Id: <DLM25PIKJTE5.1Q1IO5PAM6VBD@marliere.net>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Song Liu" <song@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Nico Pache (Red Hat)"
 <nico.pache@linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>, <ihor.solodrai@linux.dev>,
 <nickolay.lysenko@gmail.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-16-ge144528849ba
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
In-Reply-To: <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Sep 21, 2026 at 6:04 PM -03, Eduard Zingerman wrote:
> On Mon, 2026-09-21 at 14:40 -0600, Nico Pache (Red Hat) wrote:
>
> ...
>
>> Given your series was defferred, and there is a "rewrite" coming, what w=
ould
>> be the best approach to working together (between us three) to get these
>> fixes in that series too.=20
>
> The, "rewrite", as you call it, had landed today.
> So the series in question can be re-spun.
> Regarding your patch on top of it, it appears you can just post is separa=
tely.
> However, I am inclined to be confrontational towards changes like this on=
e.
> The purpose of the selftests makefile is to run selftests as appropriate
> for current tip of the kernel tree using a very specific kernel configura=
tion.

Ideally, if a Kconfig symbol is needed and the kernel under test does not
have it, tests are skipped. But with BPF they were simply not built,
rendering the tests useless for anything other than in-tree vmlinux with
tools/selftests/bpf/config*.

> Main users of this makefile are BPF developers and BPF CI.

But they shouldn't be the *only* ones, IMHO. Enabling distros to build and
run the tests is also valuable to catch regressions in their kernels, don't
you think?

> Support for distros customizing the makefile is a non-goal.
> The "PERMISSIVE" change done enough damage already.

It's ugly, I agree, but what damage has it caused? I see that it's going to
be reverted anyway, but I would appreciate if you could elaborate.

Thanks!


