Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660528;
	b=J8NkMztick37Ru8DpJuqqkgTUsGvmFieRi6iTd1Ujh899ElzhP0VdUUwnwR6ybvvgV5E
	 C+U+cSjqvmXANGAHy0eVXVDQmRjCtz8K2ACT9o8jdMtGrPtq6CFg+lv1eoV/WtdNwxDhB
	 y+wPV5cdF6W8H/1jDAXaF6FU++LsMqFjMadUTGyxLEfYP+30Wsy23KTNBeX9z5QvZGRYV
	 lL86SNhU/IblBiKDwaZWr7ISebMm/ij8hQyFoLUd3SCAPgB2PO9wL2EdC8l7NOyp3TgjI
	 HsIWoUAzxLniykM3BSXxEULeByhnmhv22NC+2a4bojvITv6wmKrhzibgx7ytDiLxDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=oj9na0DVBDJtudsZfLncNdoZFNBIlfRdys75ekuhQE0=;
	b=cOpVAm31bnQvbj86JZYE0XWrUriwaDEupi4jTkxcOXIERK2mu9qtd0Dh9Zk1sG6lu7ae
	 5zsTfSuVgB9P8i0z44nSKlhoQVM9XykA9M+X8AlR39ZuY4WYj0JoMf5EDy66woOIhdBpB
	 5X3f524iMVcmpvbLsf5HZ1S26yd8CWR0FFor3BV38Ft976E0+hya1XSIzM6U5b0nBhXw8
	 6dpqd6xSReYUz0vx3XFJoTzPtnvlVR4B8Xi0gr8dR9NNZiWAsjF2OMXhCPLw4FK0Si0SW
	 +Ksvq2ijDQRuv/M/CWvkVG0N0mptE8aJq8rLWy3l3QY0q994Aw7QP7z7QtjA99jdCJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfdQ4MEg;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A4606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfdQ4MEg
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37628596783so3330307eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660527; x=1795265327; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oj9na0DVBDJtudsZfLncNdoZFNBIlfRdys75ekuhQE0=;
        b=hfdQ4MEgT0OcBrLyehsxdWw84F9f/5GCZOQqj2amNoCkIYk8eWe4OKfIVS90luZGXt
         +w/W2fyscAdro0HxNBsyigoZJIrRGzXg03K1Mo8dxCrZC4w8CGZS2xfzGWaBhwAm5mVk
         NW9ftwwqSBkSSsjMNvgDMIhiul3oQrsB+42SceuIquIJOa4ZqlCYZaQeS1AhPT8JvuJM
         fvEJUs1wlk5l94qcRHzVFdToMuLJiYoxPlCBMhG9PaEMS5r3Oi1Ill5pmV3vFOeccr+T
         dFkvGNuB1f/E/cW8/naZzkiklTu/PeY8pE6qPMyPo6w04yPmfMmYvzqmq8nP6EiRDgVw
         APpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660527; x=1795265327;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj9na0DVBDJtudsZfLncNdoZFNBIlfRdys75ekuhQE0=;
        b=JCq576nJyh7Z184uWckDNcCtyoEzCB0Ur3GsyVELFQavACgbEaSiZSKNgstUKFkL+P
         bYKiAjteahgnZ77N5LM1lszWw/ITKA7+kqnHzW1BJ18qaOhD+sSWQthmiCnPFZp3g9Zc
         j3Y2XmmWuJ4oCrD/AC8aTx8YZptselHLI4mkSUKYlAedn31qSni4SC3cYyOanxaNyGIu
         Q70FKfCW+ERIb2Gm5IG02LWMRlNc5ktzDJr60vq9CGW36YDtAxBBhfQyv27DWfn2TBc0
         /FLVZdXa5xvFqJkWS5T+Q2UC6rzxh7/JD4LeVVbQP58CxidIK89KTU075gshNud5xrua
         6jvA==
X-Forwarded-Encrypted: i=1; AL+hErGggQ00JHVe3OcLR1N9mE4gzq7lrKFQw6R3CIea/H9CDAcHkP35LTLfE+u42MnrE0wHRCuwic5AaBOE/Rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UAw+IEwir8zXrqe38s7/8e2A/P9Hq1R0et+8P3q2zVagAlp8H
	k08LOqRwQNRkVaufE9NgfMJb2JV+dNfQyVHsFR64gaBe6Dd2/miiyKH/
X-Gm-Gg: AYBFou0rWD7C/6MAKDCo611FmfjXqpwZ+6oaDlEHPCQt/2lzfGZ8bq0tG1C+RNzz2K/
	i4dJQMgBC5c0wzRADLgkmys+vgyYVxZe4ymTlDtky6Bm27jBvK1i9sHvrJQw9ZhNOFiKOXs5bn9
	T5YElGkWxEbpP4Q/8bsvK47PCra4UkAd8KcfXpxEvV3jkIP4K8x1hZw0q1wrsuVv3dmzTjeO2+b
	fElT5/JDwaJwG0wFzDdKHS8p74FVAIKWkWulwmZNVEJfzdEHCaxlKvnTxvDRkDh4kbxnYt6aFZJ
	coOpCZ6KP3zyS1cSnVTvb8rNI6hE/YqHbBJaskIz2COKY7sqmRfWA1VW03Ibl0dEVrgaWPI9BJP
	PDarwjHjE0fr4zD9oe0jsXoRAT35NknbwlFSqT56nlOKhJ2zACAAenUop6rivDWNonvN1UjMEAX
	/zjD6k5++oZA2U0Rd3hp24vruVhzWBK1AI8Cz/VFZ5WFnPYBX+VVZ03Z7zR4bKOZwF+rBjfLFsH
	v3TdEXjn82JMhDwdEdwzYGGD85oft9sC0HMo1tnP8VMLw6ysmp6bjilYj3vv1EHSkGwGvwTa1R+
	WUcbiOZcuG8GrSXzXs6QPi3y/JE=
X-Received: by 2002:a05:7301:da0f:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37966961442mr5196237eec.25.1794660526823;
        Sat, 14 Nov 2026 04:48:46 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm28530823eec.25.2026.11.14.04.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:48:46 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Naveen N Rao <naveen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Abhishek Dubey <adubey@linux.ibm.com>, Dan Carpenter <error27@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc32/bpf: return false from bpf_jit_supports_fsession() on ppc32
In-Reply-To: <20261003184226.76740-1-kmehltretter@gmail.com>
Date: Sat, 14 Nov 2026 18:06:33 +0530
Message-ID: <cxs78u9a.ritesh.list@gmail.com>
References: <20261003184226.76740-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Karl Mehltretter <kmehltretter@gmail.com> writes:

> bpf_jit_supports_fsession() returns bool. Commit 92258b5bf1ec
> ("powerpc32/bpf: Add fsession support") made it return -EOPNOTSUPP on
> ppc32 until fsession is validated there. The negative value converts to
> true, so the verifier does not reject fsession programs on ppc32. Such a
> program loads, and only attaching it fails because
> __arch_prepare_bpf_trampoline() returns -EOPNOTSUPP on ppc32.
>
> Return false instead. The load then fails with "JIT does not support
> fsession". Tested with a ppc32 kernel on QEMU g3beige.
>

Fair enough.

> Fixes: 92258b5bf1ec ("powerpc32/bpf: Add fsession support")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202608010958.cYfBCQAC-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  arch/powerpc/net/bpf_jit_comp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Sorry, I guess, this must have falled through the cracks.
Should mostly get queued for next -rc release.

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

