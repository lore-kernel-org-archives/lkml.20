Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FFE36A376
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837598; cv=pass; b=fZEoix33xo0bI7M96TK7zG5GP05kySLREEy5Fj0sSnNyUUD8dI2aDzvDFtG6sTeSFF5evW01T9PTwmDkQ9TkA2jW5MnRMUyuc5+6WfgfyHr0nUEmfplYyXkroqW80T8csOOkaPYtWF7ce4mjHTkzQgTIkxfX7cP4nRolyvSKo/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837598; c=relaxed/simple;
	bh=Z0BUfO6J0/D9ZNvgHXAnJmtCzKc4H+18t73WEKcd6fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSLUguE/ZkHBoA4638BXJAo5yxJMaXnWb9jFlBG5CXchzEA72fqlyG4yu1pfFZKpxgV6Ghnv4Cq80eoDjqZtvRk+xZbQaRTX45nzrArkPrOWrrSlv5uoPg9nIS8dzK/axUXigtbwqQTnBajtZuExZ9LcdOILODqFY3A6ba7Cu18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3EaDUBH; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3EaDUBH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52eaeddc837so8387611cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787837587; cv=none;
        d=google.com; s=arc-20260327;
        b=mJBWK2DHxHCzFjKY8htBHV4vQRGLnKlZNl29gB7SfaYbdMwOz/0fKXSeCqFMPJxU4w
         ipMhfEyJ/xqKGDYCiIHhy2y+JU6WMpfoBdihBW18Z9nVj/WbZJOFzag4CoTmH8IEC1Nc
         8yK6AxiKm0AeUFxhfPS6LmSKCKAp10QkBanQkAS25RfiRc+3O17bFkgDr0gC96SBwb+a
         Xv4KPC6+i0/XWNXvIdTJROJFg+SsRcV5IcDBKN4g0nUwhKQKjYXDEnp1lVChJZDZhENx
         sRkpSeWAUJvZ4NrysnQddosZM1SmOBjH/WxJD89WKNN8wxjy9gMYevW9VdDjSfdPutmp
         mBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TPXhT/cNmuvLcD38iQd3+f5EkAYP1aCkwHKjXM2QWsQ=;
        fh=vZ+UO3XvRZJC3QzlFR4d+8GsvrYvGKSUYdTKuo90xMI=;
        b=dYITZ/7qx5p3VhtYDVrx1U3ydB3DPUm8/CO9lErPG7W2hV+U/wq8Pazv+vDn4QhDEx
         R2/NEBO9G3yNyjRgo2M3yZOAXN3Zp9zv4IuWS8Obu2NULgvUjTiOuvUGfGa7lakAAqxn
         kRMOkN9clmUjT6neyEapV0PkHMAhVCDofx1YvG7T1zepbGeOE+Rq0wrJGEsRUQDLOJVi
         r5H2eH3G7s9PXCpY+L6WjWCAJNdZYMHkmpy/xLxvJCHX9GBtihvJrGPZPoCyukTVxuic
         90oXSJ/Z1/IsXvSJRoIywWEwgA4MKixxmtgBCTmG3sNJ0efgfONGmGkzEA1tdOho6DEM
         hilw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787837587; x=1788442387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPXhT/cNmuvLcD38iQd3+f5EkAYP1aCkwHKjXM2QWsQ=;
        b=A3EaDUBHuaVjDfpQTzfxNZC7zU6v0NALBISylAsdklGHvfvxYuoYa71AFG1CIE+osw
         BJiLNFrhrU6mx6ygkvTSD1aYsxrox1XnoZYF28oJWHYNS9TzUZNg9gvEFycGFZAlFTvZ
         QVf/A0LhYvswyRsthy1W+smPF6TOT4MgFzMGv2kDS06LA69wWs0bR3h8Mt0YqApf6aNF
         0j6M4khl79uF62zuzYk62YDRbRSHGw5EDDD4L1KbhySBnD8fhRJf5dC2OmLM22wwfQDB
         6sKdhippEKeNK3R2JzsjrTEeOlZsyp0LNaBNJzBn1+6oUQT6d+ePtjEti84NswtR7VP4
         HlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787837587; x=1788442387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPXhT/cNmuvLcD38iQd3+f5EkAYP1aCkwHKjXM2QWsQ=;
        b=SYr9IYpI9HxsAPOEhOkTkAH2BnIU7xk3wbNyRI0ZaikMu79HDbhwuGSWAdp1Z6d+Yw
         vnpAdzzMzf5Pv6cGHUjj3KYORrNUi+FeWgrP5OKilj+jsZ9hablStLz7sdhdDMiYWT9P
         0XZdMP3wis914gRtF9jw/bCjQ7ju2BZXssnO0RjELGtrhKHAaS3obAxo8HJlK+QAldqn
         vf6LvS0WzOlnpFsOIAI/9F8g+5JIFRnJdl2zai+7OcIrtlbAxKTuBAuYNh+nTNA01xzK
         qrTBjqVtIqIt2LGafNfYUfCvcvUFaajXyvYAogBLyXV+NB7Ys/9JMuSedrplUj0Q7KHV
         rULw==
