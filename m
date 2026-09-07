Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4C2DC765
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756302; cv=none; b=ZKi72oUEziVqbVy3t+lQYMlhWMAPUHTpIpS9nbYEaWj08JP9zCR4/ecMoganokBsUpFR9aRk28WfdTVvugPBE3s9dPIv0Luyhixng5EleC0v6PolmdvehxuxGyRK/YESwG7rMNInOBp8iuhgVZVhbr+jc94pghHe2DBVpGxJK4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756302; c=relaxed/simple;
	bh=GXik8XMFxKlyNr0DJa0gcBwazjCkzO5/wY0cetFN0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViQImQqwNrWUpTEGSWa4ShRhZSwpWARFJfIpCz0sTl1jYVocEGDxTP9U1wAljr2MP7Uz6APthcI8v+SWP/dYpdnNfE7VuGP3ex3DjD6752B8TfTmBJRh8AB8RDotLh7DXQDHx/QV5tn53WgYLK0Fitdj92t6RTertdxITt5TCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UduKfR+1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UduKfR+1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39675172593so2448146a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756300; x=1789361100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=;
        b=UduKfR+1N4SjTzicVqtQ7dHRjtahTW1A0ApwsHPX2zyd3lfkI0jGvOTnxmzXvuP/G9
         mwlueZJw2W3YsaKBGi+U0RIAXIBIDitwU87vnlpWN54rq7tdpZr8MR2JwvO/ZmCTQIA1
         ewmQXm9C6aj7p1pi8JwyIszxmIfs57JUvyH25z5gtpEHVkVOT1uXS3Be4okQ+Pr2ApNO
         cbNYVvPX5bSDb03qd5BsuTBI9fts2WYvgwmeIFSF2IXkvfZqxJ57uKkpVZErWOMRre1y
         ciEredKNxmWXaMetxPSs46mMVrKpSEIPC0IWuIDQnuRgStupTxbtpkjOrMVGjhP6Bnyk
         pfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756300; x=1789361100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=;
        b=QlAYE7JaxInCIIgqajHWtYxojpIM+wTPK2fzLVbLkk74XzT5ofubTCuJs1iCh/jOaC
         bapBqLOG+5CDEBHGUgkviX9gJ8dZVEbvTPOccwinERp9Y/7u1gdgV9zE/xyGFUIMhrT/
         7HZFw8WsxMsX4hcX1/LQNrwhykqA+um4qV0zmvNgIaCdJtam/pAyk5hzxo0+I+8RFzdy
         hqrX3LyaanC8rVINI/ikiG16YKBJXl09iRfhLYODcNvR/qIE/LhjYZJdx1W5rGpdf//P
         pzFzyRLR1I0xi3fF6wHupyxS0XxeIPm9CIb4FKeghl3w1MhwC6jsCNr0sk+jV2sC0RVu
         tjzA==
X-Forwarded-Encrypted: i=1; AKwUvBy3/aNtyPldgm7qLd9LBml50I0dVDFotpqRDi9J9++FLEjzswNilUKYkseBDOxvJNV/jVglmwg3TDDYBG4=@vger.kernel.org
X-Gm-Message-State: AFuF++k5IIEZULWadjQKg/k3Z79yaxo7zEG27yMyIPBUzRlJNZxlj/5i
	7JE9yEzcONkAM3bbPMkq6cVatu1XNWr0tC8FZYKBBWS4mh5L8tD5taHx
X-Gm-Gg: AYBFou0khbd5Di/kgP7r99ZqiH868EOn89p8vxBVnsY5eE7q84/ORWPEdLHmRJaju8d
	UgLLw5Am/LmHjbVIZNAsNi/+LMV6LTimyDCrwFT2qecKFh6AlS8lOaf7b3qA4ej3VXWLdSEytRB
	qrEAZhX98aqCAao1vRZOjM+vWz02YqUNiOCZyEuKaSpk1Y75iuURoyP90YBq//9b+oM0S6amxDy
	qomEzKCYRP2PwXQaky13GCjYWErFHydGFztcybVQwfQXV3DtctVaD4bhYwt03QuuQ+3O4STIPm4
	XzeGpKgid79f1XFk6SyN/k/uJqlhRPPSRpApSjXprX80vdDREXmLC+6SW+FNn68C52bV4BzROrh
	7Rq1X1DRTlGnNO2+kr43oAMe/6L6MCvljhLkc+9r5NN6AIsMioItblfsvcHJvKg1TsZ3cHFIs97
	gRXgvDaQ8Wm7oKz6MeRsvgWH7ckI0EcdNjSHfEwpp/eWc+Be23V0B0RLg0PLtRub9eF6mRt0qII
	HY6LYd7bcVH3Q==
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr32751634a91.8.1788756300129;
        Sun, 06 Sep 2026 21:45:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: kvm: fix typo in pauth.c comment
Date: Mon,  7 Sep 2026 10:14:34 +0530
Message-ID: <20260907044434.4682-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044434.4682-1-hemanth.selam@gmail.com>
References: <20260907044434.4682-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment reads "This code assumes that is is run from EL2".  The first
"is" is not a repetition, it should be "it".

v1 deleted the second "is" instead, which left the sentence without a
subject.  Fuad Tabba pointed out the correct reading.

Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/pauth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
index d5eb3ae876be..bb6c42e78058 100644
--- a/arch/arm64/kvm/pauth.c
+++ b/arch/arm64/kvm/pauth.c
@@ -5,7 +5,7 @@
  *
  * Primitive PAuth emulation for ERETAA/ERETAB.
  *
- * This code assumes that is is run from EL2, and that it is part of
+ * This code assumes that it is run from EL2, and that it is part of
  * the emulation of ERETAx for a guest hypervisor. That's a lot of
  * baked-in assumptions and shortcuts.
  *
