Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622780;
	b=hpKsGMnCkbv57+Xb7OJM+dVL0FVXuEBKX+lhOF8ehdhBATNygErmr773vQLo+QrtMwNR
	 D2XARsBRtuqFZiiE3SdGoI72hopZ/FqNDF4TPL2DGf6aJFJqU4rEawe0za6oJgiu8FmH6
	 vf5y1SI7YHZ88VL9XCZlt3BMjMUuR9yDIjkEUOaBAudqlbP45ixfP1naoDjCOGfVWCP/n
	 pt7kgDs7dBX+KvehnPBCmMF3YH/h13UaPEv0M8CV6SH2Qq/MGJd0nyLBsA66oSymvNgdF
	 acKtKNHZHAgRwyCGovZn022IZva1axi0veZarTL5TRG//Y6Vn5ktxNCysIXOp3odS8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622780;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lu6jKVMmWomkYGOYdMnLmaub6He5lRxtqe+uzz2qc2Q=;
	b=gVbTdx90coEWtw4ygHHVsIUlhNvHV6hGezcOzq+XcHzsZeYl7gjf93qY9npKfMkEQrTL
	 0lN/Bc5dEKWxOxB8vySCXawQoetntfl140K1ng31f3mYh0Hr9nWhV2fC59saTHR+zTWkW
	 /2d94B1wi8RiWVeVd4xkLe8o98xMLeQT7bo9G1syGM6st1oU8hArkw1Fx1sPi0zN7RUpS
	 D1O675QtOeszjibEZ2Ny+fGi5Vnw8mq5IQeYFY/sWKrRpSringRtrKZ/0dzLYUyrN9LeY
	 vOduuC1lkkgp2yptQzCE/y5bAbrx7yQRCd4uipSJl7vtNmdqOkoZUBJFnts8bhijKxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B060A2613
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67B060A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1144253a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622779; x=1794227579;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lu6jKVMmWomkYGOYdMnLmaub6He5lRxtqe+uzz2qc2Q=;
        b=rgHnI1lo+gInLDiI+EC8wEvyQq/7xwQqKgEHu2grlImZlWJDICqOXTNfE2+qBrH7I9
         xjAFh5VPTBxt5T/BhT3fUMfsxoBeWKTyY8fKaEQKAx2EwPcEQ1I3YxTGsfeBdadpfULb
         mUB+tmAwFAybCgCn8vTNAVWdhG7wVobGLQwZlYo7yE4qZrvr8MZpeWusrcWJKH9ae4d8
         wdg570TqsNdlQJ2N9OyX5uI+2NLqvpQwkQ6L2AmAGVp2B6ydBSuSSqA/0PhssQAx0vGx
         AluBUfeNyzy4Rh4upSUEiQeaYr9HF1djLsDLZf/8hhVkRyc1y16wNVPd7LTlT9HIBJLP
         4ncg==
X-Forwarded-Encrypted: i=1; AKwUvBwixcvv3IDLkCgSmCqRWolA0SqqHkdimq7BYljMTSrIiVf/4vlnUW0oQM/VLOoyNCO6r0/YZRhcqmPxG1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k/i2be12V5qRBzt/KyjyMe4NZakAgpOECbwwp03rhbSH6UtID
	fqPAv9dZRflYKaUbR9NGFk4+GmjcSswUDeBidCYRbh/Nw+7BuFZGp6BqtKqmHEp/oPnl
X-Gm-Gg: AYBFou1uF+1pIPfL0Mv0VELTY42Hu9KHKWVNwScrAxDtrLK/qHxu63vDwipkBnNJqQ6
	AYwnPiCdSd9k+Ci4YUxSKe5jgP3xE+d7yGQPOhEiUKutyaL7d1kmHTdEgIm6FtuTZmn6hlPAwFT
	xcPFPQDNSUjC98czjLiCKkDCLbzWhnR2k1mUbMYiMjyjDk1PHXtQBrzCGqPFPPzEckxaHmA47c8
	m7mpvBGVIpsXPzjTAnzVGnVXLqOhGnGXUuIfuI89ppnnG9DYDySt3JMG+7lLn4AHB794cnDHFeZ
	qPSEU54S3pGt46VL5driY6A+YUpgcDbGfk6a1ZuwO2So/JHBruwuiP3EvehKkXf8e3dXqX70Enn
	RPmB4tOoIFF2GT5v8wuJGEApd/3siIZqgcceDQJcQDVroC0LeyBLkKXYS+v2QwfMIbIkp2lV8xm
	99yhylaO0j1JjYzXmBoEYx7q22ZteBND9Olv/orMoDiBkbhaemiDn39AEAu/k8ClZasTERUuVVJ
	DrKanKXYBUc7KA1HKvlegu5Da/hU5tP7yACn+MbeCCP4Pekxn7+lI8LvZfO12MlI6NeTFjdNMBm
	MZCEVEB1TCxHYPpHfI220R1XwXZg+vlasPZX1B+C3w31Jk4mLHHjLBep/EV7YpUnnQIjft6d73z
	eXmSw8oiKBjRSHoJpgWZPge1Mwk4YEuCBy9SdRlk=
X-Received: by 2002:a17:903:2ec3:b0:2ea:7180:3aba with SMTP id d9443c01a7336-2eb364614b8mr88398755ad.39.1793622778961;
        Mon, 02 Nov 2026 04:32:58 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm27101845ad.32.2026.11.02.04.32.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2026 04:32:58 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Richard Cheng <icheng@nvidia.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 2/2] cxl/edac: Mask DPA flags in the event record cache key
Date: Mon, 02 Nov 2026 21:32:39 +0900
Message-ID: <20261102123233.74598-r2-ai@linux.com>
In-Reply-To: <auhH_eBMYqFznZlM@MWDK4CY14F>
References: <20261101013418.87326-1-ai@linux.com>
 <20261101013418.87326-3-ai@linux.com> <auhH_eBMYqFznZlM@MWDK4CY14F>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Richard,

On Mon, Nov 02, 2026 at 04:30:57PM +0800, Richard Cheng wrote:
> Maybe something like the following to follow the pattern of rb_parent
> hiding the packed address and metadata encoding ?
>
> ```
> #define CXL_EVENT_DPA(hdr) \
>     (le64_to_cpu((hdr)->phys_addr) & CXL_DPA_MASK)
> ```
>
> Or at least make it static inline.

I'd like to keep it a function so the argument stays type checked, as
coding-style.rst prefers for function-like macros. I'll make both
helpers static inline, which is what v4 does.

cxl_event_trace_record() in mbox.c open-codes the same mask. If a shared
helper next to CXL_DPA_MASK in trace.h is wanted, I can do that as a
separate cleanup so this fix stays small for stable.

Thanks again for the review,
Jongwon
