Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792589322;
	b=Mu717R5g9CzZiNi/pTqQJ/rVss/rY+vPgZfUvBT9Db+eYKXK02f9fDxk8CEL4VJkDtk4
	 ygqPDRMxDd1K/gfgu+JtOtRg4cWpHHs8ek6VPuCsl3qa9Ec/e+0Ejc4AYD1n0s2K0VwEl
	 hYWgYgteVeWuRJuval06U32thtyjd+CuxttE/wh2bKmjobf0dTiOQHqBBT0R76OoqxzEm
	 6FNoA0nE9rnBs/W/SuP9dtJ7UoPuy4FJ8UxI84idMd/KS5inNHSaiMm+pMl3rqfg4ShwZ
	 yrHlBnKGgjW8lHRqI6Lukv2aV/jfGzEARL8+RSBKe2qyjd3zxJVn0hxrjmDri3x6DrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aHoL/xV+lJSptWn1pnj9SxRHcMCta8KU7nBOlsKicA8=;
	b=4eOa3zTumS9VQVMquofqouULoAQ84k2OPfxkpJw0HFhvO/iVrLM6dUCJqahK4Y8dcAnY
	 I9SXQW9mhg8VHm+aypmF8CBafemxmB6lKHLIwe7lYRrf7bdIHN66GxQhnRYNX9tvfYX1+
	 wj7aOxbp3F/n54BFopvR1wGyo3ALkBAAmVGMHEzRNbqDXXT86pFi61kL8F7KtlOa7TDfF
	 lUxVVJ6+1xTqiEEyQMvYhp8a/tOGCgyvhix5MTSe5XYNWU/+lyQ/cQyhlngBnljno3ZQi
	 cskO/LoGAKeY0PudO3wVLo5/y5XFcZoA827JN5m1/9RS7VFH306tNrr9WRyDjHxOa1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ihyLRDDv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ihyLRDDv
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535f598d126so254981cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792589321; cv=none;
        d=google.com; s=arc-20260327;
        b=gozfuKOgxK4QpdBsIuVM1aAEUYSCiTfKKPWWIVOMYXEk328ENqWwmG3eTlL5QfhHhH
         FZoUzX1q5JEEJBP9P22JU0+zGUjMg2CV+QVp3CGO5ppWpsQz78PBFYU+4TxH4IAOpKk1
         l0hMZm49SRjGd6b728W7/WjCci8FKQ6OdKrjgpDHO7zeyJDxv16/TLcG04OkUH8V2Z9w
         O1PWJjBO9bcCBO3VxIr4FVcRqWOmnSvNnAwRZ9JkvNBSyf0oO0PHD70zrKzk6EHU69iW
         zHtkzbEbBFfAYLLK2IpC8Y8Oa6t9mkMJEiQsbB8Dqdr+Mxypk9mBai0i1Q6dri1PiUe8
         svGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=aHoL/xV+lJSptWn1pnj9SxRHcMCta8KU7nBOlsKicA8=;
        fh=pkgq3Wyraa2db/afbDUqrRZlX5D727Q+y+hVecguJt8=;
        b=ssBy83e89ceCtqLagzipwLCY5ow58JJE74NPspTEZ2+XGSdHimk3/vKmqUfRDh5NQc
         VOOA7QzV/Xca48G0hQJAubNBnR4A39hZf65gfZgG1dR4QoihG32DAdXfzCWNF25xyUHB
         gT0rtxfgUd1S5Sk7IDjg4QsyyhV9/4um0DErfYYjmDwxi96cJXtu6W/A5qyF7zH3vhuO
         lyoJ0YEItzl6EVfMVtWZi3DqpJPXFcrWeHTWKAYRgyfvL+Y7BjywlWiDgtgYFIePGZa6
         ciEbAm0a/nuY7PipOryM5oTCVTFvyGzo+2MLmRWIjBmL9FigyUJGUVNmDKYNZ67e4loS
         Wcbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792589321; x=1793194121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHoL/xV+lJSptWn1pnj9SxRHcMCta8KU7nBOlsKicA8=;
        b=ihyLRDDvbYTaqBdY46anGqX/Vs0AIF82chcKzRQAE54w0CAOMr+AVgOSg6FalBjknK
         7hC8Pp2HJbJer88B7T/fwg45cNh1q+IJ4R+kIBFJeTZP7iBPa4GIt2nTldiQT4opU6J/
         AN8mU6nlMvKX8xaP0T1HE5WG9TR+aMq9HFRPNbYCCWSFpo1jKJ0adpoUMOKG9Ywb3IFi
         oCT7RaV6Ej3SwRyetkv3IdR0UjhGmczHNnRT9aNNFWWwpwJK59Y//+VSQZ5kk8d8eyVU
         mTezC3lqP+qG+2e/qUmLvgX3/xKM/6P6bB0yR8CA0/mJWvHGjFwCvOjNSfiJaWAZuAtY
         HGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589321; x=1793194121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHoL/xV+lJSptWn1pnj9SxRHcMCta8KU7nBOlsKicA8=;
        b=1OC1XFUnNdKjLnsavITA4OLucOcJkBk1EzKRFjfUKzZnIyzQqq0yVO/+fdxJwIGN0s
         wEHvYQvprMD16rsDBBuy0PVILvUJCLkLCC4PqFmWd3IROAu6aYzA059RlqUmJVqjb8up
         CimX82Ux5J61gKcbimosNXY2l2dAzfQd/0zf5cKRyjuY0SziZlTHa083M+/kcL8nbqAs
         R+NcXsh6rtOnHwyfafmfCdcdnAnmbBtvBFTisWETuLvg0Q9/FZMoSB/9QmKginO6sW4F
         /lzNYgdvdJ4GMh2cUDu0zm61TRuWjYB8Y6/GvV5y0aNlFmWGfBxnCJI3lgsT3ZHJtoum
         xBug==
