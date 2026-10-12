Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6362E7384
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768600; cv=pass; b=V1yn0zJUMFazhjWLAe2xpDykGLdcxbn8pmvVvclB0j9NdGfQCVComzUQjVFVRx4GPb9fdTxVeewMvBqsFQTurBy3LfbchJHESEaznLKicj6gth0t8SzZ5bEHM1jMibQSo3y1CN3yWUBevd4PoNdb7eYTMUjuRst2pB3Rj1wGhKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768600; c=relaxed/simple;
	bh=2mWlT12ok9+wAfwHwPbwd2teXfdSfdOZv+hot1KNv2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXhRV3URP5zL1dqa5Pl3XkXlcC54SW3cqlMPIqZs148oITHUtV00w+JrNCLzWsumdTIM0FVeff9MyzfV8Q79TIRoXixGof+f2sYSCFCjA2aIyvZqikCatD1Es3l7gMrWA6p3sOKJlkPFysOJ3p+Ok54xvlESFC1MkCnXuBCfrR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6AgjTeB; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6AgjTeB"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48e9476e26aso270759fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768598; cv=none;
        d=google.com; s=arc-20260327;
        b=rbVwUooK9VjSdYi5v69s+CQLNmKU7acUV/mfXF6siZpwoFG0xWlXD18BOPTye+MtfI
         HyDKXyOg4UxECqnQmHxwSZEg6r89gvDgPrXkBPoTBKqLcJIVLKQz5CWTsHtpEGpgPybo
         lfYlzhkVDCejUgJ+k58pMVMLqLHgjieX9U2/aOXjwveXIt0+2Ow4kZzpnmjwvOl8JV11
         CgSTdKU/4PX+Rosa4x5JD2e+vq/F2uag184yxwPxkLEUpn5I0aQ42wDz8zSfczvKcG45
         TCCNl5gowYUHIGgTSDSmMuIkkz3WlWxNlHPjB4P8nm+dzWMxdD3ZFPM9txT7SsDyphrl
         I8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        fh=YJQGjoIFz7vRuJncuxWnHFz+pfytez2AU8KnsFgfZ2c=;
        b=En/2ct/NL+EbvTHv9YGLN4hsxtfiSHWOjOkzYMz3f81CJahUnRMSOYakj5geC6EzQq
         5vnxrQi8B9hB1dm9gBwGvl+aWacB2+3Omac7u3yDknPEiCXT8CO64F+sopMLoJ4S5qYF
         83+ebIN6WkN+1RWrKC6p3nMJBxqcPOl0qfOMtA7GOs9F3wh7MCLj8RXTZudcfsJ54G5L
         OmLQ76yNCrJWiIMwVqub2jBSH+RMjZ9Gm7nUudY5u1GxBqEPq4MLZOKGCFFyzoXifSgY
         HSUk3nQP+9NHNZz4vnwIpTf7OmW4tzxWIWNGUdy4kC3z8VFpoKKTeDSXH5Ra/oCuA5JY
         XccA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768598; x=1792373398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        b=n6AgjTeBueWCNPHkhsQxJ7EgZiKZym27w3hIAhU+t9kZpCZcFYZz8fdjLmBHfj1zov
         YtlaRX94hepxu0DznLwbB5/QNYOB54xYY9oBAatrSgmMw5jiHd0gPZj+eRFBvU3MczWv
         8HY2cHUctM84Bnacc2Om6rsbbw7/Ggb9kSqhwbr2cEunLiyZ+w3Gb/zr+bSBoAonzecb
         sB3EhzTt/i3hwCd+CxJ1fxkieFfsfu39nkHiHieY39l+XPTyZ/7cjEP8EyKkaQujy3uW
         f+KLBVXk5QouBUxakx3bRXbCW+XW/wf9WBuXHQ/Rsv8y+TkRsRbQmHpZCmuiXvC9csMS
         K7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768598; x=1792373398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        b=uZWCqWn3ugm5CsBhHav28wmNwOLaS8oesXhNLS4/jLjC9Kx7QydOCd4N5g7gL4JtPg
         oeIjmMWqPx54L6wQjOjOuTS+51xuUa4xVG5HMhyH4hcrwVruS8L38uNhif3Kot1z3OB8
         BKIsxMskXymKa/kjJgP65N4uVbGs5x7g9AAYVVvbJAtlAePJCt1UAEXMNwTmeAQMPjaq
         CIHC8DiJa0o6sMCrRgOvKmoyXoMCZ7KAJO3tGsyGS7urYLH8dJTXRsLQPo+SURA2l7vt
         3/EGY1GN94H3amrOJukTX0vQqIUyOZTxz84of607MHRkIT2A2StUNrr8VGgzlmjN81Zh
         zwFw==
