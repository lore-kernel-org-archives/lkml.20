Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82245472540
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601297; cv=pass; b=qlcvaVX6WgbdE3myfA4lv28/3LzY4MW0gDJe4ZzRBmiEl0M5lWVz/CQatJROwHa8G/OwtnwwGhA7PQDEyUyoc847XADrSwAhBrf/tslCvV2M/ykePk9JJvQEAQxyTSdF8L/gNAVlUsyzzJShstaKGGp+EAENpfEHvvDozvSGXsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601297; c=relaxed/simple;
	bh=IMxnQufaCzkTXnRiyA3ZHoFemW5xbKd7VwJZP/04O/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjTwQjY42h+uYQ/cHmA++93qLhq3aIxf1nbyEzexxY/Yi6/UF1lqAP8HCMGEc07JWZB/yCqepvFd3RyXH3dIJzQLgga3k9gA0Vk9oLK7A0SR1gJVbgsPLdo4Ct9YSCfhXDK/sXfeDRZqO8wvjnrqzfSbo+3KjfkmfIZkl6jgWo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grV7ytMk; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grV7ytMk"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332a80a731so23586731cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601294; cv=none;
        d=google.com; s=arc-20260327;
        b=eC2xogcPVG0/zPvHgedtMVRbcCKNwwpJ/hhiyNayCMQuCzlOPHDJzNgkbG2LuidJMy
         XSVHBeP/+xMMrnu+2JQ1lcTvhRkiHtvTdG/jHKzrkipSb3YCpXLUg+r9bR93vH+XjQ8m
         ZjRpGIFy3FdqGrkwm6Q3NV5EdChCrDjWPAzWr+xwMjaHTo8YFA9Xzk7xlYlfC7Jk1fXA
         HDgeoDlzETwNiBJk9zlXOQJqHGFV/gjUwfmVtOqRqFShEKIHGFQPUYNHmpG9d6a/eL6Z
         GzlZ8jIzV0mHzwV1Wp7Zk7LcCrLxBso7pbzWF7YMGe4Kbhd+/4IgBtd4gM6PiwgXhzbK
         Ca3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r1SMrAH1r49vvILpAa/qi1ETeV/g0f8aieo9GqOifRE=;
        fh=lpFzxTk7Par4dpooyR9AoxlpdMSfZFmPkFTnkpUzvRE=;
        b=k29kZ0SymwQHO753aPaeu51lc7JYNftLar+pGS0py3UaN9HQXKJk+WNavYwhZp/eFV
         IeC8Mp2LVOfBIaIo4H5jacxFzhPTmaacL1sZ8dyWzvmjKg23uZ0gExeDRYHic/iMRl2Y
         niaMuiVfd0x/puw0CgO6CLoSaYgyRZy3LwBM0ChwnX4HqfV9z16ubSI+28unQMqzx0nL
         CRuJVUf1i3wwsBp9NLTtl3rB7R+yt2aQCIHC5hdlJ4/d+6A2wDE1WG0hP6O89SpStZPy
         j8BOjQxm+ghrNnuv8TXgBt/p8cSgLKu1CryRSXiTaifnwuE8gVzNc9MVS2DX6h2YQ4r6
         K+QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790601294; x=1791206094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1SMrAH1r49vvILpAa/qi1ETeV/g0f8aieo9GqOifRE=;
        b=grV7ytMkznkmsLJMgoC915w30CVc5DufTFFB1izaV5zbhkDj9o3tuJcYICxMa0xXh1
         1yjS0RUa27bib2r0wiYcjlEHuzfj6McjEIL9kolEQjKNpnZ6IXv2Qgeto4kuF2zB1yq7
         xPy+3gH0mTzAuOOOlHU56HWyIyzApaaVmyLqWTTHSeCvQ9WRfr4ZN6lFKzsnNzyN6Drf
         uPSnedrcIQsHVubCI6QaGlTExlh46KSb9voDYXHJ3yOOJp/UhX4IJqUbhEVPNOp5rbLA
         wED+X/LKTx6NX+5po5yl4aIVl5jov9iZh6MDfduTo4BJGd5yMCUYeQ+2ou78eEEGwkfY
         kliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601294; x=1791206094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1SMrAH1r49vvILpAa/qi1ETeV/g0f8aieo9GqOifRE=;
        b=1H3/DVpgFh7Rewd+wGRmhbux0HVfMHWMg5EBf0dm1SGnjUy8T9O8OEQPqTACFdu9el
         qaTn9btbdi6uyDUPsiZPn+NZFyjXYbwEhL7piqxXwYoFwxakyT9H12zicwal5t+jJRQk
         6RECKlPyjCSwOUIA5JzcvlDKKpNKAxO4u3tr/SduNgs/IOfordtDgIEjKhaAGAJOHqD1
         52b/ipWtsN8i8Fe3uz8XpZVWBweVEB3tV8menHryX6LqWUYvd+wIhFtrKz6PTL6SszF1
         ODChF4kt8D2hZnUGKowQP8BacPmTJfbRvDTUIVKQ779rmJ40zrlhem+2R9peLmmEAI6m
         5l+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2yqRMxBwmwEgYMA0u9XcCEGtI2nx0mhTsjldyBXS2SbzzPb+OoBVUiCC9nFEyRb2ZilZkjKDZQmtCuuY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+nFX7MbY3fspwkTTcyP1pg9qeX3O94KkCSlyoYjXP3EBlTAvX
	mi/kmb6rMBqiw+tp5a//dlzbXLOtvRtuvwDNI65eTqQIqMT3HE4yX86rUA9oN94NHgCE9+gEsH/
	6cAnhHiJ1OwGrS6Q4E15lVCQJJ5BXB7k3JY72dNg+
