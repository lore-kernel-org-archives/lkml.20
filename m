Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592983FF8A5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013379; cv=pass; b=fRL7ynZ2F9JvutjnFPA18O6LrnCcIm2Co6hhVfinr8AKs1wFFfZ0n/0JJwpIxn6fqN0LCVyPwjHIv+7J+MilChgMp8mI9uYhyywHrN86gPUpps76ZG1VvQ2aI28TLz0v1UjLdYAP5TxtF53RD4ZbAa37QO/5AKnSdBJGGR1pi48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013379; c=relaxed/simple;
	bh=iefBJmYupKVJayKOqvQ87buV4ppZMJex7WihUR0osRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPS22GYFnt1i+O7SjeSSz8uWvuo5okTL4g2yQ/0JN7ea7tC24YfoFz/AjhTPUosZMHC1qOTxi4ANkVIMS7/G+2cF1AOr5BM0a93NPyQW+dDMjLWdH/l88HN8Jcgmn8mqupPuXeavKDOcaQjfFg8OD4nxrO9qpwK69ES1QHSpL54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYiMvfnz; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYiMvfnz"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5350c1b9e0dso9240431cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013377; cv=none;
        d=google.com; s=arc-20260327;
        b=P5949qacjwycRx6l0hsexAKgBJ3oR8lnnMoU0CQiN5heh4ReK0c6ZgrEQ/gPlfK3hQ
         BYAjXFTIml/kG2PV9ASIZCIE2KvBbu5VI2X5U6LVVXQJOf5QaC7Ss85/zE5u4tfKP97U
         warGu88ZpT81rg5eyDYEihdSDuiIaS/qS2JUXLxKbD7Re001GAGcSiDys7M9ZJ5WttIj
         hN9NntMOZ+0QgCJSFTXqoWn+bYbLM8TNRC8gySv/l0wDxKISExkMb5ZIiwcouuelzmQo
         4a1XsDzOeTpiPoL2fq4To7t49yZXGXzal/vaPm+j5pZB0QQM3NN5KLPpzPlOvEiePabY
         RRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YwgxusmBTG3+SD3/g0+kXEe8xsc6kMCtJNV8dtSIErM=;
        fh=AmGoO4KM02zK1oFhfmfh469eFerTjHYg7nHS5rmkgQY=;
        b=RMf/9Rb+p1ogZru/6bYY25ytRU8Pt91tsfQjCURzzV4o2Vg6rFAuy7JAcVzOwe53yJ
         0xsxRpvUrddOvEhE0h6L3xQTZdAjqP6W1LZl/sqHq5gjz5FohKrbD46fyWhvVQ8Rc/lM
         ZWm3QDQ2x5F1oTUJsEVoD9NGNU6YT5ULqntP3inuXsdd0U916SNnZU4lhvRoaN0rbKvG
         GdoimelzBFC5Z7CbPadZkKsgBmBvkaUERaKL3c+J3vvy/pK55JbFTcsuucX9URQeD9kC
         CEqxtgRzueCs1WmWr1j6RKcM4vJJHHaGEJ31oNc4BfUsEEU8NBph96SMl1wKP83DnrXh
         qQ7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792013377; x=1792618177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwgxusmBTG3+SD3/g0+kXEe8xsc6kMCtJNV8dtSIErM=;
        b=JYiMvfnzBMm0PJBMQgYJaKN3PNndQknU5uRJyxJxp770e5ALcIgfqyJmcKb4LDj7O2
         xqO0ueqKLijwjemP1KfuvVOZo0e6GLsR4+bn1NvmZqeYCC35k7D9tdltzZjT9bDLs2tC
         kQvkziF4biyejaVfJeB4oZ4bbjeuVDTKD449ebaf4jnrV1dA31PdJRTDgVfUx6hB3MHZ
         crLvxKt7ae+GUuz23nF9rFTTB9ht00EtJQTmMZ6fox25eDclrvMy6sqG9/Rm6svapNye
         xqJpIMoyGblHKjEPYeKkCX4d5JiWndzgAmXe6yURqcaqukAp6KfaVEhS5hlluwo0a5Ni
         qqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013377; x=1792618177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwgxusmBTG3+SD3/g0+kXEe8xsc6kMCtJNV8dtSIErM=;
        b=nGzxe302ji1rIFM4Z4ofWCnM717D5G6MHX5m1ksv5kkcpU1vFEZUBdLBeRsVkNLtrb
         6OI++QNhptDwuiBiJZNUd9UjmNzp4dFzDdk03dOBHc/lV7TZA6PBqnuo2eWw/dQrLe8X
         ypAZ9a5arh6SSxNr4fm64nGzESLAa/lDVRAyGw+asgJeuWxdfzwUPCm71Fz3DvNYsx1/
         0lCcpoO9gX0cpchzkENnB7xldZ3GJ9+qOcLr7Pbowk1z26XPywELIeD8YExnffferUyg
         o1tvbEmSA02srGs2L2WPdN3SXP80aRY3ny/XbzDTSj/U4PhpEa+ek3sO+P2jfxEqzA23
         boKA==
