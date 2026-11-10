Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323198;
	b=T4QKwRf2D6FRt6/MH5eSHpRu7rUqVouIPURPQ3+LcxCXt+3PfnAzwtobuDLlC8Klw/Mn
	 xGV2NALjutA71FweuzQz7Fmo+6kF/jgosOQXCLaAA6XRXwtw394/99b8VjhkJyap5chOt
	 B9UQWzv0n2EhOwdQhtUIF0tCW3okFoToh170jkyjAI5z8bxWMKu2u4w9ttMod0Se9Tw8k
	 jDw0QzMolHz8q3FBo3hGBzyj4BGGpeCDKcztEs2gKT2OqJ3/D6G7tygDR5XGLtazwDypy
	 cB+kpDHqCxI+D13J/bLmaalYjoy52VZD4X4e5nh7PIpF+GynUwW/fsF2j746ngCuEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323198;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=bMGRUPctVvNAVCZKJbldZ0Ql62Zp7p25thVVAQO/4+o=;
	b=i8HQx8EVsbgXigrZhR/jxjqa52rdLxWbz2htzyvY00B9TizywHTYKj/LWgeB0Ge94LfG
	 1+L0xPV9vW+aFndwPiwuXlQ6FItu0t/4xPZ9J+2BSX+e14+9/QF2PdvZ395AY0x8zqzaZ
	 OaPwhzgtfOaKME5yx26c7vZ66r5sOfNsFSbQCHS25F0dvBT6NjBdXGIYRyqReTKUBaiM1
	 kg4cz+6Oye34px5eeUTHO1355+o86t62DJgQrd4Tzcqqg22Z2bCTWnpwD+xNVQwxD6PPs
	 sqtjJhLUp/yjBHcsJ8WlUn7sqWjkVamARvJmAidqSon0uEIM/MtIxAxe7LuKo/oQq+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlbZIGgL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44189606AA69
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlbZIGgL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11271F0089F;
	Tue, 10 Nov 2026 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323197;
	bh=bMGRUPctVvNAVCZKJbldZ0Ql62Zp7p25thVVAQO/4+o=;
	h=From:To:Cc:Subject:Date;
	b=SlbZIGgLG1ZUSqepGEz5EfsdfgI0UIOj1Bb12YU/6DBWH30retod9zNrIDLwCGgHR
	 tfE9X+Pexepa1JiAI4zU9KCMJ+R0FVyvFtHoErJDL8TjHTl9kDTRTdR5LWAidDNKEZ
	 EwL/c9mjbF2A20ImMtO2SS5ybfU4SfzeMpyp0+OEvmVlApC7jYzqBGCv/TOkbDiE6r
	 Th5ULmXh5NwwLrRnhGbT6Pk9IISHsYShYo7VAOuaNVdmaB7SBGgHvutN6Wdbfn4O7i
	 7PeAlYkYPJRJ3K+eSmDAmn2AL1I8s2DEkMNpl9ZMpdiKLBV3QHbDl5BhCSQ/bMPsLe
	 oyhNMfyERrqtg==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Sean Christopherson <seanjc@google.com>,
	Wangyang Guo <wangyang.guo@intel.com>,
	Krzysztof Piecuch <piecuch@protonmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/tsc: Fix early boot crash with bare tsc_early_khz parameter
Date: Tue, 10 Nov 2026 16:05:23 +0100
Message-ID: <20261110150523.187164-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=blum@kernel.org; h=from:subject; bh=k+Wz5jpcmc+lwW04J2oodQyk33Vjwu18cAUVuFMQpdA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmfjTYfitwXlau/Xtfp1oqMQrPwHz0nO71uhZ/Y+rQz9 6h84rHTHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR6U8YGTaZiSy/V3LD5KPg a+Gclq1vxWVDlyg3v7m6dgXrhSnx3PGMDMsCV+XH3DjTumT6PvH335KmabUlJV6MYf3HdOuZ/7I di7gB
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

When a bare tsc_early_khz parameter is specified on the kernel command
line without the '=' separator, early parameter parsing passes NULL to
tsc_early_khz_setup(), which dereferences it in kstrtouint() and can
crash the system during early boot.

Reject a NULL argument in tsc_early_khz_setup() by returning -EINVAL so
early parameter parsing reports the malformed option instead.

Fixes: bd35c77e32e4 ("x86/tsc: Add tsc_early_khz command line parameter")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/tsc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 723347e2cf7f..82ff4b7490a0 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -70,6 +70,9 @@ static DEFINE_PER_CPU_ALIGNED(struct cyc2ns, cyc2ns);
 
 static int __init tsc_early_khz_setup(char *buf)
 {
+	if (!buf)
+		return -EINVAL;
+
 	return kstrtouint(buf, 0, &tsc_early_khz);
 }
 early_param("tsc_early_khz", tsc_early_khz_setup);
