Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1F3C2D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757112; cv=pass; b=F5WjjrT1dlni9MsCsWflev9djDktkN6v1PRl0jL1g1gcs0+BKyVQC7rpmQprGrMAkRWp3nCsCkHOsdMhNeBy1d/jmytUaM6S9P+4ZMf5fxyWXt/l7dm9NaCGKqDHw4EBgbWkSGwUnUBdFbYrF+MWsgRYV2QKx9vQ30xpYV8NpEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757112; c=relaxed/simple;
	bh=Xhu1PoXJ0oEFkYIjgfgraNQ5H9NNsf5OwiqOjRH5/Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeQKon7usvedrg7Xe0nsuVNQ3yMUB8agBpzO9a88Srq1H3g9HA676zG2Q8Lq76pmDvzrRMbOtGZzD65K2plTtSHtlf6UIN8PvccH708Ng0BtA753nNcFD8ncxBmeezFZb8oI6P4at6mryqlHW6pyV0M7l7CFzURIdwG/rE1toh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ymuee9d5; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ymuee9d5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2637dd37c1so149705366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788757109; cv=none;
        d=google.com; s=arc-20260327;
        b=VVdAK0fgGs4/3h0VXASQuPNr0aUGUErkfeVfjRul7wzf3pB2UPBcq8mrX+566x7KcI
         djLlY8S1WvQxNPvdsr5DyvnibJMzIU7Fho1SRnrMmwnJ9LAVui09egnK1K3Fe57MKMNn
         wQtLT9ze99/69AEDYCEYxZtsWOffe8h+DM6E9QyuYsADZ+/kheibLzAgr8evwo6vrRsy
         vd75k/mQr6jC9XRV4dHwlo/VFHxQm+RKqYj2KC3KfDcuW1RytOsB5ipwk/EEhDPQsjIp
         y+jR6x8FHmn+IK57oahs76LhAuGIYLREj0KLNNVi9uAhZCzomQ1Wr1+yhU7Mo1uka2tH
         /jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tuehE0uxyP8QclAP5St77Z5WsLN49LUO0mMCew4emS4=;
        fh=nAXcpm+3BtFdEUpvZSdNz/1CoKylHmpGeYG+oagdYQQ=;
        b=lcuP7ffCl/Lnwaa9b4/+Rx4JIvHQU/7CYRCnw4C8RRCEGBuq5HKnxRq8PWQrxNcs8B
         YlDjpsBgtXGlbVlGquE/2irStWeOqV0psjfp+FyO6+HnBDsM2tT31Hkj9s/2WVSzz6KC
         EfhC6SAJpE8C1sOEU04NJuZ1WQoGuj7HN6XMDvIxGxD2alrkjHJFU50rcciWZSOfufM8
         9sbedAowuxdRj7P55DOa8iwrYOhOy7W+iAmvE5YXfb6ApYffmzylr+9ONAhH//4N1nUR
         OKUsMQCKdpoO9Z8NwNQQCQdn5GHV+ev1u1pQDwLHxm8mxoXpYlr0D9Ss4oGVFazRk/eX
         8C2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788757109; x=1789361909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuehE0uxyP8QclAP5St77Z5WsLN49LUO0mMCew4emS4=;
        b=Ymuee9d5uB1W65Tj+GKtoOis+iHqcWFP9p7rmOc1d3QX+ylqujLOlNaFMDqIGF90aZ
         6Z/RqOZKf5y/44IBLz77BjsenCYEZgCmtrH6Jxu+Xfx91yIcO5VUiBY5Ux/SqudqKikL
         IFJwQhLAPJVK8VkpOk8fwN/fbsp1fMFRiSXYcDMtMO/R8q4dMWygswPE9A0zVUqegdK4
         sNnIgxRw01EZpyz6KiCPvzilUgrnXT+ldEpa/HXQoITqQzaJZV7KQKx+lVJgJqL2uDcl
         hZANL3ukv0eZId/hh+2+GPWXlrK1OiJlCGIzh66WFfiJ1/ZhekOfxbaA+cCpK0M4AX37
         0yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757109; x=1789361909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuehE0uxyP8QclAP5St77Z5WsLN49LUO0mMCew4emS4=;
        b=fBtVFgZucqMZYyNe0ERrymrGgCT3/Zw0hCanJEHW/xhDGNwrLY7wsJr6W+Mk9DjuQE
         HW1XekEAwCqPW9ShGNlylu0afD/eLxZhWFaIsrb66+flhKgs9zZyThD49eYqBXeuKTWA
         KzbPZJYIoxt0PRb4eEJPUYZqadizS26bPej0lEjEBSsp32fK0yP217n/cbXL9oogVtIz
         I0ME2JzHmXt9W2uldAI5lueAlgsmfe/MI+6dCrZ0OnBMrndztT3W3ZUDZ8797BcvpN82
         FSNLA079zu0uk9Oahkqxj/glZqbnMf5ZfAPQijy+HeLBSmcivNlyc7oD1vPxcDwHFfVg
         sBYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/5CPoED385qp/HUQooCSJg45wXODBCPh8EEeNK2dhjKuOGF1vsEFpiTaJMn8xQJV9USBH99HaQZkLGsI=@vger.kernel.org
