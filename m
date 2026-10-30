Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793366843;
	b=aQoesOueny12spNXguxVTbFEvRTRi6LsNNiSrVY8y7Giatha3v5uWn7vv3MSnOMgjxId
	 UiPGBpNSiSyt7MlKRpw3m1988xMgHKdcfNogz3J16y+2MaSG9nOpx02pIXuqsuGDQw/06
	 Aua/zVVD47syEoRaOCcsSFi3sBhTB61UjBCyrkXdVzhGSsitYIOEkJ8ZsqTqmdLiGpaK0
	 fWdt+2OCc292P8pdSoqR1satNpwTybPzhb7wOrrS63temv5ZKtDNFAbnPaqpmSeUqUEuo
	 C41qf9SAsqapfOpt1jB1CHKkdjBRs6SYcymILKPirTPqGsx3CnVmKzEMu3vZa+sUQqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GrU8j6+xqAC4pU3BEEl6Hoz9aLelwf3and71b4BEia8=;
	b=Jjw770qqs+f5yLLNH853djTRnuHkeOZpwfuopgvfivGfTXapLUrIdmwhC0elR+Hta01V
	 j5zlDnuYAZ24uejDEWIPud1x3nHrMzN6z7LZCHBrW2VD+r6o0dvlAetuJUrAAldSYbtw1
	 D0lht2JVH1U9+e5yivdlqxWk9EImUPSdXCFxF7izMLCJgp2WLfcT1VFW4b8ek7V/tn6tt
	 e31hy+guaNqrA+3eMvU/QDxS4fSRx5h9Bv0o2t2hrE21kf/xGoHzB6toq+KmqonB8lOxr
	 IpWzUkcvw1ad4FeXKtEaj/DK+7x3QgJdPMpBAH3qW75rKuYhFbOte0aT7Xr5YZLDPfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=mfLwJIw1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E083606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E083606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=mfLwJIw1
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-675617e81f9so599330d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793366842; cv=none;
        d=google.com; s=arc-20260327;
        b=W8K3J2HB5VlFwMESIBF+YbjXnZnY5WppxmY40i40nZTrPXy4PId93KQPYPCve+IwvW
         okuFNhPpBw0UvDpU/MAkwq54o8oXi2pg5MixC6sMphe43upTAj22ql3rSKLm7m9GWPh1
         CZ9WGwZUq9S8PtUgCS5w9yhdPpFXMgnsw5Sbq1FIYFonfptkUxFHA8fXrW9hX4l13Ax7
         x5niVch3yFZ+cVz41dMBn7ZIUqFqNRSRVwgmxzlKZSZvlO+B/nFtHzGdGlFjNDaNc0Kc
         HpPiKcta0m1v+zngI9U+wUzhwN00lSKaD/Es/NByOxzc55XE1yiasbRqQ/JuiN4IpQEf
         Vybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GrU8j6+xqAC4pU3BEEl6Hoz9aLelwf3and71b4BEia8=;
        fh=8sEAOQoKFdwFJcMKuHXsG8TkbYCFY0cNT+trweEdmFA=;
        b=gR+AeqWaUYBJYubsTh0kperSjJqS6dZC9ju3h+IagduZthei9KABhAPllQpW+K9arj
         F9eDiB2BZJyxP2PMmDVmvqNYJAyRE41TEpX0OmrF37PWnDkJq2N2BLCLCtuaPmuI8H3S
         o6EJtKrwLnskverGtE87fzTfEReamzfpeiBVSOSFpNWzGb27nTo4tDz/C07KFOPdB+TE
         +oINIFjHinJIpfY5F4Jsz1OTxVmDPzZI8U4kVWRlm/9PXGQhtJ4CAW8++YkXjJejNoEe
         tzC0W/sI3iRyM3qyG+ApAxr8YLA1cYzxZWndkFtmGVohUhNFYZcp+and19hvX2FN/bQH
         0+6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793366842; x=1793971642; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrU8j6+xqAC4pU3BEEl6Hoz9aLelwf3and71b4BEia8=;
        b=mfLwJIw1WpoVDb7Qm/CEWyb7MKOANOTDSwnFWF4HyHAM6OB/TrZbwsHLsEwln9qScx
         /cqdI0uqOP1QP8Ce91i/MoOMZZOYPmGWBnckYr/STHq1plF6JKbUn/EyPZIDN3LTC8Mn
         Hj2a7Q1UxcuoGCyMRMXx2H1LHbhKB1rC/RmzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366842; x=1793971642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GrU8j6+xqAC4pU3BEEl6Hoz9aLelwf3and71b4BEia8=;
        b=TfHt+wp1HTZKtl6UYC5kDwfi75QefE+9zdlUUoWy/5xB4ITLYoV16d8/9uoIBOzoIZ
         nBXvK40KWanyjYk6IlvR45nukI7kzeV1C/BPuLCpfrNHcFqMzmAQcJwmwF6MhGnZQKJu
         9e2KftZUVYWdgoWlMBY1GQlbkHjfONmjTCfi0BmRvHr35jCP7w67AkA4yRvQoc2spNJ1
         uVohZtOiQK6kg3wknm2KytEuVO4+/OEx9i4pWo0/sLLDwiikJyYeQR0e5wGbJcklFKN3
         No7gPSvgQSBMc9DknYYBIpaPXj6gBYucStUZ+PoehyBwXiffpSW++WWGc92yNQtLccFv
         uAog==
