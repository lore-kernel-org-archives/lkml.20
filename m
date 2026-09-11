Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEDA37F8C4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102634; cv=none; b=bWI6+RwVJJYk61YnWzrUk4MaeF0bdPDYqKb6WWCFVosePOo89r/7vkNr8LI3R5oYfMleDhmrASslWSUqqHO/CWDhIwyr1XsDFvaSyrD9gDKEH4NjX+lUNF67R6PXxoyEOQT+Ym3aWlIE62NJznAzT4eNjHBM7hl42h2+yJt+jlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102634; c=relaxed/simple;
	bh=cxWWtKOcVRFOfPirj5NlhN1Lr4UnI5/R64/0wn4Md1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=luyDJnUsvYeiqydGTnrfiOLcdOWnnvn1k1ZQWk6qTLpwN7P1c8UobP/p2T+XT/KNV3z/rx+tccE61gtamXusOmQj7Z3RuYPwj9+1fhJtIPzbtI6VXLaNBFZ0CzSooHmsP97oVUPdSwdFQmgdocHv8Hl55Y4lqe4I4+Dqg97YxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0AbRI9k; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0AbRI9k"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso1048a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102632; x=1789707432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vP8L0nOQBMaqyTnSGV2kxiWzOWPb5E1yklPGYnOA60=;
        b=C0AbRI9kgOPa48aaQSPf2yu+IdigwG5lNWBrcV8GHr/HHQrPJv83+Rja8vg/EHtjec
         0zowjmv9MBaXHhOo+PIKiD7WxQttBvp7U6ZRz5TTsx/tE/cElFcrDH93d0L3a6CQRJ2x
         F4jbY7qbtmcDagVGDrsZhFcebbEXcgo2wTRrB43Zt8EmyW3ExSciCzm9mqc6Go2iGYps
         JSw88iz+2zQ5hyu8uYIdYYAp2kbSfU/x4he4SHH5tSomnUQ/PcUq7DXlD1zthIt62iN4
         +P85UQExymba8ZbGWtZ9C4R72ZCkbZ9NNVc8ju6Ox/8TYvNeWpHw4v6svLLma4HBzhp/
         52FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102632; x=1789707432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vP8L0nOQBMaqyTnSGV2kxiWzOWPb5E1yklPGYnOA60=;
        b=Zui0qIVN4FR6QgIEo2IhSyMkQ7032V9rIwVuQYF8WWFndNic17CX6CfRkhHuPWwbYh
         yaLCIwzFkwDtB0Uqpnr6VLwGvl8CSkqOlnIp9kvp2JzGUtKPCoQ0jamA3J3OhmYUb97U
         KZkwAbTS8uNDy8BIzBU2FjX9QWBrzsVveFZgwrQmOA8n18QlJuY0/0R06bARyuNIZ6P3
         72bpk+zQpN52yfmHQu4w6A+AD5Nqy3OWsmABUcXesD70W4Ac6NnSMzDLaFKGUSCCsyQ7
         PVp/Z+RC+bME/B+/hZBPoi+MNchZGKXqXv+89ljSXKJ/e7NONv1hssX/ITD5J26P4HN7
         xHRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz98eCNAC41Pm6vAQXhGJ429pQ/iO5As08CtTo6tIm8kBJLvNnqNk8zIVxy+5giEPerOQScIxiSv14Qkkc=@vger.kernel.org
X-Gm-Message-State: AFuF++mehh62xXM9P7fzu4Pohmdq1oVI2lx73wJuMxQRXfkEaB4HC+sz
	gutL/LDYIZzRJnN/SsVpPSSjyR4Vb+URP2ErYq2iwLhRn4fG9G//Ki2u
X-Gm-Gg: AYBFou1So2mrsxZL8uuJEJjr4aafOfYgVvnlW8jx4mDI4cgp/lICoADrQNMCqqa5kRs
	YJlIEwksuSsO0XPRNqkgpsQIYhGUA0KCxQ7JRouFP0QX08+9m4KKTmZHzJ4tp3czN8u0cmlYQxf
	JgVuMCayl0Nrc0mG/I239yTqdXIRocoOobgvrQy7KmQVmcmRboNOfXVPe83tDm6QWCms55hKJc9
	yfsr9jhUXxv40sQrGfH/WzDno6Vo5XLQl4Z7Ydge5jr15HoGrMElCtFqSmAG92rm+VnjcxW1dvw
	p4B3zeJgYmK/bnHiq4g0qXihtq+mkYVAEh+FklkuH6Yf/UTbbQIRCaJZbQjpXrxoCDs34ZJrkbo
	waPwj8jZysv+02CfePRcCJWZA4zIzQnQGEtf/9+jLogJqfE51J1zeSWYpFGt5jVPK9+876COQDm
	R3RMqqspaLW67Fj43Vm4UJ5cD26AYZ8xp9J8u71sw8hL1GpEJvAmk5anLyvSy40Ot2DfaGW+CYJ
	dlTbocPldK3G3lEkbUlgrU+ppVsJE+62uv5mBf13DK/bo4fOppzr+B1pxL7XDs=
X-Received: by 2002:a05:6a21:15cf:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3daed1c1f53mr4438486637.9.1789102631764;
        Thu, 10 Sep 2026 21:57:11 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm2837953eec.12.2026.09.10.21.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:57:10 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 2/3] KVM: PPC: Book3S: Don't call __ffs() on an empty pending_exceptions bitmap
Date: Fri, 11 Sep 2026 10:26:46 +0530
Message-Id: <3578c377329d39a4a9063c24496d2ac4c31a169d.1789099725.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1789099725.git.ritesh.list@gmail.com>
References: <cover.1789099725.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This problem was caught when running KVM PPC selftests on big-endian.
__ffs() doc clearly says:
  "Undefined if no bit exists, so code should check against 0 first"

This cause KVM to deliever an arbitary interrupt to the guest and was
causing guest to hang up while running these selftests.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 2efbe05caed7..e4152e9a0d96 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -401,17 +401,19 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.pending_exceptions)
 		printk(KERN_EMERG "KVM: Check pending: %lx\n", vcpu->arch.pending_exceptions);
 #endif
-	priority = __ffs(*pending);
-	while (priority < BOOK3S_IRQPRIO_MAX) {
-		if (kvmppc_book3s_irqprio_deliver(vcpu, priority) &&
-		    clear_irqprio(vcpu, priority)) {
-			clear_bit(priority, &vcpu->arch.pending_exceptions);
-			break;
-		}
+	if (*pending) {
+		priority = __ffs(*pending);
+		while (priority < BOOK3S_IRQPRIO_MAX) {
+			if (kvmppc_book3s_irqprio_deliver(vcpu, priority) &&
+			    clear_irqprio(vcpu, priority)) {
+				clear_bit(priority, &vcpu->arch.pending_exceptions);
+				break;
+			}

-		priority = find_next_bit(pending,
-					 BITS_PER_BYTE * sizeof(*pending),
-					 priority + 1);
+			priority = find_next_bit(pending,
+						 BITS_PER_BYTE * sizeof(*pending),
+						 priority + 1);
+		}
 	}

 	/* Tell the guest about our interrupt status */
--
2.39.5

