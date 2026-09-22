Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65AA13AF2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121525; cv=none; b=NIb6uSA6ac8VM5iJj9Af+Xcd7w/JHO0Xgy2JmGe+81CAJpiZnp/zBLj5uAql45bwR/dh8vsQZML9cC23isSWmbT7T3o42EGfHvt9menMffU4QhyBdvKElsJS8wrmPGEgdocniU3oXiL0gc2q+MoILmW5+8pbNW7eH1Nh4t9c9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121525; c=relaxed/simple;
	bh=zMZuj4OSysiY14sv8fTeBIk97LrMvKFmXN9V3kYNFd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6NbH/zxiVBY30lR3lDh6BywvMUaW6ojrFvO7bbmeMZkzXao5ClFdKT/MQi9KBolYv1CFBt+EYBSeVyYdHraoy2m3jeUx5g3QH9ByuN8McBk8SkeQZPfAiXTP4W3gfbaacqNUKXrwLYyfW4kNAZx+9x6TqTnK8n1MPc+QMI8V0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ZQlPmVvq; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ZQlPmVvq"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76c9deeso3986421cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121521; x=1790726321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hLggoqTstCCp/LK3cQnyxDjfuxVFKuLURbcW1u38EU=;
        b=ZQlPmVvqnrKTa/s7wZXOFwt/c41ay6syY03TW+bkacaUMnzOBh2O4gIkr5lK71nepG
         lP5a7YPcrMmn1KP1BSXTBioNccWJCOWBrjo7kgblEgBa4tuxD7KiLUEC50Tl1y35e9Nj
         pJryVWIR0xi0HBesbyainB71Ho0tAqPElanRPh5BB6nbm2Gr7HHbGnhGFdTs2ffOnp9+
         U+bFboRvOHCjjlgip3QfeLSIKHA+D+Dvex7lWXE7/3oEL0yoQk1traeOx80cV1Ifj8O+
         +vGD74gp+URIAh49cWni2XmFUb4fyp1KT5xBb+v+OqC3sbJYerFtT6gZAybz4JmCNr6a
         DBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121521; x=1790726321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hLggoqTstCCp/LK3cQnyxDjfuxVFKuLURbcW1u38EU=;
        b=2U9l2/YXYIhUwVuZSJzZBBeir1a5yo5hG6qt239i1+nu0krF1HYYb277lVLDPCnYao
         cXPRp92lKEVsFwxP1yu8R7lQB/9arvd9qoupnb5SRkP1rCDXiEqn2grclv8vIpwGBa22
         pA4xMLEGFYBGoYO/TZiNuwAI0fIqAR8jV/Sc/Sakx2uZwKRB4OhJNcLAWa/iU+MPMJ3S
         6tsPcI3URwTojegeVhWwJXjZkFqDVhtRFbQySVI/np7Oec89tBtdu2+BnE/LoXJhH+x8
         zn+q/GuMd2jyAWxsKe4gwTBthqkKOBDphMBPZ8t87NGug1utgz74itnjWBvxV4M0yQJe
         aYJw==
X-Gm-Message-State: AFuF++kF/KImeDXDKd45dCmLSblII+Tmm9RAHy/TNEEkKOKBwr1uiW0n
	lpyhhhY/H9H3aN6gTmmkLX/yHHhhQpxkjPOm0KYwFe4CAJq/cpOtNai6+5/dlR/T1nYYD3og5fq
	nLeqjyMg=
X-Gm-Gg: AYBFou1S5AhJo0UxJr3ra8oXHdohFrcr54HOuBdNGt4fMedB20SwxweHs6YXxb5RLLp
	uSGQeDNxYuOZgdXxhGqx4wBJcjaG+IHeF2KknBefftPGVo++gD9QisHMmfQq1MctUumvyEfSTew
	27Uq78eXpZj46Lq3KdHS2Iu41yXKSj/j+Vh7VYNXoyaBeZXXHivHwRbVHQq8SA5h2eAk+i0E0x2
	gT22ge7JICg+NFtGCBGjfgUM16U2woe1EXJMdf821LzVIy5wEaRzekZaXl1e8JKJeaZuT+hA4sL
	OYdlRPp3sxj6UFNwPYgN10FzJ6uFppkM9m6Juy3G4rdZG3wfuNG5LK7+nu/+UPTWxipUY4oA8TY
	3IriBfWlDQn4EAJ6/MKObwpygmotbsMMXU5GEC8PU7pGyuAy4YMF037SUe/QbToKlvzabqOxwAB
	j5+KNJQvhq30cU1RnB6ZUH1VIsUfeclNLqrq9Y2hRyrRMUAoxof7e8PbYqwPG8kQxd6MtVEaNxw
	8UHqUrE80fDaJWfomJoO0fNRfY6iDAUdDYqQkQURI219hqpsjy+0GmsFid5
X-Received: by 2002:ac8:6f1a:0:b0:532:c161:b968 with SMTP id d75a77b69052e-532eac32322mr21316581cf.1.1790121520905;
        Tue, 22 Sep 2026 16:58:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:40 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 04/10] mm/madvise: use the PMD softleaf validity helper
Date: Tue, 22 Sep 2026 19:58:24 -0400
Message-ID: <20260922235830.2350770-5-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A non-present huge PMD must contain a software leaf type supported at
PMD level. The open-coded check names the currently supported migration
and device-private entries instead of expressing that invariant.

Use pmd_is_valid_softleaf() so the validation follows the central
definition of valid PMD softleaf entries.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index c345fef23f15d..b31b877c2c130 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -427,8 +427,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 
 		orig_pmd = *pmd;
 		if (unlikely(!pmd_present(orig_pmd))) {
-			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
-					!pmd_is_device_private_entry(orig_pmd));
+			VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
 			goto huge_unlock;
 		}
 
-- 
2.53.0-Meta

