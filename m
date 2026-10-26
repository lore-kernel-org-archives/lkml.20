Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010308;
	b=sTlahQ5C6LxbRyFZtp3+68hFt9qbMMOmkzSSFVuUao9jSB2pePwxKMweHT6WC8U6NwFO
	 +kbPAkKG1Y1EF+XyMkqPF8ex4OBWkH5gRBO8xVu/9KOETmaMwT+RKK/YOaJ3yoyyf94tC
	 YZuTz7SgtNSXIpeD8aKhPIciKpC8g389IbjKa0LE/hGnvTHiNvw06tUkTMNbu8NYAAA4a
	 IllZWodqNduH9eCzu73XblKdopT2RfPsVMp2b/qGRIdN0QOV2dZhjlCKY4F+h+LMEc95O
	 godI9Pr+k+qiYTj7ATTaiylGe4cQI6fYHcFmmE7ujY2riPXIHL7ED9oYAaGjazjQ0Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vC3+m1bXV4BFKZGwxaXpJ49T5jUkMEzs9Tuz0+gllWI=;
	b=G0BeBYGK5zURipzbx6aYLa9J3uYqDpZdlWXkj1OBXuEvdi4m/aptZLJ/UEswP717DTkc
	 GiV5OUdHjnOBjb19fKuHtNPMUdcyVuUuBrPvV1EBwzLkNk/Dz/J+Fal05oDnY0P8MKJbm
	 ZIkY7bZrTR5+Kk5WvQzv+Lh+49k9MEjzWkuNRIBjQBeTu6jqbD2rUCH9TCLFXY4b+oCjB
	 62iU5NhN3iQx6vOP1kElXcJSuqFQsUXjDlXGAxcb2aeBGH6WOyUmMlE2U3gXpS0ZfssH/
	 D3qSK7OjqzAYTOMHsfPiAiNY60EFjhXMex/QfhBY70OlzZ/ODma7avnH5PCcdatALZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n3brcmes;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCF8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n3brcmes
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so418241966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010306; x=1793615106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vC3+m1bXV4BFKZGwxaXpJ49T5jUkMEzs9Tuz0+gllWI=;
        b=n3brcmesV8gp5qwy+1W+Gw/F/RvOX7AIRhxBgR1Htj1qth9aQpnqjQ2x7/N19TXyiD
         gQWTcO60sxUgtqEoJvvU379DAdiUxr6uE4jjAjOQUY/UbgtS0UZh1zLEic00CtpvHQP2
         qxa1Iw7YRw7s4ODzwDt4fsz8BCW0lCgP2Fw8vvWM6OCTjaP2yyHrYNhGuGGpKk7LhHHD
         4f6xhhENAub9y8N0Ocbz7URjR7EQC/AexpbDZmVlAJ4zaGbOGLPKHBoGpk5qcX2o8nX4
         bf+rvWSsOP9HAqhExpnfAiuUEbYdgmV+fLN3sJCDMEdV5PyH0CT6B+jgPDXfAp58ZUyZ
         iv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010306; x=1793615106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vC3+m1bXV4BFKZGwxaXpJ49T5jUkMEzs9Tuz0+gllWI=;
        b=Dt4v7DA11PRflLNrd0IlHCEpOW8Ic1n9jKiMhFncIiisZ8Pd16f4KzXVmcH9bZTcG8
         MZTZdikKl/ldPidCJTJlE6Aoe3L/FgKok4rgCsVaK/Z1jSA0c8TeP/T9MGuK3ooABKTl
         nH8WHrWI9mBai2KLjdcq4Rh43WQJa0w4vwD7zXxMkkC1s/9lj7kpG1f66BxAdlC81e4f
         qS3yXLoheG2Fc4EpDdbMyHSk+PKpQIhQbFeFxr7xSEDQlheSNRcIZ+wQ9ediBiUMuvup
         vsHbq5mFiXlGei1B+GPlM0bYXwcedKZtXmSIwz4CIBXqCoqOcUdpaSUOkvFY8zbUjLyb
         gi9w==
