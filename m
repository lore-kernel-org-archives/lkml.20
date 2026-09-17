Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16943B71AE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686871; cv=pass; b=sEmhNSDBS8w+hXWvKciaKKxOP1eJX2B4IRLdfqBXLobNmhlO4NWfD9nCkCVBj2cDy714Gy3FABtnm2DnpFAktM0XXhVBdQj2Z3ZEr6IiZLzvvUH3BIbexZcoYjFyalbUEhrEvT558LQAbaP277eDPGH8l/pPosdtZVF/8TVpSHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686871; c=relaxed/simple;
	bh=UFVnKLmRNthZe/OMD8aBRH7cExiAA+7lFKrEVyJSMFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2bEN/ClMnREohYT8cX1w+LgHylBpetePDWNJ7kcgaTcobKxGvz24reqrqjBtZeSnVvtFlOTZ+rsUDktDGN0rbk65aRtNIuo0S1ru3jFpXWc7S599qbYxSEdo8tY+R0gccWYRzNEctC5WS8x4UVnlcTUUkTpphFAAb17haaHODw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pekX7eGd; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pekX7eGd"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso2202566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789686864; cv=none;
        d=google.com; s=arc-20260327;
        b=QvU/Kwj+pS/vomPtnKGVj/krUMryWd1L8RudR3G6AumGAsVBilPqOTar4S2Ne3IBJm
         TnJOBjjLhUvQLvCplAq3iqR78/U4gjPJvf7tEVSwcVONv75W+pQHy0PeKMnnZmYfNofB
         gpR/kdosr7b4rfDVUzqGf8dN/reiBuKXy4aAbC4FlHT34TknyxzKGr955Sv3q6HUPTmI
         /HqWP23a6m3O0krHdbb5lGQr1On2+oN3UJCmYwP3fYvIYOrzPgaA7hVxDwfIQ2lTj9wt
         BHSRM+sB5G03VAOqR2Ilg+kmANjp1FHEKWxnWpun+Lg+29p5VqniQPRB73PvBNe37ZKu
         6lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCrPUYkHN100Be0rJWvwG/WLDMRSEYT5rdHDdeTuTGI=;
        fh=Rn8Zspty6ZcVbyNz/EWpTGeLU9fuaK4l759d0Z+FknI=;
        b=o0xhUTE5AEhbOKmiMOOQr3Zz03xk6axz+ssSnmBQOtzJ5Z6zWFUUMDskQcmUQFWy5K
         hUNam+FT11IMtNi6tN92j9Kzn5bQUjMtYHtUjgZAzWajgcWa9jmqU0JQzpTinaO3C44N
         /t3Gm7hlIeaGaRxVZ88zPLVQpiVqsZReVo8VVoC9m12iQY+m9xQn800hrijLnxVln4Ak
         6Q+n8itpZgaYS2uTa6eJpk+6CAxltSb0r4kcau8t+kWAdvwypCJ0RdF77gg0rcTgcMZA
         13KrOcmf7fV5B9z8MVbcuo/66ooErQlVlAVbmuswUZ/rFuaREqvX4n2n5Upg1X3je89Q
         kPzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686864; x=1790291664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCrPUYkHN100Be0rJWvwG/WLDMRSEYT5rdHDdeTuTGI=;
        b=pekX7eGd7tkwOKVHs+eVAZIXZKEv1d2LfcwN2Nx57/R+k55nEFT3LGJwm0qzl056Kz
         iUOoFSiWi7dZAb+D5eQ6saTqJHM2kpU5OBhF5AuOBkIpK7XsTDV6has5D3vvPj4+tR+d
         NuEhDubjQBSybaZQ1wKrNGkJoazCpLKTBQkWesOFDBlbLVkc3SNu/cFiTjvMJXuwUaw0
         OQtWm4mbnp3QNroiJGE+Ew0lnV8PR83Q156PAHedqJw57KA0ryocSS2b8b1YbFg40KO7
         kTllVmbSZcTxtFKt+zW32MFeIUUtqAXnXoD8DG1gVLz/ORjI/0MSGC1qTbVynF4Ulmke
         Cn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686864; x=1790291664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCrPUYkHN100Be0rJWvwG/WLDMRSEYT5rdHDdeTuTGI=;
        b=imHyADWtrDp9AO4DJsg9WY0FfQekwwfFzEiBry2GZ5+3YroMLisoYpRBMT1ap29gq2
         nf6/1uSBUIwaRtItPL3IP51/wLJN0L6iljkQxTIOAQtbp8MlYpHjbAenmC5IJCVC0IAO
         188aE1FoOzwwAcw7hggK11gC9Wj1AhQ6ilThF7XxNvu6VxMh01qtAEnx5zggx+D/W0lw
         EzgyvqYdf04qm4Wt2ggIPooj7UzMI3+a8yZ4Ro3QR4V3Tv45CdWCRPj+R7Dzd5LkOv/9
         pYh4TcRT4XjMZIYHrk3V/Zpc+NfNaI0mR7SJncVBsD3oP5vkU2mJXPp4XiI4PGZwHNmH
         cYPA==
