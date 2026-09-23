Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A053B34A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178145; cv=pass; b=kxHP3+cQeKQqa9IAghiplXR4scnKywC1BnziO8tJjltGtICdZfb9bBJPubTCNqFGYbiL8KEv0XOrAeWLvxAsjyHi79xTP5fNCQJGocO3ZnGsCkub7sIEA+cwOT1LdhfxRq8BeusX1jAYcIgEnMDMK+UTlFUXbPQR8bSKO3Uxpjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178145; c=relaxed/simple;
	bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg0GgU3vMCmY+Mc6PYwmLcXN0YI4/TqCb1Yr1IWNYX6ScMYdesy5+OX996l83mFr259FFylxE4ehoWiB3kgLyA/ONVgCLh8oA4DJOm2PVzEqO7zpPQ/1VAmA8sKt2F0ctJogLQlmknbS4lFat2L1n5eNRWSI2JtXK27gh5ZK0zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFiisLdp; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFiisLdp"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-87058e770c0so784377b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178142; cv=none;
        d=google.com; s=arc-20260327;
        b=cWeovp4JHxtEZk9XyM09UFvkIEatLs/5MMaar9KcAaX7T05pp4h+cE6U/cAHGQsll9
         xcTZX+dRtfSBiN2vJ7AeVQ3CEPNi1LitTH/cFhdNuBhy0pLd9mOmfNEcP6gxxWO56DBv
         HqGZTt4EeEahnd+wQqSnjI87OieN/3H3K5E2d5mKMhnyyYU89fmeZWsy94+AMcmoeTNi
         jK40gXKvgTKUGE7j4EUr5reB11CJjDDl8kV5SMEFLVC8ZattUwdOIA9rdMoLFVOnzqaH
         2tJhJ9Xr1Gii2SGQYTy+GiWdheQV1uPnKLnN/LMOnsSClgdAi3PaZL/McVpUOV69hVWF
         KrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
        fh=MADyr4UxyONRBdy5krXYoUxEcsvFkeq4AjGgyoHZ7Pw=;
        b=OOy0y7dleXtwVE0y6f6R60RpJjP/9CRhdieUbgu0cOkU7URjpATeNi1EyrVGjBXu4h
         PQBCdzchhNEfrLcCEE3tUCaTrX2KoKqlKz5DstkMeDxuau2XykjTTxEYEh3aQTO6LB27
         juZeAPFYxAOc6LXPR8PUhsN1LzGaNlokieal20VtcZ0k1xKiAGoUoeYc6b597ZiskNXg
         9Uf7HE5LMg4Tgs9/UEhVvWtvYZ8oN4G+MERara5OglQt3UouW+UR9ErtoCYJLDQ2S/Zv
         klEcjth4Q+IcmeAizLtYKMetYKEwmpW8vDar/aHxBN2BKeycKg7GqRNDzATYGaFB2XHB
         nBOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178142; x=1790782942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
        b=jFiisLdpvmNxxMvHF0EZLP4sxkMoVzw7heAplP2Gzj8jbE/LEATLs0bWWUqt5GeS1a
         0dpZDfCGfPf1BviihdsPrgQNyPJxAKY6EtmjhyP9SSEOKr5T3vLycMM/5jbJArxPRJwn
         unJZHyyu2w3tXF7ocwKsNVuUH0IuJ0nzvUM81+EH7RhVkAOQhnSxazIjyvxyppCtk0Tm
         4s1aI30xrkm7hijaCHSn4HHXyfJN7Xcxe/wJr/3idxM6D6nCRWzhRasDXyLKPlS18pDn
         q9WxQuBeZksmM/K+6IcrNtPhTGDTvz73GYmBKb3HlJ+NEk5IjKGRKqFh3ttPwlF1EIj5
         A3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178142; x=1790782942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtZ5CRWVFTgs794gP7zlyaxMmBWztJD4Ak7+nxa8lOc=;
        b=2wAtgDghp2W2ZmfzKHPIXGH06NG+qmuHH/JQjCLRVsRBV0j/4Rn/6S7Plf0Tdc/New
         UKrDorVlYE1MN9PQ9f++dmRMTLvCwFHJxltGwvp4m+OMZ/mPHb0HVfLo5anrCEkGcPLe
         43Fua/YJ6qZW/vOQU1vJrmGCMvb6Op6UoN6lF8EEYV0HqSy/Jtash9XroSS/fSUKX/j8
         H1E9+6LzMnWel6LkWSEu9UgPkXJKFwZKxfVVkE55zmN1ZmW/a6JbwHIwMXurGwDPFlwE
         qmdZX+QgpgdOmIZtbJ3UlpvkjOkll2Z/FquYvGpcTulIMCA96kn44qj0kBm/lxaUyKMq
         o4CQ==
