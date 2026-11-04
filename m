Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753615;
	b=spPXNA8ppK68Uh7Fapz5quOog92i4z5OZMaZYP7c91RnRRlSLjCzcPUfXsJWBqcFVqgL
	 IW1jxp70Q7eTABw6v3sbKQ92LwsaJ+hEQlV4N1HNIeKYrikx9xHTVn6yLfbTT8hwkjxmK
	 A35h/+ydz1eY3XLG1w9KUgRoa4JMr+58C7fxXgKxqzapmBy99U6RjGsKEQfsQbt7jXUUp
	 PUdaheSZxahCH+vKGrBhiwnlpqHYb+FpLYp9XkBmNvR10SfAdlP976DfBYnXKqpAcjKcB
	 hneFW6PxF2cbUkPGiqe1h1UC7ArL3rY7NusggIvywMMkExeVEgRijmiOcGbANMmVfaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NmshGrU9cm2MP+9Dmq54/0RJrGESLEnVpwqBYvzdIOc=;
	b=Ome+9qLnrRWO8o4E+fIwPDUTZY0OKD+2fbgvlYI4iz2cQKqooihDZKmPBch/BNHURhjM
	 L0iZGepXpixf9TmqkebXoiMF1IgmY5LAzblTAcT2Pw61G6rr3l2gMvaXm6E3euCYc2lRx
	 SJ///3okBGb+R1wLemYdroGxeCPeqW3fBSUmxBBsQRarGjtKIg90TABI2qLYgmer+6oih
	 X14MqnaHmTS7qHxj+hvdAQgc8mOfq3xjxatxDXH7QCPNQPkXchIIK5To+7i3sQlt7geT9
	 qYKRBykWkgcxJ27aw6mvVrfVd+JdsohEG80mLaKHVxW2SSnnm957/dHM8ih8MSj8z9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PV0XSk+R;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D16606A33B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D16606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PV0XSk+R
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso662135e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753613; x=1794358413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmshGrU9cm2MP+9Dmq54/0RJrGESLEnVpwqBYvzdIOc=;
        b=PV0XSk+RiXzZLnfdK7BHeD7PwQjf0KIhSoYUAG4jvYEMkwOi/HTiqb5Tt2BFU7/+OT
         615OLKzCNdhhr4o7YYfKHbW9YoYXPrQpcu618zSMH6DJhCqjgm662TWTfR1iGVCT2fYY
         +nODwyALbvS/RrcgtxTvMs15lL90npMP7a3nHBmdjmg1gx/FK+FLyeKXaPPbYhDkYbHI
         GGCnrxoMSQwwC+rSZx0QKUF9DUdGcfkgaoSSUUhqWNdjgrIua0KWDWM+/rCSfsk+L8KM
         KFxoLYf46wSANsd5l5csVOATXWwcZjNiwBSkwfoRCuwvaWbJI9i0pKyLMOzwFFLawD+S
         pt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753613; x=1794358413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmshGrU9cm2MP+9Dmq54/0RJrGESLEnVpwqBYvzdIOc=;
        b=SlUoDa5Wop6ymd+OdIRv5ES8DY1CwffI2rYGJqxPX1QaLErJCuL7kqCqkj+ubW5KOC
         7jhKp447bsSPHh8PRg/+FNaqiRkoKattsEc2TqS5q4kCPPriuHf1uPnGFQPVcjWgxVYv
         0un6NTFY+5Y7Rt5Jl/03AhX7q3ZSkW2OdP7tnx4V3KIzcDvjgcKoNBHzlQQiW9/Ndw4U
         S23hpP5XMkWMoo6ISxGvGk7FovEeEofrEZeHKyBbeijQoLKjrWQe/kzEH+Fwc+NuhhyT
         +JDx11lF0amp3qQT8S2qDhpapD/NIslW2TfKVeww6dgMsw5PY1GSoY2UB2tR9RAwvDyD
         hFKg==
X-Forwarded-Encrypted: i=1; AKwUvBz1zrMdJzXOTG1WEsOr0qcOwXriymyFvUFaCj4Ha66alv/2KiLUt+fLaiY0syt6fx4GAzj8XxbBwfuJM1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z80yGjIBCbie07dWaM+WqDBxoGH1AHHJB5vcPrgcMASjuX4dopv
	GBTJPpaf/RHpZcqsiI32uvbS2aoni/IUabkiPEaW14a3NDDv0Dqm04tv
