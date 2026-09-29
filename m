Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58063547056
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718807; cv=none; b=ZFWtbdN4TeXPVJ8KwFQp2je1NlnSShJ5CTSHZ5uIfBh2BuHwny/FYntDjMSFXMc9HkVMXV6rxF/8GR2DcDYiigXtOr9fBCpNPAdY27HqiQ0FErogtP61xtqLrrYGa6XeWnC7JZ+PScTBmfSiNx3ufusYo/JpYbRtsu8Ryb11iNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718807; c=relaxed/simple;
	bh=+MASHYeccSPeYQ7v3Rz0foj3H0YvOAcJkX23lYLc3Qk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Apr6nJk7zbBYr88+xVh2sj2WScpHmbwCKsTXZ/zfVMXCiN7dYlstei1TtRaVWm0TkGGvFgHemgnDpHYcbEQldpBDmYQay8otxbuxF2lZQ3/BlAWFj29taFze9IwQIJOn341G9glCpYhWigBKe6UCLXLK5kGn9UFwXIW0DGemmi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o699RJb1; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o699RJb1"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1067774c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718805; x=1791323605; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAhFd0jGDjt7zoASvNiCqcMpRW3iwBtEszTc/DFImjA=;
        b=o699RJb11V4y6LCcLFfuAiHN3oo/V9VLHZ/shMrGXMSgkr6ZBgkhcwAl5/KZ6aW3GO
         THWb2Nnv+OUvVM43/0OIs8lJ6e2QgRVm6eJM8+HXferiD/Cr98t/Y+L9lNtnI3cJXrLU
         roTS6fHQC9xNgPipGuU/YIbg6SqeZsc5nVMireUgFlBb6BLuO0WmOU1hd4sUXwmn+G0v
         QR6z9TNYAhmn8XrFgR7r4yeSlgiHA/nOD0jAif0h1z66C+MaGjy5nl0LWcJLM23PxNsD
         q3cqdheI2Ygvw4/agmN8N20WFrVUPZ6t63nyWFMe6jvZ3STLMrLXrm+UxObf1/vgVw3x
         QU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718805; x=1791323605;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAhFd0jGDjt7zoASvNiCqcMpRW3iwBtEszTc/DFImjA=;
        b=gTa6nszZCx+VGtlQXz3vyTkk/LA+qfoGebppbCB1dTJDEWZAGbSQs4uXs1PdxRvkSa
         90Ob7CB5CSOBH3sl81IsvXjO7HXqUmSfigFsWSvGE0nlkrRbNwyehOHwI/nkIxdiWlc9
         sp7LCxwpyvgNjTlVZGk+g5mUuxoSeceOjbEPzaso5DK1gWyRa+RcfS2kSN1OaA2YCDcC
         F2a+5c+G0sWu1IeR2PzAB3dkvPBI1WPkdVSDM18GNJx1BablQzPnMKNF6e8idTfxpvty
         /QiyJqV2Vad9TqiUfaN1nSri6/abYb66g25Iap7uSpnKG+St60G2nbWMrJ42Ty+Z/kL3
         mV6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwS8ur+DlVXItUVLaiB6RMarm8DeBf2JNwRiymg4JQNtpdLh7v+Z9p6gxkaf5iRdYTp0zBkZKdW+mHu9O4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPa0glFIApn8oH/VvZB2Vdu7A1AyXQt7Hc/HLpX4nhjLOg8UgT
	onxn4N9NvmBGKwd36239C1WyvGm74P/IxDO8pqfYTAe6qBKjaJVJNndIO3DQgUpnxVz8B2WHWYV
	HdhTdvnsUsehhBq4i72p6bw==
X-Received: from dlbpt13.prod.google.com ([2002:a05:7022:e80d:b0:144:db62:fce1])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1184:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-14c9f405490mr543692c88.26.1790718804889;
 Tue, 29 Sep 2026 14:53:24 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:58 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-8-nilayvaish@google.com>
Subject: [PATCH 07/15] mm/page_isolation: use folio_page() in page_is_unmovable()
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace &folio->page with folio_page(folio, 0) when passing the head
page to compound_order() in page_is_unmovable(). Keep compound_order()
rather than folio_order() since page_is_unmovable() inspects pages
without holding a folio reference.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 5aaad037384e..29c9e108b2e5 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -47,7 +47,7 @@ bool page_is_unmovable(struct zone *zone, struct page *page,
 		unsigned long nr_pages, pfn;
 		unsigned int order;
 
-		order = compound_order(&folio->page);
+		order = compound_order(folio_page(folio, 0));
 		if (order > MAX_FOLIO_ORDER)
 			return true;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

