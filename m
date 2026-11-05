Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841996;
	b=Avo6gkLjQiEDQzLko3N+H9qgGzbKY/dUZxSXWkkO4+l7Frr1xMoz2wrFU0feLaYtXu6z
	 0RURGVCmYHPfmQg9uXEdmv48jcuDnY4iEFfFA9SAD74fokOLfO7eu2zJai9JE55ydImie
	 S3C7JZzUguKATgDpQVdA4u9UVJfXxtStgM+07kGBxGg/dGoBQCpjim8Zyptc903ansll2
	 kK4dQXE1iGbT9z/qim3tkT/iwCIv2huYjP08eZuLo5GfMA6IhvHjd9anfLMBQKVGrOGt2
	 lDE3kMTBKL1D+ULeBzef4462d7ZXFBFAK/FkBshP49rxXMfMNayeHchN+3zHvKZvwnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841996;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=n1DnJmdevmI5Nsm8y0nDCKzgvnJMuAJfaF7/YYvjzW0=;
	b=YLiTJ2EMJnjeRJcwKxKVF22e8qJSLUrYmjxQQw4PC72D0ZcjEcR6452Vmj7Gy83YGfyf
	 0YAmkYfvv6GmfPINqlpeRMMhwJ1u2p7N3eSCCZMKR2BKBEaMgzEmze9T3EhsgS+77BPsH
	 ooDgs5d1rRMkQwlSTMQTFj7h2IOGagP2JfhTl+39/hJDNNecJHm1wNkvulHGLLPGFC76V
	 k8vrQqYXngbPYIJIdHVNs5dgBJ2Ee0fOfwHPOBRuoZgaaiIUjU6w95hAdtyD6RL1ISeC3
	 qzcPt3JS/48KQPMNZbGlr3nFRD83T4wy9KFjGm42R6AyXqyx/IN7SjIocA2Htqu9JRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="UHu/emdG";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CyW5sOQi;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EDC606A326;
	Thu,  5 Nov 2026 01:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UHu/emdG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CyW5sOQi
Date: Thu, 05 Nov 2026 01:26:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793841993;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1DnJmdevmI5Nsm8y0nDCKzgvnJMuAJfaF7/YYvjzW0=;
	b=UHu/emdG5g3IaIMQGCKwWxmP8nnlfKwtfceihM130gVshJ7ICWEJrXZCgJzG3xsMuD2Z6o
	Cf+IQueZEYuATYXopCckDpPWE4hQCHyInXTSwNm9HFa8dd2XmguZl4Ljo3unmq055ND2qr
	XB6lVHCuxyE9kCzf/XJ0ROYYitTkjfR0RXm6TD8SiOQhrnGWh+8yYLXnWGMEOV3dXm2YvJ
	j87uR9AEXaKHN10BIjDUcNWetvjysL9VZOpuCvIAfNSe42+4soktidJ4iChm77l0EpGo0m
	zCoWCYDjGZZVDdh5qNlOzIeyMkGTsTzKK4vNHIECK70oYBwRBaro0ZOF296o5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793841993;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1DnJmdevmI5Nsm8y0nDCKzgvnJMuAJfaF7/YYvjzW0=;
	b=CyW5sOQiavQroQ455uWmuz3FEaIvWwiuQFtNJSiAzpabjtKsXXbAH33siMDRBykdv7kkZw
	TmH8gBfzC4Oo+rDA==
From: "tip-bot2 for Ashish Kalra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/sev: Set up RMPOPT only on an active SNP host
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Pankaj Gupta <pankaj.gupta@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C331aeb2f29710865ec064bacf9edacaadde2b094=2E1793216?=
 =?utf-8?q?372=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
References: =?utf-8?q?=3C331aeb2f29710865ec064bacf9edacaadde2b094=2E17932163?=
 =?utf-8?q?72=2Egit=2Eashish=2Ekalra=40amd=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179384199170.1009794.12698724812746227631.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     dc2334c1752b3c5f58af74f1e7ad6769b38e1f33
Gitweb:        https://git.kernel.org/tip/dc2334c1752b3c5f58af74f1e7ad6769b38=
e1f33
Author:        Ashish Kalra <ashish.kalra@amd.com>
AuthorDate:    Wed, 28 Oct 2026 19:49:38=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 04 Nov 2026 17:15:05 -08:00

x86/sev: Set up RMPOPT only on an active SNP host

rmpopt_init() setup work is gated only on X86_FEATURE_RMPOPT - a CPUID bit ad=
vertised
independently of whether SNP is active.  As a device_initcall it runs on ever=
y system
with that bit, so on a host where SNP is not enabled (disabled in the BIOS, o=
r AMD
IOMMU initialization fails to bring it up) the workqueue is allocated and the=
 message
is printed at boot even though RMPOPT is never used: snp_enable_rmpopt() bail=
s out on
a non-SNP host.

Rather than add an explicit SNP-host gate to the initcall, set RMPOPT up wher=
e the
host SNP state is established.  Call rmpopt_init() from the tail of
snp_rmptable_init(), which runs only once the host RMP table has been set up =
and
CC_ATTR_HOST_SEV_SNP is guaranteed, and drop the device_initcall.

This is soft initialization only - the workqueue and the announcement; the ac=
tual
RMPOPT_BASE programming is still done later by snp_enable_rmpopt(), which re-=
checks
X86_FEATURE_RMPOPT, CC_ATTR_HOST_SEV_SNP and rmpopt_soft_init.  An rmpopt_ini=
t()
failure is non-fatal to SNP and is intentionally ignored by snp_rmptable_init=
().

  [ bp: Massage commit message. ]

Fixes: c6c6f156d192 ("x86/sev: Perform RMP optimizations asynchronously")
Suggested-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://patch.msgid.link/331aeb2f29710865ec064bacf9edacaadde2b094.17932=
16372.git.ashish.kalra@amd.com
---
 arch/x86/virt/svm/sev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index 417e6a4..4de9681 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -662,7 +662,6 @@ static int __init rmpopt_init(void)
=20
 	return 0;
 }
-device_initcall(rmpopt_init);
=20
 void snp_enable_rmpopt(void)
 {
@@ -726,6 +725,8 @@ int __init snp_rmptable_init(void)
 	 */
 	crash_kexec_post_notifiers =3D true;
=20
+	rmpopt_init();
+
 	return 0;
 }
=20
