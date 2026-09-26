Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E131D730;
	Sat, 26 Sep 2026 01:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385165; cv=none; b=uE1y2MfrmyhFAj+swcZ3ppIH4JbR0J41Mk0G5Cam3LCYIw1azrGH+W4TvcIsY7zK9guPK3dF/62UJFY4Zqg8XkWPecECgxYHWjuoDAbUjX7q2F8GtfRrwVVMxGEdepKahtnRbAasJNIHx+Ls3EY7gAu/joNVO4O/1zqfBgKHn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385165; c=relaxed/simple;
	bh=SF31md9An50BtOfzQNAI/KxX8v8ngdmRXRiECsOEmJY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=GpITMniIwn43r44jyYffIeXTGgyunBjTQLqYQhMUs0P2CasqDaAjlXbEJCZwF3S5lbVpGTdlaWxt9csWSXvJ6UBVxwVth+CkqD3J3gUxZu5wdfzYzIdd37aHgQTMmIqNXLYzN7u66xtbiITmJBVf0/X2i9LLdCE7Q9AKHqkTP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ng6sdk33; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zf2Sx7PW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ng6sdk33";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zf2Sx7PW"
Date: Sat, 26 Sep 2026 01:12:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385162;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTGTXGZzhd2MnWQvv0zEKNAzkPvLazKQRFHLbr6jevo=;
	b=Ng6sdk33vxwFCZiqEYbDQUOu0ztiA25ZtFYG8f/Jc7pm2PidKBfga4J8LnA4Ly/7b0NWLA
	ZVijjVERDXKrTAt1WuOI1NYdhFK7EIsvrrCMGzSVX7SoX+Nq3pJ1chTNH/kc9MiYLUrIPH
	D7UTarz60gVpjicc3IL/5m9RCXHlLaVQJVNxXKdAFROTjbq08ePL/2nC4rO/W0QcbUTonM
	o+mNsar8e5QYll6XDaWGAChJ00IHKIqby1i3a24hF5wJGsJ1ikdvsrrnbIrM055eL5RBMB
	5lPsJ3tONbHKXfSaFWKRDCXWZbzsu83613rCE+UWdC/tAuhPsS0SS9Ryht8kkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385162;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTGTXGZzhd2MnWQvv0zEKNAzkPvLazKQRFHLbr6jevo=;
	b=zf2Sx7PW3TsqCLL8M/nU5eqm2dNI2PfCccrbvTAbcHflD43oFxwcEUD/PJLRNXhagYaepV
	aoCCR8MW+k+xlyDA==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/fpu] x86/fpu: Fix potential underflow in xstate_calculate_size()
Cc: Andrei Vagin <avagin@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-6-avagin@google.com>
References: <20260925162454.1403405-6-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038516060.3910103.16770459890806880177.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     f1751b220bc8a9bd2dc38ecf61f5c29f3826ace0
Gitweb:        https://git.kernel.org/tip/f1751b220bc8a9bd2dc38ecf61f5c29f382=
6ace0
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:51=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:25:54 -07:00

x86/fpu: Fix potential underflow in xstate_calculate_size()

xstate_calculate_size() calculates the size required for a given set of
xfeatures. It determines the topmost feature by finding the most
significant bit in xfeatures using fls64(xfeatures) - 1.

If xfeatures is 0, fls64(0) returns 0, and topmost becomes -1.
Previously, topmost was unsigned int, so -1 underflowed to UINT_MAX.
This caused the subsequent check `topmost <=3D XFEATURE_SSE` to fail, and
the code proceeded to access xstate arrays using topmost (UINT_MAX) as
an index, leading to an out-of-bounds access.

  [ bp: Remove text explaining what the patch does. ]

Fixes: d6d6d50f1e80 ("x86/fpu/xstate: Consolidate size calculations")
Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://patch.msgid.link/20260925162454.1403405-6-avagin@google.com
---
 arch/x86/kernel/fpu/xstate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 97cfd4f..efa7879 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -589,12 +589,13 @@ static bool __init check_xstate_against_struct(int nr)
=20
 static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
-	unsigned int topmost =3D fls64(xfeatures) -  1;
-	unsigned int offset, i;
+	unsigned int topmost, offset, i;
=20
-	if (topmost <=3D XFEATURE_SSE)
+	if (!(xfeatures & ~XFEATURE_MASK_FPSSE))
 		return sizeof(struct xregs_state);
=20
+	topmost =3D fls64(xfeatures) -  1;
+
 	if (compacted) {
 		offset =3D xfeature_get_offset(xfeatures, topmost);
 	} else {
