Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6987416856
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789908732; cv=pass; b=sVOSKaYb3qV1cvjhjBRmJ4SzDMeoqrC8dZiIkKfyJlwDip7DANzU6o0WCe7g4WVLuWb/7+gvlan4v7B60kC0XXih+arhwCavodi3jTwEIH7lSMWJv63sCQi8gobBRfvwkGz56PanrY9kVrQQJxayoXC4TZGNuJi7YZM+Ba1jtR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789908732; c=relaxed/simple;
	bh=ZQNNOodnafUfKyYUtCD2T6LN3qY+Op9dMMGlqc0Nkz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C21X4mtlUpdMc+Q6mYD0SJVpPETpwJ5m92TgFflKGcellraDAkU86hy+3Gf97rURXIjuwhZrXAT/FTW7VOqLcCHIEbPEaQZSwRS4gtTCZyZuDtFBtQ5ggk3lyAYRY9bvWB9lsn4U9j3zDChOPn4qNM+QQ/8whh24JlwRuA/yVu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABs6RKfd; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABs6RKfd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so3540117a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789908720; cv=none;
        d=google.com; s=arc-20260327;
        b=PjaMwkaCwl7UWRi5aYT3byFQZh1zwtn4q8mtBwYLakEH2m6l4BO6ihsVnO23Ps7eFz
         2gzyQf7JIvvpqmL75dXl69kVWOmTtmWzo2axwy0tO9ArENLHJF0GS+qUV+9Qfdgr9z+/
         iYmHjApVF9q4cnvenjL6SFBEHtBjdORxyFJwXTl/bDFTh2XNMecEjolJRhkWwVWCL+IC
         TZCe98P5MtuZtgcq2vbJcuQG7ude/8apDiYX5nf48Q9MlAIvr4uD5uNKrBVqRcdk17QC
         UHVFQ96GtorgyCWzpIXPBKegf/xBlVTs8BFBu8YBwOfe2K6G2GkediaSvnk7/AXdaS5u
         5bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bp4dAKucK/aMgP12WCskWZGtUcUwRPZ8et2zUP/K8hw=;
        fh=VfqpktTBGQpmLe6kIu2EU5Uu6OnXzbPlzsWIvFNivyU=;
        b=oCY7I0sXzEVWnrLncBswRg6SAPaG8ILywgXXujFn7TrhTUb4NWu8MJFbfEQIy+veqc
         8aAYqbBeEdMir2PCy/nfGGAFFHilDCfvM9fntwnaEoml8t1pqZcqQOBYytAW806hUZ65
         MSpEPc6KMU3BfCJg+g2lJhOg6Zxx1iJyf/ISBPTqTLlLECPfyAGvgA1RBzyjurTtcCaU
         9aXvDrvXo1+Qi8WCChes16GbeLoMWeDnypnB30J/hOyQqrZhnKP+wCO0v4qNpAyKwJYV
         SHvSzYaXl2piLlzVuKcBnVGu26HKPzstAP1V/V0sScxlcq0Ws+glvl69Zd5VHLb3sFul
         zkuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789908720; x=1790513520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bp4dAKucK/aMgP12WCskWZGtUcUwRPZ8et2zUP/K8hw=;
        b=ABs6RKfdNDin0NrMSCUd44X/VUvHJdum9N0S+RzL+zxuN22cf2zBb6pSUYqQMaBzyB
         HRqRMju07/t6Vq/S9NQP755ymLyDDCDUukCyA6kfbYSvHlQVNKvEUzqHsdWzjpu34b6B
         jwFEpp3BrxmVRdgeOlGXXtq4Cugqrcs5NDTrhvcdd+SiOY69POzXmPeSqz1KFqIkAPZc
         Ekj9jIQUWuJN9BJMWUvw6V+Fe8fvJAN/x0CFQHhkfl61d7/C6NRfpe2g6B1VwYcC7qpz
         nAYBoMWahmUKTN/ZKo7xQS2KHjO1bFkl2Bx6ZZqYBAZS1W+Uqu5nPePnAmHZXYJKo4uP
         +emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789908720; x=1790513520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bp4dAKucK/aMgP12WCskWZGtUcUwRPZ8et2zUP/K8hw=;
        b=0zjuS6qgoMvvHDaCSlgWPeCY1nYr4/SoI4mZ6Z/70ZCZorMF2W52tdDOva47mzk3le
         h6dFS4iWDKnU2nrmvT4t/w6+q6Ba9ml+p+Lq/oJUAEU2k3eRkSo9WoiK4bFnE5a8cFiM
         nVilWStvp2RNRX9ngPlCVc+AuGu2Y8UaT0TsAe/Im5DHMsXirPCvUYTXTp1xWReWNujz
         JE8O5RFINB80LxqMzOWWt+LR1sjDNEnOf2U4rzBjwVpS3bHLFKmFO8svLORh8srbI+q8
         Q/ECpl8s4uW2Ni6aCpPzlZCsNhACWp9S74tAa+D1O39Ynptxg08oRjtcBSXjaWqv+2H4
         5wTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy939CyKYwzmMlzU+PUX72/cnH5lZXa8r+VT10WVBlmPjDmBF/qUNBmWrJT9eVNXPTHlBFYerciLHS2UqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nZrqJED9A0NHdTMKQkhuuFU8oNPNWuTRQ/IpAjQgwy/v7lrEQL
	PGE9T9q7e7la5EkuMuHVWyNzcEBbPcrmwmF9MrxiCqcAD116TPl+jMQMGBLJ/KsLOlNZKt5eL8c
	dqhG+Kk9/UTl7W53qb9cxnEW9Gopsu4M=
