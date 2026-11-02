Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642078;
	b=CGpfDxEOLVC5aJV57eDO/s9/I1e/Kk3IX2GOwAJ4bbG6qgpPEUsfWcpmWD9pZc4WQ55o
	 CHu+BFTkAMFUAPWVNAkOSsOiWfU06QyYIadd2UOG8TduN1DkOm/mtDdeiPeXAKnD4Gmdm
	 nKdYwZbCM/ocmfRxMekJBm1g7H2kGvvxLjZsz2K+GDPtEwn4idBzSlZCaq8cdJBcKCQEF
	 Qpb66xhYi4MlL8fOa01YtVdcMZtehRrGXLRJvYYi1akzlcGT5fPnKmSy+U5CQAZyThEry
	 CHGw0IhxcLoWgakfWbQxR3P1bs5EzRhf9QvwP8h6XMI/vT5iki7+yLP7wBTssQ6g9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=scZeb17XXKm1k29PX4odbDUwJgulUaI/xTz9Vkg+cZk=;
	b=VbuFleJEKD4OeiW/LSeb53KePz3wAo+/mIvH4hKwHIW57u9AwYahxmisbP3fwqYFMoW7
	 tZ5GYEbXI1klsHBUIQFW2Y819Ks/hEYlGeI+8Tail48H+dcZnRoKJF2p92xZjXXHmCxsX
	 6nS+HPeBqHuS5OSeplcN0dQoF5jv3dTFoz3xN7HldaNGTGZAX71WLSst1TAqPmfJr8e6p
	 /HkExtntWX9nM9DzJOwci99MtT1iJRRpXtnHaKms62D88IBHRLBzNZ9FFKBSXo5eca4ro
	 uMl3zEXLiatYgbDp54lfFD3GGF9T26P0fL2fYqAH4Z119I3i4jujXAQFIJwnaOHbwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUUKJZ6i;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74FC606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74FC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUUKJZ6i
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so779355a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793642077; x=1794246877; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scZeb17XXKm1k29PX4odbDUwJgulUaI/xTz9Vkg+cZk=;
        b=gUUKJZ6iE6kMeJX2wngFOmJfdj34tHNdukYJ2763/cO78pWzbLpFiKwzNJXe3kied2
         6kOgIXV1pK+gXNCLw7PW7dyddapp/S+ZcVxmvmI8KmVa0VoZ4G5IHs5nppxRYhKPGT7Y
         CXLAw5MZ/pUJt6atuEm+Ut8tbfdqBO8uutAUQDoZnwmkmueSobeQS8dX5HM8wTn402vr
         3wS6ZRFTtpf0Gb3m6ojljLsWlt9sPRQFXyDhejy0lUVPBqlO0SD1ofi3XKsNk3TfQJWy
         TpJPR76fGTxghSMr+8VmSiaWD7DKO/AYuW3IK0YYGNoTMz8CzEs3U9466f6bOQmwQYZm
         GWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642077; x=1794246877;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scZeb17XXKm1k29PX4odbDUwJgulUaI/xTz9Vkg+cZk=;
        b=uC+jcZ3zYZGJCqo0esvnXFtTjQ+Rb7jrV5BULIhGJzrK9mLvyae00Tt+BbUuVtx2KL
         tVGUnxkwuTB+iScH8JQTEITHpYIs1A7H91aT57GjNLwofhWWg8rXb4YHCB1qcXJyyeb9
         Np5SruQQNtmuilElA6CC+5ITRIx+zLRYQ8kCGrc6H1Be6K1sw+NBFTvMEjn+DyQRDuDn
         vN4ljX+yE8a3GFcCt62LGnahe3gaftDKq4Px/bRWlms2go/nnnKzflfITQJbGncjc4e9
         qp0FmiH0TQffsHGr0DHfpHIIwef0NYh9VIAIhwHBbwMMCdoDIvyCLcd/uumcufojH8kA
         KzTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+8XTYpZYq4ShvloKj/NTzVFxCJ0zxdpire413DG/QxhnK99i1ebhPrRm1FzvtQo5BUwCIeW8v5GvEiMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rgrQE6NO+oRMa8x+w2IVpUcXbO5qI2uFgwcyfNnKs9h8w7ykv
	WkvyEPBDKjezN1dEL2LdNHG+5j9iph1306LfR6RNkH88heo6k7W/o1T1
