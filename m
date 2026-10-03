Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B202DB78B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988615; cv=pass; b=s5k1ekFq/+ZBIloxVDdTtfSK6jZfiuSiCU2uArIrpBtW92ogWzHLnMaJYXn2hiGQMoL6eeBH5+W+ZJchHyeQlClL6xfp1hWa7KSIRv7p+Pja6L40D1Nb4nzWRrT2CtGjYHfjp8PX8ZWJrW5I9bCoICeufxKiSyK8uaGXsGmlNwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988615; c=relaxed/simple;
	bh=E0ak9elnGovBcibz4dgEqttF9r+fM9/fIhkUL+dWNSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ND3Ig/uZRgSkxZHKwJXQ12unOW9DW1z36mJGAOLqcthtALNvC4kwHPmMjFrxMNQgTn8Mq2BENZ0WvCgYQwQPYV+A4GI9bJoQU6J3Yrm01dX/u9SK8++lNR1rBDeBGbGp2YDJWlzhMHVsTv7LIpeK81xM9rMWvchxDAkc7hMkKb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iB+hWCxr; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iB+hWCxr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d3b445a84fso5365ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790988612; cv=none;
        d=google.com; s=arc-20260327;
        b=aYctiTOW0db6OYTHzBSaJEfRShjm3S03tLw95xm2xS36fCObClUhnxZucYOG+Wu3l3
         cAirJ9bM5QXtXRxkKSszzimO5eMOdzgz3y3D4cJGiEvlLAM9WMqNzRZ3dRKb6KgTmqQj
         qjAY1voEMXh4sgFwPTUUsa8tzJ8LfzadnSeaLbbmNyvooK9Ce6g78+aFHnZM53xl+hpI
         njMbknYqpQn5Jafax9wvnVPCDIAx6z11bQ4LngE0AI6Dl2Kiici1Uy+6MBUJX7VLQKR3
         e+OonC1gVnRfkl++6DPacf7NHh3ruhG8hp2LzovMb6MW7VubdKm/BrKg9dOsE5wNg5NV
         bOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkzjtExVPkivkjjFe+rV1AWglz4vv2i2oMPXYlHYHoY=;
        fh=4aReXUDOCtBuIlK83KzbbDpCDYjSiZXs2x67mxy6Ar8=;
        b=sWGvKkisE7ydw5fQWyx9VPpk1rFotULlkCIM6hnBK0QSdN4FQjRGzdo0EGVAXt/rY5
         KAH8Q4bAuPUKPhXJoNAIqagel6Ard57ZhUb+nu8nxU9Y79cgNXNNTuzBuNT+syn715Fn
         jkIz2K5SEL1jpCHBaylrKtX0bG2u9qOyS3udLwQ5AnlNkgb1ptQICOXAY7IlEHetylYZ
         LEb53VwSrFAwKm+b7pF5SHp6NzLAqb3gRSmXPqqU5ED82eEFH7fvU9MJk7SgZQWR6RE0
         EoXoSIQG05PNqJpDT334SDXtavGZbYgfHLHsUajMsF5QkWsTktP0pF33mNKjf1ZKriSF
         yBZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790988612; x=1791593412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkzjtExVPkivkjjFe+rV1AWglz4vv2i2oMPXYlHYHoY=;
        b=iB+hWCxrWhzmOzjLv0oxkXZWQP8Ug85gjp+TtXtGb1w6jfSi0rEvuUNiYFOOBaVzx4
         Z7YENzpvMz2Qnj0LnGKndz1b/KebzQpBk0BQBrkeR0cedhz2bZcUQIXu/y8l3bcJdA9Y
         T9YvCqwviMPfMSdvxvIaH8FDhJzxGuu5o5S+Qtt1nkydFRiuwgVXVExDttfR5QxhDwfi
         MAZcmqaI8AzupwqdcKTLbt3dXLGg1LiNWn7a7SbF/Yg8bHIFTgs2V68y3zn8zyh9SC77
         dSAIr5zfAbuBWBnOpDKUjhftNA41dXfUov6Mnh30Sr09xxhXbAvH0GSZ4Q6JmThbAllX
         uBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988612; x=1791593412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkzjtExVPkivkjjFe+rV1AWglz4vv2i2oMPXYlHYHoY=;
        b=ok7bUnrIezZCO9JdiQ20n+CagZlB9tWudhPMDBNyQGVw0/fDJ61puT9i87V4pPZkVn
         nwNph3y06OibFnv33jHPkADziv6OCWbZCm+SX0wKp/ieUO21LFu+mJSYz1D2kWFySioM
         rleeNIFL6hEm8r4K5o9tdvTonUL5VxNQ+Qzftg3+TU+97i3Fxt9mrsMHYOAG9mKA9151
         C+fC4G1sjxNHTESVn0//3SLMQv2h62xDp9O6Bjl0JXpdya62Kmt0PcqJeyWhsa7bK+Bk
         4/yWoo/m6Ukw8VlWTy25Kjg9/nocAeBd9V+rTI0UhUx1zGvow/Hxt3Ti7kppXuVKIO42
         1UTA==
