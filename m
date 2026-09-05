Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC636606B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 06:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788589193; cv=pass; b=XBBuviFjnxKtML5G/Sga+PzFwECCae8PaMluZcZoPwW4xIMrkknMR2Du4RpDoRQNrSVJjpZXyhmA9YBqoK+OCv/zf0PNYSySZ+kfRq2f9E9LrQDo8cGb34w2S657yAHlAsOr0rta2x/Ejvog7nhx3/ARDKSkdqP9os13gzsXrro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788589193; c=relaxed/simple;
	bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+Yi9oHTTxDEfr1qotFnGB3CJad3QaTVZUxLvWDp3vVJ0lE9cwlHBBtwy5fqQfHIoIICp6f05LUyTldPILtAXNnR7aZaFaCra2bWAfxs9ApF4/Dt6q0QCxSXph0Zm/BgUJC3Mra/iJ6rXt9Z5pK5tR2WXEz5a5lwzq9fA5ZzmW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/M7zchY; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/M7zchY"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b60bc6b4eeso1207757e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 23:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788589190; cv=none;
        d=google.com; s=arc-20260327;
        b=RgJyRYINzfeiLyXEO/rEMnjtjKZE5KU8nBt2qann8wvOZSL8EPvcqw9jMK9ejHWtFv
         bErisZBnadTfNzCBItvUtammrqa1BKFfR0f1fSd3NYKFzqCSzXeyE10VK/nMBAr1AsZk
         bys8BdMqgqUZA2BbYI/q4xKW/9Xz48GKmElM/F32DQx8/FLAnoaauwVpWs1wJkjhkGC6
         53Nf3D2328AIj4WZWVq2eLfhVv7FBr3Vr/esbL/NBIr49Y/cPVoXoe7P8l1x4ib4RF+r
         sTbupNcYBiNMu/ZA2QrfyOifVtCyOtoRtuX6/9SzhJD2ZvmNhVASlgFwqGah/Haq6d33
         HJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
        fh=n5g9PnrRZ/Kq1UqmtaYuvWnhNXO8hiYF/KSOGOIlsE8=;
        b=HY3Lc5/Vg3/7tRb3bKsKF9Y2MXl3W24tk8BZK66h/gMdqYIf5obSpyq+HOqy154GLL
         mE7WFbeH8QZGu0vBAtwiAhxjW2YhtHN0nUjCLaysGffCYBAF27FwHivkObdSx83uzaUw
         aFb2xRAblDM4iSuEVBZD2JWxA7qaArmtFWuPv/DmYXX8phX0RurXIkFNY0w6AtF6v6f7
         FnHp1DYKfdqvOo0A4vYLwQh15853XMvL8hxghUMor/5rp8a/E2mLfEB3tF30HZTXlhLF
         8xN2La1Po9iI5X3SulwhW2EU0Xs5mJt0UUPMqck5JFdsXwOJWtV2k6+mJs0ieP2aQcry
         yTMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788589190; x=1789193990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
        b=i/M7zchY78vRSJvpMh7Qa9vuaIfzWcJtyiI+soT50eSvXIXaCfkMHpyeyweSLozicX
         xAzMsoDxdqk0xm1y/ygEZXa0LeLOhouq8SmThqo9+dxibrHgNKYA20zA4cTL9NgsqBDj
         JpyE6zqy+81nU8XPY2EQXa3Tod02EnksR/f0hZwYQYwlbdJENy2IvRR6J8xNdZOJtdE9
         M8lAzQDmz4xVlCh3PhmkNPy9nD/agIfIG7lPvOSsuD3E2r7P+7y65A87V5RLWawDz3oI
         POS1E7vOeACWJFAZ+OlZjxEkQX/xblxACIK1vxH6GrtbH1cA5AM4GeN97vgP/+KlP8zE
         jaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788589190; x=1789193990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
        b=J61JVcNUBOm0EJOag0XT1djW2j5SCriycykM+dimXqAfXhXx7puuuW9P7pO1Bl5SX6
         mlGG7yS8pOquM7Kn8NpeENfytPkGE+dkkrTj+QJgtkGxhl2IAFLDAT1kpK8tuLHSLqkr
         tNAlu8PoeuLQzpEccGN4Xoh6rADYr6ZAssePcKWCw1+7/THI61+ZSynGbbB3SbhFCVAd
         huFiY1ydjmndcHpi0TNBCtv3++mqziJ0UXUiVtNHGlMpaB73hzWbV5QbgR62sYx3rpI0
         Lp9vOdQwFuy88PsbXiJZba7tsnuFHqfhuiHUeiEMd8+hLsC0u5Y3YqRTPQ/QqdiLiP1V
         GKsg==
