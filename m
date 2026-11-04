Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815787;
	b=TLJ6psfVsfXzRkbBjORIfZ9goe1kGW3OnaL0owe0QhzD1roSSVzgCKbJWzICofUW7NwB
	 9arhZcoa0OPQaYtCBnOE4DH8pzh+lwseBEk95ux6oGisROWcJI3KfmoEwOJU73aZiKq6S
	 yRlBCLOycdohv9+T6rfNi1dh7JUw+NiFGqkOroVEvydaKCoBROOzarYgmviemdeHBjAw/
	 QmkeYm7f8aNNVhJ3fhgN4QlJ+8lXvrEpeLrXT00zE40A19MeRJjjZ3DEkb81fFY6V7SMb
	 VelWTjVjRHP/MbxaFRqHpMFA8Pz/p+MncMI6T6hshSGf2rPz7HJbgDbdXwvv3OX41KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815787;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=03p1pprZCSwUe6A7V6YqYouefYUwBS9DJ6ISTtsz/84=;
	b=XmyOntKwhcLSmkUyCjPX00V7pz4OvZ08PlaqkTBf9OxOA1asNzI/rVs1ut7VF31qCtzk
	 6D9qp3ApZ/cDOh888R88KYuAS4+MO5RF7ymMNtFl5PfyJ2bbqka2bdLRJcpul2TGZ+KMK
	 uupYlLpCN1/47+XidPYm7pQ8ngND9TX+4xkWHuBDqLIfCYorHyQDOpZOx7m40ZFN9mHx5
	 CBPLo4GukkjkNqxGAccPwdR37pdQ1AyVOQsorn5biKzeOUY63i+mW/QfLs9/9wQCLKjkz
	 W6mMiXXlcSvy2D0lEKTpsfoYbT7BMyTT85hSeYpOjRjqqB3pEnje8f1nrktue87gwvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P40ibt74;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABE606B22F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P40ibt74
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78031F000C1;
	Wed,  4 Nov 2026 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793815786;
	bh=03p1pprZCSwUe6A7V6YqYouefYUwBS9DJ6ISTtsz/84=;
	h=From:To:Cc:Subject:Date;
	b=P40ibt74tX9V+cLOU9Z3whZD79Y08FrrfffnO03aj+GiinK/r+XCC/h+d+2o8lJm/
	 bfBPEkEJP8d8SUA5nWtpsS+oUteb3327f5EBQTM6+l6wNsoEbdSltdwLCc9NCuPCGf
	 Awl5u2OYbGFD3vhzAtTPNVHlaxrWPgncNidU1+ei8RMhcf1HSR4beMWnolG5RlK7EB
	 3Dg0QZkdl+juSLgPkmxGyLkLIXnElCH8WSpxBuA2ToLsrwEJ9C0WyuBn4MrD4MIsvd
	 2P579NsW5/dsD4xmzgSzroJZm+Bjrv8jXTFU3Tp0OOsocuytCbp0F3mDL4Cz2Ayj2G
	 kuaJ8pTGHptIg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 2F1951980047;
	Wed,  4 Nov 2026 13:09:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 04 Nov 2026 13:09:44 -0500
X-ME-Sender: <xms:5nTram5bBE7hutd7_1QfYZpXqovXQ4WJhzIeZFy7_ykQ7-DS6QWsPQ>
    <xme:5nTralEJ6P_Le9QmrJ8tJ4-22vDz3bVmWtNee6kM47qa4EtPYlCNVyAQAAOxl8gix
    8ziheUZKmGw2yX2auCyecinzyvG1asdzzBvidAFzhSjUxpQ02ijYOK6>
