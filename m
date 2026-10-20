Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510452;
	b=iVdQRL/lZDQpchBOsR52Lwt0fJseBnkFvR8MyJBQrxAfHCr57woJuahN9YuaOwqc6Afp
	 03hS8BpwybNavzRl6aP/9AEab9oBwNkZcooByKvgr8JA7A91IRfWZI/XOG4OQNmS5l/JO
	 tet1bHLbGo3H6EnakmN9x8XCm5nErdC+v7jEhGYQAdmxHkNQPjRG5D9UIraTyQJA1R+jO
	 D2GC7+ErkDZnOE0x/xZpybbHilVwleODgshGrqyPp3QS5+R55FdXb7oxBvTZjYV0FqFS5
	 2Yfk7TI+u3qdf1DJp4WFByuaItz22PaOww1rajxtGU3pcLuzVe6dT9Gobjqd9AAyYIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510452;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=sO1PhZjq6o6BXb2HXe/PM4VjDQ9u/0YYvxXPAXHF2z0=;
	b=NHoxk0xokgOAI++XHDOInLQCfWGUh2OF/xHPpAevYXMS228d5GIBBJxReL/zrw+iniuN
	 vkRanNwIn9TKZMfKMJ4gpnY9jNmUXlfPNruzgQ2CX0EoJtufFiVJeoECHj7S+qZ8JXxQ0
	 RUlBzeA9tK8qtxU6JhBP3SsjTCNLFFB83FpQsnlKB0wziAfNbeMhaeorNm9lPakL8eCON
	 8/GbEUMjKOIi0p6RUybCt/K/KUTcoJUv1ytTxv/igNFN55kZcunnmRSJYbsIVv18dv8Km
	 o/VTH7gmCd7/S2awDThFAZbvjmTQg8+s2MWYMmudiR7f9HeJhKB53K5jR3GKbRuJPHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HUMUIWb2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cRWdUnuB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98377606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98377606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HUMUIWb2;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cRWdUnuB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792510450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sO1PhZjq6o6BXb2HXe/PM4VjDQ9u/0YYvxXPAXHF2z0=;
	b=HUMUIWb2+CMERcomexxzbp184YAoIkWJvZH3T0cvkK02XK+h6Ar3fEZdw6fS5TE47spfAL
	Qj2XeKrJs/HoEe55/nJa2pVAGAjngrc88MKP8JS1IzqGfeuPs7KxuQZghzKKIN7dEGsTak
	hdRIRMXym3AVOgyV9QL66cTcR83FEgU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-_SpKQZo_Pry0lSlDTKU-Zw-1; Tue, 20 Oct 2026 11:33:58 -0400
X-MC-Unique: _SpKQZo_Pry0lSlDTKU-Zw-1
X-Mimecast-MFC-AGG-ID: _SpKQZo_Pry0lSlDTKU-Zw_1792510436
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab442d8d13so9734381fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792510436; x=1793115236; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO1PhZjq6o6BXb2HXe/PM4VjDQ9u/0YYvxXPAXHF2z0=;
        b=cRWdUnuBC/4Q9noKwrl6U/kMO123th0jAAjmhbTA78FLHgSpXU/u2/cMuuqhGGNTcN
         wkavo1g3Qto398uokxhEVipV2Mw/Tnkfxsgvx3chkGqNxvfoUHzaUxGJDteFrLRcdYv4
         ZEfCBxoRz7kOlrvMDLFPuZjegp/v00OmuUyC6fB0DPuHtCnx+HpO4vCd1SQ4oXYgeVHS
         4gsCaujLJSEa8AsW8LG/Xs8irolZpujx6/PJ6iHTvsulYDFDuWD80Y4YrONkVeRWN6lV
         QMs+n8GIq+M0hxiIAEKUf3DS8XrrGY3uKvYHxb02VNZu3/YXwSrWHRlCUL3DRWQ9nSjk
         2nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510436; x=1793115236;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sO1PhZjq6o6BXb2HXe/PM4VjDQ9u/0YYvxXPAXHF2z0=;
        b=lTde3wNHtrPx2zYtqD0NuhjlCejqgMY5FjUkVlEI8c60n0fX2fNfH5ZHXPYzWuIOW1
         V3DQ9d+7NpuJNsrS3PrsVE6CAtuY5p4kytKuT8VrJOA2nfdDmDydJ5tLkKbmn8TQw9Wt
         lgoChK/cGUxPHzO/Yh0zeYr7IKiYBqA1E7VgfJvLdrVIZFVg2of/F7bnmzLApDdrC/vc
         Q2BGFlmBNdlKzQxBe41NrbKYpL7xGP7yZ3Uw/Xz5R3gTeJDuF4Qs4uqCM6JFqvPhnuZH
         x191mJ8ZJBCXP1fBoXH3MYEd3mu89hQOzr1buyB7CZPUanoU16SCISRZ+OMG8UcNKwxk
         cP9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuHAkFRimINBoZRQ7w9TON/9zUdtBg01Fo/WzP7KqQzgbwCm1IFa83nnA+gJNkKSKiGqWxsn7saV8nDbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKouC2Jae/O5kGqvcR2GlNBeR/k2mHCmtDYSWEF6ffNNLaBWuHD
	fdpFzg4abc/5BmFC2j1B+NKipRMjXn9LXyEdDrbPemGX3cNA+9a3ZRlJDQueDUhJ9lcd7xRXo1c
	TNlN3yeOvYuenToU5wDSBqSMacO6jarlIT4WjG9OBKHy9a8RV9TG+qM47J/hZ6IHSlBm8jvRaSw
	==