X-Forwarded-Encrypted: i=1; AKwUvBwDbnD39eJuiYYP6jWmSRffK1Mif3EVQC0matsLwifK4Sg7EstsPxvNeQYLj4J1WLODvIFYlViF/2gZmoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeP1KNpwE9oZplVURy6Ap+swe6Tn4ZWC63j3Vuw68wVMsEmo6L
	1axsxHIVJKwM7x2djIIzO+ykPXAQ+lGt6p4NoQ8xqBMsjlWo63n0f3RZ
X-Gm-Gg: AYBFou1kvyM7AdwtPqf10praNsjlsyDnu7oZqjrVr1U8O2sD+nbhGCKHgLlZZI2fJTl
	C+Vv6q7F2RJiNctlrzOT74EMpfFPTEL1kJleoYQAgXHMjycFVbX5RUdyZ5EolkaAPH4Hoq4KWKr
	LiRyOTDOW8/y2JB0U3ObnuPFhsp4nvSQUFb4IF+Ldp7jmPxtRGsx2RG6Y7VwVcetgsPYj3zaGeQ
	Y9Ve0QHtqldvFDP9NnWx+UhOrC/INpkXhPIlLkMjUfVMS4/Y6gGwuQ9lEyOj/PvFk8lpP89zDfd
	SZZ2RdTf3PlLRAPY+Hac3Drr9Rq7mH8roDOc0DHHbIXTR+WwOhvDBV89v3zEpL19HNpgSi+neA0
	TCnwRZTqqSlBjPwE+6KKpIpEPwHtRaYheAF0R0jb3ATO9o4A6NmKUiGFNy3Qw99P137ceONxjuX
	/AfzHSQq25Tmcn404y95DWjfRFw8mVxvr4koIwxG0+7jZZAfrZp2I+bzdWozggvdcA3it6dKpAp
	uESBu4tDZWLV8SMpGLdP5mNBRnX55WIvaS77VgjWCaBj4M=
X-Received: by 2002:a17:906:3a88:b0:c49:901c:d9f with SMTP id a640c23a62f3a-c49901c2556mr174648266b.49.1793010305891;
        Mon, 26 Oct 2026 03:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd52435asm298667066b.36.2026.10.26.03.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:25:05 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH] mm/vmalloc: Bail out if in softirq context
Date: Mon, 26 Oct 2026 11:25:03 +0100
Message-ID: <20261026102503.30860-1-urezki@gmail.com>
X-Mailer: git-send-email 2.47.3
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

vmalloc() is not allowed to be invoked from the NMI,
hard-irq and softirq contexts because doing so may
deadlock on internal locks.

Commit 04aa71da5f35 ("mm/vmalloc: do not trigger BUG()
on BH disabled context") replaced the deprecated in_interrupt()
macro with explicit in_nmi() and in_hardirq() checks, but
unintentionally dropped the softirq context check.

Example:

<snip>
vzalloc() in a task
 spin_lock(&vn->busy.lock)
  <------ Hard irq
   irq_exit()
    process softirq on the same CPU
     vmalloc()
      spin_lock(&vn->busy.lock)
       spins forever
<snip>

Restore the check by checking the caller's context with
the in_serving_softirq() helper. Note that, it is still
allowed to invoke vmalloc() with disabled bottom halves.

Replace BUG_ON() with WARN_ON_ONCE() for in_nmi() and
in_hardirq() case.

Cc: David Hildenbrand (Arm) <david@kernel.org>
Fixes: 04aa71da5f35 ("mm/vmalloc: do not trigger BUG() on BH disabled context")
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 7521b9b3bfd2..36e6e3be6ba4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3252,7 +3252,13 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
 	struct vm_struct *area;
 	unsigned long requested_size = size;
 
-	BUG_ON(in_nmi() || in_hardirq());
+	/* IRQ re-entrancy -> irq_exit() -> process softirq. */
+	if (in_serving_softirq())
+		return NULL;
+
+	if (WARN_ON_ONCE(in_nmi() || in_hardirq()))
+		return NULL;
+
 	size = ALIGN(size, 1ul << shift);
 	if (unlikely(!size))
 		return NULL;
-- 
2.47.3

