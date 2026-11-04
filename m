Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799825;
	b=weo702UfNBm8I2LYWOwJk9U6rdzOgh8x6POcCrDtG9ppN1tqrsKeqPPGzLg5Q1Bcn+wg
	 6c4jjwAWcgWp5SD0yoEKZAeVvrR2gxUKFAQnmOZVPAuYGNt+ErK07MJYnI1KFY08sczTR
	 wwFZFBO6ShuSHGughg6lS3eQ6DdZ2A+Q6KxUGm8r/AtpaTqpUCPXLZ16PfNN99/I+Pcm3
	 GnmeCSJ1M2eOTE8x/7iy3kysXDWpLiT612ZgpPTQDI9u+vYqrbMRkWn8bZg7B/gfN7kke
	 DSvtqj7E+SWg3JddTzAlF40EthbIsH9uaWsydCG6Uc9zfIw1x+rgNTuXe6KTQM4CEkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1mtCLTM0QOYEwlUCRAW41FbetRzUaeoC1C38a9gQ/K4=;
	b=Jk9sAtVuSwiI/Bb9YK2evG6pbs6tIWJSpLG9PoslRc12rARIvMpTyJ9cNt/DX752qAJa
	 KPlHKt/3Z0sRJDL1w9f63yuFLhMmuPpmMRmb6seiN5n9alK7iqdSMjg/V3k918JviAKLp
	 StEmH0YZCoV4QelhnI3zab8QVXjZfxFClnun1Xg9AzHnaZcgtmJLd52CttSJizgHpTZs9
	 gKDsTAOtkGnND5pwaKs9VwtP8MVcZJRcyHhdMFzeaa+9pQF468pRpH6sy9MFLNyhAsod7
	 ZHjMJLaPE6MDgRR8y5gUHoqH44yZ1KKALO+cJ12kpdcCzpEOU+M6LQ6jUfVu/BJv82w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCdCOcQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C12606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C12606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCdCOcQl
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso1108696a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:43:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799823; cv=none;
        d=google.com; s=arc-20260327;
        b=VI92NhHLOsNQWTPHYp27v5wjFO5SxRXXtS/MTrWjZYhFf5CTIHyzUcZ72nN3IrHl1X
         WFS2bOkfKvcAg1fJut1fxxbr3digGACeEb387Jq0S1i5Ia8IsObLvkPPNBOfL/Oo7ybw
         N5a+p/Z5sVEYfetDHj0oN8mWaluqQZHbyq4M+r+yQ1wBnxYKgeBv80bm9RfEFvD5OW1L
         lpDEMvgNXAK3Sv0ylZn88Lq2ziXMOIhOQ6MWsGlVUsDbJMBCu7yy/vAZ2CVlzMfwwa1B
         EVeiyISFfn3QBfab25xXs0roSHreUpMgZycK54q2+uuChzLtMNf3IcvjZV1irfh6Y5An
         MXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=1mtCLTM0QOYEwlUCRAW41FbetRzUaeoC1C38a9gQ/K4=;
        fh=BN6fyeE2JjPUHx7SMj8TbS1rXSfJq2W0Aw5a38SiRZg=;
        b=qZLtxX/uQEFJ9W08mXRgrMrpjZCdnZGK9rJOs0DUyAZTUIStCG6shbXqGhUurb/um2
         lgf2lrPAyH9r7rTU66InBv2iKJV/AfpQkepS+9SH3S2dicu2s6/XP8wxghU6fLrWikX/
         UgNeiRV2de+lWwMKREqZKQxZYvV8+9v0GsS03O/9JyKW/DL3wfTnqcoPIWd4E2QzSMGJ
         qQR+vrCZ0V04ZsMUp7t+qTj03PMV6/2naE9Bu7TuOSaDSrk9vw/sVPoGz4EddY5SlOr5
         vdLWJb2SjQ2FDDlpHyzzmz8dnrRnVqAat0B2t0egbYK+a9ykgyoNKhLnB2AJ0nPwiMMW
         MJTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799823; x=1794404623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mtCLTM0QOYEwlUCRAW41FbetRzUaeoC1C38a9gQ/K4=;
        b=zCdCOcQlTNc8Gfi6OgADU1joemBkAd0zQzq3UaPaTmtOCCOenG9L+QAhxmv9TzLJ7J
         nQaZaQxwtjHq8LYsst2b/7ZsZNxPRvBcbz7RFO9E81YNDyxqyNrWmVNM+uPVzM2aCklc
         wxZLcFWEdu5f/RNnPDNGE7P/FyoWAo6OgAYjIUih/5+GoihNjE3WA28oH9TltpzVW6wh
         R6Ri0EMhrwsyQBTC0nvl6KKVTjrmxddKFl1Z26nfyNIR8jtF6mVMAH0326pMs+L/hyZn
         4QuXtkZ7KuZNJUiWQp4ncx1hYvwsfNQ59LHKFz4TuLv+eKNrykh0Ozm6KuGlAPoVZY6d
         dfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799823; x=1794404623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mtCLTM0QOYEwlUCRAW41FbetRzUaeoC1C38a9gQ/K4=;
        b=xJj0YPMQ7dnLDuzNUKgW0Fcl0xP8J+xxeVHylCck6ruy8VCmxpt4FkXX4fdMXcROhu
         Sy3GZiFvfs0v+594Y1Hq2oxc59XDJa5Avcs+pCn75wM9PRlMrlRTkESHW2khLGQIrN+a
         eXXV3PXmPPptGq7UUei4jqnNmoCQokT48dMND+fZOKlpqdixAWkeerON73J9xexe51BL
         C7SR8ixG2qdIbBX1ghXwTLm23Zt2jrX8lhTMq9M6HGiitBEKhCldd6zVG0yOcU8YUhPS
         4b3l8yJNhf6yWw5pw21yY4xmdxOtNuZUg2x6p54lCGzCNYbq4YhaQbuWccxktMyBFr2n
         aIAg==
