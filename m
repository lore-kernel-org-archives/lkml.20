Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031848032B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559893; cv=none; b=dwLyrglqDzkRQHKRZabi7AwOoBgql42RMELeXwYG6pOHKCXHbDoPt29xEynvxty7eZ28qRM/+XoU+zqsd1bmQW2Fp7j/xUJkhkCnoJaY2vqIBfmUhV8gUnm1xPE3Ijd54h3XnsW045nzlBKX6akID0hxvLixjJoCIGpWUji8XF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559893; c=relaxed/simple;
	bh=1b5IkJoNffLNTcHK5eEyWPmmhz8cM322OHvWwYYq7Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V94yP0wyXd81QlLDNlmJV9fFkmDZTg3SGIA3ugsaXtIM/kdG08A4VjdCwfEO8ZnOS1LAX5e9MmklOvg1ND0LsDq5b9WMm59Y7nqPFTeru7IBo9DeMTUjSDWDNIFNBKbYSzN/5LnWHfdbf/vfvdyM1SjKAL7ucZ0sia44HAUWkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4I0zDOT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4I0zDOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266D41F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789559876;
	bh=KujlVaCSbOFVpQJGydiG98d9vhYtyj2W01/TJlHn9yg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d4I0zDOTQsxGCxGe+Gj9yxBg49qxLokWwTmLcL94jhA8JEfhtcaGUKfCTl2f8SfwN
	 X00+Uwd8c78eD1eYX0ZkxENn8zwI9UkXN14hAEn95A9z99lhBPqIjhBKETqI4ZIhEu
	 p+OWDEsGMGTE1SLfW52ilbcY2jDXDBWBnc/HqLvUV59XgOfGo0aV0Lt9oPZUFRQO1G
	 fwYHKJsucgDlAT6skbYbt4/u6vegaQH+g5+wzQmpqxGL274onpJE1aN9EMTirhuCh/
	 MRZTH98uRJ+Oyl14xPDk6xfEyK8QnS+LiIObPw76YN7BaDmKdLfVvtjFMqSnX2uczp
	 dEWfPxtXlwquA==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c2so111029166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFav+2AfsYWw2ptAamTItD4bIMVONyLRsP1SmGePRQQurA/BuFCcqHwt4c5LzqqrQLrzs02AA62TD1OQA=@vger.kernel.org
X-Gm-Message-State: AFuF++khP5B7ltMrNgfCRbud8WFEOBRBF5W+IrIci8FEikQPxbIaciuy
	PSJdGRF2zTB3qpvYAIYnu+KkYg5KzuqNlc3sOm+4VaqcKM6oj1Dp53OVqxz/ja9YLr8OTE+4gw8
	MdMZKHddeZN7mQLCMbPZ4aJcb8dGpOwA=
X-Received: by 2002:a17:907:94c5:b0:c29:5215:b2d8 with SMTP id
 a640c23a62f3a-c29e530ccf6mr280198566b.14.1789559874829; Wed, 16 Sep 2026
 04:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915023820.621797-1-zenghongling@kylinos.cn>
In-Reply-To: <20260915023820.621797-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 16 Sep 2026 20:57:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Pz0WCKNyOdoxKyfgE_rx7GVDRmtidfjsx-x0C-AA1RA@mail.gmail.com>
X-Gm-Features: AcwNN1WULIFTp6R8sjn0tQ0ZsUhm_4J-8393BEYM0F8CmyaUKsd89vQ6s7tZ-w8
Message-ID: <CAKYAXd-Pz0WCKNyOdoxKyfgE_rx7GVDRmtidfjsx-x0C-AA1RA@mail.gmail.com>
Subject: Re: [PATCH v3] ntfs: mount hibernated volumes read-only regardless of errors=
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:38=E2=80=AFAM Hongling Zeng <zenghongling@kylino=
s.cn> wrote:
>
> The hibernation check in load_system_files() only converts the
> superblock to read-only under errors=3Dremount-ro.  With the default
> errors=3Dcontinue (and with errors=3Dpanic), a hibernated volume is
> mounted read-write and the mount-time $LogFile emptying writes to it,
> although a hibernated volume must not be written to at all.
>
> Drop the on_errors term so that a hibernated volume, or a volume whose
> hibernation state cannot be determined, always mounts read-only.
> NVolErrors() is still recorded, so ntfs_reconfigure() keeps refusing
> remounts to read-write, and the $LogFile emptying is skipped by its
> !sb_rdonly() check.
>
> Also change the ntfs_error() calls inside
> check_windows_hibernation_status() to ntfs_warning(): they run before
> SB_RDONLY is set, so errors=3Dpanic could panic there, while the warnings
> preserve diagnostics for already read-only mounts.  The read-only
> fallback message is logged unconditionally: with SB_RDONLY set, or on
> an already read-only mount, ntfs_error() cannot panic, and the reason
> for NVolErrors() stays visible.
errors=3Dpanic can still panic before the read-only fallback.
ntfs_lookup_inode_by_name() and ntfs_iget() in
check_windows_hibernation_status() can call ntfs_error() internally.
