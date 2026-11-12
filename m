Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522850;
	b=IGlCy+NTUkAhpYmzF1QfTKI6JvKpxd4eqEzfs+1g8P1akEeeVmSptynINrXS3k4wUZAl
	 0EPURAWenQc4brY5udoUUw3BcepnR3I/a8pcikRfogOuBSWgan393GIzBUHax012ncqN2
	 ms5uMY6PXDtKx+360X2fUgpJn97h/x3PRDSkyWzGB01lR83lC4H2wfyO1XgWW83CombaI
	 VHIHd7osHAfH9aC7aTNFWektLhHovSbZ0WzsfkaJUI0kN8Ewn1fg0MvX0xavKipnWnFem
	 DTkhxDSjXtlXrO5SgAUT21xHkNszHDhg0LrQDr+9tAODFF+wj+NaBAv+2u61gMoD+qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522850;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L54BL4DHIvMAW1f3YiW+oYF8hYcaZJufQX76TBLYLdU=;
	b=JgEm4UUhYt8airLfNY3GBWv0VJ8gFFQu4t6tr3xxPqfRoc9OGMlXknHDeR7bACbWEnQB
	 NQIuByIIaSonh9d8goXuVevnnAgyJ6E3t9qqd1+tVVYRyavvcCa++APMZWEEiHvmBU8mi
	 9pJsT1PpfZeUwh4+RxyChv8CGo5vf0ETYPW6U/RUtOmBSrS1pkrDOVAK5dhB/Ggk7B8mT
	 ck+K3BRHuMwXuQX2pEdGaGiOQDrplkmcpFNxi3beBYhclhynsdVMmDEJLj+269JQiYKYs
	 emNs9FnKt3K0IsnM5bw8SFce4Gc35OvjihnMNmRn355xdMb6bzah7Ux1A+PZcZbk88w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJoVZPlJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42918606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJoVZPlJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0BA1F000CA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522850;
	bh=L54BL4DHIvMAW1f3YiW+oYF8hYcaZJufQX76TBLYLdU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UJoVZPlJiTZrzn1oXQ/5OxdB8wHJB8+rzKDEFY62J3nEpjYRAV2gtEw3OQdS5mTDz
	 yOcfkStlDafZ12xiMCVoAyeu3UFDeTsbB6PpvNLceucyOiPpLb7hhs7uCYC3PdJReW
	 d5pob9ICjwbzB2ESNeN+ZBsMv60C0GjpSsriLP7aoFOVQPoatGHYQV7ayqiW2P9GRA
	 jRqpwPTr8FEk/jzu9ByNkm2LmUDY2bDwHX2gz6nJwZ2ms4zKLItOErDVpItObNgH6B
	 eMnmwSzkfzU8AWnySyP7uyPajL2C5vqTOvlolL8vGdFc4brO04oZT2IjgYmnzWaJtU
	 USly9VqcMdI2A==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d30639709so48740666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:34:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFoEv+bWItcGDefUumIOH00E36I99CoCx2RMSqYR9qvCF7+LFQszPU4XqdYBNZ/ooG2WyaNOtAJs766VBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zFxOKU7TL0AcbhanNbTPCEzSNfKjJEGpCb7V7F1sxiwsxTedd
	xu4rBFR2GmJuJUo5H3FdW2WZuQszwVZvFMG3Merd06k0tALpKnUQyHnPWdrTcT08bky2jkl7Lau
	LQtNt9Xj6+Eu5/FFaObJSgRB5+UQ8cy8=
X-Received: by 2002:a17:907:8691:b0:c40:4965:72bd with SMTP id
 a640c23a62f3a-c509640bfcbmr53255166b.19.1794522848652; Thu, 12 Nov 2026
 14:34:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112183607.1660070-1-icb@fastmail.org>
In-Reply-To: <20261112183607.1660070-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 07:33:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_BhzKwYCy6GDJt0UzWQe9yraU=txbNpMo6knCMnMdB=w@mail.gmail.com>
X-Gm-Features: AclHuK81xXH_-OPmQs1rrhBNOCj9FNwZiuS9DtIXUEAS2tO0Y36wabUvT3pnOSE
Message-ID: <CAKYAXd_BhzKwYCy6GDJt0UzWQe9yraU=txbNpMo6knCMnMdB=w@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: ignore the allocation size create context on a
 read-only share
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:36=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> On a read-only share, ksmbd refuses writes over SMB, even from a user
> whose account could write the files in the underlying filesystem. Such
> a user can still open an existing file for write on the share, but the
> WRITE requests that follow are refused.
>
> If the open carries an SMB2_CREATE_ALLOCATION_SIZE create context,
> smb2_open() still calls vfs_fallocate() on the file, and the filesystem
> allows it because of the user's write permission. The user can thereby
> reserve any amount of disk space through the read-only share, up to
> filling the filesystem. The file's size and data do not change.
>
> Ignore the context on read-only shares. It requests space for a file
> being created or overwritten, and such a share permits neither.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