X-Gm-Gg: AYBFou325lxk8mEeVHdbvkx46b72qmAbC/qTFJ3sHK4P56zSyvB9XbJbvrnfPWpoCjs
	F6emVH3/Dw2Y8HJj6JWpzN5TVanA5TuvbI0EcGl8aorseB7IGAISgjriOxUrv7xmQzyvSN8+cE5
	R2AbTdaPaNzAosbWCg7oPsQ2ZtEaxT803yeV6LsgvrcVwjBjrohNVHHS4rdzsJ9LtK0aR5rQeqh
	WWxBZ25H4+pRNR9pCusbPH/M6Fj0IqRbe8CqQCgam8MuE2pN/KvO1oTh74fhSsT4i9RcMdscUJ+
	+02SFmu5jng1V1uXndmCBJoHkYgwJkb+yKg3Bi+IryOVuaDldaRn64I/9pbHo7Qg80m3r0763nW
	KJyhk6GPcIDDnFRTyc3jiPRrn8nI3TgKJMvcDYC+xf6GX6FeDTawoIZv7EJYuyTFp3or73981Ie
	O3pMtVYp/oWDcLhLHgYr/Y40vgUZHVXr5BZUqAxu39bIxmSrqnvCz9zk0nCnAA+CclM+UMnhSQG
	1b7beOcWxlyOGZ5reu0x3jYIFzFnWuRnq7P9hZluaoFAoT2ATUB2vuooTld9+azjYF2PLWparX9
	ev7p9yAbkElK9ZQ6CLrrQ0NcghPNB4ANe8+CoPXh7syZzyfTYSHkddOpnSfp6/Cl0Jt/tRKNP4w
	hZyONFwOav2QnfSs44lRuWpctmAytvFjtIA==
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr7938750a91.64.1793642076815;
        Mon, 02 Nov 2026 09:54:36 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm7170534a91.4.2026.11.02.09.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:54:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 17:54:34 +0000
Message-Id: <DMKX1TT24BEL.328L6X0AO3CDS@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, <bpf@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
 <DMKVOUX2GDZN.2Y8MKLR367NU8@gmail.com> <aujNf7TVDcwMYeLC@monoceros>
In-Reply-To: <aujNf7TVDcwMYeLC@monoceros>

On Mon Nov 2, 2026 at 5:51 PM UTC, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Mon, Nov 02, 2026 at 04:50:37PM +0000, Alexei Starovoitov wrote:
>> On Mon, Nov 02, 2026 at 03:15 AM Uwe Kleine-K=C3=B6nig <u.kleine-koenig@=
baylibre.com> wrote:
>> >  For non-subscribers to kernel mailing lists, there is also a status
>> >  page run by David S. Miller on net-next that provides guidance:
>> >
>> > -  http://vger.kernel.org/~davem/net-next.html
>> > +  https://netdev.bots.linux.dev/net-next.html
>>=20
>> The link is not the only stale part. The whole paragraph is wrong.
>> We apply patches during the merge window too.
>>=20
>> diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_=
devel_QA.rst
>> index 4729efd..f6b9533 100644
>> --- a/Documentation/bpf/bpf_devel_QA.rst
>> +++ b/Documentation/bpf/bpf_devel_QA.rst
>> @@ -231,19 +231,9 @@ load or urgency.
>>=20
>>  Q: Are patches applied to bpf-next when the merge window is open?
>>  -----------------------------------------------------------------
>> -A: For the time when the merge window is open, bpf-next will not be
>> -processed. This is roughly analogous to net-next patch processing,
>> -so feel free to read up on the netdev docs at
>> -Documentation/process/maintainer-netdev.rst about further details.
>> -
>> -During those two weeks of merge window, we might ask you to resend
>> -your patch series once bpf-next is open again. Once Linus released
>> -a ``v*-rc1`` after the merge window, we continue processing of bpf-next=
.
>> -
>> -For non-subscribers to kernel mailing lists, there is also a status
>> -page run by David S. Miller on net-next that provides guidance:
>> -
>> -  http://vger.kernel.org/~davem/net-next.html
>> +A: Yes.
>
> Even better. Do you care to get this change in then?

Pls send a patch.

