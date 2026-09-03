Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72536306746
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428263; cv=none; b=s2woQAaVNXarObkcNdrqbSrxHXW4EfAv4GwZGARA1QuoE9ZiRAwK91p9XDh20dGt3UXQOfGX2c+4WjkwP9Eu3FxxWbye+u43LE2qN2innwrx+ePkX1otc0NjppsKRmRuGs5k2MMpeFQz9mPPZMOLKGjM4HnwbTU6MNCnOrgosGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428263; c=relaxed/simple;
	bh=HxmU+pEeXlLNAyGku+1bXnsDhODqPjjdSnFcja41XlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCHH8o4aLZZ8sGxtG0ZIBHeq+c0StK8VjEigto+StXdHG5DYDRdSArwNUm7sHTyLeMnq6vZQ4fEFAHU0Ge7sRRyEBzlJNfbo0kKFjBAb5uAmvIUSEbi8oJ5fzTrRR37ZvnMNL92sXrSqr6SNCZWnjK9ZxvSjaFUFK0mztvctees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6Bzez82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6Bzez82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CE01F000E9;
	Thu,  3 Sep 2026 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428262;
	bh=Vu5X7qpAueWmhXfEGqb6mvO1ZUaCpuDBqYXKwSBCyRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g6Bzez82xjxLWQ+k375SpZtcB7ndXkmWH8gbKWLGDwJ5tx6kFahHAQou3rvnjTo3k
	 gBJlo3eDNAxKfEx9qa0p5oiFGPIvrMJj2qrLQz//qfdOxzy8ZO45IoswNzvJm4EMiI
	 /LrHorOUal4G9/r+mGPMrQhhjq+dRzCH16pUO6ca0Kl2D+DCgcXXVKMjvnGl3up4mE
	 Qqow82VXf9PE8NuvHInB7td0Vcax2NGBS5wjHXM/hb7r1VS+5M2vo+SODrE8JEaM5Q
	 6CsMW1oWdDnYp7k4Q4X26vx5sor3M4Aqcf/dWAXG3+nurVaGxkSR27Zi7iNWNMAyEJ
	 OPd69DBdSglsg==
From: "Naveen N Rao (AMD)" <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND v4 1/3] perf/amd/ibs: Limit the max EILVT register count for AMD family 0x10
Date: Thu,  3 Sep 2026 14:58:39 +0530
Message-ID: <b98bf368f4c0e2af51ab8f9dbe3acaf11ebfee40.1788425679.git.naveen@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788425679.git.naveen@kernel.org>
References: <cover.1788425679.git.naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For AMD family 0x10, EILVT offsets are not assigned by BIOS and is
instead assigned by picking the next available EILVT offset.  Use the
maximum EILVT count for family 0x10 (APIC_EILVT_NR_AMD_10H) rather than
an arbitrary maximum EILVT count when looking for the next available
EILVT offset.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
Tested-by: Manali Shukla <manali.shukla@amd.com>
---
 arch/x86/events/amd/ibs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c23b8c..555912ac520f 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1839,13 +1839,13 @@ static void force_ibs_eilvt_setup(void)
 
 	preempt_disable();
 	/* find the next free available EILVT entry, skip offset 0 */
-	for (offset = 1; offset < APIC_EILVT_NR_MAX; offset++) {
+	for (offset = 1; offset < APIC_EILVT_NR_AMD_10H; offset++) {
 		if (get_eilvt(offset))
 			break;
 	}
 	preempt_enable();
 
-	if (offset == APIC_EILVT_NR_MAX) {
+	if (offset == APIC_EILVT_NR_AMD_10H) {
 		pr_debug("No EILVT entry available\n");
 		return;
 	}
-- 
2.55.0

