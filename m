Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848925;
	b=oVyhzQbj6IalzQdJ4CmwLmWxDcE5kxCya2S9ufBB0Jr5Wi6ywT3kRh64wQNhJoz+AuOA
	 1kPunkoCOj39BsYOMPlSxYVLSie+UJbNwQsFhD5Sm4+kZkOOSueWuzE3xy6DkvQ4+iga5
	 qixPriwUzLghwYH2GLuQOKkOhjB8jh2WG8KMCAil4KN8Bb6DwiSwzoYILW8BkG8KLrU+z
	 bw4VC6jrTKNphO7Xtmp44x7GatQ+BSsEsCm/TeqdBHZKcr4g4gANqon2EleGFPWEqoi/f
	 4YHl6LTzssQhvBITEJR82ivbd4brS427bSdulOumQS79puE90twoYh/+DIdJP3rhVIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
	b=CMX2WFFewdfB3Bya3y8KhbDkR5y6bbP5O29r5BM5axNqJgQ4fbcW6aBUCFer2bQq5Ep+
	 pkJ3nm1NtlrqwhxKyTO8lFwiy8RbbGkP62ahHAvtR0iealY5Y1LiBX7vD4KtdJ2vtHoce
	 Syykh5FDxiZUWOeKpytyHn/ty4fcdLI3Vb6bT1nRSUJyP4PtCg7dwmVWxSz5LbMiO0drn
	 GZtAlamu3EJX5mlq4tPX/nLgNLwY1e23p0z55QjBnN8FzR77Mgme2PUhpCnHe4VJUWKHu
	 irpTVxiF0MpLs/firZhqmkWE0sTgTw7W6yKuXcDoYTGDDsYcU9Nd8iPABZBvo75qPKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tjc0ItRs;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A81606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A81606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tjc0ItRs
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3602003a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848925; x=1795453725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
        b=Tjc0ItRsiNh1Ydt0eH21UKlLI5UTGiv3uUB5nJmX9NZGSnd0wwtR4q4QBCUY0H1JIo
         9dZf5fh8Zj62SEOjq80jNWWUr+zaN9XedMQ/8UO7vDiyXdTm5sch3gI+BGiSB0hnuOEp
         Be3ZbKtXmpCVvSSOPKrdlXXZSUgyIMnFtTIbhk0X2IL2PAX0ZgZSxhsh2msvjdPaHksO
         4wxZfMpR+vDTyVwb33P/nfLJ3m1h0yCr8lTC5lKRqlyFw7K8X7dsBAHFO+00rJo9KZWE
         repFeAcED5nKlxa7zpK8NnjuuG7PitB4FHB2whfJuUe/ny2jRnVJrkfiPrXJnUhCIjNH
         FHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848925; x=1795453725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
        b=iMpSGpUb6HFTDjDr9F+aSmtiDe2pgyjD9EVXTF7Ca3SIcGOr0nCwNdU2HirxSutD7Y
         AfWvBNIwVTn1UG+BsnUWJZIHXxGIkRl8OUPvcqDE6uDDXb+nzbl+mVCIFOgfyHIUMIUJ
         NkZfq3twN9dmAbUkQyGTWfE5oxGzJFakBYXpQWvwr/oQh2LJBhnggwrJKsphtqvvgi44
         slOB8qeedbI53UJlbtIu/sp9S6JShupreur/DhNB1VR0ck5oZpr1dtmBhTPeLHslOzda
         Nf/rToQMp/jLlUO6FBR0VIllMpxqZba7V0i9M6B7x+Z8veiW/ifsBk6RYxGAs8HaOOpt
         +HVw==
X-Forwarded-Encrypted: i=1; AL+hErHyeLuUN4TXXfNat9PyDF0QYW1XxsZaCFm4yAEIGCK04nlSpdPLZJlYvTQEiGZKnyV7idzi5yeCNbH+N5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rXW6fg5Za0iNOaPsTtg3v5rWtjEHtxkob03rfAcost7PK6Bu6
	k7q0l9+dwJ5LVRgwY3VNN++uoptD1IjI7OGZTYmSSzdRiKBmv6N4aa31
X-Gm-Gg: AZFdTZdxAcdzfF9DsaZ2n+gJrVwZyqoAYClQ3mM3Nx1gr9/toaf4wg7RYMHPaQRcIyu
	qmSuWrdsQuVFYi3GRJ/efZEW9p885Gr0W8LX5YFep29DOF4oUvbwxkiZTzRXKqHHyDFJXC+MwKp
	ZZ1hyvqVyMQrDA2DJHOPOFwKJvJQCDKrj++dlHN+ApugmllRACL3pm3uUZR11y8H6DWGLdAeqV8
	hCbQOqdhArhLaZGx72fsoVoGHG5skqEEr7iVZvkd9BlzcH1zEkne43Yz+SDz1Ph43O3i8qESy4Y
	CgrXqyhIanUhzuNPusvueYLRybZLWRzipyGECAMiFvphuMH1luk4W5RJyRnvDgwmBMwS2yWI6/Y
	EdC2mHwjDOI5y7inuSj/wT6bl1oFDirsjWkQJ8C11RZyrfVIoGPy7Z00sALnxLMX5S44U8zIegb
	jiH7aBgtnGenQHKm9R7s9BjVYFWVTIcMNq6Im/t0BxdTCzuomnLxeolCRMQsdk6+HM07RXpVDWC
	Ua1we4E1ciPV9U5eoTqzlkbYhK39VZblShiSX7tFkRHyBiBqyg7+Fi7vWOwuAUoiADAmWfgSSQu
	AnqyzXf8UxJ3DoYZy++u9scIHT2prcAeOVJSAaG1mVBQ88s72j1HwmOEJPNr2h7DL9KJNjY3mw=
	=
X-Received: by 2002:a17:90b:3146:b0:3b0:9a13:c5d5 with SMTP id 98e67ed59e1d1-3b1b0b57dd8mr10208977a91.16.1794848924812;
        Mon, 16 Nov 2026 09:08:44 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:43 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 3/3] media: atomisp: Remove unused hmm_flush()
Date: Mon, 16 Nov 2026 17:08:13 +0000
Message-ID: <9afbe32e2a98cc194d84f26e6fcfe452e2b09e5e.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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

hmm_flush() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f5..545bb52c5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,7 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
 
 /*
  * get kernel memory physical address from ISP virtual address.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f9..5dff2edb5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -262,12 +262,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 	return load_and_flush(virt, data, bytes);
 }
 
-/* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
-- 
2.43.0

