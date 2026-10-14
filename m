Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03651B16B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984586; cv=none; b=TKjfFn3eW0wIhsZtGgWGidoIwZcpdRku+228C13jwoKqP1/xR7Bnqu7pr2fYmrrX9nN6NlgV+LWffTMQarrYsI6u7cUYzwvFnCoeagZXv8L83D1ro+KmgWz3U94RSVy1MEgi3HBRd1EMtWEMgVY5f64xQYKu8eSwPjGpCPiOM3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984586; c=relaxed/simple;
	bh=dQnvpEKOveIwTm5EZK7Q2QjYW/YrWtpXDuMclXIxL9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PC7AzJ8dkHviLTLuLAHLdMzjZ1ZOiBro2P8CF9V6cLu4BnrsKWaAoaCIEL76nF+C69WhcbHXCyWcHji8LkW9eDJcKlwhevyVmwmsQrVFI+566BDF48jIHgTvxkMfB7FmFXXGtsiu1qnkmN1r4oEo1QEpdLTFVbK8pb+Cardv+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VM2Lx57C; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VM2Lx57C"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b0168fafso1361355e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791984579; x=1792589379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYIhOn+cGrMspJEUyo3sn++XvdYI5du962o3OPpejnQ=;
        b=VM2Lx57CWMs5QPmTvRC3x/xyf4aGeyBzRjlDAHfNWJtZ3OUzRkL8SCIjFGqtziS2ha
         85x7vKCxDuWSd70ydgNs4+0iwWS4jrUpOgNMRe80z4leANCAcltq/7rRszOtAfN1nmUj
         Cfkieycyn/BOdJL/YrTMGfBQx+BffpL15TruVEhtYFMyIjZdcbvr/U8kNmK6JrkQHUeR
         9GNFTucgvcZP0mP82UkjxX+XLygvMYvCDXGhMcHWHUN5W91hcb3XqRYAWn7VqA/d1ggJ
         C0bjz9v8w2r0yZUWGVisiCXZMTfMZy+wpMzwJ8UEyrUhNllgu7R8cWlYAhiXoqfY5oMd
         v9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984579; x=1792589379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYIhOn+cGrMspJEUyo3sn++XvdYI5du962o3OPpejnQ=;
        b=K76MPl1gNn14n61NosmxV7OaSssjPXLxs84zJfvlsY64DAITYrQFqEY4OEq6byX1qQ
         0CkmdDEcwQZCywzahhRs1hQdpKlEq76r2mQq/mlieFdnQryFhRSOhqisxRG7XguaGQb4
         aUtxtZg0YhwFovhml3Lna1ksns8/587PYPoMaUx3l4kSi8wUC8RLhYN+HEfjWSScH3ze
         r3HtzG8lpB7khSrYySfddFuc/doxIPfV3oCLccc84phjAUqi59ytVDkgTy3qyrRMb2JT
         iRIUzXtAfeKqpFi46yPuWnbetD8JBj4Znjzy9c+NZQ1sbeyt8fp4T3RZ2TNcJSfcxHoe
         pgdQ==
X-Gm-Message-State: AFq9FYI36d7QqErMfJ0fKzZ2OzBd2W+PKvwCHHQ9KzE6/WYIt34Ocl8B
	Fvz7+6B28pbv5TtPHH08ozAETPOprVbdyQTyJBNAjgxLsU3zBor2bio7T89JTF7/bo4=
X-Gm-Gg: AYBFou1kEPUaLzvJ+hHHD9AKeF8aqLcK39Q63kaRmy0CYGwGl5pULCHfooCeCih+F6v
	IZRXUtKTRXYjvwqXGLdtO9D5yjcpvxIwCJtMUagOLDHLeQL6g1Hq+PtPjQ2Zcj/vA5255G/mu1f
	gYkOh5KtODv+QA+fpZp86nQGh2qpiWqvpio5nrJEcDHK2JytWhCpzTRVgf6yd5s3BOfbvje5hmq
	LHjmZguy0dcQPaFzxfvsSXMywAFqQbe8w2xuSmVuLkn4JbjNoXcISvH0uTS2zzXI7k2EVFQkRBy
	RkPS6yQy5gef6hzn6QgsZgr1l6HlIfWZjq5Ce4JEjGThZ9yUH4ExgniWnH8uoeTkUFK3txUC2nu
	30C7ZYr8tbpxGKaRVtaUYgC5Ghqnod3jSNRl5GUw6MyN6EBTosjemrKElZP+8xpXNqSJItNEwm4
	SZeXpI4hkj6sSbL2EIz66Wuj0TPnaUv2srSWTd78pXvQ0Nke3lQlW4eJzgAtF6bhrvsWU=
X-Received: by 2002:a05:600c:1e0f:b0:4a1:8469:e6c8 with SMTP id 5b1f17b1804b1-4a18e46f48fmr318685435e9.1.1791984579509;
        Wed, 14 Oct 2026 06:29:39 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf24b62sm1675055e9.6.2026.10.14.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:29:39 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 0/3] x86/tsc: Remove some magic constants
Date: Wed, 14 Oct 2026 15:29:29 +0200
Message-ID: <20261014132932.1495303-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TSC code is full of various magic constants, making it difficult to
understand the calculations. This patch series tries to document their
actual meaning.

No functional change intended, but the code is not bit-for-bit
identical; some 32-bit multiplications are converted into 64-bit
multiplications, because HZ_PER_KHZ is an unsigned long. If anything,
this should reduce the risk of arithmetic overflow.

Changes from v1:
- Use TICK_NSEC instead of (NSEC_PER_SEC / HZ)
- Use HZ_PER_KHZ and KHZ_PER_MHZ from <linux/units.h>

Petr Tesarik (3):
  x86/tsc: Replace magic constants with xxx_PER_SEC
  x86/tsc: Use HZ_PER_KHZ and KHZ_PER_MHZ
  x86/tsc: Use TSC_CALIBRATE_MULT for the TSC multiplier

 arch/x86/kernel/tsc.c | 54 +++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.55.0

