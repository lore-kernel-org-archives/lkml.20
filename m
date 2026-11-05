Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867836;
	b=p6k8QO3oLfzDoucPuXx0BC7gd70TN5ncQL33Fq4uUqJKZ5tviLCCZDk9UbwhFbs2yM80
	 9kw3GNfwFLCwe3UTXE+41LeBb7x5PvbiUxfeMOSeXwzsv2pfd0dIunULeIa+zE/KtU76/
	 8f3c8UY1N75YwUezHWsFyuSLrduYE8nubhyY3mTXPW4jhrrg9i+Q781DqJ+zCcINSLW0O
	 zeLKVKQN6fE6gcEzXUT2XDM2vruF5l4Ce9jHPV43f5bojR+Fb7jRqtDlbMBY7J3ml5upW
	 MxKThtEjIZAgVOtzBK8Lq2itU8jAzBCfTQDKzFDaw9DESpSH1ph23jcdI8n/MKUojqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
	b=r+0InK9YRIyCxNpUf9AOmDXJP2HBqA4qASLsKAWv8wUm8f0O6zf0Kqr65JAbnDnQywMN
	 qYqto++K6RHHn3ush4C+KYUldrIhBCV0tHISLK3zWzBJ7ZkzeKcpSTYbd7aGHnADKEmzA
	 VVTAO5ceA3SqdPftxj4uSfkpvxzSmccACmBC2YHgWiPC2xjCjVb+W342m8v1+agcXFKn1
	 jl78t5WdAFTXQPx+tdb9XQFRTi1gkqjKwWT4VN04V8OVK6nhAOaAoVt+ge5tJtDHQy0kH
	 djMg1eU8hhInR1eRQVfZkv3fxytVlg0CZmWplCgcDVESIhAF0YQNguRyBtYfKw7siKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCd7OApu;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA98606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA98606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCd7OApu
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so18366935e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867834; x=1794472634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=TCd7OApuoL5e3stS7D1Cly3qhe5s15objHkahbF02Otwe/HfYG0Lej3tHT+vvUg9fX
         wM7/rDK0ZKfkmIKirGxQ4lCbjDhxdGdeY3tFpTNzaQ77gZIvgCQbEVQnLYSoAtRd/F0B
         B3P1GQCvO1Ey7jnj2cNDru7e/V3p7HMD+mzycRvyeaEFiOSwlimL84H/o+T+Sa7HeYX2
         947109hybPJgL421as69RaLomQaFhr95brhMHrb/jbGJdfW/+OsFTyr4iOavfSJAjTq1
         /9RC8ylZyagig84Z8nnznPCc2Fzl/McnQn0vWxi72uOtuqDts7dZxdxnDXtW9AxgOA1e
         XQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867834; x=1794472634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=BCmngb+w9iZk/AXa6GgE733BhM/EUC7qSq/+pDzMc/sVK1FAnV5UAPh1UWBjMwfdu9
         r9nfsUjirKdlh/SrxRlDQBrvL8rDtcrfWlWeImlkI3dRPqgyDqG9i6XFGnSbu5NFejat
         LNbQDdWHa0pG0QdFFrdoEVZ4cZTPKWOIeBtn0Z8jFGFha1Cv2JDgAXEW7MzSz/CRg6GF
         Vsd4PYLmuIm8Hq6jcAJgwIJ4f1LjY/cR0XqGyOMZKdddvQ/iF4BPyt2QIOPltEI8JwWb
         9HhQ327X3f2KilwLcLC2hPmOwm4Z0/GfDqlZWKZP0mUK6AdYF0tHgSJ/2BN5UD1b75S4
         y4wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ8puGvor2TRLYlrZjSgFz0Q2gvyR9UeNKfFmxJ4kAxWd3lMe8hML9RE0suC9nlrZh6P09ySK8i+lCz9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z++sypaCLe94HyQs/BSG651m0ONuemBpbEHILy8KV5SwKYeSiAD
	FR/6fD8IpvIHMNH8sQSLFr3yxUZGL1RZE3Mc9P/KeWkhW8m8oXGLJCfn
X-Gm-Gg: AYBFou05rYa8t1edO4RNcYFw48ljZu239Aaw5Ciy1FFS58GxYgzgefWeU/VTLET5h33
	Q6Ehhq9qeMWPJdzLRMPEPhJQiLb+NuQtqedgJBYW7wvPlaquX2XYDD2m3SzRRYHqhyPAtLUkJ/Q
	sPRUQQyHWlippnjuvrfxkz6ZHgJ/uhnzFPU1yS3w+XlfOuO6uci6rHLEoVz2duJl1jIUAgqarN5
	ozQrj8WKm5EnyhW+A8CJ4T8/pmhxqM3EJG+Ur2k8T5gFoO740wlv9S8qZBaks2JUmaGVPeXD4Ao
	PdNXCRa7MiJ54A3bG2iw5xdjs9bK0KunGNMkcTogNgzyAqSycisnygWbGasLSZHNv9su8xOF+RW
	lWk0g3zSH1/5UbHT+gghr7RDWZQ4L3KO17SnFXluKrs8SMueYKMf8zxd/dv2anLtoRRN2cxvrDf
	lHbgf7hT3M9x67pKFq4+Uxvf56X9zUE+n69int5TJ2yq+XC7qINLc4gf4SFzZs/WUNUo0+yXH3O
	YOzWq5fKmr1krg3z5cJiNZdCSAyQVTn0N25OknalpEXuDZsSTVS56pV1/JrlCoRZvCZKp7iKV+G
	Ggb/3uxWmixvtSaA+pJliuvCIOq02YSC1XdohLFS7KjgmshhZsTo8qebU7ykXDza
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr417554995e9.6.1793867834333;
        Thu, 05 Nov 2026 00:37:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm75471835e9.12.2026.11.05.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:37:13 -0800 (PST)
Date: Thu, 5 Nov 2026 08:37:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261105083712.14847dcf@pumpkin>
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
	<20261104142307.431fc12f@pumpkin>
	<CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 16:05:52 -0800
Samuel Wu <wusamuel@google.com> wrote:

> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.  
> 
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.

I was thinking more of the kernel api.
The 'position' is just an array index.
So a 'read by symbol name' would return the array index of that symbol.
A 'read by symbol name index' would return the name (uncompressed) and
do the lookup (binary search and linear scan) to find the value.

I've used a bit in the 'sorted by name array' to indicate that the
symbol is a duplicate of the previous one.
So checking an 'exact match' for being a duplicate is cheap.
But for a partial match you start needing the name buffer to be in-out
on the read-by position request.
So you start needing 'read by position' and 'read by position with
name compare'.
It is likely that the caller will need to validate the name anyway. 

An 'interesting' idea would be an ioctl that returned the value of
the nth symbol along with the name of the n+1th.
That might get confusing though.

David


> 
> Andrii, do you have a preference between the two?
