Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398DB47206A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530007; cv=pass; b=Jt7Iazf3EZDuO1UZewAYhXIZjvn+CT0bskPHnE6kQZ2wcD9Ai++ljrkLdSB5ZF7Kapj8bmL6yOrfGhxUw3thRkYXzxGw+WZwslSxB8fusOVAqHdoMFIAHfdxUvbYpxUbH54/igthMa7L/O7xNNw1g7t2+6fnYZGdBuYYWhLkCSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530007; c=relaxed/simple;
	bh=X2tEu7Vm0AGFY+GIeFfNLNigE2xOwMdjkbBHch3HA7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1WzR+JHH4ZNLfOab1bxJiPTKjH63SLaKqDp9jpwNb5qA/fyWol3t69zjZgFXvvjkk6vQcVmnLHBzEBpm+kAQpuF7cwQCBj/vTvJLv8xeJYdjSBUBGu4Oqh7JFzsWUFiqDn8STo3a2Bulza00E8TDBDJlTmUy3Bg0MSmllZ0WnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YDOYXdtg; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YDOYXdtg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so8628861a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791530004; cv=none;
        d=google.com; s=arc-20260327;
        b=oo8opiYuEjVZmdnt0Ok0JnpwIRN/mXnNyZq2GezjZnYHZVsNr2b2LTJRKHwBSHjbhj
         kh9ro3tIffJdWQPRq64AUQJtXk7MmrJJ/gsu25MXeP7etmdJ3ADNtNxSA0x14R3STCom
         sOzFiWsUeP0fHy4p78d6VgPAxakgElPOipVJ7VMRf6GpVbn0OWmOoQpi+HLbTelh9x2w
         SSvxqy8SAXwmH5fS1nETSy+W5+roiuuVtve42DOLRbush9s9aGn7ZUAmXoydF4q5ueh8
         SrJbbzlzCxGonlJgJoe52/RbSG3zyNCmJ+x7mPRCm5wG2hg/5v1I6o/+gZ5FoOFn1Nb3
         zI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=;
        fh=JlMVYnfGoQUAu71SMM+08BehhKulBDmgHBx8FX4Ksq0=;
        b=o/eQDjgSo+KzvsCBdhanv1/Jut0O4p3gKr85wjJhcwhwSbBnDklM2qULniPrA8myZ4
         h3D95pWipOnJJKos1IO+F9VHSuvOjCsMV5RPdQl8EJN43QO+l4BBt4A6vnJ68Zf6gu33
         EGial9PDCfvg1wDWMH8wy/cg/09jc+C4PPZyTv5iadsuYLGfMq36wmQwIxuNir7jZk0V
         6I59KdsNcgu8talZ4vR8PlTStqgG6tMYwuPhzGiItx6OZ8y+Z9gbOe/QiYxURT51kKHQ
         aOqpO0HxooPO76EF7uPrBdkYxCXzmLRAc21FwX6szIdohP+3z59H7soZZ02/v6kMt8Py
         8F3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791530004; x=1792134804; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=;
        b=YDOYXdtg+41AUosqZZkVbAevjftQQPa3rd+5zZR/h7CTtHHxE7TqKweWU/DnY20pAM
         WrKneSOKBKXl+9ubsKp81IeXwuimYRhW8xOVOygwr7xXzUWnW+CkacX3XGY2zIwsyZoc
         q/VR6cCgKlEYW02CVBjJO2AxiLwHg9NQt62JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530004; x=1792134804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=;
        b=hQL/KXZ7N21y0jbOSvP3RFPvsk2+7HpOKyKUMlXdW2cAcvuEj0g+u5ErwxyytDf0uv
         H12pt/vUZnA4pnzy+I/Vw5wufusrWWwA79dbgGp9Ow1LluXfZjwGNRzeC73fszBBWJO+
         AQcsSZyZhfhSbKNua3Zg0dJQN2LyEroe6LzZBtPTzZQk6/pjoY9SO/rp9fkmETfNjGwr
         nigeCG6M9tzCtlxastkNzX9zZjbpxDKfvbKR5l0m82+K1Rh9ywaMnc+FlV86PT24Fg0g
         H1+F+HYlgSe1dnz9BuZ1A4nFlu2nGx7FoG/yTO6OlMBwaGuwcNr3N7DZeBLGhcADeVtJ
         Tziw==
