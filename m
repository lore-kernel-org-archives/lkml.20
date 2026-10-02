Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4344C2261
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951194; cv=pass; b=Yte6tsmoIREP+yt9g21UhzgAViGsZwu9j9rXiZyvM75UK1e9OwH/6TahPI7cw864Ly+GnFWWG55dCpvcdnqi9Vu0ILDXK+dl42BNX0x6tPiF3bV9XiN85gVQM5MXplW4dIGTk8BAoQM7Vjw53XLx1f6PYdnEyle4p8YDYUF1jGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951194; c=relaxed/simple;
	bh=8omzBxIaPHs4y/ic7pol+xs+OMTn0QiqPBQq8weGQec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1xTqvQQca7N0ypXugLH9UM6yI9lcMCHonk8PS5f8DLJ5YHmKxM/yxQKw5uH8MOv2tzVGeYvgWlYELf2pNv7aTQnZNwy8SWtIwPEP0cNRW+yF/n+JtM6EMjZMEUPa7rgabwQAs7re+q9Jb5MLEPHeWfFHlzND/bQmUjg/ezJrCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZIYcbc0; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZIYcbc0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso2872511a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951190; cv=none;
        d=google.com; s=arc-20260327;
        b=dve9eJbRhsXNluX6CZa4D2X6Br+d5r7f15h1apXYDoK+a1kLUg1u+6ZPUrFlusH5Lt
         PiG5uxRDh95aXNTNVNYspntZ62OJkpcjsVpmRrbe7FY7Fw+GTYGzVPnH2Dcv2vLO6m5H
         U4cEK+CzflEKMiJnKz5EdflcN4TC+eepKYuD+Zn/xJo5/SD/VMyqcYDTAjO81VfTeIeq
         Z4mSZqw/ZYZ2AVvuIY01Q8F5WOZw+YkNFQYeJv4q8QimefmfHHiMcSs3tX8VA5oJ+j/z
         tVPgo0RF+pAqTv0VFmSDkKI28DShwRNETD8TCe+hCTBu6q/fZo9U457kedl5qAZ1xyL9
         SAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8omzBxIaPHs4y/ic7pol+xs+OMTn0QiqPBQq8weGQec=;
        fh=V0iQENmHvWdqAKdL5K9EfgkFe+a5tbvWLaTrH8ozq4M=;
        b=k+dkLp2hwoPzs70sv0Ro9oWP1OFtM7SIxLbok9rBJ21Er/4BLxGHAjNBhnv9/cEx5Z
         4gIzd4YvR14t83kVFHJljULaxA9JKFEzEWPeVfvWz+wVnnyApo2yTP87XYM+eC1IJocS
         mqOaEIDck9OMPPNml9/SlAP3aPJmLQj8bf6NQkWWicL+gD9Kzn619OPb3P1bobXjxXs1
         T68ydwJu/VTnuzh0sTooB+6zz72JWugndVI20yjjLaIUT+LOeZCQ+ctrpyTkz1xhlBB2
         LR5tgA6IaKubyBjKGWZfIKuonDdKYmaIyg7LS9DHkxd1/xfPcbSk0iMFN0y9lJSWEMdc
         IRmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790951190; x=1791555990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8omzBxIaPHs4y/ic7pol+xs+OMTn0QiqPBQq8weGQec=;
        b=PZIYcbc0LCOKczeJweoQC2puPJbubUqaAzf58HP/a2powmiC3KlM+IWKhIAOj8L+Ts
         t4sT7yKQ5YFeDO2FeQLn5If9aBNk7FRgqPEkuWqE388lSsWRmHa+oKSfadyilAyNWxZl
         YJVcW8ypfNimDbln+Bjxa7sA5a6aXo/n3ET4fcbS3i+WeSnApv7AwxFPYaZbTSrP4lJC
         73Tc0FmqPJjd8pCylqz9VzSZhgrFU67xyu9waEgFPmrvlxv8kFO/flllv6ASR1YGwDyL
         b7+MEGN4HFVT9ZhjTzIDWR7stBklTW7TKgE+hSD1Tv1B3L6IlLxAEBoQkBTgS2AOoF9v
         YQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951190; x=1791555990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8omzBxIaPHs4y/ic7pol+xs+OMTn0QiqPBQq8weGQec=;
        b=gVF2iPMDn5My+WYUrjfyNOj6T+/4Zj92Lyx4csfqfqC6gbZQTvkSZtoisbTr0zIQtr
         zPeZ8CYg/JGOukAyXfxfzJ1BdufXqBfK5HK7+Uwb/gVDbxJlrjwPYn6FaNu1ZuG/WkQV
         OgbUgLEvVY89khfotD7tVx2BVc8YEKA0DgSoxwCY/TTR8O602OHDqSY7Oz9jdAg0R+FR
         AgnmXDvlSR/5UCqiGkomtSIfnZG7jlErrNmjOR9R+Ky+N3H644Yx4bFE7IsKjaB6Usx4
         LU3+uU4qrZltG2DNXQng1kz40iGMX9DOT0pdtkjWIeCsuRI3Voh7dltwIW4g3bu3MkjF
         /aaQ==
