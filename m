Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8D33B970
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982627; cv=none; b=MkFTtbmCJUR/7a6GxxvpGx1nL1vqISTxty6pafQH5hUeY0sBzUcBHLjDDeSe8EhVmH6eqXS+FkQYCPJoRWd1WrKZPESIkukX85RPukD04CDqTnkueAQryPdv9OhbuT6AFgQ5Obxz4VtEOxVrcGi9pbHRZlUZYor7rgAtpo+ORMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982627; c=relaxed/simple;
	bh=aru3gpZckcqhzLmD1P2HSOiefupvneO2iUB5oqNw958=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nv1FuCKWjV4nz97I4W0MjgLJml3I7BIDvEmRb8Om2Ysbo/Pr7TTi0oYDmdytO/MYn7/sArivk6moRUdGf7CkWhulIGrAxIT7TulCjbtC/IqWzNexUe523C2TsMwrdRNHTmBRmCYs2zueNlut+BoG7TLQiHw8pFjW5aD5OKpP/2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjAKPDiH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjAKPDiH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so15687495e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982623; x=1788587423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBWN6j8OnBuuPy0FKZmRrD0AlW+PPdIjJrnUe6crviU=;
        b=GjAKPDiHLPFArNBvKMyLefBHvLNucNuoYwePhbhaGfb4sQLyCCXC09en94CFYNO1pC
         eH6fZ565GQSH1oU4WpjLr8tF+Xndp9TpBI49LrxFH2fWKaoRHfIGnH953h/MN26lUCuO
         Ergud5VSUpWpV+wWQyQJFmYNBqIPtQII/+xcudqKpXSB/Jzodj/0kc9eEkAlpcvlyc3R
         nR8FGnBuiZAuj/6LH9j/8jR/cj6+1bm8UMLvJDKGhE5w3DccTzdAyeE7OY9K2ebRzxKP
         zwVUOXuu5QdwZFPyirRxjYh7vSYQ0d721cBj6YGS98j18ct50NB67Vmk08T8F60LKVPW
         lZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982623; x=1788587423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBWN6j8OnBuuPy0FKZmRrD0AlW+PPdIjJrnUe6crviU=;
        b=krUbTos63ccOY6PL/KLNqsAP4V6OvWDd7E7ICAJOMPvhgrFXF5j6MZ+nxXKB2toQOa
         50i2m2tDnCp8m5r8EREElD9ZAYY760zt2QMLTmkkOlYkmvvpkczPSIKMUx8tZA+z3PhS
         hbm/yFq0+hTfNdYF2s6YRCa/b8gNGN5H9mubOZsAoe1XL97akDE7qey4sxZzm+YLqI5W
         ohogtO1wFtY03TQUBhIDdzaKMsg+/hwUS50YgYxDlpc1lL4fW9GwZhh6ax7+p7aRZV+v
         AsgRKRwq4jMTHL7zY3JQbo8BUmlQxEJIJ0mf4qb1j92pFPFrokCrEOQbmZ2yUkJkSg1J
         R5Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8fRMG6iLGWmaTFFOuxj5kUn5TnjR9HvQhImzBK8cafkuW9JzVyWf5sqmAF8t57vmZOODlMg0HiqhUiHk=@vger.kernel.org
X-Gm-Message-State: AFuF++lOawhXEx6lPm0X1wcrjUVq6PJ08+AZ+E5INgRiRPArNv+v6bOG
	aq16k6O1rCIs/FGsaDxJZAMpTl8VkaEyYZ47iHl1fmiZf/ADgYCynVwO
X-Gm-Gg: AR+sD12BgdDTwuRP64k7XsHtenlGExzFWStJtDVIAca6rOnggs32k4XzbL0DOy0XTTS
	OXHetv+xVK7wGvH8t9Gazb88UgR8hCEKUaF5mH8b3N/MYdydtVbgew6Wh+DKVmDqXVXGi5VWAGF
	DRvEUCe/GKc/gySFTf1PAOAh9/0cYLIUgGEMpoeENwdY7rRBVnM9Vwyu+KSYSUTrvEyPZPCAK0o
	3HkjbYSvCmu7WdB4d9GispeTt6JZX18vpgK/m485VHWG0RoVaGdSQnudkHeAPPY5KrV2CQh9Ej8
	XEqrTUGhDPkObpAqUiKPalvuVbqMQKMlKoMrpUY8UqBdmbOtm4uA0kwQ6ut2ZczTJP+QBpMpVRC
	Q8PWtAcuIEzeEYmQIYhRMKgfZSK6IK8Ug5Es2/KOIFH4a7uSJ+mhRIeiniJKPNbLO6ze9+waXCK
	0UEzNSfbSmmPs/9G+gwmyNTnaKxpKf+eF/A0zQ/fTHmpHHWLM1cScu0Lab7Abz87nYiat5YxNlL
	bcvGdwpM7n9jht8POm8WT4qjKYDxd9xSneGg32iha8d8XHpLrtNx7fvSol6JIDzBax/JZEO5VFL
	CMfOAokTd01BcoH0f8hp
X-Received: by 2002:a05:600c:a47:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-49b91c50957mr150918935e9.13.1787982622515;
        Fri, 28 Aug 2026 22:50:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:55 +0200
Message-Id: <20260829054856.70549-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260829054856.70549-1-kmehltretter@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_smccc_set_filter() only rejects a range if its inclusive end,
base + nr_functions - 1, is below base. That catches an empty range
(nr_functions == 0) at every nonzero base, but at base 0 the end wraps
to U32_MAX and KVM tries to insert [0, U32_MAX], which overlaps the
reserved Arm Architecture Calls ranges. KVM_ARM_VM_SMCCC_FILTER then
returns -EEXIST instead of the -EINVAL that the smccc_filter selftest
expects for an empty range.

Reject a zero function count explicitly.

Tested with a userspace reproducer on an arm64 VHE host under QEMU TCG:
EEXIST before, EINVAL after.

Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/hypercalls.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index b11b8821c9fb..dfa25bb6f25d 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -185,7 +185,8 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
 	start = filter.base;
 	end = start + filter.nr_functions - 1;
 
-	if (end < start || filter.action >= NR_SMCCC_FILTER_ACTIONS)
+	if (!filter.nr_functions || end < start ||
+	    filter.action >= NR_SMCCC_FILTER_ACTIONS)
 		return -EINVAL;
 
 	mutex_lock(&kvm->arch.config_lock);
-- 
2.39.5 (Apple Git-154)

