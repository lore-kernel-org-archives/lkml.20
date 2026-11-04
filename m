Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800732;
	b=DLZCLqPnjrsZ7vOahv2dhe1qsYihxnnzuora6xtprCrbrSuag/dAm0vAzCEJu9qE9hmA
	 AtXLDdrKdY0mviQI9CdcCRm6X8GyjFj9qssn4bv/Xf0Z9TRvfkjyjkiZiHyxDAP/lcbkD
	 8DgIawVUb+gLHBGhA6yUy3A/EVh/gUJcXDQLaMy2AWmA6+LF/Q8t1pmuBqxi2DO4MGg6t
	 EA5a6kI7EvD+h0Y3pMjYUXZhIyd/CDeaA8RvHA21p7GALBFlKV4jIs7N5RQzTZCcKRs62
	 fhtvstjyD+2MNLTB9KXEd+TRb0Bty7z0un9M2IScCGYmcto1Kkd1CLGWnHUADjh44yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZPv+9S+aiBa8tNGD5vEe2CYUtrZbYxxQ/p69PxMnGRo=;
	b=LWBuTV/6q5RZJ6bxcH5ORReKlGKd5FumuPThkewpIxbH5JnInNL1Nhp/rBCn61Frn/as
	 yLh76aTn7QobkXLxunkYHfr7YANN0JqEopy/BhRY9kuydvjte8cPJOtJ3bmqLhLozZKoz
	 VB0c3U6bKcOza1x5foyupwgeF1PJEujE10awty7zYouMf8nj/JRG+IVFOJW5bixBamW4K
	 ahPZIs8ugEMkk+g6b6xgWMMvM+tdO+g5iadikLw9abiCzdGpKIpx8Wj04fy+gveIcW0xn
	 lawd1zEoohdZxBMNe+96MKE90Xb9edYvp727UCm+bEGGUHZ1qClpBVO05Zs4eeYTmRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5M2O1fx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CB606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 068CB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5M2O1fx
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5f2834b19so22646a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800731; cv=none;
        d=google.com; s=arc-20260327;
        b=C93HBK9i2pThfmgZtB5k8xVn4kY8kZkrcz6lA+c63GMV8qEjl3mUN860iooESvT0Br
         xx2n9v0SFH4ibqPra9t7r96hHX3raue7eVR0nv5ksJVSKgb79s+enuXMa8ca819q2MUe
         pm6Sh1eVt/EPei5K6BodzAGrNZr50gwjw645W/sBtJYCcS+192UPxbKGIs8epbJ3l2aH
         9Agn+Dwk3RrE0btZpfb12XDp314AmEBs4+WR6g8lNqhuEWHS03aZ5Nqv2BYTy9PoCdBr
         pYoaWUtxAs6YOD+uNOExHZIBDU0+qwA5wQmuh8ayp+Tqt0Hq61kC73ZNE2URGffJQbwe
         /6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPv+9S+aiBa8tNGD5vEe2CYUtrZbYxxQ/p69PxMnGRo=;
        fh=i14sjAIy1AWDaEm803H7TiR74NAD0TQun4taOTDsXhg=;
        b=Ml7xsvBYHKvE85VZ6LVXmxjAYkx2nmu9Neh+Q2BrCMIzG+aCDeGQdtpBQS7gzRJmwQ
         gsutXuZXdS9xkTOKp1QgT+FYIvD9ybHQA+2vIUgxQrJ9fYxx3dT0DmrJWTSn3m9+C1gF
         tqFUhKFFmcCn2lW2zN3aq5tqXq4m4uZCU1DVCJ3uQN8zHBaimoo7tTATYEha+9XEVIng
         soVGc9LsrCr6F0oQhQcO7w7kyMuN0XOvCz0qh2uID6O84YdHeT9ayXbQRBPK3gAxW/F8
         pwrPCfN7QEOJGmnr5YS3v9618dunNY10VXGEL2IbUdlhPOYM6WS+oLGbNRwT/cHCxBUQ
         IW0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800731; x=1794405531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPv+9S+aiBa8tNGD5vEe2CYUtrZbYxxQ/p69PxMnGRo=;
        b=F5M2O1fxLCtLRQg9IAYf3X+Gd3ZYHD1ynEG9t4Ps835d+iHvTwQJA5bZv78futORon
         Qh3VdTCgcwRbrEmLiOjBODGmqnopXRMch23fI4nAO5V4fxOynIJhRAiRSvbN6m/qgraH
         frYZ7b6CWCckynp9t9eePQSlV8C+itEFYiiUDKItx9+KbkrBZBmEjihq20msNOYIqHce
         PrZRfOMWp8wbl5wozoawkGbUib2yb1hLD9DhpgnvkLWVr+I5PEOyNVXKW5EC3Ck9SRYc
         oDfJzWviTU+8x+IBCuPcjXowtqg3l/yt1WRLqau88VPnRZfsjN3nsT0dqOid76F1b/f3
         Yugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800731; x=1794405531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPv+9S+aiBa8tNGD5vEe2CYUtrZbYxxQ/p69PxMnGRo=;
        b=WA3w+LNb/y3y8cf2qB7RXp6Vj8wjSh5OQcVUnE0eejiI6MnOKqUbB22i8FuMG+SKY0
         sBYZa3v0KGocVmzouwyUfr4HPXt8ipyGjiuMu32PyBp3QiSfXqXjyvW7GnboUcAdmRaj
         kc9uw+t+JHnWV04CK5HiQChVGe/Tt/OVZ6jO547NXyqHbMuNOZOwFcyynpQ0nJZTFd5S
         B+dcXqJisy0twnKfql4NfAaKIB9XchtrOmYeJz7yIQuY4kJ5MqEAuyhQafgSOCuqKxtX
         14E6cojxIVadmRHSQIXJH6ZR23MZG1xIzKCRy1p1qB5x3TGEXfExuztyM9O33tYJAFc4
         Qrcw==
