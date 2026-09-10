Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5C3939BC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073587; cv=none; b=GzSvi07PB/zUFGxZKnI1XLObRXsv4vIoVxXp+uq5xjLGqhjZSPt4/PvkKyU4ZKD//HuA1/LPfYQHN1muc6H/SaxF8Kc5/ADLKCTP+sOwVlznNMPApQRv6618MHatSKZhK+VUatUyg5nOzihvxZP5+8IUIxlsSpHgvVlx29PsO5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073587; c=relaxed/simple;
	bh=4mRR/lct3JxUI7us99LWGMyA0AfdcUxcoiGG5tWdAAw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tIyzAi+nhIXHw+0D64JQVcOxjw82+sLB7jySxQctWnSQqEJjPtuTqYKrSWPSg2JnbfEr1tnhp6BjpPEnL7qeJ1Va1fvGsgug60cmm2gyoMP5V6tMmHDx/9vpSpdwnb3njZC+O5cmoWFH8pjXGeYnT7NPD2CcKswnhUL5PICiW/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bu9KASFl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu9KASFl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1509655e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073583; x=1789678383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mCkJNb+QrKnJKj/QcqFSE5iIzRjiFJzvF62FVz0jZM=;
        b=bu9KASFlGGGxmRLJbDyzgrVwnhC3NefLPjdz491XeLiDdncfYVBpbv4Rk4DcSD3+9Z
         k0QpusZHCNPCKxDG36xpp+eboSutpa1iMbygSjDwnJofkE1uIUZA3G4UvZwKx12P48Lo
         SRbOgio03zdVGZ74m+y0gBzwv9vpUx4BchJjM/8CkdgRh0eZJeaXU8V4cbz0tKyaWeHR
         bCv35twcpJTbkI4akALS1DvXSVOAHZfpmU0xhAlvPfGYhdPuxtiUYFQw42cdPSIVjJtu
         wcpkHSNuUJ1Ks/qrBHpoFj7Z76Ric92vRZ7YQMMVluMI+Kjpr+MP0YxU5UFv6rYD4kI7
         sLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073583; x=1789678383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mCkJNb+QrKnJKj/QcqFSE5iIzRjiFJzvF62FVz0jZM=;
        b=Q9R26gNePIk98RcCVOy6EZsXdaKWRbX3JbLctceGCFIsx3A5p1pxuPFYx5dC3UMNRT
         wfmLxNOpO8c/YcqoynCNltmAFZmzEOCLcKcPHwFfMplvYfpwhObTFPLIhv2rxG98gNsq
         tn+mWLTD7C4iE/8+8bNaEjXbxv43QUQiMkuiWaAVyDhIamR29aG8l+Zro005XchajMMf
         DfmasNeIIKQEpaTfIgH6EUgYZWLK9bLorJ30Jjb5lQOcoUuJWpjko28BdbFn+P5BPjLe
         POSo2KnWCi/jlbJ3AfkSI7Bg4MN2WIobZ7geRNz7oYoxrJtpIVIBKIM/8xPqLopvLmtR
         OL8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1E/o1rvVlkJ5l1x8hKlEq7m8frmF842dhEIfYMVaV25jrgy4xr34CV1Cq1oe2JiVRwv956XQKlnLBIJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lvafQaGniA10XgFeNXB6OuqJigdJIZXza8UzAtz6Rl0iJYNbE8
	zaTabUeUNj7F8Blp13HNCjKiK35THaSAfq554CS0K9mGPpTHU6zVfAbN
X-Gm-Gg: AYBFou0OVpWEkp32HiqveFfAkevxC/jPcQXoRRM6LJrKXcRliLwaIUNbpPgI9hA8j/d
	4lvfJcXr2jszmI997XTP9d8lpv9Bj/NSGTJo7dDPWcuH8JtjEWi9DtSkPKWpHD2BaU1xiC4veZD
	HdVC1EmbDuDMPAm2fyImBf22adD/9EwaiMR0JwSr3T5gQRhV8oEUkreKvnBxRx8IpWYtK6+aMM3
	BnsAOzauZSkgunGOUTm47ZeoHJ3chAblvGcVBzzF+Yx4W+SqZtcjGNkAugE956zSew+hdKZhzky
	bPteICW4N4o3vm2suJ9/qaajW6vyyXXeHYzhZdS1jWxKACztB0KEgm4CftOSxEGoslqWxON6H8M
	sDv/gUGt/EQzdk+3v56H1SKDJYjA/n0Y49AHLd/uTwONt9K1MlOLGKHo7fE/T+nzyGExwBuskqe
	/J/iwMLIIPQ553Ed9wwCDYufFDIyB3TymCvjrIUuzz5udTNtmp0J0Z1IyzCCJCvNPCl6V/UouHy
	qRs7qZtWdHdyahxUAkim7/VkyySEhg6Lt1ZvAZ9k5NS391iZfWEVYNqYGKi0e6HtEtN7mqsrarD
	8bBx2u/OmzGUw1UoRwnC9UMLUWfYqtAAKPTfXTIq4o5XXpj+569P4IqjAEma25lwjqw99EsI2Z5
	LTTxhvVLfeDwRua7V9Ky2tQ==
X-Received: by 2002:a05:600c:a0b:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49e618863bcmr18595615e9.4.1789073583171;
        Thu, 10 Sep 2026 13:53:03 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b3d9-b901-601c-58ef-b3f5-74f5.310.pool.telefonica.de. [2a02:3100:b3d9:b901:601c:58ef:b3f5:74f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm77237325e9.13.2026.09.10.13.53.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 13:53:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] PM: EM: allocate the cpumask for every perf domain
Date: Thu, 10 Sep 2026 22:52:34 +0200
Message-Id: <20260910205234.5392-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em_create_pd() allocates space for the trailing cpus[] flexible array
only for CPU devices.  A performance domain registered for another
device therefore has no storage for its cpumask.

All performance domains are added to em_pd_list.  The netlink interface
does not distinguish CPU and non-CPU domains when it calls
cpumask_weight() or iterates over pd->cpus.  A request for a non-CPU
domain reads cpumask_size() bytes beyond the allocation and can report
bits from the following memory as CPU attributes.

KASAN reports slab-out-of-bounds reads for both dump and by-ID requests
against a synthetic non-CPU performance domain.

GET_PERF_DOMAINS does not require GENL_ADMIN_PERM, so an unprivileged
request can reach this path when a GPU or another devfreq device has
registered an energy model.

Allocate the cpumask for non-CPU domains too.  The zeroed mask remains
empty, as required for the documented unused field.

Fixes: d8eef0453132 ("PM: EM: Implement em_nl_get_pds_doit()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/power/energy_model.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index e610cf8e9a06..fd07c564c201 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -439,7 +439,9 @@ static int em_create_pd(struct device *dev, int nr_states,
 
 		cpumask_copy(em_span_cpus(pd), cpus);
 	} else {
-		pd = kzalloc_obj(*pd);
+		/* Readers expect pd->cpus to exist and remain empty. */
+		pd = kzalloc_flex(*pd, cpus,
+				  BITS_TO_LONGS(large_cpumask_bits));
 		if (!pd)
 			return -ENOMEM;
 	}
-- 
2.53.0

