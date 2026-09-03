Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F189F4D90BF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448980; cv=none; b=hZ0ODriPpkLbXkQxC8E4z1hEfD1G/p/za2KDnvXPD+yWY2ixuCqFk0SKJOKoKSqsHx5JogctDIYHfBwVaL8VjjyplAe+5S5Klq2IcYYY7JFvFAteKs8FEVgRTloiDviYL6yHSAXqoVUXexgR+6wXfCGHPdVOE2u2rD23sWF0TKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448980; c=relaxed/simple;
	bh=SZsy8z2cZeG76r+71RaIHFnik68/q4fXX+FLzL4Ya3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3Ew1Wk6M7YB3N2ZKvKrnYF8d6RuSiA37rm26g75Hu/Ip8hvgMWoGgTVvscNlpHyaEt9j/Mz7hVyl1SnVNfW74MBzjozxbNTop/4w8HXcLc0JV4q2DSV87aFVENzCEW9ZNvm19Y4ltP/nNFqwlCm3FKmVnwi3mWvNvKkTztQcWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PYNQM5we; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PYNQM5we"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4843e9c5960so2459965f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788448977; x=1789053777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cepZHB2x68GEZJ97OWTaw8vbndrjuX+5jdtmw5JVCNE=;
        b=PYNQM5wex+9ZF5fIox+w+R/etzOjM7h7GMpDBBLZlQQCdNMBG74//kaXhH6UPQBIXz
         vOqyDFENhZaSAvdhJv/JR8AA1PQUrWbegZextVv7zSj1q/j7Qba6QoLQblOcFrzjtEcn
         xSxOHA2UYhyuzZMvvQRU3QIa8UlFoLjGzkvHVRZ8HNaqABAr0m8RYzdhpM9+bOrKrPus
         aj/dR4JJ8J9h3+p8Wp19bcyZL8pkADzjUnXAw4t6q8G8cWrnHZChU4luvc8EJpud4sg+
         22orRAJkmF7TGEU2QJP3jqgx1mNAyVMX/oMaGMK0uIfCsMCJsmEjPPM8VIEmNmmFIB5q
         /vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448977; x=1789053777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cepZHB2x68GEZJ97OWTaw8vbndrjuX+5jdtmw5JVCNE=;
        b=D5YVaTdGKpa6wg92aVJs/ZGbHUruXuhGg7wYo7k+GENlOuatekKb5hA2iUMKMT2LkF
         Jp58oK6ouTEkix2UKesyKn6QN/H2pzB6XtpnhSDpQoe65N+Be2RakifHHhxV85jGxbgo
         Bt89Fno+i/nl5jd6nM21n3TfoQAyC817J3+unGuPKaSRjYH+joUgjM2EKFbw8b1tZfh+
         bz6iDGVrhJ6TqYAFfpKFNQAq4MmRjB6vxQNi9HaW9w0sD0T62X/ZzjFIo2kKb6xi9WaR
         Lv991DGWKezudnBbtPIe++dg76d2aCo3z5YEAVJSBlFC62ZJp5UN0zr+ume+fwuzFLki
         ydJg==
X-Gm-Message-State: AFuF++naBOi7gKbf4eq/MAzn8h6InP6+YHTz4uQDr/femEW6PS0GpzWf
	0Lcl7oJEqytID4X8T616J/HtfurTQd2Wt2E5ozvN5q3IA9POwmxq3Ln55FHgU9NbGwAQNnBA4KY
	nGJQ1jAE=
X-Gm-Gg: AYBFou1Ai2prvyMEf08fGqaIe3jgtLtUOa5BoZU2g48YSuXO+kvNYOGHI147ythoWuX
	gP1PnrK1BLA9pfEg5wI0EPOEFfN+ZWbSMIR2NJKTwuaBx9/esOT3bs+2nngsvNFM6kERm9eMGfl
	sfK0BcjgwC9NQXR6deyvPGXVC8b+82z15RzFdBRVKO4uJaa+LlZU51XlfYdHXQ15CCWcNVNnV27
	e/bGCWWkYV94TyVJNtnupxWJty2XSCie5uvPouvmdrzYe5HNDc6yql6owookcPUcv+fx5b4qg2z
	tDBZ6YbjPtg2F/pDkkSrIDn4i9CI8Q0BK4vChhG8t13HSTDxH+GhvH16b8dfMc4DWqVmcnB3+Eb
	DIDXJ3rSGods3iVqM3TfiEhqqryFCusFe2RS9k0KCwbg2QgCvFuEM+W24niLe/0/JVbl+YBQF6Y
	UmZRQ4CW7aqQyJiY1Kt4N02M7uNySoAkFzgBy1FpwsBsZMM3xwY9JGp456+gzoJChuu2fK
X-Received: by 2002:a5d:5749:0:b0:484:410d:c5a with SMTP id ffacd0b85a97d-48586045a0fmr1855479f8f.5.1788448977113;
        Thu, 03 Sep 2026 08:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e13db0sm14648114f8f.0.2026.09.03.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:22:56 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] workqueue: Make WQ_UNBOUND the default behavior
Date: Thu,  3 Sep 2026 17:22:02 +0200
Message-ID: <20260903152204.401638-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently alloc_workqueue() make sure one among WQ_UNBOUND or WQ_PERCPU is
present. This is enforced warning and setting WQ_PERCPU as default when
alloc_workqueue() without WQ_PERCPU or WQ_UNBOUND.

[ P1 ] change this behavior: if no flags are specified, WQ_UNBOUND is
set by default, changing the default behavior when flags are not present.

The WARN_ONCE() when neither flags are present has been removed and it has
been replaced by pr_warn_once(): from now on, every alloc_users()
without WQ_PERCPU will be considered unbound.

Q: I decided to pr_warn_once() just to make sure users are aware of the new
behavior. It makes sense or we can just drop it directly?
I don't think the WARN_ONCE() is appropriate now, for this specific path.

[ P2 ] updates the documentation accordingly.

Thanks!

Marco Crivellari (2):
  workqueue: Make alloc_workqueue() unbound by default
  doc: Update WQ_UNBOUND documentation

 Documentation/core-api/workqueue.rst |  2 ++
 kernel/workqueue.c                   | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.55.0

