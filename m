Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4DC3594A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284055; cv=none; b=mjwkNiQqh7+4AepfzvVAX0vkbdxkY6JD1RY+al47eh8DGLb3dT8pDO4pSAxZDEZ0bYdlDicCU2lK0f3kFLUMMc7VkWrdjtzHzSqrtVfMnZpR4Ci5fRdUoOholqVI191+praQ5LD4Ue1swdMUPG30+beQWUK0q4WA7AS02WjgMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284055; c=relaxed/simple;
	bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rtfk0O/UaqwCUpisvJjziw6L5oETcCHKVFGXRqq7PxJA2dkw+GZhiVMMg0V/ZRuRJ2/yovOEl1CpDp+RWueSCO/cLbgijkIrl7etKEp/MuFEA02366T9XW8WL6DkleU9e8zX00YC7XNDYR5hd5q6pOFyDFpcOb1qwrHdRrdpzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6Pb51qe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6Pb51qe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1396798a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284053; x=1792888853; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
        b=Y6Pb51qecalWrz6sg8Uw/H7mpl1GIbqXIak8P7izZ4db21ckaYfML8KVzc/EEO37vE
         hr49r3ukY6aDlmXYLU3MU37TLlsPSiWFYwoUgEaOGqmU6EMkFfZ1GANlqaXzdPsOjM0t
         tFC/6+GGbMj0bgcUvFS7TGBNRIYajBzndBlj64XN3Vp+F2MDqTpQnII37EFdRfQFv6Zp
         oqF3ipjPUkVJVSZd+z291g6KxFpx0OB1QwRPFbHzgk6fIFRAhYYG0ddDdRRnhQLK5H4W
         6TyFD9R0U3rZbYeQdxD3hgn0kHNBJLbBGvaKw09o0K7VZcaWsX5uxlmOe3EAYDlDm1dj
         QkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284053; x=1792888853;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
        b=iv2lmPtj+nfdwhOzpyuSMv+yE7mF/HtNJ0cV4VZmVpzzcQtCY3MvUI2MKDaM25/ee5
         rGnNW1eJ1Jf9VQiVEaRoliUJBYh4X5IyiKHRftn9oJ6rrSKkKVOf0VRSplgBrR1+iWj8
         C8RFnTeTxWgxN0aq9zZDrWj9rkRtXevcL+zSHj02tuVYerxrpxbML0KixBO+pYvAzQZi
         quzU/yaq+fsok5jHsiWwSw+7YsNu2cCmZVgBJJmQgf394uKg7BTu6Fq00mmF+JkjyJlt
         BFVbIIqKrWjR728dz1ctQ/Hf795gAjLsKJkniHLylqudGLeoI1QrpjqOJzc6RZvjR7av
         R4rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfdsxbwaPO3ZJaq7YS4IBkY8+8yjROidvd7racn42kl30j/vhepjoIdXBTM+QrfCzw2Weey2XiqT268bI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4T1HHBumLO3bn5zhLZRHr9H1tzRgXVN3W02AjjIvWQe/P/kWE
	eR2dOhwElzcGVZmu6Sr7b8OmvWojH6G0qaWDVdFN36SdhDfs6jEfMBJZ
X-Gm-Gg: AYBFou1if4fYfygBm07H/o+Y5pa6JMlOZmuttdnQXGuOuvTqdv9dxa7ozJXsLvIY/tT
	46nUHrkqthPXE3lssDBFzjyWDXugBWLqMTEl9zzy4PJMEbSg12rcbdr/joS9ZSSM6H2eoLJ+8/m
	PisBmkZ3g2oACHIzDSc0wRXK56cVKD1j97KDHbiz4FvXqE8eREKZZ8Af9YhKcGBfCv+6bAuOeCd
	6xIHUSaZifBaQTkaGzxSBoxl0Wd78Irj+nY3YmKngR6kpC9YrpQaapXdwKmfO6Gd9N9GV6xbmLM
	VqfgO7vpltjKyCKAF//bY4KlGQZmcUGezeip5QZt2cqUVpJuVGFpBUVXsm+YVY+PiB8ImpJ+zac
	hJ7jyHSM1JmHxBEROUfEIUJIHBA3E5FkVCYCWpkaOHKhSAqD2RjQPs6mOelnz37qbjnGpRTPOIk
	ymgYVEvqPxIlFaS652ikNrHu8TUUYebCiTfQ0af9EIperkggcCNbW25pXq1iOeRR/q3YA02913P
	1l7Kvp5ciYG+S43wCjhil3ckPTdBd0rd7kCQQamUNPeBDb0KJhzS2VP6aijNZGecCnMAPs2ezyh
	DFU=
