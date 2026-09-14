Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4622D876B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352304; cv=pass; b=aE3LCiRr7eOlAOd/gIct5WxhTUERRQUedHaG3AfY6KHHL+QiBF/o3AibnqJf2lefhlaw/dJwjsfYxkGt/4ibO4a2+tHFdyGSgj42uAUuaEE26noKlZfhV8vfuxsodb/MGgf5LIYX/ZHshNjs6dim/Q6Jrpo79iY0BY3OvXViQvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352304; c=relaxed/simple;
	bh=XRzNtKPR6AKm+sBG91uXww4VHhEG5iSLy5tnfi2M7lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWKn/Xq+SOKP82AisYJ4mJcGINpuV1uxZXku7l4YI4s1Mf1TxOMLonaIVw530nvFd438wHKC0RrdDztxokxN624cmKyOTjXigaDLSDSVaz5mtqiEPmtiX/QN4Lwbf2XhHVG0YGK7WyUmLW/0jVYJ9pKLFCzTVdcoV+zzhJNtQtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8rNW4Wi; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8rNW4Wi"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so1684479e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789352300; cv=none;
        d=google.com; s=arc-20260327;
        b=opgzQp3AEOqIegpIbJ6ZvJx3K/ounfwBd22bE0tzQrjY8SOfXsi8SeLsELdLjWx2O7
         /jIu9LpVQBu8WQA7qG1mTR1lhKck8vnY2Qh3BRX1WoORB29FV6cFqmsHOOth58EW2jd2
         ONfZFwUAeusPFs92/N8OJtSx4h4lRmSuL8Q9PKBeN3C++ixvwanHTOVYDo12PgL9xH+x
         wOV0qDrKq7N2Gs7wsUgZbFterP4GYKh/76SvTis3zfWaqLPxQ6GYTaxKPOpuQ6/5K/As
         Ri1vfS8ySDURCKe7A3XSjDwJnWKx1Msn/4ISoOUwY/ZT4uCMEmvZ+a3vLGkNFu03n2OX
         MyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yKvkuA5kghZYj6k0K2bq1InB60nQreojZmTTUXP/Hrk=;
        fh=SsfNBMyAxafwoLepCUjGbj07Lc7+FHfpNTYaot19Bqc=;
        b=ah9o3H4p6af3utUrsVpX2PI/iX5ZSNY2/6tlaE0cYgnZ7aVYPu3f8WSqC4nC17sHT/
         86vBO5ck4C5Bn8y7wneFtBQgT5jTxQL/NyPipyJ8Y7uSYwRnORKAkOU9XVWGcd77CvbP
         S39wQkvWtg4RdFcWD0WiFEx11/xdDD8hU0+e6esQyUYXhTYhIxjj5S/kAFkQmLoCK7uc
         47gdoY6lYe9YJalrqEZ42i00C2NUl04ib66Q4/DewMA+HJOAOH/fuXJX4iWb91pvmFBo
         8CNfUirXDgsRk2x6T2pRoNY67UeFJm7Vfu69ybCGFwuHoPotloCaxHRy28sGScxmlvkm
         vCow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352300; x=1789957100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yKvkuA5kghZYj6k0K2bq1InB60nQreojZmTTUXP/Hrk=;
        b=V8rNW4WiRdHVUWYra7yVHFYk8KAgjTBa47ph9/5xreOKTq9cfLPcKRP+gfYmo7JWsC
         syVUByLfRLNyigdih99PoOsCZYr5HH1RZ1UrD7gPuxkwqE74t471IZLXNAuDDuACG7Dy
         PFE7kyVep3ch16NARUjkH7Rj6fslR2lyM49X1IHL9RQ6H701CZEipE00ymBaEtT7uXg5
         ABFtvrNo0K2FcROAi6Y5w0KHXueLAjTRj/awsvJRpFsWEnG5WAJDA6eDHqnzCMPsq4IX
         F6nH3roc86yAqH7NCYAw/arf5oVQ9o/MMlIDVdQaiJ75618QSG8wjcU4ijfXNYIGuwqc
         6H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352300; x=1789957100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKvkuA5kghZYj6k0K2bq1InB60nQreojZmTTUXP/Hrk=;
        b=Ib9kbePPuzH26+0l8966pzsgk9a8KLbMyECmIiAvuK8fPkl0LmdoaksneVvm1cR4Kq
         I5TJj+S3mNGkyjXTAK/esItBWnVnm4rG55KGXW48XLW5XlbqOd04eoi7933Ypj4iQloZ
         Fot9ydweOdH/lSSzQvyBc4DyYrK/tKYuXn3dtD9kHXvGeUDC2shtoPbbwMUF1jYzLrcc
         hzxvTDx4fQUUrxWdZnLGcd6MKf2EQ2X+EcYyJn+GXg5/c955yglO0wCbR2CFXJdOLbVz
         tOd5g9HEVzb2XWHNaJcTAOxGMSrLHL5pCS1tjYjwrV9yrKieNyg/zSE5icEIkBDxdo54
         f5cA==
