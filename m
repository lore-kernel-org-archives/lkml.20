Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18E356775
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795816; cv=none; b=HROw+BnDKVsOKkrQlX+g132XOifNKA5QeUUGjtxxzkIXiBLxnYXSG7XC1+3qVXm7RBJZ1tHuIYy4Ko2TqLqYku2zZKdiDY1higW5J1AtICYe4N16JaIwIvSZZzfIKFndmc5L3Iy8hRdlbesEep/H+pafVAfLYPe4NbGazhzjUCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795816; c=relaxed/simple;
	bh=7Bv/tRzHIIX1nxDFQ6yrnEW0jrJAUENMoZyb0TZoQYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9+pFL0ur3OxnA8xO8Tjziss8b2gVEw0XgI9EzeTLkJzyA3kJIZkYp5uXrEVt/66dXcZxh1uuMJ33ugKfEtcdQh9/LK7AuZkjsTSs8Xt561bMGlMTZ0bKK3SKao7A17BGmkNRjoFCt71j8H3QjGsAflKCZncsxHV5JnXkt6dBLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojWO55EH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojWO55EH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso12179025e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795813; x=1790400613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Bv/tRzHIIX1nxDFQ6yrnEW0jrJAUENMoZyb0TZoQYw=;
        b=ojWO55EHv5TMcFaUZ+O6ganieh0E1ZUWmRMERpDnhHlnt+symQlltJr943+sKv3cmZ
         Vl5+VuHe/GRmRyzd9ZZ/UcGSImAjFBdc3qNG9XvrdjT08r21Exn2pMq5oVNligNT/RHr
         RtygomwifXsj693OSri98WBORfdWwWxfTea57aeKYq7VSKT2wGGXSI/M/mgSUQrUcINm
         IjjQNzSr4dQfVM3+gn/X9Z22WdQzXyQA3zeWojQQp6iIyhipbPtImCnxKqRWrPrFe1xQ
         dxLQsORuehV615FDVfpGL/zOixHqPQYF+RBqpdS2rTMD7Zcrge0exXE3eS7rCUeYKkdq
         clMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795813; x=1790400613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Bv/tRzHIIX1nxDFQ6yrnEW0jrJAUENMoZyb0TZoQYw=;
        b=dHaD0oYMUZIM+jRrJm6kkTudHMMURrHk2A/IXJSaYehC5jf3vfyrlpVvdAXqhISRTy
         14jK1jO6i4HY74XpaiOsIymZir9ntcXcHgRLvvknxca/cYyH9Lj4GHjzS1dcXyyOExrK
         SC1cws/RO3yEXQmM5Wl3KT9Q5JtibQxoBEnEGV/8c5BuFe2EourcMR2bVZI84qOOUbOm
         OGvhnhypi+lSphoqjLcFEcX3iM+MwknLbgThY5MKj7y3EVwtmyvWQQk9e5IOAB7cuZkT
         XJluj5IMMHOg3h75SY242X+SbudhPw0MsxhBdKVi7lDT8joqrpB+tY1cuA+IqIkSnbV8
         CqBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwe5e6dh+K8ojnfZXYrEv58wTSLqFNkLJGoI8q7UZKJwAsqMjPgMcx/Q8EtRMmSxjV19T7Zj+0ivbtotKc=@vger.kernel.org
X-Gm-Message-State: AFuF++m6hal2fysyOOvAI1t9bMRskW6oR51MGxMoe82qKrlRbq4O25fk
	KYe83dSuu23PRWrBCNjd4DflLJxY0LUB4kj0d5t6brgZY6aaLTU+EP8u
X-Gm-Gg: AYBFou1hrFwOVIzZ7vJ+FSbUa0TDYiDgYMFFUT+6Udp8UBg8sTP/FFbNRwstg4XiMSI
	dEzxHihc/WlgSgykE4nsqkrYjRl8lO+7bUIRwKQcY32OMgvBzmgMpVZFCvzk8Z5F+oWkdNYAd9p
	kUfAluPbVCVHKkUS6b24gnb/SjqtAXdghrWsYtt5KDvhb/mJGQP+mqgui3XjcZj34bzN42TfLh5
	QCtNaN/ghBHpTgZAI42zefvNd8MYP6sdqj93EVowYIjft18kcPEI7WPFq4ep4y0mOB2T5JdKl9C
	73srv4h3TeobT/B/yIekVDRnzG6ALUVvfsXsK2+yzNVFLjJe2ZbgxSs6b7UhthiF232YvxoZtcb
	slzByXxkNYU3EQ8hDbyiB0H7ZQ2uHPJCgt6BIG3Unzt9mD+L5WXtVh1jZy2fAm6l/Tj9pANmnad
	wck0Cl5QF1RkmVfWvVewiR16IWbETcnq8ARVdz1OG0EsPWacG0sFWW3pLlpkcCohfLJvbhOUeUP
	tbcCWaH9eY3AzcuB+Ikc62ezthIxRs1mKqm9PhnSXme943M6IHY97dK/1aWGD4JKayvm4gnCXUC
	JESW5H4LuMHxp4tHuMMK1i/82IXATJkjpr5IED2cLNXjS0nr3JUjg7haPw6UyxQAbl9E5qcKOny
	CXgz1tRKmB814H1Y=
X-Received: by 2002:a05:600c:8b61:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fc574a635mr67008715e9.23.1789795812998;
        Fri, 18 Sep 2026 22:30:12 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724583250sm4045214f8f.22.2026.09.18.22.30.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:30:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] docs: kerneldoc.py: preserve headings in kernel-doc output
Date: Sat, 19 Sep 2026 07:30:10 +0200
Message-Id: <20260919053010.26104-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <335fec1cd5a3449687f8b1ee8cd46a0f3e455aa5.1786751700.git.kmehltretter@gmail.com>
References: <cover.1786751700.git.kmehltretter@gmail.com> <335fec1cd5a3449687f8b1ee8cd46a0f3e455aa5.1786751700.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 15 Aug 2026 03:32:29 +0200, I wrote:
> Use nested_parse_with_titles() to give kernel-doc output an independent
> title hierarchy.

Friendly ping on v2. It already has Acked-by and Tested-by tags.

Is anything else needed from my side before this can be picked up?

Thanks,
Karl