X-Gm-Gg: AYBFou1JHs8v1UYRtowdCwRQ/nZ1xxr5grNB5WeVqAik1pg3NqmW0diWBy+sbzaibmq
	YTbk+5VB+vERC+pKLWiVjG2UaV8An9cfn+Y5E/OMHseAeWmEtB5YfZGXnalsdAu6T+SdWPbEf4e
	unG8uF+jWbbvNtHz97Ff0Y+fLaQgjS8yMY4TV4lwFc+WAY9+fxDmM/8zPmRjKF+VDGXeDvn5mRV
	hqVZnV7ojm8U1ZGzwmUEMBekOrenHAhZaYGWPsQuL2OSlzNV1HWcW4nHENcC0uRs01e/Fyi+Dub
	8frSdsljRlligypdVwRRrHFe11EB88DLGWbkxbFpl/TJnWbB4bq3siojjrwBHUYUSZLHY/JILGq
	bOff4Mfe46k+PvV0PZYdQA4VZQ60ZUYVGWYHqUWM=
X-Received: by 2002:a05:6402:4613:b0:6a9:a5e7:f8d3 with SMTP id
 4fb4d7f45d1cf-6aa5780920dmr5457337a12.19.1789908719372; Sun, 20 Sep 2026
 05:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919192152.271808-2-meatuni001@gmail.com> <aq9aQzLGtt0MNWjJ@google.com>
In-Reply-To: <aq9aQzLGtt0MNWjJ@google.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sun, 20 Sep 2026 17:51:47 +0500
X-Gm-Features: AcwNN1WS_OTZgLbdgE2iMi0_eKEI4p5XEzEkUWHl2UKLnrUNe_-9fFx845pTuWQ
Message-ID: <CADqcGBkADNEdagkP-SdoXqP2a-z44oY+LRfTuV2kY_9JjxSypw@mail.gmail.com>
Subject: Re: [PATCH] Input: wacom_w8001 - validate index before storing data byte
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: jayakumar.lkml@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thanks for the review. You are right. idx advances by one per call and
the W8001_PKTLEN_TOUCH2FG - 1 case resets it unconditionally, so it
always stays in [0, 12] against a 13 byte buffer. I rechecked against
current master and w8001_interrupt() is the only place that writes
idx, so the store cannot go out of bounds. The commit message was
wrong to say nothing stops idx from growing.

Please drop this patch.

Thanks,
Muhammad

On Sun, Sep 20, 2026 at 9:02=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Muhammad,
>
> On Sun, Sep 20, 2026 at 12:21:53AM +0500, Muhammad Bilal wrote:
> > w8001_interrupt() stores every incoming byte at w8001->data[w8001->idx]
> > before the following switch on w8001->idx++ has a chance to detect an
> > invalid packet and reset idx. The switch only resets idx for the
> > specific packet lengths it recognizes; once idx has advanced past all
> > of those (W8001_PKTLEN_TOUCH2FG - 1 at most), any further byte falls
> > into default, where idx is only reset for pen-only devices without a
> > touch_dev (the ThinkPad X60 workaround). A touch-capable device fed a
> > malformed or overlong packet therefore has nothing to stop idx from
> > growing without bound, and w8001->data[w8001->idx] =3D data runs past
> > the end of the W8001_MAX_LENGTH-sized array.
>
> This analysis does not match the code.
>
> w8001->idx starts at 0 and is incremented by 1 on each invocation via
> switch (w8001->idx++). To advance past W8001_PKTLEN_TOUCH2FG - 1 (12),
> w8001->idx would first have to pass through 12, which matches:
>
>         /* 2 finger touch packet */
>         case W8001_PKTLEN_TOUCH2FG - 1:
>                 w8001->idx =3D 0;
>                 parse_multi_touch(w8001);
>                 break;
>
> Unlike the shorter packet length cases, this case has no conditional
> break and unconditionally resets w8001->idx to 0. Since W8001_MAX_LENGTH
> is 13 (matching W8001_PKTLEN_TOUCH2FG), w8001->idx is always in the
> [0, 12] range when entering w8001_interrupt().
>
> As a result, w8001->idx >=3D W8001_MAX_LENGTH is unreachable and the arra=
y
> store cannot go out of bounds.
>
> Thanks.
>
> --
> Dmitry
