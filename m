Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793364730;
	b=iGmnHtFZ40jvpd9xpWOlcfBQhr3FvTzEiAz1VBInM0A5pfNx+THZ4eD9pt6ksV6m2iRG
	 nxCb8U5C9EJP0cqYDf96V8314e4SvSGfvdPuXcxr/FfjPl+nCTOqTqJZbfJaJYYEmW2Eu
	 jL/yw/DbrEwiQyCuf0RgBIinhJLfwYH0033qj6mUib0w9Ym8k6CxbX9RU9VHjhtIkwUd1
	 5ufGIY5S5EWTkzXddcFPgNAtgj4DPg+edo95nAZIkVsOPPFlgsIdhlFktGNJytL33S5gu
	 Oe9XgqhrZoZ46noq/NkzjOX9/F+7OAoMLV2uRbFbkdNFYIttp30Iq+HUqLGBdpI8Oew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SV+UOXWZyic3g4Zz1/RbKyZgaKJw7q21Zg/+CpfqSlc=;
	b=o5cMoT0N9I8DjWcCHPCXlnKXTpfC59B3E+RZk0vbGdCwkCQPaf09zMm4fbjo/C42pO7E
	 EUPYTaJFxiw1mHdubtzBT8s8sJs+Oa9LkGd6/Eyl2fRmlX7XMnfv/8M9R40VMGN4ULg9n
	 EWkd3l9/cH58mNXx4llwoGnvhAa5Ryr+wnGnBUL7IVnSO3Bp7GmFLYd+7ysV9PuR454Jq
	 +zPOjv+ZkFljmgIqcJsOyT4CYz/WOLPvEesMtxGR/rpv0DBD/QYjneLZje3Sn5BqSRblN
	 /9I03b54a3X2y6jjFlgEZvv+1M/6sZW/Btdu+4xmz8PAAEVujxDi/bBZo1La2RMvA2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=7wfJXyr6;
	arc=fail smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E07606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E07606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=7wfJXyr6
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67999045530so574798d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364729; cv=none;
        d=google.com; s=arc-20260327;
        b=O54NBWWssKN9y25MmhvJL0tUDtZHGI2YjSm1DWn1pH6JqXhJXQSmMPQLJfOKn13ITk
         7Hj+4YcP+xv938N6LnSbG6hYZy0341E9N/2RHBLl+65hVYAuQ2FTpCUmpXwguEOsooK3
         2kF1lcREiH8dFJyEJTgyjAAlI0Go0KFRlgyF7e0CNdaLVDWYykdsIsNd5JYEAKA0z97f
         /oHTDRcTM/YQw7URTFfcjogiGpt+9KV6NNdEjOsxRde1+/dwgsfmssILQX7g51Ai7A7b
         QFXv7D1QCY7Er0SD53liXsQUEO0PWPunZ0FFmax6U6QWIE78KtpeaWMDtmuZI0HO2Y17
         VJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SV+UOXWZyic3g4Zz1/RbKyZgaKJw7q21Zg/+CpfqSlc=;
        fh=3/5ftYHmxzbhAISwGrqra4mPaeviH5O8QTjFlaszODE=;
        b=kE+v8b5g8rBXeAyhCnWpnhOhfThC7XNOdL5tIIJfoPu55UMJJgAuAfalTJEs4VdwVv
         NgS+lSsD9dddRsk7SEyuTJd8H3zEsU1zoncq7Nl4RNrBz8rkBM2gCscUdfnhvhAEDdUk
         AkA5vMsTnLtjxn1v6ok9GLyj4eOqvE4HNxEWJFoj4knRKl6kDvkUBrYOfPfOcbJYbeGj
         mcPv+TKh1sB/7/saVMXCTxy0dwoR9CcQDKN+xu76691bx1/nDV5HcdJLERk7+VuV1six
         wUUCt71HwPAA3C8RWsJQufRSsJgTkH/5BhAnEKn5QWrYMF9rc3d0vHbr3mCYWVItNWM3
         CX5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793364729; x=1793969529; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SV+UOXWZyic3g4Zz1/RbKyZgaKJw7q21Zg/+CpfqSlc=;
        b=7wfJXyr6zyu7hW2hUoOVtuqgV172eKW1mLfdsIgZ74/wDM8NU1wvxGBi+RIQAtrDBa
         VolZHYjt/3ltevho/EFRgVROR2ZzyMDPrcUWL8y19RlM3DtE3f/PlhA23vQF6JGIwRLN
         69C02cAlBwo7OUmzlQb9/6s2xrKKAWine9TSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364729; x=1793969529;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SV+UOXWZyic3g4Zz1/RbKyZgaKJw7q21Zg/+CpfqSlc=;
        b=2RvxjuNfplyx+G59+IsZqTpeVqb/ABjifOBn23cpGF3Cx8kZ4JrBcJzuhTT70+laMr
         cc5iavIog7EOgbCuTRxDCfo7zo4rhV13ZUZjftRnosu0Z5+0S+uBl6nftrM4qH5EtS5s
         1vsEbj08bwl0WFVvk09383ozGzSjyRDFyJ7Q56WIpvz7d+Yj3gJLHfxeAV3/gJfN9Cvd
         fnlNjDAW58b0XNgRcqZljnfnf96SXmGUI8KQC/R1jcU2kE1PBWkT7UWhb5RIHjwRzHi2
         DFuN8F0bxTEC7CuU0DiXjjze7Oo7K93GuY3qvLFL5i6rd9LSJGmwOhDLIY5i4oq0wc0/
         9rTw==
