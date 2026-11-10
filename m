Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311907;
	b=XZbVn82SMmD/GjKKiJDvDo5oiu0sJq4ImkJaXEmXXubeetF0KBbTH8iS0b43GWTddiYd
	 4I4ZuvwvSlLdxyIXxCU4+6xImJ01PZXgrFEeFbMXgMh1hWInjVOzNjuUncsVzgzDZgldq
	 F1uZgWFjB06q8SjKoKs8AmlekOnvMOyRdL2wX/nSVpoM4x9fse1md+EqlbiWw9bHxaFa8
	 hBRYHQ9LyMDADqVRvoFawMJdeai5g9LT6RRvEiBYL6anAwHJ/LYj6HWAZN5jiVjUya33Z
	 x14cA6fe3VLKBa1zCmtWHZ7uucc7bmwi2JSii4c9YV95U3Tkjqh2CFVx40S0qhVcgLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311907;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=5MjXkTr81XHjJXC4XW9odEr71wejmTyaWWO5F/Vmk0c=;
	b=UlwhwpWY75vQ0ZiWLBNdud5YN8vq4YQl45P59blSvDXcRxP3qtVSN2ba3xE2Tp56OXFR
	 lmT/QaalKOzF9ybsrF6D1l2tYjQd+ZwsLNR9q98Z4m6KnxdBdqqx1Y2Xgf4UWLvCXBoeq
	 bGB8cvBrRtY0PXICWXPMt3yF4a21MD2LlNpjVEjr3AyMYuuhnUVXnZQWa66EgTcVJRppi
	 QG5sk+oAJfbWy2u9wwY22M71/jeEGvlFgizGhKtunO706h250NQQekXrcVq/rRiz+T/OX
	 zIC9UqMrKOQFx0Hzs4kACcEOulTKYojkOuszlyTZlMeMgopZXTM7suSsXVJM3RApu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efxMryQx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efxMryQx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC201F0089F;
	Tue, 10 Nov 2026 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311907;
	bh=5MjXkTr81XHjJXC4XW9odEr71wejmTyaWWO5F/Vmk0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=efxMryQx22jsxU1qqMuK3rjmB+4S8Uhu9KHfHISCF34tTtSeonxsR6lPU/zXVqKcn
	 TB6YE4CeXq1yxBIo+6KAszJcXKjndfMDVSOQBCK6fAqOXj0FeCgUXWJ5TKuWumD0/p
	 kPItMzBBnj3tA7uwRH77uzcYn4nIExPSvF/D1KNmGwmmG5fHN3vt5GFpfd9cj3iin7
	 xLQcrEOt5b3sI41B5tcq4b+/gHOkAc1qF1hqvBeNhxjH1ZpNOE7TxlIPnPk+l2DfMm
	 5ZLmJhgjJrN+LcVkbP85pC06dfLAKlFQz+7G+I7RfjxW2a9y+rKvP8Qf3GhcCYCBif
	 rKHlLgd97vf7w==
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
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v5 4/4] x86/boot/compressed: Enable -Wunused
Date: Tue, 10 Nov 2026 12:56:11 +0100
Message-ID: <20261110115606.133611-10-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=blum@kernel.org; h=from:subject; bh=5MjXkTr81XHjJXC4XW9odEr71wejmTyaWWO5F/Vmk0c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmf2bJXetU1GiyJKv358PL/V2pzXmS0iX4KdHUPnSO+O C65kN+ko5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACbiNZuR4aJ56Sr7686HYzZN SDm+Jjl4QcKCdKv82ak3LhZtnz3n9DNGhsfT6nmcsyf9m1knkX3/Rin/dT5O8d8NT0+Jbzt5ci2 LKwcA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

arch/x86/boot/compressed/Makefile resets KBUILD_CFLAGS for this
directory, but does not re-enable -Wunused. Therefore, unused variables
and static functions in arch/x86/boot/compressed/ currently do not emit
warnings.

Add -Wunused to warn about these, and -Wno-unused-but-set-variable as
well as -Wno-unused-const-variable to match the W=0 kernel defaults.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 680ad803cba7..3ff75bc2239b 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -29,6 +29,9 @@ KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
 KBUILD_CFLAGS += -fno-strict-aliasing -fPIE
 KBUILD_CFLAGS += -fno-jump-tables
 KBUILD_CFLAGS += -Wundef
+KBUILD_CFLAGS += -Wunused
+KBUILD_CFLAGS += -Wno-unused-but-set-variable
+KBUILD_CFLAGS += -Wno-unused-const-variable
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 cflags-$(CONFIG_X86_32) := -march=i386
 cflags-$(CONFIG_X86_64) := -mcmodel=small -mno-red-zone
