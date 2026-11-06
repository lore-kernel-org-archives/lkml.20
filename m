Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999796;
	b=XP7ZIho3GyhvrtoE6M+Si35DpR0UFa6WPhVzGwU+JDim7oE7aoKoCgYXkXnp4sLgyMx1
	 waoFW3X+TVojSO3D/6fnKEd5PmZdXzxRLWsM/C/A9BzhsIt/vGVdaXeWAOpf6x92+7403
	 EBP+fsI6wt40mNlzF/qvD5kPirCi8syHnvtC8gxKnm2yr390wYzzPYs2bQFZNv3W1Jxkk
	 5kXoGzCyeKxXWLEGXxah/FRQB9dJspWXCUAnc3fP1YAzCkPIla6x+YcjgLVwLdOU3WLAG
	 0ifFxlTMsznnUbJJAnXKmzZxQ/Yo1dCevbl5ivpp9nEGgl/JvR00BwwF/J09C0yBfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999796;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xJl2OTNmMfTBfL4AgN9E0OxQR+h4k4fDuOq7xORUM0E=;
	b=3Trp+AJWzXL84FuyxWuIvAiRJnahC099EmWOnp1wd2im8ZBRJaqXobIhORQf5C/eLe6B
	 WmAKHPFRlXBK6wcy4m6VWGdBshyC3e+PjleLcexiFH5ShMPerr3egUlL7ll0weUK6DRuk
	 fRHE+kDZtS2gllVXolanC2ZCfh9+1c4vYBd2leI59QUoftuEi6q17e4FWh2/dW9Vmn9fN
	 65LNmsTMLWgFdWZ2d93usfRfcnIgj4fdXZ4YAnykmnq3WjEB03IpLp48elPBouOLFA921
	 aN3p1EpKOqtxhP3KXwNBeq7ayu5LW98RMeEQLF8KLmtMwG2cwQZjVWknXSSBODhZLqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hc2u4AmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848D606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hc2u4AmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AD81F008A2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793999795;
	bh=xJl2OTNmMfTBfL4AgN9E0OxQR+h4k4fDuOq7xORUM0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hc2u4AmRiCbpuySBVBsiFJjhK5OyEy4chsQgXiJvIQHOcnvTc6lqmCgNrarTItdGI
	 b4PtUqCHPqRqHnFYKS8X6sKxWwQDZ5bzutOx7NJ8FXfOQ/i6CZrLJ4B3lC83hjD5Mm
	 92zzKoyM6lHaV/O1JrCftWtbc3G1Hi+i82v2AujHNP9E5lvwmqVwhuNjkGb4jtBdBF
	 g4Rgj1MLTC1wOcP5PFAHN3Y+gjYbovmUMfihRC3sPNEIvmzIJeaeHHkcU29fls1S3A
	 FeN22iCCs0kH9uHH8kfT7vMPzEUh+9bk84tYyCMRk/T5EF2YHTYz5W9HN6BzWOyQEE
	 mVJIVJ7l2IiKQ==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f20b304c0so104173085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy928VHNkbvYUMoJrDRST/3XmES4z+3moDS2b2s2WUGywIz5ZsGb9i5WEFRSYiDY5sdU4r8keC6f763Cp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U/qXgjQiRb53sW5R0kXTYLl9NT/FZWmD3fc2/mtUpIgwtGdjg
	ASrwkpQoFncHbx3v5uWXUyFcngSo+J/ZCSIckWnlaCe078AhGaDHdBEOlukg2zBdzQCZPi8IFUh
	fB8R+gxfecJVQPEzFX3zbn0sz2m9T1yM=
X-Received: by 2002:a05:620a:1a17:b0:93f:4f87:4f5e with SMTP id
 af79cd13be357-945f3563aabmr612409085a.72.1793999794316; Fri, 06 Nov 2026
 13:16:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103233909.1364531-1-dylanbhatch@google.com>
In-Reply-To: <20261103233909.1364531-1-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Fri, 6 Nov 2026 13:16:21 -0800
X-Gmail-Original-Message-ID: <CAPhsuW72OT76aegak-WF26B-WOu5A1c=n1SVKOUWaeiq9BE1xg@mail.gmail.com>
X-Gm-Features: AclHuK_13JVN65cTQk2p3xkuhhhJkRuHZ2ecGR2Fh9GyIP9fsrWSWq6y8nfRH1o
Message-ID: <CAPhsuW72OT76aegak-WF26B-WOu5A1c=n1SVKOUWaeiq9BE1xg@mail.gmail.com>
Subject: Re: [PATCH] klp-build: Allow passing options to make via '--'
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:39=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com>=
 wrote:
>
> Livepatch builds rely on reproducing the original kernel build
> environment. Currently, klp-build invokes bare 'make', which drops any
> command-line variables or flags used during the original build (such as
> 'LLVM=3D1', 'CC=3D...', 'KBUILD_BUILD_TIMESTAMP=3D...', or custom wrapper
> Makefiles via '-f').
>
> Refactor the make invocations to use a common MAKE array and allow
> passing arbitrary make options after '--' on the klp-build command line:
>
>   klp-build [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Acked-by: Song Liu <song@kernel.org>
