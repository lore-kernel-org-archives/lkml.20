Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A7495028
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004173; cv=none; b=p2iWkzXDhWipLPZw3IP+SO4fTnTxLv7JrH2JhSCcaWNtvcaKSdVLiAKiDqLdMXsuJxLyElgbm9aRXQcipE6spBWr9oTf8JvurhovYc8j92lXTBj38G2KUIFgvANc8DcfvS1jfkcmf6Xvtdd5k9IDQv23899sZxEK7PL1dCF+GrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004173; c=relaxed/simple;
	bh=6wVNyuuHq3GkhG+m8jwDnWmnirUyIuacKpCH60Xmvxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IBcmbFI6i0yzPZxZSjJaki4eXE4DX/TdAqDSLz/d0cU8m1eHQEe/il3ElfB638+3q3makNkVbfxnLCj3+A72f4m1SpV6JRlBWxVzWPMnyVergg/3IiXOC6NaGKRav+S3uWu8KLvHR+TAwVq5nYglFrq2Cb1BUeeOjk9QCqlZaI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XyXctxfQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XyXctxfQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2268814f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004170; x=1790608970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqVjURf790MZFrOIRbUWDO0zQFRauk2hh5q1Md3YIGQ=;
        b=XyXctxfQJE/OSDNTQ6TJX50xaSAQd5U186pKpdU8WX9sVmaWj8CEJMcbLbAzHwBnlm
         UqdSRFC3rx6/oM84/PA9LkkPu2EMwphcSlQZ8pdI7RaVk8VtPg3eIMNQPAsM5Zi7xLBC
         6J9kWChOFgJjUJPl7Z5xtlM7AF4DhSsuEAVdq5YIzT6kdFjhiiCV6gIm08tGFMr67rg1
         uwtgN1F6e9uEM10esv4xwv2ScNBFVFSAHUvfFfvWnB+gP+NLLyyCD9hggRpEctXtrJsc
         g/5cgMGS3Xc339DpAKDKAa8jTYlNSXsGz2kCqwAHT/IYvRU7Sgj8HW+pKZ44fVoR+Cl1
         rAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004170; x=1790608970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVjURf790MZFrOIRbUWDO0zQFRauk2hh5q1Md3YIGQ=;
        b=y7nCyOvBjAlTRlxsOBcDdDy/ZxsPQH/zAdODpHaedwtpfOiYc5B0rsxt2np3l2Xtp6
         73XG69eKS2OovPbDRO4exfbMPdOzyvx0HQ0STuoNU3hTjkZu/AMq9J/q+1d72eZIXTy+
         pN2jWmPiyfVhkd5vhBPsCDzKN4iE2ZFIiHbOsF1UolXEqji5TVDh/ykx+jzm1utJnKVM
         2/NrB4/Wc4Xy3BNiOxNgLHtjHsvQlqHX7CRKk/GRDmyASUJUmkaXXW9nkvkAkMRC19dP
         Vt1byR6OfEwpcf8u8wxmGOa7oB/MtBqqiQHY833GNoCX6eR/OzBSPHtXhUuAKLPNt1Kc
         K4Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzcjKI9XNw5YiOsKVRX2tn3GWAdf0wW06Ob7jogC5EW9Ccwnvh+3x73OT1FcWm/L8MrqIr6SjvQ2+/+UrI=@vger.kernel.org
X-Gm-Message-State: AFuF++l7Id2avjgzxYofWlcs7/7p9sZn25bSO+WgQGGi4RorHNqz3Esd
	mf3K6ma0vxDvO3pYd2eIlRhpLLa9pYFfem+/R7ydAw2kP2kbPsbtST7g8GHfSnnpD7Y=
X-Gm-Gg: AYBFou1/nulZm+LaEM3algKzYDDU8JIZlIZ4Vusaq2QtrVzU0tN2AQxNUZ8RLwz41M/
	xum1hJIQA9khsbmMqRxda6T4F7jXiYkKTMmhLJD61ezJFh6t9pyr2q3ey1FeZsGC5WqYAZqUr6y
	VLn+epDrsYpDAsL+nXTXPrkNdGxo2ch21a3awDIoio3h7BuDf3zCnEMvjOF/vWNg6mGsiBZLLQ4
	iR5+hwoiLbu4lYXEcaYK93IHunqRO1siTriyx9vvqE7EAa71tjeIwXyDWR2MLrO+IDXpm4BgkA6
	uuKZRGINHlUh+nuq67ntDlYp5XoetQ2LYooSGM7dE1zG3IymPcDVq5qCbXvLZZ8fkNjhtchaO2m
	AT/uuqDm0ddo2BN5OFucJNTj4n37/daRC9kiuxmlynT04q3/WW/koI+cDppuiJxp0AWIjCbDXIC
	b9yCrNpb5hNhsR104kY8wE7RBnq8gYt4cT1GR2Zg65hLhv0aDyuGeWWwpYOkJ425yMu5liRCY9r
	LSNOlBMDrFtfRg=