X-Forwarded-Encrypted: i=1; AKwUvBzUBDsag3h9+zGG1CuPQDETBf1bTM4M8Sfy6OMGJyiB8fkwsu7uUWqdMAC2/5/G7Fvf1NCtcUrHFZwmlsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+o0YxpLf5X82H5JvA8PICMAqlDLdSfNONWNo3FkFL+Ec7veWF
	QVKIA0G9ry7a8bYfs+c2BzPlZq6Yef22RaA4MzFOLXFeegIzIH9z6AR3eesSa5nApaPHw3uXi0v
	MInyuIazfTde3y2lB8+a+cFDmpdkVXnTruWQQY7c5
X-Gm-Gg: AYBFou3NFFB7BleHjNs0RtVMbJq0gj6KLSrOZ136Ap1n+oOYYz1fJCvyAs6neJuveSW
	YS9YbbSrh2P9JrI8Tsi2ivQ6XG3Va9jkjBdg89Ke52b0UcpC1mC2rIxbUOfGKgv0Mwa9K+2SIgb
	34rPN6pt/kcQ7o2fk+GOAnuDO+j/c3Xk3FckMXk4Ba93rt2MFXQDhSxB9+XnUQoPxTSfZ4X05TC
	WGzZVKr6Th135fhE9N3ywBObi2CgVEliw8oux1DZSvLFPo/GQjqTm2I1x2Or/NcOCN1V98LqcE0
	KXqZ791pHPiVGXhEe9Jkjbent+ayJ3/JnlGrlqBzXv+tH4aoUUy7oanNTN/mB2qEATlyxn1QHdy
	1drbSOzXfH961f3EWsLOiBrJE+9g+z55rZxu1Hewww4THe/cZyjZVzWwszsgfWCQw
X-Received: by 2002:ac8:5dd0:0:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-5368b32a9c3mr35503331cf.10.1792589320454; Wed, 21 Oct 2026
 06:28:40 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 08:28:39 -0500
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 08:28:20 -0500
In-Reply-To: <db4d4e246ad6b4769f736db0d3d1678adf9d59cb.camel@mediatek.com>
References: <20261021035450.3488805-1-stanleyjhu@google.com>
	 <20261021040615.3566831-1-stanleyjhu@google.com>	 <20261021040615.3566831-3-stanleyjhu@google.com>
 <db4d4e246ad6b4769f736db0d3d1678adf9d59cb.camel@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Wed, 21 Oct 2026 08:28:39 -0500
X-Gm-Features: AclHuK_9yuJHTKtFtEEYtr3PTMFrReT2NVeEAvxb4V7BtW5ZNHdjV0Vtrr4xmu8
Message-ID: <CAE14pdcR7NPqK3W6Pfy+FkRrXSXB9wFuweOhLyFtSye_Bg4vWw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] scsi: ufs: core: Fix double release in ufshcd_abort()
To: Peter Wang <peter.wang@mediatek.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-10-21 at 21:12 +0800, Peter Wang wrote:
> If ufshcd_clear_outstanding_reqs(hba, BIT(tag)) returns 0,
> should we also set err =3D SUCCESS? Since the tag is already done
> =E2=80=94 either by the ISR or by ufshcd_abort =E2=80=94 shouldn't both c=
ases
> be treated the same?

A return value of 0 here means the completion path, rather than
this abort path, has claimed the tag and may still be running
ufshcd_release_scsi_cmd() after it dropped outstanding_lock.
SUCCESS tells the SCSI error handler it can retry or finish the
command right away, so a retry could map the same command again
while the completion path is still unmapping it.

Returning FAILED here also matches the check at the top of
ufshcd_abort(), which already returns FAILED when the tag is no
longer set in hba->outstanding_reqs.

Thanks,
Stanley
