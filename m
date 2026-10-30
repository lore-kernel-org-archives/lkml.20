Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368535;
	b=GXYaj0P0aReFbWAXGvpABkFKVquv6o7PYuBsivQDWBsoi9255bSFTBWT2ADktoxAKHhu
	 3PnNjK5/lX+IQSGRhQrTYKlPaoCraHrFQ0QwhG7YIrCxnztG7rpQb3Nmm6b66stZJnBn/
	 i9cExHPZkyabi9p9afIiULR+u4LbpZhZjF0UvosXFYM66PmpAVVqS5rqq/aIPg9yHFBnI
	 jLdL1AAZsQrZptbTjL2/JuRDlJFESyQb/6NdMA6ycUHF23vmJalfsBmR6RXS9D8Ych4QT
	 mmrTLA4Lrt2rmBF8WYxLgiZGc3JKCCpFVXaH7ST9vqu8CXw8ePW3zfgjYrPCY9CIE1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dtvSC+Ou86by9mEh2D4NPgVOHJN4VrQWEhxe1Vpo7Eo=;
	b=wv11tmrGMk0/wBOGqB5i1lxF3TePosHBQ/FYkb0ejpGhOzK8HdzpLBPFh3h55i3yOA/d
	 c5TvnhR8pMPegfFSmfntiOJ6ZIwH7f0gCepxiVFw9dfFyDWRLgj0w5RVdKjZe+Hl1pWDP
	 5M8pOv5tMkPv/JeDeeC+VqHx3+W9ociPJ4CzVsAwie3SN8HjmZwiiOkISdg3EvgPQ2ynw
	 KlJq1GyUnimlCRLl9XI9OuX3GxinbuQ1WBAr1JrNMr68kpzH3T/Xcg/qBWEV/H+Y4xpAH
	 7S2bqE9VM1K3b21+LW4jjCOAW/Fd2RikPPhjw20cTIdsYEFkiOu4LhWSgTmsN4GZp0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=HTq6J8Yn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=HTq6J8Yn
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6798d4ab549so657005d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368534; cv=none;
        d=google.com; s=arc-20260327;
        b=QxIvvkogPg4Mkek1x3P6vlBT+P6iDiHhUc0tm9yKq3T6rQoBk6V/jmqkLoWvEbTbGd
         Fys98XAXOwHpy8oF8w6mYnBpAQhFeNA4Yugsqm2Ery47riCXROxLnBkGyV3x4b+LBYb0
         HJRZ6Dub837lfpCDJoKYnt5tIaDbZ8cebmi3eCZ7h7TIh6LqmgfVyNgQcild0IMKdEY8
         30hj8Ta5O4xPFItx0I0j4HiJAta71gI5qDmjmvR41HpHPz+JIk3R4k7rqvsa2heKsW/2
         n34N2MrfS8cNsFZhQIMvnr+WMcPQjoDEufr+pdMQLzEtKfa/x0NigvPW/KG5xll3bDsJ
         V6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dtvSC+Ou86by9mEh2D4NPgVOHJN4VrQWEhxe1Vpo7Eo=;
        fh=+1iHD1B1TqPNgqPgd3hK11ULmc9MSlfCZDKAY0pn5hU=;
        b=ay+08BGlOu4pXrp7PEdngxfysBILkMEpW4mwxFnetH/nqOWphRccj1qXu6QsSkrkvW
         Q8KQTGncM7Ly09bkUc+Mj1M6GgSV4QrEk1jGnCElTBM8VCwfLkUYvs76fg0cR4WQDD95
         XcJDbadUcwVqSn0KkIbUGYftEDn1NR12y3m8A4+63WGKE7hYobGYZRiDRbTC6FsHnCsS
         dxKb8+LYPjNSjS0grHSlnFZXyl+rpyukfVON/zyaqOekYvs/j7QpddGH6uysCKGDS8Gr
         pu+tvfL8tniUNCU+acuMQoNvu0ANDrIWfGZ/RsnN3iNw/YDL58y1AGnZb+OFG/XPkIfq
         BQiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793368534; x=1793973334; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtvSC+Ou86by9mEh2D4NPgVOHJN4VrQWEhxe1Vpo7Eo=;
        b=HTq6J8YnXw3xvmdibnTPCJR2Q7OYBdd0aaU08pAC+fJSm6T050J1q6VthBz+ieLF8T
         wG9FAaY4x8O5ECRsM+e8ykmRqZQ+3TabAyD43C6Hc46e7O4P/s7dM4rxQfMmVFlmRSwS
         9AuYDmWe6hLCsB83P4QLBv3o8M65TGcru8Iu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368534; x=1793973334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dtvSC+Ou86by9mEh2D4NPgVOHJN4VrQWEhxe1Vpo7Eo=;
        b=yjmJ1TMf0rwHUzbHnyUvcwq5RpZm3ub4YzgFaJNR9BcKGUIgkbFY5TDS4Mvd7S8Ejo
         wVdjjWUxlBQphZTKGZUfn6T9HMUly6Dr5Xqrx3YVAq72EfzTiKFtqCDOt5oTTXgbqQTu
         9YgWxgZNvrTSDFyMTbtb84Y8/xjfX06kTe3/t0FJuNVmuAGjOLiCzw8WFsarsJn9SqMa
         SJzz4pD5pUIg9T6/zpga2Q0B4GGnR+oN40IYKQSffvk78UbhfsbkBaDEltfL0C7KHtAG
         8VrhL47W7NzO4v4zegzAyKPzLdEMBDZbq5EspRLQizLSkNVauXjLd9/AP6hhn86j9SW8
         hcZg==
