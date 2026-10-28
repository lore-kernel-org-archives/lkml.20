Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188120;
	b=MZUm/BFAtx7ilMFGG/S3T5s9Ws2NewIsrA277nb03RgcChXyYBSU+orp6Uv0V+NarnJA
	 WpxGU11CkTQSLXpmp8OtaTo7JyJ2vvflNWYEdgn7uzWBgHNPwcMR9Pb7Px91FzKZ6DE9W
	 SiuLCezZsvvqQ5QK0X4ztdXrjd2gB5ti8+hk042OhB0Rlnz9BR5rH2hDf+4Ai2AzjGfRF
	 kVWkN42B5CVDNfSdKfoYZcbjlTfLliBm83wOYG8yb6HZKrQka2hxuDVylH5hw66c3OX/0
	 amBZYO2E5TZo1obLM5tlK+WvEZh0yStAouef8Wo6+jgI6Np4l9muZEAUZnywVgRewiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rz4LcTuIBFgFlzGCEXc77TsZGPHM5RG2DLR5yTjpqhU=;
	b=48rRgrC++IufBTrHDhnUKVYg1lZ9ZHPNGZMCWVD22JB3kZuXzo8zq19SDmBZF1gh9CW0
	 znUXLugz4unlEJbwgXmGFB3F4Pe3VkZI3JHA8P4yyIU0/578W4atxF/LnPvKzsEfRfUFP
	 4IInn7L/ZlOzhAXd9Hj36Ov9tuYeEQ7abwc6f+i1XUGHx0IhBT0mkztylIrlcS2xu/Xva
	 dRb3RGKlH4i1Mg1e8d7Dvj4M+zUqg4eoLs0rQkhD6QsmB6YO3ZOOa4maS4T6wPLQ89EmV
	 ZulEUz9gnArDl3S9M/ehv8kVMelLB/5YYHpbFqZ0IHC6qJNOc/2dB25ztTz8RVDyp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2gJuUjT;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED68606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED68606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2gJuUjT
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c46d41f6af3so117800966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793188118; x=1793792918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rz4LcTuIBFgFlzGCEXc77TsZGPHM5RG2DLR5yTjpqhU=;
        b=t2gJuUjTUxdmJHYfEwyOU8B9odZv+OBtRYQtfaOaEhdxugMehZJIRfZBR0+pT9Wrvx
         xJBKLZDCnCOzMPmLPeHeHjPe3cmNxwgHhYPUlFmG5LUkGvrF0BJf+S7zWD7s+vUwyYsO
         jVbvuwPg9mI/7ARATnaEOjZoxG3a6ET6UiocRkz6y+RGu80rQDoSDD7I3jio7s+69cWq
         GObddatvItFxd8KzhHGNeNdVQky8pl8nZlDbPkWIRtmnBO7FAUCCSiDG4M1N+sbmUQr/
         A0R/ECCrvbKz5OZwPKeIdc9/m5LezrS3Ahmg918cEPu4XQgwadVCHdsAjq0y7AcYTaKu
         QxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188118; x=1793792918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rz4LcTuIBFgFlzGCEXc77TsZGPHM5RG2DLR5yTjpqhU=;
        b=vpLV+fNo3lDGcdTDIiiC772s3iDGOG9SJTZBLBqZP3ukNYWE8PmFlqm0ZfDeQrVwgi
         ZLMDz9T6szbxDTvuoaMoOOzHml9N5vmhmhACZ7s4ORjhpieYLHE/fGxL+QzgaE6/20rk
         wbTT0d0H911SaCMhc6rShDJNdQgzw3caoinDKonVp0xFtZOrtgaYZ3oMfzQXXhYuMzKw
         eVBAuFaPCL/mQtyty9kY2Pybn4tPCT1IpRgiPSPvtp2UE/5PLtIzSuOBIm6VjpHyWqfz
         ZpW4IpidDBUJoyogke3rkfIXKCp2f27y5v772ow1CQCK4G3lxQWh8DiWa9iZMozlrnDu
         Dh2A==
