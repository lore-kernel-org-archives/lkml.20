Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793925209;
	b=37+SUlAekJ6Hwzc9sIWKvKZODebIB+Imc60lzETSWyPBv+Zktomc1rOkwIKi0k496Lkd
	 dqbgPoV98fVoHJp6pI52qoklpQOkdcJCufrHtdokJyHcbyhnkeeWPLJmcADK9GgfLXMQa
	 Dv3CNPnZ+J6S1dsaM5S8aXJwHxx3NE/DdRvgPSgef3phWo2eTl8TlGEfXtXiVRJ+57EuF
	 2mKoL9GotD1b4YGmAeerQFgLqa+KdTgn23psnZlCAOFYyj6rrtwCBq8wJDFohmk77Vs/r
	 9ULC2XgIKJuL6GffZDNZKyoKRrCeb58JtbWUqswfOZyFUDKiYKjLUuODOIbN9med77g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
	b=hlSpYXAXVTLJWpbq7Od92Wz5SArjI84W43G1paebmfHFngTZ3iiJyW96gGDCxRV8I64r
	 SqVSMoE+Ojxnd9XWdqU83csDRYcmZmTHGKgYTPJKRy9AHeioRwe8Ebbo2CwCnxrMzp9l3
	 OO+/rZpZHrRAqo/4wdt3MkdHX0tVHW1hNVOQl0xYrrtBIEQhRHE7Y32hy+B63oWv87XYw
	 ewUsbvqJVZ50C4+asfJ+C0xp0gauwP5fg0m4VOS9bCBZW8Job+CDrUirpM5OcAmrnd/0U
	 JmI5lOxib+DmYfo2wPauB+WMVc64gyVLu9xU9+w6PTy7Pgp1Q/wnLVCtyWNLh+QzGdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ywu+sHfE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021B606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2021B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ywu+sHfE
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5383c97c8cfso5491cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793925208; cv=none;
        d=google.com; s=arc-20260327;
        b=FkpNB7yRmsxHEhw/MD2FE+kwDbK0bSUMCI9sIRHYAZG2eL7KIgjq/RuEM/VaJ+OoFQ
         xS6InP9+mpBKN1Kll82vImExudezLbSZnGh83BASpk25QvZ6nAC+shUG57FEDAxaQHHQ
         zCsLIB1T2ESULz055tFSBDzheRuWIu/+FpYY+XGLB7kz/YLfo1r68X/0RfvYsjM1bK2c
         9qAq/qB0rqy0rYHWjSrXkqPhUQZWDfe5aYXe6gFJ5tEJ7HEerXUU1XfvaFmaCeyizmz3
         Ktt8iSV+96yEOaf5hKFbXb3w7yAYYuL1NLwflvw/w5nGswQCMXTgTPyqmOxuPYkfDrwW
         7S7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
        fh=2gVL+5Q7h3KqGgPS7IeQLRqUh/+5pjW5FPX56C4/JOA=;
        b=HsobyjZbcGaYt2ikBXGnpIsmEB9M8RJ0d5xsIATiosZ0uteMpLZ2TfOquDs0vif1ZW
         SPx36NimHMYN5yQwIbWxDkRqMkE4U1WrV+7yZcPuR60tMXRyCvcPFuNphmjgSqajxDx7
         VOLpo22M4TuhFwm2n39zFI1WdT6RzATJ/kBIVDsv4KsdD0rBuY3s5ISehKWUhahsI9zR
         qZlseLeLDOrmMHU61elbOVQYBEJR8ulrHllxegfxHbGNCbNM1ESXTFBotmYIDnxJlh4t
         RBcwIXictpgDATEY3AFloAJiStp6nhh6ugHR1KXrwrLnXWv/0m5zx4D1vqQUjeAzvJmB
         nTRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925208; x=1794530008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
        b=Ywu+sHfEQDyswjTmGQokotF0uy7u7pCMR1FBPVPt/uNsbambe0jjQhrWBXTfquzB9N
         GZiNFD1lNrI+2ZdS1Tv/9mkxSh4zUclo/6ejLOo1qkntPK9yqrWWXXyXztvxwgcxo34P
         swCeIhL4ZNgjdIjw4H28L0g4fpaRDpvIgx+zfmvZiie+4msOl8OOKP5KfViJ3jVQpIee
         axQztJfZmKw5NBT3LA1Dzunq0a0wGb6S8okE4abdMKE60zQWa4351nRk4RjQCjKBY/TV
         8iO0zjweZMJabLuprxT9KX6flJRTA9R93M9WhgzMUf3ANqix4ArOKDfhKDBzVT8wAXGr
         9Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925208; x=1794530008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
        b=U3bgtrcmBmhzo1qqVsAgVwSd7AKlIGHanH3CwV26S7FwgSrQ7otKfSkEYtEXcLGDsS
         g5ZYuQq+lSfMMRbnL6r0EUk5CjMYRaVG06S6hzwYbI/qzVLQt2pJRFXWdK9bDnCAqxcc
         c48hyPx0FBDpPeIbTA9DhQj6ovt54hlaLjyZDWe6KYkwiXOAALWlWCLX8IslW0J0+yCU
         PaHa9XYW607h6L+7rlbgHGaHbn7SxndJWGMnaTlGYqOl5Gh4tWOd71qDbt87M9Bgklld
         anYNtSALv2nj1T6sKTFBHdeEIAEzk8EDxbXnNw0wDVwB3NdjdIP5M8ItSvtJqnn2Xc1B
         wYcA==