X-Received: by 2002:a05:600c:c8f:b0:49e:6c9b:4e94 with SMTP id 5b1f17b1804b1-49fc5743124mr153107715e9.28.1790004169498;
        Mon, 21 Sep 2026 08:22:49 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:48 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/8] Improving latency of short slice tasks
Date: Mon, 21 Sep 2026 17:22:30 +0200
Message-ID: <20260921152238.3804392-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is another round of scheduling latency improvements which fix
some remaining corner cases and start to fix somes cases when multi
short slice tasks are running simultaneously on the system.

I run my usual set of scheduling latency tests on dragonboard rb5
- cyclictest with a 3777us period and a 8ms slice alone
- cyclictest with a 3777us period and a 8ms slice. 2xNR_CPUS rt-app
  tasks that run (8177us) and sleep (17777us) with a 16ms slice.
- cyclictest with a 3777us period and a 8ms slice. Hackbench with
  1 group using thread and pipe and a 16ms slice.

NB: periods and run duration have been chosen to minimize alignment
with tick or other periodic activities.

Each test is 130 seconds long

scheduling latency (us) for cyclictest
                   tip/sched/core| this patchset
slice                 8ms        |  8ms         
99th Percentile               91 |    90 (+ 1 %)
99.9th Percentile            126 |   108 (+14 %)
Maximum                     2273 |  1018 (+55 %)

scheduling latency (us) for cyclictest and rt-app
                   tip/sched/core| this patchset
slice                 8ms / 16ms |  8ms  / 16 ms
99th Percentile               66 |    66 (  0 %)
99.9th Percentile           1104 |   832 (+25 %)
Maximum                     6165 |  3041 (+51 %)

scheduling latency (us) for cyclictest and hackbench
                   tip/sched/core| this patchset
slice                 8ms / 16ms |  8ms  / 16 ms
99th Percentile               75 |    75 (  0 %)
99.9th Percentile            730 |   637 (+13 %)
Maximum                    15996 |  8124 (+49 %)

Beside the results above I noticed significants performance improvements
for hackbench with pipe which were not expected.
"sched/eevdf: Decay positive lag of sleeping entities" is the patch that
provides most of the performance improvements

The test were run with the default 2.8ms slice to check for some
performance regressions

hackbench             tip/sched/core   this patchset
 1 group process pipe 0,863(+/-2.6%)   0,764(+/-2.6%) (+11%)
 4 group process pipe 0,721(+/-2.6%)   0,561(+/-2.1%) (+22%)
 8 group process pipe 0,661(+/-2.3%)   0,496(+/-1.9%) (+25%)
16 group process pipe 0,630(+/-1.4%)   0,498(+/-1.6%) (+21%)
 1 group thread  pipe 0,925(+/-2.4%)   0,813(+/-2.2%) (+12%)
 4 group thread  pipe 0,846(+/-2.8%)   0,614(+/-4.4%) (+27%)
 8 group thread  pipe 0,750(+/-6.3%)   0,524(+/-0.9%) (+30%)
16 group thread  pipe 0,640(+/-3.1%)   0,506(+/-0.9%) (+21%)

Those tests have been run with perf scheduler (Using schedutil and EAS
provides similar results)

Vincent Guittot (8):
  sched/eevdf: Ensure that vprot will never go above a min slice
  sched/eevdf: Align update_protect_slice to set_protect_slice
  sched/eevdf: Handle more short slice waking cases
  sched/eevdf: Decay positive lag of sleeping entities
  sched/eevdf: Reset lag when waking up on idle cpu
  sched/eevdf: Add per cpu cached min_slice
  sched/eevdf: Compare min slice during wake_affine
  sched/eevdf: Add min slice check when selecting CPU

 kernel/sched/fair.c | 174 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 159 insertions(+), 15 deletions(-)

-- 
2.53.0

