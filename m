Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484974;
	b=QCvAb6H1XBojfnw/2iNmLQsJ49Eezs6sGaUHd5xkI0pIsB+DWuP4nmmCjDQXTNu8TDWg
	 WWlp2Gp9UFoJAlqn6rOmwF3atDCTdJ52mcKFwPqWH6yxVEm4ZipfMR1gASZhUgot+bEyE
	 bjgCHsgVd0NcEDypjG+wQjBNy5aQ+EIYbY+bPeFOOAGDnEGNRc7uA7ELYFz2KN5wjIZ4V
	 HCuGSILl940qcFzb8KREW9zz9gS2sxmpssrN4uaT4xbOQRTazpNQwFuHOy2BVrcKrF1mm
	 hsERLMsK/Jz1KlAVw82A+Q9azq+BTbH/sBq3FrKwC5tFqENRDFIA8QAL3Fdc40P5cOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
	b=4p+bEFTNKwMCZVo1A7N19Lxw/avRQ2V2IglOmmpcemlSayWidfGXiuAxWtCTh7FAqvwt
	 XW329xYLwKrDY3vNOkkIgsHZqXa2deNaB4RRCxNrDIMLfwng1Vbhvahlmsm2erqAboZlH
	 3UlC00XKAkEs39F2Gx2MA6E69zlcVFY3ypvzBYCz2CqfGFBfOmUCcS3pQhiyYzxYBA8JP
	 74k2BF03/yR8aEdUAkliJYtPEY2iEKGt/yWxGKseInvD+MgnNePPKGi39NAy/0QOZJi1Y
	 j8qD0W7PxF8KEfel1dEkiQvTr1ZYHki3t4sq8JsxgHxg2rW1ZBoJdwxw9L7Q5vpXaEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OCaT3bl/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19389606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19389606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OCaT3bl/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so2347061f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484972; x=1795089772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
        b=OCaT3bl/FsF4u2GHgdA2lN1oedkz2/UEv8Oos3RDlLlU8ET813dd9aI1TVGoqLuZI0
         Cf3c6fY+8VCQcTHGfpyQJzRvmg4AjXLNyDipH4B+F8cQh0G092DJHFljEb4yd7nb1Mjn
         droxBfrL7V7QF8R72rr74a36DJ1cJRvw1EveftmQL3or0Zyu2flnwWc760kjJdADR9CO
         KSyBh2h8pY7CqQZCjmg25rtuUuMdf5lIbwhSjgV5kIMkoC9JUSmgEOV4A9Doap3qfC4z
         FmVB1+f+id7Ei1/YlTCj3XFJrUzCsnYTJB7tF7JVilKonM5SQA9p7pJbSHaP/duFOBWm
         zeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484972; x=1795089772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
        b=y2Wu7S762g6xeQENUHCxehvpluO95SUPJ3fwRIKprzTq7disI66BLoUZMfDXSff8IS
         0G0Er9aUWJKgJL8nHHGzQ+aE2uHDuMaJTDwamQO/arWbml4M/a5CXdSJPvl/QoxLLfac
         gR5xA8FJcEDo8b/51t7bCnjJrU9/58gLYsCWLuNMIqdT3LdaCJN5yNKTyImxjDguM9rr
         WkEMJYu3l+FJBvlVlMMLZrQE1bRPcDRBZPRH8Dw6rHhJR68SFUhr+MpXdbGk7Cn1Razg
         RLTYDxui22sXoeXNpwWKLJXuiKsW48EV7M+FtCc+U67yYBkzBiowY7mcfUC69zCruqvI
         yHMA==
X-Forwarded-Encrypted: i=1; AL+hErHw5SgVzlDBLy6IoMMMIsIu5kPWq/VraGmKkPE4jap9lVLd73x6wUS6ltdD+d99eA42WoF4+SqOlwQy2Ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S4FLpl9mrfd3XZW7AJHiApqxKCb/19VeCfSgtDwZgw/oh0cKr
	510L6P0tqKdgoA07YMWlZyrZlxQcBZcutUY6fRXTNJVkNJARh7+OjzxC
X-Gm-Gg: AYBFou3r6N6ZA+azDoe6XmoV2QFIcF+yr0cIgt7XQojHjxeOqooQGAq47ni/SrNYK8l
	LMZPnixOryyu46akQguR2ns797ca3IeRNoN5w2BBNAqV1UFJEWqRHMPLYarmp9FXBmvG1C44uLt
	Nh7D/eySjUSFL/FdCYYE3iv3g0uxe3YIwKWbupqrzGsL9/1Oy5yjN9qzqCwPxteUu9n0uM+iMul
	OB25+tOSo8Oeca4dkFdvFEzy2ckNtlfEofaTPj3XR8rxMT+QPBKidqEC62LfL0uBX5Mp7b7SepB
	L6bmE+fLnrft7D0pKttur7FGVh4XgsSqkl9MfmRE6uyCdGJDGMjCj/tqLRGQmLg4n1L/yRHNveR
	b8ikO4VkhQnRL+PL/qo6boodPP8WRFu4JaQ1eRRU/LH8nYfURQUbUQFeMNC8m/g2/4Rc8/8Vbjk
	j7lM4CKA6y2aCfdSh26uCtS+HPi1nFVwhbhNm4L/W2RWnPB1AwfsimMPDzG8eVYcIWJJWRW5pO5
	RQ5S+Li3C+udtqFVGLqFf37pq2Vus/xrWgx3X+2SUEy7rE3TIyLW0NnBZ6XdMAdRfypbi85IvHW
	c5cg5/3GHz9Zff+4js44mTjCEFdEKoMPjNijkROuhZ/OOSxtQu8bVxFgmdngdSMsyA==
X-Received: by 2002:a05:6000:460b:b0:491:1e3f:a427 with SMTP id ffacd0b85a97d-499c898168fmr8711941f8f.42.1794484971757;
        Thu, 12 Nov 2026 04:02:51 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm16541261f8f.50.2026.11.12.04.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:02:51 -0800 (PST)
Date: Thu, 12 Nov 2026 12:02:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 oleg@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, broonie@kernel.org, dave@stgolabs.net,
 jszhang@kernel.org, tglx@kernel.org, conor.dooley@microchip.com,
 thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/9] riscv: add infrastructure for preemptible
 this_cpu operations
Message-ID: <20261112120248.5c8265e2@pumpkin>
In-Reply-To: <20261112104149.38589-3-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
	<20261112104149.38589-3-cuiyunhui@bytedance.com>
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

On Thu, 12 Nov 2026 18:41:42 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> +/*
> + * Mark a region where the per-CPU offset and address registers may need to
> + * be rewritten by exception return after migration.  The three registers
> + * must remain distinct for the whole region.
> + */
> +#define __PCPU_GPRS_BEGIN						\
> +	__DEFINE_ASM_GPR_NUMS						\
> +	__PCPU_GPRS_ASSERT_DISTINCT					\
> +	"li %[off], " __PCPU_GPRS_VALUE "\n"				\
> +	"sh %[off], %[gprs]\n"						\
> +	REG_L " %[off], %[pcpu_offset]\n"				\
> +	"add %[addr], %[pcp], %[off]\n"
> +
> +#define __PCPU_GPRS_END							\
> +	"sh zero, %[gprs]\n"

Those are quite nasty with all the hidden variable names.
It wouldn't do any harm to pass the names though.

David
