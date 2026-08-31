Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D983DB636
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177880; cv=none; b=b8bIbj7p73CoBk/pk9uZy/h6AXjZ6YqKty99CjlSWRenXyaPYU393+vRos59Qa3xbKDZ2nu07ogH+sXlIFdm9rR/Z0XT6hg6gRQA2tePfieKUZGX/PjjQdQK+wzWxUAFuk0V/GBBG7keW4ACwH5JWzpubpuh9d/7oa5iJjVz8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177880; c=relaxed/simple;
	bh=+Qqjdzv2bVxqqJ8KE8jthaL1miiMYy6+r7SugcWAN8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRJPABJo8Y39AEVAid9czHwdMEpvxmfevcXA2iyZNZDTHtfe7Pb/c5No6OKQdR/48Wjg4o5IWpnJXv1OaVFflCJ9B7ZJ0TVZK5OwRfJZ8jFrVZOxAQGWuo7zJl+Si/YpOqHMNPgGsen0zD9xTwrmv5E/PznwVxbFt1FRnJXpRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tm6r1mzB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm6r1mzB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d944747d41so3979425ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788177878; x=1788782678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Qqjdzv2bVxqqJ8KE8jthaL1miiMYy6+r7SugcWAN8g=;
        b=Tm6r1mzBcF0X5qRFt/eiSAwIwY8ixhm3SbfRw5cbFtXQ+meeiSBWqUS5lH70jRukqf
         mgJEPjkQW6uc8C0WMaXdnGM7m60+xrpL9BEDyS8VWxHsswzECaDm4mcazY58yhc2xxOD
         kEWg5vfLlrLpWqcp2H76HRlsrolQb9SVimlLT3sRzLCd/35x3vKbyY7lRn3bmkHecZcq
         21uiiLJpdlvNNEzUbI5hrv1zQxAMDOFAExNyhWoVIe3krYduWsaN52AkLZAtkuLW6sCg
         tnjJRa6Yic3kskFrDsjNObDehd05drmfo3BkoiLZ+FYhNWtqUiBibtbCn+dyQnTMs/zW
         vv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177878; x=1788782678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Qqjdzv2bVxqqJ8KE8jthaL1miiMYy6+r7SugcWAN8g=;
        b=XvamAMPsfb+0vbmuvVHz5LS9Wg/uwM06UCOk1RRZNFFtfTSaq5htxEpLwDTUYtVfAg
         ZH9oGu08GxH/lSN2GmusZalKWeaqeD66qP83e4+06e6HWndJHAItSzgWzFC7FdmrMYwW
         dEWPPzgn8RIjwvDcLZ8vTUqZkhDFIWbrxQ42Ad2qcBKeOUEldvve57t5Pi9gCCEcP9fB
         HSV1+DikGuwjum4LXmkId7DEDyKj0KadHw7h9J09+kWfNJbPRvrTXkxh26vnFtjVQb3s
         yDIYj4mYPZPhZHSLME3Lmtbro5r/WmupUOlNgxu3sEONNa07G1NibazrAE0+IVu95xd/
         xQPg==
X-Forwarded-Encrypted: i=1; AKwUvBw/PzTBkO74uX67tEZoCsxOHdLM8fTJS5l3b3QBw1XJ85Sg76+Ul7pJHNirnlbHrvF5DWait9t6SfCr0kM=@vger.kernel.org
X-Gm-Message-State: AFuF++lTxPEErt6DKyWfHEOMHXExc/oD3fPUNlkucYK9CwpkIkUmia8g
	zEaVgzI1NHTEGV+rJq055li5ABfNmLyulsOhVcbOxxU7ShopwLN+JqzQ
X-Gm-Gg: AYBFou0ZCzZ3cLXAe9KDHLaU0c8ggECsS20YfH1WAzwPInYdNRJ4YVDu1sGXXuCzHlH
	Ai1liR9lTEzu2P/RbjhGxE0DSns+38Py9vKXJjFYG0UU3Gd5u0xBJqa/UJx3U5efyxouCKqkuxw
	bsgoO08RkvURbSz9BuNBNv6pmkAHQmtkCivScgDdOTDhvae64p5se6o1PQFfovJ/Or+RseS/0GF
	lynlZ7o8HQn+XZAtQyCG7eO8Gf+CnpaudOeOypNZHWDjZDL/i7K3aN7X/GLycgHMnBZzV/0Pg8R
	nZxt2/XTbW81i8b1K7tSmhLJdYrl43FAP0z7ynKlOiEzsV6yPLGCpW2Gsy31821GB7o6po6tS6W
	8rfrad4NsamE4hBRYeFcgkckoVnKyJHirbLrx3/W+r8WdMq0WKIDjuz8v2Hp2P8K8h+5hLgYoDV
	WFxhcm5Po4l9jwXdkEAd6gYLb/MPqC0kWe5OeluUNbrqIpd3ARrw44ss7bCNGNOfsLjpqRTnmI1
	2QE6NwbdGWD1lqQ0AspyTT/z9h7
X-Received: by 2002:a17:903:468b:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2d926888c80mr78196075ad.19.1788177873305;
        Mon, 31 Aug 2026 05:04:33 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fb1absm34371945ad.6.2026.08.31.05.04.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 05:04:32 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com
Subject: Re: [PATCH v2 1/2] mm/mglru: make type fallback logic explicit in isolate_folios()
Date: Mon, 31 Aug 2026 20:04:01 +0800
Message-ID: <20260831120416.32950-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829074204.45304-2-baohua@kernel.org>
References: <20260829074204.45304-1-baohua@kernel.org> <20260829074204.45304-2-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Make the fallback behavior explicit in the code and remove the
> opaque for_each_evictable_type(i, swappiness).

Looks good to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
