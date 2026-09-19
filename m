Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F33B1ED0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789787268; cv=pass; b=J4HpPzciVZc/g/G8K8cf88ruKYRTeKVP6kz8qoXHpQxhWgzbVXGGcbTe6kAPZQMpWOUuYqAbUa+17mJgVtjlemy/v+98xEyfBY2ga9Kux/FJKTWcoS/uk8EkrD72a8IEedTJ7/SHz2Q0/5XUOs1TDk0VLhQRu88i8D5mnHkzPVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789787268; c=relaxed/simple;
	bh=w0FzqTkWxvgr+7fjcUx1t+0g43Cb2S3hJxh82YqqopA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGtzT9jKnE7F8iPAcxX9xwLCC4OwvwL8kh1/rSQYPBAPdMN9W3XLNKNvI4bE2LehXMre0tA5zCeV5aPEHdvX5BNkQ5do8rB6/AIGwk3bKqjcKbVBd+6qxF2jWWe7RksPAeR45fW5CQnugI/D9wKwLtxB7TzUts5ooxmpvUBr/iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWF0nMm3; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWF0nMm3"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a49a40209dso14270121fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789787263; cv=none;
        d=google.com; s=arc-20260327;
        b=sncJI1XcraL6cz6nDUqFY+fR7YgEKUo1qBPuMctHCRoiAdVsxilpG9juEYYWuTMkCs
         QNOdYz9K2Wh0ed5/rXhWhY+Do/g+WhDcwUve/ULNKeJ9Y2PSOBnUxRTAcABnp+tJ1sN4
         s54QT4NMMOFBUuiuZlN+3lmebJkIEDxzLrWha5T0se5lL83yserygn3Vhxx2iVJryUTb
         RlHP/Yy6AO+eYBlrrhDI6kJepVvn1PFQqTHhgXGFydAkqBuJjcbfW0AMzudaxx++Ca15
         FTv7uEJTPQ1mKRK9kwiJpDZ8app8jTur9Zz3Qv2WFEk4k8wwG9Zz+SMLNo/H/qsk/neA
         quSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w0FzqTkWxvgr+7fjcUx1t+0g43Cb2S3hJxh82YqqopA=;
        fh=370LogYN0fBjV8wioPJ4Q/1I4BTgVtwE1bo6a2EGXxA=;
        b=rlbIjfWI90odNr960AE2DRVXsQBzHbz5vYx8klGtRQ0SuZad5GraDaKTiOgHRU+G3j
         R+xwyGGt+qnPUj/gmh5RlaOQ/xxjYbwejEe4Tq44EqHTMqeLd4e0LZ9mNJVq/nhMa0Cu
         aEsC1cJ1mZfFfNlQRm5o1BLV2k5KA3RUPgvKL6YtMyAlC+JWxUWZc63OA0ZuwHMZv8xK
         c2LVYWvQHvl2RIQy1VNtQqHk5Je39jMkOMRcGxOXR8yyUT+nP+RjfetWbmLYlbaeb36J
         /ZE54KpkFcJweIATnI3SwLXCnsKytYEsMwnHY85egqvFjtBSxDeiWJeKOVYjZIMjsl1r
         MH1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789787263; x=1790392063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w0FzqTkWxvgr+7fjcUx1t+0g43Cb2S3hJxh82YqqopA=;
        b=PWF0nMm32bsts05N9GBf+6CFTSNwZOkQCILOyYWvogxl1k3kk/xkXI5Chx4ImKcGoA
         I70f2KwLZG5JgygwJ+/bw1ZokfCxdEt6YNxYNPTC8la47zSKSEy3Ch7BUnzf0Y5B87L0
         NGZauxfGZ3VpPHQqGuSJgwNN7MyZjfdZa3mLb2aRnxI6NOxo/IBJKET9XIrZt2O7enj/
         XYGYND3Evss+W8ixfwVRFJFcqOJpt4Lk0K0ovlRtiDe2NXrrLJVIFnG+zVtp/2TflS/f
         7Xdb744AMBpG0+kwwvujDcghWQA+ofTYeAHpIm5xJVN/f9CnXdRIPLoJU/1Qy3gI41H2
         If8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789787263; x=1790392063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0FzqTkWxvgr+7fjcUx1t+0g43Cb2S3hJxh82YqqopA=;
        b=bTReXmzzgbWsWL4X2L2vpDLajmFTUNH6VkRt9xTXA45pkxRPIBFS0gE6HyYTYumTKw
         bRM5G9kX4mHUcwiAdinZ1m8vskzIYTpXbhVoD1GnS+QcqVHoTIEaA1XQfd9EZsTCL/lI
         1PaWGWkujM7kUWYVnIGhSZKZwjub3ZTNWWzdhI2/Kdvw/wM71kW59uU6o5o5V0G6VPLN
         5hW+4W1ttZSjdgetpfY39y2fBfPw8qheaomMEmQ8IrHRuD+TVJKxJJcX3krQQC8D/25e
         MzzL5SZkuG6i/0V4pHD2/CqTXYgMF5HsWbpyZbsFoc8Jz3IriDmEw2welurLOEirqyFZ
         pPMA==