X-Forwarded-Encrypted: i=1; AKwUvBxudv+PZ+gaOczaytI3UWjHWTNaU8aAX2EPcWHnLjiiCxE0624Bre4OJRfi8lrrmwGUTZmAH9im2RF7kXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxmqf0Av611Uhh7sidKJv4Cbx+dYENgxlcVvxPpszYnznQ0c3u
	Xt624ov4ARi4999ZHy28+q1M4EAo0V8FoI4QCDfl++6ElL/SgKA+UOlCXMj/PzNlpu/JYe6o2t9
	lp7jdsSN0M3Vm+aYRnsKX8OXqy6uDuDvFSX5GVgJBRg==
X-Gm-Gg: AYBFou1ZAa0x8Wmo3GWX/SS+NnmEhrKW8xje8o0z5aJiW/4kXf+yPsDLop0FqXNmUJg
	WtG0QXTjDfwjP5G1fyPzDhDRcfWKxoJUPNORwpkYP12v15j686CYMMaJALI/Iu0LQ/MrSxuUvaI
	7quuyZZ1W850ULapmYdc6u92eeeNoH7q7QHv4WifjXC8WNRFnK2B1M2i1PEQP+FAUo+5rEykV84
	NdZk9+3g4VLplcwpgutHxnokT4JhnK8cqyJZIRsB+TV+uuw0U2GWBwCONW0CEzbzk2Axi+Xfp/x
	Z/I03ZE3TZNYE9Q90idAbpoD8uQiu+gVpBHf/QOD0D4lOjuIp5EHCRiqyTJqVq2VbhsZXwTy/sa
	fbLnXR0KYixunLnOuFc7aZpfihQErHpY/wPUyGg7ke6Iwy8wrwMhrA1IXUgJMiyHbLu0UEQ==
X-Received: by 2002:a05:690e:814:10b0:679:5ce3:b32 with SMTP id
 956f58d0204a3-67ba4c90a09mr1194821d50.5.1793368533419; Fri, 30 Oct 2026
 06:55:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-19-irogers@google.com>
In-Reply-To: <20261027231513.816148-19-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:55:16 -0700
X-Gm-Features: AclHuK9DrHFFdDSfKhPwaxq5H2pjidaEA0BUvDK6bP_W-cA5-k9M1Y8SIrY3tlY
Message-ID: <CA+w=M=Sja18zN1foZ4oP7AVyxMGjtNNaBaMOhVnT48wZofKR7Q@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] perf test symbols: Add tests for symbol
 shrinking and session alloc wrappers
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> + if (!dso__can_shrink_symbols(dso) || dso__kernel(dso))
> + return TEST_OK;

This passes without testing anything when the DSO can't be shrunk, for
example a perf binary without .symtab. TEST_SKIP would make that
visible.

No test makes an allocation fail, so the shrink-and-retry path in the
session wrappers, where 12/18 combines with the 15-17/18 plumbing,
never runs. Other gaps:

- a reload after the file is gone (15/18)
- a lookup from another thread during a reload
- kallsyms alias groups (09/18)
- the merge sort with many ties
- after a reload, only one symbol's identity is checked, not the count
or the order

Thanks,
Alireza
