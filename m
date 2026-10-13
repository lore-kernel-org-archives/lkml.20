Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC8352017
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878205; cv=none; b=nuxquXev107T3prO1gqtwIfkeSofd/McPXMkb0HolU15rscYqB57WtyCoJiIlNwZd7AyODNxmR63vSeOo1xmHWG1GpEp+7RCLeVBxMgc2xdZM9fxfcrB8D90PMTykDbOqyvQ4R2oT0dgCicxyNhy7SDrSOakRNiXj3gFP+fDI+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878205; c=relaxed/simple;
	bh=wLxGCJvEOS/UwtSWTSNVSW+NTs3j5pSxvIoi0oFbcO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ/fzX4OxqMa4R8P9BKxMfqp0YQ/uw8BtL5A2VR0d7qsaS7iQ9CYp5g1Utpae2bY25/2ZwbEW/3nNhTRfkgakKnnzm05o5torBZ1ONJoQvpXB0OYgmKI+uCOomm/WemgvgjWgPhZ+T+M1OSmiYCsuAKIrqSFp1S0F3/6e4t8Btw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckUw29gr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckUw29gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103D61F00893
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791878204;
	bh=7pXP7X8bjYCuK3CUf9TbiYbHNvWXXSoXwy5Iyb5zalY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ckUw29grskf4zZ2uhxiJPqIP8NgzG0lyCReBIt8m9pt+QRT/+Ez1fdrfhZvexegBz
	 wjraC9tMUAwdVeCLbZdvkxCkAZW+IUDZSD1kHcA7Fa/66wF+3nvs1BzHTcA6VftnXQ
	 FwuX5a7Hfm0mtpadjITb8poaak2soDqEfUsEoOdyWX6k7qFJV1ZyyzJl8Zr2yDP+kj
	 m2SV99skHrW/wOsXDMuqnlMtgdqnW17M0Dqa+xp2Zz6NAOIp+fPlCdrppuPjkPa417
	 tKG8ImMNLWIxDH37Fs/h3vSh7OW4ga9BVKxe2N04bN/1m7nmOJ7tjeF1PLcABqZIWI
	 WI+69z1GfFabw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1ab02ba4dso3031053a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/Y8o1uKAVr0V23ssZWaNRSugy8M0f4Jcma1/9YNzuTxDW6U2FVO1L8uGpz+f0eino1NDjPpCDzkl7z08=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYomL11Wcz7OEvq1W6zIMtT4YegVIX98ZLRIFCed4lwtvYETRK
	j13YQyesctWd6bGF4oLt64v+vcKjv6XBh4zjN3lIjm5RJmLnAv9JTc7Lvn4LQ09wpaqUialPRGM
	fKXDGfHyCU1+T2oU24DE+5iqSKDl8mwA=
X-Received: by 2002:a17:907:3d89:b0:c2e:32a4:f516 with SMTP id
 a640c23a62f3a-c31a9fc0b65mr1160568266b.42.1791878202741; Tue, 13 Oct 2026
 00:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214722.q7rkflclyyugdxll@pali> <20260825230622.24617-1-pali@kernel.org>
 <20261012141053.4ud5pihrtrxpkxfy@pali> <CAKYAXd_FP7F1U_ETWx+0QKwpDuEFp=UJzhMjrSmuT9uG3nAxEA@mail.gmail.com>
 <20261013065503.rndxu2qxauehudil@pali>
In-Reply-To: <20261013065503.rndxu2qxauehudil@pali>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 13 Oct 2026 16:56:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd90dbd9p8uh3nyT_e=gr=P9qQeJd5TE0=+K4+gV2-JG8w@mail.gmail.com>
X-Gm-Features: AclHuK_z9yrIKBcUtuCGLdBJ64q3vHEFCB22jJ0IQi9IfOr3qQH9lmi9tjpGGU4
Message-ID: <CAKYAXd90dbd9p8uh3nyT_e=gr=P9qQeJd5TE0=+K4+gV2-JG8w@mail.gmail.com>
Subject: Re: [PATCH 0/9] Various changes
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> PATCH 8/9 comment 1 - unbound memory allocation based on symlink length
> - this is valid, but unfortunately all the symlink parsing code would do
> similar thing. And we have already more symlink types. Do we have some
> limit how long could be symlink? Does it make sense to address only this
> one issue and let all other untouched? I would rather propose to define
> one common limit and fix this issue on all places.
I agree that a common limit is preferable. cifs.ko already has
REPARSE_SYM_PATH_MAX(4060) for native reparse symlinks.
>
> PATCH 8/9 comment 2 - fid.netfid initialization - I'm not sure here.
> I had an impression that this is a right pattern how to open and read
> file. Can somebody else recheck this?
For smb2, open() sets persistent_fid and volatile_fid, but not netfid.
Therefore, .netfid = fid.netfid reads an uninitialized value.
smb2_sync_read() uses the persistent and volatile IDs instead, so the
.netfid initializer is unnecessary and should be removed in PATCH 8/9.

+               io_parms = (struct cifs_io_parms) {
+                       .netfid = fid.netfid,

>
> PATCH 9/9 - masking sync_write error by -EI - This looks to be valid.
> The fix is simple, just adding "rc &&" before "bytes_written !=".
Okay. Thanks.
