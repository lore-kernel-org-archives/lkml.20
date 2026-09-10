Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7604E66B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067142; cv=none; b=R7dNSyygYGdK/HlfP7DgIQLWzoVH7SB7ct52FHffoJIIEsBWvrCwgHlzohztf4xNMufV3D8RO9Htl3q4ep43HQzCd6Vaq6RDn8MGUP2pbmheo7WM9tW/KfXIlY+8PHkAxSqqZlUZg48PVrBunu0osdiuJPuZrdx3S3tsNf0c/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067142; c=relaxed/simple;
	bh=BrRosa09qPfnnT8wFRJjyDdW1mX7VGPRwUOLAULnwBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iQGvI3gPG6i9OF/udgiucRHXVqY4wyMot51fmDVb/n3VhjuURIeyRIGtSTCW7FoHGNlIauzgIteGmSbZxtruA/EWZkYedhFpGBf4uCDWU29Y5D13j2KbqFjGBVPhrG5dmrcJE2U0quAQWWLH+svaTlcgfV4e7mVZ+wu2I9DGfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbNpHyg7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbNpHyg7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so2918585e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067139; x=1789671939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDPWQKpYK210YH7pdRtFQhVqun7oclqubAHor3TmIiA=;
        b=cbNpHyg7+15NxTj+DbNi/W+pMuFp6ptpL3MQEGqJ+4pnk7+NKdQ5/e6AEzo5jPiaTb
         QNNlb773bh4OqnfiG7+DO4VGeo1Bl4nA5o9arpUb/LHWonYiTQmx2qZZYyKo8uAqoKdo
         8i029AhbxwgRFwvoK2wSrDU3mbLXY48YR+aGe2z9DMDFkJw9XRmGCt2k9odCIn4mZJec
         wgAvmNgfKxiqsNaZiOuDcaq2yLIRMZ1fvO4JrMy2RNSfj41AA4pEZ4CL5XylPUx9YcEE
         g/b8BXUWlZEX8PhBRMzXl/DKsQf9TOet1zIld8hIuZpyOvM+i4dc/zOUBy772wIxaKMi
         sowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067139; x=1789671939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDPWQKpYK210YH7pdRtFQhVqun7oclqubAHor3TmIiA=;
        b=bTWUEqy8JWvmusRg4cN2JmojTVREPPX5Uqkuols7dXhFCLr6B6ZvsiqyFKKQS2jF2X
         Y7zgNQJOtHbRK80p2W8CV5mTXBjmnReyilXw1IE0iVC4MhuLncpI048aK02Lo+GUFYq1
         3mcXEBMLOSbqAhq9t0AtF3HdV0XVCGUs/SbcgNg/hwGvMOdu23w35kVkhBMTyMWIl8X4
         Dk3xFpKDXJNgQt0hK2HDvfsD/53PrCKRFh+SOtfmQr41R6NX9j1DxONYGo/msU2h8wY0
         V/n8nNeOKtT2J6Kb61CCVwBf9avhboabbDpaGaaJdrY39d+6spq/gRlWTvK3PNp3NLA2
         Q5cw==
X-Forwarded-Encrypted: i=1; AKwUvBwU5ymUBKGIiav0AoagaQQtusQoxoMCnWLH169e5MqN30nK4cqmAB2FoQnY680MTUU8soHLnD6B1nn+c08=@vger.kernel.org
X-Gm-Message-State: AFuF++kq6ucd65NJhlfEyFRehRiBLynTZ2GrACTngnyN1MOukbZMlq/n
	bpbk8r+stI0hw7xAqa/HnmfuXLFxcFOGwbnIego/zWApqlKlZqb60mXk
X-Gm-Gg: AYBFou0iLvoaTC4X0X4+vHGCnscotK7vLxT2F56w7j3uFgBQAqdRj5T8sSJNWM26gel
	fUPUHC4tuVR1U11M5A0C0rFFAZDIQebfavx+C3dY+gHXupdl1rIDTjsjqnNM/CwTrbt2CwwLPpJ
	d3tzL9mYI+lRKTn0AmYWOdD4XYb6lhOt/S2jHqMeRWIVPaUTwiAn7amogqeYr2qFYi4fN87cet0
	xITXv2xO2eReNPTmLm88NgIMisqeyPLHFBcX6T2ErD8WhNIDwPM6VjH4UcrT74BY7gl8ubkTUPz
	YuxYujUEWn5/jg/Au5AnQFTENgtUucXGbkr5zKZT/7GJ1+CDbWfo+ZU8I7cd2a2KXCedAUU8yXY
	92TnAs7t3DvWhShQxf4CJVuolxAaZ5rqDNctwS2vQAt4BJMvHJNSpIiCoYwTmUy8ZuHgrPBLUsq
	j1xWOpA9kVoZagM10oQCCFE0ZxU5fnkXDf5sUOmkFD2w7uvphUVr5j+0yBm6RBAfTrg0pyhMN8m
	UD29tdbOI3Pab+hbT/Azx/VuDKUxZO8V8SIfnkMXqSpgUhc1ZSZhZI3KrwV9xRVL9GfqlfijCoa
	wXJW0mmdUA6/83Y7oysVN8LEfkTh8VKVTLOksjSFrAJvc7cuPvhgmv+7xYlWZfnc+wuMfspqKub
	8fjr38CQ=
X-Received: by 2002:a05:600c:1f8d:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49e6198933cmr5181655e9.9.1789067138621;
        Thu, 10 Sep 2026 12:05:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-601c-58ef-b3f5-74f5.310.pool.telefonica.de. [2a02:3100:b3d9:b901:601c:58ef:b3f5:74f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adb075sm14811665e9.13.2026.09.10.12.05.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 12:05:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Date: Thu, 10 Sep 2026 21:05:28 +0200
Message-Id: <20260910190528.4483-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
References: <20260909063156.89636-1-kmehltretter@gmail.com> <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
describes phys_shfit. This leaves the real parameter undescribed and
adds an excess parameter description to the generated documentation.

Correct the spelling and describe phys_shift as the IPA size in bits.
The value written to VTCR_EL2.T0SZ is 64 - phys_shift, rather than
phys_shift itself.

Fixes: bcb25a2b86b4 ("KVM: arm64: Refactor kvm_arm_setup_stage2()")
Suggested-by: Fuad Tabba <fuad.tabba@linux.dev>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Describe phys_shift as the IPA size in bits (Fuad).

 arch/arm64/include/asm/kvm_pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..20d12da3d28e 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -532,7 +532,7 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_get_vtcr() - Helper to construct VTCR_EL2
  * @mmfr0:	Sanitized value of SYS_ID_AA64MMFR0_EL1 register.
  * @mmfr1:	Sanitized value of SYS_ID_AA64MMFR1_EL1 register.
- * @phys_shfit:	Value to set in VTCR_EL2.T0SZ.
+ * @phys_shift:	IPA size, in bits.
  *
  * The VTCR value is common across all the physical CPUs on the system.
  * We use system wide sanitised values to fill in different fields,

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0
