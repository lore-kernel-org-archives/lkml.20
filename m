Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B35D48BD57
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524708; cv=none; b=E7WCAT8xNcmsQKGcDnNPQegqQU69jqRKhX9x7rdLeudfcx6I47z1wTI3uHmR8sBbJ6iq4Vc6HMZaQ0MlF3guRrw0aDxOfAsm278UkrwX+MF249HKQudfm41Oh6WhwZSc3xuCznU34a8chjIbVd0DT3y03wtFYNn5gGwdURLYP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524708; c=relaxed/simple;
	bh=3iUriw5G9tLLdUldFdWduwupBM4ijNn3LE6YBKuKoRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTRvW7ntPlfANfU06Mkut0eKf0Ab/evTTU0eAUVkS41T5MkKZe93wq1O8KUwTGcbfsSzpKXwyMnzrwOftTVhgqMHQp6k/t6m27n5m3g55W6Th3HZH5wj7bZy4AMb7SrC9j+DoAaiUlTl66GIvVamL3er5GQI2BBlJyyF39630D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJn1p3pv; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJn1p3pv"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4f824de5dso416610a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524706; x=1789129506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQohy1k6O8N4/FlPUm0T2gOe7iYaF+RMdNWyiCLqF0I=;
        b=LJn1p3pvHaRLGk4yluy75aAaddWBgFgYofPYYjZT77CzQ1FcgmrismAsn1QsDAnEJn
         TBCaePYo55IYLWXMwuq6s9geWTObimY2FB3y1VJ2or/bFYxb2EDnAaxHSNrKyTt5d3MX
         mTeZ57+YLf19hzZZv7sE5SQ21z6P76p5Yxyf95EBmqT6zI8I05tqre3CDO/9KC7s11RB
         KtlAXZX4nt1LHYH7dyP/5jLMXpiPiWyB6Xdyx/gdT1lV09IjMT/k4JFfd6LghLULWn2W
         Hq1bTz09oubImw4KTMm7ruUCgj2GwAPTT1Qe7EIizyPRAibKbT4pyXjXVIbDOmLjHYOE
         GmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524706; x=1789129506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TQohy1k6O8N4/FlPUm0T2gOe7iYaF+RMdNWyiCLqF0I=;
        b=FZ95wPCDtjJb1LAcmaQZAUC00ltyRnaVAtxLqFhkdsXSld7H7ny4nw0XjLNAVEYdfV
         MUP7VEohQDuK6f624e8e6JpZkKP0EokI9lyg+3tzv60msvj3k3Xsfr2CeBy4iXKJUC5f
         EmuWRcgEO0Ui/8u1MRirqGxERCiji6lQnP9eO2bINJl1m85s6qiakTHuV/VCHsAyot5d
         kzRlW/XFIMneyjj4io3EifycHKBlJIP+trDBB7fa2qP38zocYypdb66zmV053lGeBJ6S
         gBWtgaCWoercsEb8u3BM8LTKY2V0K5I1AeCHT4Sv2O8rTHHDr7ZACpFHJ2IMJZq+WZ31
         qJrg==
X-Gm-Message-State: AFuF++lVmqpE3Rm77dgnddhN8OJgkMDbNhSNjqxfpCc3FBxaox7irjWn
	WD75iuZlpJm78JrTnMoHIBz4cjvf3vixxk1/Ei1ULeQjxaDvCnMoaqTX
X-Gm-Gg: AYBFou0fZ8uenk9mVGL/W85rz0w8z2s2qapSuDCjMgIVP4+YtR2vDa23cC1jbgVjYgd
	p5PUkZCNJl5DsJ3pbnihfzKPnC7KDpwCP4EUtVs9Y3TMPY7xCK0AIk08gRleCh7NGzCNbvedAbW
	oWqBflON0Ii/DNcMWBnCMUHsbw+m+rRc8sLfyEklHiySDxsz9Y4JmRp0zOQeghZrXRfm0RT2hqI
	ItLSWpDlBChyIfIg8I8NYEQPySJnNxTEB/ihjVJKF/4S6t1UDElx+fL7eCrQNIbTbmDmUdfsyai
	zGuRG5NnVP4622HlRyBDe1PIRlOehwKOSnrY+IW1xMEESDEA3Oee8qgaG3rq9JaT/URwQO5w65G
	p6NOKZM2Glw98Kzj4HtHB2zu6VPTwnqnkkZaFYNioKYPkCHg38L7jej1v4tqRncMXMDywowHU3l
	NNwNsCcsA4ubzsjTtFethjiCa/yUBTJoMqr098VCD6i9kllrOPe9ydjBfod/hlQwpB6SmoQtNcw
	8V26Km4o5cMnf4=
X-Received: by 2002:a05:6820:60b:b0:6b7:8396:f3c2 with SMTP id 006d021491bc7-6b78396f7ecmr1517046eaf.36.1788524705780;
        Fri, 04 Sep 2026 05:25:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:25:04 -0700 (PDT)
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
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
Date: Fri,  4 Sep 2026 17:54:42 +0530
Message-ID: <20260904122445.31163-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122445.31163-1-hemanth.selam@gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'is', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/pauth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
index d5eb3ae876be..22ff4b78d0e9 100644
--- a/arch/arm64/kvm/pauth.c
+++ b/arch/arm64/kvm/pauth.c
@@ -5,7 +5,7 @@
  *
  * Primitive PAuth emulation for ERETAA/ERETAB.
  *
- * This code assumes that is is run from EL2, and that it is part of
+ * This code assumes that is run from EL2, and that it is part of
  * the emulation of ERETAx for a guest hypervisor. That's a lot of
  * baked-in assumptions and shortcuts.
  *
-- 
2.48.1

