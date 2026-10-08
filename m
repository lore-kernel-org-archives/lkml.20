Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E0F2BEC34
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438192; cv=pass; b=BGzfmg6hZfc12CYJ9T9QCoA32FPUMBxqJACF8cNc7BXtV2HOPSTZAxmJqWDT8hhjIpMhmydF9PwTwARVHVgU8Dn8wBLdEkY91FL1CqYqAlVe5blKQOfBCijL0N24i6lb32ALk7Zq25ls2P1bQhPwS5Dx8x86vdb1Xot/eInVQvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438192; c=relaxed/simple;
	bh=HZ7ucweag9Bj3u4dkisTXz0QU0GWHhGPnKE9QX/3n9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RefRO20+SafAVCc66DwFGkHGO6bSfy9WyuZtEDaVBl3BLgJifgi9h5VH9Y3x/S7xdU2KmEnjFZXChOkwfUkn5k4MeHtNLO6MR4pxlScI/h99exkOJP9oPtdBCmi0S0MegHaD5fEbiPVu0wr3VANz0Zbxu4CueYhI+2EnX59hs2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=aNMSaC+u; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aNMSaC+u"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso6014538a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791438189; cv=none;
        d=google.com; s=arc-20260327;
        b=i9vLlHzyi3Xf2GIDuNaAPj+LUEM+Gh8GRBe+BgMUX3XrucroZ04a7D64bTpBaOp0xr
         wnckLo2jVfJUSVrVCAlpzjoGhSw+pdUfHNNOOolxiRJfIwGMUcZ9heERLKW5gT2RdPi9
         KhQ7cTdkW18po+4M04bAf5FsQcMyJicVUPXhvrgSQBwDeM54JKGRug1MO/eXGJJS8aKu
         hONJMAczYg75RS+oORFr+X+I+zjfYDokKv8RUJBg2/Ah2t5DPQj8jU6H8iRe/xgc9qre
         Xrj//g9hH0O3OoFuGeP7Vrw+M6PJWBWa329QvGMqpUKjX4Ba6dzZiAdoeS9a6tVpDiKS
         Y71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFQVP3Icf9nV+7X1cbKmKKwaGAM1phqqNnkrhrVM1G0=;
        fh=F4ht9LIXGKSS81rqnBk2gCiSEzzXeKplU1ztkUs2XQg=;
        b=N0M+jJN7EyA5TBWWOHR1+HBur+A3HOGaamYT9+PCLxElw3EQ9XYitUbg4SxUQ2yRWy
         rlfqaYncDzylEATUMo3EUnhUyAJFzp31aCEHQUftunLOsUzPNbiMGX4npUgGJLjr/DLH
         RQjYgkN7OCU8mxel2rNVXRWTHCw6sAj3/HowVFQ/pHMy+PKoQFJms0UNjZlkNWBHNq1Y
         VrK5w/o8kpXeub/5/EpPjIEvsR7bc4ttvJ4w5HvxtLABDa3T5Fp0tTM9E+Ul+/3YNNgE
         rxTgohzfWIs5K7mDvHO3bxSuC1btGtCwRVCSOjYmUV591laeqY2M71Yc1k0ShIE+f8hg
         lTjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791438189; x=1792042989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFQVP3Icf9nV+7X1cbKmKKwaGAM1phqqNnkrhrVM1G0=;
        b=aNMSaC+uO68npw7cj4BtbssEo9lXieW4+XhkHExJfmh729+078KVeZy3FrPhV7B8MH
         tNnYFUekvMltLyYehfh/szzDcnc9DmqWlZfYxB19iEfv/BmVeB+zFmI1mXow2emoPYJv
         uAm5IPAb0dwErT6ogt8IRxNTx9ghQr/+htAqKN1pDea3B0IStx93pIND30J1sTfkDS3n
         1E+Y4Zunb8ZtVK+NuEOEVdB1Xr/btA98vktwpjt8t+jCTZXHRjbW8iE/bHDq50b9YIzt
         6P51VvWKNyrVmVNXH7tQ9yNPItMSKlA+17gWSv3jT1PvQf9Fb6AawDTjpJBe3R+hf39O
         nbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438189; x=1792042989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFQVP3Icf9nV+7X1cbKmKKwaGAM1phqqNnkrhrVM1G0=;
        b=R/7hEyL2g+1XhgdULo5MOYhOVewy3DUQa8wWwOuDWmY4y15VHCc8Jlv/ie2+AwGuLB
         EnmCtVxtbVu3hS3qY9aM0A6SDVHvmfOr3nZxpAH5zK/bJspq8eQQ/EbGU0HFYgJESFZE
         B4b/tJRwMSJztvPtQRp58aAkbKUO6RQoAWDAEojqOqzoOaYVHGC30oAxICyEWsx+sPU5
         oYXG1hs8nbeJjOG2AucYCsrxcIxB2V0Wtaa4ZJu3DA8lobflvRkVoF5sLiVzq6r2WONB
         R+nhVQP/2HCHI3TTiTdscu+2bhh8M6Y6uH92PlIP0ggzF/i5b21T5BZrus4IzFKN+t2M
         FMaA==
