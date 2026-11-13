Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552031;
	b=TgLWG9SDUCfDCeAutT9amQsE1vWyKs2vX2yyZMFRMsHxXoRVB1e7vCJ0DBT2jdFHAvie
	 eHbfzgpidb7Bvd0tar3hznwIWsmlMnfzY+YvaxLQWR/y+d0R+FeFXuLEWBbutv3WifP+i
	 eieOLZaiJrYjDOZjj5viBfTZs8JRBntufur2f3D3+FxmjeY7vTdGDsJhT9LlAMtNhrXEG
	 AoLYqszZ7h8BgXBD8Z6gyiaFBZ7Bf3S5vFe62B4wfRGXHQFtXQc7iO8uUONeu3LAiKck4
	 b/9v9NOp8WK/gCdZ3EECukViRzksehnqKPXjKCnVkj4MQm7npyEUJyvX6xoM0AkooUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=t6Jg07tsLCsIeZZ/dxjj77HUXiYcwZwtBpyyogJ2quQ=;
	b=uFneSTzni7iVfQbhWFHN8LsHybkHCviC50XNd8cL7opE1OZHwtABe8wa8K5XMc3YzX60
	 vvI1J3aD7Qw7l2CpCm+Znsiz4QwhfPEhbal1lWCzFGhBFNRs+6B9G6e8pKlmeBoDyI3Uu
	 TH3ybrwCv2CmUCrjM7Q9U39YXma0qvL94h5dSfw8AlBGiiDX9MaHkjnJsVjiOXWmdilxJ
	 TsG4kuua0SvsZbY3FEJOO/VhTWReAIn0IUnZlWpBEuDNNsgNfPLP+gBzqmb0VDBcfyV+H
	 kFuZcI68cLOqWUrs++N54zpcRs7wWmA5meXwXW6jDgMSU6bMb/kO9tpUhhJIHO16+MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlQfVMpm;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E6A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlQfVMpm
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1383976c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552031; x=1795156831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6Jg07tsLCsIeZZ/dxjj77HUXiYcwZwtBpyyogJ2quQ=;
        b=HlQfVMpmbEDTrNrrWd/Agx9fT8zq0CquQIgQG7OCVqMCz4pwt8aCl11JUKU2nH9JGx
         NrKPF7dgqrnQfzH2+jbuvJtItlMZ2kMDxO7mFnEAwa7FXJBiSf7a7wxZg4Bhih9EJ3k5
         I/Dlyasiiy8k5Crd6FLmJqbOZt/IC6kvl1y3Vz4gf1vwzNdt7jhtbo1aGWt3UN/DcQ0k
         DQbYZIxnrmTfPIV8UFcLXzr1DJNWnYVK5WeAZW99K0i9nox6EZy7tmA5NXAea+sAxBOu
         QSUn9TsBncc4x2UAKHwIc7SVg+Fmex3FVLffjJ3Ssdx2ICfL4h1bwwABg9qNs1Oe3OHr
         PMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552031; x=1795156831;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6Jg07tsLCsIeZZ/dxjj77HUXiYcwZwtBpyyogJ2quQ=;
        b=m0V1OUSwD/Y06toAMwXJvCy58kmajmHqfES3Up9yW2D82+CJv3p+wlD+9f5aUIwp2Y
         0V+BBd/y8C9i5MbKs+sNj58FmIqTxZqGJesa3azwISHoWFEEw9XBm/VZFAOEjbcqXXzi
         5U+OMhajOEOUbggZCSjONE66c9zLVOKHJEJrGJ98VWsp5Kb8cUNpqhYX5rPvQ+285oyG
         XIwr/9O5hFP0f4ZjpOc07A5elI9EFLM7sO9XC8IVU8Gw4A0+7YmwWPXA5qBkjUnu69Hp
         Hk83yUPl3f+zM+B2Ky4UrKw5YT1Gcym0f4ymHGqvD9X6jaDXHuCn0FVJlEXo2QB5Dzk5
         OX0Q==
X-Forwarded-Encrypted: i=1; AL+hErFZuCjiR4DHBuuDUSlzCW3qhRhyBzAKEe0DYbyUTKdH1WkHvq1AWYTbXFxfCmcBLhDsfcVHAD3C44N76S8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h6NJUUFBvGYtrcLJSQQOxtN6GW7Wfv+sGKMyMG/hw+zNQMcMm
	4WztePDU5iQCvKptQAJOBsY5gqBBK9OK69qfTCSENpHAirkdM6u9/85Z
