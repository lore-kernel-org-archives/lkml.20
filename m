Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571841D4F1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378498; cv=none; b=fMyaJTiTD8cpTaJkchH68QShL9nGzohUxt2EmEzk+/E3sXuNc89ttjWjBe1dVqbJoyEWe7rwYed8ntnOHCyia5cKPrdbd1Q05Qcah8o9buLsoKXskRK3Wz+9CX34/Mtl+/nS8A6Zt9kFkE0zMglUR0U9SPLAtWtpUDVaBnufQPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378498; c=relaxed/simple;
	bh=JFMGR3cxE4ehfOWdnWdPRDKltW26+/+24XyQ31ipOHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPivdTRYzE1sOHFRKXT/ZVpj5oqHD+hUVS2Ke1BlbTGbFzVrkzktd8rySa/64ZvpBWjjPt6UZqSvFJInPrptXUpgz64C2XIfF1vYz0wEVMnJlavtW2eRb0ZOi3V/TJXoBLvHchcwrbMYzYkctmEcyzaLIKd+qF5rVhIajWe41dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arwYoqiT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arwYoqiT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so22737825ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378497; x=1789983297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1sLm0cRCwoEOt+wRLHqXO/oJXjLUglwx1i1oC6fe9Yg=;
        b=arwYoqiTleIbbj4hK4RJGjINaHIFkxS3CAYZEQkHLuJEztYH81WLW2y0aHfJlRnwMH
         SrPBC3tCJCq6LqU8P7fRZsRTmZrntkW3XMvi427OrbpCRmyhnt5oVZRfwPzcFQ85cS5d
         mupVqv2/h0bGbGu0ELJxtnOT0xBm6pFE9DUo5GbXSSR9FQfJN1WTdAW4apAsvJJ1lM+I
         HB+nUwU1xScHyynsDhYUZ5teaYCYvz/iEj9onBqwe6QIDEtT+RG19AIGWa078+QlEQgj
         Ej9Sd497IbFpzaPrHg2fE3hps5CPvClic+c462aj28CaJ2x7Xz8aVDwdjN5i5WtwL88C
         g0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378497; x=1789983297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sLm0cRCwoEOt+wRLHqXO/oJXjLUglwx1i1oC6fe9Yg=;
        b=JZDwcUAJlafZqSyocR+KtWl7rsWxvUYndIK5nLZXEwyLnlXjA8/BIVXqHiDHaVXKKe
         OdjgQ52A8aJnTp7KnvLxhe0TjgKCHsJH4k5Uuekp3f6bUpbCCRv2ExigaQ+AjTy87NK2
         DZM4rduMM7um6jv3/ImqcDWk4GNK3ZrXnTAtvOaYtwifLEQmz4MzbVXeaKUG0nhkMdUO
         B10NehEdeoZOp7Cj5sqke81t5OXv/DgZMyxwPTNNBKFEJZ8W+RCvlT4Tt54MHkBcYRwb
         Te+F2eRM86Az9kVRCAyCRokf9WVcVstN/J9EW+Kn6DKjzh7Ia7OwVoNdltiGn/b0uZAl
         Xl0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy35kRdVgzyJBSoZdJwO62VO0gsUX5JYsyCGIjRGc5Wwv8cHFdsP8kql2LvnJNsl4vVzQ368yjcFwV+Zno=@vger.kernel.org
X-Gm-Message-State: AFuF++kYOWNwp84OWJziLor6Zkse2gJoBWJ7IN1e8A2oOoFRuzswkabF
	B6QwfGCksRhx91vCs1ikcmV3f78mRUkQnnUXg023PkwYgGF8ihb1Yesc
