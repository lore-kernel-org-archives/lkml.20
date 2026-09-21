Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2265192
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982480; cv=none; b=WdFTQ9/l1owQO0iYa1st4T2bu5sgCgQrhjmjx+3eyRkt/cbOMgEND03XQVLe8pMDFUfadhZqQbzAZWcq12Bn0qLqSz+ki3/v+OGj9XX7y1SoNbB2EXGi0emJn2MoACLihpTWgRyDknYoFAAs2KQOMcPuZTeEuYqEsIAVi6KCBcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982480; c=relaxed/simple;
	bh=p9wumlVh+NigARe/hNHlq/5AWXnSuIRVak+u8Msihxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ja1YC/TxnOSjkhWkQRAvpZ3W1YzIujylrXIU1R2pIrh0dT4NhJzFcLFchc3bSAjGd7wAftTnbPq4LygcM9Wxk4IFw+5gD1T9az9ko8NLpH5gxVlf1VWZ58CSFM2iCECTp2surCQSWme77l4Iy5JNbbmoq6nfk32kY5bCpQhmnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lW8SsG4/; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lW8SsG4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GFSIsMQcKZfV6HFvSNGKjPObHTYhy+3ZyOIcsVhIHz8=;
	b=lW8SsG4/82mGFu85K2dkdcA9wXqw5hVQbf2hwEuT1nnrj7SVa/24nyljLpNw/z
	yE3LcRMshosKcDPmOxoLfQ8c6LpYtt0zKhUEnBeO+qdi+CuZjvdVHH2VrFIPDBWd
	MHFkQ5u9Gf6mORiYZveMClE20sbL/F/Z1Sbo7SXANK334=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXpxjk9rBq1NUKAg--.36668S2;
	Mon, 21 Sep 2026 17:20:37 +0800 (CST)
Date: Mon, 21 Sep 2026 17:20:34 +0800
From: Hao Zhang <hao_zhang_kdev@163.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: pvtime: Don't lose stolen time on failed
 updates
Message-ID: <arD24ru13owcE1Ms@192.168.1.215>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CM-TRANSID:PCgvCgDXpxjk9rBq1NUKAg--.36668S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4fuF1rAFWxXr47KF4DJwb_yoW8tw18pr
	ZakrWqgw1xK3yIqw4UKrn5Xw45uayqyr1YqryxGF4Ikr4Yqws3Jr4FgFyUuF43Zr9avayk
	XF1FyFy7ur1qy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUl1kUUUUU=
X-CM-SenderInfo: pkdrs65kdqwshngh4qqrwthudrp/xtbC+QW9sGqw9uUi9QAA3v

From: Hao Zhang <zhanghao1@kylinos.cn>

kvm_update_stolen_time() advances last_steal before checking whether
kvm_put_guest() successfully writes the updated value to guest memory.

If the write fails, the updated stolen time is not visible to the guest,
but the corresponding run delay has already been consumed from KVM's
accounting state.  A later successful update therefore starts from the
advanced last_steal value and permanently loses that interval.

Stolen-time updates are best-effort, but a failed update must not
consume accounting state.  Otherwise, a transient write failure turns
into a permanent loss even if a later update succeeds.

Read the current run delay into a local variable and update last_steal
only after kvm_put_guest() succeeds.  This leaves the unreported delay
pending so that a later update can account for it.

Fixes: 53f985584e3c ("KVM: arm64: pvtime: Fix stolen time accounting across migration")
Signed-off-by: Hao Zhang <zhanghao1@kylinos.cn>
---
 arch/arm64/kvm/pvtime.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pvtime.c b/arch/arm64/kvm/pvtime.c
index 4ceabaa4c30b..9b4f0645d92b 100644
--- a/arch/arm64/kvm/pvtime.c
+++ b/arch/arm64/kvm/pvtime.c
@@ -17,6 +17,7 @@ void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 	u64 last_steal = vcpu->arch.steal.last_steal;
 	u64 offset = offsetof(struct pvclock_vcpu_stolen_time, stolen_time);
 	u64 steal = 0;
+	u64 run_delay;
 	int idx;
 
 	if (base == INVALID_GPA)
@@ -25,9 +26,10 @@ void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 	idx = srcu_read_lock(&kvm->srcu);
 	if (!kvm_get_guest(kvm, base + offset, steal)) {
 		steal = le64_to_cpu(steal);
-		vcpu->arch.steal.last_steal = READ_ONCE(current->sched_info.run_delay);
-		steal += vcpu->arch.steal.last_steal - last_steal;
-		kvm_put_guest(kvm, base + offset, cpu_to_le64(steal));
+		run_delay = READ_ONCE(current->sched_info.run_delay);
+		steal += run_delay - last_steal;
+		if (!kvm_put_guest(kvm, base + offset, cpu_to_le64(steal)))
+			vcpu->arch.steal.last_steal = run_delay;
 	}
 	srcu_read_unlock(&kvm->srcu, idx);
 }

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.15.0

