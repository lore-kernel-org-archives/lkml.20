Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7293B40A93E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341089; cv=none; b=LSOa+/AWBpG5eES+S98B8ffGHJDTsh9IpHZnLxllErB2g95D5KMaFrifUqlfVTwX9XVMgekKh6vMFlIc9OpyKDMEFHnWewHvcfOwSL7earkU3Rqda2UU0tC+InCS1SYrSAFnXClkOFT+GGNVXCA8i4/COo++1FtkwNpZPvN+Ddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341089; c=relaxed/simple;
	bh=htsA+2Ta+xkPsrznDs+1fwd4+8WtuDMyst6whWczVtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3aN0GLtC/TNix4gPUxkaO0yuLg+PU926TLKvAHovf2oC0XxVatXozjkAvMTl5yelwlXqYjAX1MAxxOuaRtTsRAg07628hJERVhdoZ6mWY+TzgI//e+Dn1WHX6c5LaJ8cBhu22rY5U4f3YZJjY/45V/QkCtAtG/KuvUc5yLfOC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=grsJoZu+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="grsJoZu+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso6347175e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341086; x=1788945886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3fqr5+6od1TZCzN+IFHy0hN1GLZqBToHSX78eyTEKo=;
        b=grsJoZu+twxEB/SGEz2UDKSlqmfCYXM2GbDBdo6JEZ/m5W1g5MxNkDBi9C7p0ibJMC
         q0nO4TWsbTWIvH1KIfiUAZ93NecQxVq6YNBhBFMCyGWCRNYjZc2eNagZCSvxkh1aVpN+
         W/o1iRbY8ppWMo4N0e35e4xmBREaarB2oJOx01PWPkYxQjlAVBedYCx3bszm6PPoeYpW
         5vxtTKpFmOxTYz9KtG5RjC9SO2hbbI1/DYvcevgb/X/9UtaRboSm6AefZts/bhXioBKM
         0kQLGgAArSkyWMHCZzCvcI/aVBr1XfWllMVrQr//1HKm7nBlsYofBFNmj3B5XE5NoPcT
         MLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341086; x=1788945886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3fqr5+6od1TZCzN+IFHy0hN1GLZqBToHSX78eyTEKo=;
        b=UGu12YYFpGTm3EYS+b5QDsU+dOE6SefbQA9JfWGQ8PRslcJmI3F7Jij9oMnKvV5k8E
         IskHtg6t7qYQo9qDha0pBONSWonE3lx9smTC24U3tqvj3eQor5AZjVuO+Hwh3i1dUCxr
         OFyP1j87+fw3Zr9mVbIZ79cFiuFXjxAejiowSJGDxqWd2qmcKWf8w4hyzS7DAY32+Irn
         bSN23Od9oL7W4HzUKGdoNvr+X7EkyjJOHRdhOHOWYK/rdpu5UB0K3l42dupdtQ09CcH0
         w2yP1w+R7EaUvc8ThhbDCJO91/ZOuckJjJSB209xeqzfJ1WoGPBTsEg5ZPpXHMWf2StI
         fUvA==
X-Gm-Message-State: AFuF++kGc+zwRAFcJFYDIepiMfGSFMYjHytgaHvGDWZzXlZH9TJYNL4B
	FCnG0k9GJZXgWb1QlKwZIrJkilDbUpbs298nnXLZDRpgKdxU37UW2vSujXJTyDcTmCzqRvrOZNg
	xkk0Yr9w=
X-Gm-Gg: AR+sD12ptUPbmsFBTEW74AMgp8RtkwmlnubzpXrZRZlJSxOWS+eEeL5KOSIUVbRYwkJ
	Etagli3AHQ4qg7A4e4NtJ0PGcxz0qDKdA9qRvq8hIix0BcpXG6+b5g2G8g6k36qb0ec752M1HNG
	PLHKlvyoUaYL5pk1IDzaakifKUatn0dJkqsbssax9NFV6kOuWWbCSDkJV4lQiXtYz7htA+4TiOv
	Kmjt9JNel/bq9WfVhk/Xp+1KjMJ0t/RC46Drti8cD+HJzXIlH+uTgf7zHGOS5LJ1ACdFvbFSUsK
	UTF9j5BvEnFpTs5MfqadLP8g+EUfnnVIw3ZOx+lvZCjx1Yp/PA61y1eglgp9G7bH4ob+gkMpmPt
	BjAzjqsedN0SMgBGBcl0Jqt1bmrlDEyLbizl9g/qkGDMCC79W62I95z2IXEPVcUdbIasJoaxtvw
	Ns3vnxq9H8kmfn9pLvmATjRqB+J4+mAaQlIRhJ6mvaA1RHEPhpSGPwLMb0TfWOhR9LAlwKmiSFY
	YUDGgLOCLs=
X-Received: by 2002:a05:600c:4e4a:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49ce55ecde6mr60360315e9.1.1788341085661;
        Wed, 02 Sep 2026 02:24:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46422desm52404145e9.1.2026.09.02.02.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:24:45 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v3 1/2] doc: Change dynticks-testing repository name
Date: Wed,  2 Sep 2026 11:24:24 +0200
Message-ID: <20260902092434.85096-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902092434.85096-1-marco.crivellari@suse.com>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see Link tag below), so fix the occurrence and
the URL.

Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/admin-guide/cpu-isolation.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
index 8c65d03fd28c..b9f13a928673 100644
--- a/Documentation/admin-guide/cpu-isolation.rst
+++ b/Documentation/admin-guide/cpu-isolation.rst
@@ -353,5 +353,5 @@ Some tools may also be useful for higher level analysis:
   latency and noise in the system. For example Documentation/tools/rtla/rtla-osnoise.rst
   runs a kernel tracer that analyzes and output a summary of the noises.
 
-- dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
-  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+- cpunoise does something similar to rtla-osnoise but in userspace. It is available
+  at https://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
-- 
2.55.0