X-Forwarded-Encrypted: i=1; AKwUvByqta4eZ/B0ezzLc3mS4WTB6C+abFdtfM22FN1HrtPs5nSyOD+wH9Xtc7rsRUYLgt1J3LE5YBWXqscwhAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiQXNY+Euw+K+SU/8wij5PkAV18OuyTLc16QQhaXmVm3t6rZes
	52EBSw2DuE0H3322B3u4iHyM1hFGL1F3l2D0N1o5ePrNtZ/3x5AmnxaPOdMl08fJERWZ2jCWn1z
	1S+d6HGCQMkPPu8Gn/anTSJZD/O0wxbA=
X-Gm-Gg: AYBFou3JSjVWHW6vDAXGUYA8kaH67fF5yMTYmS5oW2iXTC7vd7hA1LqqZrDO2daEoKv
	F7+csewX/FqiIJBnDplY607ks/tiUvouybd0EeZ+jVBpFR87o/Ce3bejY1SSCXG4R46229tDddC
	/e0pH4WQ+CkVvpwKCexWvN3NlowkX67UhM5D1bK439Jndxx1czLZ+Y8Jj5G3fEmgebZQnLl0v3T
	N6Tg5iFkKm6x9MdI1q5RkXYcQhNl27NHTfMepBF6pbJGHi3Gzl0mNm70v8u65D9WqGpOC55Y0ax
	rJG2hNr5kK6cjcThHhBApqFRqOrnNDwxiJZqCGC/X2CmCrTibZhU6tYnFA==
X-Received: by 2002:a05:6402:3448:b0:6ab:18d:553e with SMTP id
 4fb4d7f45d1cf-6ae307fc2aamr3778893a12.7.1790951190378; Fri, 02 Oct 2026
 07:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-work-mount-fixes-4-v1-0-dd44b89d44ce@kernel.org> <20261002-work-mount-fixes-4-v1-16-dd44b89d44ce@kernel.org>
In-Reply-To: <20261002-work-mount-fixes-4-v1-16-dd44b89d44ce@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 2 Oct 2026 16:26:19 +0200
X-Gm-Features: AclHuK9Z16udPk3oh0sLXTcta0Bo8aFfXZ1FbZojqYzXzTAAqgvE-FwFTndyA9k
Message-ID: <CAOQ4uxh9O4-sUpN5mT-GHriGQ26R_n++mELNh3wOPKSrMYDSRQ@mail.gmail.com>
Subject: Re: [PATCH 16/21] fsnotify: let a filesystem refuse marks on its objects
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	Jeff Layton <jlayton@kernel.org>, Jann Horn <jannh@google.com>, Neil Brown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 3:54=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> Don't let nullfs be watched. fanotify refuses mount and filesystem marks
> on SB_NOUSER superblocks but inode marks of inotify, fanotify and
> dnotify go through. The one inode of knullfs is the root of every
> kernel thread and the following patches make it reachable from
> userspace as the directory that stands in for an unmounted mount. A
> watch placed through one such directory would report the opens through
> all the others, across users.
>
> Add FS_DISALLOW_NOTIFY next to FS_DISALLOW_NOTIFY_PERM, refuse a mark on
> any object of such a filesystem in fsnotify_add_mark_list() where every
> backend ends up and set it for nullfs. There's nothing to watch on a
> permanently empty and immutable filesystem.
>

I don't particularly mind this custom opt-out, but
shall we perhaps instead deny marks on SB_NOUSER directories?
IIRC, we already wanted to deny marks on any SB_NOUSER, but then
it turned out that some users set inotify watches on pipes, so we stepped
back and restricted SB_NOUSER only for fs/mount marks.
I think that the same logic extends well also for directories, because
I don't think that any existing SB_NOUSER fs is supposed to be
exposing them atm, so no regressions are to be expected.

Thanks,
Amir.