X-Received: by 2002:a17:90b:48c5:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3acef4e131cmr2448674a91.30.1792284053166;
        Sat, 17 Oct 2026 17:40:53 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm14830794a91.15.2026.10.17.17.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 17:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 00:40:51 +0000
Message-Id: <DM7JO6OZIF73.153P5K24I3ZWU@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <shuah@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
 <morbo@google.com>, <justinstitt@google.com>,
 <donggeunyoo.kernel@gmail.com>, <leon.hwang@linux.dev>,
 <menglong8.dong@gmail.com>, <yatsenko@meta.com>, <jiangfeng@kylinos.cn>,
 <bjorn@kernel.org>, <puranjay@kernel.org>, <vineet.gupta@linux.dev>,
 <mykolal@fb.com>, <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v2 0/7] selftests/bpf: Fix selftests failures
 with LLVM 23
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "KaFai Wan" <kafai.wan@linux.dev>, <patchwork-bot+netdevbpf@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261014113043.640435-1-kafai.wan@linux.dev>
 <179211120751.4176565.4973025143783418812.git-patchwork-notify@kernel.org>
 <f77fd2b8bce1a029ac295b4482402a8c2203db57.camel@linux.dev>
In-Reply-To: <f77fd2b8bce1a029ac295b4482402a8c2203db57.camel@linux.dev>

On Sat Oct 17, 2026 at 12:57 AM UTC, KaFai Wan wrote:
> On Fri, 2026-10-16 at 00:40 +0000, patchwork-bot+netdevbpf@kernel.org wro=
te:
>> Hello:
>>=20
>> This series was applied to bpf/bpf-next.git (master)
>> by Alexei Starovoitov <ast@kernel.org>:
>>=20
>> On Wed, 14 Oct 2026 19:30:36 +0800 you wrote:
>> > Building with clang/LLVM 23 breaks several selftests. Patches #1 to #4=
 fix
>> > those failures.
>> >=20
>> > The following self-tests also fail under specific invocations of
>> > test_progs:
>> >=20
>> > - ./test_progs -t prog_tests_framework/test_fail -v
>> > =C2=A0test_prog_tests_framework:FAIL:skip_cnt_check
>> > =C2=A0unexpected skip_cnt_check: actual 0 !=3D expected 2
>> >=20
>> > [...]
>>=20
>> Here is the summary with links:
>> =C2=A0 - [bpf-next,v2,1/7] bpf: Determine freplace staticness from BTF l=
inkage
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,2/7] selftests/bpf: Fix stack_arg precision backtr=
acking log expectation
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,3/7] selftests/bpf: Fix stack arg pruning test JOI=
N log expectation
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,4/7] selftests/bpf: Use _exit() in uprobe_multi_te=
st clone-ed child
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,5/7] selftests/bpf: Fix prog_tests framework subte=
st count checks
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/c87652656a55
>> =C2=A0 - [bpf-next,v2,6/7] selftests/bpf: Skip expected_msgs subtests wh=
en stdout is not saved
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/cc4b1c161d92
>> =C2=A0 - [bpf-next,v2,7/7] selftests/bpf: Skip compare_text subtest when=
 stdout is not saved
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/7ebf808caa76
>>=20
>> You are awesome, thank you!
>
> Hi Alexei,
>
> I resent the last 3 patches in v2 and changed the subject, expecting v2 t=
o be reviewed first so we
> could skip v1. Sorry, it didn=E2=80=99t work. The bot closed this thread =
while applying the 3 patches from
> v1. Should I resend the first 4 patches?
>
> Sorry for the inconvenience.

Sorry. My fault.
Pls resend. It will be easier on bots.


