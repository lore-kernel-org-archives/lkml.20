Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819528;
	b=EQ32f1yh3Xoxw3nLh/gfvXdQ3+EkSLTvsJUZlyowMKJlL7QfW8d73fR6JBJmcas+cTZP
	 9hXiSXTlIKaLIbIGgenr9+WBRSR3d/7XEGV8YKX7j9rHJMZJDJbnaukD1BHWpOMRXGVUD
	 +Hx4cmXBjOdufGfnXqv+srE7qr5VBCQGQ+RKE5leVE2tsJb1goRkWVbU0Ho8V0cwihJVw
	 00Abkcv/mCSEJmyLSisNilFZdKjaUQjTM4yQ75hJ16RpdjpNMUZIEfoPEF+htSt7N8Epp
	 hB2aBYB4dMj7+MHcFjCuWeEsacr6CYcL5f8gsaJM7TVHWtTSrSCPxJSabpcPZDBVQ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819528;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3DKxUDhIGrS0XKk3YGxhQanUk4e1Hk17J0HKDnLrC4w=;
	b=eDq4eUYs6i63HGS4qPSf6Wh8uXcqSVFCliVVRzozbZPfhESL7dwG/mHOXFRlRu3BZKab
	 VnIT/XRddFCyssUDNhEoThy43zBQMJIfIQTTrny5a+s80RCvJmhRYIqaHE5iBinnx1LaG
	 SjMegbF7teDOKjpWa95GqkEPgLAi2wgG2jikPEQFnqFlYy63C/6/udi3S80wEOtyiaIp6
	 azYSjUL+UfkxOCfzMN9xITReQ/KUMJBa+Pkc5t+Em8vegeFEoQ/4OuJbp91exAXpnbtR2
	 OJz+Vl2IvcDYHeaL7Q3Cp1S5UMSdD2uKhhCuqN3Qjqu+EtSNf4QwpgXBaHBrfMP5Oog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6BWhVAu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B5606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6BWhVAu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A5E1F00A1C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793819527;
	bh=3DKxUDhIGrS0XKk3YGxhQanUk4e1Hk17J0HKDnLrC4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E6BWhVAujpHKz0HBPWfMuhI0XXUt+yp9/6ZuVZ1TU6mTuV1ZzSVOS4IdADWTV8hCr
	 LQ0ZrqnUh8V6ahlcAptxCCUaE6Gsii+LRJ95oD1ujXoR3XbM/+ofsUOdw+flCmWzAR
	 tttyyhsFOuA6Z0TxoapeB1vau8qI2/5E4/UzlYEuphhqT2EeBJbfzA8hT9tPzK8ywM
	 jCTFhnfQtIW+Fb095szIl4Z4sdfi55VrPT7ZKY/bHSNwiUYMBnmIUdR5yjUYyJQBGP
	 Cn0ZOAWu/WkWXoVsVW3JIW8PBN3Jb5C0XImVmkt64vm16BgdsraokB2p6S8dsAC5JH
	 5EEok3qIQ/DlQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so1236316e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:12:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBygahI+2GaQ30/AafJKTQF8WU6OPnYUfnbXzsnLjyF2k6LCsAFcwNSX3QmsJwlH0mwBy2bRjGjzojztD40=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XuQ3YkmjEP2vgh0hBrgodGY8lnvJ0/VtDQ4W6rmoFsjrLf/zc
	HwMNx8MnQRNq+osCSJ6BcdjLVVPRplnI57TPJ48rGzYr4xPWEyLMVW6rKPhM8td1T6uAMrGw/pM
	fLzHeGUSn2G0g7uH92hDQQ2FQ9GKzAL8=
X-Received: by 2002:a05:6512:1247:b0:5bf:b144:fcbd with SMTP id
 2adb3069b0e04-5bfd95871afmr6554848e87.42.1793819526207; Wed, 04 Nov 2026
 11:12:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104151651.3035537-1-stanleyjhu@google.com> <8adcbd80-f684-4e00-81b3-a2661fac895b@acm.org>
In-Reply-To: <8adcbd80-f684-4e00-81b3-a2661fac895b@acm.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 20:11:54 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0guHKxUKXqB2MO037X_hn9B4Qr6mfqgKShP7xLaXt0xtg@mail.gmail.com>
X-Gm-Features: AclHuK82fCXfTCCutppNy8n6kl31mTAu99xE8kGJzMIP4eRpp98LhfMeiJfG6w0
Message-ID: <CAJZ5v0guHKxUKXqB2MO037X_hn9B4Qr6mfqgKShP7xLaXt0xtg@mail.gmail.com>
Subject: Re: [PATCH v2] PM: runtime: Update runtime_pm.rst for non-fatal
 resume errors
To: Bart Van Assche <bvanassche@acm.org>, Stanley Jhu <stanleyjhu@google.com>
Cc: Brian Norris <briannorris@chromium.org>, Pavel Machek <pavel@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Jens Axboe <axboe@kernel.dk>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:11=E2=80=AFPM Bart Van Assche <bvanassche@acm.org>=
 wrote:
>
> On 11/4/26 7:16 AM, Stanley Jhu wrote:
>  > +  * If the resume callback returns an error code, the PM core sets th=
e
>  > +    device's runtime PM status back to 'suspended' and returns the er=
ror
>  > +    code from synchronous resume helpers.  Unlike with the suspend
>  > +    callback, failures in the resume callback are never considered
> fatal,
>  > +    so the helper functions described in `Section 4`_ are not
> blocked and
>  > +    a subsequent resume request can run the resume callback again.
>
> Hi Stanley,
>
> This matches what rpm_resume() does since commit eef1d74bf88f. A nit:
> suspend callback failures with -EBUSY / -EAGAIN are not fatal either,
> so "Unlike most suspend callback errors" may be slightly more accurate.
> Either way:

Adjusted accordingly while applying.

> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Applied as 7.4-rc material, thanks!
