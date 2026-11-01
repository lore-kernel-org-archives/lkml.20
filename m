Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521049;
	b=2UaqMhts+cwJUyNiMJPKJb6eAm5IF2HVOVDXrfZYmDcbbwGU9ZIlyd40S4kYwj7ejzjt
	 FqeCP2TNSgZKncps7tyE99l8euWkg9E0lh8CarvrSePT2A2VJyr0KphbKMmtyYuEv2NjS
	 TtJxs/yE/mtmmSdsVA7ir4G4lymQxN2PUg1Lg09h5OZW/lglrCYw9rjCMjA0DoHWuDlm3
	 urFGjg49dbDp6uXkiqhXMquG2hGoG1GMZiQOUviRy5OKafugNA4T8yGPMwuMPpdB46tL3
	 62moR3bJUUQ2zygwvMYHTN1RCbf1x4GLRPyoZdKYFceDy94h6P85XXSoFh2aXJjxZZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l+hkzwCpvpQgrUCpeG4tt9OeGdPww69ynoVOKpj/83A=;
	b=eT/LAzyWYV4ydETyPvdulxkE+9xLKN2JKFZrDxCPXWdSiV9H1u5WKaeSp2fdTzx0uLw1
	 yBd2R3SaSxKAatn5vUAkXmcA2i7pHs8PcBekFh/x81db+Y6AIamXdKBOLibCf219dxmXX
	 wlwMxXQjfGPmQGNhJQ9ds6D/b1z8VqreAzoQXpccd33YZY23Nx07ked4nf/3jgOKm9wT0
	 qh2k5aY83lfNeo4TocXMbYtpEpI17u1I3nWH5U4PadY3Q+/u/FUOV7hGS1v6TaPgM8T9n
	 FkxEcZFYEzfXkDS7tD4MtAewW3ipsKT8EPk7dJCkKurjHqcopZlrbDlxMdwLjCQXPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1O5o+j+;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128B606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0128B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1O5o+j+
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso696212b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793521048; x=1794125848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+hkzwCpvpQgrUCpeG4tt9OeGdPww69ynoVOKpj/83A=;
        b=r1O5o+j+DhaI1igvj1ETrTNrpYZ4cW7jYwzRRdbtVjVWvaxG4RWlyY/0yxooMG6oTM
         GhBDtLjgO14j1yftZzCs7YZ+HAlbiKgM3P3rqT9J376HwsADT6SCjVzOQXqFRRk4s8mm
         uj0Pj2m+g2/VdMprvzlKdSo+V8fGXPY8aVXSyghBHBje+0X3+oMZfquTdCMesEK5H98l
         SRiiWtYUoHKSZKwQCgc3M0WxmwYWnj38TiBcxOPN7v6XyVXIEiXci/Esr31TMYUnVBYx
         AoFyn9XAZt+5Al8DUvymg5xtNNNtZf2WWAjGPCTqMYmNoLPFzGxvf7bjLnv2gw0frPaH
         8M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793521048; x=1794125848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+hkzwCpvpQgrUCpeG4tt9OeGdPww69ynoVOKpj/83A=;
        b=X5DDZ5oekX7Cm3iiec8sP0FXjQ7l0C1mzDSyojkkGG6TObirjv+dTRk9MQqqYRAbln
         iuYj7MiSJhTYxRVo7RcwBgOs/QZw4uDf3ahd3eWjjqzVZk45Q2JF8MuF4GhQf4kxi6aa
         K74Vfb6GDvSn/wz5p1nSALg7KdlZuZRxRy/qYFEXzHZpxz75uDDoMPuTPvxzVKldBKiQ
         P+PdER6EwcEf+sE+UdRpLeHflIY4hqoMvrQajkcc2uknucW0Jv7grBA+OGfmql9Xak3U
         /dcB+jdf3ote2BtFMFgZgbxh2EfN03sPHD2bdKnDw4NpWxvXZnsFOaKtqEg5v9K5nLNA
         jofQ==
X-Gm-Message-State: AFq9FYJmFzrXki9r7plSyY14sVc5YWfsMh4g5Amf/8XBIRlvgwMvwkdE
	DmeCYsRT+TDI/Cw2qXRG4ApXV5Vaj6TBqcUFSVZMVi2vUCCeC1P7p6yaucmfAbYO+Ns=