X-Forwarded-Encrypted: i=1; AKwUvByRx/afeKHDzAcgfj7Vl2qX67Cwar3lckabelURJLC35iDFmo35XHsTMSugIRpT3KHqVrMdZxJLZ0/iY+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAdFHX7ugc6/ZvTPUzZP+4f8fdn93Gf+qLuar9ktIn0zCJneIL
	TPekaPyXY+pcQprf4GonarN/IZcEsHzZ2CVa2yYHY6/Cb7PBG9OTA1HbvNdF5RaCdsE9L6Y3ypD
	xVbRu5wya9nukWdvpBC9sSCUJqVdgKI11LBtDWQqYQg==
X-Gm-Gg: AYBFou10kR7QW9R868MTcHDEO0rMgpsi1g0AwzoI7XP1wQpaw5pPfdwmMsV1KVauM5B
	bTDgSi41CTADV6TSqk9uCtUthDMbGab7eXA+ab05HyeuBC4nApht1NuSeuQR2yiDv87mQtBUYJO
	v3Lqxl9BfGED8oaI+tVbi/6ulYfU8xYUBsmEtwR+N2mKmp+QlbEN/g9zIXlaig6teyPZuvxVBGw
	8pn8s8oFtrBb4gAdL+sjts6NAIUlskIKK4OljI3zELS9smCZHpwdPSH9anz755LtmfElqTK8Igi
	CL/GbeibUl8I4pijA+JpdEjNBNRb9wGBFWA+g7y23uoVf0T+Ej9iZUyxpJb1+FFNpPNsqWgvDbJ
	O7Dg4QG4h4aACuXOqtyVlaLTUtVwHSePbNZT8YztTaeLPgqvaeFYSD1D0FKVbvxBdZF/A1Q==
X-Received: by 2002:a05:690e:4889:20b0:679:9715:a90d with SMTP id
 956f58d0204a3-67ba4f399e1mr940647d50.59.1793364728799; Fri, 30 Oct 2026
 05:52:08 -0700 (PDT)
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
 <20261027231513.816148-7-irogers@google.com>
In-Reply-To: <20261027231513.816148-7-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 05:51:52 -0700
X-Gm-Features: AclHuK9Oin0NgRVLru_2E_rA0Uqfkpc2FpHOTL7MFA2Wpm_mEuBLadLahOty7wY
Message-ID: <CA+w=M=RE-jiPc7=OQ6N1_51RL5TDWxC+PcXWwQ91djGxF-4OHQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] perf annotate: Move struct annotation to a
 hashmap and remove symbol_conf.priv_size
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> +static size_t sym_ptr_hash(long key, void *ctx __maybe_unused)
> +{
> + return hash_bits((size_t)key, 16);
> +}

hashmap.h hashes the callback result again with
hash_bits(h, cap_bits), which seems to leave this function with only
64K possible results. If the map grows beyond that, I think the
extra buckets cannot help and the chains just get longer. Would it be
better to return the key here and let hashmap.h do the hashing? Patch
05/18 appears to have the same issue for the db-export ids.

This seems worth avoiding for the annotation map in particular. After
the first annotation access for a symbol, symbol__annotation() is a
read-locked hashmap lookup on the per-sample path in perf top and TUI
perf report. Before this it was pointer arithmetic.

> + notes = zalloc(sizeof(*notes));
> [...]
> + annotation__init(notes);
> + if (hashmap__add(annotations, (long)sym, notes) < 0) {

One smaller thing: symbol__annotation() is now a get-or-create
operation, but some callers only want to inspect existing annotation
data. Those calls allocate a hashmap entry and set the annotated flag
even when there is no annotation data to use. In patch 15/18 that flag
also makes symbols__shrink() retain the symbol.

Could the read-only callers use a non-creating lookup instead?

> + } else if (hashmap__find(annotations, (long)sym, &val)) {
> + notes = (struct annotation *)val;
> + up_write(annotations_lock());
> + return notes;
> + }

The write path returns an existing entry without setting the annotated
flag. I don't see how the entry and flag can get out of sync with the
current locking, so this may only be a defensive concern. If they ever
do diverge, though, symbol__delete() would skip removing the entry.

Thanks,
Alireza
