Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2B3859D7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199382; cv=pass; b=bsECsLkWXFXNbfx0dpA6qI+cXsSoSXk134rH0CuPDatNPpglGqtLRgSalsjse4GTjYk8JWmMuqx/+FZ881CCg2w7mZmAmsv9zxV6fi1RmH48UQFqttTpq3DFH5ySvY5jqeQxCImRUDdbB3qm6n2quVu0Tm2NTLvi67i73iSuuSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199382; c=relaxed/simple;
	bh=7qxKJrt3+u81eJLDsYKd2Jhek52o57IUpvJh/RceBD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVM2obw5H3IsXxg6EzlOaRD9MoZLyLz2l4UFJiJ4i2Mmxof2axHq0byzUXuSVI7nR5lT6pHwI/tMfpNp3uLXTZrSHGIcPOxkvSNypJYI5w1pwgxFrpXxYH5sjx2n4QnVgz9VW8M8uMfzyGOUfXHqyxB/B2tijN7NxOF8zk1EUfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=c3IU0UC7; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="c3IU0UC7"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e04df8c46so4086491b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788199380; cv=none;
        d=google.com; s=arc-20260327;
        b=rqyw7T1h/DmCviUYJt3hFjnstc586DJ7UKKTRbF8TczXCr/TOZRzvUW835i4tsmfHC
         T2OvrOBIrHdOB/+XC6obZQkm60s96iKl+Tx9o81WaUyTS4pbhEdgpwQ/XIly2QmnENJN
         AutZKnFGMwjAoO6D0sZRH6xqYUD501lz8JLfO6et5W6rRA3aS0h82/ZNnKnjKYZVUk8m
         TGDyyoUt+MpN8hFg782YA90fitPZ4nUWtB1RkpSPVkntm/19kf6l8FRnjGvt9h60N/QT
         VwwN3CjThcF6DUcajAX9Z4Pz6RVNe4um6HpAnJLnNvoYx3F/IJAqAAa6/RF5eMjR2tGw
         a93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rX1e2hNyl0dgt8WD8Xkfkh1yvoPo9dQbQc3KQyM7kU4=;
        fh=r6OvWo//a/NyCqhhbX2tXLe/78wX/fEVXM4BpOZBQdA=;
        b=Dcr1YfUtrROnbOc+VyPUL4XscR5Pp47jLwX15DWOWbA+C6SOT534Br+AcBsGNfZk0O
         hYwIoJPBKiKhdiWptWdIUl9Qoz0Cl5kim4+0OEjHQyEgxvdnCIX4yy1bRLsZ3SyaXkqh
         BSM6rOpQg0GV8OLRLcX+lYi5Y22vCh5DmeN5HceibGvl4DHeSNfpb4Qg9osBaMT7vZsU
         VPSLgScysIZ5OpJQ30YV6/Q30lulagnib9bOP6FpGUDJUJHUXug+VMdGl2zjLY9Kd7xo
         j+YcxgnaJuDm19am2xn17pY9w7nmfsIjswlRGCgVZCEfctolCdHJufGrnSphJ50HTNDq
         +e0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788199380; x=1788804180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rX1e2hNyl0dgt8WD8Xkfkh1yvoPo9dQbQc3KQyM7kU4=;
        b=c3IU0UC7pWbFifEku2pLveAJLPHzb7GHFsT3HiDAedB/lhwzOgPJ1eo+/OCofgbEi8
         ILsv2PQnWhry0LqtaOQLFBPMyvULu4V4diDpcb3cRhyQq75ddZ5wIxj8GN7OiMmY7Hf1
         16dxb2Wkl/8d0dW5K67O7X0XozhDY5xvmzcAmf7flkfrUSL7rUsbKi2ja/mrVofkapnU
         hFGvX+ky33aLDMv4nw9KFQKmDv+iO5wh0IE88Ial1gl7Uirlch/vCH5bt/7XmGKfjzTf
         xK/x6J6XbgtnkVdFV9/O7eg8CgemNns6WEjHZ3n+hhxCSlLFXGsh1yV6caC8wOw1zfZx
         fz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199380; x=1788804180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rX1e2hNyl0dgt8WD8Xkfkh1yvoPo9dQbQc3KQyM7kU4=;
        b=pt1ltFECrCNOqXATDQ7KK1oIAlVMzjDwK5SCNWTRbYJnPHTJBINe7itqIuZw5qX+tP
         NGPrYfTbH/d7CwXK2LiYu8C4ZQ18FlXyiuF6mzdmwAPwr77c1NOJ/rQ4zFFTX7Nv5g9x
         aauNl9RYG13gehvovF4cW6Xl00mkW4kqFJs+b7wkt6Qq8Ej6lIG3qqqk4YeTixhRpUGm
         lOp0bnAwZh2Z36mZDHjzFDD8FoX3K3gi16JlwwmAboQPzHnqI76BtTE5y4lVhC5SdMIe
         hk3wytC95P2uhDsxF2q8omKvnO4gcA6SZvnlLhiKmBD/CxWNOGfl0sapXskEbzZkNKJf
         Xe+w==
