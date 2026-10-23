Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783987;
	b=x8mWvk+vxvBmQKPNClZARd8ruD4aidNUMVIn/sOStpPvmolqoGq4tumcGs2hJutHekBL
	 dfz5agTgHu5LxNxtgNQrHCjWmfZWiDvT/FB5V/D9/iLM6oDA9GmVO5cAYaFdAkPgA6myq
	 JW/gq9rAMyCX1n9tzrhhIKF7NNTKwsYDcTwln+IkjlP4jbgODwrDUJdpLc56PO7igsWOA
	 ALJPWQ01cTn7f25B/IXi88IMb3lViJcI3N7ggjxJKcqbL11LG8VO24CCUTIS8Tc63om1e
	 LwyGQIvIJitDRdAGdazICUxnJUgIoXdq4rJjlSVUDcn14gUBmYdPZ6HIEmVSYRlFRzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=0ra4PwUN4j1XDh0rJxY9+VVsmhyDYrSXY972fJf+hOU=;
	b=MDw9wZF1IJNxbgJpuEECPs/j3U+WTUiGRLI3IVo7tKRtTAL1aWmseLR1Nk/06kwS5awv
	 ukoEhzJA6jK/kvY8p3bcrqvKYqtS2BWvDGavg9rUoYBNwsxRIA/pyJLaozySn68271YYl
	 cmRlrYrTeK+UsIqCQmCbl7yw0leteU8T2QAaPlOERr/VKc0OfSNdeFZVde3YumW9is2to
	 StSMpFpbZypDJf82W46WDwGhpgBm1N7fkOMyorYKXZ01wLeMfUDeXDKkestu8Z/QS020u
	 g6y2dNFo8DT1TGeBW4fnlXCz5lS+188vNIx8mDyxfJrwrZvNy6hw98TL0tpqJMriqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=cBYc340P;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=cBYc340P
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-537548b811aso3599731cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792783985; x=1793388785; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ra4PwUN4j1XDh0rJxY9+VVsmhyDYrSXY972fJf+hOU=;
        b=cBYc340P0fvJdjnLygiXv/SUzYEJfy3u5sn7QUg1tQ0bhXw8u3iMzVAtVo7k1K8PrY
         SQhbJEKVFrgMY37L1QPxY+u+pFxBNtNw+oJ2GF7RBBeOMvysU3LgVdbaE0IbJ1+SRMzS
         uBHAYWKb73pLRHW5cTOocw6YxV4EFBJhk14JZ2qwrsTTMdS31LwHXI2fBEyPnXkPIJmY
         CLcMPZ9uFUcqM711pVjJf1ICh/kqke2g3o9u9LnsKSFDeKnkgQmf/zSkH05D4RemZQ3T
         QoYlhn44nekLimPTxIsgWmsRWV8VqOsF3/MznLTpmAuCSrgQ29dTZCBxDtGwC16+D5pU
         wV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783985; x=1793388785;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ra4PwUN4j1XDh0rJxY9+VVsmhyDYrSXY972fJf+hOU=;
        b=RComD/N6K5/x7PaZyNfQTEqonek+/q3T/qU3cLdtguIpPIM6l2Zu9F86fiS7SdR8Tw
         QRVg6tfRG1ril8X0eSYYf2C8PgtTATEjqA7dih2WQqTGEi4KfqtF87+30TCxAHw6S2T0
         YMXT/kW9iOi+xv58DtWW2hdOjOSUzeHvR4l4ZjeQ1CC4fGy0q2ff8HwOo8HnI0hsnxLm
         DfEOs0cjfGqIZEn7DeL5QjxyGNcBL6SrM9FW2uW+CzpnAYEIKp6WWDh3du8pI3vxwbsS
         Mvs/jfZuacuqWb1uLtI6bJQWCdnyhUW9Xxv6INvdIwCkL6AXjHfe5eMzJjZ2KpaZfHQn
         cKrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpm90MivWzfnENqODQgSq2Wm82CyZpyJn/EbFOEEnQqpuesf1DHR89kGwxyJs6weStkoVkEPls7Hezoj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKifiNYNVcif1xjCmmtPS5hz22H2Kw612KZQl/3RGXQ8/R/uLVR
	AyFIsPTCkjHuxcVVJT9WarTOoHA74PfcnJvFXUsRCoFO2UJqI52xHbzxoaaIUUqaCExtjDsn3q0
	pBX/L
X-Gm-Gg: AYBFou30DVUBkYm8JdF72Jg7aFKF+rTwH0XDui1piIt6keMVYFZq8vg3KI1E1tTpBmg
	R90HnqM9fzO/6xIcqNnsMhOR6FCaP8unl5QZUNUkpbLHl5nhVREVGqHbcg37/S3fNbtrNFaLqdC
	Z6iKucN2u0dByAbK4aJicXazvslnxbn5Q5KuK3EmQMZ1Zza1HeLUJdMs60+WIYFfE1KAXXwSSNF
	GExAaNYqSAhAnnC/Q6JUsAIQeEMy+OY9zYbc0l490a/1tDtMMCJuqI3TSy3mOeBq8gM2m+vWu7H
	g0qck50rGTv+xf4uWm0ipDOnL/LkSll5uqC9idKvptfWPztgFm7XN+xfpMZ4uJ/LgxBuDZxFaNb
	Qz10DburtsejabSAbZxwYPdMujhHhsEv6ALMus+rSN1vfA/v7D2K5PD8wpIoaqH0x/QQ04HZYVf
	tueTfJZ0Jhv67EhsT2zLyMK+g38vuy+utuSU4g3e0f8jz52f2M8YHhIN2QawAsSgEhXK1nYYVPY
	3bCca+9Ta6WUnUsj3wqxEuv17OQFgOocpavFweCl78V+l+x7hjWMoSf30dN5diqs+znXPv48bvI
	HikS0lT43tr30OHoPUZ/GUvHk/E=
X-Received: by 2002:a05:622a:5b97:b0:532:f0a2:ef4 with SMTP id d75a77b69052e-536c25f7a86mr44477151cf.26.1792783985368;
        Fri, 23 Oct 2026 12:33:05 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c38easm1748051cf.7.2026.10.23.12.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:33:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/mempolicy: remove unused mpol_is_preferred_many()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Gregory Price <gourry@gourry.net>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>
In-Reply-To: <20261023161003.59086-1-ekffu200098@gmail.com>
References: <20261023161003.59086-1-ekffu200098@gmail.com>
Date: Fri, 23 Oct 2026 15:33:03 -0400
Message-Id: <179278398385.3414657.5670535479884226120.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-24 01:10 +0900, Sang-Heon Jeon wrote:
> Since commit a492abe28bec ("mm: hugetlb: move mpol interpretation out of
> dequeue_hugetlb_folio_vma()"), mpol_is_preferred_many() has no callers.
> 
> So remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

looks good to me

Acked-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