X-Gm-Gg: AYBFou2Rr4sAtEfhRykljxbuQGito6D1pi1d03r3plb32xf9Et7GP/yZJI+k6EKrJCQ
	UUsHhs0a93tJO0FmCTTOU+1t49XMi6aTSO25Cq4Cpe0PUlm/J3QS/gBfbI6/LdV+OVrvVi32s4T
	oWtRqg5HeLeiNlMEywROGXqP41x7FDLmBDtRWU6smpIIAA+8e+BAeHvo40RFS6jmB+5em+3wh7O
	Qr1TFWI9RysR8Md2FgEulVD6JCDtVoumtENNfCCIHNRHj/SlFEQakKl6aMIhpd/ibzXv6zA3YyZ
	zx2C5RdK00aIYuJStp9C2ucaCb1Bgwob+5ycUseaX/5/cJmcn1cOzdMAe9MihVijae59Az3yhr2
	9XTDpXG5dTjv5QjjgUJc+4H5ZMKYo/YseqVFEl8ew9Wx1wsW6sW46yHKqfdmKzXR7bC4KXr66kC
	PEBjIhLCHHygs3jcy1ZopqrgxAQaSG6nXyX/7a/ABBcBnK7CAaDy/0oqK8hF054hmv/4YaEzk4d
	pmtplNq3WiwkHKBMKVi7h90cBdmFeZkMcPBBbavv+uTt68KEiAVQSm+AT8+9lOU4UOdRNv5FZ72
	OJ6q+hP1/Vmr2idbTxg2Oh/85QGT8KTB0EkmoUbUebcuV+0=
X-Received: by 2002:a05:701b:4248:10b0:1b3:b455:93db with SMTP id a92af1059eb24-1b503131b06mr1869718c88.24.1794552030463;
        Thu, 12 Nov 2026 22:40:30 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm6321205c88.9.2026.11.12.22.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:40:29 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Fri, 13 Nov 2026 06:40:27 +0000
Message-ID: <179455202729.738309.5850348519213838978@gmail.com>
In-Reply-To: <1e5907fc-40c6-4025-8d27-a92b3cb2845a@linaro.org>
References: <20261108183846.3804875-1-takano32@gmail.com> <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org> <1e5907fc-40c6-4025-8d27-a92b3cb2845a@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

On 2026-11-11 14:03, James Clark wrote:

> The linked patches seem like a bigger change than what I'd expect. I'm
> not sure that's necessary for something conceptually as simple as
> "validate the json files".

Agreed, and that version is gone.  What is posted now is one patch: the
list of keys a table may carry, and a walk that reports the ones it does
not.  No schema, no similarity, no metric-name check, nothing wired into
the build.

https://lore.kernel.org/linux-perf-users/20261113032927.634183-1-takano32@gmail.com/

> I'm also a bit lost about the relationship between "[PATCH 0/3] perf
> jevents: Report the JSON keys that jevents.py never reads" and "[PATCH]
> perf jevents: Check the JSON keys that jevents.py never reads".

The 0/3 was the first posting, and it had collected two unrelated changes
on the way - a report for a metric expression with no event behind it, and
making the arch argument optional.  Both are dropped.  Since v7 it is a
single patch, and the only thing it does is the key check.

> Even without jsonschema I can't see why a validator can't be written in
> less than 10 lines.

It can, and that is what v10 is.  The check itself is

  for path in sorted(Path(root).rglob('*.json')):
    if path.name.endswith('metricgroups.json'):
      continue
    for obj in json.loads(path.read_text(encoding='utf-8')):
      if extra := set(obj) - _TABLE_KEYS:
        print(f'{path}: {sorted(extra)}')
        bad += 1

plus a directory check, the 51-word list, and a shell test that feeds it a
known key and a bad one.  On today's tree it reports 19 keys in four
tables.

My earlier answer to this went into the other thread by mistake (wrong
In-Reply-To), which is why this one looked unanswered.

This thread is the data half: the 16 keys in ampereonex/mmu.json and the 3
in the AMD tables are still in the tree, so the check reports them today.
I can post the corrected table as a v2 whenever you want it - the check is
not a prerequisite for it.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
the checks it describes.