X-Forwarded-Encrypted: i=1; AKwUvBwr500heQmx6c5YZi3sWszHr6kLs/ygnyYf9OEwmBJzRQPcG1Gjmfol9Ffjou92Zq+vTa9TCcdaZ724BDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxoLGp+TzTib9jjTFk3Sa/jbhfNMFeBQFqEOagE4rGE0V1Vx3E
	U2LPatLCxwymGHGyBYmT+EpFxdgJsZ7CK6vYCKPKaMqRQTy+oOb2Ft0uOuCTNHLZpGJLQu+BlAQ
	dHFN60798xEhuCMDn1vJYYG4sDsUvKDf1EBI+/E7h
X-Gm-Gg: AYBFou2UMBRnjN9uNwIW62jRPexeuqNoNd2dl2UFBP4ICbRyWTMgAc3SYS68ADEhKRE
	lcvu0b8JNGYNbhZdHKL82/47E/6xb9Nea4W9ensCBVHtLgdZMLiBjALOSTpJbNyW1n9JRg21Lai
	jesx/1AyqlUEcF+fLnz0AydhcGN65ZzVwIbKGL6pTWm6GqR5X2nHGWCVr2iLCx7dY231RR40jmb
	HH+jgZU5PgaEPwLPA2cgjNi6sZKRcUk4KTRCmo+VfWclxRsnxWI5tvOfKOB2Zc1blCYdrWVIe2s
	nja+LZVaqTtaEP3pZYV5fG1cp/oUO3kDRCHIIUgSwOtlfVCsJ2btfL9qxK41YhlsjOBAfyZnMYo
	hhxykgng5t0JateUO1HsRCA31KCS5FuH1wkWSNnV+I4BoGoqAVuI5LZ7KfOecaBpx
X-Received: by 2002:a17:903:2c06:b0:2dd:8958:f8d5 with SMTP id
 d9443c01a7336-2e5310be739mr2414635ad.6.1790988611797; Fri, 02 Oct 2026
 17:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com> <20261001-linux-mpnic-v1-3-6422ee74233a@gmail.com>
In-Reply-To: <20261001-linux-mpnic-v1-3-6422ee74233a@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Fri, 2 Oct 2026 17:50:01 -0700
X-Gm-Features: AclHuK8MmjgjIkQ-hlqZizE4Eo7pGHiHcfRGfCiZpXQ2buJsOrddTJUzbSOeDvE
Message-ID: <CAEAWyHfRqE5wJTi7jq6LAK4-+i0bTFGzVU_HByEGUJJ7sGcGbA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/4] eth: mpnic: set Rx buffer minimums using
 page size and mtu
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 9:46=E2=80=AFAM Daniel Zahka <daniel.zahka@gmail.com=
> wrote:
>
> Set buffer based drop thresholds in the Rx path based on page size and
> the max MTU supported. The device will drop packets if it does not have
> at least the minimum number of completely unused buffer descriptors
> available.
>
> These thresholds are currently set to 17 BDs for both HPQ and PPQ. These

