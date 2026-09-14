Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B5377EAF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362860; cv=pass; b=p/UKfUIeFe0ae2y4vxXru5CiOLKDrLkSUv2RsFu9wRKDUcBzm76TSSQipO08070wRcbrm5276WhOZkNFi7Mn4dm/wr+egU1HwqgNB6NkEQnBF7iwNyEth9rIVvQZlkFa/8x+OJSjqDmxv2QyoFbqbjos0hC0UCNkBIcBEcdL7Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362860; c=relaxed/simple;
	bh=txys08ETjEf856Lf5y0MJ/SEqvDMNnRTDlYpklG067o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VK7eMIYoGJH6yIh/7dhl21+JemidcGzRKzyHWHmLf7iV6vjydBiuJtlAnda7TRqmoPTby9jjY4tbctSUqNeMAG7rYY/7a990lN4wpBOhisY7u7BgLP38fuHQpQQUUYuE5CT3xm/hampnThEv588duQfaMrIyL+UAd5wle2k/BOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=Aj2lb8zs; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="Aj2lb8zs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23429485e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362855; cv=none;
        d=google.com; s=arc-20260327;
        b=aH0OS0q0Z4TMx+F2dw79sTftakqt1djrUC0IYJrXddJE/UgM2v1c1D/1pqB86Fsxwn
         tDRvLiJcbQVB5w+Q279v6zvlW3ONjJIVrR34m28ESMLj/bvr9UrGEfc0uMJj2lPjxKp3
         2lSX1/MEx6D9NIGG/yeFeygXNh7gVYBZPvN7/b4l5c8nE0QLfUIxVEcozB9TlO9+zyCh
         QhP0BnnjqXrDWAKPw+GL+/E/FIZH0kyPvrSOWUyJ5YeKn6V0AkW3g00pNorWx3GhOqRn
         7YRHAAnZ6lq0jTnY8rdwDKq6UIJ64dZabT5XM3DiMB1qYbi3nAO0mOGdPBWtrOkOx/jC
         TvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        fh=SuilBhy4v8ASXWXKcciYIsAFEKqIisstDAcNYEkifXY=;
        b=mdF345SGtmr+F7VRIOp7HxJjFFK1347H+ittBxWLKitYgseNaqFgonFch8vAAwoBl8
         ycvJ1hkBlBM94beGcpgOxPUI7B6ZSLx4nzq/0Y+OsHcCaPv7LsPMTXucbQd7jQmy43qM
         YVctQG+5kyIeAG1AED+gKz/cwuPDhf8xkD1rVPzTVT4nL35o685Bk21lwmCazybDMwNO
         RoUQjb2Np/aWr54mMnv7WmsL93xkp3uqr0X2HI1k+1/GvC074wTnx/kxQUdpmmQ2Cm6v
         QXY9KSNFkS9L+uosArlHGUJ6DLbgNrytT+EmOB8/5HjWP9X3cv6orYfxaEG9aYpvPZef
         K/wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362855; x=1789967655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        b=Aj2lb8zsdf0cKJmeb9ML8/3uaFZZ4C4nhc9SHY7Dj7yGCkAOVVWFnAEvxzLFB3Iolr
         yHEK6u06hqAuiwsfoEuY4ESPeNCNnzalH6jp372nEJppgpcKfEI3vqRpeEqGovkQJ4oj
         8ijz2GRWLdHptVVpzKKIuShSOEzafS2oSJ0TiXClHCvOp7YpNvMVFKrx3YBJuQ1tZYFl
         D4MMbyFqVYDQpiSgEN5XOrDEU6uHUegvRsVyo8r/lkebdOLxqSCn3hgNT+fM+3yWGxT9
         854Cps9XIpLDpZ6+ByZWF6zK3FvBb29Zw7ju73cfOtmWjNbPRAmQzQbjfJbqrgbsyf8X
         doRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362855; x=1789967655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        b=c5gA419rLUbH2q6Y4pZFu5ra0jjeOksBe4GEnazTUh0XM/aw0NFm4lQ1cogkXWLZdx
         qbUMVk0TNTa1Gu8+tP74tp4aEFSmRwEvv0QDNz/li2V9pC5HDxhV1HjPznLF7T6HJmLV
         D0MOOBaPCgQTZrnDD/g2fsqgz7BliBuKAi7MgVxONCMLopDrq5HMP4jCB6wp4grhUHYl
         GbcWZD26wsrvGX4XmIpFNAFb5OEeBJ7aWNlQaBGG10xrnIMb6N9d219U5bIY37/8gi8E
         wLufnqExVr3XBtDke0EMSGNbouTZlvmCyG+g0rw5vKYsIkddFgH+tfEWy1w+2O0ZUO5v
         65sg==
