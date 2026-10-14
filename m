Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB714D17B3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017787; cv=none; b=qT0BwsyDrZ/wzOi+9uwT5NM+2oJgPd7PQSujsvYUQxUgea6DLJmbw+Kt6Jnw513/10FtUqZbxX3gLIhAaVNtK7oNqEzhKaS0mYgq9z212q4CaG7BQip1cAhVO3LDKQAmpnh9KnoJzTUwZUqW0oznCHM2WVeBieUiWG6YEMAGCTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017787; c=relaxed/simple;
	bh=dE/xlHOL/EzKjQW1+4j93uKxqgbJz2Ukn+A1bhx0A/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mi+CvchdvX6aGQ63OHHBjxboFoQ2+4PseyUtQ/oD/eM/oSgmbs2g+dBoLqAX48LkHFpYb9RoghwE29w8TytvRFAgJFuJagNor/JF5xqr5MS5z9IldZ7DqBlru3ttCPO12En9gQuCpJ5U5WPsipXbgcUbPrgU9glSpNpiUaPDOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kd3EQJt7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kd3EQJt7"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D45A340261
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017773;
	bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kd3EQJt76omgjnklk0eBX9d+I50PilTHRJnPx7aMKSpcliLpDBgNxpTb1yX0dexVv
	 FhEc9WoH+KrarX5pbh5gPoIQDDo3ItdWcqz1G9Xv+yrnd8E2J95HHLGR9MpB6jAdFX
	 C+0Ln+/1wLaYgnW++/2/B/QrFxR5D2nPIWmPJeQUcgkY7tFjFQFkUTiq16eKueQ2+K
	 23eVFNf6h1LRMFmsGMtO8u8s/2cCN8HiAWYWB3Jq1yH+pVxAbwA8Jw044iY4PlXyaC
	 UTtyl8LDhd6EG6tsqeJBJ4u1CEnZuI74OSPS/rSGh1eZ0iI5XbbJhtIOKpVBbEO/5L
	 E8QI7e3e9AFhqm3EbZHg04oCSX4E17GPVClO/1J52AwQKRowUFcYuMPdIniCEvyrhI
	 IdZROeQweCaz6xUglXpjhhxyNOoMznyCt30y3+AuL3N5LzvvY0VneTez4ea9GZ4Ozl
	 XOcs3BaYTAo4bZ/M2BTERXLRM8mBUCT/aHM06x135lDMR0TBkcXIcnQczD7JoDZEEY
	 UasAJzFKedvT7oOw//qawOLzWfyxeDGyLijtAtBnojrnsqQu49hULsZgAz8NhCec+5
	 04FZXHtE5vmwVgCHA/0uZYatTbVwVjm1hBKNuhA/gi7xnAsRZHthqwonCl3CBoOq2h
	 lP2TjLPBh3rKBVfA7F/AwKRM=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b027578a4so737490f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017773; x=1792622573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=;
        b=TBx8nkliDgUY2STppfAiqnaqZ8KX2Nb6LRVlgXM5PxIsaKknTelxusitIJSJddgwXx
         rQB9HrBV3FLLgpQ+gVvZQJMrhGyUxngPyXpSk6hYQDimgq4WooFl38SwONBMvfsDmzPx
         rm9QjJPIYTRlpLEjX2daYuKiV1CVHFu1y/JTsNMgXs+JcbwGntmGe194+sK6umknxc5V
         4xyLpxD9nUUAUrzSIJDGMDlY80/vz1gbRpRh+/CxKq6LCCOUpA+ZaQ37Z/L2Otno1amv
         /e/anrzqGrbp6TX6yshpw02LPxStlwh1VfwGjfm+skqscXdzBJstT6A+/8w7miW9J3sN
         OBYg==
X-Forwarded-Encrypted: i=1; AKwUvBxL1NV9/B8E8j4M7A9PAR8NYsoPTh6oz7Zmmm5euYxB3QZzHTXF8am7HkhuQGTdpuHWfZSosYareAIqMdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwKL73UvKUCbFo/cxGC58cRsmB0OX2ZNCqCNXMAZrmAM/X8J9U
	hHT7EsBQHKVYSolZsBTpfjTZ40p6OyhastN8u41y4w3hvtZ8XlFcxxZRbZ6pmrll1ZFFu9dy3lf
	8mYu4bW4rRomYASIp1j0AmsrAU9K2O2v72gDsm/MEmHWWvE3mmJo4VWO8384jl0OQs8xkFCSJ0n
	G4WTvqSA==
X-Gm-Gg: AYBFou3khqk9fAW4LvIxGw5/JxxzyethbOulDU5UOtrNgEzeA9V/a1St00C7HpvXZiU
	xVeGLqCEA7StbHhPRWv18zJBnmpiY1p+p3r/CnoDHTsMLw5CjtF4xcMvWBRKUEzgpGGqgBPhKQU
	BR4PTYk36ucJ9tJodTBLehi+8H9fRdwK8Mv23tUHD+ef0/O6cLr8Iz82w/GtY2/gKzP5j6dJ0xK
	cn63usaqJcYn+wQHKuqoWKWUB5IfndoFBUGLD0clm2hr4BGUaYiZM4aOPMhDhc/hYYoXl7JieoV
	/Mw2jky0qKH8V7uFgFcjZ7m4s/3RWO4XRwDN1hd/zyrRkSHDTwOeyTDRce4sspFK8Z0fEEMvC/q
	8sV89HXcosFE6EN+LXGlMdfH4sO9bkGkwkTRt+Js6A5d4LfyNaDh6ycGN
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr319653695e9.27.1792017773452;
        Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr319653445e9.27.1792017773163;
        Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:52 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
Date: Thu, 15 Oct 2026 00:42:38 +0200
Message-ID: <20261014224239.963635-2-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension array to allow KVM userspace to
detect Zicclsm, Ziccamoa, Ziccif, Za64rs.

This is just notifying of hardware provided capabilities.
No KVM specific support is needed.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/isa.c              | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 20d9959ca44fc..39b0f3f1d4863 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -206,6 +206,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_ZICFILP,
 	KVM_RISCV_ISA_EXT_ZICFISS,
+	KVM_RISCV_ISA_EXT_ZICCLSM,
+	KVM_RISCV_ISA_EXT_ZICCAMOA,
+	KVM_RISCV_ISA_EXT_ZICCIF,
+	KVM_RISCV_ISA_EXT_ZA64RS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 971f44655100a..72e3dc15d2947 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -38,6 +38,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(SVVPTC),
+	KVM_ISA_EXT_ARR(ZA64RS),
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
@@ -64,6 +65,9 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
+	KVM_ISA_EXT_ARR(ZICCAMOA),
+	KVM_ISA_EXT_ARR(ZICCIF),
+	KVM_ISA_EXT_ARR(ZICCLSM),
 	KVM_ISA_EXT_ARR(ZICCRSE),
 	KVM_ISA_EXT_ARR(ZICFILP),
 	KVM_ISA_EXT_ARR(ZICFISS),
@@ -183,6 +187,7 @@ bool kvm_riscv_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
@@ -206,6 +211,9 @@ bool kvm_riscv_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_RISCV_ISA_EXT_ZICBOP:
+	case KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
-- 
2.55.0

