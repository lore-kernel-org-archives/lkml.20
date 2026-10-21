Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545382;
	b=4ZHWCDB8P9yz/UAQIOp/rBapeejHHwP7TFk+mgsCOitv7sZuXrfU+qAhGSoaeZIXAVlh
	 fts8YZfTmw7JQPpcrSyWlqF9+P5j/U9uGZ87IOzTQo4MzjxkL5Lyb9CsaZNotinCbNpBJ
	 T4I7nURup2bf60coY01zrBiGBOr3YRe4DKtUGP8RYOVYIdMpsjTvPneQJqF/iiMZ0Dwe0
	 esyC7/cueJxqZPz+r+DFrQe7YFtqazJoOj+wo1I3H16WHFNNEouwJiPloZHxB/lq8/TbE
	 LXpRoB7Im03wtr7ddALWX84XagOKZWwfj/oJB8uWVzZm4rB0Z12x3KltykkmzQOJ4Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545382;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C1Zu3q/4M5YlSjRAdHqHcdQCF5W+Ve8rWmucPgH6fQo=;
	b=QTWzey0hggHOXT3WjZ2nIj5fOxcHVDLEU92HOyqSADY6h0c7gdhysiJnaBUzaiKqbXKK
	 z4r6QEViF1NflFm/dpbrEnYa+yf/8KFnbyxrK2DJNG/89hXtnaCKkrhVbzYjFgTHx6mha
	 veRsvm6SjjbJKFcWfYOhIIUMQVPSTC5TVD/YJbV3BBm4qUKkp9ZRzK48QTWhVJ0SB68m+
	 F0YvCJ62i7tNT62AOIGYsfynT/Pwgt0yCzgHxylSvv2pVZXxlccMMeKwYmsGzcts01XM/
	 M48DKsZNspDtYUDhv2PEkfxnzTMhSPJpgNmXnh+YIh2Vci/OcgjqefxOqokCrKypqtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auQXPbrU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D879A60A262C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auQXPbrU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735501F000D2
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792545381;
	bh=C1Zu3q/4M5YlSjRAdHqHcdQCF5W+Ve8rWmucPgH6fQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=auQXPbrU+d46QzeWedty92gQ+SaltsQDpo/cHuW/EfBdR5ovAWkyqbhGuwnAMuOCB
	 Wa17lUnp/5lGrN9vHgFYNDtp21pbY6+Upty4W4/5hVWwI7Qd8jibYcbn2Gi1O/G/o1
	 97/L6Ga1ZqCwr7iew6JG37AkKbEle/vIXynv+gue3Qdy1Q4RJ3vKmK2WMjXdignRJ4
	 o4en5OlJwsyQe4GHmjFik4wCG1ihs2QDiDbMJt3CHeXlWMCzNw1HKU86dxRpe/KAfH
	 zrynH2OiYcTuoWil19SLb8aQGlY+mz+0UXiOYjpK1A4x91M0nJvehtbXZcwNHsyOA1
	 ieUCPZCpbO/kg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so258409a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:16:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxh9icPJOgLodcC9ftLOp7OObaIlocjjbkW/Fb4bsX/Vlv0RfUE8EyKGKSgL9SbP3SqIs5A/wDbe1GGRmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5MQauB10L2YgVXIIUaboACJMSQ62lM64sLvLCRayl++cHo0TK
	ATwrTy0DFp6vFXtDGNA/qh9bnH8POMS9tMKCx1JTPl+57Rpoy1sBhGXNuqi9S9CRqKqTFLHb8/B
	6FTHgfNetRhd+kpILphnSuuqE6o4tGI4=
X-Received: by 2002:a05:6402:d0e:b0:6ac:765e:def2 with SMTP id
 4fb4d7f45d1cf-6b408ee816dmr216752a12.41.1792545380073; Tue, 20 Oct 2026
 18:16:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020190351.9445-1-mike.michalo@gmail.com>
In-Reply-To: <20261020190351.9445-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 21 Oct 2026 10:16:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8Y_+soRjs8s+EupSURydcLoXfwgrrU+LjxYAakzPMbEw@mail.gmail.com>
X-Gm-Features: AclHuK8arYULqtYMW9gfJfd5c06hmRFBXIgTLGP7s0acrXJOvgNIfJ5Q1906mRM
Message-ID: <CAKYAXd8Y_+soRjs8s+EupSURydcLoXfwgrrU+LjxYAakzPMbEw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: reject FILE_ATTRIBUTE_TEMPORARY on directories
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:03=E2=80=AFAM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> Setting FILE_ATTRIBUTE_TEMPORARY on a directory with SMB2 SET_INFO
> (FileBasicInformation) succeeds: ksmbd keeps the attribute and, with
> "store dos attributes" enabled, also writes it to the DOS attribute
> xattr.
>
> MS-FSA (FileBasicInformation) says the request must fail with
> STATUS_INVALID_PARAMETER when FILE_ATTRIBUTE_TEMPORARY is set on a
> directory, and Samba rejects it too. smbtorture's
> smb2.create.dosattr_tmp_dir checks this and fails against ksmbd.
>
> Return -EINVAL, which is sent as STATUS_INVALID_PARAMETER, when a
> directory is asked to become TEMPORARY. Do the check before any
> timestamp is changed, so a rejected request leaves the open file and
> the inode unchanged.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Assisted-by: LLM
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
