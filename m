Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663654;
	b=xvez9eg+R0ksNcAW7v9BGCJO09d8pGwOn8B5SjEar9fkYqbzSNlEnsQm2/qWG+s+D0jT
	 wV3bZsyLHUA7wu3r4WpCcXJOrHna2OMeV88UHpAcAJ4x5gV30qjlqwZeFDvG8MjCPg5Sq
	 j+cLCCh5v7jOWqdoQZ5HXbHhnUUbblzIwKySAPn/czaeMtc5mR3bQgDowftRW0VuoWYXz
	 PVTIgtiZCPLDcuG8OTHCfjCDwmEcVaMplpuRyvdy8ybPJmvrldASSiI8LhZI7P7dLqVl+
	 3iqPTk0TfEwHRTJda4Y+/V/x5P1YEkKSbxjn0TaYilxPc9/LinKAG81CdJp9rz+zkjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663654;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+UqSyir9zlJtTj6oGLIp9AFPvgL5F/23wHoJo5ierls=;
	b=3T9Byjher7pcnb3Y/vOh+hc9hDWXVts+FNiSSrNs1TsMID7LGSsBNWiddUL7AK7nE6l0
	 gU4LsQV82pM/639NrWcFRngX1yw9ENs8ftn7Oxa4raxZzF2mtkovnwRc8lB86QUpZ2pC8
	 pFINh6enfH/fRNZIeiIfER/yOqlM/dnmcXbKLwpQ61dqXr5hDrI8cf+QDSah/E3Jcr5z6
	 +kDWco0RXixmaCKKKrAYAAkBv+pQs8d7Nc2jxv4M+Mt/v7UCUi3HlHsRmz56PpfPjI0sB
	 hWNMNzU8xdxHgvupNj6WMUijekWsaxYPtbSABkT1JLZXWIaTvhjaGDuq5Pjvm5RJu9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lChM+1O7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E560606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lChM+1O7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23E51F00A18
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793663653;
	bh=+UqSyir9zlJtTj6oGLIp9AFPvgL5F/23wHoJo5ierls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lChM+1O75/pz8GnNKwtFDREVmqSf1W++CekSa/AKO8SYp8u5C8LP6XHWXtNQhSXpK
	 OPAuJMpsoI7q8iDybVE3Wtsq2BCVgj9UD3lSCNHejpt6cq14FrMn8ubIo73ywKi/D5
	 AIwe5gQjpMbRaD5BLymxg9eYp66tauf1xL0EMdZtE1NpTBQlx76mUwqd9DpLbNpIJi
	 cjCv3OdG8Z4GWb1FfApBrXnVV/Rj9OI6LCR9ji87+hjTolIbQkzjEYgyTvGp/uPRkS
	 fGKxqDXuv7RzRC1VQwsMzrYulUDTuwA8ceENOkGwUNW7Aikjm1brN3xI+dmtUnE9LM
	 WseOHDO/zV4Eg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c411e139259so319643866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:54:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwwuqBENoe0BgM5UlI3XTdzPmutw+B+tDgfcdSYKETfuFKC4AFL5QWfPayObCDbKnRYx4WChlwnUcCV+Hk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RbPyoZ1vRCIkz8Sk0UEX2oKbkHtU70h3F7HTRdCBJSKEXONAi
	cLiIFXqXMhVBZpYi3IVFcVHbcyT9F4Q6uiRug8WCHzDS4PE7/9XFtFQbaQB13mfhDhkAewZtiyZ
	ZSVVqjKQX+BVOjDx2GEk1d37KdJvJgck=
X-Received: by 2002:a17:907:18c3:b0:c26:22ae:b66b with SMTP id
 a640c23a62f3a-c4ca7aee966mr947443066b.15.1793663652482; Mon, 02 Nov 2026
 15:54:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179362071771.29269.6848836845989806334@stu.pku.edu.cn>
In-Reply-To: <179362071771.29269.6848836845989806334@stu.pku.edu.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 3 Nov 2026 08:53:59 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9G9VKLYzsKMqS87yj0KLxSjis-8iAAegnPdDzdpv=vGw@mail.gmail.com>
X-Gm-Features: AclHuK_ZiPl_8EII_1_G4Hx1xfHmBmUEZKMwbV1xvMdMI83u3u7g6JkbLF7jK5g
Message-ID: <CAKYAXd9G9VKLYzsKMqS87yj0KLxSjis-8iAAegnPdDzdpv=vGw@mail.gmail.com>
Subject: Re: [PATCH] cifs: bound invalid NTLMSSP signature diagnostic
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
	Steve French <sfrench@us.ibm.com>, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:58=E2=80=AFPM Yifan Zhang <yfzhang23@stu.pku.edu.c=
n> wrote:
>
> The NTLMSSP Signature field is an eight-byte binary value and need not be
> NUL-terminated.  decode_ntlmssp_challenge() prints it with %s on the
> signature-mismatch path, so the diagnostic can continue beyond the receiv=
ed
> blob until it encounters a zero byte.
>
> KASAN reports:
>
>   BUG: KASAN: slab-out-of-bounds in string
>   Read of size 1
>   string
>   vsnprintf
>   _printk
>   decode_ntlmssp_challenge
>
> Print the fixed-width field with the bounded hexadecimal format.
>
> The patched kernel reaches the invalid-signature path and returns -EINVAL
> without a KASAN report.
>
> Fixes: 0b3cc858003b ("[CIFS] NTLMSSP reenabled after move from connect.c =
to sess.c")
> Signed-off-by: Yifan Zhang <yfzhang23@stu.pku.edu.cn>

Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

The patch is quoted-printable encoded, so we can not apply it.
Please send it as plain text, preferably using git send-email.
Thanks.
