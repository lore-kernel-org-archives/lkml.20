Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA748311977
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413658; cv=pass; b=d8vjPw3yTaC5yDUzRscl9FYosOhjNGIUPx8wFAV+X+5PDqZgsZwkC3A9+3Fqv3kN0pjf91INZh5gMzz4w460eTpFp+39hLzJyN3WaDYF4s3pY51pisHLnZ8iCQ9uZqFlMMsizTgIfeCLZYD4hiG4Ezip20O052yDg5eKlQ/vCRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413658; c=relaxed/simple;
	bh=F8UQAaBlqFnPI7rRgzwKKAVEZwJyQUhTyNGcbDOngr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEqGU56FJS9mosFoDBjkwyTdGZczHnFVtTjDgkS7cqFBjloyZ69xTrqpUE1jfTF+OtX4hPKeW2NG5akmbGzyoJ/fY68d+7vFWQCHuWpnRYJAkfI1SvRon2sVj5hcuoMPXCRp3sR9+Y0vpZvtu77vSGOEpSkoMqmp+GYC8e8798k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quilRdce; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quilRdce"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso3096083a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788413655; cv=none;
        d=google.com; s=arc-20260327;
        b=LPm2VbGSYt09NaLdK25H9nBB38iU3nZsmsVeYjIjS4iyuUjU3nT7VyQo66VclWpzld
         2gcqrAn4oJTpy58OkHX4XcImqEJ1xMwYXnJ/35SQZaWmASBC7fimCVh/0y0tEX+HRJcW
         uFTXYjDrEQdMVmghy9HC7UDzZjCMkW5VEVWh3VMUzJibDlckzzH+6ERPKYORjcd1QQkn
         tl+wTygYyZtyVfOnBazwAKtVVqzhr99bBADRQdiIB6kpcvPyThqysJ14W9lwVA44p9bc
         nT5pQkOjBbKE7KNXUphkMAwNJaekSrypZcOksT7D1AB4HBEFyF2488nv7xBcrNjnZR/D
         fP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQDht6d4W1Y1iAmYhRjK3jxJe9gEuYEJ4ZOP2eHF1KY=;
        fh=iAOUc2+gUfjQsilLhtvfkkUNS1RlXvlfxFuRXoJL4dc=;
        b=kpkywmXNqLRWex3dl8pYn65dTJA9rEG8mkhEvrOZTKyJPFGHjNeyjj5C15Iy7gL2eR
         TwNS+sF2SODKiygZ1dR8M5cDf+2ps7b09d2cu56wDoNQuPWBnlHXZwylvVUGXeUmfWOA
         03QcRdppZZ0qqHWOD6PUKct/Irn2SeTsCZI3q0DqDGH8VmKod7XL/DfIL1LCpJom0nkT
         6KVKB9q2wUcrS7H/dAKCujj7F2oMgwd2bUOXSYZOMUFCnxe9YM6vPVYz4tRHbCAaCLQS
         68bM08KPiV7XfuZ60w+UcIxHeA8u9C5Lzuz4F7yQHX/pr05JbdXx1FxMCbOOE7nHcgbL
         eYDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413655; x=1789018455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQDht6d4W1Y1iAmYhRjK3jxJe9gEuYEJ4ZOP2eHF1KY=;
        b=quilRdceto0+YiYJme7RkwDzcwr3vf9yH76ui+rF7gMIda+dKED6ugzgSnUXuOjcn3
         DMQmoijfMEpk3WzVs/ijbhPWQbxvvakJNV+pVXxCn5k22J7ZnfxtYT9mjQxARk9i8KPw
         XJMzvZ+UWnnrvHqIQqxRAJUPbb06liyYmjRk+obiLTF9m09u9qwjwJ1fV//3KV0Zv4kV
         udrbt3e6lO7xyBxHoK870dXOKVoTgBu6+xvSIp0q3UGKP8mxIxD/tRpNJtL4rtgczecI
         tF/kVJkow2t9Yuy5VSMsdHPcIzQyrzHZ3I6i/mggnPrSv0wKpwyLkCEjSaDK0D5aGJr8
         9xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413655; x=1789018455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQDht6d4W1Y1iAmYhRjK3jxJe9gEuYEJ4ZOP2eHF1KY=;
        b=XYprYjyrixaN0usl00FuAapk4Tlp9FIR5zgOqGSJtWPEYijqmiVDOK7AcoDWq/IfxT
         04p2Tm2hVH3AmmGdo7L/clgcP/RCmKlQRx1Xt0M1xwWlJB1OfdgNLD5xRV7zJRdiecmg
         LATtT2vBQcCZg060VOOCEmgWnQaRSmIhZUXHXlTCtSTsNjAPCNbNfC9GjBE6XAwPEUYy
         IXeTftyAElC6uG3dXvhQZ3T/iwgvEZUfG6CJ5cLoNVxLaViHhKIXLwhpCIyBmFIgbjWc
         x+issalUEjOxCuIKWtqHjUCNaBXWwlzPBm7TGCI/n/vL5/jmrd9hz1uLqESvZE7E9ARr
         92Ww==
