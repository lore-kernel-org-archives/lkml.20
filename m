Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531F2426429
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238166; cv=none; b=ELBn+3NCJSgRUIbXpiz/PqfAGstpzdLu3JilmVFmu7k+0IODB5x3D4zvAIwIc5YX/+jSFrBdy6lsncZkvWh7Pmk01zP4tkYfl4XXNCNGK7QeFnDgaAfRVJRsgcUH2xHfKKNF5F05ReuxSUI8PTPcZ6FstjzubOm9kO7kjnB0uuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238166; c=relaxed/simple;
	bh=Dq4IZXrtgGbdE5mjpprcJEBrzgXkFHM02HzALU+oizA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9roVF+xgY+E1gkDAlYsJmQILgdnJwlhgrQhe2LeZZEK36FCmTr9E3k41cFhcGmXcU/IS0WPuyNZj1FnO6hPdcaYa8Ts/X9mybfisDHa3+uYHZvLn4SZDFDdS0Aaj/iuSpK9Gir9c2jvnR9bLTRXMDNhF2/OJAe1oD3s7wqkwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdgGnTVC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdgGnTVC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so6093095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238163; x=1790842963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4HHnn+wFyq/rjLJHO0qvSlndCsSVnEJyRlM3aqBNu7s=;
        b=cdgGnTVCkH8u54JJcFBoVxF05d9D34iwtqjDzH4TbhzttNjQMDfY9TTpWGdbCrUfgM
         ZJB26cJwEPikMGB1QMER94FoFzKN/NyZiKgxKX3lXaHH3ry4VE2xGHOFoNJAjXxOHDID
         P5Uv+ZB2qTd+vLTDDpRliEnlBG+8zMJOVWqV6e8eKTtHtYlq+vaQZdf4jsbu9z6wAwXF
         gB2ahuaP//ZLZJarh1SnwIyGT/PWO9GkIwq/2Pq4pdhZqxySPR+JB0gp7t8mpJ5VNETQ
         KY0f3M99hLI2x9zW0ytThfL0DtZge8cmC2FMe5Gz17/b6c5JHIVnVzy0HPTOgCwMiL57
         bFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238163; x=1790842963;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HHnn+wFyq/rjLJHO0qvSlndCsSVnEJyRlM3aqBNu7s=;
        b=SV+xL+f5vMYbfM/X+AbEff0HjbloUUDS+LGECSqtFWJKyFIdK5f61q384dn4jqQRjz
         JRpChvcPDvkPabQB9utVVt6XtPpJh9kJxoXG2VQ1nPlYQjFpJWMLs0Mlw2qhOn739l/g
         qagFPhRTbp6JyeJ9JmlbIy8PZw9+N4wrIL7IUWU4b0z1+iO0X1PmUZDVm02YhyDvlCIy
         aF2eMApR3cnN8tSZQo46/qrGNqfhBGSuDgiVXUKQJT0zUutliDCj7LpU3vihIr31Cg4W
         +wQdmMsO8+otq4qx2Wn/JbpN/f7EmxGzh7vwS5v8m0nyF+7kMLJ/5j9MUPXeqbzvCDC0
         Fqyw==
X-Forwarded-Encrypted: i=1; AKwUvBy5gboN7yqQ3c2mpEUc5xi08pxKn1ZYEim9M+rCv+W48EPRjlg6IEXTO2sxMpGAE08AfsukX4DEmrkkkWI=@vger.kernel.org
X-Gm-Message-State: AFuF++leXDY5x/JbB6mOwSIEMw30aVqkvPWxDF4TmfQlWQ8lY7Foq+Tp
	LyAA7pY2gVdTNi72E+TUqUyx7nKRgYhCzucQNKkyweYy0h4xAA+zGdEk0mwU7Izq
X-Gm-Gg: AYBFou069nrlumlEQRVORKURPudHET9TtCVyZkcZoPBlmro1YdV+VOf6tJP+iT3ARHp
	pprOJCZ7W5WWTe5i9E/fuVVhBAwxSowYw+7GehLh7rKv1+OQLeg36AsGWN2/p4GPDv0jWD6Z0rE
	3Kgl50KjM0KPgRoImYTqJl+z+AcDI/X2WwYAIy/ifbpip3dlVD26nxbNrAdLYzDIxSHoqgWymYY
	Y0AkKhqCT+SxmS53dxNgZzvLfJOdDLjlHAKeexiVbg18hk78E1joa/qRNFE3BagaBxCXdWsPvog
	6bGLePgdkJM7/PJxPSM+yztO1mIy/bYoVKe2+a7Wh/Ec8gfNqebgBncjnqbC1dClCRSU8tA3OR6
	eJFHPWQ73IvfF/j5cLnrozFjNxpsQXFuq2bolAz+HRN7rf1pF/y7lYOGlbeUqMzvv0Z4/WtfSR3
	0gMNnj9DtDqTrmBR3ZaqLXllWfki0Uatvz4NDSIOHcfFNNf5xoes6cMiAoaOHqAzps8sNtbwVBY
	3ATTCJfQonnbxWHxnT7dpSeD6hUd3hDwn0=
X-Received: by 2002:a05:600c:8b5b:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fe66f17damr26591975e9.10.1790238161498;
        Thu, 24 Sep 2026 01:22:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf157cdfsm56052875e9.0.2026.09.24.01.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:22:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:22:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: tsbogend@alpha.franken.de, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 paulburton@kernel.org, main.kalliope@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, philmd@oss.qualcomm.com
Subject: Re: [PATCH bpf 1/2] bpf, mips: Fix immediate JMP JEQ/JNE on MIPS32
Message-ID: <20260924092239.0743b082@pumpkin>
In-Reply-To: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
References: <20260923105158.3514342-1-johan.almbladh@anyfinetworks.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 12:51:57 +0200
Johan Almbladh <johan.almbladh@anyfinetworks.com> wrote:

> An addu instruction was emitted instead of addiu, causing the immediate
> value 1 to be interpreted as register $at. This made the comparison
> result invalid when the immediate operand was negative. Note that $at
> is mapped to BPF_REG_AX, which is used for constant blinding.
                                                      ^^ building??

David

> 
> Fix the instruction to use the immediate form.
> 
> Found with test_bpf on MIPS32r1 emulated by QEMU.
> 
> Fixes: eb63cfcd2ee8 ("mips, bpf: Add eBPF JIT for 32-bit MIPS")
> Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
> ---
>  arch/mips/net/bpf_jit_comp32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
> index 40a878b672f5..15a2a153dc87 100644
> --- a/arch/mips/net/bpf_jit_comp32.c
> +++ b/arch/mips/net/bpf_jit_comp32.c
> @@ -1111,7 +1111,7 @@ static void emit_jmp_i64(struct jit_context *ctx,
>  			emit(ctx, xor, tmp, lo(dst), tmp);
>  		}
>  		if (imm < 0) { /* Compare sign extension */
> -			emit(ctx, addu, MIPS_R_T9, hi(dst), 1);
> +			emit(ctx, addiu, MIPS_R_T9, hi(dst), 1);
>  			emit(ctx, or, tmp, tmp, MIPS_R_T9);
>  		} else {       /* Compare zero extension */
>  			emit(ctx, or, tmp, tmp, hi(dst));

