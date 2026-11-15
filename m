Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794718355;
	b=yae2589o8YXVu86rPBIueAsuqoQs19g4eMkIxnG0p006+x2beU/P5jL+l2AEbIFzE8R8
	 XiUD7vCKgPrx53nj3SKwpP55VybFYr5y2TU+sS74wJUOfqIgGL34CoSJTVDyL/pl0jX/w
	 WX0kW8bId+n6l099Sj6PRAyt3g4JAd5mvPZ80v37rprXXVGDVRkEhwvqcKnc6c0mNaCEe
	 LKp22KkB9iwhkG0rxGqpZ+Dx6bJ3Wez/JVxgC3a1V7L8AajY+BW63kfNqNNtjyA+obx7e
	 Thc3tfQwEMiXF+mKMFwZ3nqUJKA75HNTMcFZ5V9bvRvsnlolFKGftJ2oPYkx5ukKqJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=H4OYy3kGcHQe3q8wy+eXpmSYEjj417UWrJWf6YCRFCQ=;
	b=v1YbaXo8hW65SA8qd5/m7tCc5D2d58eoby7Ps0gPzLxbUuIospe1BTBZl/hB8AnxCkJj
	 II3+dzsu7JHzauoWQ04NsgQ6VMd6VZRge69JHBpepyZNyYqIJEHqg3N1ErGcSTftuD9Km
	 I6v5tKVqU40ZQy8WFcuuLq7eU2rU1og5ct/8KQ10NzQDCuTp42ZPeqJ+P1GrZLGopaHtk
	 LaInFu+ervmTBh+m7ie7mydK5LMbJ9asnu7HNH3E9yUFHf0p5qBnVtVCwiSSaZcOHYWZV
	 DLZZVU8ho+QQx1z6cQOz1yKpIIquXGtby9o3+hiF7lmSl0fqM1ZbKnbZuqULfbcz5hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=N5ZoctSu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9766E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=N5ZoctSu
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c0bd676eeso1777991d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:52:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794718353; cv=none;
        d=google.com; s=arc-20260327;
        b=lym6Ty0u7YjU83KzPNUSDtMPYnfhSOrkMzmICW/2uVeJZkkbRjhBrgHygzvwomXJCd
         5EE41RrOmdMiJoF/K6QGD2hiJfjQkUCB2th3j8QG0CNIXP3OzYuOPhyfYmVlLfe+uQxo
         P3PTQn5776EgQYecMPThSD5cCEo0ZiC6RarFM2ZqsTo3et1hNw4qzmMhqeigXsHBBOIw
         8dP9uIek9r19j1cfP3RcFgg3Gk5/bryHOv6SX9yYSN/JK7kykUiJKyNKJ7nRyU7I1cHx
         Vr1Jy8u0UBdTZWsk6FahwEiCTcRQp8kJXskL3aBAo97amwuOCoYQrty1HRBRniuNro3E
         ZBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H4OYy3kGcHQe3q8wy+eXpmSYEjj417UWrJWf6YCRFCQ=;
        fh=ynRfv9oLaNy9Sz/X1LzmBrarz2pTCXCVxOd0Y7eJzjQ=;
        b=DSH/6oS1z6mmQt4wxz0WHX0XU7fwKjSt/BxSQJJhp87RP+KIC+YhXCpjDWuwU0Xy3X
         xaRgtLnTDp7XQ9eeG7GLIcshiKdxG0HJGIyfXheJrejffgAnn9U3gW9Rbpu+OLgDEBTw
         fHYlkfIZvfK5MznbTLVXrN044GbOiXI5lRpC4vqm3sIvn6pC5l5XnYa6vkgmNF3W1Egv
         KC//sDxnPXRAzMqISeQ4erSkTMm0B5E/IP5jaAj7B9xXCSCGWdvZO5V/YPkAgAd5i5Db
         O0cIC7nER0IUTh9hr6n50kAnC2fmxhdYaHI5jLEtiXKa8/+KOXr6N9826xcvFmlSDG7h
         abjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1794718353; x=1795323153; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4OYy3kGcHQe3q8wy+eXpmSYEjj417UWrJWf6YCRFCQ=;
        b=N5ZoctSuX9R+wQdRPkBJLINCVEYk9LECs4v2PTcPW4KCVOAIqj/zO2cyoQtbz3ZqCk
         g4t4hXNwd2mcDU34s5C2dOEntwah15iOTRyJK+kWdtLqcQyervpAsZvnxi/7Fgnll/v/
         xIPF3jccDm+uW/F1zJMXWnJmNucRH+JT7TmP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794718353; x=1795323153;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H4OYy3kGcHQe3q8wy+eXpmSYEjj417UWrJWf6YCRFCQ=;
        b=F4AWy9DbmZFBmQC35eCykKHv6LBDuzDL+llvIqcdqhisBiqKEihn1ophAPkyPcbX5f
         uGWYnvP+844g3ZqFOAsD5Fg26dOSl34OP3KicWIahbBB25RUCWC0ZFiO52vAdL83APD6
         shYLrqSZIrbYKBMw32koQUVvEcOfk+br9H7S/a7WyppVT3YUAL3yGoj4yRqgKKuCkLjN
         bZytKmdSrwTVnR7zcdFH9LMk5oVy4Kqo3+52nOuBWyh7yiAg4LXPOSKc4/D6j02CB5AH
         DecEq0lhyIZK37oNBzD/Z93qmbDHBN54byXmurhHTkoRaF5wgmgMG1pX8bAGHYV2TJ0X
         LIew==