X-Forwarded-Encrypted: i=1; AKwUvByAG/XLSfimH0UwINbR3BqS6uyxEyIBfTHV9wlOww1yGH/cn/CJoCCLqxJIFhRuSik+MmJcCj2dmXmg/x8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmV5xFwHDfOAQ1NjqCX9kbXp23wUrd32vmi0oQG37NB4vG6Pnw
	wDzKZs9k39Or2+cDbOuLKCVpl+PzG7AluSE2RENs+a5geKLU4BkYWJVi
X-Gm-Gg: AYBFou2qI7HLaWEBd+3cOVw03hTo2AbLSXGJl6g6noRYtAjVd+azbeRWZnH/nXOyz3u
	L6d3xSZulmlqCwK8pdfHbTyxn5+XBDg3i1gvZLX1eRBk61CLIP+E48niomy1Yohk4VNWS6inlAH
	RpFkU2oculQXWb+jNj7iOe6JYkARN5+hXpeA6zIzFnX8v0cnsiwxJHmpIgvS6vJv0fZ/w/92rJo
	yMzftf8rPGDils+OGR84mgu9r4FXToZD2moVzAlsrdGsU6A3NSyYJqJ5emDVIxRq96y3cEmU4dw
	pjNmoRLrrcLXPXZDLbQlHN566qRrdBLb5YLeAS+NgDh2+1gjiSdcj5TLa+d16gyDxjbYxiQr+IX
	aeWZUqNTLFRRhAEozAAY1ozCwxau1BjBsHJrz/Un3Dn0xkMc0bVeupuQFMij6PRQGqnS9MsAvSy
	d/dKLAfJVDqIOdTbP1OC/pN4dV5i15Anlt0buFR5scJNAA7hHt0RYjYgqcgmAkmGbWkLu1E4fmu
	/3z2YSedrLEKceNe7N+EGQhwtMzqy2BameTRTD17yOv38BNplEdA9HgpR260puD5appCVmg7Mr6
	IAV1Uub5ZRZbNDLNmWcOsf8=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c49be00bf6fmr159888566b.35.1793188117832;
        Wed, 28 Oct 2026 04:48:37 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:43::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496459f10sm1375962a12.36.2026.10.28.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:36 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org
Cc: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Andrew Preece <apreece@meta.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bnxt_en: Don't keep MSI-X vectors added before FW reserves them
Date: Wed, 28 Oct 2026 04:48:33 -0700
Message-ID: <20261028114833.239086-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179310474137.3134.4690740150964769309@kernel.org>
References: <179310474137.3134.4690740150964769309@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 12:39:01PM +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The fix is incomplete when FW grants fewer MSI-X vectors than
>   requested.

Agreed. bnxt_reserve_rings() grows to the irqs_required it computed
before the reservation, so a partial grant would still activate
entries that FW has not reserved. In v2 the allocation is sized from
bnxt_get_num_msix() after __bnxt_reserve_rings(), i.e. from the rings
actually kept. With no RoCE driver registered, that fits within what
FW granted, and it is never more than the old pre-reservation count.
With RoCE registered, __bnxt_reserve_rings() can still keep more L2
rings than a partial grant covers, because the ULP share isn't taken
out of resv_irqs. That accounting predates this patch and belongs with
the ring accounting work on net-next, so I've left it out of this fix.

> - [Medium] New error path leaves the state inconsistent.

Agreed. This path existed before for the bnxt_reserve_rings() grow,
but the patch makes it the main one. In v2, bnxt_reserve_rings() also
grows the vectors when no reservation is needed but bp->total_irqs is
below what the reserved rings need, so the next open recovers instead
of returning early. bnxt_change_msix() also clears irq_tbl[].vector
when it trims, so a stale virq can't be requested again.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the DCB IEEE
>   ETS path reaches bnxt_check_rings() and bnxt_change_msix() holding...

This race between the DCB path (RTNL only) and PCI error recovery
(netdev lock only) is real as far as I can tell. It predates this
patch, and the grow loop already has it. I'll leave the locking in
bnxt_dcbnl_ieee_setets() to Michael and Pavan rather than mix it into
this regression fix.

v2 follows.

pw-bot: cr
