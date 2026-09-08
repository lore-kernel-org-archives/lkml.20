Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39816367293
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845857; cv=none; b=atCKIYI9ohORxGJ4zwTmFMnoGyjDVpuGj4Fg48uv/oGSSf2aD2hQMwHx9CvyQs61ykW5ZAZVf0DUjiWJy7CWSIONmN09Uwf1pnX1RLfovGaa1dLApmZX20OXf/oBROAErJck2DVxldXfBCy8IT5sL08MonmC4sGL2OY88TMw4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845857; c=relaxed/simple;
	bh=o983iJ+yESLyXRWkc/1BD1Ocd9G3iDRwnBPvJab8rdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sMW2tD0KQbGe5fSEkXqgG44Lsfjk/OyN0UGsk2r0TcaV43Wnua7phwA8tAGxrwQIwRfeRY1+Jd9C/niQ7jroh9yBYBkGmVN/nSK3vYIZYxkhPw5XN0sIm2PzTnYYgFgDl+BrhzVKGCwV6g3YiwHRUt/YbTZuW5/5/cgA/RLbcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRtPjqDL; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRtPjqDL"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2240646a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845855; x=1789450655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dSBgu+PYO8L57iJ7mEEHE0juRfKuuMbZOsF6p43Spo=;
        b=nRtPjqDLFDL8Dm9u9yVcF5iFwXePrUqw1emjeCP+FxmIP7ckibOeYjUeRMPnAZzQ5n
         EVHDZTm7+BkTJ7KdQys8KoZKbK7F9/Bf1FA7XIy54Vik6B601umqeKy6sZuNxZjM6dGu
         74rxE61GhMTUQr3c2msRbxTXuf5/kbfv4GEp4dv8tlhrIYLWFrkFNOkCJ5BcXZqjRIsV
         qOP9A5mPZt5B/4/ccdW+HLHomUn8BDd3iVRMlEervIcFVXA4OYtPkX/aVw/F2htYS10g
         kDHFejX7F0CDsBNycpDlKo9gnNZdKYLL2U4SfNV6YyW1hiF7W4ZVxDzQFtaNjmaclJoJ
         gsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845855; x=1789450655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dSBgu+PYO8L57iJ7mEEHE0juRfKuuMbZOsF6p43Spo=;
        b=BrRQnP/KmdMHfkKoEywg9Dg50bDQwDINYZPLrFaAaVFZTqMqOrWFOk170RMYTmXafC
         ax80QMXAczVLkapUyWTZUYLR5bMYOQ2muxHc2O1k/35aKgi5MgcfdJ+8Yx5h+KMuDV9T
         EeQIPuPSYcMcNUJlCZBeM5c78uSieaT91FMRmd7jJC5t0czn1mzxg4nUg7teh8ZYk0/B
         QU0lwI2/u9tW32AH3otOl48Gx4p+H8VaoqkKn0ZLFaLfGN6mO+psECJh97IPsLE4XjG8
         eIszJkSKiQ8sA1tpRCGDNmsA1jfOsMKsFLYzmMcX1w2W2QYlkcBzdCV5TiVJ/FRr2IDX
         dUsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy00A14CzUo+UaHpgmpx+Q/qx5dlT6Uvij8ua1y6s16l6rAw62cN0GEllIa40xiYlzaSnKSBQn/ZalisOM=@vger.kernel.org
X-Gm-Message-State: AFuF++kT/wVJJ2bsfk71QjwjVueJFvayv8wcbeSAmNN7aOUk2ewgcdUX
	iW2NhvfsdIXSLcgHJddmBQtCBV1kgEpZdHOdlwbAYzgFOBcK5NkxG6Iq
