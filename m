Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794633954;
	b=Y2hg3mloecDCY86jJYzUW638UA/nR15K4/XrXJn5xk3b2doxP12NIxaZLTjGKs1Sfkh+
	 pfHhEPIuke6WNizidtZi82WWlNIwYsp/vkk4oxSAmJ8IhTh7+thLZxPsOgdGBbRbrmjZD
	 vd7u25CiSJWf3xh6rHOGHvGD7G0T+GVo4nfsweEUAAfs4LfqbKHU0sNC1QRWcfgfW0chw
	 3V0h+oW1E3TxvBILYyuu7Na6EzpR78Y67UpEccTTg9HvijHSb8zBlBk7uNbL+rTYtLg7i
	 isfKAMOz7XzkYygMEzLxvJHwg4WE/Ol02IMReosxcXBqvc9ph5kX2oLFSCfip5953HA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oLPN0CJ8BvFmHWFTOBHnK/cJFGHdPvZYXnS75mvoNZg=;
	b=NGwl+2jqCbg6a3S0OOcW1xaZKI5203xmyaRA02x97h2GM7gxew4Zx4uAjW9vCd2MbWdD
	 DUrZg2TrCZ7YBfrsf05+YoYL1XM+HWtTBllklpi8g0TG+MGLv5dm+1j38uy8bSw3mUeZK
	 Sw1JV+nV5V8bkK3RA4i4Rvhkju6G/sArAJ8zWVEDw5xTMIHTY7vBqUzExaCZkTDsYjHQG
	 GxPkm/2MXpCIWSEIMErTeD9yZTT2ZvCYqtgtPxKKyowIZuwY+8tDtuskyvDr+4STnU3AM
	 gHNZ+jillvz63OnTcTSCwCQG5XMD4xa6d/lvgGW6IWiWXrKRyhrHiIE6Xm/xVBX6hBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=DmqQsH0e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07D606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB07D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=DmqQsH0e
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0d63f60bcso20032867b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794633952; cv=none;
        d=google.com; s=arc-20260327;
        b=tARMNNRoVCJJj0LIdNYXQJPMbMFPO+F9tTxxPRcJohwc9aELkfJWtyBaAuloEuIxEJ
         +oYZq3nNSZlekcBrdMNAfsBodTgtgKA3VYZMKKJkmFA5YskvLzlgxgmk2Z2M4UlukQba
         9rgu9CICw8UFc7VepGQR6Zd2xq9GtXcLP1AtQEy/ZO3WD99mqtHqFkX1tgEmt/Oj6jda
         68rMZvDmi4f2X4tjT2nZQYASU8vwdY7U2N6uyoCtyy1ZcGuM+JI6rrXsvDFdyQLevOKr
         BGZaysPF6zy7mVmkrgPHvw4QS2bh6zCDn8lVh292DgqeMThafWs6fPHU3mOaP04o98Lm
         +KrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oLPN0CJ8BvFmHWFTOBHnK/cJFGHdPvZYXnS75mvoNZg=;
        fh=1WmjZWKC1PvxwbBR1DR57G3o3RCrPQffl/cEwZzUm2M=;
        b=WwO+1VD5RqU7OavfaP4/gUVqO7aN3IRUULt9BRFvNusEYmEtPqyda5wEGaCNVWRJ40
         6W9CMHpkq38cS0RzfpEovnV+7/8Vn0AWs1Aqe5Oij88vV1mTj4VLFASXOet+uIoiu790
         P2/+MZBU5JrUZesnSY3Id9wZjSmjitUwrLk68+MOdb02X4Up2oF1q2LVj4gFdEo3BhBA
         7HR2s06VRrdX2bIgLW9xeoSp57FryPn5CXYAlLlY+Ty1C2SjfqkG5l1Bv1URP7ACfiIL
         ADqdIbRy6WGYuaDujoZrw8DnZukeP0Du0fm3IkO5GrmThxelK6h5PJdM+6z0C2PoK9Cw
         leOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1794633952; x=1795238752; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLPN0CJ8BvFmHWFTOBHnK/cJFGHdPvZYXnS75mvoNZg=;
        b=DmqQsH0e4Xl9Aga7YKPnKScfCwrZU+DMbvR2m39ypZa5lkYxL1ds0kmJ2OWH06sD13
         FajpaXL0jGQWkHQJPROH2FKz5NhHFHfbp1NugPQanXnHJJKFtzcjm8YsadhJBlpWPGT+
         7rVSmjUPiHrS4zX/QzB8Tu3aeE7gO3wVfuvCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633952; x=1795238752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oLPN0CJ8BvFmHWFTOBHnK/cJFGHdPvZYXnS75mvoNZg=;
        b=BZ0q3i4CCKtGpoF9xhBgIFV0gSNkY7iqJPgA54gDOijCWxizi8BZHyBa0W8T/vX9xP
         4SBoQK0Z9ZWXcJ1MqNIAKG026/fG5YC6oW6fn+/IYhBFwJ+/PJ3NIOs0hV2JHHgntgKA
         bDNDmp40NbmFmGjEd4VGShxYCr2vD2aGMUTfZkAzB4VwLVnN8bI4sA4mEgOoO3pplftN
         Yq3JxobtjUhylrMpeRC2fE4R5uuh0j7Nrqh1vIgWSO8JLdZHGWdvOh8I+31t8+ij9r2v
         jQUpbv0BQHu1/G1FhDjq5cIhkhy/DkOv2igsSwBjGtOXmp4qY65gB4xTwuL0UZcJd4L0
         Er1g==
