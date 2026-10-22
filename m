Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664667;
	b=eH5pfMyeffxIJSVaRDaBYWaFs4KnADlzK9Nox8+70VLWF6nFrLDC3lEAgXbIKj70GByT
	 6sz4yIc+9jrOoFkxer5BLWtFw2n9rqwk2xN3CWPWNyatmfjhdrQGtVdLYLh/kbAV6HUkv
	 isnOyfMhaqDp6/OJ9cJhYVZb49/QnZaYVQgDGn6FXBc3f3q+XrIVbahA37dSGu7FSG/4T
	 HZsdiTreq/X+EcB16jbYK5uQqnKy0k71hN6J9mFZ2hphWUmmLB9N3JND0cZPsPkQlZgqW
	 NSr+5BqaFrDyzEyppab29l7m++JcBo0Ao5sFda7I3e01IL7jsxlcpVfj7gz2TKriNKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Organization:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=jdwPVJavhkPjkAdhtGK5hpqRdwlHIJ2X3Vlleax6CyE=;
	b=cg4gn1oOY6wdKYqzTOabGnO3F+QnScbVOCUV95qKuHa8K0QcmOBEEyIcX8aJT1bKI4/p
	 9YmuJl+BqqU/k593VdAaPXVIuDNw4Sw8w898YRANG0mLUVPODSBuPo5UNA+GXfUoqwQxw
	 NcUVC0QzmL/EO9CI/eVu+4OwXemYCvAQdUICKRCM+1PlXK/yjILf2h7OND9LqGqtuwdYo
	 0VnUrtybBYBFNOfLbabHX5cAwAL4lvWOacuDmh+5lHfNY3R0abd4Vq65nqTWcreApsaaP
	 XW/JaGS06fNIqL+tXYpsp15ybU7TZQ7BZDxVLPlghTOeldcdkjo/0OKr4/QI2EvQ9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=plEe3jBc;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F02606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=plEe3jBc
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso3584805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792664665; x=1793269465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdwPVJavhkPjkAdhtGK5hpqRdwlHIJ2X3Vlleax6CyE=;
        b=plEe3jBc0xQaXh/Ty0vKnf9UJx161m1G+p/7xDxAcdG4wzYmUcLLia6U6+a0Xi6ZQ6
         V6SjiOXfamYC7ACD0s0EjpQTSm4ryd65y47af5utVx4MOOzNhGwGtKnEfLxZ7Kqk+1Z9
         qjjENd9Zbh879BrpL1ftWztC5jBLyXfe4S0/zF4kbC8pyuFo/ay1i07v2Ko5kmTUtCup
         vXa+1jJokTM8RiQsHj9zFqYSUU0i4qRDQUz/Hdf+c20W7u95SkWfnOOm7lnYAttrEF5H
         4KhbbO8SbDvMvKOJSKCu4B62SBKsZZQsKqZvqxywCmtgq/ve9iRgwDZKh3BEt4WS78gW
         q4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664665; x=1793269465;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdwPVJavhkPjkAdhtGK5hpqRdwlHIJ2X3Vlleax6CyE=;
        b=a2HQNpPpXu1spdEN1zemNMj+xEVDFe+XF+55HKkiaYoY9217vhTAJIf5g/JCIK5T3D
         sQ7QOVa/qxn7LBlTd0hC1BkhjnyeitD1KEyrIxKAxCwZtgO6FvZsroI3/xeOLxanrKMl
         jGzU3X8RrA/ui2wm0Oe95UZqmgG/bkUOjVumQv4jJ5O+XToxIc5cyylkp5//tc21vbBA
         wcGG3l5WHsdSE0bG8borIS4VfQ3FzjI+7mL1AKe9aFSQV9+ARa7aLIDr1M1rbvEGQ14J
         UF5I1gWhAsI08fuzm/Zblc7TzXmNTj4QRYW2LAInEBvQezv3Par+lRHI3m1h/6S/XXAx
         obYA==
X-Forwarded-Encrypted: i=1; AKwUvByhrA1p42VXqwinnng8XRPJCqpOhCx5hj+Di65SmXA73apDw6Qlofq4dAlJCzpFfmo9dMl+KAodDAYSp1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuGnWXGWaIgorC6Y5jh8REQu8rkyd2LcoJr/ThU+LmnzeSd4EF
	o4yJrAgNGuWP60gfHOr/tWzgsKXljAhyC7CoUUDV4yB1v402JCSz1NkX7kY0HTFzReE=