X-Forwarded-Encrypted: i=1; AKwUvByfoO3SWLPkgMiNOfXF8OnKAbJG6n+woBUF5SY5D1MfUNKxwQKZw2aX293sm0Iwx178Ncx+KMV97P83J5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFHBrkVg2Qa3pQNmaMZ2CltqeFy7TLsehty+zPuz559UmJNgZd
	mJqtFycy6yE6ojoVyiwqs3dLwzGfPmi1fKhJmLM5wUp4g4+kYRCqpeWCW1569WE5OAuO4M47XGE
	Jl+OY8tyTx76W28y+ju95OeTQyUhWeFJMeT3iK0c30A==
X-Gm-Gg: AYBFou2dsST0hJimYitoYNEk9HkDHuaunrkzcuLjAWgHrTqRc2pBTY7MdkhTHWYRtqo
	TyThhNMCfUe4soYK2upaeUXHi1xVBw6dmpDLvbgUpfAxNF8DKOtjNgnbv5o6V5MPovxlGgu7/Xv
	ZXKCvzW4ouVDZZRtbuk2fLOidrO4hoR180NWwnAZ5Dt99s/MYMS9uv7keScW0brLahYHCw5xVH/
	DGf1t6KFqvbXycl9SLf2d1uzaLrJ6X68qajSgh0cq4d7kd5jgndXOBoeDU9TpdAB9qy/pAKIBgP
	LXATioEC1ZRYOhpJBq+bTkkMMe60TRd2PdJDLoajxiMeI88dcDvEdjNQur3tq1bfX7W/PoZBtUB
	NJd/+o6gGrzFt1rWMApOqdRy+QOkoQUZo53qZ1Mzo9TxDZoSTfLogdY6mwM0e4eIjwWdD4w==
X-Received: by 2002:a05:690e:190c:b0:679:b274:89a8 with SMTP id
 956f58d0204a3-67ba4e96537mr1905585d50.27.1793366841600; Fri, 30 Oct 2026
 06:27:21 -0700 (PDT)
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
 <20261027231513.816148-10-irogers@google.com>
In-Reply-To: <20261027231513.816148-10-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:27:04 -0700
X-Gm-Features: AclHuK9AYFKStnkTEp2YfN7bivnd5v_IjGJ3saQ2MjsqZIP8Gnf-VOrvu0UpqnM
Message-ID: <CA+w=M=Ruwq+GceFWMb6ig7mtqtxyRogS_UYbC0Kn3jS_oM6oqg@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] perf symbol: Optimize symbol sorting with
 natural-run merge sort and binary insertion
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> + for (unsigned int k = i - 1; k > 0; k--) {
> + struct symbol *same = symbols->symbols[k - 1];
>
> + if (symbol__start(same) != symbol__start(prev) ||
> + symbol__end(same) != symbol__start(same))
> + break;
> + symbol__set_end(same, symbol__end(prev));
> + }

This changes which kallsyms alias survives. Every kallsyms symbol
starts with zero size. Before, only the last alias at an address got
an end, so symbols__fixup_duplicate() always kept that one. With this
loop every alias gets the same end, and choose_best_symbol() falls
through to its underscore and name-length rules. On x86_64, perf
record -e cpu-clock -g of a getuid/getpid loop, before and after:

0.20% [k] __x64_sys_getuid
0.20% [k] __ia32_sys_getuid

2.87% [k] __memset
2.87% [k] memset

This host has 79 kernel text addresses with more than one name. The
losing alias is deleted, so looking up __x64_sys_getuid by name fails
too. If the change is intended, it needs its own patch and a test with
alias groups. Otherwise, keeping the old "last alias wins" result would
avoid it.

Separately, __symbols__insert_sorted() shifts the tail with memmove(),
so n out-of-order inserts cost O(n^2). In a benchmark of this code,
300k random inserts took 3.4 s, where the rb-tree was O(log n) per
insert. db-export with many unique unresolved addresses would hit
that.

Thanks,
Alireza
