Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280094;
	b=0/hhKzZKYi3YfC3lf3uqWcd7sVAQf//gv+fck9m4rPg7bpHR8hC0QEwB9kYKGrdxXAUu
	 x+Xh0+9iQgThbzDJ/gKUW6B/GLqWoUH1r/uNserNEVeZFsUq4fJq3nxKza58B6J2q6A3s
	 z5R+ivyvJPY9H3vPfnrAtYlW2e2ZaYHEd5epYtt0yOCLprZjUmlxGd4/q0gT+Lqz85awB
	 15BKjElBoYYH/ekzU5TpDQLsPiWLuhYjPTA8SZ+DHc0ue9Dg1ELeqvB58cJNttFvoobfF
	 z+CVl+hYJWG7TL1yTwbTIVyYJy36feECUpgndvmToKZAfKXZ6Q870qdyL7FxeDPcqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
	b=lSX2zUuTW7Is49AUUFGh5wcNtD/BdeA0c2LXbQj87oPUt2qeT3dfGChjN7sdwQb4GvEL
	 7YejPGG7x7SQ2EG4pU4BJRxdvJNggo8HvDRZPFxW3x6NMe1yb8nUWh+7q12GH2n7RZrQw
	 BhgE0CHNzDPBhBa9XuAA9/RApXDLzJ7NCo/CFDL3K4xn4FjI7LHX6kYp7DYw4yr2O+uTl
	 UCRL0Vyxu5IJk1zTZPULc1IMpLT8JQWkycXI4BZp0MQYzL2aNe00ivy/Tn5NQiOVWROuS
	 HiswyYTRBLZHi/ElSsENPrbi6qPvr1XW4PlFUKIpkdpe8LHNiFP/wqRQo7GgFbYJRlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UOhCUjmW;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ACF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45ACF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UOhCUjmW
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so1323656c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794280093; x=1794884893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
        b=UOhCUjmWqyhIgvb6DM4kMuaVtMGn8ypxPihudQDurBoK7Hf9XEKPsEIK8NVnyCDGGC
         drPemDaDW0v/ZMthSVCjgBd8+uNpQ+Gf2F40YqjsbSZARP9+BnGxHnTeLx1aih/k8A42
         7+iGnZgiHMfsh6MtQGmrAjo168DSbAYe/gj7NF1cHLXA10TXCSSBBAhIPIGQUcc4b0LS
         u5BNaFw5kLU3b0G3aiwFGJo9gqgzeJKTFIciBuwwVkvVau81G/cywEenCk3XivD1QGVB
         pqI3DtkJMigBBJO7B6y4OReh1Qqpt3wSSIbAXHLmjh1I5nUk0TbeK4vlluypWJjwTJWG
         JDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280093; x=1794884893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
        b=j11IMdVzVUoH61TNgYEC6XfqSYz/+M6lA8KR6EwrMh1+Fmpa6KcrDyQL8cwpE1XDeK
         u5kXOlX6ztLdc9bek604QbQwa7lpvPRCvViCKFrUkC4faPCyXOFAuJ6iXvfbyGGxQ2Qc
         WjGTn71NIlIY/NqcrH7NX3+jFz43K0zq8+2hseNajkcOpph6ml6bgyia+DLtqR+7ikFk
         5d74GvVkTdXJRSFJhLFw/45UaJLhAyqq8Na+jrFNQ75YEooMP7+2HlvFgMYhMdy6Sgrq
         Fnk1tnY3JhbNnNJlaZLE2bWxHyMcPnWWsDKiVwKNAwZ2+xq7GDorpEOYVsRISAzBCcGI
         /stg==
X-Forwarded-Encrypted: i=1; AL+hErFTuw92d5tkeLQmZV8M+rcFZDReu7RDGPJ8gejRk3DhiCz5OkN7XdmePhRapJVnhZ7ijCb3hVa1Umi197c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SPZXKKwd+Ckbqu3iM7Ej6Lg6UpoybVP4JnOp8GsO4OWeLHStm
	MueOvrFRV5k8W4eze0VSGxqwxjsJRar2gUk+5PFUulYMH0AW0blDgvxTUN8Oky82bdA=
X-Gm-Gg: AYBFou03R5BS2JqGTd5AQgNKTC8U013YVSTQOqafBqgLDTNGuwMuP++oilnPoYLA6Ky
	1oA3Q5jLi3SpyKgr6StZBG7TtMyX5kJOhSjeU76CM2o49CBUieYQvFyM8HKplEcYi2gwpQeYs0r
	7sO1MEpDCNPkLPxBZvTIScZRdT5/vxel+PZVqUwHQ2IAm/JJgtIus8CQqSTw8eTToAl/xBwzX08
	k9NeoWhpjI6hEU9pHtIrbCm2rtEtZam5KI4JkvKXm3L/eVVOQYQ/s7KipQunlOPmbLk5H+I9yCo
	kCQ8xLWjvff9S8YxqkceNtZHYz9E+e6NAZiHNlkI7VFTn4Nkb4FzOo0u1Ebnschnq//E9Z+1Fc6
	JyLixrkMZ6uxqGf88bRtsm0Srs/sGMaJo0Xjx7dEn1C5GFxYLsZDmXp0llb108ORZbM1gFp8E5H
	vxT9umtuol8/grVp3sguSQipsT8BlOUbHKNVw99DCgIJiYqVSSRxKWKGTXpj+0jLoHESKAFm8u9
	T4Uqv9UP+/dXIyKTeV82RhXbYxfFrxSXZbvdagRvX31ECQHHBbzOr0n4GC4s51cFJEdnjE+DddR
	LXsfUHJooy/0KbJbWAYYvX3rF4J+d0LQ+l+gaJFgr0hBESnfe+g5+Lj4Xlf9JFpbTg==
X-Received: by 2002:a05:7022:458b:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b3b602aee6mr2497518c88.39.1794280093242;
        Mon, 09 Nov 2026 19:08:13 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3117480c88.22.2026.11.09.19.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:08:12 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 02/14] hwtracing: gtrace: Initial implementation of gtrace framework
Date: Mon,  9 Nov 2026 19:08:07 -0800
Message-ID: <20261110030809.2405947-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mayuresh,

On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
> +						  const struct gtrace_component_id *ids)
> +{
> +	const struct gtrace_component_id *id;
> +
> +	for (id = ids; id->version; id++) {
> +		if (comp->id.type != id->type)
> +			continue;
> +
> +		return id;
> +	}

Following up on sashiko's comment: we are adding support for SiFive
pre-ratified trace components on top of this series, and they are
registered with major version 0. Using version 0 as the table terminator
means a driver cannot list a { type, version 0 } entry, which the
eswin/EIC7700 SoC ships.

For now this works because only the type is compared and the
mkversion(1, 0) entry matches any version. But a later version check
would silently drop version 0 components.

Since GTRACE_RVTRACE_ENCODER is 0, the type cannot be the terminator
either. How about reserving type 0:

	enum gtrace_component_type {
		GTRACE_COMPONENT_TYPE_NONE,	/* id table terminator */
		GTRACE_RVTRACE_ENCODER,
		...
	};

	for (id = ids; ids && id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {

The NULL ids check would also cover the missing id_table case that
sashiko raised.

Thanks,
Leo