X-Forwarded-Encrypted: i=1; AHgh+RqEIAFLJLnGcaEcv8BXm61R5UMH98SC5OLiokzB7MljoFYYCnd/UnufRIxhKo0JzEcf2uveUMx7xOPpwsE=@vger.kernel.org
X-Gm-Message-State: AFuF++mR0B/8DKnUBlQ75yN+FaM9trwm6hPaOrpUfqLAFxUwM+efmRTf
	O3+LpgKH85Y4p6eJgsirgEeNqtErxWOw9n3Ng9PUTxEL4+ytz4TyqD0wv/RdCBiBrg5wmxJA6RS
	++zfUJXBiirDeDBeFYFbsCzAmcmD4zxzwrhKFYZsm
X-Gm-Gg: AR+sD10DwXZA2phb42/iAp4+khWLsvQHtkMU2t5tfA9OEuinxVc3duZMZu0TFscKKpg
	C0qdLCOCsTfkFb51/+XetR+ALZ7zO9zfHZmZrwhLkzumaMhDbZqIk7RPcoktDJglWMcyapYmOHy
	ABf4m9wX/8lg7NK+Ik8b7ZJydA3MDcm5daxpZxYlsT8ihjM96w7nvUn2zG5qguPtyrZlmP/3im5
	K2EIDBxc/jNS6X5Gl/wfv3W6yu69q33EUKtYm4+YpnNNoc8effiVRKIojW3O57tlD6twX7wCZOf
	FhiduyGK/oaxVT1bUGFkjWmhUqp9g2heg08Myd+nwAKegXD3fOI4kAGOMIo8dTyO3xIKVu/fyXM
	snVdtYXbB9vArNR7tv9rCh/D8NvRoP9kfH9YOYyCUYXXkIx81HazYHZpDOsw=
X-Received: by 2002:a05:622a:5593:b0:516:dda7:51e0 with SMTP id
 d75a77b69052e-52e422cdf9fmr165432141cf.17.1787837586225; Thu, 27 Aug 2026
 06:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-wg-tstamp-v1-1-4acfebb855ef@well-founded.dev> <87a4q74rrg.fsf@toke.dk>
In-Reply-To: <87a4q74rrg.fsf@toke.dk>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Aug 2026 15:32:52 +0200
X-Gm-Features: AcwNN1UFHwjzPa1MzfktU0Iree-PWZZeotNBaKEOr_oEpX7vLWfiqFmBagJlnXY
Message-ID: <CANn89i+-SigypyE=66gnwxgz3-T7mBkWb1+UNDQCYOuFPmN2Ng@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: queueing: preserve tstamp_type in wg_reset_packet()
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@kernel.org>
Cc: Ramses de Norre via B4 Relay <devnull+ramses.well-founded.dev@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Martin KaFai Lau <kafai@fb.com>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ramses de Norre <ramses@well-founded.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:28=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@kernel.org> wrote:
>
> Ramses de Norre via B4 Relay
> <devnull+ramses.well-founded.dev@kernel.org> writes:
>
> > From: Ramses de Norre <ramses@well-founded.dev>
> >
> > Sending traffic through a wireguard tunnel on a host using the fq
> > qdisc fills the log with:
> >
> >   fq: likely mono tstamp with tstamp_type 0
> >
> > An skb carries a timestamp in skb->tstamp and, separately, a
> > skb->tstamp_type field recording which clock that timestamp came from.
> > The two have to agree.
> >
> > When wireguard encapsulates a packet it calls wg_reset_packet(), which
> > clears the fields that must not leak from the inner packet into the
> > tunnel packet. It does so in two steps:
> >
> >   skb_scrub_packet(skb, true);
> >   memset(&skb->headers, 0, sizeof(skb->headers));
> >
> > skb_scrub_packet() deliberately keeps skb->tstamp when it holds a
> > monotonic timestamp: that value is the time the packet is scheduled to
> > be sent, and the qdisc still needs it. The memset then zeroes
> > skb->tstamp_type, because that field sits inside the headers group
> > while skb->tstamp does not. The packet therefore leaves wireguard
> > carrying a monotonic timestamp labelled as a realtime one.
> >
> > Nothing noticed until commit c4f796c4f16b ("net_sched: sch_fq: convert
> > skb->tstamp if not monotonic"): fq used to assume every timestamp was
> > monotonic. It now consults tstamp_type, spots the mismatch, warns, and
> > falls back to treating the value as monotonic. Pacing still ends up
> > correct, so the log spam is the actual problem.
> >
> > Save tstamp_type before the memset and restore it when encapsulating,
> > next to the hash fields that are already carried over this way. When
> > decapsulating it stays zeroed, which is right: an incoming packet's
> > timestamp is a realtime receive timestamp.
> >
> > Fixes: de799101519a ("net: Add skb_clear_tstamp() to keep the mono deli=
very_time")
> > Signed-off-by: Ramses de Norre <ramses@well-founded.dev>
>
> Seems reasonable:
>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