X-Gm-Gg: AYBFou17eb6okPQPq9iBVOiTosWy1V20zTXgRXD3hiZnOC8TWpzUu2elW6Cdp2Q/4A+
	joSzQCvN9ub/Kty8eCFle2UfxEeY918i6qxxoBdmHI+pqz8bg/gBSsFlmLQCxjCvE/q5qNdbR9/
	gL6ysZsuc+6fDuHLmlsAAGGsatUc2X/ZOfvp8dmYwqR8HiZQ9KguDxDv8xfKF/eCZW9cfvgp08g
	kgv2z+cFi7RuYq7KpjDZ/6Zq/cSU6c3vzVI2k1irjk4oF18pQvpYLW8DSHrPzqBje23m4Mr9wGc
	JC6ptZjvuDq0aapdvVxYdL8OJH66rqwBNtbgcNrMIad5E2WI46weVrIP5Nj1gWOgy7P+Lxcp97I
	NTXrAEtlRxCbpJ1nS+g9q61MYx02qbbKXz9/wvRjHJPPhQNvgy3J5MWXTRoVv1didFrWA/KneMd
	Ygz3rPVAjedgsP2k9rN+s4K7CgCQDNmdL3aL1c0g4mBJPw7Op2V+sKmkDcgOcbeHOPO80bAtXA1
	XkPteATX/Cvv2eCZplc4ZY1tR7DtcUi3K9nW4ZwhBH4wcG3HF47d6bbllKLXEKy0vQn3MnTXXrP
	pUciXLbAiD53ZvVZ
X-Received: by 2002:a05:600c:4f50:b0:4a2:903:a220 with SMTP id 5b1f17b1804b1-4a20903a35dmr22703455e9.1.1792664665114;
        Thu, 22 Oct 2026 03:24:25 -0700 (PDT)
Received: from ?IPv6:2a0e:439:c79d:0:8b1:fc5a:8f54:4a5c? ([2a0e:439:c79d:0:8b1:fc5a:8f54:4a5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm11373901f8f.41.2026.10.22.03.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:24:24 -0700 (PDT)
Message-ID: <d1534d72eae4fd210bda0b485ed05d3ef0147728.camel@baylibre.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Restart timer when eth_start_xmit()
 fails
From: Francesco Lavra <flavra@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kuen-Han Tsai
	 <khtsai@google.com>, Kees Cook <kees@kernel.org>, raub camaioni
	 <raubcameo@gmail.com>, Sonali Pradhan <sonalipradhan@google.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Felix Schladt <felix.schladt@gmail.com>
Date: Thu, 22 Oct 2026 12:24:23 +0200
In-Reply-To: <20260727165441.1969927-1-flavra@baylibre.com>
References: <20260727165441.1969927-1-flavra@baylibre.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Friendly ping

On Mon, 2026-07-27 at 18:54 +0200, Francesco Lavra wrote:
> The ncm_tx_timeout() function is run by a timer when unsent data has been
> sitting for some time in the NCM driver waiting for more data to be
> pushed
> by the ethernet gadget driver, and calls eth_start_xmit() to trigger a
> flush of the unsent data. If there is no available struct usb_request
> (which can happen when there is sustained network traffic from the gadget
> device to the USB host), the unsent data is not flushed, and remains
> there
> until enough new data has been pushed by the ethernet gadget driver to
> fill
> a USB packet. This can cause outgoing network traffic to stall for
> several
> seconds, during which the gadget device appears unresponsive to the host.
>=20
> Fix this issue by restarting the ncm_tx_timeout() timer if there is no
> available struct usb_request.
>=20
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
> =C2=A0drivers/usb/gadget/function/f_ncm.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_ncm.c
> b/drivers/usb/gadget/function/f_ncm.c
> index 64eabda2f546..fd84086473d7 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1158,7 +1158,8 @@ static enum hrtimer_restart ncm_tx_timeout(struct
> hrtimer *data)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * This will call directly into u_ether's
> eth_start_xmit()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0netdev->netdev_ops->ndo_start_xmit(NULL, netdev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (netdev->netdev_ops->ndo_start_xmit(NULL, netdev) =3D=
=3D
> NETDEV_TX_BUSY)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return HR=
TIMER_RESTART;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return HRTIMER_NORESTART;
> =C2=A0}

