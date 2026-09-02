Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D924D343D75
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313483; cv=none; b=bLCkbG95NsIAUuOqi+DulXNb9uLvOQmA0mOK+l0wv9vbUMlp8HAu4CuBVnOJ7cBhcuEP+OtCbFrgxDfSAXxS0YhCbR1dBQk0Z6nisvEOVvt0LCevBnCl/DKfjtD0bq59YlblDf5HD5MqDqmR+0ZZOWx+kXL11yZWwxgYySe3KFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313483; c=relaxed/simple;
	bh=6Tx2jbQpZb4pjjc18kFbL7eRyEbpEfeFJNctoP0lrd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFpgCeK1hLUKGPEVjPqfKA/UvDx9ndZfk64KYq9pFG+mMl1mAmoJbTvnvItBQzx8mte/mkAG3lU5EwxKXWHxvCDGCPACyEJuwkEoY81N9L63PkA/nBWtQS2fdgguscm8nAE1hEbJeUrsLotg4mpiAE3/67PVFNiFhQtGOs4LuqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwSarZ6T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwSarZ6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A0E1F000E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788313469;
	bh=6Tx2jbQpZb4pjjc18kFbL7eRyEbpEfeFJNctoP0lrd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RwSarZ6TK2q8G7a50xbCCalEHEADpCULH21oI/msIafGburrUks1i4hhju9cXpqIl
	 mShZpWti6FHaX9e4MB3NyHl4FCYLV5hbW4C2ZaL8WpZPvtDyJ0ASCb7RVtLd6i3UMo
	 qCKlzMfucjtSRJQ7zt9HSVNfE2q0EmAkulOpaZsKsuPzJF8PMdw459sEcnBW/2i1AA
	 wN2vVJ8ed5lQwlfwL5wFWQQzOEioS+ef+Kg3ZsG1/lMxMOLpttXliT43bE5ppZwHym
	 emBFylmVnasKQ1MMdo3PaeutmEo9dSQhBja2GI4Cp6V2EBHv45epegLMtPV2bOXgV2
	 6mVRBg2ikpNjw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so50050266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQPwjLjLYlvduDwo/Y0qg+xmbZ8EMHMxCuz+qPDev8bFt7t+Zhuh8W+j663wn3CbTa4jzTtrodwWo/lBA=@vger.kernel.org
X-Gm-Message-State: AFuF++nZlTzayReYfV90+hStvAZ12xut1f1LtMZaryKwvac8F3E79mhr
	vzFAlTn7Uvt5X0GJjnnZMInmO8NyafYklIW2/LNmsa41G4dhSL7D5ApHMRShRxzGbksnxlCGcrd
	QGCcOTA3Insm+7SWDMw6+bIA8XiEuemc=
X-Received: by 2002:a17:906:c150:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c25d527a4a2mr66915366b.2.1788313468566; Tue, 01 Sep 2026
 18:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091519.2885376-1-liubaolin12138@163.com>
In-Reply-To: <20260901091519.2885376-1-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 2 Sep 2026 10:44:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
X-Gm-Features: AcwNN1Vh8Eukc5_QZyUCoB7E93Huedt8u5opetwzz8vO6r48cbxPYRn2NqpDhxM
Message-ID: <CAKYAXd9HVhS8K3zXhcfUz1H09CDaqADpDzXt0dO9FV3Pa7Rs0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] ntfs: wire up the fileattr API
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:15=E2=80=AFPM Baolin Liu <liubaolin12138@163.com> =
wrote:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> This series implements fileattr_get and fileattr_set for ntfs so that
> lsattr(1) and chattr(1) work on ntfs.
>
> Patch 1 wires up the fileattr inode operations and implements support
> for FS_IMMUTABLE_FL and FS_APPEND_FL. These flags map to inode->i_flags
> (S_IMMUTABLE, S_APPEND), so the VFS enforces them. fileattr_get also
> reports the compressed and encrypted state, which the driver already
> exposes through STATX_ATTR_* in ntfs_getattr().
>
> Patch 2 adds FS_NODUMP_FL support, which dump(8) and other backup tools
> use to mark files to skip. The flag is stored in a new ntfs_inode field
> and reported through both fileattr_get (for lsattr) and ntfs_getattr()
> (as STATX_ATTR_NODUMP, for statx), so the two interfaces stay consistent.
>
> All three accepted flags (immutable, append-only, nodump) are kept in
> memory and do not survive a remount, matching ntfs3 behavior.
This patch-set does not persist these flags on disk. So, the settings
survive only while the corresponding inode remains cached. inode
reclaim caused by memory pressure or drop_caches can discard them
before unmount. Could you find a way to persist immutable, append, and
nodump in metadata without causing compatibility issues?