X-Gm-Gg: AYBFou2JhMkkktl9NPUjhXGr6Hg6rEcc1l54OPEIR+BWxYTNdPe0TEb25yS66EjmEFC
	Bamzha80M4jNIKVyw0/Iq9ViAH2uDfiK+5faLX05NjY6wFoPRHPm9M/n2vn8kX/pKICzO8OsqHv
	x1pzUAgReF7cEKOf2du5yuwfQo/ffzbgwCF1D3o0zWNqPP4TFuLMMz+o4TwWsjBRSUAMoRatRcn
	5Zlhkii4BM3pIXTSriX9b0r6ngLHxXCTD8eKF0NUkGscXKk7KqUmXoSQiWCGWtEj5J3lHpiX5QR
	/qZejHbZCUH8qHSgZqnwcy37oxqBk4QboNiNXQj6cDm4myyHjacJiaFX2fMy56K8GzhT2a3Gfrp
	4Ng+6S1NR7YliFw1y3W+RDuECexYdkMCcSnLYxA03LVAn5n2aNu6JG9/Jwf8qGbblRtv2gSJgBF
	ZHIJvptAjPf5gjCYODOtOCCPcYbepyaG7qXBWTszEkBWf42JYz2swsYdEYZd+1mww96enLv/SAa
	5vrtAUejd9023KcGscCs0isvh5nzbYAEksh5ffJa8KZ6L6c0FRIaMeF7w0Swgv6O7U+RPVRbnsx
	ww79EBY2T9lpUXbwuiyw4INhsqA9luQHq6oeVC4YE+uG2/9u9b+EMXlWPwbdKFCgtD+vFmMzkbk
	ZUC6vBzSyTZ8me90lSMOyans=
X-Received: by 2002:a05:6a00:2e21:b0:8a0:20e0:b131 with SMTP id d2e1a72fcca58-8a9be490997mr5082579b3a.19.1793521048212;
        Sun, 01 Nov 2026 01:17:28 -0700 (PDT)
Received: from LDYT9Q2G2M ([2a09:bac5:cad2:3228::4ff:28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d067cesm1104467b3a.29.2026.11.01.01.17.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 01:17:26 -0700 (PDT)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Finke Lennart <lfinke@student.ethz.ch>,
	netfilter-devel@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Subject: Re: [PATCH] lib/ts_fsm: preserve token types when exporting patterns
Date: Sun,  1 Nov 2026 16:17:19 +0800
Message-ID: <20261101081719.51784-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031202211.22f18bca7819dbe2d107d17d@linux-foundation.org>
References: <20261031202211.22f18bca7819dbe2d107d17d@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

> The main user of textsearch appears to be netfilter, so please let's
> keep the relevant developers in the loop.

Thanks for bringing them in. The affected userspace export path I verified
is tc's text ematch in net/sched/em_text.c. I have also copied the tc
maintainers and netdev. xt_string retains its original pattern, so I am
not claiming an iptables-save/restore regression.

> Zhiqi, a thing which is missing from the changelog, and it's really
> important, is a description of the userspace-visible runtime effects of
> the bug.

Agreed; the changelog should have explained the tc consequence directly.
I have added it for v2. There is a runtime effect: restoring an FSM text
ematch from its rtnetlink dump can change which packets match, or return
EINVAL when an exported character-class mask is not a valid token type.

The additional automated test uses a tc basic filter on loopback in an
isolated ARM64 QEMU guest, a DIGIT/MULTI token, and four-byte UDP payloads.
The original rule matches "7777" and rejects "AAAA". Before the fix, a rule
recreated from its dump matches both; after the fix it still rejects
"AAAA". This is measured with the classifier's evaluated/matched counters.
A PRINT/MULTI rule also fails restoration with EINVAL before the fix and
restores successfully afterwards.

> once the issue is out there, LLM-using bad actors might be able to find
> ways of exploiting the bug, so please discuss that aspect also.

The trigger is reuse of an affected exported pattern when configuring a
rule; dumping alone does not change the running rule. Creating/restoring
the rule requires CAP_NET_ADMIN in the relevant network namespace. Where
matching selects a filtering action, changed matches can make the restored
policy differ from the administrator's intent. The tests establish the
matching error, not a privilege escalation or memory-corruption exploit.
I have not established a production deployment or a wider exploit path.
The test source and detailed logs are available if useful.

> : Related finding: BM/KMP also export transformed patterns. With
> : TS_IGNORECASE, repeated folding of 0xff changes it again

Thanks for the pointer. I have kept that separate from this FSM series;
I have not independently validated that additional finding.

> : One small test improvement: after copying the exported pattern, add
> : KUNIT_EXPECT_MEMEQ(test, exported, pattern, len).

Added. The updated suite fails 13/15 tests before the fix and passes 15/15
after it on ARM64 GCC, with 15/15 also passing on ARM32 GCC and ARM64 Clang.

> And I'm thinking that a cc:stable is justified here.

Added to the fix. I split the fix and KUnit coverage into two patches so
the small production change can be backported independently. The matcher
change itself is unchanged from v1. I am sending v2 as a separate series
with the v1 and review links.

The additional v2 tests and revised text were prepared with OpenAI Codex;
the recorded automated runs were driven by Codex.

Thanks,
Zhiqi
