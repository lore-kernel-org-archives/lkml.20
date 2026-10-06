Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F825B0BD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259065; cv=none; b=SxBZ4bbnsP1O8ZIQXEJurJR+TlcxgYCvmifO+yn4T55aZxTzaGKBcfylBcsnvWVXXve9YhuT1YoQ5J+KCe0bAU++2ZcEYm3Lpc2jw4UY/0+QYSXDVo2Yo3f+7zcaUUv1fwRQ/M8SNltGeTOZ8Zg5ehd52bWrwRD1hAtqebHfifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259065; c=relaxed/simple;
	bh=CepQ1UY3OvpU/fObYpcmcmgM7x6E0r3/m1N5k1ZyFLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx99UKny1iybV+OZhyLT3YBhIiyqeWuGH2nphQAWeB5EZS1I2n4uqMtmezYaFXMkMtVeF4V+jQH34lmK60A/UizyUODgzcBBz/TalinbsR2+RgczZi2uOk8gWVEzQ84H5tbPmJ9/p1B2+bDS+xhadaoTuUIZrRtbY2yV49TH8dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imOV/OXo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imOV/OXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28F31F00899
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259064;
	bh=xbWnfVKxCz8v2+OezXZs8ulUdApN0n8P1XBEcvcR7+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=imOV/OXo1dWbMpxDUc8DBZKnnr2lr45GcY9U5GeFVlwbrDfwUZaBC6BlRYeR+N5tr
	 cjrMloPdaP3HRrePBKmGx/FO8/sKRtdSeNpFHm6P4pCf2OCH9iel0+dp/nkVjOBk2e
	 Wt146SnVu0snsMX/iDrwXL/RkqxPXwYvw74xjQK7m09Dppn+TMsBFNYcQhaLWXYlpk
	 kslq7jGX9Atsuot3WNF4oZcuOVSDft17g65mEMqd7o+GmN2c+gdE6sJreaR6lREvrw
	 j9dctXoJOr3ayyO6aoHVOxX22UJwD1PjrO8P2yyQQ3Ely4T46HPbD3FOsh53HQ1bwg
	 fk8xZ0auNJeZA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so351965966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:57:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNJVJDnjBWDgJvRODv88d704aZ/M9JnGtKnxrz4reRZZWGUpEjHb8r6pB4rkNMOU0Um6twFfT9RK9Hi6w=@vger.kernel.org
X-Gm-Message-State: AFuF++mKi0Ec2dRe6QeyD1+9bVF5ERRlqULnwT8Bk/Qww2Y+KbTWuO59
	V8xMnqMx17lVbswIzFL2nfuMeVwg1hSl6O1r9jcdKucwBwVwMKPk1yOoHYwYD4AQ7PY+ZJE0C37
	5x4gEQHO9EU58H7GwnVQ0Nqa6EhWzq6I=
X-Received: by 2002:a17:907:3d92:b0:c2d:ca32:217a with SMTP id
 a640c23a62f3a-c316a01843emr16734666b.33.1791259063248; Mon, 05 Oct 2026
 20:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004101934.1975655-1-chizhiling@163.com> <20261004101934.1975655-4-chizhiling@163.com>
 <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com> <5b101dea-77ef-4ae7-b8d9-54df20b0a6a5@163.com>
In-Reply-To: <5b101dea-77ef-4ae7-b8d9-54df20b0a6a5@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 12:57:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9u3gC=McjgAVABfsd_JPwKWMteJ=t4r0RAnuZ0worupw@mail.gmail.com>
X-Gm-Features: AclHuK8PQcumTHHzXkbvgqEVWIPO2nvLE6U-GuEV5HwJppZbme_vd8KpN2_x4ys
Message-ID: <CAKYAXd9u3gC=McjgAVABfsd_JPwKWMteJ=t4r0RAnuZ0worupw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] exfat: dirty all new pages when extending valid_size
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>, Jiale Yao <yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 7:19=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wro=
te:
>
> On 10/5/26 5:08 PM, Namjae Jeon wrote:
> >> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t s=
tart, loff_t end, int datasync)
> >>   static int exfat_zero_new_range(struct inode *inode, loff_t start, l=
off_t end)
> > Function name and comments no longer seem to match. What do you think
> > about changing them like this?
> >
> > /*
> >   * exfat_prepare_valid_range - populate and dirty folios covering [sta=
rt, end)
> >   *
> >   * Populate missing blocks via the read path, which zero-fills data
> >   * beyond the current valid_size while preserving uptodate blocks.
> >   * Mark entire folios dirty so the newly valid range is written back.
> >   *
> >   * Call before advancing valid_size.
> >   */
>
> Okay, I'll add it to v3.
>
> >
> > And generic/538 test fails with this patch set. Please check if this
> > test failure is reproducible for you as well.
>
> I ran the tests, but I wasn't able to reproduce the failure. Could you
> tell me the block size and cluster size used to reproduce it?
>
> There is also a new failure in generic/551. This failure can be fixed by
> adding inode_dio_wait() to exfat_extend_valid_size(). Jiale's patch
> includes this fix:
>
> https://lore.kernel.org/exfat/20261003093035.532916-4-yaojiale02@163.com/=
T/#u
Okay, generic/538 test passed with this patch.
I will apply this patch and your patch-set.
Thanks!
