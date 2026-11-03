Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.201
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793734724;
	b=kfdW4l0qd7p9uD6pnrlTOnWI3GHpupaNSnRVo2L10r5xTLI3VWNV9yE72v03y9vA1SfB
	 IIzvZnyRZMjnCwN5JXkvqUJ819yFshlbtLbhOmOWAM3rohZY3I6AHXAZeBPj0mJi25k/2
	 OnS+tGKMWktN2vBYjUPjMxmIwCYMsZibYY79vjI55M0zQZCJE+sm33qhxyZU3uCX/56+Q
	 rtHkvoF11938UlRaUmHTDQhV8rW4WbIvs2EFAz2S+YlS86HkyBDE9noqzlMMQZgQls6UU
	 NWXNQ1/jfyjxAiJlLPkReQUnY3lToli3u/f1P8+a1Gdy4penJyroymD0Npws0DiAO0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e7Nsfbgz2MsKS6ZGWF4RMYsYl2J//BDsVK2NQxPopKA=;
	b=HSlQMTL0N5cfK6PbYrqdK+sNKJvPBNrdFSaeX8VbMFH2/sp3/NNClVmrtL6uFsAlmaK3
	 qvTrakIYgraiL5WwZVbDOv0Fr0mMXgtDEEVvAxsKYop4WP2A/9jYTI1V/357WNSr6Qfu6
	 167/+sWRJ16US6jL3whsROoRp3V7+lYFv5XwgJ+iAcJqSQfh536VJDuNPCJdp8GRIGEhl
	 gi48Or6xuk+N8nwg4Q1wtC7JhtS6hCZ278NCGGoBVZ0iU31mQiMaap6XX/gwyHqK4hBqy
	 ciVUBBap9QeNhd2GISZ9ZSOCucIAmqLq15U7fJIwLglTXvYZIAfom5O2YVQl8frmpsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ut44JWI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.201
Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BD606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5BD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ut44JWI4
Received: by mail-oi2-f9.google.com with SMTP id 5614622812f47-4f47feb5a15so870744b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793734723; cv=none;
        d=google.com; s=arc-20260327;
        b=IkNgWwT42h1bZAaNyg4HpfdtITKUtv5OdZXyd4lxhXDC6laEyYVRDgbTXpZ1/jJ/fJ
         lObOHjx9mia5ml0AVLEnf8TrEJm/8DdBuG7wV0KizvYyNouOyTiKJxYUpjblUoFrAtqo
         bs3ypHEUGu1F7xnkQ9szuFetnjq+qUo/B8TdAl1oqj1Rzc30MVdlZDM4VgryOHur+Byz
         KOzZAs5yCcYd24Mf3BckIxz9WtCJSH0h9rgO18g/eYPD369utOZNUlbFQQ8STIqr4NGG
         1cOmsNkD5DF1mrNA1Hq7dxEJnjpXwXoBgtq5WyZxThvmwoEtnXQ089Wn8TR0zHe5f7Vt
         2Ilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e7Nsfbgz2MsKS6ZGWF4RMYsYl2J//BDsVK2NQxPopKA=;
        fh=RPBGTeJBU77OyWqkShhx9U8kogLL+uuW2M2rSJowNOg=;
        b=SzuTBM5j8idlP0W5WWGs5jJwyUxqyoLMe3Jn90JeQV7MAe4bsCom7d6GKvSb062TDG
         ceJ0vjYODN5cL/h1Jl5X+bMfcgm4qsKzDru6163VJ1XWJ/xgl33spODJ+BDQ6KFvLbpT
         gQ7qD3Hx1PvULxodpLy5VKZQN/y+igTk27X5v8v90fDFbzU3GexkY3aR0itqSftMUsqY
         tJmyJLF13gDWATz3ssekZaH9xR2+FqYsjVK8sMtVvnXIRKgJ/vGoANr+PjvicWu8ZI+2
         iTyzq7Hftlj3tHYtbSId/38le0w9qVjGlSNb8xL6iaFXZrcUhtJx7P6iwMSEEQZf5AyZ
         bVwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734723; x=1794339523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7Nsfbgz2MsKS6ZGWF4RMYsYl2J//BDsVK2NQxPopKA=;
        b=ut44JWI4IUrRDKycgu/5eLHGCKLORWyJ4SPWmWARKU8B2bpEiIPRunsZUi9jiIyRCP
         F99mDDQ1yS0Qg7XLrxw8Mg1b55H2dlhachX1e9NXmprktkve97iGq6vIHxTddHnqpxax
         BchVTwevy35c8Efd8EwV0NLy623u2SSMcuOOt09um7gWbw9w9D/9nvAuHMm7un6pJdWY
         WHKdDqnW00AZ1pzI4hmhPT56DKwSqAPfnRWYEPfVEf+Sd0tKorahOFc1EPlS1H7S2r3o
         em4vW36YkfwupuAKYmqTkay+f3UZQFnFYmy4ituNR8LuiZTanchqHb0zm/kSPT8QqIoF
         lDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734723; x=1794339523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e7Nsfbgz2MsKS6ZGWF4RMYsYl2J//BDsVK2NQxPopKA=;
        b=wgwkKSxEfwp/lbh2o4EhBsvZULfPk1CBU/kjhW8TkOR8MPjbwZqwbXQ/AcwTtoDHdu
         bOGdu0QaXHV0sdWZCMMOwoCPlV8wsO3BSGrCxKoF9VXyg2NbreZd87pH9rcWDG1kLSo6
         g2diMMhM7eRk4w4tbqtwqHLIyrh+dER2ODCKhkq3AvIQXGu9++379SQCqu0aflpxIuZJ
         DSvzS77ddOp3RdNH+RsIctobu0rp9QGlfvo/Im4kCZ94pcMwZi4SIN333OH3Nb9ctX/I
         jhAXISxMpPVyHvxhCKFR7goPPEBzjS7QEH+g+KcjI07NDOOoDNGqrWrGO73VfIvoxbj1
         hEVA==