X-Gm-Message-State: AFuF++n7WKO47lhWzBY6Blm0dhYJTl7aK7TqbEILCBeQAHh5jsX4IVLx
	VQB6nX/Cz6adTc9/1IEdyPNRvXqzaZM7bSobnm++TVJ20hQQfmDMM1fo3Zwzi8RZ46lIeBvVZal
	u0XKxP7BjSBnClhon41WIRRajmdWHIK4=
X-Gm-Gg: AYBFou2POIikDuwn5oLhyPdVLVV+yPadA3C3Prw2uASCtK9MPZgxLfO1rNomKWgH68K
	gui7SvK5VLIxpfQlIROAcJsolNAC4XNno6w0v269CwEuCznjAEC7AGDuBg7/Ke9h0pwiyE2IGGU
	BedWpp9hReDnv+oiiiQMZ2SZd1BNCpnTH+iZ6sfsIVI/bcGJONf9sNS+dTf7RtuEQxWrh9y2tRk
	OP/izIqZ6tC0yizCxX+74xWQChx7oRn3W4vRqmJwUE4xkp7cbTwip60ONTX/pn9PuvOidXQkzUj
	9x3yB4qPt0AkAfR6OQQ+pR5FCK4xc4V4oYr2M6Cm7dBZd179+XPWOCweE+y0yhnHCupWpEeih6l
	U8FvTob/BJM5h
X-Received: by 2002:a17:906:f591:b0:c20:f529:2d6a with SMTP id
 a640c23a62f3a-c260ca339fdmr717091266b.22.1788757108783; Sun, 06 Sep 2026
 21:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 7 Sep 2026 12:57:52 +0800
X-Gm-Features: AcwNN1WCmWRL6i_U62NrDST-CssECUSdn5YmF0MTFdEu-IgtpYwqDrGnPkSmwFE
Message-ID: <CAMgjq7Cf2ZjkW0JxtHnm06NECHA0+wCXAxd4tkbtCLhC+qA0ZA@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, 
	ljs@kernel.org, ridong.chen@linux.dev, hebaoquan@kylinos.cn, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:29=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted t=
o
> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
> counter can start over.
>
> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
> set the PG_active flag if the rejected folio is planned to be put back to
> the oldest generation. That's fine.
>
> But for those that are not put back to the oldest generation (which can
> be treated as a promotion), we do not clear LRU_REFS_FLAGS, which can
> violate the promotion mechanism. This means the rejected folio enters the
> new generation with stale, inflated tier bits, which can inflate referenc=
e
> counts and distort eviction statistics for these rejected folios.
>
> Fix this by clearing LRU_REFS_FLAGS for rejected folios, and also do some
> measurement. On my 32-core Arm machine, with the memcg limit set to 3G,
> running 'make -j32' to build the kernel showed a small improvement in sys
> time when using either a zram or NVMe swap device (averaged over 2 runs w=
ith
> no significant variance).
>
> zram swap:
>                 w/o patch       w/ patch
> sys time:       1666.5s         1589.5s
>
> NVMe swap:
>                 w/o patch       w/patch
> sys time:       760s            741.5s

Hi Baolin,

Thanks for the patch, it makes sense and I like the idea!

However, I find it interesting that your test setup shows such a
significant benefit with several recent changes when I can't observe a
performance gain on any of my setups. I'm a bit worried this (not only
this patch) might be overfitting into to the kernel build test on
specific setups.

I did try this optimization before and found no gain, maybe it is
somehow tangled with some other recent upstream changes?

For example a few recently landed MGLRU optimizations sped up the ZRAM
kernel build test on your setup, but slowed down many other cases.

I still think this is mergable, but before that, do you have the
LRU_REFS_WIDTH data from your kernel build? Or lru_gen_full output? In
some cases it shrinks to only 1 or 0 bits, leading to very different
performance readings.
