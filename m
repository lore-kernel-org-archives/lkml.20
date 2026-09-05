Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9883BCD15
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620801; cv=none; b=d4l/jgdV9S7k28fII4SBNuGzhIx2wmB8vLz0ILw65kD0ewM7PQphPfW2NS6vwi0/QFbbIcmHiq/NY/iKhrbRUmarDS98o6tfqHuBQ08vOdCUhwg35orZqUpZM+7z7FB1jx/wPB9Dm9kHqldygtXvCDicaqhuNbpC/8nTu3paMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620801; c=relaxed/simple;
	bh=hXINgzBTHyvUTA5Y9ccisxYS6W2cQ8xWp0qIxBb66nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cz+UwRQOTGxk/T0BUSzZj5bP7JVSiewHjV3hXw+pmKVsQdKc011fF+a64tWY4Le4qd2iImMvIRyh/RKVInIRTNcLTOejH4ZLWG9q6NkA1wJwH3gEaV/DdqXDYFGLemwkkITk248a/Que/hahq+HfGh6Nn5PdeqIjvT156ZtPkO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arSFuFwg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arSFuFwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C6C1F00A3E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788620800;
	bh=lDGsIluFgVSmvTII8ADDyuGdCHsaszYABajfQunqWW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=arSFuFwgRUZnv7LD2n5PcnbUM/ZO3YBtLctILt9mzDm57+cE/BD5ZCqI2qY3NlCZk
	 kRV7efLEB9HpkYA8WLF9pFyL42fJWzZ9uFoD2+y3OD2/3uaVUEco8v4sHgC0zCd8yJ
	 2Q31RplDehicDroa7GhyuTl/LB7g/FYpq6ef25UGgn67o+UqCVFfL1weEDXR+na9ud
	 jQDpw8KDyr/ldF7fn2wDeoVOJncQ0O1vCZcLPeyCUfZrCf/MEBXrtwIHVoZxO13K6W
	 6E0xuCwTO1uBfwlSqUtVpSTrkdFX+3NyF5INHVNus9QLvHL0HGeNkRdidfqGS5lisZ
	 wmWJYUtAOvMBA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso2520550a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByr85UIje32WNbQgXcetNA/1gw/4CdLkNWOssfG2fnx2Ry9MT5hPlw1DQDe2AU0IvtakTSOvIcQJchgnl4=@vger.kernel.org
X-Gm-Message-State: AFuF++kiRJj2pONr1vE4q7IsrroYxLGUZ4aF9FcadKQSHR1IIOcTeDsF
	yERL01+5z1/MvvRcI+YpcSA+aB+XOF+WiYN3wG0+uHsK/qGX7MtggFcqlxmAiDh3l51G67iT73t
	AUkv58ScLaTV0eVDG6zpu3HceIp29eYo=
X-Received: by 2002:a05:6402:a0db:b0:6a5:ed9e:b490 with SMTP id
 4fb4d7f45d1cf-6a7e8d94c7fmr4536791a12.14.1788620799387; Sat, 05 Sep 2026
 08:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817123918.2738447-1-nagachaithanya9911@gmail.com>
In-Reply-To: <20260817123918.2738447-1-nagachaithanya9911@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 23:06:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7kgQngGAqJm1DOe6p7aFvZMmac-Xao8+aF8_d4C=cHVQ@mail.gmail.com>
X-Gm-Features: AcwNN1U2JKNv-2kdY_yNpnc8sO-A7vh8ZHK951DGRlsgeKWhqOk3pz5pUnrHdDs
Message-ID: <CAAhV-H7kgQngGAqJm1DOe6p7aFvZMmac-Xao8+aF8_d4C=cHVQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Free init resources if kvm_init() fails
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, kernel@xen0n.name, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Mon, Aug 17, 2026 at 8:39=E2=80=AFPM Chaithanya Lagisetty
<nagachaithanya9911@gmail.com> wrote:
>
> kvm_loongarch_init() calls kvm_loongarch_env_init() to allocate the
> per-CPU kvm_context (vmcs) and kvm_loongarch_ops and to register the
> perf callbacks, and then calls kvm_init(). If kvm_init() fails its
> result is returned directly, but since module_init() does not run
> module_exit() on failure, kvm_loongarch_env_exit() is never called and
> those resources are leaked.
>
> Call kvm_loongarch_env_exit() when kvm_init() fails, matching the
> teardown-on-failure pattern used by riscv_kvm_init().
>
> Fixes: 2bd6ac687261 ("LoongArch: KVM: Implement kvm module related interf=
ace")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
>  arch/loongarch/kvm/main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index 3e1005526f4b..b6ddf5827c03 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -428,7 +428,11 @@ static int kvm_loongarch_init(void)
>         if (r)
>                 return r;
>
> -       return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +       r =3D kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +       if (r)
> +               kvm_loongarch_env_exit();
> +
> +       return r;
>  }
>
>  static void kvm_loongarch_exit(void)
> --
> 2.43.0
>
