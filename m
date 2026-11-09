Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232061;
	b=YlclmM9MeGiL1NxJeYuZLpAWVR13uggTlVLMAAI7FBt50g5Gq0H+dfv8DRdqE7fHVVg1
	 22V9qyMF5a72lifRv9ugeLDiDvGspNzs2PyvywSJic+eIBvguk7Vvdlih+WXY+cN2v/tX
	 OXGywzHCOsWa1xID5Hg+LYPP9CxlJInSLIMss3QPt/Fp4a/qHUtXvNuaX2PHCOMuDT3Fv
	 yyBcKLOEkZEEMwDFz87fSO/f5o8h7XMyQg3+YWOTxUUOIS2SI7T2bI8u1oF1XUn6GO60z
	 1/UaroyNeuWaLAy8wGSoMoi1VtpUx5slYAwJCtGVRBXv65bfx2+GM0ReTenbh50tVuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MWN3G6USZ/dj8AJfyvahPduuzp3NKOxmGRBSQgdtHV8=;
	b=k0lx+GlGB5XKRAMayNEXlQYobbHMzFrbFV9uUl6Guib7ovxwqZvJk4RXA78C7Ng21DH2
	 Q5JnDSsM4bgr77XJfZJc6b8CREAPo6+eqOhiYugAbs6ivohFtMyxR6H/s5MuolQ3j3AvF
	 HJsDHJ/kRxF/P256qqVHbrGHipesATPEJ+1G/Q7F25lA7evCiiuSJxMlnhwm3gqr8/dMq
	 KZS05bm/jYu17BfvR8opCTGWujSSoF8BZb3actlQKj2a5+phvr95z2D5XP3EMez4TBsGg
	 e9pPM/RttDDquTwyLKJ6kpKkDONQVrPrFzV0ewsbSiBPWC83E3jkowOJTy1FvZQ70NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Peiv54B7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE18606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE18606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Peiv54B7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8765785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232060; x=1794836860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWN3G6USZ/dj8AJfyvahPduuzp3NKOxmGRBSQgdtHV8=;
        b=Peiv54B7LWZaSvhVVKsk2sgJbYgCH3fx02yq75B0DGc++TJzWsY6qK5P4onJUBghmY
         ZSo0bd0tgXOSlYPA2gPVWmro8dNgSu/kdnyUWocvFJcw6LzHHsHxSBuD6T4yC60r32yu
         9mFruvo7VcL+MXHVdFSF3Pc66y5VY9KDmb9znGGg49KrQkQ2F1/Qj/z1VSyVwbjEk5s0
         U6No4OgSOXvRe14kWi+GMnNouI0jE2BC5nluhaNfXsiWkT3xFtGLRbdGMVBR0qOzOpe5
         TxTH2XhyPbIJdtnRMErWNGm6u/Nss/hpgGwp62/VHuBLQNqAWCbQqbBxk22xirSddYaF
         3HGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232060; x=1794836860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWN3G6USZ/dj8AJfyvahPduuzp3NKOxmGRBSQgdtHV8=;
        b=JKL9N+y5xTyPCM8apBf5j8qhATypOnClkQ1fELieThLNYhMynhCHAuDgTPb4RjgGNk
         wc2o4A7y18IfwuHhQkdSP53gkGZBcN95qYfPg6zWvFzsr4nTGkOgMDaB76AAUOKFt5RX
         iZo0Bkb2GLDBhLJX3u5WokG/kUPFPj1CUWIeT1d5+IS5WehsUTdMIBQwsbG1Rrv1zJRH
         s0+38n/A8F6PiX89bQHMmzNZYXw1g/KLHlkTtda+giTjjG/hjkrf8qsk8T78xVCFkgl5
         +eeSTABIlrkg/YgUEDjqgZtUP356bXbsREZEMS7tF2l6aMFDlddc+l0zFVl67LV8U7X8
         sL5Q==
X-Forwarded-Encrypted: i=1; AL+hErFplW3/KmFrF7DzvsrC2aasq+ljWpL+JEBKKggzaUmgmE2WuTZ9xTu/lK8jaWoInZ443J5baE3Gk+bok6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xSgosH5JdSr6iD/anNLrnrrvtetQKUVUBjDi6Ub44ecloa7k/
	mAh+fibuPmtq8rbuUNIUMLj1l5B3IFlLnuyp9RarBzdmCJNjJQNVMl2SWzSCJw==