X-Gm-Gg: AYBFou1z0ieOKzs3xof348GXOzTTIEmnTgCeTG6BIlZSmRwNvulOG8hNq09LEbqK+78
	LKAzQD0Gf/H7mt6OWxdPiXSCmJLipsSIbXwcVlWoZVha6IdIAa4fztudObE/pFbEQ+zH1rTQwXD
	jf0HvMAkdRLsTGB8nFyZ/BEz5hzF5jl/KsfhP48WVNjJ1nB/cC9bsoewN8wRv8aBQnQVKndVbEv
	38biPv08tu1z2c6qgDVu8NHFXnbtj0rev0XIms3Y+JFXb6r9U4tFN3iW5khCy5HFL+qw5i8A9ms
	pvWNXG/PzAwBOGlpaTSvOt1EhiaCq+ehAaMtWYFypNDukYqk2Qu3rauGM8gPsmc++WuomL2q6hY
	mhKZ48jluEq6nR4oVZTKQDIpg1g==
X-Received: by 2002:a05:651c:41cc:b0:3a9:9b0b:b781 with SMTP id 38308e7fff4ca-3ab292ffbe6mr26264521fa.27.1792510436407;
        Tue, 20 Oct 2026 08:33:56 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6f:b0:4a1:d307:d578 with SMTP id 5b1f17b1804b1-4a1d75e6d1amr214085365e9.11.1792510424903;
        Tue, 20 Oct 2026 08:33:44 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm90373845e9.15.2026.10.20.08.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:33:44 -0700 (PDT)
Message-ID: <363cbfd91b059df208a5ddbbe45f8ad2d4cda21a.camel@redhat.com>
Subject: Re: [PATCH v7 00/14] rv: Add task latency over budget RV monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>, Wen Yang <wen.yang@linux.dev>
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 17:33:43 +0200
In-Reply-To: <20261019154853.2fe2a47c@gandalf.local.home>
References: <cover.1791745088.git.wen.yang@linux.dev>
		<3eb0948c9ca67f64b3b311f823cd0f7628033c68.camel@redhat.com>
		<6a8b5d26-37cc-4a8f-ab1d-0df2c2e6c2d3@linux.dev>
	 <20261019154853.2fe2a47c@gandalf.local.home>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-19 at 15:48 -0400, Steven Rostedt wrote:
> On Tue, 20 Oct 2026 03:18:48 +0800
> Wen Yang <wen.yang@linux.dev> wrote:
>=20
> > If you're OK with it, I'd suggest merging the series in-kernel now, wit=
h=20
> > 1-8 and 14 kept as the shared infrastructure and 9-13 acting as the=20
> > reference implementation the BPF backend is measured against. I'd be=
=20
> > glad to help with the uprobe and timed-HA pieces on the BPF side once=
=20
> > they're on the table.
>=20
> Well not "now" as the merge window has already opened, but perhaps for th=
e
> next window.

That and I'm going to need to review this series between a few planned holi=
days.
I'll try my best to squeeze it on time for the next merge window.

If things are not ready, I believe we can just upstream the infrastructural
changes first.

Gabriele

