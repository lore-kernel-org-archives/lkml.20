Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7528C4611CC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960564; cv=pass; b=gL1+oF8TVcEFUvpBbsEdluHS8/8cvP0xAY/STNTZ8oS3/3bI/nhKdfCKxAwlFph+VMqQQH3JKOFeNplwKTP8xYahuzbZcyD9WTB914Z58nc2qu/kPft6dfTox/nTkZGLteW2zJjahhMntQtcQSm/cmMP183Bn+6G1KMIzMGsgCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960564; c=relaxed/simple;
	bh=aQp8oRIAczotXzqSiIFfwp9CnFohJGLCpjPmm7TR0FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUxyv+WYDLVu11qD4g6lj9ydyp2Cy4RDec7+OfWO1IiIrFiewq9dy9Ir+qQnFMNGCmCjmzBKZ85VABIbHRPb0ACi27QLnyrzspn0SmBSFjik3KTdYDAyYzAAgzNsTKphBxwsA21T6Tjcj0XluWm8UV/FI/uPNp8ERpLDysFeaTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWjG486G; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWjG486G"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so37302a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791960561; cv=none;
        d=google.com; s=arc-20260327;
        b=QKRSIKY70F1NWmo6uMmFpnnQ7waUM8/U+brw0Y0WbGbKPad40fWLq+8YtugT/DBTXH
         FcXDm7PQoCBgD77Km6Rzive0ZLUTYPghKYfOK8M8FU1e/pfGe7l81+w+HsfC2Yxp7NPB
         GI8EhmgMMDxIoV/gyLSuXHNYsM8KRmoLNNhfFF+xDbuhJcksHWJOTpEtuV1GF5KWv8yZ
         tPhWZY1Jmr6uTvwBCo65IwDiGQAkXmVBREHMuA7aKrRQPgxDWwMSiTtuT/qDSVC8ppL4
         cT1PEruZRYzDLV+6LkhOYWkgHHqWD5EtsbpLR9Slqp6QZi30hM4C/h1yvrXmP5rCkbgS
         JNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        fh=AhN2j4vnqKKp2lkVgethwU0vijh4gqTCSWARZSK6oMw=;
        b=seB2t2foh/ySAZYJGFd0fuwSGRrlA9vBH1FqHYQbjbopOSQRdwtMhUtjthvRMzgxC7
         7qHwLm7yc3G69enPFMbGYwbS/kBQPi3dIQFu7rSKByv/8DO0C34oDNB4AZwdPljJLEcr
         ItOn6SzDySnaaiEHhg8dCcmtU+hzfy2nU0v09wFwVxCusI2qOBhBtMttoHIuQkaw5zQZ
         i/agRTPPRNlYMAceEaUPYTjW9L/DAl+DrqtDJR3gwnrQi5sEXKppkP/82ncho23LvS0y
         kjvylNuqqgpt/cH2ZUqD5PW6iX07afXakNCXTzlsW61DOLkjHQQnrAXYSoE73LCLJy5k
         2IXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791960561; x=1792565361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        b=FWjG486GXpUj3e0LVRi171FwusyIn1i2DWnpGEyaMq+NBB3vJ7TXGW8YOo4NESEwKH
         NnM8/VstPFYQSSmxXk29eryt8gJqYU7TcvpCjQHIp5nDdbtVNS8z4nN2qQuLVMLjBJEe
         RftBCs5N5t9gTiQD/x4Pfz1y2tsTVVhME9abr0Ojz/5zinIIM1chaolYT1Knnq5W8kin
         XoSl/Svo2qYyKhi4qM6NGqhWgXHB15Vf83Y7CYbzwtLQQILvrZ03BoYIQcv8ndJSfTDu
         dN7prpwJxctDbR7LNdkOyzJMxx8k72dE4q8d0BUxi9tSu1CDcWkJ+kQyMwWOqjmqrmgL
         tFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960561; x=1792565361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        b=rbWM6GY95Yu5HOncH4eRPOmlZz1c7vLyvYKh+ICQ7H7LR4YOhz+wx8ECml/Jwc7d0d
         2saNS/t81WkOGmESbmCvUwmFgmHvhFjNnB/3Kg467LbxXpoabQIdUAnVh2SNcnCb7d1Y
         m1A2iN1HFxTmJTuWR4QEkNpec/ekmppoTv1XV1UuFnlHTlhmstnTNcAn5ZFMnBii0Zhu
         SfHBFHV5w5oiEr5jYtd6ioOTbGx3OuY7vS4kVJC3/McD6CLfBZOmHy4yPP7LURAHv7Nr
         fyyQdWpqejSC8d/CpKi5CfHa0k/ffu+2Soymaj9h1Ugscl4Vtb0kJUaJ+CWoA6LoloTO
         IV3A==
