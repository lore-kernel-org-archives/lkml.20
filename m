Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938E448B82
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731367; cv=pass; b=TSiIxXzJ3Da4ChER4Ll5Jwela5SIR31p/VdqwuAgLI6YlnFnWJko4bZFJs0MpO523z2ZrOeaC2VejTmqfMMmDcIdQNnTJgxnrSW3tILgmh6+MzyIcexoHXEqxMaD2TJi2oS1vA0j4gdcCn+Rfjzmpq0B3/oqFFgeZjqNS3fd57M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731367; c=relaxed/simple;
	bh=K2AzJvWmFuXl8WjO1KJdfYR7kz6Z7a6AQW5/wUEyPLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLUe2zKBT3aY50a2WTquW+e9sKJVuE4B0eZ11olfsEgcpvJViyoAlfmW2JpQ5KfcztRrM+VOFpdIJILtTZyI33jVKz3z4wzg70gBrY36wKbqdgOB3NHfXuL037fWaB5nuyUdaXJp9XKFwwa0Br8USZ0QQRrF/ejUDla3ZImxBNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLiUMiyM; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLiUMiyM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so1498067a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791731364; cv=none;
        d=google.com; s=arc-20260327;
        b=pyyibEewosNfneX1DHwXLfyHvHMeXb/0IQR4+eAC/BENm2g6yEsliXKriTL2BiGEr/
         +Nfvcy4PTOjqxVeke2X8a/UTnD+IWWyA1hz/4cj6cvJbi3sSyK8llbEz1l29zhHZsdiW
         HWq7epsvEtMNkFlbrb/HPiNg62Ll873US8aGECfVTCNQJgYCPd6Y5Sgyj6aAi83x1tvC
         jtc+zLxd143zbkVnsO1BmxB2OrlcOiNlXVP2E86DUjFG1/zbrm2ZFC7MzW9X3pHHZ9+O
         knURXhyObJhVIBkP9gEPBmpj8JgtgKj4qJMwYo9EpdZ1HlX0N2EIQQN7yU2Ia9XzZxtn
         67OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EhW3wTNjaZ800qY5zEi7YbceixPkrVlHD9ZpRRBYLw=;
        fh=KDTJs9LvmJND6ULJLdzc+zsjJA5I2nZpPPnWqdv0XQU=;
        b=qGVAUQs4v3OwCbV2XF0to86bk+BKYL64fTKzavZK043oF9JmvAKGAbGXhBf8zIUHv5
         JlakQtt9ffUW1gMpu+trQJ8WJg24mckokfouB5CyR6Riv9kN94ZAiHhKqhwcN4RTF6y4
         +dD5aJMjvjWwvYfYzxJAxZS/jgyszywZDcSPVhZDZloaBO2DKJzRJ23ngtGQU8qehBHI
         NK40nJal6oQqabBNMdwBv2OEiezKRki8vHiHp0t3dYUKwT3NupnNTgue5QIsjj4H+5or
         M/1IGRdRlppT3ZzFLWtE1OTf6Buha0yMDfCKlkRVBQ1LDgxjbaiAglMLT5qBpA47NWOI
         wpLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731364; x=1792336164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7EhW3wTNjaZ800qY5zEi7YbceixPkrVlHD9ZpRRBYLw=;
        b=SLiUMiyMYNurvQ680L3ZJ6V+ZKEf1XXqvua4B1/2rH2K2/FrfI434SD3YBgpTR3ETR
         GsbTPksS/99xr1/T8BQsabOhpdNsfXfsG/4oa1fUSZ4lwyYxiW+hGBNQiVQdAyPhJI+0
         pkmiVkKlniBBU3GW/CYWdys/5eCfE4NSaVBrXzctIRoWGtDAetLhRH1BTTiHXTw0Ct9Q
         7XTXf3cx+B7b6csmBgH/LBVpIwwlYhZwUrsY3AAiT6fwdcEAmJaiXtkzxp12dSqAacxF
         bpLZ7pI7WpFSD+PwOMz/RakkyUvKybCeVnUUVOFpilTDisBKfJJxRCQcwRgIsQH9GAys
         p/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731364; x=1792336164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EhW3wTNjaZ800qY5zEi7YbceixPkrVlHD9ZpRRBYLw=;
        b=eRFDeuVIB8oq/I2V6JDkzT0sTVG+ax7DRRHevfXXJC08P+NynpZy67WN2ZXA+TXHmY
         +XcdnkJ7Ft0B8e1EEKnVCV3SvQBY3pBTEWtVhZH/de08sTOZvffMdexMSXuE+mCKVD0A
         NHGL8/jn0n/Ae6XnT+LTo/9UWg/RC7pD+dTLv+3WtcdGq0p3M3opd0TDImjCEqDFLKsG
         D0ry+2yFttXyKJaKwotEJWmmg3X+5sQegu3zG7NMjYxZEYhEMdZ+rfrvYSZQy0GjI+5p
         Hfi+t7Zh9qqMhTefgHIIvnoCgYQapEg60ags07MojW7ZvZ+h0hCyk6noEpqCuuBUC8hr
         6aeg==
