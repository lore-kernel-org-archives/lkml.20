Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FAB3CB579
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234616; cv=pass; b=SvArUAy0a1zQrnV6eAs75ikOc7dT2wTrRrUwCso3uzw9K8XfznPpd6EjjukRf2xKhizcDvebpWWva1BPaKXo/R9Zxg/tdO5DEy5WfwF7fixCr42xSAgzhyWp7mTJn0VtdvovA5Rz7gtI4+DauymXwrQL+at9DVR0fhag8bdseC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234616; c=relaxed/simple;
	bh=7FzqKOy31dFK2JByQDOuvX61eLKgIqvkGkZe4Vjl9BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLCI+SPQikAnksIXZici57NrL+x/vASIl3TkDrwDECmqbjdw06p/t+Ea1pO2iNkFkKqYiFMfnt+wSdo1JmxWsPePZ3yiTBzif146d+jG+JIVBdBpONYGlAvTwzWnfDGoLKmm3NyDlRjwTGu+fZL8/H1F1NWkrRm4lQ0/xBMraD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXi60cKZ; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXi60cKZ"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66e5e33a9d0so691384d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788234613; cv=none;
        d=google.com; s=arc-20260327;
        b=dMNBjFM/2HxrlzwxS5YHf5GkSBdNKUoGB/xjpwYkLD/R1WDIRUWaoHtru5NPuJXkJv
         TeLgCFqISNkPT+1gpImZAZ634P1BgA2pwOizoKwnTjpajVSLL2HE78H4oVo8TAZHhyXk
         uq/uaN8hsutDmqt8Y9khHKH4vKbemyIZYiSpQEGgo3IFJlMWtZx3lwBf0TrZYQ+Csy/z
         lXBol8gVfzf3V99H46DEdT4Obti2jlerHZipJixTXSrEAxivoopPoE0DDM7mTV02hGG3
         l4u2i9BXzpE6TGmEuPErCsmqpPlMAakOC7sXNkB8qJZuIvQ7I+DkIAG6aX7xExSPo8zB
         Z9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oS+YgxWiYLpVEf2e6Auv3kRGzGPNIEMUh3WyA4TvRpc=;
        fh=KqG32WtFjtuNxQXtGKb0KetqrgfvWnehy4ugBuwSFW4=;
        b=grLAJChdrMVaLeG4y1rWqU2FSzSsgUPVGereganNvGhNu1RMsX6opRE9p2BOCpwnWY
         vs2OW+b2L3pv34s5peyHSLzVovcHrbexsek9zNmgw0C+Q/Tq51ofpLPNQ+g9d50qqwG8
         tpPpSk6kr1qSIEkwjuVw82kOdtdkfgo8olqJiUG8wKWfLQ84xwV5HEYzTat719ZclQir
         8ll0ehafuW3lctFn6KYMW22H+aRm/Hq4+bAKOTkdF44mA5sr1OcuPbmO+JFQOW+rzPP1
         YcvXDu/hcGeWDGCg6ZcWwBlqM4BPY9svZe/QH4lBGI5mcf4sOHLatQ48suD7BExHs48N
         y+bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788234613; x=1788839413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oS+YgxWiYLpVEf2e6Auv3kRGzGPNIEMUh3WyA4TvRpc=;
        b=VXi60cKZ6KLoOfpQas1D1MZa9jydnFHL089jOajoV5u2rImq27zhvC85UYKe7utpYr
         mXXetnAJBtv/HXu8QQ6u4fwetu+DK6jsBqf0CFNew/kEw/xNNP9f/nNy/JLfNwcNg/5z
         Fs+A0t7BvqIIyyMIeMltoF4wOzuFEpwP9AD43p0ag6C4YXgRnCAyo0v1j7hbHkRbbjWp
         nCOaeW1CuBJ05066zK5BL2xwJYbO2hGcKcDPCHr3fl8CwMeyDYKsPWnaalQmUXqOj015
         rCAHxNebnhHekcZPaQ8CJH4WIiS66ZvBQ+WwigePSyp87+r7rt9LkhhAM6Wleplg+nSU
         7q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234613; x=1788839413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oS+YgxWiYLpVEf2e6Auv3kRGzGPNIEMUh3WyA4TvRpc=;
        b=hDpBUKWtuXuzU31z7sWJGCzXKWLNdmQ2sFpNMB8ISI65ISTeo/+c0y9mcXPbYiTfMD
         17FknGNxhwoK8DO72uSb4wFZ50m4h2nv4nYfRi4o4Hyf/P1JSvI17b8CZ35mR5cFqISF
         RBUWiSX/xq9zLg7kOJWMAH1Joo+4EWV6K652xaJGW29yUlMpd7LO/rQS3Yxpi73AcTDO
         y6LWf57JZvjQB7aaKpEfuTzb1XAcndwFQ5Ej6wVzTPNM39HHOehZvXmYqQNAvNKvaKzD
         nIg3PgZmyyay7tIMXS2Au4IvCBMur9bj8PIOzZwxuSLN0je2/nGhBlHd3wsj+G2GBAQ6
         Tewg==
