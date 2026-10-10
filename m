Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B98499F1F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634925; cv=none; b=DTeKvFFLCUxFVHryUPBuOQru2DjiIk44FPuK2v7VtBy6aoBqTsRjRtZ+pOc1BEU3Ez6FlPbFQQw/DcedFppbE7fd5kthadctCG95JQoT0UdhpSJjZsAA0f9gGbF7Jph0q7H9G7huPqEn7pC0oAjpRZGFmesWQr0mAVoHCKaXWFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634925; c=relaxed/simple;
	bh=+UGbdLyx4utn96b2/xcf+Uh+5Imv/crlNjbSTvZzmmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7f/X+nsgE8QyOCcrhyXaMH4D4OTyRFsZMEY0IQFgG3RNC11cRixotioeft6cfO9SK8KsPwJYSoas3VZT7VpS63083ymXGSRxO6VSUldU6iCAqYQp5bCJSTyZLRiSKN9PqB4eZ4IpljQdpRkE4KTWR2Cuwr/AgCG4uzON0sdMho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9bfurnj; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9bfurnj"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-141395927feso967190c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791634924; x=1792239724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaO3MyXW3zZwT9bgT7JpMqD2h92koUbOcIHQ/S1CmUA=;
        b=d9bfurnjWRO3Gf7br7KDWj8n7+N3nvrWlhwZtirsaU+COP9+F6YcaVM1p8FA3vWdcc
         zVLTMkWpMJc6SjQAhAH4URIlPZp58OXu3nS8ZEotY2EcuUvfWQo3D6ExHlGQCCBUP+9R
         La3RtI6dw1XQaiEI97IzYJlPf1l9avXzLoAekJEKHYQFxGCecL4VBO0mGb+ojpKUafNQ
         UH0Oj+lHwPpajpBdWzCvtZYY3v2G9PpoeYC5SobqNRUVJCrF9Wr1DXzQ7BF5VxOnehar
         JL+QR4L8+xZ3iP1fo5i/VhFegJ3N3az7RuRqQnUhWx6VRmQfXRxELnsXHNSxKU/c3i6d
         qljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634924; x=1792239724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CaO3MyXW3zZwT9bgT7JpMqD2h92koUbOcIHQ/S1CmUA=;
        b=rb1lhZ1bzBBdULMpNtd11YSpd0Htx9BMMrGdj/pg9nLfNNSrCjE8tAaVlDrlC8xPVD
         GmEoS4iauw2ZN+Hg+fmEkAeVTsFXrhe8Wl4AFP6Mh1uibfTaP3WqVnlJFqYi1Hw2no6H
         s7AuqTl5vP5tKzfDy0Hmm/swZ1QIM59KnMWyXfCRo4z79jpsgmgVA+DTpfQ8NSOX57PF
         aBDxqpuSSpdG6I35wJgVcMSAFugJysAjydaXLC+ym3Li/eWpZ8EhnvuXgqN1+Gxid3Ic
         aPD9srVbq0eyZU14DieE/163osHmXaaKPiJOilQ4lvTIUhM+MJc4LezDSHmSrIcG8WiQ
         iVyw==
X-Forwarded-Encrypted: i=1; AKwUvBxQobpLpGHZ+fjnEH0DYkBCN8+y16lxyfOJ7Kevya+qCjiQUhlsvfcE1hBN8t9C7tqnWxhCAKaKVIruZ+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6bpv0EFi0KdS4Ws0BM4Of7vPWEaux5+K22r3XXYyClX5DpPC0
	5gMyYbFC3oYn0SZHXUAdG71xJWa/oJl+bLhtX7x1ZSPSmkP7zIOprfRE
X-Gm-Gg: AYBFou1YZk1nDHK7WXJlQUoeS1huNOibdPPPXjo+v5s+OIMfQwYH83ZeaejBexiG2gi
	Rpt/kqcyH0vMFeicAV1jGTNKVdAwxorraM6lvTQWkeIdUSEnAm6O6mjbSEl/HOndBlRK3cVqGY/
	m23utRUaRWpM1hQPw/perqpvXONBByxSE2BQe+Wx9QJN8fUtBxAi4ocHFhGRLP712rlcG3sNBbb
	2g1deBDtF7b6/4571acPr/t6slwABYm5xFhPDaMpvn0IbBbwKXlu+KEcI0dTJ0kq/grtLPvRhkX
	iNNlknEQuTzCsfk/Ug8aYopWrL4qJ9lWQP7V8exFP8FRrjNgXmTSxa9qVkK26QMUAhym6xLvAHe
	Epsh1JM+cSdURUOismDGPG8zCUnBhK8Ono5U/NdPFhX0BtWbe7jXWEk0BIwO3osWY8nwHMPdt5T
	IqZlnav/QeGKwlGdsO16qtE3whGGnlcc0Op4BOXS6UA2QL58w/7GLWXtxrr5EyaVXCegDBUYLL9
	UF9UL5llMVfnpfjPcI30nCoirayBpCU1ESkvrYskxLQccRz8IP77WJV46VIAxWvR1XcY+A=
X-Received: by 2002:a05:7022:1581:b0:167:5402:dc96 with SMTP id a92af1059eb24-16a606260e9mr7991587c88.33.1791634923685;
        Sat, 10 Oct 2026 05:22:03 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm15401816c88.5.2026.10.10.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:22:02 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 3/4] powerpc: Wire memfd_secret syscall
Date: Sat, 10 Oct 2026 17:51:11 +0530
Message-Id: <4b0d9e39b98f2684d03ee1365b3651492ddf7081.1791608423.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791608423.git.ritesh.list@gmail.com>
References: <cover.1791608423.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire the memfd_secret syscall. Currently this is only implemented for
Book3S64 radix. On every other PowerPC configuration, either
ARCH_HAS_SET_DIRECT_MAP is not enabled in Kconfig, or
can_set_direct_map() returns false because the configuration is not
supported. The syscall checks for that and returns -ENOSYS.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/syscalls/syscall.tbl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index cfbb70039ff0..81677fdd0d05 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -537,7 +537,7 @@
 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
 445	common	landlock_add_rule		sys_landlock_add_rule
 446	common	landlock_restrict_self		sys_landlock_restrict_self
-# 447 reserved for memfd_secret
+447	common	memfd_secret			sys_memfd_secret
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450 	nospu	set_mempolicy_home_node		sys_set_mempolicy_home_node
-- 
2.39.5

