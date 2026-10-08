Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73B125AA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497818; cv=pass; b=t2XbvfzX+nyZuYPQHHS7kaZqImmtFEiqD9Vm/nBzjOYp3CDK5JwI8RzQYfMszQ67KFys8f4KFmxhhHIkU2viDc97IcxCVh+vtKMnBVTdU7pgELxGV7R92bFp0RB5AUaCWSgQFcsK+AHUA41ltAvkRyuzyLS2/ETx2zBjFrtVc0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497818; c=relaxed/simple;
	bh=hRz2Up5ISD2OXp/YSfpaI4bBnwMkonIsXu4OzAHa+tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbYLeEf1PZ0jzwCrzK1FUAY9CyL5B9wz4kprG/jSaHC+zZHdJE6B1aumedlCqAImbw7iZE3dyAz1DasZ1SsvMxQDw7rYHB7pL9/QGV60rRNpxnBARUi6hBeTiE8JbDvUoDVZOMhLuEW9E97yYJrQBTwJTcGwMekpZnjeVXDZLkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=gVcDmcFd; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="gVcDmcFd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34c4a0868b6so5321371eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791497817; cv=none;
        d=google.com; s=arc-20260327;
        b=U/EqxlVUfhTTuy+pieFNdrNucu3wFRtwcetrPp49rZwJEasAfPGoLN8nHtnKXrDeJi
         GNsptsJbuk3Q/4udUNPBe/Zu43X5vrl5O24uqTElY2TRwyGWgOCD5zTCVAE5wMRwJvYX
         oFQoEyUSc2dkA4d3Wl+E/nfy3KuzXGAximCKB74+G1y/8rYbH7Z4l2AFArOQQ4H8yc40
         GFYgEw6DuOQi+r7MQps4g520Lqj2qr5f0h9Yxp46YvlLR6OLTWtbkGiY5dPUyT5iNMKq
         VkCceNUrH+R8h0s8syPLbLCEdfHM0GQnSeDfL7JTy31j4hItLG3XpqKJrwtLw/KLAKt/
         unVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=;
        fh=EYq0jC99MwcxbDd2TFheSWR1LqNZ4jCYyt/owqPFg2c=;
        b=SS0xdt3u3nU3UoT8FZKMv53+parxoZfWU/2BLnHaZb5IuYvLsvkm5nRm+aa636XBdK
         m3iQOgxXVphFlT5JIa4xyd/ZJ9DGmRWzLq8u01i1+MWbPkmhwvqnsbRAuxTSNR3YVSO8
         yBslxO86LGhs16BkEu2yQ6EtrHztB9zjS/WkbLnWah6ItRcUjFHcIoJU8MQuTHwizWe6
         39CY5fAg2i3dyzj+roN25RY4i4k1Cn9/Ltg78cQzTaCWYpd0tGC+uvzvA8A7c3MQHS4W
         8lCk8lmQvzFXz98Tz/TiZ8Aoat3JfvU4fQgmrMtfJ02SUcLrwadhAEZMAC1KckJ5JBwa
         JO8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791497817; x=1792102617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=;
        b=gVcDmcFd0mcmAwWE0aet7pLllHwOmQURXOTcNwRkBJTOd4yH3kQoNhaZnzHFyIVH1h
         jU8YcHev3kfsI2pZRJ7OTVaN3AeBo1ZeHBQvORQPqxbV5JvDbkb6s5Vfdpl0BnCT6mHC
         OmJxaRz7SqCB2bdkTOakmsm30buqE+7cLcUBBBAkyiKuZ2VF2BBhquL3oGGIAOiv2onM
         t0xvu3by5JmUWQsUAWtPreGq8CnK/WlhOzH5EOHmporIaU9qqzKmHuviGN9/Tu7/G1ev
         bV4sjWz7vGw1Y98BylCeTgtmLmISeE8SCJCMn2hatOYg/zPgDdTiKcqiE54sb8IntrH6
         uURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497817; x=1792102617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HVDKkJhQMONwczHs0ftCK6WjzDumHDVk9DP6ZY0LChU=;
        b=i1qFHuXxQ3HfU97GvM6vPmieyUCyQqu4j6HQPKQMaYydZrvqcPpqDya6ecN51PcP7m
         T5RKCHizL/jO/ogrXpw4lGI82j9fr5ZZzr7pmvxQ2MvHlystcTD3L3wOfGnX8L6UvXqi
         t04+xbdnxDdhN1S6Bn2K0m5zBsngl4MxPc/0Y2kXSc5YC5IDu9VIcX25ad2ItqtFJi7Z
         gHpA8IeX0VLaKhzTRE3WH/ld/+UHq1wO5brfw+gVv2Cd/zp08s88V8HcSI+McmizYOLQ
         wIGqAK7G78+4PXdcUFil+5MBoWc+ES5/Vf9Xt53K8a5zSw4Eht1aKFOVXgSoUBl4xnZc
         bktQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg/LRxa3YCE5gs/t+BJWA/02EuP2I6GdNzhos55KGsHh7PRd/WYej4/R7M8+dXArVUOAMMd/HwC1yil10=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb8BONMsC6zxqFaGyOil0k1GlJriQFe/HnPxDeQFRvoHM+MEyM
	0XgXJdcwIrWNXPwU9vpnEy0ZO3WHqTv/e8G9ezJoXc4SmkPC1/s5XmqIh1xrS9VW8YIXqnVtJxr
	L6yy9vfnBLXc2VxRCMUx+pX3z15usGyWvcCQXvGu8Xg==