X-Gm-Gg: AYBFou0v3DYDG7nqQIv4nybJIyQ7+9udxTGplZIPqsltdO1oAzKgEBjx4zELxKe3tYa
	3ThqEFjZRqGQyVpNgJFu0EicKLn+2XidUwsOKp1vJqlRjyHvvdCdAniSxUCMRpOSuzrtMewnziD
	xbS7lncFE+u34DIku8kqV9lVceIAPBM6uP33/ai/yz40cjk0shHSyqZExkPz1p4HGsNH2sFmx89
	fyZFjvA6gPE15lXEl3eXSimEJ+y2A5OX8n95fugXsxoxAPU0Nq7R6jj/2IXXO1PIzJwP4x+d+/k
	XF3H9CQOnGSOAdpKreRzdLTYDcI9kgHzW2NCFXF5yK1j7n/50tnrC7BGuMGKW70HSRCQ2zjv1Lc
	TAS1DhQpRpK6KMZHiUCzTpXsRIc9l0aOsbh+bI6a8ODUYa+spFRAM09HLQkMnTWJCXp2frRDc9p
	ckhjlfpGM6QZkPTJtX5iAXsK9ASvRVDYJpAa4prtTYSerK9vplePXfKfycftdizOuQH8+5oFYRw
	S4EfEQR+HWTauYstg==
X-Received: by 2002:a17:902:f786:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd5f1bc196mr71500385ad.20.1789378496559;
        Mon, 14 Sep 2026 02:34:56 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm46109865ad.48.2026.09.14.02.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:34:56 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org
Cc: josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>
Subject: [PATCH 2/5] selftests/rcutorture: Wire atomic SRCU into srcu_lockdep.sh
Date: Mon, 14 Sep 2026 17:34:16 +0800
Message-ID: <20260914093419.1474829-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914093419.1474829-1-kunwu.chan@gmail.com>
References: <20260914093419.1474829-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add testtypes 4 (atomic SRCU same-type deadlock) and 5 (atomic SRCU
+ raw_spinlock dependency cycle) to the deadlock-detection loop.
Add a separate loop for testtype 6 (rcu_read_lock() →
synchronize_srcu_atomic()), which also verifies via console.log that
no lockdep warning is triggered.

Co-developed-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/bin/srcu_lockdep.sh  | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh b/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
index 4e98c697def4..72791499dd96 100755
--- a/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
+++ b/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
@@ -44,7 +44,7 @@ nerrs=0
 # Test lockdep's handling of deadlocks.
 for d in 0 1
 do
-	for t in 0 1 2
+	for t in 0 1 2 4 5
 	do
 		for c in 1 2 3
 		do
@@ -79,6 +79,43 @@ do
 	done
 done
 
+# Verify that synchronize_srcu_atomic() does not trigger lockdep
+# warnings when called inside rcu_read_lock().
+for c in 1 2 3
+do
+	err=
+	val=$((6*10+c))
+	tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5s \
+		--configs "SRCU-P" \
+		--kconfig "CONFIG_FORCE_NEED_SRCU_NMI_SAFE=y" \
+		--bootargs "rcutorture.test_srcu_lockdep=$val" \
+		--trust-make --datestamp "$ds/$val" > "$T/kvm.sh.out" 2>&1
+	ret=$?
+	mv "$T/kvm.sh.out" "$RCUTORTURE/res/$ds/$val"
+	if ! grep -q '^CONFIG_PROVE_LOCKING=y' .config
+	then
+		echo "rcu_torture_init_srcu_lockdep:Error: CONFIG_PROVE_LOCKING" \
+				"disabled in rcutorture SRCU-P scenario"
+		err=1
+	fi
+	if test "$ret" -ne 0
+	then
+		err=1
+		echo -n Unexpected failure for > "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+	elif grep -qE "WARNING: possible (recursive locking|circular locking dependency)" \
+		"$RCUTORTURE/res/$ds/$val/SRCU-P/console.log"
+	then
+		err=1
+		echo -n Unexpected lockdep warning for > "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+	fi
+	if test -n "$err"
+	then
+		grep "rcu_torture_init_srcu_lockdep: test_srcu_lockdep = " "$RCUTORTURE/res/$ds/$val/SRCU-P/console.log" | sed -e 's/^.*rcu_torture_init_srcu_lockdep://' >> "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+		cat "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+		nerrs=$((nerrs+1))
+	fi
+done
+
 # Test lockdep-enabled testing of mixed SRCU readers.
 for val in 0x1 0xf
 do
-- 
2.43.0

