Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FAB49EC7A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142821; cv=none; b=KNGQFTjYJ4eTBuYjqzoxHvgmdMVI1HiAdgEiCPDwcT0uRUrBIyiwX3SEQSNHkJJ9WN0kFqUrdDPgimzICbTZknbY7fpawfspHT98kCqy8l/nws2WXVK6Ra6GM6eGjcGin61kW2rbj7CqrusOhyi9ASVZj9iQDg7yxlhHd8hrbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142821; c=relaxed/simple;
	bh=gBbxLP629Gvcj9VfC9SPmRJKw+A05O9nG+Plld/3GVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uv+BhmuHCVMThujFmwTttYnWHWezWmJxG+lp7aeidULiY+sce96cvgNOhklDXHTwd8EYMLx0GAydR3C7NrorEauGX7QpbqgoMb4w45frAX/rtuY5bluzjNq9CC8rk1SEL/Sd8CnT2uvQaekDe16dDymddlO9/76vQ1ZOSdHO1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=k8qOVQ+Z; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="k8qOVQ+Z"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso11727155ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789142818; x=1789747618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8yzgeJZFDZiVAiiCE2K00c+oQsu6HsCjjXTSMd7Ylo=;
        b=k8qOVQ+ZB/TO1NN8QH0kgqXLzcJRAHtUR75nlZeZ0ncHfLiENxwXD0gZv+eDKU3nL2
         wWE0eh4Ouc5Zm+uCeRw5S9Xw4OdEpk/zLzYfIHjT03PVEAJkQbGELUu3HpZKvk9J5IVe
         rkLJMcYEMjIg0uQIMEnqk8gMvJnaIV4+0Yvsnx6Lcw9BP75BrwE4QCxWf0rKN5RRLTX9
         VO0C89r+h/Poj4GBI8M9fJl5QgvqwQnHkhsr/qjoKbZYKVuPbACEz+HoHijn9ezvebgP
         97rJem5hElhSA1bhR6A/0ZW227bfqNZLuTHQ9aO63UArSziPhbHolrq9FFb7ZygcMMXc
         hG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142818; x=1789747618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8yzgeJZFDZiVAiiCE2K00c+oQsu6HsCjjXTSMd7Ylo=;
        b=gK2w4MHmBVm9ey71rhpNKSbjzzlw8gfpw/ay30cEsjgRo4jG8LDkfM8moeK9DUTuoW
         8DuJ5+kJ99DMufrhHqli5iN9Byd7oji3CIL3shzT1EA0G1QL1/umF38/y4bIYpti5f1w
         XlCcGIydeJCikxTzTJNwHgGHHZc/p4aRAM/Hjo7I44gKUK2163sizSez/1/gFysEQ5tt
         GsrbJeG70QuNTqoRz8bBabBL0rMhTJQESdrOoLdLknhQ/525DfOQh8XN0dTPfCjWYi5P
         KO7F/9cI7FBiZxkPsZ73oQI4hRF0FWlLz3kwVWk4/nLs7dGxCrBWsVb3pC8cZJJnBOTr
         dOfw==
X-Forwarded-Encrypted: i=1; AKwUvBwXGCUJ++JQXJcSlInNpsmgPN1jUj8YQY+fSoqCzNABscD2BLAot5rIPbtuzF1PJTV4QKdsvXZY/8gHFIE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAFfGOZbwSpK6q6gsnNeUfAvKkLo1XEiGZTGfg7bGpB9eufQ7P
	SmVSIl+qj3BmTiXMW9qG2Ncvb9i2MNf4JJNszKst9NCLR96PY0XknI670P+WMXK5GNU=
X-Gm-Gg: AYBFou0YcEr6ElUpC8oDOvD2pOkGXW2s93HRZ51mSWobScszsqCMJ8Ze+/fmsv6DH/V
	0nc7XlUFTiUyX3vFetab7XUrxluqgoYiXhysm6pxinboz5c2wOuXDEIlwaKaJH4WqIbTZSBlz+d
	VAYCRE6fsCwZkqCm1cnYW/9J022EeqdtRQA42pe3VDV0aYyHrW8j0Pacaz4hxRaFc6PG+h2cLhl
	lR1t0aTwjPM+ft5kBXR3XijlKiMipmVz2U78hQsP8SGX0BQQohNi59hko4xuBUTdPsMrif+fkKO
	Cj4E8CfjxKxjRn0zS8eyuTrut6yrjq055gEtRi8Kqsz8a4Wwnc47SK3fqfuJoa6CKn12a2Y7DDz
	CQlij6lz8EiBFgtj/Do6E9N0n1Q7zALGFzLVaY4cFk9Q8d/jypJ1OBDdmt5u2DnXQbyfSGMWVeb
	oJwpLyty2wi+O7n2W7/HP3/f2LU3iaZcOw5B8FpSdP1lOdMJyxjkyhCH2oVFmeKSO78aIiIn7W8
	Xk+35ud9VsB7U350OrfLpgcwov+zXnPi12OFWq/NsC4BWhpRHABGk2UtI3tmW1sLVSo
X-Received: by 2002:a17:903:1a88:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dd0e9e565emr113903455ad.7.1789142817956;
        Fri, 11 Sep 2026 09:06:57 -0700 (PDT)
Received: from localhost.localdomain (111-240-145-155.dynamic-ip.hinet.net. [111.240.145.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13883055ad.56.2026.09.11.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:06:57 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v2 0/2] selftests: net: Exercise TCP payload verification
Date: Sat, 12 Sep 2026 00:06:47 +0800
Message-Id: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 added TCP payload verification to udpgso_bench_rx, but did not
exercise it from an in-tree test.

v2 adds a test case to udpgso_bench.sh for both IPv4 and IPv6. The
test checks the receiver's exit status so that verification errors
are reported as test failures.

Changes since v1:
- Add patch 2 to exercise the TCP verifier from udpgso_bench.sh,
  addressing Jakub's feedback.

v1: https://lore.kernel.org/r/20260906145643.219609-1-f64116045@gs.ncku.edu.tw

Testing:
- udpgso_bench.sh: PASS=22 SKIP=0 FAIL=0.

No full kernel build or boot of a patched net-next kernel was performed.

shuo huang (2):
  selftests: net: Add TCP payload verification to udpgso_bench_rx
  selftests: net: Exercise TCP payload verification in udpgso_bench.sh

 tools/testing/selftests/net/udpgso_bench.sh   | 34 +++++++++++++
 tools/testing/selftests/net/udpgso_bench_rx.c | 51 +++++++++++++++----
 2 files changed, 76 insertions(+), 9 deletions(-)


base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1
