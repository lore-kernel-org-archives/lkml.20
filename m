Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC33431F8
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299210; cv=none; b=EPugQ4eLkGiwuYS4FiLE1OAQ3RNi2MEOiik7WJ3N5p0vC/0DMspIwvwZYH8TJWKa8grOFe3e8dHPJmncgkj2IU94AyuxaZjjoV3hRHzrWQ7v2V9ui9XIlRwxBjlu5oOVQG2WQhZyyEZKuFO3NRa+DcfpmbOLUn7EGDnWeuANd6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299210; c=relaxed/simple;
	bh=GIFuLgBYOU3S6hNBW1sPmhXTgyGUBsgExEcQliklD1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FMiY1cSqYXyvZl9ofJbwMELzH2dIY9Od1+ltvCMO69p9s9ychS6HFGp0Dzdls5eC64+LUYoE2icloG2hcGOuq07VxYcnWrUPgjc1b0NLHIlgpvKsoZQlYUV+3RFjlZ5SJQ5wmOkuxYfklTkFcoy7JgtTrk3yGyyUggJ6D9PQrc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD8B9cCG; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD8B9cCG"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35943f55c06so1558025eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792299209; x=1792904009; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NL6FeozJTfgi7BCvp1Y94ucO1gEoaYL+GaN20Lo4AzI=;
        b=WD8B9cCGTtel0Gv1QOEW2LfqWFIdr/VepiOsvsonQnwszzJ6yLnDu42DGynqBGyEwv
         ZJpbijbe3yqXc607iB6bGFtUE1plOKlmlzsZfZQabNf6OPlpnmigtkcL+ceihG+3xDpv
         kFrdI6vlXs4wQPrhqfHHPHpQYpA4b9gz2PCVxzywY/q/86RV/v4oeeT8E/2CR8FmgGD+
         mw8sPIieKvt2equtglIJV5OAm7p8CjYhcqMtj8xV82j0DXxYuIrM+AFEnt+clVsD4u1N
         IzC5P49rjE3OcbXAoi+SPjA5IuUtpPKqrzU9et+m+mcdWo//ftebIy+lA8T3hoXVFX+K
         7HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299209; x=1792904009;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NL6FeozJTfgi7BCvp1Y94ucO1gEoaYL+GaN20Lo4AzI=;
        b=h/fbUdbc2RE1H1X1h4O2tPiftVD5v+9jpIQFb1aItm1+EPvR8Fr7heUSuCN+6JVDjR
         YeHhMe6QRhiNCEQTTmNEEij5diSkq4uVxrhfRRtu1rEkUOvHGEa+a018ObS1+/Z/76ap
         ShDyLqbCncFwx0xhgWrM7Ozm73QUdyS8OkfSqVYpKsTHe7KUHueglNkC4Up8TwVQzyl/
         JZqeTAlsSQ5h6UXgTolwWSgOgz7pg6rUek+HD09FtSNWxzWYVQ9oETx1uqST3I3evMG7
         1YwlQ/sKyumlIs+oGIutBBtH0T+YFYGF4pKo/j7Xfz3+q9rIYixhTMGvjoSewmPeze4p
         N1Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwiI6kc5hm9hkRZZj6rMs++D2TLYr2YmV2l6PoB4w9ZbAfW5iH3i2effEnsuhDSC1rmOrbCHbEWgoiU7MI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjTUAmOgLtlVFJyQv4obQKVtFn8uhvbtnjeaF6oYNB4NFP4kvQ
	d7hZkrEhpui5E6lHxdV8CByLE9h1l2vljrtu8HGoUkcM4tmP6hofqEMB
X-Gm-Gg: AYBFou1GsRs0cmJqfTtI3bWC+q0MIi/p0XRLspW+O4trFv4W0kfzSb4ytr9E4l2SPP/
	+VAUWBgsXzNY51r7nIuYSGSs0Ch9Sa4bhf97sKqIso4WR7lzJagWEtJntmO55T/NYqFPXMverE0
	ftmehA2OKsMi4f88u1vEoaPqS2aK/pe+p9ZTcUrRHG6c7CnH6Sl/QI14urwhO+0GfDeyjqcnpI+
	kzWRNgSPvp+mDnK8D3GqcRWOzi42/qMKitzSPzfdncw+Z8qRMk+GxtBOPZt74F2nbn9IIjQgM/2
	GkeCAKUH5a1+dWyx/lojM9ypg5GXndgageMTKBGlR2GvXdJ8Rt0yyJN6pN/3x7Kc/uF34BWobU7
	gs258hxuAMMVKXHtL/pwl91AK+3ZXs13/e7+D2G2zc0WaOU/lTAUDif39EpQjREPeJDfTy72Z1j
	aY0ghAOINXXh38Z0IV8Xb81hNK+fqPXBSjPCZp2FX4eAZb+SHhmTL7dE/YIk6i6xHAtHPILqiZ7
	NIF
X-Received: by 2002:a05:7300:3aa9:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-360aeee9f90mr7930486eec.8.1792299208567;
        Sat, 17 Oct 2026 21:53:28 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm21621460eec.21.2026.10.17.21.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:53:28 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 18 Oct 2026 12:53:22 +0800
Subject: [PATCH] selftests/mm: keep ksm_tests on small pages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-bug-selftests-mm-ksm-tests-nohugepage-v1-1-55ed54bdad35@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMFQ1GoC/yXNwQqDMBCE4VeRPXchKxKkr1J60DqJS5soWS0F8
 d0b2uN3+GcOMhSF0bU5qOCtpkuukEtDj3nIEaxTNbWu9eLE87hHNrzCBtuMU+KnJf4jL/MesQ4
 1kk663vfT6BCobq0FQT+/n9v9PL9GwPhqdwAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Usama Arif <usamaarif642@gmail.com>, Yu Zhao <yuzhao@google.com>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_tests fills regions with identical data and checks KSM's counters
after merging them. allocate_memory() maps these regions without any
THP hint.

With mTHP enabled the regions can be backed by large folios, which KSM
splits before merging. Splitting an anonymous folio maps its
zero-filled pages to the shared zeropage, so with use_zero_pages=0
those pages never become KSM pages and "KSM zero page merging" fails
its count. "ksm_tests -Z -p 10 -z 0", 20 runs:

  THP setup                     before    after
  default                         0/20     0/20
  every mTHP size "always"       20/20     0/20

Map the regions with MADV_NOHUGEPAGE, as ksm_functional_tests does.
ksm_merge_hugepages_time() maps its own THP-backed region and is not
affected.

Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/ksm_tests.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index 5fd7792a0d479..140ea833353b6 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -178,6 +178,16 @@ static void  *allocate_memory(void *ptr, int prot, int mapping, char data, size_
 		ksft_perror("mmap");
 		return NULL;
 	}
+	/*
+	 * Splitting a large folio before merging maps its zero-filled pages
+	 * to the shared zeropage, so keep the pages small. Ignore EINVAL on
+	 * kernels without THP.
+	 */
+	if (madvise(map_ptr, map_size, MADV_NOHUGEPAGE) && errno != EINVAL) {
+		ksft_perror("madvise");
+		munmap(map_ptr, map_size);
+		return NULL;
+	}
 	memset(map_ptr, data, map_size);
 	if (mprotect(map_ptr, map_size, prot)) {
 		ksft_perror("mprotect");

---
base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
change-id: 20261016-bug-selftests-mm-ksm-tests-nohugepage-1414868db0ef

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

