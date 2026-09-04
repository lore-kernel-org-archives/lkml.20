Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5E4756B0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518961; cv=none; b=Q7TChK0YZuv6QS64/X4jeMiQa1vqoDlgl5IMljafq8qjoHVc2lgdgFbgB5g+5zhAHonH+WwHQB+oZM0HNo4Mb9zaeY5PvIYALkrNoZHCLKzSluJwPyfSzbnqHPlUbKsjmBnuu0ih0V+bPX0dYlD5/KOOUMfZ7eN2l2LxOu+Ltb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518961; c=relaxed/simple;
	bh=tczxEPhDZekUYJQh/yzbAsBc/H9nIQNGVJIOw/Ab3Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNYYIsfH6Vbg0bjJQDoQSrfW/1EYsJJpmBACqihXv/TWht7uEgu5NhhZk6xxrJOIa9CZUfQ9MLxRQMuXocZjzCpTFCe08V9w+qgci6hGesQxXoHPdOOVDpDhUeNK64TjcA5SLH9Z7Jw7Q8ERpLbN0H6K14PImMVcF1X09XASKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSp3mSpN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSp3mSpN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso5083145ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518959; x=1789123759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvTqQo1kkFi/Zlhj6jPmbfvUoufzoLUlgQD0pvdpiaY=;
        b=QSp3mSpN8Ui/wFjtni516CTF/Y0Xvt2z5rQ3g97FpDjY7Avj4GPquuKL1uoL0A4QFA
         lpUsKvxXDZXybeNvJsTS3djxMMQCRf7n7daZyuN38ikwXryM6pouA3kYPlZBRhbGqitt
         wgV+ZD6DG2c5Y+OA3U3KxMoZX1B0iAEMRnFhB876btqDAUEckRa8BjI81yOruWZYQ5/K
         EF+QbFkecB5J0/ImqmuqazKQNkg4t5qysEsmA01QoMGX49rfgnO+e+UPU8agNrJDacoK
         1NS8GBVFij5MbSBUOUQev6SGQzXFDBCCa6zGi3ETnrY+99pUhPfaWzY27BlalAoECocR
         iWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518959; x=1789123759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvTqQo1kkFi/Zlhj6jPmbfvUoufzoLUlgQD0pvdpiaY=;
        b=komZvJ+J6idoQ4gJiIISM8Y0FGXZgj17KLSX+z2aR5XfW5Vtve58A1uBYxY6pd8AqL
         79vs0111uQKlanA0kOg2X5CWnwyzSUVAadFHDaMgC6lFALkKoX4X9J4gy7fVt8T5NYBy
         aLUf7Tspcpvv3QIyT/CRrbok1zLZZotq+1KDr1z7HpijwW+XQNT4nsR7Sdbu1kU7Xqg6
         T4LDYBj71clYP2fYa/wVK5EWAijX8lK1T32PIiaxf063B3sUmwko1whUEjYAsK0KmIXu
         JHMPs8S+oBMhokTbzUlzNu95ua3KNZhxEE3x3itYkATF/8r1f0r/Ov2UVp9DeaqK6GpL
         Z0Ew==
X-Gm-Message-State: AFuF++k0D3krX0268A2N0T1sdHNmi5zy/Z1KgvXbPEo+P1BVf6YO3yWY
	aJkWVacNm2ysdV1jLj1orLY8hNRtihi8QxH3yri5ylDWcncx8v0nlLvC
X-Gm-Gg: AYBFou0Mvg+SMT4ekn5s7kb4dOXrWPngQ3Iqsh6GRrAXZxtdW4rtXnQQ3z32mBpw1UR
	iCp8Tfzbfs8EQ7+gr8omfxXThgrFSg7wcKsnxId+U+CoyMUn9Py/cGijL4MdKX0vYCpnqCW/YBg
	SdUWebo/awYqOew+kSaKQ9P7SzDFpfWNQTCzCyt7YnoGH0WqXEZi1nLdEA6js8kHUgqPZfGTDjx
	wGY/Mq3ilF7yUCc7tbftcE8CxugdPMJ05JIrGOAu/xQmQQ3tVR61PA5LZjms9YFIsETMR0mRU1i
	byHshq5QYOBOibVYIDF/UF4aH52UvZs5Cu29DNB65qGqhR7Ijyc4UITd/Yfj4N7pk0KwXZaMJoq
	1i3ug3Oi/8PC2koW1hwLVZWiuqjyh19//tf7w+4F/rOCPrwhWdi0d8xG40DzAdLyCX6+Q96Q2aB
	BJevCNDIaweDrdD2N/K915mHiOOHgXYMf2XR6gZ233QeqDorFiU8pE1JqJaWYZNJTmAgUAk0SQT
	l0f2XREsPA/zMk=
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr8006465a91.6.1788518958544;
        Fri, 04 Sep 2026 03:49:18 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8583927eec.16.2026.09.04.03.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:49:17 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/5] mm: fix typo "mergable" in comment
Date: Fri,  4 Sep 2026 16:18:49 +0530
Message-ID: <20260904104854.25272-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104854.25272-1-hemanth.selam@gmail.com>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "mergable" to "mergeable", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..5c856b78ddc2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -587,7 +587,7 @@ enum {
 #define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
 
 /*
- * Special vmas that are non-mergable, non-mlock()able.
+ * Special vmas that are non-mergeable, non-mlock()able.
  */
 
 #define VMA_SPECIAL_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_DONTEXPAND_BIT, \
-- 
2.48.1