X-Forwarded-Encrypted: i=1; AKwUvBzNCXNTd6VKaT07SckkQR6Q2BzFgFytmQ53/9CCo9ryd7u236LNG4++lF4iD0dRlErYLvXamsRyDjRzJYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBcseiod5We8auQsBjzP6680OHIxMgGWzZLOW8+6XdZcPv2JNN
	Af99SvUwWbyIYWvxMUTM8LK2dYv8BCkkJWsI5wAvJW2eUlXZQrpD2bxLGpd1LMDExh0jUztClwm
	wJ3LmGw/x2q3q/zfcbL8mOKoLQsyR/c0=
X-Gm-Gg: AYBFou1YutJ4E9T7+NOUX5I4oMb/zWQGwaHTI1r6A1yM8IsSFfMYi2zZDktXTkY/QFZ
	XSGXUDIDWhGbmKDBUnEsLRGCpiFEKbpZAdt1tSepUbrYYN0tTbT+Ak5CO8IzjkAvx+CWMuWn5Iy
	76OTdBQBa3fSthkWprQeJ4tDwoR8K8irmofRKIsnr2EedwnXMoqEjTXO0JAXM8R51TmlpFyUJFu
	lnRqYBDyN72SXX9hyfDSVEImiVxwoD1VuKS+MHQcBc4LW2ZK0Oji434wN+KdA0Qwvsj57zeUseD
	zg+fE85gVuNcBCLhAKcX1Jhxzh0A5skBkur7dtG/z0wghKaCP/rKt6s=
X-Received: by 2002:a05:622a:598c:b0:535:84e3:ceef with SMTP id
 d75a77b69052e-5359fb86e08mr292010171cf.45.1792013376625; Wed, 14 Oct 2026
 14:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924020936.17612-1-matheus.aalmeida@inf.ufrgs.br> <1e4cd74d1d4598dcb22198724323cf00@inf.ufrgs.br>
In-Reply-To: <1e4cd74d1d4598dcb22198724323cf00@inf.ufrgs.br>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 14 Oct 2026 14:29:25 -0700
X-Gm-Features: AclHuK_EW-cvvhCm33wG1LwURzuAIYspTU3DOos0A_N6byRXCMb2FNUeb1-g6hI
Message-ID: <CANRwn3QfxSxVqGUjOuMhoEhuOHRz0ODdFqUU5wZQKuPNp7kG-Q@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: fix wacom_intuos_irq NULL pen_input deref
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+b5a7cd83622c747977de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 8:35=E2=80=AFPM Matheus Alves de Almeida
<matheus.aalmeida@inf.ufrgs.br> wrote:
>
> Em 2026-09-23 23:09, Matheus Alves de Almeida escreveu:
> > Currently, wacom_intuos_irq() passes the parent of wacom_wac's
> > pen_input to the dev_dbg() in the unknown report path. However,
> > pen_input can be NULL on interfaces without a pen, causing a
> > NULL pointer dereference.
> >
> > Get the HID device from the enclosing struct wacom and use hid_dbg()
> > instead.
> >
> > Fixes: eb71d1bb270e ("Input: wacom - use dev_xxx() instead of naked
> > printk()s
> > and dbg()s")
> > Reported-by: syzbot+b5a7cd83622c747977de@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Db5a7cd83622c747977de
> > Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
>
> Hi,
>
> Gentle ping on this. Has anyone been able to take a look at it yet?
>
> Matheus
>

Apologies for the delay... I've reviewed the patch and it looks good.
It does make me wonder about similar patterns elsewhere in the code
though (calling `dev_dbg(input->dev.parent, ...)` isn't unique to this
function). I'm happy to take this as a standalone fix for an observed
crash, but an audit of other log statements is still probably
reasonable.

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
