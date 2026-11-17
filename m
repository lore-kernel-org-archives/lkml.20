Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914126;
	b=Yq43t0P6DxitjQmNgxNNkB176NhXFCmWvZESn7k3B3ucCLQlSKWhOk8XzuJIsJ+v3grX
	 WSagp54K9L22fcJVVcutBcFCKTpXrg9HSuE2ZSwxA9EOwi/W7/yQNMWLo/SHOVKh0tjHQ
	 bveeyx/fooXUw8W5kihMn2GLD9EfKxiL+FAMWPJihAZ9tnf6TRw0U5t77wcP6ilIZtJEN
	 CKndTNlGQU4DxAq/cx1IgptP2tqVGh3GStPYBGwGHq6GMznb9M1FJgrCOHE7+XoCA6Z+D
	 uNXt+90Mu2cX0Gxkd7KpR+9zUf0FPRpWRUxpWTL8u17YqQEP05ZkbT8JWnLVHnHMpUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wkAifCWBa4yQo783yHdWz6gkU6PjHxfZYINEMlx6l2I=;
	b=lhGzyggNI1YQuEEo3dQQAYbJq3kfi5/XkFzJJUoAjWIFLmCZ01GhmFU4o1TwUvQVpfxP
	 dEb6pJcB3b2zu0Nkq8YmkEME2iCMevFCS5QbCzURCU9b7iNPLeYbUQJ9j83twU5XGaSLx
	 ikj0iJOQj5koKXeWwevj0ZgCKDT3L7GMhH08/Ws2aTdyu2pasDwL538P7pwHNWbUQ2glN
	 1xTbbqAJEx4U6vk9QQPadV+5t/SIqQpqIcgei9uBy0Jnfz+Oh8fvMHbwO5oCe7CvgdeRX
	 kOV7slBGmQ9sheyfASniCl9qCFseq/L40B+x+yH7AAjr/h/zGTbMozx4aP+1CH/8Owg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAsa1mSL;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A8606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234A8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAsa1mSL
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so3638292b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794914124; x=1795518924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkAifCWBa4yQo783yHdWz6gkU6PjHxfZYINEMlx6l2I=;
        b=jAsa1mSLjGhaQKr9R+v1TdaF5G7FQ5tiLTswTXbU70ClHv1TqF3rk7onGlBsNll9U7
         WZUqDqbYrFzY0D9gaf/Frrkaxj0gCCFJ4ZoULceD45JbWXY9Q3zukXgV+pJrNeRI8oum
         mOmLZTEvuJ0fHvSR59qS0pTGlQ4E6iRt1fQ7Pn5MOGAiGmVQBIvjWMC+BcJnQVittNyP
         DVmAkwFUnQ7fG8vE9797XMEyj84KacsBbaOnxvLpiEB0Bb8ZxfkK5gRXRqGAD6ce90V6
         VAJYWmromzDZPT2kdH3VJphA6WpyopItIM93zrB4YXIIfGDtTti+ZtnMEr1XuBHtF8Nv
         o0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914124; x=1795518924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkAifCWBa4yQo783yHdWz6gkU6PjHxfZYINEMlx6l2I=;
        b=lh7Tkr4J9Y52Yn6ekpmkqjkGOvRe0FzMI2LVJqmzhTYThgTo0UiD3Ad2AxgrZ1bZKW
         n9suovhxEWvjVkEQk1ZFbyp6aDFhRPuTs5qYaavKGzJtt1R7eZOgnX4t8Hz0LGaODtHe
         ENq5aySoKNWmayzh3pgH+ikRW4rOPWb1BI6uzYck02hMmXkUHxesmdSjbOrKRtS3xzNF
         ZiMhuHQtCqY0QjZKkzTrcjlybb72/nz3pBjHOijXO/Mlf8OV0bDCJ/gs3Asw8CLxdoEc
         1xmxP1RE6QHDxYooBflYIVlMXZfUb1F7xyWfEpTQ6nKnVQ6vVmJwGaXx/JxB98yVI9jg
         cA5g==
X-Forwarded-Encrypted: i=1; AL+hErHFTbUrQvCnHfbn4hr0d4BDZma9vm0AVu2CGj9lm84XN4P5GUP6EKq1yDHF9Z4oYcwDI5uAaiTW7Rxm+co=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BDmofd4w3lp7PqMwCdavROolfnCBGtP+nh18A+FOQoT5ZnLnS
	n+5j+sclpODY2wAGYZ663kb7JrP971uN7eJ/pQI2aP5tfz9nx2w/NrfX
X-Gm-Gg: AYBFou0RHZ69f/w/WtjOVHZG/DJ707bNS+1WmSTewyhe7T6j3kdO+N/gKpXOjbJ36mf
	gRBguLmuOZDq2jRuFQPITmVUOyiPCgN8ZJnkZVYmIbyXBdK3Cd3xdOJ9MOsltpYjOutmJEoENe1
	KHx74HFWCUqDBQA9wRPAOwtvzA1EDqdBEJYUWDyD42GusnLuFPMsPiQFQRXiWJPBzo4EZQNvBHV
	z/xIFrAxRcAcJyW38d/yqukwSpHCtZBv51ANqPTcrdPwVgJBlrIXmLd75D9PeO1FOHI+cy/j9j+
	kNEw/izjmTqpuNz3zoMi353g9qewyLtuQx5gIhy8seYLp8uJA8/fIsdIiHJGUuRfsfQneHn8gtP
	sBXZh0Uph9qb7oyRuFb+tmr7zaeQz9ihvkJ68q1sPlsqAcXjyTJOKsnEUuILgVe2MMpKQgbRX+e
	g0MC/NBCNVlnKmic7FMcqI5cJA8APIQCF+Pt1YNWSomWou/yA1+2SVbj4gvSAkyqZS5E9BtHqIS
	sNUNdmD/Qfg81b0A+1Yh//VQWNfHTpn9axH7iZ6K9fNEQmFRFeSV6DKnONcXCjWzj7WJlWEusm8
	JdqzJJ+twoE1+TVFujTBnXxIrqHniLuITekNTRJ/eyZYzemrbyq2bQBcsttRmnz4
