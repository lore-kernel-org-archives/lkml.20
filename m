Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7E39C637
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133886; cv=pass; b=EsfWu3Cuoq1pAs6JVFco73056sKKN1WsWys0U2BJfeqtazo+bQj/8whCiYwQMZZ81GnuC18pIrSR4zanHprJmtd1G1NcIsigyy6BVs6Z6RpeQ0H/wrNqaRI79WQPy5JiUGCkrE/RRWSXHRN1QbQR3I9rUbbvsVOF0fcY8hl2ce4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133886; c=relaxed/simple;
	bh=U76ebMoSyTQsuVPgYGLotffYpp8DopeIDr7nhIKrbho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fREgAsIskz8V/KwJJ8PYxhommmUEGKUND0ItYliOC3h3XbMT45aI7Ks46iwgqDVVLIuRb8kcRIDT7JmOj+0r2nc0EH3HpbavHVFnBivWpmC0FjszSJSzdR79t/tPM6y3cRVwRixB7mW6lB/7ZPpiMT68WNmCU1xLgLhzZRsSzQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BugadP+j; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BugadP+j"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3564435a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792133883; cv=none;
        d=google.com; s=arc-20260327;
        b=lo+VSrj7Ym6Efvec10HMSms0Eifd+3DC37W+5NTjdjylQ/VQLwDyo2mVWTHNV/AKUf
         VkOx53yn/Q57I4eGU4So72XWb1FltRh+8739+trO5VR+vBtwu3DJxU34vvf3WE5N/8fr
         DXLXDqCTF7i/uBLo59x4nvIv/4GdmcrXQ36TaPx8NjjFH/FyKLW5Yt9ZDZQVxiX31h6e
         QOU6WL+1c1WCN0WXgVfiD1HD0qhkuGrLPUzPpTooy6EQRwfkqAbOOK+eu3Taq+3iOMbm
         sSUMcZtZWRX2/xlGixG6yM+AK7yzO9TUrk4X6Ci3Dlf3p7K7HoZHDMf4VdZEm11D1O8q
         a4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SLmKggqak5/Dj+cuhyZUgxKGUgEOUrXFwflmJJiDsks=;
        fh=+xEJjP4epfL2K9jDh5KyKZ09wm7LrV96k+NcSqzwMSQ=;
        b=mKfWEAljWc79Bb4vkGTd72HCpzjGXZBntoKExH07rCLqL7jdqX8tjml0eH5iM5BQO5
         GfXYJnvLOHQfb4pRaNL7qc8v+5Ga8gJmg71UttkniemPRI9hoHMXM5nXuqzwB4gFDB5r
         3KDbP2htVMB3+sVYBi76W30JcOBmitr7YqyNhUd/Z1Ks6sbYjZibZpuEp5Uaa5h35Iro
         V9mKGe0x/GKorjBJeqLORXP14dGatl0Xi+82lws7q7ANJpHGYqcPF292jHx7TgmmCD1m
         F5mONZ9e2o3VkJ1pHY1tT1L8jjY56R5CEd3tWT5lxHTEdfbtbbF1Ur4O5kbUD8sKcoxm
         efrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792133883; x=1792738683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLmKggqak5/Dj+cuhyZUgxKGUgEOUrXFwflmJJiDsks=;
        b=BugadP+jf8T/v67A/JZWzdLRyW4AdJANwF79NplWKBXhKgdrT0gT+DKp9Nc96q0g4i
         7SsTwmyUVBckHll0pINvBD6Kk9lE3rYk41B1Rc8/pVVxuxfXEP7T3Hgqd6K35uebzOeU
         ftYZo+a8UHNm5Dmj/4/QMnDbLDbaybFVxQxqNjUy9h47XJ1LW8b8HtDpiHCcQsRasznw
         cvlaB6v2dNUcYfOotwIvATL72CllhzEMLPQh2wbFjQ9Hf6uILynFO2XQxabhETwzE2+Q
         I8BTsP/VqZk500g3spKzLYEheOgoVX1iywgT4m3F91Nshu00qpYPudpoDlGrwKNA/55H
         JXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133883; x=1792738683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLmKggqak5/Dj+cuhyZUgxKGUgEOUrXFwflmJJiDsks=;
        b=rihocfBvEpknDZ9fFX0hHl7gEogd+WoIgFgVSc2h4/qC/14JQbOP9Ki60MpTd8mnEr
         CypzGqycZ58DHdeDGA8oOcX7Ibhzl9QmhUUU7XcqkIJDo0Q7fHWM2TLZJaYu2h4w1Fmq
         yylGRlbJijXxCaEoYKAcAQWTQsswqgwBbRYg55nb/3xQHklaDpCFyGYjiG5MVQmw/55g
         vuuHwEHI6QCyBm+aDAy/F5YxyHSZhwWzHSHUHKUi81zqBZsuHCY3/VtqdTMbVFUwO3I9
         YIxI8MmWMFGV/HxICvzykOeDXJHqw3pPmPnwFofgdYPoQg4eMICYCDuvRfKGkQSjsbAm
         oNXw==
