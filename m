Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BF143B3C2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786845; cv=none; b=AshymDI66dJF55JJjnIsIIfwEBn7AwZSTpoCOc75K9bJEy4tUJf9n6VCW7d92miw3Kijevv4U2qUqu/qauh3fWF5xIvivbDH8OO6u05m5t3s3j2Qk9jjdAteqGf5Qn/ZxAV4PpsKp/iuyLvYp0D45toBgk2oEX3co61O0AvBLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786845; c=relaxed/simple;
	bh=U/K1TM87MGaUzxHbH+OVtkemYc8EIpNWLBeSJAGJLME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTxsrKit1IUgv5qveWH7jQ7zxlFfvwYzPGFlwVLn9V7HzvKb4jAP3P4vlFPb9sfLvzYN5wNP6JTY0mUbDugbwtXF/xX+eUNPFkBar27i8FDgIxvJZ+T71DRUEIBy+p1c9d+QIB3xW5MldVIbw+gX4DlfA7LF8CPTADZ+EynG6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZLtAFyE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZLtAFyE"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-851cbd64814so1289067b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786837; x=1789391637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4AAG40LTRoPDYyIeHaDyg92sdqewT/vjBha2Pue4bw=;
        b=AZLtAFyEIdS4OD5Qt33sr6ZY68xHorzRrOKjJIXF5v8/zo2iyvGrgJg5PVANsj5GXf
         TOPazGQrfu8lAVfYb8+Qeg5iKHT+FcNoA5SE5NO1tOP71aUkLDYWzSwPfZQbm6LLtTQa
         x8yT9jh+xE/f0BF8Gn2Sl8N4W8i4SifTs4UlIMig7BdqIrBq3NU5l5ca8uVw8lbItAYt
         Isu6svNlNKZwaryqE8Bp60AabsO3NLaCbP6da8WZ/PrLqtTMj+LAWxknb2+hwYfH68D+
         cnv4iku7fk/oAKRmMnfSQCt4xS3q3JalzhP5kKu03RATbp41wZx/fsrOR8wYpFRUvrBc
         gDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786837; x=1789391637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4AAG40LTRoPDYyIeHaDyg92sdqewT/vjBha2Pue4bw=;
        b=rSnSNtv+Sb5uKSSvfaC/EZmI1uluCgrLP5+FcMN4lxWRmpS3TIasN8i3/iaKrcjeO1
         6vI/tu0CXRd/VycGmMlWqzbTdhN/eX1gggrlypKUVQffk2W8xq+E299cWtcyEJpZjdxn
         xofxLgPMX7BYAmXbD5OoKMx0TElABqgFEiMH0Q5oVmYYPQ9lZk26vpMWzhdcK4evDRGI
         GQ7fmbiQHj5f2+8m+sSZNF7/NFbA7yf6xTufiMhM6SIOoVslyYJn5xi/epj1wiCiubhQ
         p/Slt0JZfInRqjHHfMbX/1vL1SyuIdoVTFzUecIwNqYzn/L9Q/ywUi4zGZv3O1sud6V2
         h53g==
X-Forwarded-Encrypted: i=1; AKwUvBzkJiTGb/sZymP2DXUcQ9crwmfkX/6jQ5ygNbjSuqeRdIotX1FTsKKBzskpEPOtKVa06iNfoC/hix4dcoo=@vger.kernel.org
X-Gm-Message-State: AFuF++msUqkmlpJEqjHPKSTJGkWwRwJQ6RI6LFauFv1xgnek4YygevDu
	SHxmTUEyUmAmwL37VYAm8vIRFeasmMKgNefqtyhyd4rHVjBNexMDhTQ=
X-Gm-Gg: AYBFou100Nds66rxl1IEWbzx5EwnQHkvEsf6LoVKWZsAIMP/t9px2v9foDqyEmyfl5X
	AB2ZQndg3QLYA6xeS0ylU5Sx5REouPc1mSQrS9ekApg6qtyIhlwWHwlp9zw+C6kf4Ie77PCwLF9
	SLF86LbjA6niVXR5Q9i51LhlnMKH18AZVEz4cbAGJupF7reCnhIruf8E2KS8/ScDrpDWfhGDf/W
	4VPgHZeVImbGdMJr3gFqBPjhPTfSAvve0y4/H52Dd1OUU1pw6LX3I2Y3kTKwE7GAKC4x/LBBr2D
	+beGXTdIaTwlBUx1RfCm38Z1BV3TKLNQz6CQpZlEIC5P/h7aTg6S1vz1qFbdP1eZDyo2fE164RL
	f5EBIY3vo1f6W1Dc3HjYrGXubuOL4vrt5hpCQPphznTqDK/13miuQD5Lsmq3hpvpRfCI7lIeNwE
	uER6QXjiY3wmlVORpM+EGgncAa9r5PCbyh/2jqbF5FMKDQFhv57uGrQstcB9///sWa6HjLu9r+E
	8XVboipeEOSk4wm
X-Received: by 2002:a05:6a00:8015:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-8616b26f4a8mr32915798b3a.13.1788786836830;
        Mon, 07 Sep 2026 06:13:56 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac30sm4343157b3a.56.2026.09.07.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:13:56 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH 1/2] tracing: hist: take the reference before publishing the named trigger
Date: Mon,  7 Sep 2026 22:13:51 +0900
Message-ID: <20260907131351.613525-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907125934.5C6261F00A3E@smtp.kernel.org>
References: <20260907124420.607097-2-donggeunyoo.kernel@gmail.com> <20260907125934.5C6261F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 12:59:33PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but does this fix leave another
> identical use-after-free and memory leak reachable from tracefs?
>
> If trigger registration fails in hist_register_trigger() after this .init()
> function succeeds, the error propagates up without undoing it:

Yes, and that one is already fixed. tracing_set_clock() is the only step
in hist_register_trigger() that can fail after cmd_ops->init(), and this:

  https://lore.kernel.org/linux-trace-kernel/20260907091415.554535-1-donggeunyoo.kernel@gmail.com/

moves it above the init, so nothing which can fail runs after the trigger
is published. This series is based on v7.3-rc2, without that patch.

> [Severity: Medium]
> This is a pre-existing issue, but does ignoring the return value of
> save_named_trigger() break histogram sharing?

Yes. On a kstrdup() failure the trigger keeps running with data->name
NULL and off the list, so find_named_trigger() cannot see it, a later
trigger of the same name builds its own map instead of sharing, and
pause_named_trigger() misses it.

Memory safety is not affected. trigger_data_alloc() runs
INIT_LIST_HEAD(&trigger_data->named_list), so the unconditional
del_named_trigger() in event_hist_trigger_named_free() deletes a
self-linked entry and kfree()s a NULL name.

Not addressed by this series.
