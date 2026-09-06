Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBFE36195A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736726; cv=pass; b=P/QueRi+DWtx3DK7mvEpf3O8XrCwc5piZ0Rhk52jeTStH0tSu2XBHzsfiaW+XXJJMeHS56UM1kvmW9hRtFyQzNCVONuU792ZzksdMNMytCXJ6EIc4grwjI4HCVMyCCuJTUI/qqfyA4enzFjPI4LzmgL633flV9IKgKbVijsSMQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736726; c=relaxed/simple;
	bh=724XBBM18e/5/TAVSEA0cDWj19CNMiPpyAaDTnCZGLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TN7J2gaTrgHfqg8rlPNyuGyd/XZ7eajlckdM6HOi05fLlr0YhzqAYmNbtd5lSoOzn0Z32PSttrBKdfeFabf7k0FgyRLd7kZ5Ti+SElEmAzdXxcl40BEnCi+h2YFRqlgDvQ/jlhisXEQJY2sIrXCcK3ApRWapkJMZExi+m1iTKRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0SQSRcQ; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0SQSRcQ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-862815e2683so1459560b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788736725; cv=none;
        d=google.com; s=arc-20260327;
        b=XTxpMIiSoyr/n3hU/bwyZ/HIw9SlirC6IrPoS+eI0NdUCLAg5XchscRBkhKgzMVotj
         EyLBg/duJ1/xz9onudOQY0BblwFOcENxxJuFv0ORH2hTP2t82q6AAqHJsK8/a0OYipr6
         U/+ed4c/LYlIhM8c9Y3OKJf7JQ5Zzqz3BNUH1OrUxeivYzncrEe6QCmqT9YI4zTlMK5Y
         yOI9fserSVsIyoD+YPR8ELFBHLqkN3mgeBxgm/lcZtPSgvWEiY/tZ2Z02UtcH5PMQt0x
         bWp22s+Yjvi0WGCWppDm6hWkGFOCDJERJ5O2VufkhgfWhNJ3+5CivTAnGBlp57TNYIKp
         4KTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lolE45Uhyd+sThQbwL8EFg5+bmDGsCrRM5xzs+E9ks=;
        fh=S5wWteorrITqSOSUDsdXrLUeBElVtWFDB4cKBnm0fzM=;
        b=YWHjut+WrM2glYGFBASJ87utQBh8R71EmV1urn6zmDZTFTTvY713cTzKK+msyYXSvg
         9+c27cQE7yqLNq+3aEliSiV7hm+8SK76IcduLz4jJzYb2Zke1roF+17A6YtTRnEJd/4x
         ped7rTVQhLmv2ZTybbF4xH3gyPy/2tSADYh0pKR7CQmS4jqLUz23nkBihmccX9uxXxn0
         C3lKBqu7nFkENDm2vhL0em5d3AZrYb/Hgx7WK0cJNTKqOmlIWOln2h9LZ+6B2LVtKGJf
         VLo/cGSb5yOQe6c7ygT+usSp1JYRQffpec0bZUdKY3mn32kwHS6wUpFsvfEENmT4hYg4
         ph5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788736725; x=1789341525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lolE45Uhyd+sThQbwL8EFg5+bmDGsCrRM5xzs+E9ks=;
        b=U0SQSRcQpQGzr9UR8MK+L9br7STH2Yj3Gw/0QQtpr2LsD7ahUiJPVL6Hd5qyU9tIIK
         LYn9bdXjdL64w/Vt62iOZr+0E6AtPvOvgSMO3Lpo4cyMfumMjOPfrIPqqz+aP/SPxtp6
         PKT78kyRXTaqAnSnkIJEk3RYEVUHwla2xZ4VZKe8qbIfh6mr9kfeMJ/VKro0SxcMWyoF
         X8cS15YfGT6ccabKtuGTcw02h4s0rbfgMU8RbQOL5A5L3KuIVTjjfip0nMIjHVcjmEtt
         M4lQdXCKLE14sGYggseBHXhbq71cm0Ao0+Jqs8JT2t47o3mlf2z3XxfcRwATtyvFSEZV
         aAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736725; x=1789341525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lolE45Uhyd+sThQbwL8EFg5+bmDGsCrRM5xzs+E9ks=;
        b=dwWUQkeXvSYF+Qe1h8xYibCxlvA0xXtdCgfUqMKifF1QbSBwH6Ll/kuRNZGCLFRO6X
         W9lMOcXJ57vE3JVQScvWGi5Lebo5j4LUm3xfbkFOTNaArf8Nhwu/hswg7DwH7+3aEwAU
         koBKHpmAYnVi8cJhpecpCCecP0mD+bDTdScKDjAUIRQry2r97JCDG7FjGiheDxosjqeu
         TL68d4cP0XziaLb8dt+Vih287QBhiG9OR0g+9pj4j8A1paxb5rywJ5IlTWXN2uAjuskL
         anI/udez4BSGmrABgXlKxTokfAUlo4iAXR4KoHb2tSAcq1a272QQdy3xD2QQJtQcYjm7
         H9Pw==