X-Forwarded-Encrypted: i=1; AKwUvBzGwt/i1jkqSglGHSshPuqncl+R7rOO6r4OZrrIDyPqVUlMoAJ6QmgDQtJR1esPh1wuIrPCCDlL5nn2xgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJyWBc+sIQozlmNCvxyUpXNKvZWbSabCE4aDfJRS8FKcb94dwR
	mOp58yBI1gyRSmdgrSWNTYWHdKg8D+gnB5vyGj3G9OFQ3ghCCZnV9Up0Qv5+T7U6NiBYVfBaLJN
	fQx5UOFIVgP/7SL1KARosJFJGRRLCLL0=
X-Gm-Gg: AYBFou12Dwbg8xFthyefiHxLMtWAA5cuXznd73+FACAdRdTEsVAR1RPwZamVUbb54Yt
	fhxkZB//PgI71Xpbq81UEQbzChiRAPNMgFjD72+KwjkGmTDNxhG41lAuwSRkaGYqrqzbfvGHyg0
	9yCuW7+Sjd6UuZX2Bx7SpFWNFm8hkdRLfH3RgVqeGUKZOLwRyN4Vzopb2irClkkatSfzpVgnNvV
	kAdY7yDC8+4qcrzaVbAp6KGdK2olUGpk7Ltncoi4eY6plTiKvIqiwwAnd5jT+izUxLh9Q+rGd2F
	iVYPlFPue8yQru29tbDc/WrHqFink0H+AstWCt9j1dif9xI8igEOwNrt
X-Received: by 2002:a05:6402:5006:b0:6ac:fe75:16a with SMTP id
 4fb4d7f45d1cf-6b17c21c293mr17047655a12.1.1792133883273; Thu, 15 Oct 2026
 23:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002223746.3248726-1-neilb@ownmail.net>
In-Reply-To: <20261002223746.3248726-1-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Oct 2026 08:57:50 +0200
X-Gm-Features: AclHuK9MH6B6PzJPsaSzlLYudYyT9yvA5ySybSRksoXyZI_T9lFw0oouAp4jzR8
Message-ID: <CAOQ4uxhkGPc8Wiik61_9-u_Jf=gUx0Z4EDaW1z=FMhx73oE_eQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fixes for dentry lockdep tracking on stacking filesystems
To: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Jeff Layton <jlayton@kernel.org>, 
	Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 12:41=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> The recent addition of lockdep tracking for in-lookup dentries didn't
> take into account the needs of stacking filesystems.  For this we need
> different lock keys for different filesystems in the stack.
>
> Thanks,
> NeilBrown
>
>
>  [PATCH 1/3] VFS: per-fs-type lockdep key for dentry in-lookup locking
>  [PATCH 2/3] VFS: rename lookup_map to dep_map
>  [PATCH 3/3] ovl: provide private lockdep class for dentry->dep_map

Christian,

These are fixed to the series you have staged on vfs-7.4.lookup

Best append them to this branch per PR?

I have added my RVB for the ovl patch.

Thanks,
Amir.
