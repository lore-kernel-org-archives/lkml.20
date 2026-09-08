Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2A52D2C8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892029; cv=pass; b=CUSce8N/AZIcCbOS3+XXcOREZmK0rTkldfLsun/oO8fqABoBIplUN0vVaC8GIYK96fu+SiRLJVLqEiZrIii2aL6IicuFdYFVejHq5JXxEY0wJ1PcIz/nleVpnGCO4n/jmGwIAbR24DS1jBIL4OrxkE4kKI+U3SzpWgRv9PNZH0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892029; c=relaxed/simple;
	bh=/edzti1+6WAlEVmYxG0FqqQ4ZuFKkllgKBweZCBdkNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBTwNS2q4iyjFwY3p0h/utEjM8MQxTITwpiUVwmbL9AEIegiaVXDrAB/roZ2eXZ5P5ioHfx1IkjMRMytzubFUErDZUhIrionw9GpCPYs5AIKkZw2PrGUs0kTNZQg6jgfQ7gFvCTvslJ+imPxIGw5rJRYYfqRoCNuKcg/zhBpUEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWS5vjOc; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWS5vjOc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so58951475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788892026; cv=none;
        d=google.com; s=arc-20260327;
        b=q/6jf6TaZ2jghkUfppgu3cAGFe8RuEzkFuX53IxbjqjbtSJdIlfL5RtWjHmA5GX6VW
         WBalRCr6JvaXBzO8St/25aFNJOj4T73UrsAwHqlg20rUifUeT5gugCJykeJt5hHAcgNk
         YFs4Vbh+XP60t+BRh89ijJSsboU9pc0fxmnRrYFKnSz/f61TQVgI/o89EqPToOyC4X51
         72i3T0rRuAJiG0al1Wa7A1QMm5r0UVCee2ZhSW5U0dDvFGELz8hp3INjsNGb4yCWKHL9
         7fvevrL240deisx0kzpmejj3z/Xup9jcJX+WGFTPyInJrweObMBX63LQ9dIttE3p7/qi
         VOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/edzti1+6WAlEVmYxG0FqqQ4ZuFKkllgKBweZCBdkNc=;
        fh=IgWLqVbtTWHD2SKmhO5vMh1KLPUjD/duXQz57xVBXAM=;
        b=YbsexsYsU9ljqNbju4+d3kOP6SP0YTMTtokV0sJXwSdej9potuWmaHVRiCo6AnyDwy
         BKEkB6b2EJTAJtXPSK7C4Du6BpECchl8mlajkgOTFqDQbgeiee8HDoo7NEFDruivGFq3
         HaIOeD5ecHJcInMseek9egtWxINvEnoaUWC1ndsHpacCrO+V6binwb3ULf/HAn1u+CmD
         ngq2us0bCE7+TOwUycU7i/zSYFAc7003DhEjXMT2TQiUgNsAUzyxtaiRnR0tGKynrSi9
         SWb/xgJZiCxvvk41Q0KDZmViUOk1m1jvxmq5JSzjTGdXcOitfCVhjHNoefUwthL+L/Fh
         DJbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892026; x=1789496826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/edzti1+6WAlEVmYxG0FqqQ4ZuFKkllgKBweZCBdkNc=;
        b=QWS5vjOc0kk30Doc9anLU6JtrjNMJPr10mvMvvIq84rDka4F3qUdvxANTQBVi6ewFP
         FMnC0Mg7ZzijBvsdwcc1MoUalM8ll24oK90jK+lp96RedFshv0nB/NNFHGz4JFNn764X
         /u1pPjC02fw40scBuRurQRs2xhwOlUD8gjGzARmUijrtR4QbIGF4usXWYT/Y6KuK1B2q
         gS8+fSGXTM9XIcPKdPg/Hv7BZQqxFR+SIx/6IFXTPxvtTCjjo8YBMh/lUtWysS20UHe2
         HOmwUfnA92kbEMEeBBAM/hdDCR0zUWjwHrPqNJRGHZoNvppWmQzA+NjmyTYCwTE8ZDMi
         8XWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892026; x=1789496826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/edzti1+6WAlEVmYxG0FqqQ4ZuFKkllgKBweZCBdkNc=;
        b=RRJAErdRDQyN73PsWpPCa+xSB8Gj6QvOTWE7LFRqVoCdX5KmJTB1Zy9AEoMeudbFXR
         2OJJ44f35v1CLdI8T6NbCwVTK7XC4w/8Fo1WKDgxpl0YQTLl0DiAv9qYHww0QvxEk70i
         tNfiQKl9ABY0dD53p4gbmLPR6i72hH4FuOoWfvt1dIibBy3Xej/W93FPwuT9+McqFi1m
         ABv7/DW1d7uscKFm8PdFav5hsDgtMXDoST60H/KyLReEhPRAYAxQVPhJlI4P5it/R6yg
         LxGfw2zdz40Q9wAroz0YcZJXpFA8legDfoAkWz5dEmTyHI26QPV9BjElgEs1vKOkj633
         INqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBU8UZ0/2W/4j9sald28nqKMVbSGs/aVHPdD2YEgQMQWmbNgcaW4/Sdjt56Moi0qmcDJY2/JqJsAZKmcs=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ1DBEw+Hy/4nk8925ym6Y/lAB6UeF+1PHhz4H3aFLOdGYL3gB
	yNGrkRdK0vLI3JYRdMpYVjNd5rEydEfVdfQXswtLhXensNcpoudWpofJzLpMdH9y1kE5L+nK/ur
	2CsDmXF2xOkBBtSymJcOh23UVvIhdaco=