X-Forwarded-Encrypted: i=1; AKwUvBwAZxG0SbihEf9MX1qn2S2Ac2q9rQArYl4xmULUmKyRXEq2e3v3FS4Wd1crrUCOOYGC7fluE2SGEpDhfSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAi9hXPpGT2640MZQCB4BFVKtDJgsmCzxfUfCnnhCZfb14grxc
	9GMvhPovz9cu7uXulWuH3miadptR50kCTJuZhktHkpdXauzjTdDYE9W+GKHRE9V9ENhpC/0y9Us
	0NRLRG8moyj8Jky7P+L0xw5xSql71hV4k6RtgKjFxxw==
X-Gm-Gg: AYBFou0efAw+GgWzhq0Bsf0ib+i2UlEas7OlOdXt9HpQaicuV0qN9E/5djZqz9BKg73
	C+EuHeevfRysReBbl3QUDBzsEl3lBFTs6qnmUsBMvA1O38ZgUP4ZYYOQONqwMwTZ7Gmem8QT+fO
	Rg59B7WdFIJ1ntvPHrANbGuQO4/Vaz5U1n2sJaicaD9rr8D8s9YFMBqfu2t5CituRAZ0+vSHZBG
	R2bi+Kb70fTvQGBckE9Y7j7HrCS8s5vBKBuhlgpZVQl0tiupcUQvEUBXC9EOIkJX/McNORrz5zC
	dB905RGOaXecH9ea0jCSYhNy+qReP9gdsdjQyidMeF/UC/pgDDyC42nYaw==
X-Received: by 2002:a05:6402:3202:b0:6a7:ee54:f897 with SMTP id
 4fb4d7f45d1cf-6aff294e101mr4619974a12.27.1791438189378; Wed, 07 Oct 2026
 22:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007155748.291814-1-samuel.holland@sifive.com>
In-Reply-To: <20261007155748.291814-1-samuel.holland@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 8 Oct 2026 13:42:58 +0800
X-Gm-Features: AclHuK8I8WkGAy6FEtsbDPDqp3rqkxyTvnVbvD8DrWWrlvwiZCF72K8omXYE7co
Message-ID: <CANXhq0qVzjx+WOZNZYTt-X=aEut4b1c6Yp9S0rQXN8+z1hrZVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: cfi: Bounds check restore token before swap
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 11:57=E2=80=AFPM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Currently the user-provided shadow stack restore token is not checked
> before being used as the address in ssamoswap.d. While an invalid
> restore token will be caught and raise SIGSEGV, this happens after
> writing 4 bytes of zeroes anywhere in the address space. Check that the
> restore token is at least a valid user address before the swap to ensure
> we do not scribble over kernel memory.
>
> Fixes: 66c9c713de59 ("riscv/signal: save and restore the shadow stack on =
a signal")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  arch/riscv/kernel/usercfi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index dec0ba5eff5ea..23c4d6d9d8cbc 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -206,10 +206,13 @@ int save_user_shstk(struct task_struct *tsk, unsign=
ed long *saved_shstk_ptr)
>   */
>  int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
>  {
> +       unsigned long __user *token_ptr =3D (unsigned long __user *)shstk=
_ptr;
>         unsigned long token =3D 0;
>
> -       token =3D amo_user_shstk((unsigned long __user *)shstk_ptr, 0);
> +       if (!access_ok(token_ptr, sizeof(token)))
> +               return -EFAULT;
>
> +       token =3D amo_user_shstk(token_ptr, 0);
>         if (token =3D=3D -1)
>                 return -EFAULT;
>

LGTM.

Reviewed-by: Zong Li <zong.li@sifive.com>

> --
> 2.52.0
>
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> branch: up/cfi-fixes