X-Gm-Gg: AYBFou2p/76Z+EheiIUZvHWxjBWjKDERQzY0KylGXbuuEB+CnIl8ycdx6tTXJUXlL8q
	RQwYD5M81BYl3ln5EWf/ZprJIiHoX9i1d6KWejTmECSVnrpOy2nJPbPEMLn4e70NSCjSUAcACZk
	5vCw1hR1PnvoS62ZgTPKwhmPvABC+8CVX/+g1GT6bCSBF/l3mkvFy/dX/NxnBhYkaPGGtmTRkWu
	XOodzG/KLrWwmOAdMlH9MpHlQNIuHk8um+ObqNFc3Z0z0NcnWPRg8dc5pYBsxlFWixh0IM0+d0q
	H8rSbO7GDz0QrOdgkuVPIgMoVrOVbmjQ6KDYaSFMbw0ACQ4gIET0DnqxgiNvfMi4qPgE2/hX8SD
	vo63R3oshkuzd37oBFng18uFO6JZKGMKQUgOlb4WDfTa7CtvOR54C/1MrCvcoXXGxWkNZtPZrMh
	fashl2f6EQnbdk+GWtQyx7z/LnMLbXNaK/1A66Hb/ynAyF6BqUWSzRfLeZZxia76iJnUHb9Pvr/
	PnvdX/F4IIeyrKfgOn9Tt4NkkHS+1yJ4WNiyhI5jWIyUHkdQ49H1jKATVf5OqNUWOobdSwh9HXo
	kQ9Ad7cpeMujd/tpEBVF4wmyqqTFByQxUFLiiKOnnl6Wh63IhOUcO1SPMZd/RbVRnfQk170cAHI
	yhenNbzsyAGjDVPLaT2GKITkt9AYt3YVgolIi7Xo8RI4BzkPyaPM05UKA7Q2DZS6lOdDOSI67XY
	OjLgodPb7aDZg=
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr344017775e9.18.1793753613516;
        Tue, 03 Nov 2026 16:53:33 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ed95sm11899275e9.4.2026.11.03.16.53.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:53:32 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	James Houghton <jthoughton@google.com>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/5] KVM: x86: Count rmaps per level in a debugfs helper
Date: Wed,  4 Nov 2026 00:53:28 +0000
Message-ID: <20261104005331.50600-3-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104005331.50600-1-griffoul@gmail.com>
References: <20261104005331.50600-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

In preparation for storing memslot rmaps in chunks, move the counting
of one memslot level's rmaps into a helper, so that it can later walk
a level one chunk at a time.

No functional change intended.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 arch/x86/kvm/debugfs.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index 0074a56e45b4..923424011328 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -86,16 +86,30 @@ void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_
 
 static const char *kvm_lpage_str[KVM_NR_PAGE_SIZES] = { "4K", "2M", "1G" };
 
+static void kvm_mmu_rmaps_stat_level(struct kvm_memory_slot *slot, int level,
+				     unsigned int *cur)
+{
+	struct kvm_rmap_head *rmap = slot->arch.rmap[level - PG_LEVEL_4K];
+	unsigned long lpages = kvm_mmu_slot_lpages(slot, level);
+	unsigned int bucket;
+	unsigned long l;
+
+	for (l = 0; l < lpages; l++) {
+		bucket = fls(pte_list_count(&rmap[l]));
+		if (WARN_ON_ONCE(bucket >= RMAP_LOG_SIZE))
+			bucket = RMAP_LOG_SIZE - 1;
+		cur[bucket]++;
+	}
+}
+
 static int kvm_mmu_rmaps_stat_show(struct seq_file *m, void *v)
 {
-	struct kvm_rmap_head *rmap;
 	struct kvm *kvm = m->private;
 	struct kvm_memory_slot *slot;
 	struct kvm_memslots *slots;
-	unsigned int lpage_size, index;
 	/* Still small enough to be on the stack */
 	unsigned int *log[KVM_NR_PAGE_SIZES], *cur;
-	int i, j, k, l, ret;
+	int i, j, k, ret;
 
 	if (!kvm_memslots_have_rmaps(kvm))
 		return 0;
@@ -116,17 +130,8 @@ static int kvm_mmu_rmaps_stat_show(struct seq_file *m, void *v)
 
 		slots = __kvm_memslots(kvm, i);
 		kvm_for_each_memslot(slot, bkt, slots)
-			for (k = 0; k < KVM_NR_PAGE_SIZES; k++) {
-				rmap = slot->arch.rmap[k];
-				lpage_size = kvm_mmu_slot_lpages(slot, k + 1);
-				cur = log[k];
-				for (l = 0; l < lpage_size; l++) {
-					index = fls(pte_list_count(&rmap[l]));
-					if (WARN_ON_ONCE(index >= RMAP_LOG_SIZE))
-						index = RMAP_LOG_SIZE - 1;
-					cur[index]++;
-				}
-			}
+			for (k = 0; k < KVM_NR_PAGE_SIZES; k++)
+				kvm_mmu_rmaps_stat_level(slot, k + 1, log[k]);
 	}
 
 	write_unlock(&kvm->mmu_lock);
-- 
2.47.3