X-Gm-Gg: AYBFou1cnBTQK8uOetc+GntEMGfANsNT6B/EdInfK7q60618XZ+sUC1S2QwvEA9nmqD
	5MZ55bEh4z52k00gekWtP8LtGsyZTjzhk3UJkkxxrc3ItM9ZyFeWiWMir5pDJ+lo9GdNRqV7ncj
	o0YTlXHwF5yjj3hcvvWBhr2J0NmngsQEoK1a98FSHN7Xa5BKBSrN/u626aX/S0d3XxRMsYqqBUJ
	RHSBADHb9AVilz+G03z6+qr2vQctr9kgp6mBR9CZKF63m35b0YM55Ak0owgU2926qhoxRbx2kr/
	0+HVYcrjubrYK3LV7PJRTfwtCZgUWipwr5pZZFp9pHjG+ZK/2lIFWHEeOcx2ewfzjxh0Xxauxnz
	CAX8jKdByzG2Uq3XUp/YSvD4Xnah6DdNyZ9/1OOLi6xRvQKZm6dxpt/UxD+XGt7u/bTigLNeZDe
	g6NJs=
X-Received: by 2002:a05:622a:2b08:b0:532:9f90:3f71 with SMTP id
 d75a77b69052e-5330d89f6cdmr193121291cf.0.1790601293475; Mon, 28 Sep 2026
 06:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928121454.901306-1-nb@tipi-net.de>
In-Reply-To: <20260928121454.901306-1-nb@tipi-net.de>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 28 Sep 2026 15:14:41 +0200
X-Gm-Features: AclHuK_YIHb9fudcU1XrJHxEBilDeQsn4mW7Xal9HnNTD_7lep8Nf8pWHwC6TD0
Message-ID: <CANn89iK5RTtZLPAY+rJKCeUpLkCge+PFqfN-g_M184S9fyzSsg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: bcmgenet: complete Tx NAPI after one
 reclaim pass
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:15=E2=80=AFPM Nicolai Buchwitz <nb@tipi-net.de> w=
rote:
>
> After reclaiming, the Tx poll asks to be polled again. That extra poll
> finds nothing to do and does not reduce the interrupt rate.
>
> Complete the NAPI and unmask the ring interrupt right after the reclaim.
>
> On a CM4 this raises 60 byte pktgen Tx from about 187k to 224k pps and
> saves about 5% of one core at TCP line rate.

Reviewed-by: Eric Dumazet <edumazet@google.com>

As a follow-up, you can get rid of ring->lock in the TX
fastpath altogether (it looks like a leftover from before TX reclaim
was moved to NAPI in commit 4092e6acf5cb ("net: bcmgenet: use NAPI for
Tx completion")).

bcmgenet_xmit() is already serialized by the netdev queue lock, and
bcmgenet_tx_poll() by NAPI. To make them lockless with respect to each
other:

1. Drop ring->free_bds and compute available space from
   (READ_ONCE(ring->prod_index) - READ_ONCE(ring->c_index)) & DMA_C_INDEX_M=
ASK.
2. Use the lockless queue stop/wake helpers from <net/pkt_sched.h>
   (netif_txq_maybe_stop() and __netif_txq_completed_wake()).
3. Ensure proper memory barriers between populating tx_cb_ptr /
   writing TDMA_PROD_INDEX in bcmgenet_xmit() and reading
   TDMA_CONS_INDEX / freeing tx_cbs in __bcmgenet_tx_reclaim() (since
   bcmgenet uses readl_relaxed/writel_relaxed).
4. Avoid sharing ring->stats64.syncp between bcmgenet_add_tsb()
   (tx_dropped) and __bcmgenet_tx_reclaim(), and serialize
   bcmgenet_timeout() with napi_disable() + __netif_tx_lock_bh().

Thanks.
