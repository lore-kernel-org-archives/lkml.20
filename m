Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591826;
	b=gQs9cwUQHlXOdpvHjYv8RUO+Bk6xOBo+O/dAJuN6MGHeI/c+EYdmJnypx9M8p6yFQ4IC
	 iQW1io7uGXsmYOYUnrssZ0v/jk+VQhmmP+8R3Kw+ayPsSdDk9J5r4EPxlnVK/IgaHmZHR
	 +lBjli+VRcD4tKE7uw3wXDTQ0RiPTyBf5cEFMrg6FVwrZO37CnZe/gq0I2f3l3uYxiQc1
	 AXx3RUIur734Kzt9Kmn5zLj1TQk8dAaZTX1b/5GqRycvaICqRriQJxlGLKTs03AxtJFlG
	 D1A4tQGMs8uN1F2CX7Jjxu2NOEFbFt1P+puLFScH4ScGj6lhG3yW0PfrYQYvdBtP9rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591826;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=4aMadvHWcaG+rWqMxdBgMYPyvkwqYUTtLbYIkL2zezA=;
	b=hY9SXG9i46eQ9AfsQHkoSsOZIQBICdycASCf+PVpndKYc8a6Vh0n1SfpT/fJvzuiVeLl
	 V57uaB0dTplChVqGwPaNr8QDv+PfZUG3ac2Nik+SZxT+mmigvfS2jA5sgj3OAx0jYbVrj
	 DqVw0nkatZG5pO5V3ofM1wPqeMRQZmtolBp7EJ7+4hWDP0sySy2CjEdYQNARyqMy4pbBY
	 e4DdYwWPJxtPiOrg2nVjClaj9zwkPbswVIZcNozDfz0sZaW6hIIkUyvm8m+wT0b8uzUdP
	 0As9ujK1QZtvFfhF6auEXn//4+Ts6PJznRURLkDwSwXaTkrly/jQXzO1f1XyzKkjMlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HSSdECY8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=leRydCxm;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18316606A326;
	Mon,  2 Nov 2026 03:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18316606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HSSdECY8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=leRydCxm
Date: Mon, 02 Nov 2026 03:56:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793591819;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4aMadvHWcaG+rWqMxdBgMYPyvkwqYUTtLbYIkL2zezA=;
	b=HSSdECY8bydYDHWXq4NWa8mk6jdMd5HeDNCKUXw290Lyo54vgPDC5zrkkGRfPSGTwETISH
	BW+FM5xwH6YPrdSM+peEdRcXXVwzw6R+3CZEVSsX43CPgxCryEg3o8+v9uj2eF2cm+j9yW
	NS66BgqciuNMzEfYsOAuYXOO0csTYNGlsWnQh6PjYFmQ+kazp+SSEQWytcjh2+Zuc0Xnee
	B+4gh4feCh5gUmI5kD9YByM0xbugA1gr82mN0nX/59J4mVt0Zbs183c4cGm64NruFac7zl
	ZrQxCUHLJHueWKDD7lWr7ykbYVBEZrDsovkP0/pPSxY+UH7J7aoIbQBzAiqUeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793591819;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4aMadvHWcaG+rWqMxdBgMYPyvkwqYUTtLbYIkL2zezA=;
	b=leRydCxm9tdjfiRPbqy9NYT4BU70WOBvZkanGE7hxZRIXBiB0F7BdifEFaaqfRD6VTxs7t
	6hvmxuAKBTv2mVAQ==
From: "tip-bot2 for Sohil Mehta" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/bugs: Replace RFDS model checks with VFM ones
Cc: Sohil Mehta <sohil.mehta@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030195214.1284995-1-sohil.mehta@intel.com>
References: <20261030195214.1284995-1-sohil.mehta@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179359181814.1009794.6961700367236303703.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     b828d777c292c963aa110c33159a59f81d372ce7
Gitweb:        https://git.kernel.org/tip/b828d777c292c963aa110c33159a59f81d3=
72ce7
Author:        Sohil Mehta <sohil.mehta@intel.com>
AuthorDate:    Fri, 30 Oct 2026 12:52:14 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 01 Nov 2026 17:42:22 -08:00

x86/bugs: Replace RFDS model checks with VFM ones

The RFDS vulnerability check uses raw model numbers to identify Alder
Lake and Raptor Lake. Most Intel-specific code has already moved away
from x86_model checks, but this one got added recently.

Replace the x86_model checks with VFM ones to make them more readable.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Link: https://patch.msgid.link/20261030195214.1284995-1-sohil.mehta@intel.com
---
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9bd50c6..aba7e99 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1391,8 +1391,8 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_=
msr)
 	 * both Core and Atom CPUs. Mark unaffected when Atom CPUs are not
 	 * present.
 	 */
-	if ((boot_cpu_data.x86_model =3D=3D 0x97 ||
-	     boot_cpu_data.x86_model =3D=3D 0xB7) &&
+	if ((boot_cpu_data.x86_vfm =3D=3D INTEL_ALDERLAKE ||
+	     boot_cpu_data.x86_vfm =3D=3D INTEL_RAPTORLAKE) &&
 	     boot_cpu_data.topo.intel_type !=3D INTEL_CPU_TYPE_ATOM &&
 	     !boot_cpu_has(X86_FEATURE_HYBRID_CPU))
 		return false;
