Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F874BF924
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017787; cv=none; b=eTNy9PLKrY1wCZyPTbkmJPHBjAyykAy0f3n125sdQYVN0SOjfQMv8WBQ5slrprAT6ePu0tsRufUBfDIaBgaO5ohusuu4hg/BVZIsP4RSzETf/l3TYBjPFWgBbkOuo9nZVzhCgt6qCbaNyvn27CBvvpQAdB1OjASNhevz1DxVBn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017787; c=relaxed/simple;
	bh=6QMveXXpEj5QdPkVXKozi90KLuYOCVhf9Jhu27z3Jvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lf/t0PkQwWBmQorvhsZ2uhSOjvxJka/biFev1sMPzKXh6Q4dtFsUuy4etvTduMOAGFJIqltAxgYHGJAnj/P2Baazw/S3uDBTEmVSbNiGzgE4D5JnHm4LxxoDV4VQxeOzxEaclvPxEdBD+97LeHiA2KC/09krf0oHDFKiTSb7Nis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=FsyQyuYO; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="FsyQyuYO"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0667040276
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017776;
	bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=FsyQyuYOUONJp/2rlriXx/UMmB5To269mupZAhVKDQ0v+77/jNw7d+wl9RD0FOyK/
	 g4j+U2pR6IR3u4gKqQRRtd5MLbct22J5n7aQ9ZhG1Mn4vEuL45/nxXLOQrrSwVNH3J
	 LceGO9aLiMmvpqICnzmiZ8FKoRJoBbBDqQjayyNUCfx8zEUeuIaO7lSU24XliMuHNw
	 2vTACYVsVUQt4FISzBYXlUvW1AZ2MV19FaygNEfKdZSrnRNoqED0ebxExo/xsH2+Wc
	 d070OUBfOtJJAb0ghQ2s16b25xKTcKQOoRu/gX1nAJJvK6Tyhob9QyfYufdMEe8iDK
	 8MKM7I4+gItFe8xQyr9sYChgpOIm7ZZfcWxjPFe1nbbUU3DPOvbg8JjkOODlTkF6DO
	 pqbJ8fswtxKJ3+XkjkVw3S71b8wEUgtQrOWyF5qeDWzVoFV0ZM7jhuGIZw8+XOkN5Y
	 3E0fyCOj2khgc5m6MJBD5t7xY21uEN+9vxGkTTvIFFY2Q/VZAhwWDm7qvCLGf1ogoM
	 IICR+8VQoSokwWTr2plID4Uk/ir4ulobQAYX8P+PW4Q+z8kj4J2oLQ/UHrjerKYY9V
	 SDr8/sG2+QzFKZuQ9xDiMoIvPllcNWVom3Kt9JN3WjpDwMilEowHrps61LAHw4+hO2
	 MXWG9I6IiVy8V6+vnEC2dPo4=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so10929235e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017775; x=1792622575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
        b=iaOmcX9IwwmAhhpMzDb/dh5UhpO/NLXAvBGSnEzEnCiPqgrrLaX2DhRu3++cjZ+gho
         FPNO4mB6/uylcFtbJeEPGbV4Gl3cW9QYOGCCtuaJg79SJ+mCaz083XWavLPfhHkCriKp
         MUeNT6vfqOb2gxea7wxTC6J1lfaTtHoVhCkeQr342eC0vnyweaUWgWS2JFfjCjWTyxDg
         7+m6I+lMbBoybP7ru5/PD23LepScUlt7f5LnU7FhtG9rVbpi6nhn/2PTMxSDBsUJiUHK
         HXZIgIqynJxB1hHr0tzCE/WS/swvRO+HGxYDU9lh3PTOWrt9CpnFxIHGQ7F4UE8yQrXB
         e7EA==
X-Forwarded-Encrypted: i=1; AKwUvBw675GL4DThj2b0AM62bsX4C3UNp8dW2enXr1k1JIFNb0VflnK1T/c0OmFmg5nbj+m+pVcgz7R0CFUDv50=@vger.kernel.org
X-Gm-Message-State: AFq9FYIacxaYjrwqd4/0xwZ6n78ininop9vcAEISwjf563q0TFE6JskG
	xC5rLPofkJx2p6i+ZvC6ht7+3MFZ6xxVtnVNsuz6HV9o+dAx72sCJ39tW4iinY7Vq/UHEdd38XJ
	prtJL2Bkk0Y5O+dyG7CgEFbHpqtGOq5Y7Y4Nvf+T64kVeECYJ+fL5nFqLo0O3PCrIafNO7udKMO
	S09a9ocg==
X-Gm-Gg: AYBFou1ovBhJGpOZ0aBtOxa+eb0dFI9QZI44mXZQewE3MjHFgHL3m4rq+6xqa2haudB
	9867ru0OP47IxEktm93UJQMyshliak8K5Xp/uU/euWhBm/niRbqj+u43VaVq3DdPkh7L/N/mPjC
	9pknpervk3eNh2PRdaWLfEXJ6gJXuSzXjG0ANac96MYOD2tzBY6/PAbG8fao7ktaUI5eVRio/3U
	x/0WduALnWV+uc6ebSKne4mywK54WUMTQMBCwWsaYrKwLbt7H+IS9u4N5fm4Hdr4xPwH7zKbOEu
	ScoRZu5G/yaHACVKxWMD7QFFMwUk18izndG1zBAwr2OESE/98fBFrlUYIk8GCKqN+2DtbnzfMZG
	TRUXG4i9PLmfTRziXLwUCz85AqS12Lweanm7LXQcJVxSUicq0zVQ7hE2X
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760815e9.6.1792017775547;
        Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760415e9.6.1792017774558;
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
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
Subject: [PATCH 2/2] KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs
Date: Thu, 15 Oct 2026 00:42:39 +0200
Message-ID: <20261014224239.963635-3-heinrich.schuchardt@canonical.com>
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

KVM supports extensions Zicclsm, Ziccamoa, Ziccif, Za64rs for the guest.
Add these extensions to the get-reg-list test.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index bf3980e9db127..71e5969142b30 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -63,6 +63,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
@@ -89,6 +90,9 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
@@ -576,6 +580,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(SVVPTC),
+		KVM_ISA_EXT_ARR(ZA64RS),
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
@@ -602,6 +607,9 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
+		KVM_ISA_EXT_ARR(ZICCAMOA),
+		KVM_ISA_EXT_ARR(ZICCIF),
+		KVM_ISA_EXT_ARR(ZICCLSM),
 		KVM_ISA_EXT_ARR(ZICCRSE),
 		KVM_ISA_EXT_ARR(ZICFILP),
 		KVM_ISA_EXT_ARR(ZICFISS),
@@ -1238,6 +1246,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(za64rs, ZA64RS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
@@ -1264,6 +1273,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccamoa, ZICCAMOA);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccif, ZICCIF);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicclsm, ZICCLSM);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
@@ -1372,6 +1384,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svnapot,
 	&config_svpbmt,
 	&config_svvptc,
+	&config_za64rs,
 	&config_zaamo,
 	&config_zabha,
 	&config_zacas,
@@ -1398,6 +1411,9 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbom,
 	&config_zicbop,
 	&config_zicboz,
+	&config_ziccamoa,
+	&config_ziccif,
+	&config_zicclsm,
 	&config_ziccrse,
 	&config_zicfilp,
 	&config_zicfiss,
-- 
2.55.0