X-Forwarded-Encrypted: i=1; AKwUvBxG9sfnmvbXwLDEukELChhNqGw9GLf5Qyt34B0RdBnVCt9GjxPy9Rq7pnnlYFxA5QvoSzYjw4eGS8kXJ+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPtceFbJs+qjGzIJOUzGAr8FSVPtmQqcjTThM5ABRqRXlq12ii
	x0T6cpF466gqdJFw3fi92QXAi5nMHC8ALiKpZ0iVJMsfBx9Sj9Ef7OZfh8drc6zbb+GLbsAMb9V
	nNaDDOtSkSh+k6bBfiFY0xP5/HauTS4wOcKCbGxZC
X-Gm-Gg: AYBFou3cBn0l4kui3EznbUajQcM995x/mCUmaozrzzgesRqQD2biHuiWf4jOICrSyY7
	NUOLSDlBqwd9I+sNj6hS6eUfmMM7nA7KbqontK0fAwjU3NCmtwVzfdwDd1+Jl0uPEdxJMr7y14H
	eDORiDQzbvlIYFx1dIxk+7NnsDUpeeImlBfpVKi6QRhSdPJWIzTF7HDyUMmaKy6xhVxrwO6q0jS
	TuYnJt4E903HllPNAlqCIfUV4fGte3pwOrnt8pIlMK7j7lc44eSy3zZb9X77nSFwsg5d3PEnWIV
	oNfWcDZNG48oAWGIgc4wWmOKu+YIYJXWGjM2IdJXXLsC9FTd39MFF5SXne1Fgo0S
X-Received: by 2002:a05:6402:683:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b20ab049f4mr17118a12.14.1791960560065; Tue, 13 Oct 2026
 23:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012174300.2338784-2-almasrymina@google.com> <179191526299.434549.7888465945343049764@kernel.org>
In-Reply-To: <179191526299.434549.7888465945343049764@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Oct 2026 23:49:07 -0700
X-Gm-Features: AclHuK_pUGXFUw5Tdds7zQVYPdcRbxQWbgDPdlpfKDTpq7eymZUOA6XtUrz1B90
Message-ID: <CAHS8izOppdgVxeHrUpR6zVxfdTHw1Bv4JEoYGYGodAjyijB+ZA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, dw@davidwei.uk, asml.silence@gmail.com, 
	ap420073@gmail.com, sdf@fomichev.me, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, razor@blackwall.org, 
	daniel@iogearbox.net, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:14=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 0 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The same dma_unmap_sg_attrs() slab-use-after-free the patch
>   claims to fix can still happen for RX bindings made on a virtual=E2=80=
=A6
> - [High] net_devmem_dev_unregister_rx() adds a new writer of binding->dev
>   (and a new unmap).
>

For both of these, they're issues with leased devices AFAIU. My LLM
found just too many issues with the leased devices. I'm hoping to have
this series merged to fix the lifetime/revoke issues with the physical
devices binding->dev =3D=3D binding->vdev, and rework how the leasted
devices work properly in another series. It was just too much to fix
all the bugs in one go.

--=20
Thanks,
Mina
