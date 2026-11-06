Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794003751;
	b=S7nDylJ/g1eU9UA7/yLM7v1sIp6pNngvfre7LUyuNWz8D5IZoMjyg/XsJg+e9uztJzpl
	 dZ5Ak9cjMcqSZBhEtBYnqrXuQR37XsTDdXbeABJTaY3nbg0II41adisqQNH45iFY27OZJ
	 wcddXX9z8Ea/JZjgafv0q0fup33h3IraVEu78Iw6oKuVstV/+C8GQbwk5CrXRQxibpLW1
	 s7erhkW9mCLRa+cc1tpDJ1aTdApjpLzJUgLja0Fh38zAo88EZAYU5YKmhW0uYlLGbdzKS
	 tqiApdaaVFeOHwlaVuwFoIIwt3scZCfAe6nce0RRjpUdCphV3g4UVHa03D0SBT2NeWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FQ/cFlG3xWdEnQr8IGd7fdJaX0rgjv3jYzHWnWHzP/U=;
	b=3yA808fqkzGbaz/xMDQDCLMzMKsmIJfnUuXNS5T9Z7wevMBxyoOeB5y2fWQZrh2gXdpQ
	 mNtYCKs3zn5gYrIEGZx2bGxE8+ecbPgVQa2kzUcktl1NJ4rTC/fj+IyzuQPzmeCuM76eR
	 qIirwoEzk6SiYWv3GMY3EZBMGWDfTuDpFQ0cCgbpYkzw85GRyyiL0CvaXhXrGm6KxxYvE
	 +v4Z+ZQpYp3iCu1md3dDptnrN+FyV+Rit7yT0DvnQe8mSXD8bJBQFdTVfYv4Z8uN56zd4
	 1I3/nJZhTwI1GXGIXjH9/3Wm/g8YP7cGakiVuqEclDINi+ehirVSgq5WqJSOvAKh8GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPyt+i3d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B35B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPyt+i3d
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b28d9537bcso103687b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:22:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794003750; cv=none;
        d=google.com; s=arc-20260327;
        b=gBar+sFd9CeoRb1X2qSO/FkghjS4VFEwAUEpkDZZJCS+awoslvzktKXUnXrgGD1jKp
         rtT5yqMjqf5A1ga8g6pfY6YqU2yURHZEFdebtsx6Y/uzWGzQ4TJH2mICXECtuQQfqUYG
         yBy8HVN3CPbnRvyxm/Zs9CsDaMzNMthXGDMVrOFqgVwphooQYrPfbdv/l8WFrf6QWTHI
         6L7/Kke1tMATOMSOFCRxlGsDbH0Hw4FvjNbQ1nHS4Tg/Na15qEs2cL6ofywS/RD/LbEa
         GmqHQHWeVj1pwX3Ac9EHuXoDYiuZAFVmfOqQ5oxxO0zKP1K2sWpWj9nTCy/LuifHbVH2
         N2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FQ/cFlG3xWdEnQr8IGd7fdJaX0rgjv3jYzHWnWHzP/U=;
        fh=fyB6Wz2iRkOJPV0N9i/Y+dTHozpTecKBfFHMAHELC3c=;
        b=DW+aSoH/WFeeQRWwOZK+YUDKL2ALKAYW7wLoj9pHIeZrFAIHRRi9a8cWZoPuMBSBsN
         AVOY9ja2y7qSO4CXZHqYQKdR8O9h4Wvjq6wFzDsN3bbIyuJ1vwlF+BzZuIRptry0IBY9
         acuj+Pfa5R8RvMw8ROpqv6eScVRT9FhXupfG39DwFVyDYmt/wGwu43RxoleR1EkJGjP8
         bfTRPPSQx21j3kU1dk7X4sy9GmAsBnSK6YyLVqLvKl/hEyS+GzB10GukMXwGXrA8cmrm
         IVtwsDvJ2XKOh9uMxeNnZ0Vv66CN0oBXOWGRBHmLBY8BYW1Ezt6y4XVv5SrVvqN1TwUO
         bBCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794003750; x=1794608550; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ/cFlG3xWdEnQr8IGd7fdJaX0rgjv3jYzHWnWHzP/U=;
        b=cPyt+i3d95+KCeQQkOH8F2rDwgzTTfJHa/LbAjB9yasv9CzJ4zC/3OK589tpx8JtfR
         MeA0VXlDYyh43VNR/VlvoSt6nkPIKqEFFaJVQY+/UvcaCkzf8hd3oHPbgmjkimjnS9Nm
         1WYuMUgP5Rgy3nQLo+Jap9gUD0nQAbCZiNC3XPhFFTS2OjD60vbUFT99fK6Zi1V4aN5t
         wNVcja6zVclHdwENvR4xakimgq1AmYbgb3znnVStoD/Y1GVMaGpvml5UQj2b7gI5yX5m
         LNi4vDQBxiiBhLNmld01+CSNfO1DpyfkwvgspJL4lsmo+pXddu7wrLQ1Z7PFl4YhDMrl
         fuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003750; x=1794608550;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FQ/cFlG3xWdEnQr8IGd7fdJaX0rgjv3jYzHWnWHzP/U=;
        b=1PfCqH1RuyDcmJvCmBOvSH44xrBlXYxkFo7/q/43+nwGWuutdN4g77HjaY7+fBFFqp
         iNytPjG2R/Rb2+Mm7FK5QQJppCh/HEVeaU9bHxW9lFMOaRZD4KHUPZ9hby69Af3ZdrQd
         EP/0d/U2vwZ3XkcFCM1nQA0fQBf0a+v5jklxWVnJSrcEQQGrNh+HSffdJ2Ki+EXDTQv4
         /iPQTyXJ7D/Zd8YTbiwvvLWPmO9o7oc66iWsKWsaThNkJNe942DVeO7zbhvc6xxJXYL0
         VbGM1sggZaIJvWnj8XfwpvBsJim/mxOD0WN4NfubwVH44EERebiRas2+NIVDUMiDcNPZ
         kXKg==
