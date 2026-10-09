Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17864A5ED4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540317; cv=none; b=A81oKpxnCO8usWIP0vabqvOKDTdlV7Xh6hfQQ30XPXto1WdFCM4Qco9p6y6E6vxgn+u/o+E1Bjm26pu98cMuTpezVpXsGpozIDmhbEWc69olF+huB8t1BOLJRGsnCBVv8VI4UT2OfRmpOs0gpvF9qxEiRkp5MEzMPvvow9nGXkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540317; c=relaxed/simple;
	bh=t/qn5EWP3h5HmfwGsBu8vBM5AbNGN6sobF5KvlGA+SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSDajwR1K9j21h1GZM6Px2uefMtyfXyyYT1DapfmtZl8jY7a4KH2fpZY/wrW/EmGwc0h9u+BctsKfodGb9h1OnMo4dkABFEo1b/JDWbeZRGnKF7CmghtNCyc4xwy3bPbOeqCfz9w72EPfWbad+9fGj8iFJeyHUx/8mmf/OouAuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZNaaP6qm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZNaaP6qm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf1f90so1412355e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791540306; x=1792145106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJVeo/rp6gNIVvvbzU9iPq1p9QXhq47cINvC1fs/rt0=;
        b=ZNaaP6qmdcTB/bansBnKJS4bUWHSBmEej6oF8ui/NtdhXnP0sh9mWaLPASwNu+XW6z
         AWA/UT+9uXAu1e7M9iHmvDcZSxU+HwFQV3ybTB3UsC3Zu4sSMAs77Ff9x5CqawOkYOea
         jUGRmd9Z9u1bJ6aL/FfT0q1pjjlWPDs6o30F3hIkGXr5mKR4y0tpqHd0ujzF86IKyoNL
         7mOy+dCgRThL00KutMY5dak6CEBEb/hvwvybmNLi2qwZCSW539I5ikPM1TX9oImk87yi
         m1KsC6roNcyh3liOILdYNWfQ6ejgca+E03Td2AQ4IS1V1/wvSgjT6hLvzlM7sorEBxpA
         XWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540306; x=1792145106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJVeo/rp6gNIVvvbzU9iPq1p9QXhq47cINvC1fs/rt0=;
        b=CZ0aXXUaFjZXdqpLQH2fT/FY3D0f0nf1b4MGaEeoCkwGeY4NuYp/TkS4FTnKg7kXTz
         AAn+nCcyFqQVGOAjUOVoprbIX+FglnJtg4kIpgaKY1kB1ZZaHqrVx1wlSbgfhpe7jQmm
         xMhW1aQNIhP97DMZaiTrwgCg0jZk/ieM5REgX8d+lvRnc1o6nC/69DQTGXre8dslM5z6
         4SbBTWHrcikb+2va6Smd25+dSoQC7Hckn2rNY2QIb9tHAP/hWaZ98sAeY1LtnTKmb2lO
         1z+M7h6Sy8L0q/VuC8kFQiLYjxHzVHrqVyJ7gwx9bYEc7zlAkSd60+Pd31zkTJSEvvMy
         A0LA==
X-Gm-Message-State: AFq9FYLH/JKYXMk79p2x8OxOKZTgLfcuu5spKYoeuMXFD04WdavxIZzt
	U2DVZSFTrJ6IOYV31VJtoHv009UKtz0ui3l2NzOs1iuYv80OSv03eHNBi8RRZrnCtJc=
X-Gm-Gg: AYBFou2Q3u9Fm0VsmlMqE2TL6GmtwUb1Mwta4ffyiv4xA6H73gB72JsG+PsN07ZZOza
	9HOKIOQ62EveWH36hMa49H88p84Y/lBs9+5ShMdzp+Ig7HR9mAIkPHMDECj/x5L7YalPy08rMN/
	7K2fU40IyedkuKpXqS1T84cAbD8CskOsJwZC2gjgBCejZjsuybOoSMHTDfYK2uWQrZSWszjUlHA
	8GhPFdTHmS3k99Dou6cw4v73dHGyrpxNUr/h6IUVG1xa/1alRke4FWDMoSGbYZPXdOIVzG77BV/
	GROaQ7zxievz17M2dXSlZRCyCgku6FuY/tFyliWXG9svLlT2l+ahpYPcQ+fpngfy7zhIJpL5ohr
	kk2wqLUeZYqybVtT6D+h3LyxbM56BIF84W5tAfDHpwQ2heVGpBSorJE9VdnzvV9LHJs5UIGjf7n
	+1W1R4TwBtd7g6E8ttNg8VzqR39o9wbflqynogCkDHYB2rBNhP3osBAKp7W3zCm6gCPMc=
X-Received: by 2002:a05:6000:178b:b0:48a:f5c5:d077 with SMTP id ffacd0b85a97d-48dba7a9f96mr2403203f8f.2.1791540304283;
        Fri, 09 Oct 2026 03:05:04 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac025esm3020176f8f.38.2026.10.09.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:03 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 0/3] x86/tsc: Remove some magic constants
Date: Fri,  9 Oct 2026 12:04:33 +0200
Message-ID: <20261009100436.1133518-1-ptesarik@suse.com>
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

No functional change intended. In fact, the generated binary is
bit-for-bit identical after applying the series.

Petr Tesarik (3):
  x86/tsc: Replace magic constants with xxx_PER_SEC
  x86/tsc: Define and use HZ_PER_KHZ and KHZ_PER_MHZ
  x86/tsc: Use TSC_CALIBRATE_MULT for the TSC multiplier

 arch/x86/kernel/tsc.c | 54 ++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

-- 
2.55.0

