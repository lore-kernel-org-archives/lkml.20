Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46647798A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130735; cv=none; b=JZJ20hAaymyMp+zxXy5s9YSHjXRsEv8uDALBrSf5k73a9XC3rgIH30XKTEGw88GRazSw5pVnd9d6H6HYjVqWhrWGl79mMu40FGM9wX3rzdmS+ASXNuRICvgY3VpQUapQyQXzNsH+D+jPQwo01XgqTtAjZtnJstpoREUn4bpspq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130735; c=relaxed/simple;
	bh=Cl3LcxVT8UQmoIXm9PgaZHBPSx2BFaVUbDNNdhxXJFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Je1toh2BeilgC2aWFfmv5THVNIz+CUrIma8w0DYxT68LRKUIvHkfhVi1JtH2mEyd8lwzsJrblPNxof3EHTQ2fy6NBpUxtpfU1Kx/ttxk53A/w2re0SNlVZRlUwQo8spKx02SfokJ6rFlt9hVAT7oxdGar2VWVOQ5Bh9K2NJTDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/X8KRqM; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/X8KRqM"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so250717f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789130731; x=1789735531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stX4u/q9+UX8srql6LxNnbXBhPlMhXVPibUjinvI7Fc=;
        b=Y/X8KRqMz6XfNdXa7zDTQ7tX+aaw2GR7bHsC3CjSioT9K5toMHmq3RIG0W7tW5fk5r
         LA1myiaw0d3QIkhMDiTZO+TaKuw/gDVJreZ4gTSC+bCCCpLFog9mc+sUO/4/zRLrtmrX
         hby2OqArzwpXWe9lm0Qu9jsQ2ZshZRoPh6MgqcOug239YzwUX6na9WsLHwz0ZmB2mELY
         AhrhbcYe0uHbYhTc7F5K1c6olALpOeyN9ugqNmfVO3ggSlFXWTj+CpEvyxOh5JYa/Nyn
         USv4uIR55asx6MupDwzHTZ2fPOyb2NSdOEMH/iaXSpdT+p9GS3KItiGfeicWQDYQrznG
         akCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130731; x=1789735531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stX4u/q9+UX8srql6LxNnbXBhPlMhXVPibUjinvI7Fc=;
        b=bgraF8j7FOHEPHMfutKKMmj6n+F+VaPybza5F+7d3UAVOnowXmLI68plst69/lh4CK
         EW2nrepAlqA6XUeKV6O3Cc0igJ1vPFIDhKV+KcJqKg2wSZQnHmGNVD9rMXkEnS1yyMgN
         l8vO/cGPBy+K0gHfK8lyhDXNC6fOTwA5Av1w+7D7Y3NSkagX6VsOIuXeBO3mdlPuNaVm
         S3kx34XrSuVylEwNdr0rtLjO2D5PwzhErsuVFJywAshdA+9Et8DvrSe8/RNOH77xMuKQ
         /e6k7bQYzc+vnzqQZ20egGWZuf5lfostJW+UmXnUlOZTAMEkgf93ipLOF9bwp7YStEZV
         nWzQ==
X-Forwarded-Encrypted: i=1; AKwUvByqQ+xKJAsCsO7YFJqbKkdErWodGOWKoM9TQ5DPi3hTJzkjYR5DaUBX62C5HPyLtUct1Ax1LmnAWLZ4SiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lAXv2UBao8hqTd8hl+/sN8D9yfIIMVAR0ZbMtl6f9jyvMT+qpx
	4S+ptY9YGnsD1S2sZb5bNU0Amn0B3reqH1clHBJvHXg7waYEJqkfI3/+
X-Gm-Gg: AYBFou1AJ43J+tKbtEyayMoBfuMhZILMEZaZt6ITNi0kCwYAlmRRDL0TRHItvEQ2sU2
	ca9q/o6BHpOFXpe10MZx6z/iw0U2ZpoWE0E/s4YIFwb32gWo0C8rg7PWsXwJD5kErtZEcC1hLa3
	MaXVutSsBM4vQmX3VdtotWFdbxnySApsjnsAhbmK+jt2GOMWmEmkJYCVJuHZk4Ct5QbFGQvs2B+
	XZgJXmK6+ixdi2fuk5QJCF/eI9lM81vAtXPt1C9cdjEZKy5EpO/buduUAvaQubmTxjyKanXi8qG
	sdKqU3nkuKu7Ou7OWOdh+FL605h8m/5LRR4nnLPKCJa8G5JOnIQ0721b57E5PV+fzkkyEtHJdw7
	5eFNK1exr6eViBKMNRLprNdgSkewc3YYcVE6U43YgWGOXbhkRqJSKAvq8LhCzzUyQAwvNWWw8V3
	OTSLHdA2bDbaeZJoLDILLl82QobyY9OFcqxshb/i47Zq5T5UylKuRo6vmLMsr2XdxqbnppE/l0B
	tNA3iOARQojhV8onetY4HJuJGnZCHK1CLlHF/C7EMXAmpKUL7+T7f5RPoDW6pcV
X-Received: by 2002:a5d:68c9:0:b0:484:3310:710d with SMTP id ffacd0b85a97d-486eb3529admr7227286f8f.25.1789130730835;
        Fri, 11 Sep 2026 05:45:30 -0700 (PDT)
Received: from jaeyeonlee.eduroam.tuwien.ac.at ([2001:629:3800:12:5380:8eae:5873:65c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm5902298f8f.29.2026.09.11.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:45:30 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] selftests/mm: skip khugepaged file tests if mkfs.xfs is unavailable
Date: Fri, 11 Sep 2026 14:45:17 +0200
Message-ID: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XFS setup for ./khugepaged all:file checks that the kernel supports
XFS but not that mkfs.xfs is installed. When CONFIG_XFS_FS=y and
xfsprogs is missing, mkfs.xfs and mount both fail, but
SPLIT_HUGE_PAGE_TEST_XFS_PATH is assigned from mktemp -d and stays set.
The test then runs against plain tmpfs and six subtests fail.

The script already has a skip path for this test, but it never runs
because the path variable is always set. Check that mkfs.xfs exists
before attempting the XFS setup.

Assisted-by: claude.ai:claude-opus-5
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384e..6315b67b6733 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -415,7 +415,8 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep xfs /proc/filesystems &>/dev/null &&
+	   command -v mkfs.xfs &>/dev/null; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}
-- 
2.43.0