X-Forwarded-Encrypted: i=1; AKwUvBziG/LK/wjZNiPrJRkE3GPiJQzS9FAXAtGE8bx3ly406z9TFUKfb9YMto3lteuTG31bICZkYNZ2ERZ0IgU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkEdesRnc+rwqrWUoCxAKZVfQptbx9hjkrbUeHKhiOVreE5w62
	ifH0Crz9ITFT6GLPArLi3wHQDVt2omzKrTfY3tPRJZ6Sly3SbWGG6g3Q1CFsvkyPAD8FLbu8BXF
	BjglMDvns7kr393RyUYP76HgIwYjNeAU=
X-Gm-Gg: AYBFou2DqZebVJJ3PAF1lyO8/lnQwmxXl7sYaypwylreE+BrBw2Zc3eyjgRkaSzE0lq
	n1N6YGNZ/lZxEAxW4js8jGjazQrywdaQQlqzyErypBfzneO1g8D0d8W+kk6M43nKBHBk/iEsdmr
	clz2AD5wmpbDpx3UxYUm46lNkBcdt0fToh/2IO7AhHN6acRlwzm8QQ0WQnB1DljaIHF/GNgW5/H
	rgHhnkA87Oz/xDbQYoSvnSmWLuF4j8CC4QhDx84jL2E4HvtoUHxqIowtst0vFwqsoMvQd7irlrs
	fQxuFuDw/IeSA/DUGgh198Rnzb37ais8wLnBrMmizRgvpR4UAQupkIdY
X-Received: by 2002:a05:690c:6709:b0:85e:3071:f103 with SMTP id
 00721157ae682-8a4574a521emr31049147b3.1.1790178142273; Wed, 23 Sep 2026
 08:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922120330.127262-1-itai.handler@gmail.com>
 <20260922213457.GA3536981@google.com> <CAFpOueSjekxhjEosQGiZ9BiDh5tFOqBPX5w_2PVsrcN6pO+dHw@mail.gmail.com>
 <9a6c20da-4da9-4a8d-a6d4-f18900228bf6@redhat.com> <20260923113903.901245-1-itai.handler@gmail.com>
 <20260923162846.0d198104@pumpkin>
In-Reply-To: <20260923162846.0d198104@pumpkin>
From: Itai Handler <itai.handler@gmail.com>
Date: Wed, 23 Sep 2026 18:42:11 +0300
X-Gm-Features: AclHuK9w5roNsxyARXB-UwcciSSDhgydoszkxBjNj6J6hb6GTuZZRPklA1vjXqU
Message-ID: <CAFpOueRECZx=9XOniAAKQNDJGJ_s1FXLAOA+FeMhBNJK=aJzmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
To: David Laight <david.laight.linux@gmail.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Eric Biggers <ebiggers@kernel.org>, 
	Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:28=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:

> And you really better do 4k aligned 4k writes.
> Otherwise performance and device lifetime are likely to suffer badly.

Agreed. My point about the 512-byte logical/atomic unit was only about
what the device guarantees, not about what I/O size should normally be
used.

In particular, I don't think the fact that a device reports 512-byte
logical blocks is a reason to use 512-byte I/O. Filesystems and
applications should still normally issue appropriately aligned 4K (or
larger) I/O where that matches the device's characteristics.

The distinction I was trying to make is between the device's I/O
granularity/performance characteristics and its guaranteed atomic write
unit. The former may well be 4K or larger even when the latter is only
512 bytes (or is not advertised at all).

So I agree with your point, but I don't think it changes the argument
about the dm-crypt sector-size limit: a 4096-byte dm-crypt encryption
sector can already span multiple device-level atomic units, and the
proposed change only increases the maximum size when explicitly
requested.

Thanks,
Itai