X-Forwarded-Encrypted: i=1; AKwUvBwahZLHW/D4BwYTWouMDJWmtAXljQHaWrY3C9lXWi3Ps8z8sIZ1YpxzQKWqaL6f2ZqENuO/aLDAVrtbi1w=@vger.kernel.org
X-Gm-Message-State: AFuF++lfR89EU4Dgi/uLRShwjmfvOZdeC+vcsXemCKtJmoUQpgoBt/TG
	9dLtaA96doFG9dFvse00cjdi+YQ9qooKzLmbBnjynciU6F340T9OVGTPwr83/K1bO/gr6fK71Xf
	HSOKT2zxqVeAI69gV+s3MoWe51P7t/Sc=
X-Gm-Gg: AYBFou1w/Yj/ghdSdZUl+SLrkK/fipchoiDxC1jBqnO9TIDSPpF8n5dETEzjfO3r7SP
	7Jc+SdWsLyL2CgcSuGubVaewiYDFp6W/B6n/2sDYPt5F5HBK5uPWuVtfZ9rUTHgBOZDqCSfFY0F
	iWKfeDEClHh4pVMagADLgRPuplTIXaOs8RBPAgRF8Dt7kuYbQqhFQaFGEUkJpOiTRbQ8oRopvLD
	OlmV3GApFFsWSUfy6mOihgtZxpWglwwb3fk6oJJr6bEjUYzfCb0vjYcoIs8vvJNUkKvf2OOvHhq
	hZQ1WSW0jDikVQ7bYqMfGD2zVu1ARZy7FrqLTNmGbZ5cIcpRQupgHvphOEKAI8/nmddTKnaIi9p
	26Qf+cnxNK2PYOhTOCuuKSOSHTYvPCFXIN5Ga0fv6l/JRh8zWYBN8zYIKA9UY+ynL++IQEKT1DH
	5Wx46OwO3/ZaER10NYU4EOSra/HDJ99/3d/scZteiV1eF9lbi4/NEtg16CQ3oag952hw==
X-Received: by 2002:a17:907:7243:b0:c29:d522:b4fd with SMTP id
 a640c23a62f3a-c2a1569a29dmr71257866b.4.1789686863785; Thu, 17 Sep 2026
 16:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915004406.115230-1-rosenp@gmail.com> <178963874726.7902.8784965092061133801.b4-ty@oss.qualcomm.com>
In-Reply-To: <178963874726.7902.8784965092061133801.b4-ty@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 16:14:12 -0700
X-Gm-Features: AcwNN1XHKFMSTs1rl2RD8k1sqDGvHySVlRMJaCZsDUk12Qjnpdg1iBIpXWDNCU8
Message-ID: <CAKxU2N93W=fPCBiB9zDZOYNT8JwN7LNOcftBfY5P_LFRYtWu=g@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>
> On Mon, 14 Sep 2026 17:44:06 -0700, Rosen Penev wrote:
> > mvebu_gpio_resume() writes the edge/level mask registers saved at
> > suspend time straight back to hardware, bypassing the irqchip's
> > mask_cache_priv.  genirq skips mask_irq() for a line it already
> > considers masked, so restoring a bit in hardware that genirq thinks
> > is still masked leaves that line unmasked behind genirq's back.  An
> > asserted level line then has nobody to ack it, and the moment
> > interrupts are re-enabled the chained handler storms, hanging resume.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpio: mvebu: keep resume masks within the irqchip cache
>       https://git.kernel.org/brgl/c/02af7eac17bc62a72335c1fc8c4af4471654f=
6cc
hrm unfortunate. I had a v3 ready for this one to fix sashiko's issue.
I guess I'll send it separately.
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