X-Gm-Gg: AYBFou1tN3+o7f7uE2I4XRdWe2VUbvs0q6LwArzH9/vwaL5knsiFcrJVc0+FC/YWg/q
	N2Py+WOl5TecxxUmUoHKn2FvwSUViFpyHC1Cqc2F6RfQlvv/Xuq5t0KEfBzLUD1y0bIOHNlEw3F
	Np6WasM9uvXoGJNRgzl4XxEuuYu3ii/s8vVqauqjhycoUfmn+csEYe8iD9SWY892YNFJsXYZCOg
	Dq4PT6J+HLtScJ9p8A7KODpblqB4WdYQGwhIPjpcB7e2J2E3Dq9ZApgpfuaYLZo+Tg9habpdKUv
	AHE6r7W3FSdATzw/UmmZq/2ldr4Xk6ViPvJloRgc0cgmXv+cC/TcrQI=
X-Received: by 2002:a05:7300:c389:b0:34e:2150:e5a4 with SMTP id
 5a478bee46e88-3536c58dbf2mr892218eec.16.1791497816699; Thu, 08 Oct 2026
 15:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598@nexthop.ai>
In-Reply-To: <20261008-i2c-xiic-block-read-nack-v1-1-94882af6e598@nexthop.ai>
From: Siddarth Chilukuri <siddarth@nexthop.ai>
Date: Thu, 8 Oct 2026 15:16:44 -0700
X-Gm-Features: AclHuK-e4AvKn1DVj6sz0TdknScpn3tml46-rFF4J0_u7LxyuEEllK9h95XoXnw
Message-ID: <CABAykkvoTxq=mDvpfUnN3H0O9oX-8D+DhWi9SqzrW0f7kRSFDg@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: NACK the last byte of an SMBus block read
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2026 at 9:02 AM Abdurrahman Hussain
<abdurrahman@nexthop.ai> wrote:
> +                     if (tail == 1) {
> +                             u8 cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
> +
> +                             xiic_setreg8(i2c, XIIC_CR_REG_OFFSET,
> +                                          cr | XIIC_CR_NO_ACK_MASK);
> +                             rfd_set = 0;
> +                     } else {
> +                             rfd_set = tail - 2;
> +                     }

Thanks for chasing this down!

Small nit: it looks like the tail == 1 branch can't be reached. The
padded branch above already takes 1 + rxmsg_len + pec_len <
SMBUS_BLOCK_READ_MIN_LEN (i.e. tail <= 1), so this else branch only
sees tail >= 2. It could just be:

        rfd_set = rxmsg_len + pec_len - 2;

With that:

Reviewed-by: Siddarth Chilukuri <siddarth@nexthop.ai>

Thanks,
Siddarth