X-Forwarded-Encrypted: i=1; AKwUvBx43KRy9T6DkB7Jg7SPThaw+ddtul6co0bNvJ8Ynp9S7d+2H5R677cWMc9KJio26RN2CoX8HvrWYLBhyp8=@vger.kernel.org
X-Gm-Message-State: AFuF++nB7R6Lv+4YGnxGbb9MoF/O3Kl9lTbLIdXT6IXFE4qjL+uALy8c
	HNT4b8tmJi4+i5N/WloNnGeMWpfgdAh907hJyokuOWSe8MdKVuFBNKpwiXIOW8bTgHkOSkhucBh
	CUPqs/u7rlVs259wQAXQ78WhtNhGsKzs=
X-Gm-Gg: AYBFou0WxCkQK0wapFgWL+Z4BfkK+GmqFOmp4FA1CadYA5jFuAJwJP0P034NfIVyRjb
	wSbfPdPMoX5W4oY/3lLPml6COGL/Wjja7zRL1Nx5MuQS3XQQFTvPVFXzaM3/8VY+yw3ByDdf9UN
	W32QebKCd8C7evdKjubm7CK/e6I/ZiF24VgcxqGSIj/KgZSo6h72r7CV5r18g6XjMYrunbzYdaZ
	mQXif9vxvUGMul9ZeI9neQcgRkiPVqb23DePPhcVR5Gd/OP+ruroPkVbdU6hlH2LwfnL8Kmh5RT
	ZmrThZWYK9KH3YSp66vVhUlPAJa21h72wSVhU98GnG4EwBFwtZl5OKrm9lY1Lyez0g/HDzM+U/T
	5uS4zTB4ZaTJytoE0hY+BHV6lLVRqvpZLWxb7g+M=
X-Received: by 2002:a05:6a00:13aa:b0:84c:5b65:ef86 with SMTP id
 d2e1a72fcca58-86168e88261mr23644101b3a.17.1788736724956; Sun, 06 Sep 2026
 16:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apl_5AVsAYLjVX5C@sirena.org.uk>
In-Reply-To: <apl_5AVsAYLjVX5C@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 6 Sep 2026 16:18:33 -0700
X-Gm-Features: AcwNN1WQk-B2sF_oTeT_a5F-7sgNbJL45Qm1_BHeZkWfObnP1i9S5tuc4ycX_W8
Message-ID: <CAADnVQJuAGh0P0sw3wWWPAmq1OmAX27KNiCYn6__rZkGs0hPrw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 7:10=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/backtrack.c
>
> between commit:
>
>   e3e4f66cc4b72 ("bpf: backtracking shouldn't clear outer frame R1-R5 for=
 callbacks")
>
> from the bpf tree and commit:
>
>   5bbb242c08590 ("bpf: Handle R2 as a return register in precision backtr=
acking")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> I'm not entirely happy with this resolution but I think it's OK?
>
> diff --cc kernel/bpf/backtrack.c
> index 47282ffeeaf94,653db80bcc47b..0000000000000
> --- a/kernel/bpf/backtrack.c
> +++ b/kernel/bpf/backtrack.c
> @@@ -533,8 -538,12 +537,12 @@@ static int backtrack_insn(struct bpf_ve
>                         from_subprog_call =3D subseq_idx - 1 >=3D 0 &&
>                                             bpf_pseudo_call(&env->prog->i=
nsnsi[subseq_idx - 1]);
>
>  -                      /* Sample the return registers before the callbac=
k
>  -                       * handling below clears R1-R5.
>  -                       */
>                         r0_precise =3D from_subprog_call && bt_is_reg_set=
(bt, BPF_REG_0);
> +                       r2_precise =3D from_subprog_call && bt_is_reg_set=
(bt, BPF_REG_2);
> +
> ++                      bt_clear_reg(bt, BPF_REG_0);
> ++                      bt_clear_reg(bt, BPF_REG_2);
>  +

It was more involved than that,
but now the conflict is resolved.
