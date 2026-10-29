Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308789;
	b=gu0V72oIiEA1Lp9gkJkPc98wTIsv8Vtbk6Oe6+cqLUL90rW/dcJIcpkZuA+U1+VJmy4m
	 phxJqZYEiTUFPqyJRxe2sbB04sPRDg4G3crvBm/JzZk4xWPBOO0lFHTRGbCwD9HgT/ZIE
	 y+2JoG3L7cNyAiHqoZGiJVtAG3U8NLsHPH2VbhOYnbrvVunOw2SKDLZTxSMzUJnyCntkI
	 jB1roO5UjVu65aALWgouRvZx2uCzhyObyTP2iEPAeBGhaVXGr4iixQXZQ5ZXbTZggztrA
	 9JqVAc4dPp1cDtTgnd/udcNw7Oji+YmlqOOvP47rnAIsdi5GKEeo+9YzHCMd/9+4yuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
	b=xxKRZhWquF/Vk4KkMi49rYaXx7sWKPgoXzC1mqDFvUNrwROoWGz3YqKqFARCOi2neCyW
	 lupBggq7HdUYh71V3RgPvVq7dRG0pjsnn1won1SjXm/esdVD/cowqScxZokT6i391r7/+
	 jh35vhnu4UyesthkWalcHRLQ28sZkJxYBf/rCYqEOQCGb3Vud/pByvJB/Pvgyx6bb5Ajm
	 8WhrOgJi1Ey23L1g0NZLgRsi6Gwx950qeOoEJlG57sLhZTNNIrRMLzdExfosnPRMdMaks
	 BlZaasibm9ldESJ0Jpwtq3v5D8LDTd7wGdkE3qhSXhSt5SwYXTmZLqFg5sipWza4EDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTGL1tK+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CABA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CABA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTGL1tK+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3646e6de3e8so9545eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308789; cv=none;
        d=google.com; s=arc-20260327;
        b=ruPlyOVtD4gxiEpCbUngHzPSL4etgr4OH4t/4ZZRxncO/da1qbpKBKBxFIEqdu2R6R
         ShfjMbHXTw97o6h32QkSyuqQG8QG050U220dLY8tmcAY99bOxMviSvt5DV+rLRGzEcG/
         wviTrDRmjBImImjUTXzW6k+3o7Cn9D3wfPMLjq1F2+yEfaTfzz84ivqRLqq4oWCLq4vm
         FNqLv/a2vtuTx/lUZaYV5EkY96yFUUWcximIsOZ+tdbycEK6loRkuwZ2FCesxJnb7w0d
         uoZCzuv5DfpBkjvWZCTSv5mw5/yOJ3fUBYLAgoVptap6UNbZxguXPIpDWKl4rsIb3PMd
         LRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
        fh=ruHd+Sd4THWLgVIMYK97e9jaoIA2tOKhv0jtQCJ0ZJ4=;
        b=sVHsbtrE0501QSWeibL9eINv7beIQe4ie3Zl8eFHFx5pRZEZRZYhtwiTJ/9LWwmIFZ
         Ryep/qlGyo47PNtfbAWZKSehDOMyyBUs4QsZWVIsrAAcaTn9jcbHgV7nwTu2JaA1iN9v
         Mb2P/3uT+EaeFUn9wnIh1QGBhPlczrkvrre24yRcItCRWG27jSpO6avIz5KGU0ZY5Trx
         9XHUtL1IibCMC0g7HAf+4uZppXV3yq7oO4IfL4YlT6N3vXjiInb0SGrx+UXSTAzSsE+C
         CUA3CXZ5svAJnNqchCpJfe/irw7DT82ZYUBf0NyRxj9ymino6nehuJurtzaWrXBEB1Wp
         L55g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308789; x=1793913589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
        b=kTGL1tK+KJnI7KIA8BnwxMf4OfFvYxPX9ZtHUfXvMTlZt3Qts8co1ch83CywQfOjYB
         KrVeogKaTCnhYJCxyij5wDlm5fgUYPO7D8GTYYBlclw+C+7VPw+fEwSZbQyrwvV5g3ER
         /l7c0jb5xibmESolxbcRzlVfGr/ajNQTbMCzzK15se5LFtC6+CqQdXLpfqILFm0VErL+
         RvScVd2pwZ1VmPGXnCm7xIzTTMNY6YHrSZ55kCqE/rdklHdT+wsxNvxbvfDT8Tw1SOYT
         YCrgj1Z417I7lL3mO2UOEnTsQdP1oCtW95G7GSF5VlJVvr7Kc9TVKEYDO0wfraQYfSVh
         A2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308789; x=1793913589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
        b=ztGsrhQH74L3CW+ZBSQ5dbSUgbH2Gr1DFwC6V38YG3R6tuITWQuIDScXCWAyOS+BKV
         Vu2AnWY6S7MNmuTcLB/moubAI/nMrx/TKKARdZ8r6Ymw2sOD0kD55QwQtAKlxed91A4T
         qWJN3tolNdq8Dhz5mgQyQFY0Hh2YMj/PsKp0ScgKJoNlr5lynkwvIyUXWtKgm0jHp85g
         uDuR6c1lPfnOi/JKmphf9njVJ8iONUxIhnGCykfdFSh2F6GcS3QUArwWz0g1KSeQqZzP
         Li+4WFt87nKxQnfh1JYIqOPdaffswnrAe4NNqBaVOVcvO24P2GAyBpiJgl0ZBtlz5zAb
         IR5w==
