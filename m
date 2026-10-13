Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F6519908
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902519; cv=pass; b=idHQRuIbDWefijYTeFQbK4MRVUkNRvGSF2BLPfNSKwLqHxM42mW2ySQGeY7P/O2ONbV5/Qj9qqx3IzfkzWqk0BvcpA7Prm+Bl+slD7xYY3xXMHDYjqzXA6QwtmvQMWInyam+hctH/fs62bq8jfqTNrvbvZ28EkUA6isxpIDOeN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902519; c=relaxed/simple;
	bh=qUs7w5ACRHy3GOBHYVZOyK+3nLYWhsG5Y+p+Px/cmc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcF58O3FfdrHIJsKT0LOHiIMix1UhAvIpirvH3s6RBPw6WSRxvRIzy1b9T6Z47kPEef0h6D6yDsB/ZOkwv/PicRxXN6LE9IHeiPqQNtrTNN45L/5BE4Divj+J70XlwzLyBRhUxFheK/VxIF6UQOcHq11uORaH+1+mYBF6fFY4BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psPeLslh; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psPeLslh"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6768ced47aeso2764456d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791902517; cv=none;
        d=google.com; s=arc-20260327;
        b=gPAx4tEQXysRf5WEoR6G/hH/MTRIueC11yDGFgkI8Oa3oXScujuf+Q4+xc6QQMD1D3
         x6FLD/z4ItLwvzug92S81/fnFZojGM42s35M9a3k6FL2LYPPrlxJCY7YfV9UpwUAKQWn
         8QS+tIat+Zlqh4wIzhc85Q8Mc/33QTa6R12At32+o6FYsL9IjT+cO/fYbexHfa4wSS09
         e7nU7uDXhDzBuUkIrS0pZGKudANCYwZZmu+J0C0Ars8cWhXloFAhFJdMMlC2+McyBdgD
         kOaofpITDREO86NZdh8CWxSTn9vVk6roAttHyvMj8E3jTedSwuRiZQrbqoeJjpbc+I8b
         HyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=msz/OHbY6gDBK50SJeL3egmDDr6qQneSQ9CQTdw74V4=;
        fh=xUjVHpEG/0TAhWO+1ScdyHFV3B5kHFIuBKJZqFqhaY4=;
        b=ioYv2m1W1PaPBF2cMiJbnjIeCaPy1UVT0vFg0nG6wcjKp03GjFYloTarmRiCr7Tehr
         2nWfSMGRabXdBZ+Ei3duIok/b/fa8p+djCo7ZcRObRZ1gzSBZgkWMJpYjnpwwkMzpmSS
         k52a8rqmIJVuAaRhQLXTjXEL2Sdy7RolaryQwvl7WF9j1daH6c3JcEYtaPb+tQEuxFfu
         qToesZDvCKa0rPD1bzJ1E5S0JHxv8ku/th5hTt+Mz7HREMAJpAASVpOFFYdYtDiNpuAB
         ApEGb5nOybv4o7gnGpdtqplMAXc5MDcUXDWDJUwOcy0zRULjH1rIPjf+W6zg2odV6YQa
         yJDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902517; x=1792507317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msz/OHbY6gDBK50SJeL3egmDDr6qQneSQ9CQTdw74V4=;
        b=psPeLslhw9nAfZZ0VGEkOXHwf+HPF//kKiC1Ym/+hztuQzbiD8jBo2tSJkW9IgWG0K
         /2c0bQS0XjIgA3HAhDo12sPidMsXv5873pIrEWY+s/dv3gX9Na464akCNPOjYlzTWrKT
         UZNVyIRII6rHOjDy8Ak++NPQN0TlUrKLnHjzpO3Kne35towMqAMP+saDXsLEaCorEnjI
         yIrNlXwbheNTTWUP1Xn+o2+sKaTwDH+b9PACUQ31omdj3QEycOV++7bpjq8EkCWSY9ww
         QFMS7pwr1CAbPOhTLK5C0I8Bo3LhgS2E9BYDNzbFL6jThnRVipMFoxq/KG1nEhcN9CaB
         EXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902517; x=1792507317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msz/OHbY6gDBK50SJeL3egmDDr6qQneSQ9CQTdw74V4=;
        b=bfWs7BRShO2CRt1/KF/f4qT5isbFVcUWaBi1FRePDlQyJfEGBe3O1XhijkBIeW1e4i
         FfF1B9EC2A/iuwWKC8XRCBZ5Bdm4R8f6vg+QzBgqRwpL5nC0ZW+rHtXsnqdFQRy1Ymjy
         2gdwLv404ZcsuT8qmXDUzZuKAljogdc+SzLwVOQG6FtkKVtGzTOUuV1GsH2hM+6Hi8uf
         PfegLBp6bvr25dwkCq6H7xLZg512zmASNJ08kKh71PoGThnYgZEKNTcB3s8nepEQ0UT/
         eZjKi00vjfw5dmBRIlvZGukO5IsEVDKXmTzO2GOJnX+X03l5/Hw9R164hscOcjrkWl1O
         m1cg==
