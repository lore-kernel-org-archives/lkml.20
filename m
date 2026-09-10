Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19D4A3F34
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051875; cv=none; b=onkIR22L4d1SVuKVuLoiPnd1mka2kZMSuMod2rjGo5AMj891gy3nfwdF/JUJMeUFjVIyfcq48V7yvp6dtFtJ4pySbbxCVhtikbIgCw0F/24IO4BASXBBDGvTkt8ydsf/bITaIKQUOJcBuItEpOgjGLeDyjBI7KT4DsPr5gf4bYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051875; c=relaxed/simple;
	bh=I4eB1+rSh1pIF8vz4CEEf+Z1CRDKXONMcV0Ntu6+sRk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QAK1DMOVHG8FvTdbsVhWMUHieZWB1urQDGZXTLILyn+pAWtBkrKwd+06vmRJ8yRkCV6EPqim4fggY7tpFk+P3IRSbeRnPhJjSAA6HhQXyTd3y50oQWQGLRrGwsqqeqhQbrQIOqYGKavolVr2SPi/YTwuFfVkKSvXO6rZRGQDGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericchancf.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nUCr2Q30; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericchancf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nUCr2Q30"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-869c40637faso701354b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789051870; x=1789656670; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TON9oQUuio6y+v4LacqHOanxJcsWbypgqiH4li5BR50=;
        b=nUCr2Q30fCBGfjU/N48aDWyg6s7U585zEU9FvpztS5moVPjudShIXtQ4yGeMckZYsS
         mcKmH4pETS5p/x4QmfoPBipxV7qJx7vAUqnj6DdL4gPluvaEpwUKZwNBRWHe+O0OJ0j3
         KdfuFKyc1YUQCn7Ni2Jx898efNsuxcW7iVcvWtai66fhUXuWg/fVTfJ2zfqLs0wAMBrU
         AeH/06AJ0qZqW9VEAc2FZmUUsFg8UKQFXbiIgykInQdNxIbmRs6nuLZiU+V8fqMM7xDv
         4rW4SiWSAyVi+/yTtWizf7l7/Rmh+mboAo3di0VS+W90S4EZJTUs+nAB1kEY7oi3CxDw
         mZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051870; x=1789656670;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TON9oQUuio6y+v4LacqHOanxJcsWbypgqiH4li5BR50=;
        b=eoQeAU3B4dJNvfzcLiri+iLa9CpsxQBjA54KPYDIHAplja1Y+lV1wWtYr9AQ22AQZS
         3VW6jwnsRyU1LbF9LIhDxf+9g9G5aHUOqKK/P7TJWWfmx/KNCiQtXdEURRPg5+ficjlm
         X3a4V4fhsu2oKWQlbDVxLKVDdmOmoyWGnfTGvTEHsHRKhwaBz8jhcZsOU+zaKQ+Z0r21
         DL9D6gM1CYkgzMd+rAAu59saM8ocWzImogt6ekdnCRI1Lwjvhyajspks3V3M1GvW4FlO
         fgO2OOxPlelByM6ThPTYJwUCy238ogkND7vlZab5fmseqs3t1quSSYBSthYye/Wbl8av
         pPgw==
X-Forwarded-Encrypted: i=1; AKwUvBwHqNcOlYPzBUSyahwh3hhiIyLhMx7iewQ1MqKUB1Du1ZIrI3UERBQxuboesWrDM4c8vKkLvwbguOSgnjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++liffZbR8ffX883PBVwJBDrZGn7f0BFQXHSTDDvXSOMoLBtPYUt
	feSfs2wp/wQXiufnWybOEZWn74nfJdmuBELV4PYraQy70tgOTAad2QRfA60C+uciqiGA/EOn8Jo
	EiRKVx4e5+AzHbkxFbYRaqg==
X-Received: from pfko10.prod.google.com ([2002:a05:6a00:214a:b0:847:ac08:fdf6])
 (user=ericchancf job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4c82:b0:86a:9be:6bf3 with SMTP id d2e1a72fcca58-86a09be73b2mr5548413b3a.23.1789051870295;
 Thu, 10 Sep 2026 07:51:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:51:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910145107.3640991-1-ericchancf@google.com>
Subject: [PATCH 0/2] coresight: Fix missing AMBA dev_pm_ops and modernize PM ops
From: Eric Chan <ericchancf@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Eric Chan <ericchancf@google.com>
Content-Type: text/plain; charset="UTF-8"

This 2-patch series addresses an issue where CoreSight AMBA drivers (TMC,
CATU, and ETM4x) missed setting their dev_pm_ops during earlier ACPI and
platform driver refactorings, and modernizes runtime PM ops definitions
across these drivers to align with Documentation/power/runtime_pm.rst.

- Patch 1 is a bug fix (marked for stable) that sets the missing .pm
  pointer in the AMBA drivers (tmc_driver, catu_driver, and
  etm4x_amba_driver) so runtime PM suspend and resume callbacks are
  properly invoked when probed via AMBA bus.
- Patch 2 modernizes the runtime PM definitions across TMC, CATU, and
  ETM4x to use DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr(), eliminating
  unnecessary #ifdef CONFIG_PM blocks.

Eric Chan (2):
  coresight: Add missing dev_pm_ops to AMBA drivers
  coresight: Switch to DEFINE_RUNTIME_DEV_PM_OPS()

 drivers/hwtracing/coresight/coresight-catu.c  | 31 +++++++++--------
 .../coresight/coresight-etm4x-core.c          | 30 ++++++++---------
 .../hwtracing/coresight/coresight-tmc-core.c  | 33 +++++++++----------
 3 files changed, 44 insertions(+), 50 deletions(-)

-- 
2.55.0.1003.g10538fe699-goog

