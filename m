Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCEB2BE053
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324688; cv=none; b=qTB71vCmIGjJw5XQtI19llNoXrQsmfwbjWWBaXp2dp/2trv3maJxSKIrwr3QQqu4+70V3ugu4fVyLx+CxucJMfL98a4CwPvvRZCnFo259G61jcZAsT7kmjAwUGy5hilwSt7+v4NJesIzHX8KaOU9sIcVq/3E1Vcs+KETXji3LGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324688; c=relaxed/simple;
	bh=ejk0JJWqe1cF/EYmHaHgslQqmM69yyX4ksUuMQWX8UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7xXZbNVfBf9ApwZFTKcbHBN25OjBxPXhJpw3qD/L2rDqi37cPkiDOYa/zjQSrP49Ix3uHnrMQYobJjEqasss8ZsNtvDfJI26X65WIXYZlpkTtdrfIKWEW8cC1b9Cb/VnZ6BjkS5uYVUFfhbxOl6rNxciCEirDNzbx95/XfiBSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CM/fRBb/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CM/fRBb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323A51F000E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788324687;
	bh=8WEgQIgSKzPLNoud5uFAEFlpKrFvZNoW0X2DCeY/nbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CM/fRBb/OSkplh+zU8SEtnRYpFBugfWCO9AeMStUD8L53234v9krxnDEUhXwmBWev
	 2hMaGQ008lrCc+TN8wdJqixNTCc6Mq7hD9AnRoxdcO1jLalwqf0gQV+JnwDI+dGfOC
	 ccG55f5ChKc7heIuvJw5TtK/D7IewHb+YJhWZlgX+UHdCdOk4ed1YuA6Oy56qyUbMz
	 KMAXTJcKUGKdIWFFRT2XEydbj4sbVUTRDWFqcBi+leb9k6/fTe6IT0ci0kdDPDl/NJ
	 ojrvPcmiz3l48Tm9MAmru5ZCVSepaOSR0ldJRHECxmbe0IBPZpm+TNnL8gLbGCM3K5
	 BHD5yBY0l1Vgg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2531f453eeso72213966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:51:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoeB3qm6KIseFhu1iHtJELKx3yjvEGazbEMfZjltZhGhFL9ikGyYucnFPCVQDbb9pbtvqH5ZrCJ/VtEPJo=@vger.kernel.org
X-Gm-Message-State: AFuF++mcNtxFQl36XXy7FNLTHlStG5IeflIBvEU4eBrVqmFYGjpg58S4
	A7JUzq21+Fo/n4G7sG7QAoAbBvmwRQRMv8+B6hgWIqFYLLeJwIyCZbKf9f0pQjebHUuovZPVgOo
	Pd0kzJCKF6eOFG7UWLWKONZV9OZcClBE=
X-Received: by 2002:a17:907:6d1c:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c25d53bb71dmr116762966b.2.1788324685811; Tue, 01 Sep 2026
 21:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609021157.8f7Wx34I-lkp@intel.com>
In-Reply-To: <202609021157.8f7Wx34I-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 2 Sep 2026 13:51:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_i-C-D8Zr87aYVbfTdiORhzB3AJfPoUt2DUgq9ZP-ToQ@mail.gmail.com>
X-Gm-Features: AcwNN1Ud_J0aThJQAxYtOto2b3SEXDZBp3UjM4KodxGMFLE33Jf_ZZ4NhqNgLIk
Message-ID: <CAKYAXd_i-C-D8Zr87aYVbfTdiORhzB3AJfPoUt2DUgq9ZP-ToQ@mail.gmail.com>
Subject: Re: vfs_cache.c:undefined reference to `__xchg_called_with_bad_pointer'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:53=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   89a312991dc6e638a36adc43ccb91dbc25504c04
> commit: d12168084c8c1b6d883c8eca5853929ac5136a9e ksmbd: safely drain sess=
ions during logoff
> date:   2 days ago
> config: sparc-randconfig-r052-20260902 (https://download.01.org/0day-ci/a=
rchive/20260902/202609021157.8f7Wx34I-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260902/202609021157.8f7Wx34I-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: d12168084c8c ("ksmbd: safely drain sessions during logoff")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609021157.8f7Wx34I-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `__close_file_t=
able_ids':
> >> vfs_cache.c:(.text+0x175c): undefined reference to `__xchg_called_with=
_bad_pointer'
> >> sparc-linux-ld: vfs_cache.c:(.text+0x17e0): undefined reference to `__=
xchg_called_with_bad_pointer'
>    sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `ksmbd_close_di=
sconnected_durable_delete_on_close':
>    vfs_cache.c:(.text+0x1fc0): undefined reference to `__xchg_called_with=
_bad_pointer'
>    sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `ksmbd_wake_ses=
sion_blocked_works':
>    vfs_cache.c:(.text+0x2104): undefined reference to `__xchg_called_with=
_bad_pointer'
>    sparc-linux-ld: fs/smb/server/vfs_cache.o: in function `ksmbd_close_fd=
':
>    vfs_cache.c:(.text+0x21f0): undefined reference to `__xchg_called_with=
_bad_pointer'
>    sparc-linux-ld: fs/smb/server/vfs_cache.o:vfs_cache.c:(.text+0x2b84): =
more undefined references to `__xchg_called_with_bad_pointer' follow
I will fix it.
Thanks for the report!
