Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335804;
	b=k+qPFCsNfunl8qagT+ePBp9LpXtrOqTKtedB0ygsp2VrOaiGsM2QfuBw3qzfkKg+qoHI
	 F1MBr3gcc9zexwk2cfv9KlCE2v3pQgWtD/bamPUl70DCYlCzPnybh1LVxDn+RofKTUBrs
	 X1xaWAb0vm1mWQhYMu/ftfdXfhYRvTnYvCWyBLB9vVAEp4TnCM0iui3X/VaRnRPMEA/IL
	 RPG47LhnFbJthDr+XgB6jCiL6R0OFwOYa4gJdZDAukHzKpuZd4i7hClEFfPwJ2VunUhEj
	 +6JR8eqUuJZhx8HDz9jRu7jgZSkyz+WD1yfJ/kPUnmUkz1Lidt58Ih4H3CSPrB/mCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nq8v7VJ5VqpFS97EP72RtDwjUZHtXRoVpvPyoM9R8Ys=;
	b=AJ2E6hBNOM5VOFOBV72LP4XfewZGP6xehC+Xf85oqxy7Osd9SvjTQQrKSIJzKAod22DP
	 JmMj8Zlc/k3VQccSo21tUjdfLnp3WadCNJ1LriPcTi+tonLvB2KzipVdKyDP1WOfo7iEK
	 UAxDil+2Bs/qSbp0hLq8MIgZMIlalF2JeQgfXU1Itf6ZmUHsy5uv9PkN2m4R2IhIpIEcR
	 evunBCANtcSl8FHHi+4phzhgpubfWc2okVPvazUBdN8sARSr3XT4mYtyBz2WSffOiHcI3
	 B82BPMyCZLNaUznjXEnx/l0SbC7MT1nu7M2bOYTS/H6hM1DUMgw06SdV5GvHFFREx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mfEd/YJ9";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AE606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mfEd/YJ9
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed3f563739so4385ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794335803; x=1794940603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nq8v7VJ5VqpFS97EP72RtDwjUZHtXRoVpvPyoM9R8Ys=;
        b=mfEd/YJ9LQD1MZMqGZ2wZBI6gqwjAUFPg+du9duIbyrgF76IEg8Fg18WL42GoVD3X6
         T6JPOKxGNXfZMgysXHYFPgOAhagTGknB3RhTEiazFzlja93znJY20lBLCw4qZmI1Q+mO
         yCV821AStoADY9CiXn62Gu1Po36veC3q5hBxe5UycKKLLj3bC3DhnvFfvK+0iKagTxfd
         ET6AO4kcast6roTwa6F2FwSv/wkNuAnTmjBqePosjc9Sb0hoRZnUlRCbv6Li5/vy4Rx7
         AvZ63le228l/HnUo2770nZsrtsOT01Dzi5QiKJFFfhumVh79jzjeR8XRu/wjtslUmwel
         Uj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335803; x=1794940603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nq8v7VJ5VqpFS97EP72RtDwjUZHtXRoVpvPyoM9R8Ys=;
        b=1zMDk5ve5iUN6KsTrU4EhBSXtLsHjOQLajsjhExpuZmwXjtxUxTSPnq8u8FKPvW5lO
         DsljOiz9TLiguGDQlK+I5qyff8PaoUEzmL3FEJY5iDWEUS7jZvCWiqw8JbUJ5tEAhNuK
         xG0zakBAIaJ8io01WW0F25Z8uKGPEw14CFm1TPF7gFV0DW9d85Zy9oLBCfEuLt0kLFHk
         AEYN/65bUX8PADQfKO5KekQ2a1QQn581TAad5bHw4QOfLUOpNXvcg3J/F6t6+hhgIDr+
         yAzqh4RQgA4KAo0TwH13ESRlhkWT6ovJrMLF2jLHgvP6+TlM4fQHKWQPDXPq5vmolFBt
         5dRA==
X-Forwarded-Encrypted: i=1; AL+hErG1+/SS51IU9/bwTX16F7uldRbXV2x1deVCSzMagAGebXMOiYrsLnO7HBk/fadAh2kwJa1UluexzwOmJWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YJBfipYqi7aThigllJPK6N6/DDSDJ2+C8IQ/0pHe9ziEC7VrH
	Atzd/sYg+t0s/fXCDae37GhVN7WJQjUs4gY00kLr4vdLLdsW3sRSNmMvbEAGmMxHVQ==
X-Gm-Gg: AYBFou2Os+UUewkUsBa2ayRhsjqKUwlcbMccnan9yCDXBGDSmZC+ZO7LBdjQUM4XipS
	jY2ShuK0L4kC+T8VGtHKMiyNInTLvd44RJiFDoZxyaF2t74p/a3Hw8QS9P1ctnlTZ7pumDUhvLC
	qKYUWPCsFYWgej15pm8INsHmBU6odaSyiGOuYFMv+W4/L1vVtWXiYjt8jCslvba1X/DIIhOZCjz
	3wC5TUk7meY5RTZSmXgugQdQIh+0Tr4xZ4tTI/lDvLs7gopzdAd+IUCXjZnwN3+wG/Ff9Tzf+JH
	OOntcbkictmpHkNK9bhYoKbUJFl5XcxOJ09T+dMNw4DXID3xA5rBHBQzXfeuEq/MXWK29x61zqJ
	56QXpG0EKS4Ws6AX6bB+PJKXpWjuzv33iwPsfN6VrdbJObkOY2SPdXJw813mZrSFB6EHr97wSnC
	KMBLP6mqKwO4AOAxzSGv080FpF4ePTHsBvkU6CCIVo7AJDLYtBf9sLjqeOggLw1dwXX0Vd3Vvjs
	BH0UMZAkvsN7MRyOoWlFnPoCI3k+aEVEi1U+I8WZc1nFSA6zPKNMx1nLqALfgem+2HwIfa+4Nou
	6teMvzu61ALoO76DOUczfSPQCDpqpSqnlIhciQpTODh/T1QAuLhLSTmCUGSkkm+7Wkl6kPwzPjg
	koD1zWxY8NfqxpTs1FE6PtoXwUCs7BD86bHX5vq5eNqk=
X-Received: by 2002:a17:902:ef50:b0:2e5:9bdf:6b65 with SMTP id d9443c01a7336-2edd6b65b7fmr241375ad.0.1794335802929;
        Tue, 10 Nov 2026 10:36:42 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf46sm12827355ad.31.2026.11.10.10.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:36:42 -0800 (PST)
Date: Tue, 10 Nov 2026 18:36:39 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] mm/memfd_luo: keep memfd frozen until finish
Message-ID: <avNkLp6z8MUdjgRc@google.com>
References: <20261110175855.2437084-1-pratyush@kernel.org>
 <20261110175855.2437084-3-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261110175855.2437084-3-pratyush@kernel.org>

On Tue, Nov 10, 2026 at 06:58:53PM +0100, Pratyush Yadav wrote:
>From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>
>After a memfd is retrieved, it immediately goes back into "normal"
>operation. The file comes back unfrozen, and its pages can migrate, it
>can be truncated, and so on. If the memfd is depended on by something,
>like iommufd, that can open a window for folios to move around before
>the consumer can re-establish its references.
>
>Finish is the conceptual point when a retrieved file can start to behave
>as "normal". So take an extra reference on the folios and freeze the
>memfd on retrieve until finish.
>
>Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>---
> mm/memfd_luo.c | 87 +++++++++++++++++++++++++++++++++++++++-----------
> 1 file changed, 68 insertions(+), 19 deletions(-)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