X-Received: by 2002:a05:6a21:180a:b0:3eb:b103:6eb1 with SMTP id adf61e73a8af0-3f7a83b9fdemr13383267637.44.1794914124417;
        Tue, 17 Nov 2026 03:15:24 -0800 (PST)
Received: from google.com ([2a00:79e0:2039:4:4074:47bf:1530:a459])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde0f3f4c7bsm1237164a12.22.2026.11.17.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:15:23 -0800 (PST)
Date: Tue, 17 Nov 2026 19:15:16 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, geert@linux-m68k.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, gerg@linux-m68k.org, skhan@linuxfoundation.org,
	rdunlap@infradead.org, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, daniel@thingy.jp, martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH v10] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <avw3REBe9uzZG2HQ@google.com>
References: <20261117095110.2736779-1-visitorckw@gmail.com>
 <146c493fb3b8d5f5171ad146cdc23e4f2693e1e142ad11ca67db5eae60cd4abb@mail.kernel.org>
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
In-Reply-To: <146c493fb3b8d5f5171ad146cdc23e4f2693e1e142ad11ca67db5eae60cd4abb@mail.kernel.org>

On Tue, Nov 17, 2026 at 10:36:39AM +0000, bot+bpf-ci@kernel.org wrote:
> > m68k, bpf: Add initial BPF JIT compiler support
> 
> TL;DR: bpf_int_jit_compile() has no check for an already-JITed prog, so
> jit_subprogs()'s second pass may leak the first executable image, e.g. with an
> exception_callback tag, letting a CAP_BPF user exhaust JIT memory.
> 
> > diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> > --- /dev/null
> > +++ b/arch/m68k/net/bpf_jit_comp.c
> 
> [ ... ]
> 
> > +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
> > +{
> > +	struct bpf_binary_header *header;
> > +	struct jit_ctx ctx;
> > +	unsigned int image_size;
> > +	u8 *image_ptr;
> > +
> > +	if (!prog->jit_requested)
> > +		return prog;
> > +
> 
> [ ... ]
> 
> > +	header = bpf_jit_binary_alloc(image_size, &image_ptr, 2, jit_fill_hole);
> > +	if (!header)
> > +		goto out_off;
> 
> [ ... ]
> 
> > +	prog->bpf_func = (void *)ctx.target;
> > +	prog->jited = 1;
> > +	prog->jited_len = image_size;
> > +	goto out_off;
> 
> If jit_subprogs() calls bpf_int_jit_compile() a second time on a func[i]
> that is already JITed, doesn't this allocate a new header and overwrite
> prog->bpf_func, leaving the first image unfreed?
> 
> jit_subprogs() in kernel/bpf/fixups.c calls bpf_int_jit_compile() twice
> for every subprog, once in the first loop and again in the extra pass:
> 
>     old_bpf_func = func[i]->bpf_func;
>     tmp = bpf_int_jit_compile(env, func[i]);
>     if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
>         verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
>         err = -ENOTSUPP;
>         goto out_free;
>     }
> 
> On the second call only prog->jit_requested is checked, which is still
> set, so both passes run again.  bpf_jit_binary_alloc() returns a new
> header and prog->bpf_func is overwritten.  The out_free path then calls
> bpf_jit_free(func[i]), which frees only the header that
> bpf_jit_binary_hdr(func[i]) finds, i.e. the new one.  The first image
> and its bpf_jit_charge_modmem() charge are never released.
> 
> Rejecting BPF_PSEUDO_CALL in emit_call() and BPF_PSEUDO_FUNC in
> build_insn() doesn't cover every path to the extra pass.  A program whose
> main function has an "exception_callback:" BTF decl tag gets a second
> subprog via bpf_find_exception_callback_insn_off() -> add_subprog() in
> kernel/bpf/verifier.c.  The main program doesn't need to call that
> subprog or use bpf_throw().  Both functions JIT successfully in the first
> loop since they contain no calls, and the extra pass then leaks func[0]'s
> first image on every load.  A CAP_BPF user (needed for BTF) loading such
> programs repeatedly could leak executable memory without bound and keep
> growing bpf_jit_current.
> 
> The JITs that support bpf-to-bpf calls (x86, arm64, riscv, powerpc,
> loongarch, parisc, arc) detect the extra pass via prog->jited or jit_data
> and reuse the image.  Would an early return when prog->jited is already
> set work here?  jit_subprogs() would then see the same bpf_func and
> finish, and that seems safe because any real call or callback has already
> made the first pass fail.

Since this initial JIT doesn't support subprogs anyway, I'll just
reject prog->is_func upfront in bpf_int_jit_compile() in v11.

Regards,
Kuan-Wei