X-Forwarded-Encrypted: i=1; AKwUvByzL6xJKqCJSVBtT+nsGIXrIwEmxdIZruTmLvzwViKSQu0DhLyFkSp/nNLhV/BGCygm/z697UIzxYK0ozA=@vger.kernel.org
X-Gm-Message-State: AFuF++lYAdZN2uvEBDVYoyG0ykW0vmLsCCzQTisx5EDP8sLRN03Besk/
	wvMs38HyJ6I8NbTj18syL/sfDGAnBNw2M/0QA0dhKyu09YuIlWX1XyQzyPCHQyOci3NISlRv6jd
	DjCt2ihspcvKo3/r0LdquNxvWsXSYaOY=
X-Gm-Gg: AYBFou1pJDbVXSpcuuxt1hDW3Ca6skr8xJfaFKxF6T6syYgejpbeqhZ6Hp3MFCLy+y8
	O12oV7CLvTimGjX0JE1SdIRRfU72GT1PX/FtXtuIBXh3Zu29jmKhej0w/dCsTSkZaAVHXWCOvgu
	0R2plnHgIQ4M/HwGfdH6JYhSfczUtFltQ7qpoOmUG6wxfkiLe5ky5du75Sxh4EYuYa8184pWzmW
	Fmqs9Qxcvaumg+Lp5uwBfcEtNB7xRHYeDh5FGP1Z0757xQKTwWYecd0C0+Tw9HkOMlF5Rotl9EA
	M60FD+szoUCxamHNNpDJzMvdqtEX5wmDQySPKBcdu4pbAeHuDnD6H6017VQ3/MlREBURAZxVtMJ
	9Cik9ZZ2zKKJFf1R49rL8zgFtnkipRqxmVxZPTaRg7yXsEPMtR1tD9w==
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr6097702a12.6.1788413654726; Wed, 02 Sep 2026
 22:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <56f601c91463c7ebaa3aa0d0a5f7aef0f876bd7b.1788277742.git.mattst88@gmail.com>
In-Reply-To: <56f601c91463c7ebaa3aa0d0a5f7aef0f876bd7b.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 3 Sep 2026 07:34:03 +0200
X-Gm-Features: AcwNN1U_EahTO_NN2lJQXULILj_80LIDmyuURS6Fs119god-n9oTvl2NrZdX6Yg
Message-ID: <CA+=Fv5TgxkNPy-i3U1CErTpY-5jHrZYQN9ptiFbEbS9jmec79g@mail.gmail.com>
Subject: Re: [PATCH 20/24] alpha: select ARCH_WANT_LD_ORPHAN_WARN
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> With .eh_frame and the relocation sections now placed explicitly, an
> Alpha kernel links with no orphan sections left, so ask the linker to
> warn if new ones appear.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Build tested this for Alpla, looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 4c60c442207c..827b224f2f8a 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -38,6 +38,7 @@ config ALPHA
>         select AUTO_IRQ_AFFINITY if SMP
>         select GENERIC_IRQ_SHOW
>         select ARCH_WANT_IPC_PARSE_VERSION
> +       select ARCH_WANT_LD_ORPHAN_WARN
>         select ARCH_HAVE_NMI_SAFE_CMPXCHG
>         select AUDIT_ARCH
>         select EDAC_SUPPORT
> --
> 2.54.0
>