X-Forwarded-Encrypted: i=1; AKwUvBxcCrrZ7ZjqFEGplNt55WneYxs8em5zN3HAt8S4T5YagD8wro0ZgAUnZLk1pLB36XJkFkgZUDjdoV96cjE=@vger.kernel.org
X-Gm-Message-State: AFuF++kpZX6bFCfp4PLSv/6jLM+UM0t/b94ncXTgR2Vrn3VuHzh8tz0h
	x9CcQXe50Aw2Bjwsrv0C5vzwJYtOwcFjnm/rQzNU8lAJXi6YV5nkcDaNNfdbmkW7CEH74Tm60TN
	ItvtQ5RlM/E4YDZkesRs86+UJckyjmrRZqI7mNqsurQ==
X-Gm-Gg: AYBFou3b0B8/cq+hgEDiPfcL/YXq+Hrw6BI0kTpHK+v7aIMSqHSMO5KdairHvjGCb2v
	JGZBtzxrY/UKVYB4FpRns1185dJYYW6ydU2AOVUsGSufFHUsEGC0oxnzH6hUnP/gO0HWzzwpGq0
	jUV3fNvnbWlfd58k//XSKfaTvrBhhxe2eJdO9xlT1HKlonyNTT5PVyj1+9PZdiOQK+A+zJ39DmZ
	HaxkhV9s/vImUxnk02lySk7Qa5TsJ0RRfCzHrBXYmYfoWtXhljdTXIzmSVsjMQFQ7/YhlfndlND
	sMSAe6Vuj5H+V6uv9UFJrB+t/MNd6pl08mh5QQ793b3DlWjw/kmibD0A06xvtKeLtJHeZQpKdgT
	l1P6sSsWRY/ix8em0G8lka0c0uzRSFt10t4xAIBcppYkt3yMK2ouxJQWkOk39QxcuKRW/VYvQIg
	==
X-Received: by 2002:a05:600c:19c9:b0:49e:6e7c:d895 with SMTP id
 5b1f17b1804b1-49e7a678d7dmr8979885e9.26.1789362855198; Sun, 13 Sep 2026
 22:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914031146.446157-1-tanchi25@mails.ucas.ac.cn>
In-Reply-To: <20260914031146.446157-1-tanchi25@mails.ucas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:44:04 +0530
X-Gm-Features: AcwNN1Xv9Q24Kz2JNPc5ElbJduPG-W_3pjLhuvmorF4ZD7AGszu1UnXv2VgFblg
Message-ID: <CAAhSdy3m8iBXiJF_=syKKm-JYpW3ou8P4FpWNB0_a-t+_dTuAg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix HSM hart status error propagation
To: Tan Chi <tanchi25@mails.ucas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 8:42=E2=80=AFAM Tan Chi <tanchi25@mails.ucas.ac.cn>=
 wrote:
>
> kvm_sbi_hsm_vcpu_get_status() returns SBI_ERR_INVALID_PARAM when
> the requested hart does not exist. However, the HART_STATUS case
> returns from the SBI handler without storing this error in
> retdata->err_val.
>
> As a result, a guest querying the status of a non-existent hart
> observes SBI_SUCCESS instead of SBI_ERR_INVALID_PARAM.
>
> Use the common SBI error handling path for HART_STATUS after
> saving a valid hart state in retdata->out_val. This preserves
> the returned error when kvm_sbi_hsm_vcpu_get_status() fails.
>
> Fixes: bae0dfd74e01 ("RISC-V: KVM: Modify SBI extension handler to return=
 SBI error code")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>

Good catch.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as fix for Linux-7.3-rcX

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.=
c
> index f26207f84bab..06a15629c26b 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -95,9 +95,9 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcp=
u, struct kvm_run *run,
>                 ret =3D kvm_sbi_hsm_vcpu_get_status(vcpu);
>                 if (ret >=3D 0) {
>                         retdata->out_val =3D ret;
> -                       retdata->err_val =3D 0;
> +                       ret =3D 0;
>                 }
> -               return 0;
> +               break;
>         case SBI_EXT_HSM_HART_SUSPEND:
>                 switch (lower_32_bits(cp->a0)) {
>                 case SBI_HSM_SUSPEND_RET_DEFAULT:
>
> base-commit: df2908090cda368b01ff43709f51890076c56157
> --
> 2.53.0
>
