Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793303199;
	b=hNs1fP6T+WmrAa0RUr8mGxPqRn4tICl7jTjekVgUnM6yGE1UErK6lYzj6m1FMwv/uzmd
	 VsnRmZ9tnAhUoeAvs5VFa7YgiTHSVQqnfTsuKDS8aVv0lyjJBalmk1prFNMtGpWqC62fg
	 D29e5B8l/z7l5gpqB4kI4OchtaG4XYMSPRgT6H6xxkG1dI5pTpOnCghUpixIzmKXtKMn8
	 4WqaoYSdot6gqjzPipt3FZ0RqjZsdA2IOfAP3IwVf62TxWWVHyyN/m72Q/3RSSmLF2RNf
	 h6JZwr1anCYzxbh/LmqBxqjzariSO0VzTxt/RRKMxlRVVBNkrvawXcEmpG/RoGcQ0VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793303199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RosLk8H/Wtqi+HeZmA1Dvq0kWL+1/+UBruPWo3aRSCU=;
	b=QczSJoWlzidUh20Px4+yJHvRg1R4Ql5NyCqZlz/H1fPeIEXNMml/COOUhhlNdw5rHorD
	 zj1fCkV5z0ep0/EDL3giDzubBCaEyMN2t4Aw41eB+/K2rL5yK7tgvetvu4TC0Y7Msn/3R
	 gmCe9xCN4G+jY+ClGPhiwev42dtDfXNPGDdAvtxXNZFVsdWciMoDulnMkYCL+yTyZkbT4
	 gwykbRX4YK/awYsSqhfH0UG9J5etX5QLtphN/TEuKKp5RLOGe5BxOKilBxnzHnVw1q1NX
	 TimroSXdrZx6Cq3h24KQFr4PwGGAYxTd4SGAli9xeUQDTvvgPajDf4VAJrSoGV22wMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=pqtnUAhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B043606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B043606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=pqtnUAhH
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6768403e9bbso2570097d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793303198; cv=none;
        d=google.com; s=arc-20260327;
        b=jtfb8T5gwoDCoYBsKQ+myv/KFNNePtBScY132nVU7QxzNAH94zFWMGlLObVGOric32
         q7UHrUbWeSEB6XegIRvt78OsZzMyXY4njwcUsj+QAtulcZh9vYo8KDkPS0L3Q2mIFKXA
         P8sKAaprQUYXPiWy5aCsY9Z+ueEix1DAX1AM43BZDb2BtmVQURyoSXO9L2cIQQ33zjmZ
         gOLyX/RFI4iPObOU9mUBq0coovnez0q0l6vlQifdspofWuQS+wjftGG/3NZ+TDHn+OjY
         9/nmpjnawt4lR5092Xod5a9BsnuhjcsdelbmxYjw29UU0LqPkR220Jlu7zBpj6VcEnes
         jHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RosLk8H/Wtqi+HeZmA1Dvq0kWL+1/+UBruPWo3aRSCU=;
        fh=f68rk1AZLJOrfkyynutOzAVAe6XjAZjq9n1CsiJcY4I=;
        b=PbVAZCTeE2qnpnf59iGxhlAcNt/h0q+O1PHmHB1g+SL84KPvaQWRw1VtTxaaPNUMUZ
         vZPrXBrDfeQV40PcHqKtxDrcQJO7HX/TKFj27PKC+vrcVaWxe7Qvt6wOc6gveAL+k6v3
         1UUgFhhtDtfAEMKBHlfKy/0Y5RftpHh1amH8dJLYayDvm6yzzuuhC/a2AeJAx3zHokcB
         XLRYYZ7EiBFX5N8F9rXMG7tc60vbdYtJYX25myNqG6wxNmwc1QzrqrU9Aft7LzMCmgI4
         BP7kTd9Xo8eLh5hym2+n63LM6KL0cVPrNqgwQUauXWAkqz3LAqYW1+iTinraNA/pTBAk
         U1nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793303198; x=1793907998; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RosLk8H/Wtqi+HeZmA1Dvq0kWL+1/+UBruPWo3aRSCU=;
        b=pqtnUAhH3QL7W5nLxIO6oVdjIinrMb2PWiADufT/QTa1q90AvOAuMST1DzB3zvELPd
         la5emX6XPXwF/e5Tb4PYHwFy03+NsQiFBiZagHJdxGukcQgGvZUW++wKZAkuYrIsT8yC
         /ha39aYY6LYJHV3x5q3f//cQDa8EYxRQrAWiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793303198; x=1793907998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RosLk8H/Wtqi+HeZmA1Dvq0kWL+1/+UBruPWo3aRSCU=;
        b=2UYEkd6SzMT2UIdjeZ2s+i0kbdEgAWbg7e6+Tjgt6n7kT+T/n3l/E65H1tRhIDgQAY
         P/uAl6s05ptWsV6ZX7DoWW2orF7Q9Mi5RYBZ/XP3u/LLt6wFividl3JoQCEUfNAUhYhS
         JgH9Z+Avsq44S2NHOQtyCkpqExnu6Wr9S5dXCgGeFHfav1LUwiJeZOlpqHXUoWw234uG
         PlPC4P3AczsoFBgNTgkPxk7NjSooV4WbweYO3IpYlIXYv1K5hhMTnuF83kyAwTtvofXR
         f8S8WlT7KjcaFxpL5z9BnLPXIIvJHz/RRGoWxb+lbyLv+HmGnIIXda/8aB7qtaybhKCT
         OL0A==
