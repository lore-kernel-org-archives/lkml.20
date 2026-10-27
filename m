Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094673;
	b=TCEUy9aLPMdnX1H+np79zaNtO6S8GxOx6t7W7Mm5wauOuSbTOApJ8jf3Fh38wWaWMQJu
	 o5DdCkUiyR2xwd7WjRg5hnNWw6uz1mTTykA34I2iXil3FywdSTGRRMJeNmOqGkl14oFfx
	 0UK69s5Fu2juT6U7QsrQRup1vNA1aYbnfkeFEU2xQAgj4jZLfGgw2n82gL9D2cFrLKzjZ
	 C85nJLp3BGw5Pk2m797RG4jWcWD7kT5XJ4NlIAfOKkN/ZC4sdrr7+Oc0jiK+B6mZEfmIG
	 gvfxFiCMLfXDA+We8JDS/DYwN7NGm92SDUYyoDSf/5QZhx2i2U3qnNDh8B7a5QEHutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094673;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/Iui7zPu8QJA3RmxnGQty59dKNObjBKm8upySczrz4Q=;
	b=owKQLobapMNkuRz8IZQHv3D7ah1YdwNOZD6wU8dLOU+QUwNtrIqJpecn0a9RNHvudIjc
	 CWvDbxnS2eWCirGMhUNUtzvYUBvrHfwNWLU15y69Co+ckHuRY+aGFmiS4hcII+vkQcZCA
	 ig7f8Ks7OqKJllAzNvOY9ePfBKfPuiN+cAg5PClxERxo4PLPfq05CG5GqfDje0QIrEwEz
	 UozoCqxIkeZ381I2GDz4wM0gpYVetWmcezZUK86mn00/SCpJGVD9NrvWicTHcli+mAqH5
	 PNJGESl9juKjdTaKbpLpzdGbEMcjfAwtYe0JAhpm8fwn1mBD4wOl6OjkL7PaswRzfPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VioNUpK/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VioNUpK/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D04E1F031EF
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094672;
	bh=/Iui7zPu8QJA3RmxnGQty59dKNObjBKm8upySczrz4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VioNUpK/J5UmltJNCQOJ2haIDjRswQMIRtBqtnld16byc5fxifBNY4w4YWQTjHMri
	 +GF3mlNLA5eaRmBa0lvBIsV2dZiuBelvPsS6sXuzamJSGXhjbQDW9HHhKTf0aZ94pw
	 j6VogmSO7ejmBVuSn9vgFBYyhWROuVtMNcjw4awLErISZ1dHnbc6UIQ9TboT2SJZp2
	 sLeMb8Sy5ST3GHrP7C0sgXUpG/CocjpzW74HnAsW0YPspjOSRqO1jlOcSyhtOx9dxT
	 oNNAjKQw2nwO+u8yqDN1+CXgtO/nUvuLa39wFTRKte22kmqqwQ/aaOpsdQbO1tg+lI
	 bpZRecEwIgNfw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-677dbe051d4so3402448d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:51:12 -0700 (PDT)
X-Gm-Message-State: AFq9FYJGp1npOxnpmr2ok2sT1PNa64ltApHEK/zOQlxI4oJ/mQYEdDrX
	lRDKXiM8jEyt3mVTSgh3hKZpJrfP6HEodusgbAphi2FmccG+LYyHvROUyDRr+MGRhY6YRHrOhJH
	BPOfQ3DwCDuLUUrE/Puo2n4RD0w8nKJI=
X-Received: by 2002:a05:690e:b82:b0:66d:28d7:c33b with SMTP id
 956f58d0204a3-67a6c56e468mr1319238d50.40.1793094671748; Tue, 27 Oct 2026
 02:51:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027054740.1148201-1-chizhiling@163.com>
In-Reply-To: <20261027054740.1148201-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 18:50:57 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-W3xJqhcCdGmPvfmdVjsd5Y4BtUq3rDAwLHPodFMaP_g@mail.gmail.com>
X-Gm-Features: AclHuK_akNj_NgVMQhdJeP82brdHyOSpzi_QEGSFy-4Pi_aOTIgOVcfj-Zrgaxc
Message-ID: <CAKYAXd-W3xJqhcCdGmPvfmdVjsd5Y4BtUq3rDAwLHPodFMaP_g@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: drain dirty pages after forced shutdown
To: Chi Zhiling <chizhiling@163.com>
Cc: linux-kernel@vger.kernel.org, exfat@lists.linux.dev, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:47=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> A forced shutdown sets EXFAT_FLAGS_SHUTDOWN, after which
> exfat_writepages() returns -EIO.  Pages dirtied before the shutdown can
> then never be written back, so a writer throttled in
> balance_dirty_pages() while extending valid_size sleeps forever.
>
> Stuck stack:
>   balance_dirty_pages+0x4f0/0xb40
>   exfat_prepare_valid_range+0x43/0x140
>   exfat_file_write_iter+0x413/0x520
>   iter_file_splice_write+0x32d/0x5a0
>   direct_splice_actor+0x51/0x270
>   splice_direct_to_actor+0xf5/0x270
>   do_splice_direct+0x76/0xc0
>   vfs_copy_file_range+0x244/0x710
>   __do_sys_copy_file_range+0xe6/0x240
>   do_syscall_64+0x106/0x5f0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Do not reject writeback up front.  Reject it per folio from
> ->writeback_range() instead: iomap then ends writeback and clears the
> dirty state without issuing I/O, which lets the dirty limits drain and
> unblocks the writer.
>
> Write syscalls and page faults are still rejected in
> exfat_file_write_iter() and exfat_page_mkwrite().  A write that is
> already in progress may continue to dirty folios; writeback retires
> them without I/O as described above.
>
> Fixes: f761fcdd289d0 ("exfat: Implement sops->shutdown and ioctl")
> Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
Applied it to #dev.
Thanks!