X-Forwarded-Encrypted: i=1; AKwUvBwLTSHomzQtqwAsTsTdWFGhZNdwys0ev/MFEhxTklgYrvWPHhbTeeZs20eIPjCft/eIPgyEWOB89PEzm48=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rB08bQt1ux4JHOoKB1MeLKPd9GL4wYQdUmdwMbm58S/tT4QL1
	cIql+HJjDrc+qdg4d2G78ZlRGV0aR1+7VCE69GAG2zjsYUYf7kd0jCTKfqfTmRH6cH5UcyiHJ4h
	RLD8mpAf2Vm9ZgNYYXfNyz1jxUjOKd6g=
X-Gm-Gg: AYBFou2zwErbJCuk/Md+FU/8SqbT3PmT4v5lnIVC9cB+SahBBhgeno1K0XhixFbpU4c
	mASqivPJmmOBc4rGfVb7mmb4QSJtlCKfXtCy6cfc+/ZKImqWqhovzysZDW87P0chZcHVTWqAzDG
	hNo5Zi4N2lT2ggSlNFPH50JzBNDRnxgz9/rzlE9qX7O9mT6gtnzIYksw8ze8wu3ljoB+jjERRVg
	vPHSd9jV4yqWzd9TTtGqCulFeUAf0xiezeHvFN4UCjrQ/9POgbBUe6aNSC4zZc4ixffZSxjFDcZ
	ArUSwbDilC4R9ThuMNXLeKMNAN2KCwDL1p4ZOZxcwrGSiKUhb0gEqy3rVnMWu7nTPaaQikenYGn
	oMj05LFHN0dZ9mfkyfgQXfV8xQ+tysLOiik3QuwfGdhRromPP24NgiO+d2KPnYh3ermWUTkpusD
	ZmPgZrVNFZKXr8V587PQ==
X-Received: by 2002:a05:6808:2f0f:b0:4f5:214:fb96 with SMTP id
 5614622812f47-567fd5bde12mr191162b6e.42.1794003750060; Fri, 06 Nov 2026
 14:22:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004-ftrace-mod-bsearch-v2-0-c1de73e72e73@gmail.com>
 <20261004-ftrace-mod-bsearch-v2-2-c1de73e72e73@gmail.com> <CALr3rD93RT_=w8VB6aKfuV5crbwXK4Tffq9bLD=eJBj07Tv1=A@mail.gmail.com>
 <20261106111154.0e09925f@gandalf.local.home>
In-Reply-To: <20261106111154.0e09925f@gandalf.local.home>
From: Mitch Hen Chez <mitch9654@gmail.com>
Date: Fri, 6 Nov 2026 23:22:18 +0100
X-Gm-Features: AclHuK-7xQ6612mfqm3wxXygc4s6PKZhQY2O295ToyoiA417T-cVE2TxsGyvghM
Message-ID: <CALr3rD-A037pOODDLMsOcFwFbQm2d=xna1sW3KMRJtnv41raYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ftrace: Drop weak function locations of modules
 when loading them
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ah, thanks for clarifying, I appreciate it :)