X-Gm-Gg: AYBFou3bPCpQLTg6QXNyUs7FBlvQori0Oty8+Xy65EMQiARwSm6z95GTK6gfiFo5/NG
	jCwWNiGU325fFLmSC3/oDUMEMIZ/7Hz72vobpl0aRlKwsTsFYVNvhhax2OUYG4iBMH1nDeUbajC
	Vzp0XTNjwV0l2us48ggq4qKVkFjXR+jJJPt6k6o/kTCuocKIpihtaVIH6ZwoqwBqiLbaoTGY6g1
	EiZ4DKQyZc2V9z3+Rl4bqz3fc+rEHE0XT2Umw/ot8ffvyvMNU7C1T0lC/LhuX9EAi4MrlXNns72
	RaS5SeABSUDBeHbSUYXKam6qGLaD8JThhXpjssSGIHR4bTrHTllqRQiyAyeWRZTecIc7E3gYMbd
	qAImpZUyuxl4dA8cOr4xhwstini9VpxWDPVkNNfzZvQ7YYNctEqoQGA0Wi+AsjpDw6nSQTSNqBV
	nysTFj3SCqlo7ieEgIoz/DLjTwWBpYlSdmjid1v7mBbQhGIlY0CWwWrMF2XlWYIMKb+X7/UIxFC
	Q==
X-Received: by 2002:a17:90b:4c06:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39b26116d9fmr35119666a91.8.1788845855382;
        Mon, 07 Sep 2026 22:37:35 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm32332057eec.12.2026.09.07.22.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:37:35 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <jroedel@suse.de>,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] x86/svm: Avoid sign extension of SVM_EVTINJ_VALID in 64-bit expressions
Date: Tue,  8 Sep 2026 05:37:22 +0000
Message-ID: <20260908053722.3917934-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SVM_EVTINJ_VALID is defined as (1 << 31), i.e. as an int with the sign
bit set. Whenever it is used in a 64-bit expression the int is sign
extended, so bits 63:32 end up set as well. Two 64-bit users are
affected.

verify_exception_info() uses the macro as a mask against a 64-bit value
when it sanity checks hypervisor supplied exception information:

	u64 info = ghcb->save.sw_exit_info_2;
	...
	if ((info & SVM_EVTINJ_VALID) &&

The mask is 0xffffffff80000000, so the check also passes when any bit of
the error code in 63:32 is set while the valid bit itself is clear.

svm_vmgexit_inject_exception() builds the value that KVM hands to an
SEV-ES guest in GHCB SW_EXITINFO2:

	u64 data = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_EXEPT | vector;

For vector == X86_TRAP_GP this yields 0xffffffff8000030d instead of
0x000000008000030d. The field uses the EVENTINJ format, which holds the
error code in bits 63:32, so KVM asks the guest to inject #GP with an
error code of 0xffffffff. Linux guests only consume the error code when
SVM_EVTINJ_VALID_ERR is set, which it is not here, so they are not
affected in practice, but the value KVM writes is not the one it intends.

Use BIT() instead, as is already done for most single bit definitions in
this header. Every other user applies the macro to a u32, where the
resulting bits are unchanged.

Fixes: 597cfe48212a ("x86/boot/compressed/64: Setup a GHCB-based VC Exception handler")
Fixes: c3392d0ab714 ("KVM: SVM: Provide helpers to set the error code")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/x86/include/asm/svm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index aa63431ba92c..921e6ecc4835 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -637,7 +637,7 @@ static inline void __unused_size_checks(void)
 #define SVM_EVTINJ_TYPE_EXEPT (3 << SVM_EVTINJ_TYPE_SHIFT)
 #define SVM_EVTINJ_TYPE_SOFT (4 << SVM_EVTINJ_TYPE_SHIFT)
 
-#define SVM_EVTINJ_VALID (1 << 31)
+#define SVM_EVTINJ_VALID BIT(31)
 #define SVM_EVTINJ_VALID_ERR (1 << 11)
 
 #define SVM_EVTINJ_RESERVED_BITS ~(SVM_EVTINJ_VEC_MASK | SVM_EVTINJ_TYPE_MASK | \
-- 
2.43.0