X-Gm-Gg: AYBFou3KvyP4/rDS+knDsiLquf5EXnV5xr97vOWZAoeAghoKx3jJ1MvSwnPgX+K9Yw+
	IlAK+/jsZ61QpTcyZuXpgKksjBbdISY+X68nKpWXgEWsf9UbeUiy92itoHzfqt4dxDPELJWu3ha
	l8/XZ48DAAJipq1QxnSthPBaV+jirR2OidtkiYvKb/W5VOkQ92LJ6TPSlBhF6JwX7KARxVoWgEF
	sWWWKOvzTUnLjjFnZ8R2Tt8TApXnHeiKUX49sz0JWUfV1byiT+0P5uc8xmHVrXwW/2W7UkQ8K6q
	jNtQqVm3yxs7Dn4/wLi2yx+ZXo6iA2IT19k9b/pxSTP4sk7nxVU2rxdN05zYI9gXcFBWQANPyt6
	dZNMwfGX2Mcs=
X-Received: by 2002:a05:600c:1f8b:b0:49d:797:83bf with SMTP id
 5b1f17b1804b1-49d07978531mr204052715e9.21.1788892025845; Tue, 08 Sep 2026
 11:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825135209.3135169-1-alex@ghiti.fr> <20260825135209.3135169-2-alex@ghiti.fr>
In-Reply-To: <20260825135209.3135169-2-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Sep 2026 11:26:54 -0700
X-Gm-Features: AcwNN1XWAUvG-23xtpJbnb_GPrsgTTZbDcBPWqZeCmut1kbtZYtODFU3-vLodh8
Message-ID: <CAKEwX=M0o3SRiX1bQmqQq3RMAUL7pAskjRgtmFXw5kWyu8Uerw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mm: swap: move LRU insertion out of the swap cache allocator
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kairui Song <ryncsn@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Wei Xu <weixugc@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Kunwu Chan <kunwu.chan@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 6:53=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> zswap writeback wants a swap cache folio it can free directly once
> writeback completes, i.e. one that is not on the LRU (folio_add_lru()
> stages the folio in a per-CPU batch that holds a reference until it is
> drained, which keeps remove_mapping() from freeing the folio on
> synchronous devices, and likely on asynchronous ones too).
>
> So defer the LRU addition to the callers of __swap_cache_alloc_folio(),
> no functional change intended.
>
> Suggested-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

LGTM.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