X-Forwarded-Encrypted: i=1; AKwUvBxVi1HuOo+gPkpcnavx4QbV6XEOewpzVf+xYASp8vX+fgvbCp6AmAmaFGFWnuTwTs8I3EGU8vFVCuJlSOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B4pCs5Tr31XbIFO5cJ5yCJF4CynrvMve4p4MXhfnhnR3Zyo6h
	+cJz6eEjrKRj8MYND4Fo/0JIQgfJOz+1PO/kd/SoFGIo0WYzSd5fVU32bFMDI1kM21VcULhaeoO
	PT7d8Stu4vgNLf9zNtBFX48qRCB/AEGRT4MglGzUd
X-Gm-Gg: AYBFou1UW2SLHrB5/uZhkZ/tel0meMWv1fYl/q1IS1vAkP15VroTDxSGBvSuE2r9PbG
	SNjkiiG3BdGk9KxllOKWzCodxm9MO7EwsCA50M9gKSLcA07jwylMUSzJwRHQnSahJjgkIuUAOyX
	5OFqtgSK2IFAzXArpByEj2sAUF52vFbQRpQ25+IcfzZznkLPx4Psieyc3gM6S4qA5uR6rpi4B1L
	67+2+n2CysU8qEUxh9eZlXMVROVga+Cj1l4yTkvP+Aob45O+BW0vG/WlLcWLyUw4gNFO4ZMOtYb
	M68MtkMOIl77nlAE5Mr0zZizc+XONJjLYHOKv1RN5+EUg3z7YAen4md/Tj7YwuQyEvu+swUlIwZ
	1ezQJmoNVbIDpM3/A0CkBbb6BwoilXngoXDo=
X-Received: by 2002:a05:622a:4012:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-54e1aca53b6mr6923411cf.3.1793925207042; Thu, 05 Nov 2026
 16:33:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030043145.2185700-1-weiwan@google.com> <20261030043145.2185700-3-weiwan@google.com>
 <DMMQTFS3ULM2.3HSJGB1UT085M@gmail.com>
In-Reply-To: <DMMQTFS3ULM2.3HSJGB1UT085M@gmail.com>
From: Wei Wang <weiwan@google.com>
Date: Thu, 5 Nov 2026 16:33:16 -0800
X-Gm-Features: AclHuK9xp-pEOHgQDu3wgVgSsasOVenE5wfE8_PWHekQkM41Loq5TSIyXBPNcLU
Message-ID: <CAEA6p_DCmSskWz5VUOQTmgcnsFDTKH3mSnOdxOxEJg2CU4k0vA@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests/net: psp: test bidirectional data transfer
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:26=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.com=
> wrote:
>
> On Fri Oct 30, 2026 at 12:31 AM EDT, Wei Wang wrote:
> > _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
> > only verify unidirectional data transmission from the test socket to
> > psp_responder. As a result, they do not exercise the receive path for
> > PSP-encrypted TCP data segments arriving at the test socket (such as
> > packets redirected across a netkit interface associated via dev-assoc,
> > which relies on SKB_EXT_PSP surviving packet scrubbing).
> >
> > Use the existing "data echo" command in psp_responder to verify that th=
e
> > test socket can also receive PSP-encrypted data from the peer in both
> > _data_basic_send() and _data_basic_send_netkit_psp_assoc().
> >
> > Signed-off-by: Wei Wang <weiwan@google.com>
> > ---
> >  tools/testing/selftests/drivers/net/psp.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing=
/selftests/drivers/net/psp.py
> > index 473500901879..e507951b440b 100755
> > --- a/tools/testing/selftests/drivers/net/psp.py
> > +++ b/tools/testing/selftests/drivers/net/psp.py
> > @@ -120,6 +120,12 @@ def _check_data_rx(cfg, exp_len):
> >      ksft_eq(read_len, exp_len)
> >
> >
> > +def _check_data_echo(cfg, s):
> > +    _send_with_ack(cfg, b'data echo\0')
> > +    s.settimeout(1.0)
>
> I'm not a huge fan of setting the blocking timeout here. If we are going
> to set a timeout it should be when the socket is created. Otherwise this
> function has an unexpected side-effect. Another option is to use non
> blocking reads with timeout like:
>

Will switch to non blocking reads in next version.

> def _recv_careful(s, target, timeout=3D2):
>     """Read exactly target bytes, tolerating short reads"""
>     data =3D b''
>     end =3D time.monotonic() + timeout
>     while time.monotonic() < end:
>         try:
>             data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
>             if len(data) =3D=3D target:
>                 return data
>         except BlockingIOError:
>             time.sleep(0.001)
>     raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
>
>
> def _req_echo(cfg, s):
>     """Ask the peer to echo, and check the reply arrives intact"""
>     _send_with_ack(cfg, b'data echo\0')
>     ksft_eq(_recv_careful(s, 5), b'echo\0')
>
> > +    ksft_eq(s.recv(5), b'echo\0')
> > +
> > +
> >  def _check_data_outq(s, exp_len, force_wait=3DFalse):
> >      outq =3D 0
> >      for _ in range(10):
> > @@ -478,6 +484,7 @@ def _data_basic_send(cfg, version, ipver):
> >
> >      data_len =3D _send_careful(cfg, s, 100)
> >      _check_data_rx(cfg, data_len)
> > +    _check_data_echo(cfg, s)
> >      _close_psp_conn(cfg, s)
> >
> >
> > @@ -726,6 +733,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version,=
 ipver):
> >
> >          data_len =3D _send_careful(cfg, sock, 100)
> >          _check_data_rx(cfg, data_len)
> > +        _check_data_echo(cfg, sock)
> >          _close_psp_conn(cfg, sock)
> >
> >
>
> I'm ok with the approach overall. The coverage is sufficient for the
> purposes of the series.
