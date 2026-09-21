Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E648166B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989272; cv=none; b=d4EXeISgfSzmmLbCICTPkGJ//mhsWGSB1+4ougjzaA/oTit8PMUdGzpYAcLrRJhNMxk2m8r2LTflH3kQnZhz3UcV52rLLSoKjfWi8CkfPdI/Afd14RUKlEC4nn2wQDvgxPsTJd0rUdOJJ3cwikxplQMSWrvcND97mNobavrmATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989272; c=relaxed/simple;
	bh=7Kae4217hH0Tw1s8Lang6k2eDbR1kYC9KLQLEwPXcls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RilywflfUzEcKq5FNprqzm5ty5LI3xmiqFgqDhXjv+r2vGAZLQpcGNu4gSDOIn9jXKA8OCUfVPRyz10SZprqgn7mhzH/+jaL8Cs/saDRUzBtUCdqub93AjJQXCmh4kbCV05ZTF9Ev69/9LP19pFBF9fxh8PVUxHpexCLFnfm+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akv8dRDA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akv8dRDA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so35119185ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989269; x=1790594069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=;
        b=akv8dRDAowJJaGtSE2+iStxSucNPJR2EobwMNJlRn5kFYUqf304XU8CgS2vO+V70Gi
         mPt1LFTAhbnvz2qSbwAcb0q9Px18DmpgdMkDZi7KiFkyFu8RIcHZgeDpLLGQmIlJmqoc
         jFUTsRrMCtZxq86tf0goLgFyqPNxicnouR4ss+edX4Fjdz2NOR0F5Ehap002/c0yfzf9
         /2tHD1razm0kYGIM3JQPZ4VHJxpLM0CaFHhgDpGjs4R4bmisi3UcL9LmeDHPwezc64T5
         jngsFWsnV5PJr9XM6q/EjSp431z3YLDMY8TQKIyQpymaT9OfPf8dEOBZEwjO18XDrkst
         8YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989269; x=1790594069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=;
        b=GFAvjE+Y54jVVi/m1JIfaG2YT56w67Hk5N5JpDxc4dWEFsxV1Hc/yRuNvA623rjoEC
         2yXDo9OIBm+M2J9Z3vU3yEZr/pB6wzMlZ1Fqwf/+aMOh5RDh2dGNDeSVGLJEShAmvHxw
         kpXX+XKFY4PxHg5e0pjtsqLC4FyiS/usaAQNpulxdNQhGl/YBmOi820ZmkxIq8/i+sYT
         E1tE+kJCI+vyFrq3rqwvCY8jeJou43R/adlZi8fMU8uIB/tJnTceeY487i9mEwaXkwYx
         +ZdXW72SUv5HLb900KRsIbll7dTRFfb2WYZ01P1v/MS7Zs+sILW4TkLPiDrlL+paQO1x
         kyjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzalfMI3FBL32TBcNp7fOWGSpBQkZvUzWY/JxHtkSl5ZPuxQneccQWgRyI4E06nExj3O+8z8rVbs8zLcQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lseNotc9NLuSCcERb72trMFXvWId/VWaOKUWOHTJjCEXXvtiIj
	IYBTkY6ht1ho88VipaJETe6wl+yf8y1BbYc/H4770+hhr3wGKr1vl+Wi+daCzg==
X-Gm-Gg: AYBFou2OqjY/6BonYZ3ZamGbr3xqk3hC9cEnoVXb+pKoon4FVMN850QxfhDpFUnfgHk
	PwTvRUefTAUF819tpb8pNO/fRE7TCmq8VIno6TJkmw38TNyvb0rB8tTGSzqS8WmRzI53WH+UvUS
	OuxJ/WmLcj+6WGCqiIha6DLu/wpGeizFFDJg7dmSzBFnod4OfQOzjYucQs8uiOuQGWFMY5/Wy0/
	zYkXNEiH4E1+5YP6+BKRPr4IPhejCnq427/jCT6ZfAaoucmGGckXkTnyhNBPdxIw+cGkK5+0Cmh
	WDUMzeH4F/ct7HswmKycCXFvMlH9oWpZQ+7VM+uBttWgNkfMWjnDswsZohZQ8TI5lhPf89acKIB
	5FTmsHvYRuQTGDTAs3ssjGO9/McXKmeSOFtIj8t9UuH9QwfHos4pvwU+Ag+XNTukG1F+PQr6DfS
	xv7cxStUEJ991U8/+E3JMttF+upHkElmvwEza8i40ICdJLU3mSyQ/vxxFvCx39EWAbnNoQnIk7s
	2iedRVvBLKV/Vw3e9M/tg==
X-Received: by 2002:a17:90b:1cc8:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e54d703dbmr15998993a91.15.1789989268553;
        Mon, 21 Sep 2026 04:14:28 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:28 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 3/5] KVM: riscv: Write-protect G-stage PTEs atomically
Date: Mon, 21 Sep 2026 20:14:00 +0900
Message-ID: <20260921111402.120911-4-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GSTAGE_OP_WP clears the W bit with a read-modify-write of the entire
PTE. Lockless aging can concurrently clear the Accessed bit, allowing
write-protection to overwrite the update with a stale PTE value.

Clear W atomically with test_and_clear_bit() so that concurrent
Accessed-bit updates are preserved. Its return value also preserves
the existing behavior of requesting a TLB flush only when W was
actually cleared.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/gstage.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 944fa4c95aea..f7e4756ce15b 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -378,7 +378,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
 	int i, ret;
-	pte_t old_pte, pte, *next_ptep;
+	pte_t pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 	bool flush = false;
@@ -408,13 +408,16 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
-		old_pte = *ptep;
-		if (op == GSTAGE_OP_CLEAR)
+		if (op == GSTAGE_OP_CLEAR) {
 			set_pte(ptep, __pte(0));
-		else if (op == GSTAGE_OP_WP)
-			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		if (pte_val(*ptep) != pte_val(old_pte))
 			flush = true;
+		} else if (op == GSTAGE_OP_WP) {
+			/*
+			 * Clear W atomically to avoid clobbering a concurrent
+			 * Accessed-bit update by lockless aging.
+			 */
+			flush = test_and_clear_bit(__ffs(_PAGE_WRITE), &ptep->pte);
+		}
 	}
 
 	return flush;
-- 
2.52.0

