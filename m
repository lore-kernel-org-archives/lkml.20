Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13D33BF682
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106361; cv=none; b=QJHJsVro/9Le6IvXj5dd7HKuNw266GPA6/TPcEOlGKpJGHzQ1Zoat7YspkyO96PU9cXtPUt2VDklRxpoP3sYj70UBVFLDL3GxOljzqYPPWizxAlKnTrQKEMS+sVr1IEbFMPlPRwk2OeZdYFB6OM4tnT9et+D6IlV6GEcF0jX38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106361; c=relaxed/simple;
	bh=JGZgOh3NLnQ3zE3ReM7hQZC4iKeVrPllBAT/3U7VeAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzzK2i64ygCEqcfoz7UN7aK96rG5qcknQPR0gdo3B+u9FMfFSfQQN4ZmkZHQnch6V/uk5Xmduya30MN9YLagCKKa+ASBNcx7LV04cG7lv6RKIf7JCdSDV6yF7HZ1eOlUA3rPz4TYcbXn4LtaWhqMo0pj/Nk903VumY+eO21RnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eh3SVeDk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eh3SVeDk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d9201076b3so2073225ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106354; x=1788711154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdTRN44Y9INGZlIdKi2+i3Dw0ibf1fzMAsMfvmYvVnE=;
        b=eh3SVeDkcASA+OzGer+RuE0DcyA/Z7AwG/LgS8k0tKLzNk3Gjc343kvpqxinY9eps2
         sNQkpKxgJcpZE90lODYoh6ADaFtdRUmPWhAF1jOibWZ9prjWX4lPjvcnZTi6eAA/9/uR
         QJsBPMSh5WdHVseSoEyQaYSaF3EyTjNViy9w9BG1f8ic7S8id4mql7sN2BNU8Pw/QJfl
         7OB21SgLqvATM3QWYM26MFOCDsRO8ur4W1qxaw64PaSc+nZxUDNkiVDhG4POVnF3PJJ/
         JZdrBzrPQqD1tK5vyagt346JAawxRMwXmKUX9iJCh/trrt1h8m7Qu5b0Z2KhIFJ1A0Pa
         HxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106354; x=1788711154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdTRN44Y9INGZlIdKi2+i3Dw0ibf1fzMAsMfvmYvVnE=;
        b=FxD1ubSvZW6IUD4ezKy82GlL/k3DKyBzHf8HuFn9D05uLGPS1zpze3LsgtpJ8hGsJw
         JbAjQM5ezRsQfo0yHzUUUs5fx7oIQL8aZ6RI24US5tdjUXsgqvszaWUTBOFNVlii8h7K
         FMmV0zoUI3NH8Sgaia45L3hhfR/SG6RwYlTH2RuxB6RaQsKa71sK9JOdpchgbs02zrlW
         FSG+l/9tmnRA+wU4RIY7UbWadOYfYEjL+PAFAYvsVoH0HOFL+Rf3dfQzLOl1fOxEAVfK
         L8eR8r9LDSFcykRahF6rs0W3b9sAeoaN88Av0KATbG8x7ms+IO/9+Ovpu1w1ocmMEMtm
         KzdQ==
X-Forwarded-Encrypted: i=1; AKwUvByPvGxNJ+kJ0NSgNWf0NZ8UUuOrU4HZlX6H4jUoVvYEnuoRS7j8oh9bXG8KSfDYnwpZEmFpcD6tCvoXpls=@vger.kernel.org
X-Gm-Message-State: AFuF++nV9R+9sRaNy7tHJLeEUBW3BbjST9Ti1M0mmn7cyE08Z2uwfL8E
	mIuO2+TMJLmezKIMnmkji6W+xICLT7yQT5CRbtbaA8nfo4EpkzAiRmZt
X-Gm-Gg: AYBFou177yyIP4GTmuLRsvrQjgwKRpuiQ5QH/rXy5hDc66N2G03WFkGjUOl8lVt7LQy
	TWmjTfNdtGvyk2bsw+4xapwkiVlK1I+GxeQaTS0aUJQOLJ2Q/nEaxZw1gPfqjG7jBXAy4WajhHq
	0vFjq5C/A+xnwi+Z5AQSPEJBNrJoYAyAKwWz8aI1n2TxFQ5UpWtXAASIYfe2nKmodW9CYCVn9xT
	i+MWsud6yKsdfPWkBF2BUGPb6IKWeWzQ2qNQgt+hTJxFz6UMBDmMS2EQfieTdzwPqVXj7KOFdfB
	evST/qFPhyi8U8LziRSF2V0cO9TF4tDSyZJrq4VWVddIoVxVeUDlbWb2Yf7PtVjN6egYpfTffEA
	BL7C4hjC+4PVyFPk27AlujXxqSlIUMNwWJsqrit8MoK7/Eeg1rFVdspf9rXLiFxCPBzrUZ1c4Rp
	fRGk7dI/2d8SWd5BMZuVSouL1pi1rrZ+ghcWZ7ak2ejoq9dg+N9pFZkHeKY6Yln4NsVUorMQZN+
	fTMeKMPR6W4U9Jr3rJU3ShM1xGMq0jx6BY=
X-Received: by 2002:a17:903:1aec:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2d74dc6e97fmr364985975ad.1.1788106354469;
        Sun, 30 Aug 2026 09:12:34 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:34 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 2/2] riscv: mm: correct the stale RV32 TASK_SIZE comment
Date: Mon, 31 Aug 2026 00:12:05 +0800
Message-ID: <20260830161205.80162-3-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830161205.80162-1-lambda.jinyu@gmail.com>
References: <20260830161205.80162-1-lambda.jinyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RV32 defines TASK_SIZE as FIXADDR_START. Its value depends on
VMEMMAP_SIZE, which in turn depends on the configured size of struct
page. The fixed 0x9fc00000 value in the comment is therefore stale.

Describe the macro relationship instead of replacing one
configuration-specific address with another.

Signed-off-by: Yu Jin <lambda.jinyu@gmail.com>
---
 arch/riscv/include/asm/pgtable.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..32348787462c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1231,10 +1231,8 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #endif
 
 /*
- * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
- * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
- * Task size is:
- * -        0x9fc00000	(~2.5GB) for RV32.
+ * For RV32, TASK_SIZE is FIXADDR_START and depends on VMEMMAP_SIZE.
+ * For RV64, task size is:
  * -      0x4000000000	( 256GB) for RV64 using SV39 mmu
  * -    0x800000000000	( 128TB) for RV64 using SV48 mmu
  * - 0x100000000000000	(  64PB) for RV64 using SV57 mmu
-- 
2.43.0