X-Forwarded-Encrypted: i=1; AHgh+RpDHIQqW0PIwOMDTpTtgPoy1F94LzVsnLuqdDZWB4WyUKtNx+6LTW4N8wYnq6YIBxXCsOUQVpZhoHDSZMY=@vger.kernel.org
X-Gm-Message-State: AFuF++kY/5R7vlQimHvlYpZK+xmMkNrq63kFqzUMBvJGczjPEtUljPK7
	Xq4ghOjnbTbI4ZOOSxTHfn4bYT9Tg3mbxETcJLSI4tFXCfbFjQpDQeW52C1kRsttDxGh9Ud26xv
	RIJZfiiplU3vMru2ogt9avNkw+CkZ/rtc6qfD8ov7
X-Gm-Gg: AR+sD11kApZWqR2CzJaGuFW2KKjIcLdT0C50PdgxtzA+jz6ot7AYM6dsoSWDptuiiVU
	PXvIePt8LT74h3vuN/LacWwFF0MwBChblomB9bBaGVWya3BHQrebhvyJHlPZRv03xvt209e/qEn
	q3Drj2Z7a0GRjNo6WbiREP+FaCthsSxSQFaGQUrvu76o2HH/kcFI2pyeTvN76B8kF4U8+JL5SMM
	MvNmzfKjsM6BBcL/BcYE2wRmRUzAkZMfO45C2/B4ftayLCKz+Re/4ripur74Hg9x+HKUxaz/upI
	IUiHoUgwn6FY8k7SWhtPrAOqFzAayOtuwmkWgA1loOKR
X-Received: by 2002:a05:6a00:7702:b0:857:726d:270e with SMTP id
 d2e1a72fcca58-857726d2e72mr28350340b3a.26.1788199377609; Mon, 31 Aug 2026
 11:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810125726.775689-2-rrobaina@redhat.com> <7b9f43325dc569ddb689b02893bde8cc@paul-moore.com>
In-Reply-To: <7b9f43325dc569ddb689b02893bde8cc@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Aug 2026 14:02:43 -0400
X-Gm-Features: AcwNN1X4YwvVJtikAlc68Qp33s2cNHUlgKJNL_7Fz4NLYQY6IuY6zSqRqqsuN2I
Message-ID: <CAHC9VhS60qFhHfzEshKyJ4AnNCG8eaNBxndAZcU5dnhOwWsOtA@mail.gmail.com>
Subject: Re: [PATCH] audit: use copied skb length in kauditd_send_multicast_skb()
To: Ricardo Robaina <rrobaina@redhat.com>, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: eparis@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 6:25=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Aug 10, 2026 Ricardo Robaina <rrobaina@redhat.com> wrote:
> >
> > The netlink header's nlmsg_len was being set using the original skb
> > instead of the local copy passed to nlmsg_multicast().
> >
> > While skb->len and copy->len are identical at this point following
> > skb_copy(), it is conceptually cleaner and safer to use the length
> > of the skb being actively modified and sent. Thus, this is a minor
> > cleanup only, no functional change expected.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > Reviewed-by: Bradley Morgan <include@grrlz.net>
> > ---
> >  kernel/audit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Looks reasonable.  Merged into audit/dev-staging, will be moved to
> audit/dev next week.

... now in audit/dev, thanks!

--=20
paul-moore.com
