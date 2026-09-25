Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431A4E66A2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366131; cv=pass; b=uZJVQOmFpwwkLcsOUAUdna65N9BXb5efHO0b5STPjBY1RM0KgqNau+LlE0aCZIxzuR97pua8Kjdo+CZmdztqoJtZG7jDfLCmqSGyUO2XIINK5IY+FrNFHNLliPrwXImv7gHZ8UkKxYAxTCdLwPvFNX20+ogLdvAYuU0uaL06anA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366131; c=relaxed/simple;
	bh=y3d480aQ4neFXYQOEaCvASlHXtKnpBE1ubNE+6f7raw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYmRTXNWR3B8oBpfYsAMULTtBGTwYBpQF3IBHWIqQR8Csmbw29oGEOKgcB5Jjx6yJXQqeBvJUKd3rsKrKVLmyr5QKSu8v6uHjFDVPj7FjKPGGRgYPBMFRBu5DmuxGRU4mmPp3JoZNgTUjq1aJaduh6BZbp5H97CRQcVy6WISopA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=wBeTCMps; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="wBeTCMps"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1278823d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790366128; cv=none;
        d=google.com; s=arc-20260327;
        b=g/KmdCU5GUXubwOuDYRVT3FriCIyZjIT9CrU4vHX1qFHvhM8gQVJwvyQBMepvK8XIf
         lLVDTUIWWwKfFAS7JomD+AUzwBUiLaTRzFTBmpNAbBSC20koMYahWVHQv+/en7fDb4Ss
         QaKpGWRuQR9Zp8kautzri6wdNsqa6XNaTQ9Na6bhtLPiR2V0iMbvE2wpE8dde+iEwHch
         VxTjAWgVl9tgTzcgCxpRnbMbEIfXL8mTGi0bIqrAZ6ap2NGQYgSyN2fGAU7NJ9J0K6w3
         n9m/DgC4BAJLlwcn2/pGhgu5ccWpGpfAkqeV/0njeAtZUsTRLmMlv2MHp1MwavGCq3Ue
         D67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M/kLmD3ssejf7itbaiJfm/99tp9oxE9QonIXci/xOzo=;
        fh=FZmc20SlxWYeLtUEEfLHtx9Qq+5bZT3Wwf2h0u/ujqA=;
        b=hhRvdWjF1n56Hinoa3xJvdSapOw//AxsaCBZ7MQYmFGRK7K5s8Lv3lDLgyzuEX/LWQ
         ho5BmDgooN6YrO1k57I+kO/FLKwKQbRCVuIuVedgargC/VznirY2C009jsjpyLRyh40n
         SYUFUh7RFBl3JyngZKS5RTWWV8l1MHtTLfaojrk2rtM7f5rKdJkF3EdaqGNtwsn6LuAQ
         I9/AsjIDKAOp6wR/VdvEBXCjXnhfjFtOpS6sZA2FByNPsbmPVI0K8DHTCV5c5rxVWY4J
         TUxsEYYsAcISMBq5xD/w1pScjKE92XT+y6nS0WBcAymLVQKDJQXzpmk7IlqJ/F8RwOXq
         X7eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790366128; x=1790970928; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/kLmD3ssejf7itbaiJfm/99tp9oxE9QonIXci/xOzo=;
        b=wBeTCMps1t6bOOsVZiXLq+I+rCRB2V+jvSit1DyZoLyG0oHUhct2R7qWUKmfzvrsnS
         lIvCSJ60sKjUz4WsRDjOtgoMB02nIZg2DyzgRh//hzlT2GzZ3zN9ZotrAMjfh7FGmQhJ
         JXxFQowJ9rG9dNpfXG1zFPLpRCIeAZPex+uOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366128; x=1790970928;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M/kLmD3ssejf7itbaiJfm/99tp9oxE9QonIXci/xOzo=;
        b=fMz1ZGThWgUNasaGat9/hmHutptHR12BJVjikBVYpuilLvQInxZM9Hv2H8DTudMhdh
         6S+ZtMSVvQpE02cYFTKzkuvsCcMMWvUoLs8FY/v8ArSG0kn28oveTeqKrgLPC5flp90P
         wJG7KvehRFNdX6v5Z+89vqwsxcJ/8UI9iYM1W7AKxtDIVzxqF3hXc3RrnRJNbQsWDLIh
         eM2ds5ZcLsmGTZLe9vdLwN94buLbSzcs6YefkB8TruHLhErF4TKOQHr3lJLF5mtoHugb
         nt1sTmuVeOSA4fMN6V4qnRzJt9K/7GeLiwplHOjB4tyMct/qMdPmCqKo8o2sgUkfCNvM
         yRVg==