X-Forwarded-Encrypted: i=1; AKwUvBzZuqjPOeMiDNFtINKqOWlVSHwjdu/TbJg7YGJ45huGFE6fMZJ6JxLdKndmeK7JtcaV8C2UfeDQloV+gY8=@vger.kernel.org
X-Gm-Message-State: AFuF++mXWt2+pnnvNh/N8fbZEknKc8S5tPYCC5fIgsRkp9P4gStVhR17
	vJXJz4NpCewlRAxh5QqiCdpF41lKc+MV8GRwroEYvmN5PWEKXspr+Q8vDsJCx7hvL2gUaHMCQD1
	g2FEsSoSyL9Fkj2lxxmQjslbZgBQ+i84=
X-Gm-Gg: AYBFou12f6FANbajD2T0HuGEJTneInbYWIHL2z1KS1+5N7drEuopVUeNEe6CMA5oRRe
	gBFt4UGzUmGJUNEzUxBGm0t7A3NOGban9IZ/PKrVxLlbyJ1F5olpOZTL1yPpt1SQPcXMq1K37K9
	Pki0xOrZEqlXfh9kc7W4ZzPD/KuGTL27FiVx42nbVTTxIJ88FDo151REKjhzJwK/ZYnTetHn9CW
	2eHGoSU+VLiZJi0q49cdBuVGgPN86JxAj8V+9JXNH2SQa1SOP8qvrYrfeNeMnqVWjsmZW/sWYK2
	g5n0evbS5ycq7jXSYfJr3p9lmGyUVdCNedO/Bmfumf/ylA==
X-Received: by 2002:a05:6512:3ca0:b0:5b5:e265:5215 with SMTP id
 2adb3069b0e04-5b616f2389fmr2673007e87.22.1788589189444; Fri, 04 Sep 2026
 23:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
 <20260904182023.4486-1-hhkieu@gmail.com> <CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
 <CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
In-Reply-To: <CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 5 Sep 2026 03:19:37 -0300
X-Gm-Features: AcwNN1Xcn7gxVJ-XcwGRHw8YjMjtJQlhyxhOoGl5Xct5WzB2wM4Yh49lGrcXjFs
Message-ID: <CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Hanh Kieu <hhkieu@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 2:35=E2=80=AFAM Hanh Kieu <hhkieu@gmail.com> wrote:
>
> Hi Geraldo,
>
> I looked further into the is_pioneer_implicit_fb() check you pointed out.
>
> It seems the DATA case is intentional. In the original Pioneer DJM-900NXS=
2 work, Fabian Lesniak described the observed behavior as:
>
> =E2=80=9Cthe playback streams also tries to start the capture endpoint as=
 sync source.=E2=80=9D
>
> https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4
>
> Takashi Iwai later formalized this in the Pioneer implicit-feedback handl=
ing, explicitly accepting either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_US=
AGE_IMPLICIT_FB for the secondary IN endpoint before passing it to add_impl=
icit_fb_sync_ep():
>
> https://github.com/torvalds/linux/commit/167c9dc84ec384c0940359e067301883=
ad2b42a8
>

Every other Pioneer device has that USB_ENDPOINT_USAGE_IMPLICIT_FB
on the IN endpoint. Yours would be the first without it in the IN
endpoint. Unless
your hardware doesn't rely on implicit feedback for syncing then there's a =
good
chance that implicit.c short-circuiting and still picking up implicit
feedback for you
isn't correct, but what you need to do is cool down now and wait for proper
maintainer response which takes time.

Geraldo Nascimento