X-Forwarded-Encrypted: i=1; AKwUvBwmiof+9fyAA8XpUJPOrbMOVsU4PylL6nI3am2Pz/ezXcdP/5NaPTPthNtoSnZPa4pqJn4ImRYChFRraUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuwXohXerMmmqaMUqQMEVSW/LicvDD3BCYzd7srcSz4eoGXdth
	fxXSc4ne54HaqcqYT9gg4bz0JxJOj/ULSxy0N3ocR8GORxtRXtmALr4Xh+A6V9j+zmbjc9yKKdS
	IiV9s4+BZUVJKZC680/Sx65vL08fKNI8=
X-Gm-Gg: AYBFou1+flVA+FrtPSsZ9vWdRwZxFZgojeJCGrc/7bBh+aYS3LJm0m6SaVM4g4pXYMO
	mpBsdI2G7Rvq53AVH37mto56MWFKWg16yqJuwCsXyqQS/r2WsH61EGFWtId6dI7SFsyfEt7PBuy
	yaCbOuh5Gnwvkxhlw4GaCrsdtBkyMblkFan5nzr+YmhQaph+Wy9ejAPE9g27tguhXQohDoh+pnw
	nSrALWbrZCDFMNEbqlBVcXle4k3ET7QaxZlnUYKTlL1y7RsxBl17yO55Qy7adQRadt5gW9r3AeY
	EJiF01mYSsT2yNfqiu+PVQ4D8vdZLPPmaH4S4vCwi90FB7Fo9dnp/cM=
X-Received: by 2002:a05:6871:e0f5:b0:493:186e:c57 with SMTP id
 586e51a60fabf-4a2a850b384mr6586764fac.2.1791768598035; Sun, 11 Oct 2026
 18:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
In-Reply-To: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:29:45 -0500
X-Gm-Features: AclHuK_lsvSSZO0Bi2pRxQKVVy1uDraC5Xay_eyyK_NjHGjAgdxwlmWlZz1xVDU
Message-ID: <CABb+yY3RMpzBjuwKR3GKyw3h7M9aZkoYTRf5ZH44ewtTWVHo-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] mailbox: axiado: fix RX handling and debugfs name
 truncation warning
To: Swark Yang <syang@axiado.com>
Cc: Krishnakumar Kesavan <kkesavan@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 2:17=E2=80=AFAM Swark Yang <syang@axiado.com> wrote:
>
> This series fixes two independent issues in the Axiado AX3005 mailbox
> driver introduced by commit 14af7a96afa3 ("mailbox: add Axiado AX3005
> mailbox driver"):
>
> Patch 1 fixes two RX-path correctness issues found during bring-up.
> The threaded IRQ handler previously consumed only one frame per
> invocation even when additional frames were already queued, and the
> RX polling logic could mistake a FIFO error for completion of an
> incomplete frame. It also corrects IRQ handled accounting and uses a
> stream accessor for the RX FIFO payload.
>
> Patch 2 fixes a -Wformat-truncation warning reported by the kernel
> test robot for the debugfs entry-name buffer.
>
> The two patches are independent and can be applied/reviewed
> separately.
>
> Testing:
>
> Both patches build cleanly with the aarch64 cross-compiler and pass
> checkpatch.pl. The originally reported -Wformat-truncation warning is
> no longer present.
>
> As a runtime regression check, Patch 2 was also verified on AX3005
> hardware, where the debugfs directory correctly exposes chan0-errors
> through chan15-errors.
>
> Patch 1 was regression-tested with live mailbox traffic on AX3005
> using a development kernel carrying the platform devicetree support.
>
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
> Swark Yang (2):
>       mailbox: axiado: fix RX frame draining and error handling
>       mailbox: axiado: fix debugfs name truncation warning
>
>  drivers/mailbox/axiado-mailbox.c | 116 ++++++++++++++++++++++++++++++---=
------
>  1 file changed, 90 insertions(+), 26 deletions(-)
> ---
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> change-id: 20260830-axiado-mailbox-fixes-v1-42b9f4ef43b5
>
> Best regards,
> --
> Swark Yang <syang@axiado.com>
>
Applied to mailbox/for-next

Thanks
Jassi