X-Forwarded-Encrypted: i=1; AKwUvBxnaZOF/pP4Z3Ltr6AZu2lcCVdXnAn1NPxvyAFQHAqQGa43Ck6gDE5gctgeWWLXuZTxEfyuyptPaKiVvXk=@vger.kernel.org
X-Gm-Message-State: AFuF++lM+TiiHOlNZDaHUdSPGGJbY/tviuf89Ko+Prl9HQtBZr+xrvrm
	NJVImdFrXDa0aIsjqtn6z4putlhORrgz5rvk9kih/Bew8HCG/h6mZANNTg7phGUtJL4c0lweP92
	iFlaUwUeV3SsRBnG+TxzybZ3BMzAF5vs=
X-Gm-Gg: AYBFou2jqmTV03aPkCSGBdPK7zzwro8Pcyf7zdfbtrJ3TrZgq4yoNWxyAkePY8rr8jG
	laRumImJzimIbOL7zmnhu9Yuvs9h20L0Jly+TtxjL1Q8+3VivyUlaxhLVakaPZSxK7L1kcX+8RI
	KCwvdaiMAK4XC6sFsiHz/qsc0GZmuVXdSKxXi4iaZwu5ZNhiTtX8YP+N9n3Q7rBH9hSPNO/aOlL
	Syrzy4ypsMXpbHnur+7eBZbWFqXL1Z932O7jJE9LZXz8Tg6oQwc26X8upp8MNVJfgJUx7isfpUx
	uMPChmWmtcStjXn5rztbcggsBE3b+nNHTIeaIly+K3ZSLMX5jmJhz+V2AweEVT94BklVvVnkJQM
	neVKTrrv6+SPCwYFGhhun3lU=
X-Received: by 2002:a05:690e:4888:20b0:66c:71a4:6ef7 with SMTP id
 956f58d0204a3-66e4c76ec48mr7226022d50.35.1788234612985; Mon, 31 Aug 2026
 20:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831092305.42062-1-tasos.papagiannnis@gmail.com> <20260831092305.42062-7-tasos.papagiannnis@gmail.com>
In-Reply-To: <20260831092305.42062-7-tasos.papagiannnis@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 1 Sep 2026 11:50:08 +0800
X-Gm-Features: AcwNN1U-TrFQ78uGmPSlh5DKr82QMmwSDUwbspb3nZbsW6N1XhgnhGW6LFmWno4
Message-ID: <CABFUUZEwY7B0VOvhbhieHXHuvms4dx_GO3gw99vL1zk8q+ESTA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 6/7] bpf: Mark linux_binprm->mm as trusted-or-null
To: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	kpsingh@kernel.org, matt@bobrowski.net, song@kernel.org, 
	utilityemal77@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:28=E2=80=AFPM Anastasios Papagiannis
<tasos.papagiannnis@gmail.com> wrote:
>
> Mark linux_binprm->mm as a trusted-or-null nested pointer so BPF programs
> can pass it to kfuncs after a NULL check. The linux_binprm owns this mm
> throughout the bprm_check_security hook and clears the pointer only after
> exec_mmap() installs the new address space.
>
> Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
> ---
>  kernel/bpf/verifier.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 386401fe051d..584c79326b9c 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5958,6 +5958,10 @@ BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry) {
>         struct inode *d_inode;
>  };
>
> +BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm) {
> +       struct mm_struct *mm;
> +};
> +
>  BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket) {
>         struct sock *sk;
>  };
> @@ -6012,6 +6016,7 @@ static bool type_is_trusted_or_null(struct bpf_veri=
fier_env *env,
>  {
>         BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket));
>         BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry));
> +       BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm))=
;
>         BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct vm_area_struct=
));
>
>         return btf_nested_type_is_trusted(&env->log, reg, field_name, btf=
_id,
> --
> 2.55.0
>
>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
