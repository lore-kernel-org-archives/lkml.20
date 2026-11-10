Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311901;
	b=PB5lco47yPCB/gzSm+JZCbMK9cRUoLhqm368xrsCbPuOIJQvX6t8MZP8pY7MXxJ7Ttiv
	 utSHHcbrgrQ6jr8gW6ikXVi1awRNL8qT912EiV50NHmMjwzOz59B5Aqbff2s2C21YBw8x
	 g0kiHKjPEv6h2H7BmmvptiKGxTjq5HjGq1rLa2ucInwVVd6TvS2R82NMwcnLf+cL4KXFC
	 UDbd2XBFnlXc0pZbZ4fMrdOt7Cd01RRRhApovV/bcvmbKfcIFXh5sty5ikUCujp0ixejf
	 012g9XL5fJPDrtl8VFEPWGG5wYUps85ipvxHejM/QEaFy//goyTrNyDOjsHxmhRohbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311901;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=d6a5TUQUZkn+jH5dZsAAwNSzNUJijQHet7gA5aEy4FM=;
	b=l9nfpGgoxmPUD1uwtAqsu6g7/EF9VEaWAOiKkwuIzh2pfISuPwuGqEjZCrPodG8QM6rl
	 syUG0CMVzNHhfNn+QpX8eAtOzfONF244KmgDt3BWiN1Z+wmTsWBkOp0R81IgfPObqMfl2
	 Tnpf0emKaybL0x3atqx/Zuj/jfTMc9B0l0qS74pfkiC4LB5bKWTWW3A/YXaiAKnqAMQbi
	 Vm3Bquv92jUFEZ06SahDSTB0y/n5Ug9mKK4tQEAR0HaglWErGK6Krp1E7GO9uneqJ+eUl
	 dSUTbutBkuwPTg059WsWOPtP86zefbWRgZmGy6TfV2+YYo+e0arZvRg23DNMe3kmqOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htuX1zAR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF760A3827
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htuX1zAR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DEE1F00A0A;
	Tue, 10 Nov 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311901;
	bh=d6a5TUQUZkn+jH5dZsAAwNSzNUJijQHet7gA5aEy4FM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htuX1zARzrSZA0GCyIlMJXctNfFijvLO9y1DReBOHNQ1q8OUp84Qmrx2GjYnzzj9n
	 yV18tXuxFoRRQYdMm76nvD7RMHCAhdevxutdeQUDw3D/4fOuOLLFfz90olS9Cuahqf
	 TzzSDWZt5azqLIrTuDk2vULDSjR0XvVbEOtl6lFha0u8OcphI1H8cllvDajFQgwNXA
	 Gh6AK2g6pmSHe/U8RrOH42J5DRcPnQvaIvaG/jbNGR8wdQkf0y6DTTjPIfSmICZ3Gb
	 wP+QI9Pl5zY7+Dk0iPXJYf1hY/f/udoxQJhgrr//ENhu5qHyd79fLGm65P2UTnzRZL
	 jKS38UjjtKUYw==
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
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] x86/boot/compressed: Declare immovable_mem index in loop initializer
Date: Tue, 10 Nov 2026 12:56:10 +0100
Message-ID: <20261110115606.133611-9-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110115606.133611-6-blum@kernel.org>
References: <20261110115606.133611-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=blum@kernel.org; h=from:subject; bh=dMDXDKSui32xC2TF0nByAU59DV7eTEojUnq70c6v2uQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmf2TI/T3r7V0Fwd8wioy12jlt6Jn08J2eX/Mv5r+5mD +4JL9bc7ihlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJ3G9hZPj95MDjw6s0c5l8 +jzdz9uWr7joemJ9hsndDd5Jzy+93WPK8D9sHsORuRK/LjyMLE/TNDszobe4+PGqdZ0a9hKrFtv Wb+MEAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The for loop index i in process_mem_region() is unused when either
CONFIG_MEMORY_HOTREMOVE or CONFIG_ACPI is disabled. Declare it in the
for loop initializer to prepare for enabling unused-variable warnings.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/kaslr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 290153818d0f..cf9d82436725 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -599,7 +599,6 @@ static bool process_mem_region(struct mem_vector *region,
 			       unsigned long minimum,
 			       unsigned long image_size)
 {
-	int i;
 	/*
 	 * If no immovable memory found, or MEMORY_HOTREMOVE disabled,
 	 * use @region directly.
@@ -619,7 +618,7 @@ static bool process_mem_region(struct mem_vector *region,
 	 * If immovable memory found, filter the intersection between
 	 * immovable memory and @region.
 	 */
-	for (i = 0; i < num_immovable_mem; i++) {
+	for (int i = 0; i < num_immovable_mem; i++) {
 		u64 start, end, entry_end, region_end;
 		struct mem_vector entry;
 
