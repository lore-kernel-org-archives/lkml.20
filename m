Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFED4F5DE4;
	Fri,  2 Oct 2026 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958596; cv=none; b=hOo9jy+PK58dpE+BEevXg00f1e5gBBHuns16cNkjtwYkTPw/c2cOs/b0UFIsDx7JiFCNVqfmh0B9NqaBmfdP/b7U1VtM8VbSn+wol5YzrWT562HG6Bgj+hQpnYETls2IZsbwbZn340zB7yUH5M/oOWL0moSG6O7cpAREjeoSLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958596; c=relaxed/simple;
	bh=docVQ2DgCobg+Qekxj98Ky4CengmOiaZRRHxVhVwVlk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=u2kXNiib9rgYHUqnGtzDnmoovFNBNkpKT7DcAbqXqDvho4Ia8tiwYDnjWfdHg7aPUVOiz7TlQt9s0viS3PsEssprbRAzTFRy/GGAE64wuNTK9nkhZcFczw+b9AH8tazc6zT4pFewWdudg+XDV/ewLrbPbbHcrFkuliW6Xne1gBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DLv+JoCk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NfLKC9YU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DLv+JoCk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NfLKC9YU"
Date: Fri, 02 Oct 2026 16:29:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790958592;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/MC5adKvs9z1+2jCTtRoDw8HQThzxinUKaUv0HBQ/w=;
	b=DLv+JoCk+/sYXLg8/AAcm6pj+01NxTDy9t4J8/0OzIO2vc+yPDsBlSPuM+teuxPMCvGcqG
	IutglMKdO2zZkUqa3KLxuUb8bM3dJHv3A44+6dyzYbn6gCBlKKJ0FXyt8TkYSjAgPeqO0D
	xspurU8WpExiB7DKTlYw4AAPvyMQR+nQoTSbszLQFs9TGOT1uWMIJEu5hX3ZTcHwgevWtY
	IUB99vZKWCFmaUAR+gXhQeL0xJ6OCjA6YhJvO22ri8IKCB/Qk7jsIFemhleVTa7gq5xw9p
	CTP5bm5pr9gIgsgMvS5YmUp6WhEILwxdSC4yOqe59BjSagiG4tt5ISR8u1oFEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790958592;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/MC5adKvs9z1+2jCTtRoDw8HQThzxinUKaUv0HBQ/w=;
	b=NfLKC9YUXw7TN5sXzd3gwVGVMiHsRo+uCSLUupUi4qGV9dwEdgz9DXcaCJg4Y4NhJLePMY
	RvQzkUsyoWkHbiDg==
From: "tip-bot2 for Peter Fang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/tdx] x86/tdx: Take the Quote buffer as a generic pointer
Cc: Peter Fang <peter.fang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930103739.2851980-2-peter.fang@intel.com>
References: <20260930103739.2851980-2-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179095859055.3910103.5971784030028908866.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     9fde91b915ff10ab6b093140d78c3f47bf77e1b5
Gitweb:        https://git.kernel.org/tip/9fde91b915ff10ab6b093140d78c3f47bf7=
7e1b5
Author:        Peter Fang <peter.fang@intel.com>
AuthorDate:    Wed, 30 Sep 2026 03:30:50 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Fri, 02 Oct 2026 09:02:29 -07:00

x86/tdx: Take the Quote buffer as a generic pointer

tdx_hcall_get_quote() takes a "u8 *" buffer unnecessarily. It is never
used as such, since only the buffer's memory address matters.

Accept a "void *" buffer instead. This avoids a cast to "u8 *" when a
later change gives the guest driver's Quote buffer an explicit type.

AI was used under supervision to collect/apply feedback, review code and
workshop logs.

Signed-off-by: Peter Fang <peter.fang@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Link: https://patch.msgid.link/20260930103739.2851980-2-peter.fang@intel.com
---
 arch/x86/coco/tdx/tdx.c    | 2 +-
 arch/x86/include/asm/tdx.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index a38e444..92c2438 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -191,7 +191,7 @@ EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-gue=
st");
  *
  * Return 0 on success or error code on failure.
  */
-u64 tdx_hcall_get_quote(u8 *buf, size_t size)
+u64 tdx_hcall_get_quote(void *buf, size_t size)
 {
 	/* Since buf is a shared memory, set the shared (decrypted) bits */
 	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size=
, 0, 0);
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index e186dfe..97bf6c8 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -82,7 +82,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
=20
 int tdx_mcall_extend_rtmr(u8 index, u8 *data);
=20
-u64 tdx_hcall_get_quote(u8 *buf, size_t size);
+u64 tdx_hcall_get_quote(void *buf, size_t size);
=20
 void __init tdx_dump_attributes(u64 td_attr);
 void __init tdx_dump_td_ctls(u64 td_ctls);
