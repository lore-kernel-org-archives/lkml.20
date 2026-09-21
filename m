Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F16E33F8B4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985710; cv=pass; b=pJ7SYYePG+izkTTpOCo2lOjGWCpBPqwfx8dEzBTwDAglmk+C9Z5KIFGRLRADOUC1E/jVh5g17rwv8rizSN+cTk+Nnk+/aJkdXaIwCsaEcL5gOjReeML73gWTd9sZYM9/xIFLrlDlG53BK2NjmXvMU5PnlyGTYVO50o4lIfZkSYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985710; c=relaxed/simple;
	bh=cXWnRzHT+g9cmiFs8MOXnDEGP2sDTVQKaPvmvaWRkxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUubRXkjUur7EVINSD7KiVDKY5SCmjIo2IZDG1YFHwHE4XPO7iBBweJJ9umQOXOoASoqugIR8oIqhvpmfNDaAdF7WG5yu2/pyw3YDvGpQJwO/8mrNl1uJtdstqF/QcEQMTxpNGmYhpIwzWvhDdVze7nQdCIaVOpYL9B/J5IVfas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzf2I0IK; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzf2I0IK"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so4227508a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789985707; cv=none;
        d=google.com; s=arc-20260327;
        b=Eu1y/rYRXX1dIjaDjJGDm63w2fw7riRqj9FuFN93OH4yCpznBfMkG7vDuCguE0tKRz
         3dV8ue02wMt6/VxHDibguegnRABKwL7VX3ZlCTtroIgL0H/Uu3QMok3jkRUNWcfjf7ny
         gBUQKMpWMM8/65r3ByuRFlK+/jVWcitP3cFhWAqt/6r0jvUPkPyEIta26zoLOWVelwop
         0k2wfm77LzGc05YwMCfjBKye0ncLhrZOYmO5Xrtpxu8pe8NfxipRuKFtTUra7hK8Npki
         c7KzUc00i3Hvn78J8jXZV9lmCw49ON6LSFg3yfggULuIO5YniT36PLdJXkxWt/qFMNX6
         ofAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXWnRzHT+g9cmiFs8MOXnDEGP2sDTVQKaPvmvaWRkxw=;
        fh=4qN8gzdrTRp5tkJ7KK1rpmEJarnU6VKxcEWEiZZ6VgM=;
        b=h9Yjwf7BYPw0fF7UGR/RqgfDQncyahrxt1zqj9oW2a7qIoQwHRWdrh7ezNYAiFDPQN
         9l7VEHKS1Q/FiXtWz2SjJgE0q+fpm6SI35PKqVgGrOvE0sd1FJVAhQXMdxzg31dWam76
         jZ5oYZpVHRuCfDg7MC+FSDH9K2oW6/5JmP8Vb1TbGQA807IWE5Q30vWDe2HBnkOUcNTp
         ygnOjpx1ggKNfHzcQvESDNmG3/g0ZcSn/mRuFMDw1HwgCIC5oVggN0W4ipI/e9gxYECP
         g+fYuy6vllz7Adqrra4zxrK5yI7Wkb/UmGrkSJc7GR0QxtyIduL8n+ssCYwkhYkMqjTk
         b+nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789985707; x=1790590507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXWnRzHT+g9cmiFs8MOXnDEGP2sDTVQKaPvmvaWRkxw=;
        b=mzf2I0IK/FI0cVR42lXbskZ4uAeJ6K5lEXbJyWI89ImQarSzKQBlgExSDGbLfe+HXb
         6J9hylJh/x8rcAh19WeWYU/QgL2DkKMvhBWVf7qjmII8GFsN7PT1Ugoo9xtnW3hhI0br
         fcQh57Z5ci6kSHh5XJit5Q000EocrhepNP0JI3hOMr20CvvuZ1RLs0sxtlPqAeTU9L6J
         qpmZ+5JlhakvvZj23crA+QqS7T2K68NVxBQYdsA+05vAQq7Vu5PaPspwqIw8mmoDmzu0
         DIJJsK77ZeCLzXDG1y2agABoO/+HRH7FPWmi6z5FsMAEbo+87BdVAgfo/xjDYQAIDE76
         fLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789985707; x=1790590507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXWnRzHT+g9cmiFs8MOXnDEGP2sDTVQKaPvmvaWRkxw=;
        b=oMJ+8Mai347BplmhPy/HiUW6kcgAX4K98UAz7clCSCYjxeXsrrk2jHPEsDK4fZkVPt
         palGzrpzq8mSCErKjmj2DhOYVLlI7KEVPUcjTxjsKK30Czp+YLsIx/zrbKOefLfZg2yg
         QggQEJJHf2RMyQD37Ak0TDvL5tWa+ftcI6fhKfRwGKXcxVhFolcEPsiMy50nIxI3i6IU
         U9esnS1geTdg6NNrF/0wl6M3LNCLo2Uaf2t9eP3YjMbLAZE7AGAt/iV7Ys7z+5eO/JQb
         KSZbmh3H6tQ1oW3X3bqz4QOLLb8SAzbh6pMjZby27U73RLdXMPZqdGoPMPyIRFOydDOb
         6UcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPdOX0x+dv0mI0zpwOFmsYv9iL0sBXF4+9VIree90+935WHJlmZNxZGAHscoCBo6FQdNQpQI6X0MZ/8B4=@vger.kernel.org