X-ME-Received: <xmr:5nTrao1FQWK1jvDLjkYyZoOkuu1D5tNxFnVsVgd-RRNnAn2ooAI_kOUYaGo>
X-ME-Proxy-Cause: dmFkZTGqVitTKSMs3Zf23Cej3+TrPS6tOZBUqqz4f5OLVPy3ryplzwWG/tALWzDH6gtEiC
    fQx+R+7kN79HtReRvTyG38G9fX2asBXXmMl4SNOdZWP24Jimlh6/VJDMaEhwzmuHyHiZT0
    2OTxTfdeW5I7Pzmww01wdc3jkFHBRZuQnEvZD/DEPMalun2aXaaRhPaGSLHp+SZNrw4uCv
    Z0Wt9Hg6Rigg2ekRa62L3GkzzNcwZ44x+lWwHfz8ID7RscQ9YjJco53u6DJQdIrd1Js9xN
    eBgiRGSUa0GAlI5WJBjz11af9KminzpLRkuP2Cu3lkot9HKNfLXa8mXQRo10PYZybi73Ij
    yfp37iJRF+FLuQ3BHAKlk/oDb/JWLDxW4QXo3Xix740K/LtPJ12eDAecQHn+7studYBEMc
    hOAFstiNSAz55jhyyz4xvp6ReCg3OwLTfF6Q/LlkbPoL4P17ESTDYF1cL0g5PNxD1U6Zi1
    EL80pamnbUuKF/ePVXyoVIjrkfe+cy3amZAn+zNx0W1H8+oAjhraUyQdUuFaRCpkUiuyMN
    lNqiJy0urjwd4dTpzRj8RNG6ArU4eMz+IyX24uOp333Mpb6jzrYu+5RBIWKrGA2eqDVQwv
    eOu5Caa2KZsVnxzIt6Qv4PrIDRBS0foA7mogrtX9/DkxKEYCJkI1DAEwieEQ
X-ME-Proxy: <xmx:5nTraiqKYXxovMZDpyxJsCz_W3ATSCZrHLI0oQ27l6xZtBY5pp2rag>
    <xmx:5nTralMj3UTwCpoZ_--VkqfHLVinLbyFAKEelLLcVRd_mNyPjF8gnw>
    <xmx:5nTrakUcSctVgp_7-fl3IfFWGtda8jUPYodG6i0RYTSLezQO2sAlNg>
    <xmx:5nTraouY3mXRjssrHav6kO3-b3HmnDYSl8AQR1h-F6EluDlL6YnQow>
    <xmx:5nTrav3pLA6jnMiDVh7c92GvvBMzClkMvYwjmjU7MVc1q8DnHOxaqHht>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 13:09:42 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Usama Arif <usama.arif@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: sdei: Handle exceptions taken inside the event handler
Date: Wed,  4 Nov 2026 18:09:32 +0000
Message-ID: <20261104180936.2981070-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An SDEI event can land anywhere, and a synchronous exception taken by its
handler breaks the context it interrupted:

 - With KPTI, an event that lands in user space runs the handler on the
   trampoline vectors, whose current-EL half is empty. The exception
   loops there and the CPU is lost.

 - The exception overwrites ELR, SPSR, ESR and FAR. If the event landed
   in exception entry or return, the interrupted context runs on the
   handler's values: a task gets SIGILL, or the kernel oopses on a fault
   it never took.

Patch 1 runs the handler on the kernel vectors. Patch 2 saves and
restores the exception registers around it.

Handlers take such exceptions in normal operation now that SDEI delivers
NMI backtraces: show_regs() reads through _nofault() accessors that
fault, and a kprobe or WARN anywhere in the path takes a BRK.

Tested under QEMU TCG with TF-A, 4 CPUs, 20 x sysrq-l under load, with a
test-only copy_from_kernel_nofault() of address 0x10 in
sdei_nmi_handler():

 - v7.4-rc1, KPTI on: CPUs stuck in the trampoline vectors, RCU stalls.
 - v7.4-rc1, KPTI off: 60 "unsafe: exception during handler" warnings,
   SIGILL and SIGSEGV in user tasks, and an oops in execve().
 - With the series, KPTI on and off: no warnings, no stalls.

Patch 2 was also run on arm64 hardware with firmware SDEI, where a plain
sysrq-l was enough to trigger the warning without it.

Kiryl Shutsemau (Meta) (2):
  arm64: sdei: Run the event handler on the kernel vectors
  arm64: sdei: Preserve the interrupted context's exception registers

 arch/arm64/kernel/sdei.c | 83 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 9 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