X-Forwarded-Encrypted: i=1; AKwUvBxOhM/g9O+2gTTxkCDhA9wILvfjAGJubVyYswZG84LG9IhQTTse7NygVCteHekAZ2NcUvV4JXI6s0ZbxS4=@vger.kernel.org
X-Gm-Message-State: AFuF++k0OXR4eOReQN4Ql79uB9Jep6DtlArSI6Oa7oX3WueOihJ0mqIQ
	gW/46XQeQSvHeD8feHTd7sutOfF1F/99M0CdwRTDoPMZ3qpLH3Ox3ZGVSnbtZltR8ftvmOb332i
	Jb3uliS4bFPZbZUAEtV901mrxCn0Y0YrLRiwV3tyuwg==
X-Gm-Gg: AYBFou3+K7Mw00mYY19cA8WHXA1DB5tYMvcBJFsWq5+mB+NSohayQdCSTIvPb4vGqrc
	U8ibs9oJVUofU9or/hd9C0jjnYzPCVzHTiSkVvNIQjMCse2bGzy7N6IN1yS2CyAbWoa4nAIJx2F
	8oioZoNq0XdE4RIhI1xSO9ov3BUHtsUza4wnTQPp2kBNLzrbPAyXDEV4iuE0cttZ+MqRtO2wcWY
	TlWNt+LsJRFTMmeg+uLYQ2/29erYwjOJUEtsL/fpMV9lQbP082GiFqCHaMDozAt7cFUyc7f3Fum
	QLfGkVfpny07mAAg+ZvggVOlK2k+gvlhbhcxHFeOdMEVTH9kYgM2VsUt+gNYO/YDhmKe5ZHLG8F
	Q8I4woO1ix78=
X-Received: by 2002:a05:690e:190d:b0:674:eef:ff94 with SMTP id
 956f58d0204a3-6740ef00198mr1221668d50.94.1790366128017; Fri, 25 Sep 2026
 12:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
 <20260925-perf-symbol-memory-send-v3-3-3e4e234c363b@uber.com> <CAP-5=fUumhE1-DT3a-EBYQADy6Az=nViGmz==n1ocqXiXAEQjg@mail.gmail.com>
In-Reply-To: <CAP-5=fUumhE1-DT3a-EBYQADy6Az=nViGmz==n1ocqXiXAEQjg@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 25 Sep 2026 12:55:12 -0700
X-Gm-Features: AclHuK-_YU3Ru0K4GbKsaTj_Yit9QoL61jEi7xwvNXY-JzFdQZ5vCR4eLAKyjWI
Message-ID: <CA+w=M=RJYSCuk1SoU+OR53Odf6OyKMsjDMUAtaxSmD_4Zyq7oQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] perf symbols: Factor out duplicate symbol selection
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > -int arch__choose_best_symbol(struct symbol *syma, struct symbol *symb);
> > +int arch__choose_best_symbol(const struct symbol_candidate *a,
> > +                            const struct symbol_candidate *b);
>
> Given you can change this function definition and only change 1 C
> file, is there any reason not to make the function static in symbol.c
> and move the struct symbol_candidate definition also to symbol.c?
>

Thanks for the review. Patch 5 calls symbol__choose_best() from
symbol-elf.c: the lazy index resolves same-address duplicates from its
index entries, not from struct symbols, and uses the same policy as
the eager loader. That's why patch 3 makes it non-static.

struct symbol_candidate has to stay in symbol.h as well, because
arch__choose_best_symbol() takes it and powerpc overrides that weak
function in arch/powerpc/util/sym-handling.c.

I can say this in the patch 3 commit message in v4.

Thanks,
Alireza
