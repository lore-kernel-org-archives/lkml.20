Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482640;
	b=0LPqsVxWYLV7lkBk7s2M2NVq0llSbj+md1vhQAsfHhI4AdWQWZEGEqlQzQQBuV2lsGzU
	 5c0i2h+v1ok4c6eN1dDuI/+gGamn9UJLtKnzRmNoBIuPGgdKp9xq5I10GiD442biJZGwG
	 yiCegxxUEP18EH0AUYShvVJ7LvoZCaaKrYTA4zjVzlcChaZn8+CfVuh1IXK1/LRA6r7IY
	 e1OkTshckMhsiUzx5lXNuyghRufnuQhJsPXHVIhneYq1+qbBLeR4rErCPvZFud33bInpX
	 m00ih9PolQBuwvuL6NLlAjVt276Ay55oKBYlI7fXXc7sQU+O9Cyln/QQInhxBds0Ytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482640;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=eL00FFNkl8ARbho6ymbLoUfkpUup+XSnywEPwkoXmUQ=;
	b=M/bB9tq3qWnhkTFyq/cp2rkcqaMVx5kFLxnN+R179gd3m21zF0bzeg46b64RkMqx6TMN
	 eGR5hHwETjjuhmufosM+hOLfcg21Qqrjn/ljEWlBXc3awuA5504s0LYc9OzmArE+m9ErL
	 u5vnpJ7fvPlIhFrTAydObccPGT4qclcEZeCyWa2dr9LSZsT0VyUtrinfPga6yqxTCZSm4
	 JpiRhVhHP3o4LVHH4RSf8B/8lHIZblR9rFAmW8qr+cJPJ/b6n4/pznYfk3RiZSxT4dXsa
	 pT8tdF5mTmgIF4XL6yzdyVGeZaPj7D/ZIGP2njYSboXZIU/hF1ukV+mGcynAaLM+PVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hOO5ZHmT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UNJHsee3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D33606A888
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D33606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hOO5ZHmT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UNJHsee3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794482639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eL00FFNkl8ARbho6ymbLoUfkpUup+XSnywEPwkoXmUQ=;
	b=hOO5ZHmToaXeDBjbG5bpFHv8cnAuUiTvVwKMK6HEt8WhKTljGDYydivuXDjJkbtI1jjWAj
	k4P08Z9ha0bI3T9AvUOfJZkX2xKweUkfPienJ6jlvugurwmGI3SEr7UgxJxXTDkNtUJbgm
	ISmRfcJhOy/9QPdSmRmaCf+3RXJDAhU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-Tz_r0Ec-PlqurbYHuKw1GA-1; Thu, 12 Nov 2026 06:23:57 -0500
X-MC-Unique: Tz_r0Ec-PlqurbYHuKw1GA-1
X-Mimecast-MFC-AGG-ID: Tz_r0Ec-PlqurbYHuKw1GA_1794482636
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490c69dc02bso3590656f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794482636; x=1795087436; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eL00FFNkl8ARbho6ymbLoUfkpUup+XSnywEPwkoXmUQ=;
        b=UNJHsee3fRve0dXlGgSEnOT8+5DYrsGlKdmzstimFMQqh4yL0uiJySlWyIYIuW9G/j
         AXznMxcq9MR7++sxhelyDMr956oQ0ooLkYwibw1Nr/9ntFGX7A6oTCrSMPAwggOC82hm
         BTdBLlOlby80tFo7638NEl3PTXvF1UneqgHKffisH0tkF2p3KPLAtdp+TguQpMm43aW9
         FvHVLy9AeJ0YZVOX5E5urYRg0zaE4j/e7DwoNojcQ/MjwfiPyCTmLpz326f9NpEmNWW3
         5RFRusFx2qflNtaW+ZYhecB3sdFzd880B7FDapKUBR+dfhbBq5Fy1FO7zUQncrmifc5L
         e/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482636; x=1795087436;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eL00FFNkl8ARbho6ymbLoUfkpUup+XSnywEPwkoXmUQ=;
        b=dFxFbzm7itiGwX6Pd1Pgx5i66e4rraD9u3fLf9surUT24tqwEEVKz9tKPfEBc2y+Ik
         WCboSDKBDrwf3bgCj/BKyOYh1z5HO5+R6mFbp9BxUnU9J1QDfZq1y0p++LYSoBcWxkEE
         Pan7ZMib6pImfSpnATXhTBCaLEnQbDCjU+vY8kvfLIHlhAB7WhOBpPVOULuwpKcrQr84
         Epex0uBF3B8aTfGZ04Rkr/T8rAnKr27Far/m99v9yO+vsWdItfwczMrBgZZ7CSKj4rIc
         /UFl4ywhqAHHKze7KpZ39qT+2g1/qaGW/110Jyw7mJWuTbWG6cz+7jGB7MpcC3hvK4DW
         y4rQ==
X-Forwarded-Encrypted: i=1; AL+hErHkWYcOo24emdXn4JdqmCp53p1QtlW+fHY1Pv+C6QcEyP6DrHeODNpa0mIHslJWW84NmUKmTazqBJ6QIWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PQxN4Igji1+vTqt0op7hksZoCcx7cKF1RXBxtzYBABUTpKZ8r
	RcyAW2ln1GtyCvIR/dx7VA3QKFaG3adRoL+9Fl254YZabqI5VlLxFiKvt5YO3JyY0b+a0EcR/o6
	h7QhbYx4YV3hriZ2lJHLVI5ULJX33vTXvGREuLWgHau4qLMNSRa9aJSJ54lWbEuVGbAruqBIWpw
	==