nit: if there is a v2, it would be helpful for review if terms like
PPQ/HPQ were expanded here.

> are overly conservative. With our current max MTU of 9742B, the settings
> we should target are:
>
> 4KiB page size: 1 HPQ, 3 PPQ
> 64KiB page size: 1 HPQ, 1 PPQ
>
> The HPQ and PPQ rings are always given PAGE_SIZE sized buffers.
>
> The RDE_CTL register encodes the thresholds as one less than the number
> of BDs needed.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
> ---
>  drivers/net/ethernet/meta/mpnic/mpnic_init.c | 13 +++++++++----
>  drivers/net/ethernet/meta/mpnic/mpnic_txrx.h |  6 ++++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/e=
thernet/meta/mpnic/mpnic_init.c
> index 2daed458f5fc..ace4124158fb 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_init.c
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
> @@ -10,6 +10,7 @@
>  #include <linux/sizes.h>
>
>  #include "mpnic.h"
> +#include "mpnic_txrx.h"
>
>  #define MPNIC_MEM_INIT_POLL_US         500
>  #define MPNIC_MEM_INIT_TO_US           5000
> @@ -272,10 +273,14 @@ static void mpnic_rxglb_init(struct mpnic_dev *mpd)
>          * the per-queue prefetch FIFO.
>          */
>         mpnic_wr64(mpd, MPNIC_RDE_CTL,
> -                  FIELD_PREP(MPNIC_RDE_CTL_HPQ_DROP_THRESHOLD, 16) |
> -                  FIELD_PREP(MPNIC_RDE_CTL_PPQ_DROP_THRESHOLD, 16) |
> -                  FIELD_PREP(MPNIC_RDE_CTL_HPQ_LOCAL_DROP_THRESHOLD, 16)=
 |
> -                  FIELD_PREP(MPNIC_RDE_CTL_PPQ_LOCAL_DROP_THRESHOLD, 16)=
);
> +                  FIELD_PREP(MPNIC_RDE_CTL_HPQ_DROP_THRESHOLD,
> +                             MPNIC_RX_HPQ_DROP_THRS - 1) |
> +                  FIELD_PREP(MPNIC_RDE_CTL_PPQ_DROP_THRESHOLD,
> +                             MPNIC_RX_PPQ_DROP_THRS - 1) |
> +                  FIELD_PREP(MPNIC_RDE_CTL_HPQ_LOCAL_DROP_THRESHOLD,
> +                             MPNIC_RX_HPQ_DROP_THRS - 1) |
> +                  FIELD_PREP(MPNIC_RDE_CTL_PPQ_LOCAL_DROP_THRESHOLD,
> +                             MPNIC_RX_PPQ_DROP_THRS - 1));
>
>         /* Receive side coalescing is not supported yet */
>         mpnic_wr64(mpd, MPNIC_RSC_GLOBAL_CONF,
> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h b/drivers/net/e=
thernet/meta/mpnic/mpnic_txrx.h
> index 834eb9bfffd1..9397010557eb 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
> @@ -58,6 +58,12 @@ struct mpnic_net;
>
>  #define MPNIC_MAX_JUMBO_FRAME_SIZE     9742
>
> +#define MPNIC_RX_HPQ_DROP_THRS \
> +       DIV_ROUND_UP(MPNIC_RX_HROOM + MPNIC_RX_MAX_HDR + MPNIC_RX_TROOM, =
\
> +                    PAGE_SIZE)
> +#define MPNIC_RX_PPQ_DROP_THRS \
> +       DIV_ROUND_UP(MPNIC_MAX_JUMBO_FRAME_SIZE, PAGE_SIZE)
> +
>  /* The page a buffer descriptor queue is currently handing out. Records
>   * how many of the references taken on it are still unused.
>   */
>
> --
> 2.52.0
>
>