X-Forwarded-Encrypted: i=1; AL+hErHU82z2q0mid2CaNLtYBm7eb3rs/JAKCTovpEhb1OTGoqIeSkWiOyy/x4t7Ty+DvJ1GNPAWy5hGFShhNT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qy7/9VRC/JVqSMqvf1UoZBF0YLvFFHn6aNILPQBFMMlvQmcAp
	MSXA7GlQ1V4bJfPobeRVi+D6f/WtzDfUXTOqc9flyUxK/K7MoROS3HjTnkQfogLVFhtMVbz23dX
	chqNbW/U2r1sKOkYSkdA9NRzh7JKoxVKDU8EhoGReSA==
X-Gm-Gg: AYBFou3pWSYxpQo/fpb4mhpWEdRN7j41Sbdlct3wUDekGzFCsKDXsgqe5ghBexrAXLP
	g5B4JEXT73Rqm1miz12yw1cH+bz/klQLxmyHnX5BKJEXL+9CAHDrrtgFfMTMyOLlYurW56l4iN3
	oe2wa4W6bIb2MR9ncHtURRZf8ZBatLpWC3Qo/CxoZzGLP5O8feX9u1k9gbYtVyjEB0VUpx+A7cq
	iUVQrP6tyaWizZDxQZMqyZ9Xeuz1FQV17i0xrk1iADjsaSIwelqgItMPVAy4SIDUDT362RX1JWq
	DK3PYu3MSZINL04GjepuVhATgA2JRHcQRXe94xvfz5It0vTMOyumWy0hO01O1gpII0c0XKTten5
	0EP+xBhPFO6lF0lIDIi9hMbpOMc2M7ZInrrtrPPocQYj9YbFTCDhuQ80BClfFWIX+ySMBvA==
X-Received: by 2002:a05:690c:6b12:b0:8b4:d1d3:3729 with SMTP id
 00721157ae682-8b4d1d34297mr3204737b3.59.1794718353336; Sat, 14 Nov 2026
 20:52:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-perf-symbol-memory-send-v6-0-7e90415f0101@uber.com>
 <20261028-perf-symbol-memory-send-v6-4-7e90415f0101@uber.com>
 <CAP-5=fU9Du9cCge2aTm10ejtwBKX1THQpm=h7EMR=WVQLww6DA@mail.gmail.com>
 <auacxQZKtlFa9Pc3@z2> <CA+w=M=S-H4d_-KCZJqdPoUCyfYtNDsKLd8t37kT134bwpKD7qw@mail.gmail.com>
 <avkrTBAE08wB5Qy1@z2>
In-Reply-To: <avkrTBAE08wB5Qy1@z2>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sat, 14 Nov 2026 20:52:15 -0800
X-Gm-Features: Aa3M54rO03zK-6zPMH9aB-pRaLogW0cwWWxarWSNqRtSpROzp42K86ZauPMHxmo
Message-ID: <CA+w=M=Qxu_-kKkax5HkJoJXnivNTHqfpNt7qT9UKUATsCFLK+w@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] perf script: Add --lazy-load-symbols to load
 symbol names lazily
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 7:47 PM Namhyung Kim <namhyung@kernel.org> wrote:
>
> We have struct dso_id to identify the binary.  The build-ID is the
> preferred method to check it.

Good point, I'll use the build-ID from dso_id for this check in v8.


Thanks,
Alireza