X-Forwarded-Encrypted: i=1; AKwUvBw+KsvvxnsKrhRI+ybcmfhVE/yX7frH+g1pTVnT8pvlfUJ7YbTIwUwiA/wfmUOB4J/XgDhJQpczATnFgVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLctdbOgF0XDgNGKsI3IcnsTlEGPIPwDljpLulGprjeiCFZbZgI
	R99T+55imCFAPKazJBbF3yqYCV8kK06+gHAbaCWgvnTWbgTJ+q73kcyoUP58VQnO/U3GN17foM7
	COv80LGLv85XCzrncwW7sZvWdsijPeefYvSpzm9SPOA==
X-Gm-Gg: AYBFou3D21AMH/nm5vsDzX6tiUSn6lky+o8cjWR6FFGLnbLxXvP24QEmFD79rR/gaGe
	N82MZztUYFVLbMQnM3Fgw2WfFzoE8fimloSnDm9aEq21UAo2kGwvEekg71PVXJ+NRfsKy/elby+
	sqS0eFqmCNg9skZz5on+67ZSqjHcgdeZTQyafBJkr8Mx3CNEAW/4QdV1cFPjDUlYqTTYM3sANz8
	KtDvmdkXspKU+/5KrlwFolqvauiqR0Ef3TUuZIT9bSs1BluJuc0y1YsqvWoHT7/FAhv8bhMiFRu
	80zwfjLTlu1FzxD1L67RJ+DGDz9CIAWSfvGqHH663GTh7pFhJNbJLU4GAiJEXO7eQB7/dPRF52Q
	TfD8XDh4oCOq+WJO7ZHo1wqMezc4fMXvnjJFJSLrd/jr4uaQDj16LP6IIG0fjbGmtSm+odg==
X-Received: by 2002:a05:690e:400f:b0:679:98af:494d with SMTP id
 956f58d0204a3-67ba5030e1bmr110412d50.84.1793303197162; Thu, 29 Oct 2026
 12:46:37 -0700 (PDT)
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
 <20261027231513.816148-2-irogers@google.com>
In-Reply-To: <20261027231513.816148-2-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Thu, 29 Oct 2026 12:46:21 -0700
X-Gm-Features: AclHuK_6NIIUx9h5hPScQIIEWDk-5P3kziaP-6o6H7veLJVOSuF2GiQo2oAQCQw
Message-ID: <CA+w=M=SWCd5zBURRERBsxA5xTDS6GoXXgL6rzSQFCfvxGC=HDg@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] perf bench internals: Add symbols and maps benchmarks
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:14 PM Ian Rogers <irogers@google.com> wrote:
> +#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 33)
> + struct stats mem_stats;
> +#endif

Does this build on a libc without __GLIBC_PREREQ, such as musl ?
How about nesting it:

#if defined(__GLIBC__)
#if __GLIBC_PREREQ(2, 33)
#define HAVE_MALLINFO2
#endif
#endif

and then #ifdef HAVE_MALLINFO2 at the five uses.

Two smaller things: 'perf bench internals symbols' exits with an error
when the binary has no defined symbols (a stripped executable), even
though the synthetic insert and lookup phases don't need the binary.
And symbol__init() has no matching symbol__exit().