X-Gm-Message-State: AFuF++n5bkrNsQ9RwfdII9+gW5P3/4YW3BO8ecuuEONqOETrMdtSjNKk
	bo3ao+sC4Uexj4q+wELaf18MIS/4lrfEPT07pXzxla36ZiUc12NNTBAhB+Na+W3M2Tr3dSuHKwV
	qHQvF48M1AN8x4cbMDsLAzvwyBQjRIQ==
X-Gm-Gg: AYBFou0VX5B7nlsRA7zilVpVNu6Rz3I5IM946RP1uMD1C+FYitglvsBKFxpQA9+EH38
	l1DfwpRcEEKzP37cFbhxGg3132RjDy8oaQ9Z+TyJDUx3JJhsu+l5L//SEVVZhjguHUTVnpjDMFU
	Gt0qCURJB5eAJtCeIUUKaSecSP3uWMGnbeLUv3be+5Id6h+oVUC7b2aa+kfxLRjlXKjFzqTA6dK
	d0DCx0n3OWXZcXCd1Pm1iMoO40GQ+GDO71nGh61DL6xZI3fIXeNMahy4X7PmNEHTEpJu0dRKjTV
	sagNtnRRH27WD1pGLuuOC9Ii8A5aKHOtp34Dj6gCQpzZCmW/g35qof4DWQUhVDAI7e83W9ovw+K
	WqFvVFBTvuChncHfHHk1+Hm2FncH2O3Rm+4xTv3hHAKlJ8XibyyGLXXJOJKRBhLZSTg==
X-Received: by 2002:a17:907:6d27:b0:c25:4f7c:8ec5 with SMTP id
 a640c23a62f3a-c2a158032f4mr915252566b.23.1789985706566; Mon, 21 Sep 2026
 03:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3c1598eaff225a155cdec5e92d5c97fbfc6c00fd.1789724312.git.med08elkadiri@gmail.com>
 <arDhf-LH0ZAxsd5V@tiehlicka>
In-Reply-To: <arDhf-LH0ZAxsd5V@tiehlicka>
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Date: Mon, 21 Sep 2026 10:14:55 +0000
X-Gm-Features: AcwNN1VMPCErRyQzCgZI9ldC_hs8iL3BoMfZTPkjzOYctfo1Ss6NPr8aBlYsdfs
Message-ID: <CAAMeuQRQz7UhoxiOdcRpZ9MNVtrX6z8XcXYijKAvw1yB4AgPhg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/page_alloc: enforce upper bound on min_free_kbytes
 sysctl write
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+c61d6962d0b7e698439e@syzkaller.appspotmail.com, sj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 7:49=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
> This is an admin only interface and we assume whoever has access can
> realize consequences of the set value. Auto-tuning really cannot make
> any judgment call so it needs a cap. The same doens't hold for the
> admin.
[...]
> There is nothing really to fix.

Thanks for the explanation. This is a useful lesson for future syzbot
reports that need root. I'll drop this patch.

Thanks,
Mohammed