X-Forwarded-Encrypted: i=1; AKwUvBwqNrlRhQnlQnsc37W8pkadSzRWIcMVcYeYAKtWHv1PPuDBuTpvQGuc808weBuwP2XEMd9zwAntqYucwiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ2MoeuD7D6gBUh4WNIbNm/8NJoSEJ0pIxBOuBFnjEE1ktQ2dP
	9FSDzmpp6kSNHJMXW3MvKqGUPEqgG3SxfQBg6QBIQYFwU8pwLyQ33D1iwHknWWWoBq+4bbDctAR
	CFZrnsbfd+HLUG4Y39JUPUSEbwisKPag=
X-Gm-Gg: AYBFou1WQPb4qpAdGCAOc9/FckoYEqcKwvX8BKCLEgU4fqpHuOcm2AZnPuO53YjVLj4
	2XIqb2wrbN/cK/+FBT173r4bVXT23F3ON2pcataq2q3hgIgd4GL6vN/f3j9dHBILx3yVCLQFw7X
	cDSi9linIIXGFaCnVajFgbfccxXPi9Y2CDTr4oZY69YLElyay47k0S6/mTYZE8uMCmpT8sDPj5i
	Kv3mP4xxixIot6PJIopKT6Sqxryzo1C7fde2YSfSkQx8+DOZnwWw2hh7AaGTW9xL/ay+jQ1OArF
	8BEmByjaw2pSxum2LhFlRxVfdP1FEKJiJIFSA61pi4vNlYRyMDp49vTj4gkVJdUwn2c=
X-Received: by 2002:a05:6512:31d1:b0:5b8:c53c:468 with SMTP id
 2adb3069b0e04-5b8c53c0572mr850142e87.40.1789787263185; Fri, 18 Sep 2026
 20:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915111351.2726334-1-qwe.aldo@gmail.com> <CAKFNMo=0hDANOd+DxxvKA=RNbiG-zygkWh6EUC6Vr2MYe4npLQ@mail.gmail.com>
 <e197037b70377be78b296380bcb31b8c3e8f8d74.camel@dubeyko.com>
 <CAKFNMo=0-rxN0BKG1v+KhrGwnh2ZL_Hn2Jbcqc9sWRV8cwxPrQ@mail.gmail.com> <2f638ff0568a55233899b2a7ef4dba3ed945bc51.camel@dubeyko.com>
In-Reply-To: <2f638ff0568a55233899b2a7ef4dba3ed945bc51.camel@dubeyko.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sat, 19 Sep 2026 12:07:26 +0900
X-Gm-Features: AcwNN1XrKGMdprmXwaOngP5OHZSqj1InSVDqZdmSH5-4vyq3vJ2CKSIXed7wrwo
Message-ID: <CAKFNMonz0QUmCL2L7dcx=sxNp7Ept78QMLvy9hZ766LkOXj-vA@mail.gmail.com>
Subject: Re: [PATCH] nilfs2: validate file block counts during recovery
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 12:01=E2=80=AFPM Viacheslav Dubeyko wrote:
>
> On Sat, 2026-09-19 at 09:46 +0900, Ryusuke Konishi wrote:
> > On Sat, Sep 19, 2026 at 4:33=E2=80=AFAM Viacheslav Dubeyko wrote:
> > >
> > > On Sat, 2026-09-19 at 00:44 +0900, Ryusuke Konishi wrote:
> > > > Also, please replace the 'Cc: stable' tag with the following tag,
> > > > as
> > > > with the previous patch:
> > > >
> > > > Cc: stable+noautosel@kernel.org # Non-fatal bug fix; defer
> > > > backport
> > > > until a real issue is reported
> > >
> > > Damn! I missed this request. I already pushed the commit. Are you
> > > OK
> > > with that? :)
> >
> > Viacheslav,
> >
> > Since we haven't hit the merge window yet, and linux-next (the
> > destination where your for-next branch is integrated) is a daily
> > integration tree intended to be rebased before being pulled into
> > Linus's tree, updating the commit message on your branch now should
> > be
> > completely fine.
> >
> > As documented in Documentation/maintainer/rebasing-and-merging.rst:
> > "Some trees (linux-next being a significant example) are frequently
> > rebased by their nature..."
> >
> > I think it would be better to fix the tag and overwrite-push it now
> > rather than leaving it as is, though of course it will need to be
> > frozen once we hit the merge window (or after the official release).
> >
>
> Sorry, I have too busy day.
>
> The commit message has been updated and pushed.
>
> Thanks,
> Slava.

No problem.

Thanks for handling this.

Ryusuke Konishi
