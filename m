Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19EB67E;
	Sat, 19 Sep 2026 00:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776717; cv=none; b=uJXlnxxaNj6TEjs6OZO6RdeuNPOwxs6zbYakjQ5ZePP1O1ehq9uEW7mJpWgDPAauKLC1i7S2VkdvhhxR2JFlWPEpRmrT0+1fi8xFD0d0NVk07wRKfmpZG6PqUgSS3w/wtbaT8aGQMvI8HWssz9XnoklM2wowQCMT83uxrm7t284=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776717; c=relaxed/simple;
	bh=aNwN1c4uh3yUGzxjfyrxuqEIYAZ+/fTuJ34aJIhIsPI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PefJe7A8a4C11tuxK3/n3Reln5ENc6scxyPKRL0YCYXdaB/wI8Biryez0d5BUip94bGkJ6Veay5JxHnaTg/5Fqx1y+9mKoIc3HBklVJ/O+UQ8WnscrSkAoN30ZjXmLGGMbfipFI48fCRTukTDKOgwESVFAJn1r9ynuK9LOsezaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2ek8SoNh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3AaodzVi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2ek8SoNh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3AaodzVi"
Date: Sat, 19 Sep 2026 00:11:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789776714;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6aeiabsezfCsjziT4R/Dz7GA8O7QeYJlVfZi0W+lrU=;
	b=2ek8SoNhLhZ/O32y60Aav04RAy49I7ASTlUZLW70aO5l/P+KYVojg+3dCY1lAOWyJuvwdZ
	p50CB4ZTt4oQW2CD1Bk3xuguuI19WvBnPvKqWaf6r+/FVmRbN6PskP2qO216WXWlnWQ5hY
	RBGd82fG09bl1w5cHxJz9WCa6WFahtGJeLQhUvfdlIP50U3TOuY9w39m6tvKuxWnYO9ZXH
	iCJROET4i+u0ZoB7t4XCJlpdKpgxl07ZG6YtCELzOEpomB02+t07KkiDH9Two8hXt6mN/t
	gGS+uis3wZ2OpOFOpwuyVncEtLDLXZPWnjn5tLl6BpIe2HK1kb3X+sWS1oXWQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789776714;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6aeiabsezfCsjziT4R/Dz7GA8O7QeYJlVfZi0W+lrU=;
	b=3AaodzVihLldN7aCHR1Q0hkEYD/RIZF3sjLf8jnOXrm0aWSjSs7eNgR43u7flcMTlH4lJo
	/DCIJzPUHzyCpiBQ==
From: "tip-bot2 for Ashish Kalra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sev] x86/sev: Do RMP optimizations on SNP guest shutdown
Cc: Ashish Kalra <ashish.kalra@amd.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ackerley Tng <ackerleytng@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C7a15a880ea6b6d53b3702def3b3434307656afd7=2E1789594?=
 =?utf-8?q?774=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
References: =?utf-8?q?=3C7a15a880ea6b6d53b3702def3b3434307656afd7=2E17895947?=
 =?utf-8?q?74=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178977671232.1720534.5707462670227893474.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sev branch of tip:

Commit-ID:     edb1b49e724ea102b3eaeb0b57f8ca33cd445887
Gitweb:        https://git.kernel.org/tip/edb1b49e724ea102b3eaeb0b57f8ca33cd4=
45887
Author:        Ashish Kalra <ashish.kalra@amd.com>
AuthorDate:    Wed, 16 Sep 2026 22:15:37=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 18 Sep 2026 16:58:20 -07:00

x86/sev: Do RMP optimizations on SNP guest shutdown

The RMPOPT table is a per-CPU table which indicates whether 1GB regions
of physical memory are entirely hypervisor-owned.

When performing host memory accesses in hypervisor mode as well as
non-SNP guest mode, the processor may consult the RMPOPT table to
potentially skip an RMP access and improve performance.

Normal guest events disable RMP optimizations: pages are converted from
shared to private as SNP guests are launched, and large pages are split
and collapsed during guest operation -- both disable the RMPOPT
optimizations for the affected 1GB regions.

When guests are torn down, their pages are converted back to shared, so those
regions may become eligible for RMP optimizations again. Without some
intervention, all those optimizations would eventually be lost, so optimize
all of physical memory on SNP guest teardown.

snp_enable_rmpopt() performs the re-optimization after a delay, which gets
reset on each call. This way multiple guest terminations are batched into
a single pass: the re-optimization runs 10 seconds after the *last*
termination rather than after the first.  mod_delayed_work() also re-queues
work that is already in-flight, so a re-scan request during an active scan is
not silently dropped.

Guest teardown is currently the only event that returns guest memory to
hypervisor ownership: SNP guests do not support ballooning or memory hotplug,
so pages freed during a guest's lifetime remain guest-owned.  It is therefore
the only point at which memory becomes eligible for RMP re-optimization, which
is why re-optimization is driven by guest teardown rather than by a periodic
scan.

  [ bp: Massage commit message. ]

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/7a15a880ea6b6d53b3702def3b3434307656afd7.17895=
94774.git.ashish.kalra@amd.com
---
 arch/x86/kvm/svm/sev.c  | 2 ++
 arch/x86/virt/svm/sev.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5705723..4d5e30a 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3032,6 +3032,8 @@ void sev_vm_destroy(struct kvm *kvm)
 		 */
 		if (snp_decommission_context(kvm))
 			return;
+
+		snp_enable_rmpopt();
 	} else {
 		sev_unbind_asid(kvm, sev->handle);
 	}
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index 2d2a8b1..bd70c4d 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -691,7 +691,7 @@ void snp_enable_rmpopt(void)
 	mod_delayed_work(rmpopt_wq, &rmpopt_delayed_work,
 			 msecs_to_jiffies(RMPOPT_WORK_TIMEOUT));
 }
-EXPORT_SYMBOL_FOR_MODULES(snp_enable_rmpopt, "ccp");
+EXPORT_SYMBOL_FOR_MODULES(snp_enable_rmpopt, "ccp,kvm-amd");
=20
 /*
  * Do the necessary preparations which are verified by the firmware as