X-Forwarded-Encrypted: i=1; AKwUvBw8q09dW7F4aaNU4axutLCWdvkhViCFK7P6YWTHvZbBLk7KhkMo6XDGJqTC1X/qph3VmbIfNIOKKpX8W14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yl506qn7Vqv7lvZEllEYz33nuw72ewMhyRAo/V74f1vYhSg64
	WTU+37YbJpBFNdrNiTyD2qUXFtXNPRqgC8YB0ST7BeOxWsq4a5gUCiy6Mr6SvsA+DOlo/J4Npgp
	bQeNazJFmQY7Wx7Uf/2Yb24U5WC/z/yU=
X-Gm-Gg: AYBFou1gv8woqwgYnsXiajYf8JJFZImjNK2j4zs8TWYOfRpqU/ohWXU68WK6lkKon3c
	rfJnp2yhFqYGgDbIFdHzeeM7NlrmcxLSKeN8LL+KXoJsP2ZmlklBC1rbKgMfFhIZIT0PlvMZKyB
	VWRYBXIE5n5FbINWLl5jwWWEz6RESk7mdmFtAgDeUu9FSXy+rdRANApsSpJjwi7Ht62JfU/rFuj
	r8/iqNxAFjh06Tw7ECXpmTgFbYqPZe8k1BvMePB3D9W8CxMJA/YQcjm17haB+v74dNMWoXBE1Jm
	aeQ5fyiN9ADSi+CrLawfpczElPgQ5dh4VJORFPZCHRXKMIOMlz56v7BBp9vfr//6skDXoHFV13n
	CJfxGe3322zxcZtjD7UMdtAqUFxSbDRLKAvanhA==
X-Received: by 2002:a17:90b:3ec6:b0:3ac:a11a:7c88 with SMTP id
 98e67ed59e1d1-3ae89767d8dmr22622796a91.3.1793800731298; Wed, 04 Nov 2026
 05:58:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103174911.1600930-1-lui2012qwq@gmail.com>
 <20261104134838.326041-1-lui2012qwq@gmail.com> <5e63dcea-a397-41a4-a647-a356ab67f1a9@sirena.org.uk>
In-Reply-To: <5e63dcea-a397-41a4-a647-a356ab67f1a9@sirena.org.uk>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Wed, 4 Nov 2026 21:58:35 +0800
X-Gm-Features: AclHuK-leITjBZg3uaZFBEpELoETMeb-idv7bSBrHEFeVGW5tQYfscJGnYnWZLU
Message-ID: <CAE=Q7=5Dx7DYoVO=VcO9gs8euBY3c2hfJ2yze1HQuymJj=ZH9Q@mail.gmail.com>
Subject: Re: [PATCH v2] regulator: disable disable_work for good in regulator_unregister()
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 9:53=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Understood, sorry about that - I'll repost v2 as a fresh thread with a
link to v1.
