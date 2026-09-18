Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D8951DAFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756145; cv=none; b=YzNMFnxmXU0u71r988/NMXpVckxe2AUMGGWWnpxq3XlL+zOh9qwxrfF3ohbeMYnfqLIcbyY1Lehta1JlF2VRyuQB+WvtDt8UOQ3d5fsCF8PKILjfxtqyhRzSzY6tMJrgkiZulBHHVvgvnJl+X1STHB2qDXBdoBfGDnHAX1UtRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756145; c=relaxed/simple;
	bh=zdks7hdrheJUewHKZ8mwTNf/+CqwZZ9VKUB7klIjzhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdwubzctF+6rpSXNGW6yKTlzpMpOshWiDLx/mLvWR78y5k4a5DKT7jN+Doz4Mc7LT5/6KOnLQr0ESuMtEXfh5OXcs11DL3Fc0RXuMK1gAd6cUvgWfQYU4n1+VnWEj9+Y5cAoVK27qbrMV7Ep19AtmRAZ7tvCAeN8R4+812q5I2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+GWjyum; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+GWjyum"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1119828a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756142; x=1790360942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdks7hdrheJUewHKZ8mwTNf/+CqwZZ9VKUB7klIjzhk=;
        b=P+GWjyumAl2gaK6iPI5IthQSfwcHG2ybVqx6a8j7nwVeScBJ507QNh+upiL2cVvATS
         ynHIBasL+KccoiAdqrJVi0e/xWiB1KMd26Prn5b2MwVItW4zbDR4ygPmsFYjZT7VSmzz
         ikSNBXOgaLYxAeQGBI1QDKq7t4/7sZj6bGXHbUfPhz7lGS+hlHlw7r995bMW6BOpP1PN
         gDvCD6SQK6qmzvKXDUWhE+KzJ4vnkBsvVsnX7Xp1K9nOnQyR45/zsxF5Wfs7j3qpEi9C
         bonPZXbKb9TkB1+Mmo1KGL1xsIXaFSoXNMUZQW6PXrKcJy9PQYI3oHN6akN19El8d9jq
         l15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756142; x=1790360942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdks7hdrheJUewHKZ8mwTNf/+CqwZZ9VKUB7klIjzhk=;
        b=YuUtkPjsci/JAmr81Q2qA/A7rRKDESyLW5x7cuKmU/yWTFflcwQU+z1jmZ4RHniyEy
         fGyv4a8RXIg9NHHnTZL1XjIdDEIUQCRYxSRdpYoe7z7H/DtERXDUqcE2jB4Mt4prwvqG
         Ful/FzbUmlF2gC6D0YgCoDbE37pLGtcLbp7I4/LBfMXm34Xrt3yk7BGysvTfVsv9C64+
         fXsph7Wm3k8rFFo2chziBoz8W3hdsHrHZhGCOGT/wbExdwDscTrp6guzsUi67vcigFMN
         YMvxGXkWk6OsUoTx8Nhnlx7oMzEWRKHiAmNioi6FVwbjfISller9DO9MCrNeRejNzzH8
         WFRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2/8RoaHMojVUX+hHpm1hJQSQ2DbkKa8VVz/sa4osyk1Pmzzkf4V6QRw6CmNswgMaBr9myp0ngLQ7aOjw=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ+7WqU1umcrBsEDgUDOudjAbJK1cY0/d4HMcmyBX/RxLG5EKs
	fUlug5F+kmcJ7n0Z9skL6aFSheSI6LvuPd+Im9i0/rDc+tocvMIHlvmg
X-Gm-Gg: AYBFou27CMZHQ/uBSfkoXDfXs87mAGgsJQTms2R4Pm1ZCN1JqwCYtSVy8qSirVFMqYc
	0qrYHuoVAXZe6OOi/ohxPGhQFew2USGzQzS1ekYJisQ+I7Bz7Sa8p48O9+ElOUgM6hVgtHTbZWb
	y0kCkkymHOGrIw/lJEGpSUESDMuzJZX3+PFz0GGIaRa4vWUL0AUvli8PnUC6QYNgMk4ok0PdjtP
	BESMp1+JKUFu2OGePBkOJHDkRIdJO4ugr36afpF9lsP2X65TimvWQEUO1p9G/QmW3GJVjufhoC5
	fiQzvz5gxL6InG4NaUIQ/NfmzGzCs26sqZ3BBfOXFQvZM4xkOMYHRWdV+JuJ4Q9vUVU5aalCDmG
	nsTtu7QVLR++A9JD68QZFmWQ+7DnDd4qlLL7AOsdVrQ7QCp8YCBHXQBlY9yQ3Q1322BaIXGcBhb
	vWcIqbjfjmSpv6EL6lKSgCssZnoJFgii12GJ8t04mW7JVgcfBzYfXNKfuFUt7HSOqq/kaX7KB10
	pe4dK1wTAfwZBlSB92cBibi+obH5vBhm4jbtsTnBXRnq1LHXgYWhyWSjDZEx86jOesnoMcmG2CH
	N3Xx2YKS1C4/2vnYhyb53+PJAQ==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr12051276a91.3.1789756142193;
        Fri, 18 Sep 2026 11:29:02 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-230-153.dynamic-ip.hinet.net. [36.232.230.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e56368a86sm1718011a91.2.2026.09.18.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:29:01 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 02:28:56 +0800
Message-ID: <20260918182857.571-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b1ba175c-ceb2-4e00-b233-d51dd8a2f4cb@kernel.org>
References: <b1ba175c-ceb2-4e00-b233-d51dd8a2f4cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 14:14:11 +0200, David Hildenbrand (Arm) wrote:

> There were previous discussions on this, in particular around how much
> we should actually try operating around the target PTE.

Yes, Barry's RFC from 2024 and your replies to it, where you were fine
with contpte granularity and not convinced about anything bigger. That
is why the description has the numbers for both: capped to 16 PTEs, the
1M and 2M cases take 5.4 ms instead of 3.9 ms, and the only pattern where
the cap wins is one store per 2M. If you would rather start with the
contpte-sized version, that is a two-line change and I can send that
version instead.

> How did you use the LLM for coming up with this patch + description?

I did the initial investigation and made the design decisions myself.
Once I had a clear idea of the approach and the overall structure, I used
an LLM to help with parts of the implementation and the test
programs. I also used it to help with drafting the commit message.

Before sending the patch, I went through it line by line and checked the
test results and measurements to make sure they matched what the code was
actually doing and that there were no obvious issues.

Lorenzo, for your bot's question: the reuse decision in
wp_can_reuse_anon_folio() is per folio. The patch applies it to the other
PTEs of the folio within the same VMA and page table using the mprotect
helpers (can_change_pte_writable() and modify_prot_*_ptes()), so
soft-dirty, uffd-wp and NUMA hinting PTEs are handled the way mprotect()
handles them, and the PTE that faulted is finished by wp_page_reuse() as
before.

The part I spent most of the time on was the measurements, including the
cases where it does not help.

Yuan-Hao Hsu