X-Forwarded-Encrypted: i=1; AKwUvBw+00T1sNeEDJcc9sL/tby9GDSuRSlwDxTLqBxFFUMgqp1Iqe127MI5LrxmmXhXJylyi7JXRLUvXWKNtBs=@vger.kernel.org
X-Gm-Message-State: AFuF++kr0D5yzgBIn6AdgkB5nbaVcgIeuC1RZs/wX7CbxiFTM2nj2lXe
	ZkTOYFwvtFT5SWwzW7W7xoqsJkKdCHc6jZ6kQHKuFGO2UGtXlUUrDG15ltJvIM2tp0W9xyn6HWd
	/+G6CtyVXVvHm0KeO7MGlYXA/vtzRG0c=
X-Gm-Gg: AYBFou0CPudsgKHbfwV2Cf6I0rdplDDzOnzxpjbPzVgToqsk6nC0+EkRGN/wwD6wZ91
	kCTKnUH1SS5mmEQm8eZ5Gzb36xCkPUP6epZoY10xTohqRTRU0bRVv/22POi4KN7ckct/TEUEfGr
	MafMMMIJngd3rFcBETQWBfSIjBp9bGl7tO2D40E3KWm7P0HSWzz31wn0wSUULS8veedhTyOgCdu
	RRm7fJE9ETlkNM+WBPatCfm+oQQ4miCZk9r3+JWWPLNsR+l+bexIaml7z25YKulRrKY7bq6azIq
	5GJCZ6n+mxMNM3wDVnUPNTwr0G831gJixe9G5J+wSXEb0GiDD46HNY1U5nAoWdLpgPOVGrmyI7m
	QUGS9CUMyJa0RajzxvHXr+HIl
X-Received: by 2002:a05:6512:318a:b0:5b6:421:a8fd with SMTP id
 2adb3069b0e04-5b8ae6b9093mr149563e87.29.1789352300428; Sun, 13 Sep 2026
 19:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-b4-bunzip2-blocksize-fix-v1-1-c7384bbfc954@gmail.com> <20260913190904.bd6811bc8e094047017c67f3@linux-foundation.org>
In-Reply-To: <20260913190904.bd6811bc8e094047017c67f3@linux-foundation.org>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 13 Sep 2026 22:18:07 -0400
X-Gm-Features: AcwNN1VM8XngtNQB-pgIz8uVKeDvAsmMl48FSCAoRIZeQw0QMDqfpxAw9pClylo
Message-ID: <CAEdQ38FOnZPmhc2LYOCXS4sqpi4gqLGnkUMA7EXyDFL_9A=X0w@mail.gmail.com>
Subject: Re: [PATCH] lib/decompress_bunzip2: fix off-by-one in run-length
 bounds check
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Alain Knaff <alain@knaff.lu>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 10:09=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Sat, 12 Sep 2026 14:17:35 -0400 Matt Turner <mattst88@gmail.com> wrote=
:
>
> > The run-length path rejects a block when dbufCount+t equals dbufSize,
> > but the loop that follows writes exactly t bytes starting at dbufCount,
> > so a block that fills the buffer exactly is legal. bzip2 allows it too:
> > its decompressor bounds a block at 100000 * blockSize100k and checks
> > that limit per byte appended. Use > instead of >=3D.
> >
> > bzip2's encoder stops filling a block 19 bytes early, so nothing it
> > produces ever reaches the limit and the bug stays hidden. Compressors
> > that use the full block size do reach it: an lbzip2 -9 image whose bloc=
k
> > ends on a run fails to decode, and a self-extracting kernel built that
> > way does not boot.
> >
> > This code came from busybox, which fixed the same line in 2013 in commi=
t
> > 932e233a491b ("bunzip2: fix off-by-one check").
> >
> >
> > ...
> >
> > -                     if (dbufCount+t >=3D dbufSize)
> > +                     if (dbufCount+t > dbufSize)
>
> Sashiko thinks there's also a potential overflow here which could be
> addressed in this patch.
>
>         https://sashiko.dev/#/patchset/20260912-b4-bunzip2-blocksize-fix-=
v1-1-c7384bbfc954@gmail.com

What's the appropriate flow to/from busybox (from which this code
originates)? Apparently we don't sync from busybox, but do we want to
avoid divergences?
