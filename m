Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBF44F0538
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895147; cv=none; b=oO0TgqvAG7IMaFh209zauQp61W4+0ZOzyNeWLpSv9/vawFqPcjL/DJDExF328iEMo9+jlpKHF97cfQkiQ5vReNgmK/CgPAroxNMGyxHM221gZ/FF+Bn24Rd2sjjHPhChRDwo1R+QMioQ75xZmuBRdfQo4bgJhqUJjKFpSjdkFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895147; c=relaxed/simple;
	bh=45VxU6as6rSSf8KS89T03GAuN8yEH/ATCiF2BObyyaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPM6AWtQWWgO10Q6EQu6SNGJrbKKdAvzJOewuItrnDDHNj7cl4u9aJLoZUs/YpXcSy7box7PcnAQSKkFV1ZNLmJdyAmE516eTbiv1Hu8zLfNSqcbVGAId74d8Jnp016Q8ALPwUBajnsoj475YrUTsUws/omBE6K5unDIjhsNaGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnUt/G7P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnUt/G7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4A61F00893
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791895146;
	bh=45VxU6as6rSSf8KS89T03GAuN8yEH/ATCiF2BObyyaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZnUt/G7P8VGX96aC5h8KKRNhSwZJsPxnghkg+b+oqGaCuB7Vhqbrgf+g0Ihcfu4GS
	 nZP+tRaZqgsPOVFARXP2nKP/lF47t0hADQZMZJAQhpaRNR2oyj02NhP9T32rMd9ZiA
	 vBwzocGfKj666esT1d0xTrzNLLw0u/2rFi2a0xrV0RrE+o44F88Ak2gIUVfQNWEFe6
	 nPrtLmZKIDKtQ99MQGTr/v0A4+J7vRiHDSkgetXLakYMgUofGWEjXrYOFvuXdHCJDg
	 2Wgd2BLaQeM5bvO9i8T5PFE8oMphr0lcEdnOLlj9gNzmYg+yDAa76OO/QmMZC2TMVL
	 CGxUT77d8eAZw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e62319cfaso287563866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAEkGZB9UnzZQodAPUOdGS6F/EDKI3ib6lS1v64uyRraMrJxdvSXN4t/7a7LHv+ckeahQSLqROzst7ADI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjI/+NB+bXsFS4ywAtrByLVEk3clxFldfex000GFQaXJTT2c8D
	chpokvtDgvJKa93RSvG7RN0F+TX/5KNyUNfzX9n2nwvpTVfdYVHnqJjm9CQ9eUH5P5jrS1/Y7GH
	vFuC+W4pabtoEGTqXnOHpADChPZn5fgA=
X-Received: by 2002:a17:907:e10d:b0:c33:9fab:5f61 with SMTP id
 a640c23a62f3a-c339fab8f29mr492951166b.29.1791895145229; Tue, 13 Oct 2026
 05:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012031656.3858771-1-charsyam@gmail.com> <20261012112755.1353990-1-charsyam@gmail.com>
In-Reply-To: <20261012112755.1353990-1-charsyam@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 13 Oct 2026 21:38:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_EUB83xcaDKFvRLZXfZtRVJsegDGwe8TMrqb29MZb2Ng@mail.gmail.com>
X-Gm-Features: AclHuK8fHTvrJUyoSVFMnYpyazwL4ywU44XaGJ-nH6xOA7OUElE3cAej4a6-tV8
Message-ID: <CAKYAXd_EUB83xcaDKFvRLZXfZtRVJsegDGwe8TMrqb29MZb2Ng@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: compare streams_interface with mounted volume on remount
To: DaeMyung Kang <charsyam@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:28=E2=80=AFPM DaeMyung Kang <charsyam@gmail.com> =
wrote:
>
> During reconfiguration, fc->s_fs_info points to a newly allocated
> ntfs_volume. It does not contain the mounted volume's stream setting.
> Consequently, a windows mount rejects a remount with the same
> streams_interface=3Dwindows setting, but accepts streams_interface=3Dnone
> without changing the active pathname interface. This also breaks an
> ordinary read-only remount when the existing windows setting is passed
> again, for example from fstab.
>
> Compare the requested setting with the mounted volume instead. Report
> an unsupported change with ntfs_warning() so it does not invoke the
> mounted filesystem's error-handling policy.
>
> Fixes: 2de2cdd9cc08 ("ntfs: add pathname access for named streams")
> Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
Applied it to #ntfs-next.
Thanks!