X-Forwarded-Encrypted: i=1; AKwUvBziE7aK/t5Kk8kyc/y07tuHX0/2RApMhveSGycxI+YI8He1o0OzXZqrO7/W8KHFtoFo+uC2aLQUtJv0Rkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F6mRMEdKtq2PPFSs2xeJGittFYZlOz3uY6x2lZNGAwIcqFSWB
	M28kN+tq/1JKOClBQ8/nKLjQbozHk4csOiD4Gyf64R6L2qYc9Ii1jLlE4BstsjyBzP/Fbo+T9uu
	rbtYAOng9z1/7vDBbQPJgiGiCCY38/4TCO2d/p8R3b4li
X-Gm-Gg: AYBFou3IYgQN5vYQBxJsw/o+Eww+r1vkgfZXpLGFAfK/jjf4FM4CdgjmUWuwHFX+G2U
	+11ULKdbYniETji0tHtOUKWasctBYt01x/mkGX4o3BqCtiG93VzkjN9/RClaN+R31l5IrPcuKY+
	nEd39e/e2YwORkgghg5NOy4X0jTTIZuDgulNLornfUL5WGUMCMWcjD4sU/PMGyorhmcHnrV/OkB
	mtRlhdr96zsXKQxIEn2HUHT35403x2JhzU3hINAPTbp9szb13qQdDlLUv5kYp7v2Hqn83Ub3idg
	WATvLZr0uTsCxtHQzOLE7S1GahJf5Zp+/+MiM0nHOl855Zj8NckwQhUGWvGhdFk5/PAwF0SJbpH
	L7JzHU8Qmgl5LqGuCY0xCPaQCgOYXWFom/IoByNT5PeAQz4SU4JNnkVQn7MzHcDGxKNZF
X-Received: by 2002:a05:6808:f12:b0:4f7:d324:bc5e with SMTP id
 5614622812f47-5640de72cdfmr9400682b6e.58.1793734722850; Tue, 03 Nov 2026
 11:38:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027171753.1485-1-dennylin0707@gmail.com> <1bf7784c-49ee-4f18-b1fb-205dc064f40f@kernel.org>
In-Reply-To: <1bf7784c-49ee-4f18-b1fb-205dc064f40f@kernel.org>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 3 Nov 2026 11:38:31 -0800
X-Gm-Features: AclHuK_5l-1YFLgJ9g8HKWzH3b9QB7XYwWCMJBecbk-lPEygLtMhZDFMez7W0Qo
Message-ID: <CAGEkeHcwUEQ0tAXZ5npAhPp1OPMqkmZcNPTU1OnRuNTrwkDJMQ@mail.gmail.com>
Subject: Re: [PATCH] shmem: skip empty unmap ranges when punching holes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can this be >= ?

I think we should keep > here, since unmap_end + 1 is the exclusive
end. Equality would pass a zero length to unmap_mapping_range(),
which means unmap to EOF. For example, with offset = 0 and len = 1,
both sides are zero.

Thanks,
Hungyu