X-Gm-Gg: AYBFou3LxWGH9c5WAAvWNyRv/nBuhFYySAGa0BkmqfKqgus0Ip3ggLRZjTzzO9BUGCH
	O98T1mvARioPLPLyytgqw3DmG1SHz+6mNG+KzM5N4TP1pFEQ74YV8K1PsAeIdqCzIUoJEYLXwfm
	E8OOsbgqdR/ZJrjG0o7NjcvB6TnJ0pmVa7x9udblIwqPh4XehJefqsVxSfNmwOeywM8ULCoyaJp
	ZCX81KDVOnjij874tk7lezEs8RKP6AmiIY8vCazN3NSKfDXVpD3GTwyycQA7SHi8lIa2kcCjKBi
	5CstTvVchYOOkE1VTNpkDynB5RhCuyTGOa4OWWLNZYn8HIKLUEufG3XZyi+fSohKJTIIM2lU+gp
	4g4bOk+oKQEyX4Jrwcy3G6lEVxTz3k21gQS7QqlzDLdjyK4oPtzkf2vJka0fw9p3YafW63uVK8t
	ItFA==
X-Received: by 2002:a05:6000:490f:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-499c6f8d887mr8640194f8f.23.1794482635969;
        Thu, 12 Nov 2026 03:23:55 -0800 (PST)
X-Received: by 2002:a05:6000:490f:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-499c6f8d887mr8640154f8f.23.1794482635530;
        Thu, 12 Nov 2026 03:23:55 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm17112948f8f.38.2026.11.12.03.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:23:55 -0800 (PST)
Message-ID: <811fd37b6e87ada820dd59c676e2ef23a999d07a.camel@redhat.com>
Subject: Re: [PATCH 1/2] rvgen: validate the monitor type
From: Gabriele Monaco <gmonaco@redhat.com>
To: Chaosheng Qu <chaosheng.qu.linux@gmail.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Nov 2026 12:23:54 +0100
In-Reply-To: <179447882046.254241.15114935256138596418@gmail.com>
References: <179447882046.254241.15114935256138596418@gmail.com>
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
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 18:20 +0800, Chaosheng Qu wrote:
> From ef3ed8fae481c0ed3dd16c881aae455be9e92f2e Mon Sep 17 00:00:00 2001
> From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
> Date: Thu, 12 Nov 2026 14:26:10 +0800
> Subject: [PATCH 1/2] rvgen: validate the monitor type
>=20
> The monitor type is pasted into the generated monitor as RV_MON_<TYPE>.
> Nothing checks it, so a typo yields a monitor that cannot build and the
> tool still exits 0:
>=20
> =C2=A0=C2=A0=C2=A0 $ rvgen monitor -c da -s test_da.dot -t bogus_type -n =
bm
> =C2=A0=C2=A0=C2=A0 $ grep RV_MON_TYPE bm/bm.c
> =C2=A0=C2=A0=C2=A0 #define RV_MON_TYPE RV_MON_BOGUS_TYPE
>=20
> include/linux/rv.h defines only RV_MON_GLOBAL, RV_MON_PER_CPU,
> RV_MON_PER_TASK and RV_MON_PER_OBJ, so that macro never resolves.
>=20
> The accepted set is already in Monitor.monitor_types, which the help text
> prints.=C2=A0 Pass it to argparse as choices.
>=20
> Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
> Assisted-by: LLM

Looks neat, thanks!

Some minor issues on the submission itself. Whenever you send a multi-patch
series make sure the patches are part of the same mail thread, this happens
automatically if you use git workflow (format-patch, send-email) [1].

All tools expect that so it's much easier for everyone to see and apply the
entire series.

You'd normally also add a cover letter, but for a simple series like yours =
where
1 adds the feature and 2 tests it, I'd say, you can skip it.

Essentially if you want to do it manually, the In-Reply-To of your 2/2 shou=
ld be
the Message-ID of 1/2 (or of 0/2, the cover letter), but I strongly advise =
you
to use git tools.

Also, please use consistent commit tags, so both your patches should have
verification/rvgen: instead of whatever you put. If in doubt, use git log -=
-
oneline <modified files> to see.

Finally capitalise after the tag (e.g. uppercase Validate).

TL;DR please send a V2 where both patches are in the same thread and the co=
mmit
messages are:
verification/rvgen: Validate the monitor type
verification/rvgen: Cover an invalid monitor type

Thanks,
Gabriele

[1] - https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l

> ---
> =C2=A0tools/verification/rvgen/__main__.py | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/tools/verification/rvgen/__main__.py
> b/tools/verification/rvgen/__main__.py
> index 246b43fa2..6053db5e5 100644
> --- a/tools/verification/rvgen/__main__.py
> +++ b/tools/verification/rvgen/__main__.py
> @@ -38,6 +38,7 @@ if __name__ =3D=3D '__main__':
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-s', "--spec", dest=
=3D"spec", required=3DTrue,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3D"Monitor specification=
 file")
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-t', "--monitor_typ=
e", dest=3D"monitor_type",
> required=3DTrue,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 choices=3Dlist(Monitor.monitor_type=
s.keys()),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3Df"Available options: {=
',
> '.join(Monitor.monitor_types.keys())}")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 container_parser =3D subparsers.add_parser("cont=
ainer",
> parents=3D[parent_parser])

