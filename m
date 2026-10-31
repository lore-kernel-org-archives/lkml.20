Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793428557;
	b=FxaB4LSTgU10iFr5sKWcQxPT/5wz/M2wR1cVGkknhBGpO0KhZN0Yj2ACV828yxBV7xkO
	 F07P+hR8k4MydiLM66f555d+fueO0piFczYIFyRiugH9R5peOnpwwU8U26xD8GqMUibdE
	 tdBsadKBQ7/L7J3IGaqMLQFRyoRj1VtqyYCltPed9w5yZhoZBHtksTfDpMmubz6/PdhaL
	 l2uvKEE43/JqROs9gYPGHHOhmCVFuq1N3k5UO3Um1EJDWOSJLzIXuR0iufQ90hqcgoVsc
	 X0tSwxpJ23+3QRNcYSf+0KzZo7RIvEeARZJWlTDiNOpqzcELtz4TuzZdUolLNyum4ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793428557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=V1iyPpXNxuCTE05GQf3YfwT3z9gwpbdB+e14JlNIXAc=;
	b=aKVL/Gt+FTDymSntMMr36D7r7mT1u2bX0Zit2HE+Qleb51dNypKLFKqQD9zAIQXXpU+v
	 JX/qo7SK+cLu54C0pQyj319+lgtMrO7XC0P97GoWkvQ0a+4juAWwHGL6UCSARIWzNIbqY
	 onLKLFF93HQbAptDikf1OFqtrZEq7tJbuTCd2jFGwUzxiMgShtRLuwtAUE9c8gmiIqZHZ
	 /yOu+6VpvwlxFo3+Hg/Ncn/7rwX+MyNoUIsMyKZlF6SoaVUvvRX5sRfP326wSoJqfTuto
	 4VlCDSvwymoda8OVaZ6MjXgyReZBy+OVvYlTk1SpQKZAlpgh0/3Goh3UA3ugIYxiStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HY7LdNlW;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6045606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6045606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HY7LdNlW
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so1182282c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793428556; x=1794033356; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V1iyPpXNxuCTE05GQf3YfwT3z9gwpbdB+e14JlNIXAc=;
        b=HY7LdNlWl3xyv7R4MZS1+26m0bFrVUOgM5rqY+BcvaDWBKDR4wF88v+mUi6SDSRitN
         C/pn3HEAqar3PaUgS0hv75qqcdnXQQ0dVLlPdriX0xQDnECb+9vP7pkc4jDq6VjHXOII
         2qzBcQamxh7XxVz8ZibmXPclrxEmJmUfZRuf9Wo5bL8NI/Zb5+U//RqZW3pf7Zr5STQ/
         udj8dcDJmPxHXng4YwjNmkpgKdCDOkZE+JUQLLRfwq+8yBVbxrYydZFN9UFg3awwOzPP
         bBiP6By/jiTDs7np4+aUTIWWsa4OMifR4DVfcruPbTCdFkzjRZT7vth3op8GHbCPtZ1A
         +j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793428556; x=1794033356;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1iyPpXNxuCTE05GQf3YfwT3z9gwpbdB+e14JlNIXAc=;
        b=kwXbJRAzimdtJfthzykTbcYjWxN/SotFbIFi5b8t2zeARiL45gjK2cg/wq7i3ZXo4a
         5SUzCyBYWpasEoNL+2KBfRk2MZGwleH9zYhbtZ07lwFj7C3R9w96OUqjJEJ0zNPDg+6R
         gLVwKChP9TwGQtyQAy9Z1L5xY6wP+CsE0zgxPe+TWFNMZNZRlnyZEsboIybmiY6z6/+i
         E3bp7oP/GJ/ZWAq856yO5EJn/beMJmE6LqPGwPn42AwbGc5lGsAN1xQV7nHnLXMTmc7T
         2hJGb6emW7LvnMFkh2tArs0CHmpnU8DtnDnoJyJovWYan1xb8s1Yv/HM5isF7IGldwe4
         pBDA==
X-Forwarded-Encrypted: i=1; AKwUvBz9fcnHwkLLhd9L48HcsPvlds9XuYSaPEH7akDg+itvCmrHZSFabgwJ2TOdqMMGE8hRBNAGOJ08o0O4jCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTWusXDBUHr+NPRXOKliRW1R5gHx/1W+SbMz3Z8yNg7W53AtgO
	dizb7KlHrGjCtsvJp3Z7k21ZF/JEXXAZvobdz/lRYnqVoAbB5P6jilOUnOtWXL+M3A0C5Zb9e5t
	RWT/BpeqdFw==
X-Received: from dlef13.prod.google.com ([2002:a05:7022:b0cd:b0:1ad:689e:820])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f12:b0:1ab:faad:cc9
 with SMTP id a92af1059eb24-1ac5bbb503dmr6067332c88.11.1793428555302; Fri, 30
 Oct 2026 23:35:55 -0700 (PDT)
Date: Fri, 30 Oct 2026 23:35:46 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031063549.1281324-1-irogers@google.com>
Subject: [PATCH 0/3] perf symbols/callchain/annotate: Bug fixes from symbol
 reference counting review
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alireza Haghdoost <haghdoost@uber.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

While reviewing the v2 symbol reference counting series [1], Alireza
Haghdoost identified three existing bugs in callchain merging, ELF
zero-size symbol end calculation across .symtab and .dynsym, and basic
block range splitting/cleanup in 'perf annotate'.

Pull these three fixes out ahead of v3 of the main series so they can
land for the v7.4 merge window:

1. perf callchain: Fix loss of symbol in merge_chain_branch()
   Restore .sym = list->ms.sym when constructing the temporary
   struct map_symbol in merge_chain_branch(), fixing missing symbol
   names and inlined frames in 'perf report --children'.

2. perf symbol-elf: Fix zero-size symbol end calculation across .symtab
   and .dynsym
   Move symbols__fixup_end(), symbols__fixup_duplicate(), and
   maps__fixup_end() from dso__load_sym_internal() to dso__load_sym() so
   zero-size .symtab symbols do not get extended across following
   .dynsym-only functions before .dynsym is loaded, and add a unit test
   in 'perf test symbols'.

3. perf annotate: Fix block_range symbol loss on split and leaks on exit
   Preserve .sym = entry->sym when splitting head/tail basic block
   ranges in block_range__create(), add block_ranges__exit(), and release
   resolved branch_info addr_map_symbol references in
   process_branch_stack().

This series was prepared with the assistance of Antigravity and Gemini 4.

Link: https://lore.kernel.org/linux-perf-users/20261027231513.816148-1-irogers@google.com/ [1]
Assisted-by: Antigravity:Gemini-4

Ian Rogers (3):
  perf callchain: Fix loss of symbol in merge_chain_branch()
  perf symbol-elf: Fix zero-size symbol end calculation across .symtab
    and .dynsym
  perf annotate: Fix block_range symbol loss on split and leaks on exit

 tools/perf/builtin-annotate.c |   5 +
 tools/perf/tests/symbols.c    | 169 ++++++++++++++++++++++++++++++++++
 tools/perf/util/block-range.c |  16 ++++
 tools/perf/util/block-range.h |   1 +
 tools/perf/util/callchain.c   |   1 +
 tools/perf/util/symbol-elf.c  |  36 +++++---
 6 files changed, 213 insertions(+), 15 deletions(-)

-- 
2.56.0.317.g454f8302e1-goog