X-Gm-Message-State: AFq9FYInW6mBPZgn+JpsH/toHSgtX9x/zOoQW1ad3N1dB7uhp+vzTf/2
	NPZ+xtisgKtt6TmW8H1LB9eB7l4eu9D7FoKV39Z1DUtt58oZwtlx7KvaRGMO67QckR42UDb4B+9
	aQ73RbHLY02e28jA6S1J5bt/Z4aworyo=
X-Gm-Gg: AYBFou2fcJ91ZbP2RmPJ5FNjvX3wKsntLk4zi3teCiyQvwh+6Q7g1hyj5cb1oS6ocuz
	oMXXxsuTaxrtjUXBIIHhKSo87VpY/6yfQcTB0Aol4Ct7MXmu1MK7+woKMC1gNhvRKZDI/9FkWB2
	IEy4HgCTEfJY/whjaXTYcjP+OcPj1Q/rRMUKXlgqdnuJAbszh9CMoVBc7G4bN48EZwwHS1WcDeW
	rmaajWQFw6t/DckH7br6XSOvH3Iqq2F/4e04G4UIwRyW9E5MKbtsQKZ8nh2i6pHloRwCI0kiBhh
	oKLizhQE4xp+d+zf8uOBpShKay6rpyr/MgJOKaXryZVbcpac6/JZr6yZEWb6Mh/Njdpuh76Hn7O
	koHRid3JtDuw/rrrHBCBqFTCpIw3+7dPSjoboVP8X9UhxgtVntfYA44DHKLtBzLcnsMUO8RLwRw
	==
X-Received: by 2002:a05:690e:4419:b0:676:9115:60e9 with SMTP id
 956f58d0204a3-6793628f4demr2875284d50.90.1791902517059; Tue, 13 Oct 2026
 07:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791887415.git.mst@redhat.com>
In-Reply-To: <cover.1791887415.git.mst@redhat.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 13 Oct 2026 08:41:19 -0600
X-Gm-Features: AclHuK9vgLAAAJnijj2jNDp9uWMhQi6KN7iUpclgw57vpslbmAypj_7mfirQUWM
Message-ID: <CAF=yD-JhTbmYmHUkkruPcyvSWv0QhVeGWC=K=ZvvpMdkzA-jig@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] more virtio-net csum hardening
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, Max Krasnyansky <maxk@qualcomm.com>, 
	Paulos Yibelo <habte.yibelo@gmail.com>, Chris Arges <carges@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:58=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> Allowing untrusted hardware to specify csum start/offset for
> CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
> outside the actual checksum, and depending on the setup, the networking
> stack could be looking at the packet both before and after the edit, and
> seeing different results.
>
> Previously, commit 6785011f8b16 ("ipv4: validate checksum_start before
> completing checksum") validated all known instances where this
> causes the most grief, but the real fix is to make sure
> that either only actual checksum fields are ever edited,
> or the checksum is completed before the net stack looks at it,
> so it is always consistent.

+1 on the general approach of performing the checksum offload at
input, unless the input can easily be validated to be one of a few
common protocols. That greatly reduces the risk vs my previous attempt
at trying to drop.

Since we do not know the full extent of grief, I think this too should
go to net and stable. That would mean initially a single patch that
touches as few files as possible. The helper function in
include/linux/ip.h and conversion of existing open coded parsers to
use that can follow up later in net-next.


> This basically does this: checksum at ingress, except in a narrow list
> of specified known good cases.
>
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
>
> Michael S. Tsirkin (4):
>   net: add ip4_parse()
>   net: use ip4_parse() in receive validation
>   net: resolve uncommon partial checksums at ingress
>   net: account for ingress-resolved virtio net hdr state