X-Forwarded-Encrypted: i=1; AKwUvBygnBmS8i77Ov6eJv+bCPuvhdoyiy67ItZYb+DiEZGsbYHprjbwMmeFdPGOxaDxcATYfl8qAWnSQrRYcH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oSYrKgnZEdUrwCZvLXsDk/fDyUE0imQUvnoqpjIKF+Xk0oYzF
	e9PW3AfrZ/YzSX8cxo2R75/CoJqg0rIbZe6aKmZYHX6BUUR8vZ9ZHC3sEP7xwEjyOTz7F+XNBhy
	Zb/0pVra8PXg6KeppI8L57KpGvl9e2FDYclR0
X-Gm-Gg: AYBFou1ECNZWznE2lN03Ud+1hkN9XMdFwwuu7k930vsPIVpPf5dadZqkPewdeF0PSf+
	v7cFKgN0cOJGtC6hUfJYuBlMmUNdIF2g4qvfqBGYPllCd1HYU8vXT8eAc3waUfMqHkljQfzjXM/
	oXDiklfU0mkIRI3ir/JE/6Ht1p9ULB14O79CyrW07nolHvrckIZTszY8RZ22tdEJPoMgWy/fpez
	pFOp10iy2ELue3d5KpYBOuY9so6KxA09/ChsS5g0lsHJzMEF9bG+WIje4hyxxSrN4JnLo6ts28Q
	I5ePebmVWZwTE4Nhf7NOTiy+f6hj4UOfYQ/4tn84HSoAj5gc9OYynmhjyWiKCBTh66bX5XznVtR
	1AfyabJMRkPLqVkjmubCB0GXsDLtacnEReUqGD9/T0iFvj3UaJrKEuu8u0/noyL7dKUfskvs=
X-Received: by 2002:a05:6402:360a:b0:6b5:6428:6037 with SMTP id
 4fb4d7f45d1cf-6b564286349mr1404704a12.7.1793799822972; Wed, 04 Nov 2026
 05:43:42 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 07:43:41 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 07:43:41 -0600
In-Reply-To: <CANC3H+Lc3GCuWpqr2ydCkYmRxTu4em+vM9R4gd-vEn_kzu-gyQ@mail.gmail.com>
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>
 <cover.1790612085.git.pooyan.azadparvar@gmail.com> <CANC3H+Lc3GCuWpqr2ydCkYmRxTu4em+vM9R4gd-vEn_kzu-gyQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Date: Wed, 4 Nov 2026 07:43:41 -0600
X-Gm-Features: AclHuK9GLC8UvqHpZxnkrDxlPR294Gvt84XjrIhABOYbFIYhRv4AlZQScmURKt4
Message-ID: <CANC3H+Jwb1=_mhBRb50yeZAg2N3iFnaq5C=xbvFqf7SuDirjBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Input: raydium_i2c_ts report handling fixes
To: dmitry.torokhov@gmail.com
Cc: u.kleine-koenig@baylibre.com, meatuni001@gmail.com, w1zardsec@proton.me, 
	robh@kernel.org, jeffrey.lin@rad-ic.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Just following up on the Raydium v2 series from September 28.

I split the changes as you suggested, separating the validation fix
from the buffer management improvements.

Is there anything else you'd like me to address?

If it would make things easier, would you prefer taking the validation
fix (1/3) separately from the other two patches?

Thanks for your time and review.

Best,
Pooyan

On Wed, 7 Oct 2026 11:04:46 +0200, Pooyan Azadparvar
<pooyan.azadparvar@gmail.com> wrote:
> Hi Dmitry,
>
> A gentle ping on this v2 series. Please let me know if there is
> anything else I should address.
> Thanks,
> Pooyan
>
> On Mon, Sep 28, 2026 at 6:26=E2=80=AFPM Pooyan Azad <pooyan.azadparvar@gm=
ail.com> wrote:
> >
> > Hi Dmitry,
> >
> > This is v2 of the Raydium report parameter patch, split as requested.
> >
> > Patch 1 validates the packet and contact sizes supplied by the controll=
er.
> > It also propagates main firmware query errors because otherwise a valid=
ation
> > failure would be ignored by initialization. This is the only patch mark=
ed
> > for stable.
> >
> > Patch 2 resizes an existing report buffer when a firmware update change=
s the
> > packet size. Patch 3 moves the initial allocation to the main firmware =
query
> > so devices can remain usable for recovery when they probe in bootloader=
 mode.
> >
> > Changes in v2:
> > - Split validation, buffer resizing, and bootloader-mode allocation han=
dling
> > into separate patches.
> > - Mark only the validation fix for stable.
> > - Rebase onto v7.3-rc5.
> >
> > The series was compile-tested with:
> >
> > make O=3D/tmp/raydium-build W=3D1 -j$(nproc) \
> > drivers/input/touchscreen/raydium_i2c_ts.o
> >
> > No runtime testing with a Raydium controller was performed.
> >
> > Thanks,
> > Pooyan
> >
> > Pooyan Azad (3):
> > Input: raydium_i2c_ts - validate report parameters
> > Input: raydium_i2c_ts - resize report buffer after firmware update
> > Input: raydium_i2c_ts - defer report buffer allocation
> >
> > drivers/input/touchscreen/raydium_i2c_ts.c | 64 +++++++++++++---------
> > 1 file changed, 39 insertions(+), 25 deletions(-)
> >
> > --
> > 2.43.0
