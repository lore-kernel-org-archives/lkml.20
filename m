Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8235201A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789704145; cv=none; b=cuG5kj5r5DS0BKZVBeOaVVajmA8myfZZk+FgzXZqs9IWvVJZs0pvHmyPEduSa/Xxwgix6SEinR6/0vF/jph5XS5iTbdZfEfmNElb8Kv0wk0ANKlfCn2luxc7cP4HuwfjzIZccTS8b+mLweT0HD5dQr57vzn/EKDAFnrxGDB1hfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789704145; c=relaxed/simple;
	bh=P2D+HO4mVjiiJJBEZ4gNAXhX4ZO8+x/M6mEGCWV3xNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZtlWLNazvcOFljoLKFnY7ne7tlRAlNE/lYb+f9rQisA5ql2p6T+/FaBcYJP+7ieBfS+hYxiwsAKevEawf+AUBwpL9iNdIns7uY8pJQ7BWcrjy8Wyg331+0NM5xyVB7Ff3+04VilER64cnusFpZi0g+EXJGLZG/10PktBK3Td1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT3rNZw6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT3rNZw6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so278447a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789704143; x=1790308943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwTY/5NxTgAeB7jQNGmeRkMgpBA9gU5D7GhrWXLQQXk=;
        b=cT3rNZw6HQ3NA90x6PLr2cVwAKAZpYNZ9XhM5Iu2tR1GrBFN1m29el4Vjgkh/s08Ap
         Au8Nu/2R3GweDon9H41ogDI4ED7wge/BX8mdcyN+4tpuEp9/UJ6dR+/BisaEf/yeckRv
         TsIqKy57dCcueVKeXkHeeRTtGYWxMdH6AQOhwzeF3V35ssk+LfeubemzbQih+MeEq9ga
         4rX/8V55ZWShrYUgYEoxCfLBDkLMicQphO8CORlB+3kkPntf7oDdlFBKjQwWBLm0B5UN
         mUVsPP/XbHji8rXL0Z1YMjsu0lKIN7D79HV0ly8JNxwNOULTsTDfWXfN/B/ev9Vp7bGB
         bzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704143; x=1790308943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwTY/5NxTgAeB7jQNGmeRkMgpBA9gU5D7GhrWXLQQXk=;
        b=JOaSFLTLc/BrcfmSAaCOgO6sfkCBf0eiibYvPKp8eL/WinEOuNTonZT/blNk0VNA1Q
         r2imYyf39S7mAx81uNP0VTc7pO76ysIazsEn5F6lQpdR47Z8Jrd6basgH/SMfthpFXPx
         9dO6sZQRhJ9lWSiqJXC4gEgK6npwygLqrkJKbTO7D+LzEA6+n4/BQn4u6v5Fts79o1Zl
         Xo60jZQs+wrJVp1VjDNQNFMn7MgVDU2vWdTWLseJ1RNfKInpOJhL33pYB/ivYSEODOwf
         KXMsx2hPk6MfmFfB7fI3k4eYpHWNCyMKqkEWzvwTDj7YR/pqLOBm+KmzL5FSznz9Zxb9
         iHxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTh1IhaoDEc1pxQN3qNVh7o2he+djpaMc+5/9yTibUTwChEmBWM0jEvZqHxXlyyGbEsjNM5TL+SutTQW4=@vger.kernel.org
X-Gm-Message-State: AFuF++k7a2ByiXQGFXb112GiCHpWPHm+TpMuy+793ypcVRQ8v/yK9fBG
	9hnBeJLidUMyV5xdupCXMpaxr5itmjNuWzC54pajEE/tugEOntYjOZxfjs9sjAugXfUVOg==