X-Forwarded-Encrypted: i=1; AKwUvBxZFyiAQnB4EhbbvlloDLI/p52b6lBRzobgHgb0lXkkV6qd2pMpT/E+GOt+DpKrpmEcmgNnNV2EBc/+jQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOGmcowcsU2CWjiDWdyZBeu/YER0zvpQdgKGbyp8XmSpqh3LWT
	YDnrgtqJvu0fZ3+E/gjfFATPh1q2YoXasc/K7ofXZGcKwd8ZFHyq4DBcgLmYE4jpBmLbYwlgfF3
	pxm3fiHkGNWsl6HwGuU8UmHlhev/isIRYiKuwp1k=
X-Gm-Gg: AYBFou0pNS3+Ll72U7hElTuAxuamclv/griMJNdbrUqHnqVyDl6Bbn24sGpzDIgRfUH
	/oIqby5Rl4CtF+rxx8JLm/+AHVBF7kAuy92uOck7db3He3623pRIWUd0TuaK9GjmsqcPA66lfHO
	9LWZEsDO84BFAerY9A540qafs3q4O6dtvbZjWGNRaz1fu3AEIRJxK18wn3je/NUrljcz4PdsUC/
	jkRvGv7PlawhLCX3Zz/OR5CyGPaEHw2DZ7GVsiv7RJYlDDJQ10V+hH5+adZ7ShfMOG8QjTagZHr
	edUcWJWJQIv8/clUjtfFitBEUyJMF8k/btHs22MSuEV51pFfAWNG1UA7zQ9OkbTVlFrlkJJwIQp
	aAyD/lzB58bVmQ/v4RlomsM8YpJANRtMkO6vm2SZuDA==
X-Received: by 2002:a05:6402:4490:b0:6aa:ea1f:7e64 with SMTP id
 4fb4d7f45d1cf-6b17c25d5acmr6953116a12.15.1791731364388; Sun, 11 Oct 2026
 08:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010144621.974850-1-linmag7@gmail.com> <20261010144621.974850-3-linmag7@gmail.com>
 <CAEdQ38Hqj9+5vui4j6s2-5OihgtiQGSM9L93RTYdp-PfGK0_mQ@mail.gmail.com>
In-Reply-To: <CAEdQ38Hqj9+5vui4j6s2-5OihgtiQGSM9L93RTYdp-PfGK0_mQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 11 Oct 2026 17:09:13 +0200
X-Gm-Features: AclHuK8wAlJ2w8Hi5NCVzVlnkDCQzMFOzN9OC3Lxue_fENNRoRcIedsjd9ZKdVs
Message-ID: <CA+=Fv5Rxgc_9Q=b+7hj5w=hY5-CWx7aKsSAs4vcCAo2xGedDuw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 1:34=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Oct 10, 2026 at 16:33 +0200, Magnus Lindholm wrote:
> > This requires the preceding removal of remote slot clearing from
> > migrate_flush_tlb_page(). It also requires the stale-TLB series to set
> > need_new_asn on both the reused and newly allocated ASN paths.
> [...]
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
>
> With that Fixes tag this will be tried on every stable tree, and the
> dependency is only in the prose. The hunk context includes comments the
> stale-TLB series adds, so it will fail to apply rather than misapply,
> which is the safe outcome. Naming the prerequisites on the Cc: stable
> line would still save a round of FAILED mails.
>

Thanks, fixed in for-next. I've added the prerequisite commits to the
Cc: stable annotations.


> > +             /*
> > +              * Ordered before any use of the mm by the mb() in
> > +              * arch_spin_unlock(), when finish_lock_switch() drops
> > +              * the rq lock.
> > +              */
> > +             WRITE_ONCE(next_mm->context[cpu], mmc);
>
> "Any use of the mm" is slightly too strong: swpctx loads the new ptbr
> and ASN in switch_to(), before the unlock. What the ordering has to
> precede is the first TLB fill for a user address, so maybe:
>
>                 /*
>                  * Ordered before any user access through the mm by the
>                  * mb() in arch_spin_unlock(), when finish_lock_switch()
>                  * drops the rq lock.
>                  */
>
> Fine as a fixup, no need for a v5 on my account.
>

I've changed the comment to "before any user access
through the mm" as suggested, and refilled the changelog paragraph.
No functional changes, your Reviewed-by is retained.

> > +             if (atomic_read(&mm->mm_users) <=3D 1 &&
> > +                 !mm_context_elsewhere(mm)) {
>
> Not for this series: once every slot has a single writer, I think the
> slot test is sufficient by itself and mm_users only narrows the
> shortcut. Dropping it later would extend the shortcut to a
> multithreaded process whose threads all sit on one CPU. Worth a look
> after this has had some soak time.
>

Interesting, that is for sure worth looking into.

>
> Nit: the changelog paragraph starting "Order the slot reads" has a short
> line at "Also issue smp_mb() after" that wants refilling.

The combined TLB v5 and MMU v4 stack has now completed an SMP compaction
soak on the ES40 with three CPUs online and CONFIG_COMPACTION=3Dy.

Regards

Magnus
