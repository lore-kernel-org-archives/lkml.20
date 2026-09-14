Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D490E3A4F2C;
	Mon, 14 Sep 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412934; cv=none; b=IoKdUgtx9ImplVsa1D1zER6rkm2RRpK4EzOtnxtm3Adcc6cl7jjCr3jMQ5GhMA6WG9xd3hLauymMpH3kvdb67jCmV+76pYbyKpMxHn1nUpYHj9+jZy+UYKcN7vgxbC8ZKbIJqsU7D06p20E12rQG1dtdZ93GGM6DPs6r9JDF20Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412934; c=relaxed/simple;
	bh=QGEM1O/EF+2L4qfNMiEQEsKbOane3rBBIpOSJs49CFI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iKaUHqdDzD34A9Yg4Sk8Eh2N4OumEv10qQ00Sg4zGeVjhxkE4ibJAyS3OQLEv+Eg5wBTq41qxk5Ug9/epxTVt9xt+oIcEWUqg6SHWNPAVcrW//furq3skfu8UhlTzPv+uJ+sJG+zezkFkcGAroJm8zOxPwvqlvAFugc/YeQj4yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fuNqxykB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bf0/ToUb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fuNqxykB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bf0/ToUb"
Date: Mon, 14 Sep 2026 19:08:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789412927;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHr/xIA6ZF5Yviwwsr2BvtEdEiYDxW2GA3uSHi0094Y=;
	b=fuNqxykBuxwEEEqhJCRD1TsBs+VoVKlZlnt2xMlkf2r/Oe+NyraaWT/OpDXOJIMZrDK5GI
	+3uNpCzREO+Qvf5nXIPBNWFD6OxnWFtDN5Oghl4A4HrSrAuE+E9yjs16hfTB5mnmZjlO9U
	vp1slid8WBjRK0wXrMlbRGLxu2hLeGWdQsDEgNdd6Dh9bDLSI1jQKd5GgaT08Hi0F/uoTD
	u/WS+udWdgEXwQm5S92G+n3LOmHYhFrXtBOyDeLCG+FVR9t82tHY8tpYrL9uLcoA3jT0Xx
	L5yUearPfrpVW93SXmGlKLgnwhBpyTfQ+pbwv/N+eRXHvAxdUPWESrUhAflB7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789412927;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHr/xIA6ZF5Yviwwsr2BvtEdEiYDxW2GA3uSHi0094Y=;
	b=bf0/ToUbjZS1DvemEkuttwXPEO95bddFBVnvGBAXlxRPTfw6j/A+zDJ+zlJheyZ4OedyJp
	hNmktn6MyV9S8JDw==
From: "tip-bot2 for Dave Martin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/cache] fs/resctrl: Factor MBA parse-time conversion to be per-arch
Cc: Dave Martin <Dave.Martin@arm.com>, Ben Horgan <Ben.Horgan@arm.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Gavin Shan <gshan@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911163613.1131447-4-ben.horgan@arm.com>
References: <20260911163613.1131447-4-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178941292584.1720534.5425422927030230441.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     942135446059a63778f1121a75c5b3c959341b47
Gitweb:        https://git.kernel.org/tip/942135446059a63778f1121a75c5b3c9593=
41b47
Author:        Dave Martin <dave.martin@arm.com>
AuthorDate:    Fri, 11 Sep 2026 17:36:13 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 14 Sep 2026 08:20:25 -07:00

fs/resctrl: Factor MBA parse-time conversion to be per-arch

The control value parser for the MB resource currently coerces the memory
bandwidth percentage value from userspace to be an exact multiple of the
rdt_resource::resctrl_membw::bw_gran parameter.

On MPAM systems, this results in somewhat worse-than-worst-case rounding, sin=
ce
the bandwidth granularity advertised to resctrl by the MPAM driver is in gene=
ral
only an approximation to the actual hardware granularity on these systems, and
the hardware bandwidth allocation control value is not natively a percentage =
--
necessitating a further conversion in the resctrl_arch_update_domains() path,
regardless of the conversion done at parse time.

For MPAM and x86 use their custom pre-prepared parse-time conversion,
resctrl_arch_preconvert_bw(). This will avoid accumulated error from rounding
the value twice on MPAM systems. For x86 systems there is no functional chang=
e.

Clarify the documentation, but avoid overly exact promises.

Clamping to bw_min and bw_max still feels generic: leave it in the core code,
for now.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Link: https://patch.msgid.link/20260911163613.1131447-4-ben.horgan@arm.com
---
 Documentation/filesystems/resctrl.rst | 17 +++++++++--------
 fs/resctrl/ctrlmondata.c              |  6 +++---
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystem=
s/resctrl.rst
index e4b66af..dd4f80d 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -236,12 +236,11 @@ with respect to allocation:
 		user can request.
=20
 "bandwidth_gran":
-		The granularity in which the memory bandwidth
-		percentage is allocated. The allocated
-		b/w percentage is rounded off to the next
-		control step available on the hardware. The
-		available bandwidth control steps are:
-		min_bandwidth + N * bandwidth_gran.
+		The approximate granularity in which the memory bandwidth
+		percentage is allocated. The allocated bandwidth percentage is
+		rounded up or down to the closest control step available on the
+		hardware. The available hardware steps are no larger than this
+		value.
=20
 "delay_linear":
 		Indicates if the delay scale is linear or
@@ -881,8 +880,10 @@ The minimum bandwidth percentage value for each cpu mode=
l is predefined
 and can be looked up through "info/MB/min_bandwidth". The bandwidth
 granularity that is allocated is also dependent on the cpu model and can
 be looked up at "info/MB/bandwidth_gran". The available bandwidth
-control steps are: min_bw + N * bw_gran. Intermediate values are rounded
-to the next control step available on the hardware.
+control steps are, approximately, min_bw + N * bw_gran.  The steps may
+appear irregular due to rounding to an exact percentage: bw_gran is the
+maximum interval between the percentage values corresponding to any two
+adjacent steps in the hardware.
=20
 The bandwidth throttling is a core specific mechanism on some of Intel
 SKUs. Using a high bandwidth and a low bandwidth setting on two threads
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 18ec9f5..cafebdf 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -37,8 +37,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
 /*
  * Check whether MBA bandwidth percentage value is correct. The value is
  * checked against the minimum and max bandwidth values specified by the
- * hardware. The allocated bandwidth percentage is rounded to the next
- * control step available on the hardware.
+ * hardware. The allocated bandwidth percentage is converted as appropriate
+ * for consumption by the specific hardware driver.
  */
 static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
 {
@@ -71,7 +71,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_re=
source *r)
 		return false;
 	}
=20
-	*data =3D roundup(bw, (unsigned long)r->membw.bw_gran);
+	*data =3D resctrl_arch_preconvert_bw(r, bw);
 	return true;
 }
=20