X-Gm-Gg: AYBFou2ah9J3W5BdTiVwFCGiFIX2GP0uznwNWVsAdpnYhgYGba17vG38BGQMQ8zJGQD
	wWck7x2lVAyecEgnaBc0j4uIt0D8FM45jPBDxJ7cDHfqBz2VqpMaBW3/3Us+sRJMziwqC0RGatY
	bjDD3nOwO2ZsJkiQF4bkBqkcZnLXcFsb7xuApCMfyKOaE1E8A00sMO3rd7PFzCGBEEKdYYJ+hhk
	tEXC4yHwcs0YaRImuNM/gRFJHmHiQutKTmDVYxNSVYv4HpY7u2PTeFwHBjanQ+h0cX3m7PkZu/b
	6LXp1v+Lh0AHuTXfShi4b+3gYo6s/XUPEj0OoZjl6VV3VK8dYPGMydydoeRlZmYemCF21EaT4/s
	le55K3mZWC6FzXu+VRWhNDuJoqLIgNl7yevjmiRvMKgxwt2AYjxF8qBSR68EQA5sQNmLZLmsqL5
	qJLAV9uZe57HMMzD1E0ldSUjJFUPIYcHPTsWB2rnJ+MhFArTNW4LawxPENfWveANihxvk2ABdbf
	7XY5hMtivSV1wgdoFIY2hkcrmcQyN2R139+nsc=
X-Received: by 2002:a17:90b:2fcd:b0:39d:ecb6:8d40 with SMTP id 98e67ed59e1d1-39e54af2148mr3003726a91.4.1789704143301;
        Thu, 17 Sep 2026 21:02:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:608a:778a:c473:ac82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287be968sm719908eec.26.2026.09.17.21.02.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 21:02:22 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2 0/1] KVM: arm64: vgic: fix UAF/crash on remote LPI disable
Date: Fri, 18 Sep 2026 12:02:13 +0800
Message-ID: <20260918040214.85580-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Hi Marc, Oliver, and KVM/arm64 maintainers,

By code inspection of commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount
deactivations from AP-list tail"), a race condition exists when a remote
vCPU disables LPIs while the target vCPU has an in-flight LPI in a List
Register (LR).

Specifically:
- vgic_flush_pending_lpis() unconditionally unlinks all LPIs from ap_list
  without checking whether the interrupt is in an LR (irq->on_lr).
- If the LPI in the LR happened to be the last one populated, the per-CPU
  pointer *host_data_ptr(last_lr_irq) on the target vCPU is left dangling.
- When the target vCPU exits guest mode, vgic_v3_fold_lr_state() starts
  traversing ap_list via list_for_each_entry_continue() from this unlinked,
  poisoned (or freed) last_lr_irq, leading to UAF or an immediate panic
  when locking irq->irq_lock.

Solution & Scope:
This patch prevents unlinking LPIs that are currently on an LR in
vgic_flush_pending_lpis(), ensures *host_data_ptr(last_lr_irq) is cleared
after folding, skips the ap_list walk when eoicount is zero, and prevents
the fold from resurrecting the pending state of an edge LPI once the
redistributor has LPIs disabled.

Note: this closes the primary race (the last_lr_irq node itself is no
longer unlinkable while in-flight), but the fold traversal can still
race with a remote flush unlinking a subsequent non-LR node in the
ap_list tail. Fully closing that window needs the fold side to take
references before dropping locks (in the spirit of the prune-side fix
in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
interrupt affinity change and LPI disabling")) and is left as a
follow-up.

Changes in v2:
- Added the fold-side guard: vgic_v3_fold_lr() no longer preserves the
  pending bit of an edge LPI folded while the redistributor has LPIs
  disabled. Without this, a flushed in-flight LPI is resurrected from
  the LR pending bit and re-injected while GICR_CTLR.EnableLPIs is 0
  (spurious LPI delivery to the guest), since the injection path has no
  lpis_enabled gate. Thanks to the Sashiko AI review for pointing this
  out.

Yuchao Zhang (1):
  KVM: arm64: vgic: Do not remove in-flight LPIs from AP list on disable

 arch/arm64/kvm/vgic/vgic-v2.c |  3 +++
 arch/arm64/kvm/vgic/vgic-v3.c | 14 ++++++++++++--
 arch/arm64/kvm/vgic/vgic.c    | 10 +++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

--
2.53.0