X-Forwarded-Encrypted: i=1; AL+hErGkM+I96FERnazt6ZuErDDPJG6DsBHouZdaV1Ywub9ZoAnHD5SBXOh+UFpEzapfmcnBHizpseUK71RFK1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f1YFeZbMuC+ZXMqvkLeMnu5laJT6U5kDl71KSDYYxPuucEjxp
	RoTatIR32cFh51uNKZpaWPPkMYIdAUC7Cjv97tzSq4oqUNlQxKj2R7JVzd3HNRv4xnlZ74jo/87
	J/+XJp42kq24gd7eUkrOwFWJ6JCXC1FQw4hCc7vb8hQ==
X-Gm-Gg: AYBFou2BANSfoEP7DSOoPEkISjoVxkIqwqjdmczBMPDEKdgdBqosv93JzClig592v3/
	DPpBWOMj/vlbiVriHApbUBLBUilwU9nBgKc0NJjGo9w/pd3UdkBierd93H4frj0nHV/wRDnpkSO
	DomhoXBKXRl/U1XbCGlzM63mwtg7+kgybRnsD0VBhszSVpRfB2WndBaOKy2M9MkHCJByL1fZFmy
	e8YRW6keo5vTH4uHbRkEGghGMwZ+YanV5NK4fjr2jVNw19HNNwKZ2zWSj01zyOgswGgxYJBFJk1
	0eVceqJzVF1J9nMTdXUD9jkgn+8HBWTAIBTLCpqcoV/VbPNf1uigxNEVdioMTkWlfIdIECCPkbw
	6P1I/mQDQqK7WQUN+3FXCs1wajUIcLT3ClocXQ+Sc37GLQo/XEJAneps6lwsVfLKpjGHAaA==
X-Received: by 2002:a05:690c:f03:b0:8b1:60a1:cd3c with SMTP id
 00721157ae682-8b4aa2a7bfbmr33554237b3.41.1794633952373; Fri, 13 Nov 2026
 21:25:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110220803.2503416-1-irogers@google.com> <20261113171734.2188066-1-irogers@google.com>
In-Reply-To: <20261113171734.2188066-1-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 13 Nov 2026 21:25:34 -0800
X-Gm-Features: AclHuK-aRGtejtjQzTD9T388HsZw1Y1VUwJ_eg0M38a3xXK3Tk0yjsKw_HGzd1Q
Message-ID: <CA+w=M=SnFtEHA9NhSM8gyCGuA19Oazpx6X7yYTtgatsi3rKfCg@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] perf symbol: Sorted arrays, DSO-owned lifetimes,
 and memory shrinking
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 9:17 AM Ian Rogers <irogers@google.com> wrote:
>
> When profiling large binaries or long-running workloads with many DSOs and
> threads, symbol and DSO tables frequently dominate perf's memory footprint
> and startup latency.
[...]

Hi Ian,

Thanks for v4, and for pulling the three fixes out; they are in
perf-tools-next now. I posted v7 of the lazy loading series on current
perf-tools-next. I apologize for the late turnover.

Lazy loading stays opt-in there for now (just don't have confidence
yet to make it default, see
my reply on v6 4/5). From reading v4, the two series overlap in three places:

- Both use bit 14 of the symbol flags: SYMBOL_FLAG_ANNOTATED in 11/23
  and SYMBOL_FLAG_LAZY_NAME in v7 3/4. Bit 15 is the last free one.
- 18/23 replaces the rb-tree. v7 3/4 walks it in two places during
  loading: the alias name loading before symbols__fixup_duplicate(),
  and the check that skips a .dynsym entry copying a lazy .symtab
  symbol. Both would become walks over the sorted array.
- 15/23 defers elf_sym__name() in dso__load_sym_internal(), the loop
  where v7 records the name offset instead of the name. Both want the
  name as late as possible, so this looks mechanical.

Namhyung, which order do you prefer? lazy loading v7 is four patches;
if Ian's v4 goes
first, I'll rebase v7 on it.

Thanks,
Alireza