X-Gm-Gg: AYBFou3t+r234z8Ada4AQC5luUXajaKS6VThQtY60wFcRmsUlwnNZlxwGvNabBV6s3k
	OWQ7Sx2w1WpJzBq7htwE8N8yU+YEzK/AzR91U3XQhSLxuD4ivg814OHUlOr5Jk+zNdRXxV8CDGv
	so5hylN5vq/bvkxnY/nAZUzxjPhcsQMoMtYVdx6td+qK4rRwtN98MuAEO1GsYvWDfotIM1TL7Nw
	NrGWKR1H6D2TTvUeThBg5BK32lJsQUoAIHRMiv18JM2MDtXRbwBlhaHRNvswq65vyWjliD3taXN
	iAfqw0xa9DxisIzAO5eZFkHUrEFO102CctqN4nFfqZeh9wg3uuBPm0wB/8VBFSsFsbD8GtfZsHp
	CQN1ZGS9f8qn2FJlO4aV3c6EyMUBO8Bv0xxCCkTwnbmUo2s+Atn7Tbuoy9R/fqinlYi320s2cuq
	ZqOA+PI5RkvA8SOXnDKDmZo7v9FbDwkXgmAtgGe/haGt3AE3v2fcOkGXAM9aWSJiGUPZl4Sr7Ry
	CQU0uyVu634Fxd5Kf8MQCW87j0tH2orykMwjCt/IyW5moaKxINm4LobrJbF+U9bX3izeEzXrBIQ
	+8ufk8A70R3LpdOc6hhRhuDOZLKr6gF5uUFS
X-Received: by 2002:a05:600c:4f0e:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4b963c6e154mr77001645e9.16.1794232059808;
        Mon, 09 Nov 2026 05:47:39 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm10425052f8f.47.2026.11.09.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:47:38 -0800 (PST)
Date: Mon, 9 Nov 2026 13:59:12 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, almagui@kernel.org,
	john.fastabend@gmail.com, qmo@kernel.org, brauner@kernel.org,
	kpsingh@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, sashal@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v1 bpf-next 16/18] selftests/bpf: Test fmod_ret
 candidates found by bpf_scan_ir
Message-ID: <avHRsGTClKW57FAt@mail.gmail.com>
References: <20261106210314.1767267-16-a.s.protopopov@gmail.com>
 <8b7031053a1e8023c64c8c33203f67f4215142ba84cdbab9d77c89050766c106@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b7031053a1e8023c64c8c33203f67f4215142ba84cdbab9d77c89050766c106@mail.kernel.org>

On 26/11/06 09:50PM, bot+bpf-ci@kernel.org wrote:
> > selftests/bpf: Test fmod_ret candidates found by bpf_scan_ir
> 
> TL;DR: Nits only in the selftests: a fmod_ret test program's name may
> misdescribe its target, and some includes in bpf_testmod_retval.c may be
> unused.
> 
> > diff --git a/tools/testing/selftests/bpf/progs/fmodret_retval.c b/tools/testing/selftests/bpf/progs/fmodret_retval.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/fmodret_retval.c
> 
> [ ... ]
> 
> > +/* Declared targets and the static rules are not restricted */
> > +SEC("fmod_ret/bpf_testmod_retval_declared")
> > +__success
> > +int BPF_PROG(declared_any, int ret)
> > +{
> > +	return -1;
> > +}
> > +
> > +SEC("fmod_ret/bpf_modify_return_test")
> > +__success
> > +int BPF_PROG(static_rule_any, int a, int *b, int ret)
> > +{
> > +	return -1;
> > +}
> 
> This isn't a bug, but bpf_modify_return_test() is in the
> bpf_test_modify_return_ids BTF_FMODRET set, so it looks like a declared
> target rather than one allowed by check_attach_modify_return().
> 
> Would a name like declared_vmlinux_any fit better, or was this meant to
> attach to something the static rules allow?

Yep, thanks. They have different nature: one is from vmlinux, one is from
module. Will rename correspondingly.

> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod_retval.c
> 
> [ ... ]
> 
> > +#include <linux/atomic.h>
> > +#include <linux/btf.h>
> > +#include <linux/btf_ids.h>
> > +#include <linux/compiler.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/error-injection.h>
> > +#include <linux/mutex.h>
> > +#include <linux/rcupdate.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> 
> This isn't a bug, but are linux/mutex.h, linux/rcupdate.h and linux/btf.h
> still needed here, or are they left over from earlier fixtures?
> 
> [ ... ]

Thanks, indeed, will remove.

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/42294987431

