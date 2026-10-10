Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C36282F20;
	Sat, 10 Oct 2026 00:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791593868; cv=none; b=ALThQs6tBMOQl9/oeUMVhTAJlZFmPSKsiOa5qzCR4tk5nICmBAUFVO1GykagmEO+R9S4OGoeKxz4X9Jh1eyFk41ovMci1/wPkm8Ps8YGZXsv65EEqw6owLQp2BCfAGk49+cIDwhw9mQDKE41j3AFkX/Br0x+O12xMpnQ84LIl7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791593868; c=relaxed/simple;
	bh=z6IxooTjuOgG1KK1fwl6PBrv1MCI2r4p6lXFZKXLHRM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rbhVw93dz5MFeetKgSdZ5WTrAA58OH7i9oEhMc9n3QjQEUVFizDiYXmxE71DoUeeK51o2mkksG/HxAVnS2Up/EDWGJZ1+HpMbZsbhz73ZIrN7GwwZBssbmUcj8NcD6wixHkS1nZZsa8wixr4VsPgT0xEHhfyJNSnEKz4u/cbTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i0jzaYAO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J7dUn2mp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i0jzaYAO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J7dUn2mp"
Date: Sat, 10 Oct 2026 00:57:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791593864;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQhXrf56D50oqM+tigiAR6F4B+L2c+uHHOsSmML2vjU=;
	b=i0jzaYAO26qIYN7IyAAHkH8DNa0uzDpGkn3ZJZWl/P814ZcnSXMigi4R61fIWC/CFqtD6j
	tBa+g0VNRV2asW53FLYbVwFVUf5lIv7cwt36FdrQz5vuERgoMQ69KvUVPAClh7H0WFyHSJ
	n4q+g4uV/0mXLymIed7XaNe9hwEntTnGMM/9e6i0DhsHHqKoT5ZspuRz0kolpaqHqmIysf
	8igPKwbSFcsjZUUH3mdi/V4md001EVitj3p9bemTSWVLfgLPhaaeNoeM1Wp4LDBByi4cXh
	u82OsUG+hNsm6tkkZ0iAz8RWN3RhY6WNGaePQ5ss/x6KU9RM+5e0X/iMLQTczg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791593864;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQhXrf56D50oqM+tigiAR6F4B+L2c+uHHOsSmML2vjU=;
	b=J7dUn2mpk4lHFYfXH62oLuT11sJ0Xs1rPsI5A1Hk/k56cDWqL8JRAtFvvYlRlGcZY8YkSo
	0wsrdaxWWT0iHiCg==
From: "tip-bot2 for Tony Luck" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] fs/resctrl: Ensure default group reports tasks on
 monitor-only systems
Cc: Sashiko <sashiko-bot@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261009193923.15498-1-tony.luck@intel.com>
References: <20261009193923.15498-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179159386255.816309.5522989915437177306.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     2c10b3fa5bdf61e344bc522e6c2e00d870ce7ab8
Gitweb:        https://git.kernel.org/tip/2c10b3fa5bdf61e344bc522e6c2e00d870c=
e7ab8
Author:        Tony Luck <tony.luck@intel.com>
AuthorDate:    Fri, 09 Oct 2026 12:39:23 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 09 Oct 2026 17:43:05 -07:00

fs/resctrl: Ensure default group reports tasks on monitor-only systems

resctrl can be mounted on a system that supports monitoring but not allocatio=
n.

On such a system reading the "tasks" file in the default group reports no
tasks, even when there are tasks assigned to the default group. This problem
occurs because the check for whether a task belongs to a CTRL_MON group is
gated by a check for whether the system supports allocation.

The resctrl_arch_alloc_capable() check in is_closid_match() breaks task
reporting for the default group on monitor-only systems so remove this check.
On systems that support allocation the check is redundant.

Fixes: e6b2fac36fcc ("x86/resctrl: Use is_closid_match() in more places")
Closes: https://sashiko.dev/#/patchset/20260831174421.13921-1-tony.luck%40int=
el.com?part=3D9
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/20261009193923.15498-1-tony.luck@intel.com
---
 fs/resctrl/rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 68be9b9..57ab090 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -685,7 +685,7 @@ static int __rdtgroup_move_task(struct task_struct *tsk,
=20
 static bool is_closid_match(struct task_struct *t, struct rdtgroup *r)
 {
-	return (resctrl_arch_alloc_capable() && (r->type =3D=3D RDTCTRL_GROUP) &&
+	return (r->type =3D=3D RDTCTRL_GROUP &&
 		resctrl_arch_match_closid(t, r->closid));
 }
=20
