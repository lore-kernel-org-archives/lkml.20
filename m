Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669749;
	b=cjKOgZJh61/1KqKhDRD03CryBXnArT07IXj4DgHV+uuWXq8+5VBMuyh+ihYbqjlsrbdV
	 YnJqDA/85u9F5bTt5nPOTlRT/ZITilerlPg34V90yEa7La4hVBKwr7OtT5vMHSxRM4MYN
	 EEMKfZjEdZnDaqkcHNVGPy/IA+XIPaksC65pY/+tHEEBlp6/Is5rv2WzosKgsyJgRINaW
	 YHnaQ5oLwB5jsrsfiXizVlBZCUr60YhnSginDv+pOgjcoGQUXjYNb9k8YsZbuG57GGwyB
	 Tr1Q/aa6ajS3EwkBhkt8zX9oHyIa5VZ2kRAqXaFKtYqRFDPHaklgQrTTQYBpVp12nUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669749;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D3pqen6XtofwE5K6hZVB/4ljEI0gtaGv/M0XzvrbPe4=;
	b=sMQ5n1755bTJj6fIhAqiC79/x+pWYgysRxll4po14io6i28/0OmZ6SKiQQGRdtPEPga/
	 rma+P+SnIcch8sMo034WZ6pVBaDKYYE1sbM5rJzC4NnNxtZz/ZKJc/PyxaDakGxDcYD5m
	 cCIHRbZTz3xpzT0yTF6bO1DYbaznwRNk/hmDq1qxm/djizzv8Uzu3DmTt/9HSVPAwb9Aj
	 iuiU4Mqb0KeBAN9fAs4K/HoLYNZsB7OLAjRX/TP/q3n7ebu2E6Ii/Y0Y+nlz6Z/mSKOkF
	 G/Xnm0fnfBi+wZX4Iy+1hkFSPFXkC9HUOM19N7oA80lAOX2ogzABNZag03ZYA02L0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRSMXNLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRSMXNLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6D61F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669748;
	bh=D3pqen6XtofwE5K6hZVB/4ljEI0gtaGv/M0XzvrbPe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QRSMXNLLnqYfwvBj9SRe2RkGdQJc0AEECJGc/6lDCWM37e76OouJ6wmRbHY5XctRS
	 sh7DORNxi7DmMdlrIpcSg8Sn6mdUngCAN3/xwFgIuNC6CvLxgSH/7AkIBPzPUHc5u3
	 ihDE+W69NfqLGL1vOA3a1bHtP2GnHQInQM9KvLINPbau+FdFmIIS2pgIZvL4CZvuTs
	 wERe1WYxSiICjDX6JtXFOWsMLXKSl5GzHF4DMAhl0Pjh74S1wLYprUyhEpph0CVsQN
	 zA/sCIWa98tXlPBUJ9rfdd75yBodUhE0d+7P3/WGJLDrepdSkWjDPHiwZlOLgqN0Jn
	 BWrXiL7XTBK0Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2667516a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxsVh6kiB+38dGd/mDJNLGQtQGzHFez/ULh96lHehI7kyJ0RFt5BOiniKZKR6YvkqFtLVevSWvxXqq45iE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDgFuVyAUcGrJ5TuWADENurw8YJN2A5TPSOMr52kJBfxvOrOSb
	NCl0ryWW50onpB3GVga5KL4MNNzKD/DJfmvx2vpY4FCNp9sB62YVaEApzMm8C2zqqOrXuphJu+P
	oirDp1rdqorP1exKqTXEpow+ftp6Z/fk=
X-Received: by 2002:a17:907:6d12:b0:c31:8984:7fad with SMTP id
 a640c23a62f3a-c4679611ee4mr506777366b.15.1792669746875; Thu, 22 Oct 2026
 04:49:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021115400.30885-1-mike.michalo@gmail.com> <CAO+rqLj5rF8MGMTRSav1n43NqLbazwyuPsPKgiQT2qtP+EDxeQ@mail.gmail.com>
In-Reply-To: <CAO+rqLj5rF8MGMTRSav1n43NqLbazwyuPsPKgiQT2qtP+EDxeQ@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 20:48:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-D=8fK8rT0aCrpPEe7ezQ7Q6qdOiAy_tSp6Yy0z4T8cQ@mail.gmail.com>
X-Gm-Features: AclHuK94t22vzU3h4aqXcwOpvZpOlnnNQW9zL_24PA0tOKWccvisgbBgdOZ6eMg
Message-ID: <CAKYAXd-D=8fK8rT0aCrpPEe7ezQ7Q6qdOiAy_tSp6Yy0z4T8cQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
To: mixalhs <mike.michalo@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:14=E2=80=AFPM mixalhs <mike.michalo@gmail.com> w=
rote:
>
> The ksmbd-tools side is up as
> https://github.com/cifsd-team/ksmbd-tools/pull/347
Okay, I will apply this.
Thanks!
>
> Michalis
