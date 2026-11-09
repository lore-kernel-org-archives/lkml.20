Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185801;
	b=0j/2hKixwtwi0Dkum/m9UcCiAlHyGdykXMbe0z/qrgaSKFl7J6jippnLccC2fwB/g35t
	 C/sEW2CB6xS4edKU7v/tNcNSXnkdFIbsruESpPRxIWFBeFpn62f8QoCJnY+FWXMl2KrkT
	 NAUsppr9yoqu82ModOQoWZ+Prmn9IYSBNRP/TY32bsQMNwJuBdy8OQPpTDH5GyKleGCc9
	 3b1ZDcoytn+s+2a4XH5urxR4IVnuUfBOisNvjtGMfF9Kf65+nhmn69ArNTpfsGwc9glb3
	 xT/X5wM3hNlpwxDLKQ+UQQbTJEidq9NTrRwt6cqPHTLk22iDuBImV/b79tUp9Z3h3GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185801;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=SVMV93Z5EJOkFRCqQsc/a64u66x1gaCOofZ5dKQPhJI=;
	b=jq7Z0SsehNGC+XjByObo16g0VubiiwrnHrniNNTalbChquUrQExNTVqoPAY9d11QhKZg
	 F6A3yjVR2CNKTYyrDCm1x71iPSHu9N43bKh4YONHttEpR3QZKWFTmOX6HicsMCuitL+DP
	 EmrMXKHaoeTN7s/rzoem8dcVjcGwzfSYT8nj7C+xBdAK0hmwDrIpRCJ6+zZliZT/MgUg7
	 RbyJO/Tdo+SXOVFvoQhOtIwFjaCymhcx3c1er2fxTHwJ3K37ZH6MDRCiA11CIt5TQBugT
	 sOaMkvtL+bj4CBJ22k/SKKMDZcRN7TB3u/vv/+/zbzK5vbSqxUypKuTV10IV2HryLqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AONx2rd4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2DF606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AONx2rd4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539DF1F008A1;
	Mon,  9 Nov 2026 00:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185800;
	bh=SVMV93Z5EJOkFRCqQsc/a64u66x1gaCOofZ5dKQPhJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AONx2rd499O/0wWvs5tUBnzm/XV+PsJVgIB8+uFKe3qbUUnPpJAFgugsnU+ZP1rdP
	 TWgpggkR4mcw7PPtorRYxdAgx0x7I+eTNHrOwK1A0zlJPONkQYus++/EXEurjkpYCv
	 cqqpV5nGMkJcgo6DRNkPY8PpL1IWLJz4s/VcP/Xrq80xwC1NilWcdxVahlaXKwCSOF
	 FRerfvPPuMWcOtAxsGLhg4Fn3hm7UjPb9nXPGHBypRDv44txKspvu8diDAkp5A5LTe
	 KmlZJTaaKIPpKjUOa2vlVYAEDtd4JT53mqxU6RjvyJP/2JNt6+Agup1i76oEDx9rzP
	 os0xJUABLg+nw==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jan Stancek <jstancek@redhat.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] x86/boot/compressed: Mark process_mem_region() index __maybe_unused
Date: Mon,  9 Nov 2026 01:55:31 +0100
Message-ID: <20261109005528.3477-9-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109005528.3477-6-blum@kernel.org>
References: <20261109005528.3477-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812; i=blum@kernel.org; h=from:subject; bh=bIjYzDg8rGE56z/Xv6tekfR/1R1Ml+9LmvvlBDDRUzs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfpfi6Nj9IuCacf8TP8/UP9sKQlv+mpxf09JRHLQ9// fawliR/RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExErZvhv+Mn5bo/ElOtM83d lyXc2RQV/HnD2xk8DDxh2zlYf871sGVk6PnXFvmx/0nshs73bB7C7i8mHn0l5Ovzd7/fsw3mzFP EuAE=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The local index variable i in process_mem_region() is unused when either
CONFIG_MEMORY_HOTREMOVE or CONFIG_ACPI is disabled.

Mark it __maybe_unused accordingly.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/kaslr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 290153818d0f..6f95092fa97e 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -599,7 +599,8 @@ static bool process_mem_region(struct mem_vector *region,
 			       unsigned long minimum,
 			       unsigned long image_size)
 {
-	int i;
+	int i __maybe_unused;
+
 	/*
 	 * If no immovable memory found, or MEMORY_HOTREMOVE disabled,
 	 * use @region directly.
