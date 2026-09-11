Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDB395AE4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084832; cv=none; b=YbetBc/jGP0IJZTCA7ia56gRBvxZgzbGjKe+vxbYo3JwMYU57lL1By85M8+mCYQCPrN93RQxnNRkB+lydO2kycKs6PAyI2WKlhJAKTAxLPPAVnFjzeWdxnKUR+x/C3hNlG2SmD1x6GmTLylCw9+8e8lnW9sMUvztjY2f2pHRcj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084832; c=relaxed/simple;
	bh=3KUR6t0AsaA9SjJf1itJV4UsWyIfNCivzbPZHr57FsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TD4wAVEVlUP1xQuUwlJWHeHhLlYAAXYkQxb4gh36ACNKjiiju9lURev6puwwgYDhdEJsVsMAKErQl+QN32NRjwP6+UlxbtSEG58sergMRJ0YkFBd8MFOlJ9rW1ikzeBaeiDuVfoTsxeR28j67DOK/iRPLP19MsDxKHLRvFQYLmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO/P/XDi; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO/P/XDi"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-382ef647e20so412896a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789084831; x=1789689631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KUR6t0AsaA9SjJf1itJV4UsWyIfNCivzbPZHr57FsY=;
        b=iO/P/XDi6qxstUTQt/4dgRlxuRcfLpsIyXNExMyAjXtsGlOrfd6JYNtR9CXFq0pFnk
         Jgs9lEl8jJzmfI6mDnjRAuqGNwKIyxBf2MrtOoHqsCu2rBT9TWyunv8J57Zjj6EculoR
         20cxu7oDlbf4v64N7lOYBlEFKQV3jvAquqR7u61GiOWTJsubQSdWs2k/KfwOAa+XALRA
         qavZHk+QzCgOVKcjNm2JREtlD4eVw5YUdFeh/LThHW4nBVSrFYMM8QtSRLrHY3YcT26K
         XYNpKKplV6afHO0e8NHD01mIdLjaiMJ7wEvnkrnUUr+S8P6U+Xnh/FFg2qpRLiaJQwuU
         RCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084831; x=1789689631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KUR6t0AsaA9SjJf1itJV4UsWyIfNCivzbPZHr57FsY=;
        b=kVrytBUrN5AFMxORZbsf9RFB2e4A7frzCUssJQktK5oOPCy7gDjmM2Lr/yl44e4LXe
         FyMH+FRmklGQdt2DDFF6RJ4kRdDHAUpXTFrAHRiHiqqPlU6rYfo5UjS7az2+g0pfJhye
         Qyyy9hxF/jIXCkjwd9iAleKwP/cynT8k7uf+S6kVt+UgtOlvjq7lizhH/yWsWJoJz1Q6
         u5UtPyLSrhyXuzOWC6hHxoTTl0NX5O9f0BdzqMZuTck3ZnkNAQ/XyFtWOr0+u3bifIdF
         32xzrcW+dDMAdjsQjkDPu9+6otJdBSm4Dtj+iApiBp6ARZs8n2uBp/l+poJzTjwQmRs0
         nIKA==
X-Forwarded-Encrypted: i=1; AKwUvBwFIygmsmoXTTyhSWTrbHdBqy98w1pvLXWDAvzIAZaPheoIVbtGzk/bDotEMm1AHANiLb74wGJshW2feIU=@vger.kernel.org
X-Gm-Message-State: AFuF++nmmEf+0UMB/NBMan9RIBPC/EB5rJCNJ0VRATPRoRyLbkvqnvQK
	pjVKbvjPWV5QsN13XeeRol9kcZcmkKY4ANXqbz3ebRO4znweiL3Lj+ju
X-Gm-Gg: AYBFou0LM5rvOUIF1VmfdADoP6/Ysgnh7HA8uo3Pznxio/7m/c0piUoNBgq/2AsxoiX
	OlxkQwUm51toRcoo5CjvYpOoFSkcE/nc//ml42cWMxhUz5798kYj/aATCM1Ldxn4bY2vYZD2k+Y
	fGOAtUHThdf33FBobUmlKmrPLQDapDJcAxRFjhBIqxvd1Ty7uNYAyB1KcaZQaaIWcaGE4BOSlR/
	YJqPchlRHXszavG/Eg4wepcqoTZBKkmHAMQ7J6s2gReADPvwR+hdUPKmTnKGbzBvS+S0fIMr/Hi
	53sQCupSwoC/tdqNBZpjsg2O5nudc74Qa3N+k+3KedJbXHUAH25FOT5V79DUPSNOUuvRTM9eb0N
	PTB7JdNgujson7JFd9gJ5FNmpyQ4eIYMtzv57hz9PCIs3Wl5wjMKgM2tpdFQziQ4b4Kse6yFNpP
	6LP8HC9shVX4mzA2JzU+s4z9Fimlh8nkH2KwTsI/NFAN6Ql9nkRTapLEfDfAF9ly4FENRASnJZZ
	YTkFrwaWsP0specrnyz1WKnKmiqnIbTYKxp3FZarqmWO7rYuYMWEdk=
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr2133451a91.20.1789084830361;
        Thu, 10 Sep 2026 17:00:30 -0700 (PDT)
Received: from lima-xfs.. (174-126-236-85.cpe.sparklight.net. [174.126.236.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d8cd962sm221097a91.2.2026.09.10.17.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:00:29 -0700 (PDT)
From: Eric Peterson <linuxinstalled@gmail.com>
To: Eric Sandeen <sandeen@sandeen.net>,
	linux-xfs@vger.kernel.org
Cc: Carlos Maiolino <cem@kernel.org>,
	Dave Chinner <dgc@kernel.org>,
	linux-kernel@vger.kernel.org,
	eric.peterson@hpe.com,
	Eric Peterson <linuxinstalled@gmail.com>
Subject: Re: [PATCH] xfs: add per-mount read/write I/O completion counters
Date: Thu, 10 Sep 2026 18:00:02 -0600
Message-Id: <20260911000002.4089325-1-linuxinstalled@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1c5bebcd-76f5-407f-b3af-a6170fff2497@sandeen.net>
References: <20260828033429.4070267-1-linuxinstalled@gmail.com> <1c5bebcd-76f5-407f-b3af-a6170fff2497@sandeen.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eric,

I have an application that sends IO through several different layers.
In my case:
Ethernet adapter -> NFS -> XFS -> Block device -> SSD

I already have visibility of qdepth/RT and IOPS at the ethernet
adapter, block dev, and SSD, but I'm missing information about what is
going on in the middle.

I wanted a "light touch" way of measuring what is going on in the middle
so that I could have hard data about the performance impact of my
changes.
As part of that "light touch", I wanted to avoid a method that would
artificially inflate metrics due to the increased load from
instrumentation.
In addition, my approach was to follow the existing code structure of
counters that were already present.

Regarding Dave's points about edge cases he illustrated, I am in
agreement with them on the technical basis.
If precision is decided to be more important than overhead, then this is
not the right course of action.
However, I disagree that the edge cases make this a "useless" way of
taking measurements.
As I shared, there are still several applications that would benefit
from this.

Regarding whether these counters get merged or not, I already have them
present in my kernel builds.
My personal needs are met.
I chose to submit a patch because I believed others could also find
benefit from them.
If the cost of the stat was cheap enough, and given the right
understanding of the caveats of this method, it was worth sharing.

-Other Eric
