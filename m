Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832BC2DF134;
	Fri,  4 Sep 2026 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559904; cv=none; b=Ey5RRoCKOE2FvvSkN15wSy/CuTWsm5N19KwpWWqUA3cwkSt/3CmapkOdiGXHfvgBP33yFk66ZDwWBnQSPwNQxHrnEEjAVOungkKqLr7ayhILpj6EI5G0PUDj3WwSg6HLDWA3nW8xsYQqPD1mz3Z+83ZpQAX4gZ1uYAiWNNRqv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559904; c=relaxed/simple;
	bh=ghq0WeQsYmpPnbVaN++CyGIcJ2BuwWtCUEu1NCawm8M=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BY7pjtNl6AMifqdYflyvx6p8U5IHccSSFzm7lVh0Gwx8XPLfJdmYv/+nUv6v5Yuxf64Bi2qfNnevbVItG0MvfbXb7+d2NocGFpkNsmNOLjwYO1TJUGoZNfqVPiYuNt18o3h6pLqhl3pg8XptCQxf6r3MGO2c3VvvIHe3/QnGsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O0CYVrwL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h1EhKE9H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O0CYVrwL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h1EhKE9H"
Date: Fri, 04 Sep 2026 22:11:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788559899;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=if77Nwnvqu/srq6KW/nxhEUzJwTZXFdKWHfK8+Sup+Q=;
	b=O0CYVrwLVMRcBPY/Zzzgdp/bispkDJSo8VTX0Bc1jYh6w/c7V5NUNbljusZkL7+cv6dx1q
	zBdlgFdHGzTY+rxZXrRG6MAwjBMeihhTuTzwJNRSxkZ4D/Q1wWrDshP5OMTPnGdNenwmn7
	QdAJL7wyNL8DCoZJmhuDx8212VZY8uiPTRn/EAxiHmanH3j/1T8+7ojcgbDc2lsNCl5lFb
	MiCt6Gl9fcjWRRwhgud8p7j8JTT6ZYM6bPQQg3Jir7plsyu73S0Y3btN9RZVPcs2oe21xY
	Riw0jWWmfMo84NtPy3Vbw3BGh1A4WAlbvmldWKzttEehuUnJ8XMlgHGMmPfIbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788559899;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=if77Nwnvqu/srq6KW/nxhEUzJwTZXFdKWHfK8+Sup+Q=;
	b=h1EhKE9HoEA0MZ87LEmZPPHdLAiS6o5NTeqzGKidkVnyreIxBwMuZaGbfBPgz9B+xJdYb8
	GjFYviX5QixZiHDg==
From: "tip-bot2 for Rick Edgecombe" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] Documentation/x86: Add documentation for TDX's Dynamic PAMT
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Binbin Wu <binbin.wu@linux.intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Hongyu Ning <hongyu.ning@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904215841.303070-11-rick.p.edgecombe@intel.com>
References: <20260904215841.303070-11-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178855989725.3717435.1247228768665935998.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     e61c837817acde1df7ebd977b798683a3d9b0dda
Gitweb:        https://git.kernel.org/tip/e61c837817acde1df7ebd977b798683a3d9=
b0dda
Author:        Rick Edgecombe <rick.p.edgecombe@intel.com>
AuthorDate:    Fri, 04 Sep 2026 14:58:40 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 04 Sep 2026 15:06:03 -07:00

Documentation/x86: Add documentation for TDX's Dynamic PAMT

Expand TDX documentation to include information on the Dynamic PAMT
feature.

The new section explains PAMT support in the TDX module and how Dynamic
PAMT affects the kernel memory use.

Some of the docs verbiage was provided by Dave Hansen (see link). AI was
used under supervision to review the docs.

Based on a patch originally by Kiryl Shutsemau.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Acked-by: Sohil Mehta <sohil.mehta@intel.com>
Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
Link: https://lore.kernel.org/all/8e40862e-891a-4cad-8bb8-06ad25ad6061@intel.=
com/
Link: https://patch.msgid.link/20260904215841.303070-11-rick.p.edgecombe@inte=
l.com
---
 Documentation/arch/x86/tdx.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 3303499..a36ea2b 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -200,6 +200,27 @@ reflects the TCB of the currently running TDX module and=
 therefore
 changes after an update. By contrast, TEE_TCB_SVN reflects the TCB at TD
 launch time and is not affected.
=20
+Dynamic PAMT
+------------
+
+The Physical Address Metadata Table (PAMT) is metadata in which the TDX
+module keeps data about each physical page (think struct page). Space
+for it is allocated by the VMM, consumes up to about 0.4% of system
+memory and needs to be supplied to the TDX module when the TDX module is
+first loaded.
+
+Dynamic PAMT is an add-on feature that allows a VMM to dynamically
+allocate the part of the PAMT which tracks 4KB pages. This reduces the
+amount of memory that TDX consumes while TDs are not in use.
+
+When Dynamic PAMT is in use, dmesg shows it like::
+
+  [..] virt/tdx: Enable Dynamic PAMT
+  [..] virt/tdx: 10092 KB allocated for PAMT
+  [..] virt/tdx: TDX-Module initialized
+
+Dynamic PAMT is enabled automatically if supported.
+
 TDX Interaction to Other Kernel Components
 ------------------------------------------
=20