X-Forwarded-Encrypted: i=1; AKwUvBx9h8lMWL6Zx6l7+U5Xsha03PPpnxpe538S5qsv4e6Ub0AsD7prxMcxcIAPnaJt8+Ys40gfYqMHawxKr2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzeXAR/WsEie5xBRzH/iYSSru+U3SyfjnWog8Jh7OkZdu4k/yY
	6UoOfOdUkEVJDYVXph1TnLUwCTDAC2g90pI8MklbAceL1mo/LDHB4GD6kUCuSADlZj0lkSCjVPF
	Gf6v3YaDsEPg+oBCQ0W9OVPbyXS5UlMNNEwRkiOoiUKP/sivfdSEbsCfIIug=
X-Gm-Gg: AYBFou2X0mkFc4Or9OJSPI4d0o2eBkgdIyzWgXJJ0PqIPY9g6nLEgqRK7xR0OhrzlQZ
	SitNDmz06ilLU/OJ7gl9GY1y4K4523faQyxVgS4/m4jEa9eidYrAveDGuuD25M9UOZbikRfLjDY
	VAzYX96FhMwh7+oWeqoEGmOuIO1Rr0nsWkBmsXweeM5pEIrR82uN6u1wUfMeysm2Us2p5UF+Ks8
	f9Xgc8e3dXnJjBFS34ZvbwPixi4TV26+PUkyZSpI5aHpW6Sha0o8HNpTDtjxAndqm0kbsgn7XSh
	EEQXt2Wh3eieLvwIU6dy6s8tukruXRSBWOA7KcE3nn10EXLgPaMCBUA=
X-Received: by 2002:a05:6402:46d9:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6b17c276146mr572039a12.31.1791530003510; Fri, 09 Oct 2026
 00:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
In-Reply-To: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 9 Oct 2026 08:13:11 +0100
X-Gm-Features: AclHuK97DD2slZ-807kznn7SMmv5V6q7RzL29UzjsjXS6Bj9SaUc0QJ5rsx_GSA
Message-ID: <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
To: Ting-Han Hou <ue081723@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 16:19, Ting-Han Hou <ue081723@gmail.com> wrote:
>
> With CHECK_DTBS enabled, Kbuild appends a schema validation command to
> the fdtoverlay command saved in a composite DTB's .cmd file. When DTB
> decomposition is requested, process_dtb() treats every word after -i as
> an input file, including the semicolon and the validator arguments.
> FIT generation then fails with FileNotFoundError while opening or
> checking the size of those words as files.
>
> Limit the input list to the fdtoverlay command before extracting its
> arguments. This preserves the base DTB and overlay order and ignores
> the subsequent schema validation command.
>
> Fixes: 17c31aded9a1 ("scripts/make_fit: Support decomposing DTBs")
> Assisted-by: LLM
> Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
> ---
> Reproduced with DTBs and saved commands generated by the current Kbuild
> rules. Verified uncompressed and gzip FIT payloads, shared-base reuse,
> and the non-decomposed mode. The schema checker was a success-only
> stub; no hardware boot tests were run.
>
>  scripts/make_fit.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 15ba269..9bd35aa 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -292,7 +292,8 @@ def process_dtb(fname, args):
>
>          if 'scripts/dtc/fdtoverlay' in cmd:
>              # This depends on the structure of the composite DTB command
> -            files = cmd.split()
> +            # Ignore any subsequent commands, such as schema validation
> +            files = cmd.split(';', 1)[0].split()
>              files = files[files.index('-i') + 1:]
>          else:
>              files = [fname]
>
> base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
> --
> 2.52.0.windows.1