X-Forwarded-Encrypted: i=1; AKwUvBxNJEcLNm8VH0oL91x78qjZIJOS6wiEjULie7cAH5ILf9S5XRhjk9DpfJgLs52SpdFuImcPNHQ/9b8rxmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtV35sc4B/opTcF1y726igrp4qZc5SFWOcPjBQL1jO/hReC8kC
	v1ND5xL1XOm0g0HrVTFfJkb0lKEiZdf5QYMD74sA+caYD5o3umPryDCE6/XV/iG/eBwu27b1c46
	Dy+gyJXsMerfncyKf6irAlHJshjacNkQ=
X-Gm-Gg: AYBFou2Z4TIY1SKiMnOLmpXApyszQooCH/CuqQ02mHTHlirxTkjuuEghEpRbZRmjTN2
	Wew4ni7i1LEj0gltyBLNPLXP9ODHVApVetQoaxhOMrWKbN64IXMOlXax8UKyxjkXGbRP0PPtSAa
	9G7dgOS0ZXpXEfov8GmRO6gVs8qaOl6Vnjg+KChkMXLtipj0KaOf+U87i9Hqejd2D+K1UAwQh2R
	jxe7PCgBOk6ruah+/ajnGIPbUqylAh+34G8TVJTZe5yp/ShBZtBt1lmjUUXtkOzSkfGy3J1NlsY
	59vQSHnKNwBrb9hUHtQLVr90TN3a00GUbMH961h02Kv0E0HDoPB1aVEwMU92MigENDWWEuN0nuE
	t5rxGaw9qp8t3Ry33nZGNKw5kDc5+I/Wd+2GaK/mTNA1/sRr5FSrbsdUVJ4ewLvNn2ShtfNhX5A
	bGiM1tuMmRfDEKpwz0uq3QKokqz5QugbZPjI95bnQL7nSyyPmRNsVuFVotS1OSODe1bJ9is675L
	CSFPQzG+rMiSxCDnczfF+Ymp13dK7LAQCub4ELSO9f/0q+ULcyoXasZXw==
X-Received: by 2002:a05:7301:144b:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-36a4220aab3mr1098784eec.1.1793308788464; Thu, 29 Oct 2026
 14:19:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180116.49074-1-ojeda@kernel.org> <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
 <CANiq72k2+GeKSdE_pirNLzdkEXUtwO_sDzZZkeMkMuQzneqK3Q@mail.gmail.com>
In-Reply-To: <CANiq72k2+GeKSdE_pirNLzdkEXUtwO_sDzZZkeMkMuQzneqK3Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 22:19:34 +0100
X-Gm-Features: AclHuK-B-93CiIohKRmpO_iS2eYQ2ZAiZiPmguGZSCGx1kUGVAYo9n2-Lyvh4P0
Message-ID: <CANiq72nneQ_EyREu=VxdSowS6NAMJaOtwJvza_STj9JFi=4U_Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 7.4
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Emilio (the maintainer, Cc'd) is open to improvements and helps us
> when possible / within his bandwidth, so we will see.

And by this I don't mean that Emilio has to do it, of course, i.e. I
just meant to land it.

Cheers,
Miguel
