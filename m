Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1195493649
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816556; cv=none; b=Lrp3E6vMzKoDf/4SRZDo9E+6raeEwmCNSAQX5TAR7vx3dE1JNiU996umGSFhAw30/41ZuMqglK7LWL2MKBG3+DkdnrwEZGY+ReouLzQvcnpCo/X/m9eIA4edVUZlBl+vW6k9cbD5S4+1PJoj+hqAedHYv365po5QQSwDYaJOiFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816556; c=relaxed/simple;
	bh=HSaqZ/vs2+B1i4yUCchBv9N9j074kQN43Wfdo51BDR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzwwcYxMScQe/sTWBvYtdDD3FNeIpwM0v+I4O8AhlZdnM/8Z0yDPIBzgeLS+T8VCuKCNtsLnTXLlGOH6gwfTNWZ8b7XvMmYxqUBM/nbvJKg7D9dIBogZPEJCHWT6V96BY+FRI2OTu6zIuuVNmyZ8Aof/g5azmke1emGvyvZB5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPZPQl7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPZPQl7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94451F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791816555;
	bh=HSaqZ/vs2+B1i4yUCchBv9N9j074kQN43Wfdo51BDR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZPZPQl7NvfqRwodKtoxsYDEEQHsp56Kws6ml4P1Q8+nS/hrE9HZZ7AqHg/e+WXsG9
	 DKRVTolyVopvHMErEpbl0xCbJfKSCn6JvNdWNVpTg03Pa47q9Esd9p1HLO5V0s/C4L
	 POvps5/JJ/y7jrxQFag3HBQ4wVR2M5lu6Jz8B1wz3MZXIuhwoqWXMHKeh6toUFQdS/
	 ViBh9KRG9cWJrYDAhVqJN/kBCgj52oCGSnly9JhtKx0DBPHHrhN+Wc+zIj654HPZ2S
	 8ITdrEc1tfslVRPgdbMKY+ZMFCEVx+RAXNzCMUJxJImuNSrgnb1hbcom3+KaK2ZXC+
	 tYpqgZsAg/KIQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcd17f3a93so1640666e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:49:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuhfUBbeIQLv5frhRWDiEnwpWwfkzrGCOWuRyOZ0cXMeaRDJPd5lYZkf3KYfr3dkvZ4T5NRtZzRkE1mCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL74vDuS9zKCWgbtA9MiQqw/YJ8K+cVLUVhy39kJXjRfQ/9VY2
	GOwGbkOP+EeZWm7NL0XgKk2aMYIB9AvQChEb+wacnb7kgTRvLUhOPFHXC9mB2eNy2NHwmHSLYeN
	4KYNQiozuYRpGbxbduQbpMTtihPIDBcg=
X-Received: by 2002:a05:6512:1302:b0:5b9:8480:88b0 with SMTP id
 2adb3069b0e04-5bcde6cd81emr3590336e87.46.1791816554296; Mon, 12 Oct 2026
 07:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922121058.972734-2-maobibo@loongson.cn> <10bd45f8-2d37-42f0-b7d2-a4a84933c9b3@loongson.cn>
 <CAAhV-H40TW01vpaNSDgm86DVM4Mwf0sUvnAt2KEwUB=pPFhhqw@mail.gmail.com>
In-Reply-To: <CAAhV-H40TW01vpaNSDgm86DVM4Mwf0sUvnAt2KEwUB=pPFhhqw@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 16:47:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gpFDaS8sLdDBbS4tU-F7fKPKOkXtb7nqjfNhagEB_Cgw@mail.gmail.com>
X-Gm-Features: AclHuK_yh6nJbDMby3wJpiRQ5ov-r1gjRQklEy0qVxrWW-6ieFaflZzFuZVP5uI
Message-ID: <CAJZ5v0gpFDaS8sLdDBbS4tU-F7fKPKOkXtb7nqjfNhagEB_Cgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ACPICA: actbl2.h: Add bit constants of the Flags
 field in the IOVT IOMMU structure
To: Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, lenb@kernel.org, 
	linux-kernel@vger.kernel.org, lixianglai@loongson.cn, 
	loongarch@lists.linux.dev, maciej.wieczor-retman@intel.com, 
	pawel.chmielewski@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:21=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Oct 12, 2026 at 3:16=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wr=
ote:
> >
> > This change is already merged in acpica tree.
> >
> > slightly ping.
> I will merge the last three patches once the acpica changes are synced
> to git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git.

I've applied the $subject patch as 7.4 material.

When it propagates to linux-next, I can expose it on an immutable
branch if that helps, in which case please let me know.

Thanks!
