Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B852B545DBF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876250; cv=none; b=pDQUU3QmOaZl7FWjW4bU2gccSIxj4rUdfXhzUHNJoa+CewV20YqpgHc7CTpnf6YCKSZMpWglJ+wDDeKQwp8kwV5QxOSev4swwUkMNUL6gP2e5gdwYtrKFj7mJEd09wTRfTEkR8ZHV4FWQ0sXPnJxWlJKymPPTSLuvI3vvo4EayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876250; c=relaxed/simple;
	bh=/hf+JaN80kkUeIvT9savcMWGneOYjndNEDsyR1nSTpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y5a/VjgiYTewKxBmwElNxtSBt67pFiz+EgavOJlx30pMxjO7XWu1bmDSm7xqLg1079huy+P8/gkvQE2mlZrmV2eV17lCrlyf/ysiUiYxmMSEj8V4VgxAttXqzpHgupZ+26k/SgSmogdXivBOwnwgPwcIgVXCgDDj/MOhtWGzwJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZV74oGSo; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZV74oGSo"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7DA13F60D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788876231;
	bh=SXIMe4oMHTuXDpcB4oft04tFKxq0tl8ji9Vspwz0rd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ZV74oGSoYG/zp3kL+6d+KDfb/+MKdDXlnwQyShnz8QylS2uXQOMYe+sIhNI3/imeT
	 Ng2tTbc/aBvOtvEfpUYDsGK5cF3YNK5yxKxs3zZ3BdMxBv5rivbCswvQnkidVGLnTg
	 77bkxhykoCsvGT3CchIxJCDFEiJTiYFm7jpBn0wUhBNJF0IccYyP595gOYn/NJdSp4
	 04I8L+80HUqBs/8odxfNdrZO01x6/Nyuys4P6XjFYRB39XM5DEpcSb+ulqJXtc2uwT
	 Z6tiv2w8T/mP1DpQhgAAuvqYPYt3ccEMi28jQ+VcuEHrbr4saA7aV2MNppyjzvY8D3
	 KFStZ9vZGUrqM4US/XdzpuPxkWCaNcHDi0RjStwAy9IJ9TzpR8Q8xUQYeNIAKWUP07
	 7vw8whRIW9AWfQbgnfF/jNUwucBPRRHP4TY/nA2Vfv1Q7LSu0Z9VrY/amdq50kydtm
	 LUyYroP5Bhr1w3y/94gWvjYpvM/EdfxlemscT4JFf5XkJRt2uqDZczHce5vYWxwBop
	 4Mz2oZEkeSWx5tCIM+eJsCRNctA3BqX6TEqUVd/w6oDVq3yEYSzI5jc0gCVEdnPVJ4
	 IODg2RkmUxuy6jTBXt3ekipCIKWfcEjM5OhMhzc5/RrmkeSZt6FHYgCPdSA3Mwq/ET
	 XAZzs6ooaUPdzrQQxhKBHPp4=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25501f4aa2so572123466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876231; x=1789481031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXIMe4oMHTuXDpcB4oft04tFKxq0tl8ji9Vspwz0rd0=;
        b=hGtzK7sHTHl6asXiDPtKzz8HDPPNvs9qM/k3uWunCRgVVlkcYjgCXGGvE5gGLYWD+i
         8jIXSrUJD7iZpW0mC8IPn0qyQlHhXRrkrZ0iLaQpEFjusCOOYTyNd4uimZ5EFSBH1rg5
         bpfdp1lCOVV8n+oIjJThJDM93Uzg9KRLHdLHNoLA/doaGLR1J6GwGouJDW8y6OLfvqRG
         1FlQQ7TrUOrtqWLrFF9HEXbOL3ypZYfBc0yLAhkxyA0EWzN7hRmXb82r78zO4/BZ0xN+
         ff9FjcApHU33BYFniTcp2qgezz9HwTyLxz6N8MDG04CJ2HRFqtE9WPIDdcavaS6VxNGZ
         ZRsA==
X-Forwarded-Encrypted: i=1; AKwUvBw4uqHwt4/V4GWg2SDD/+8sD/ivVqL/QhQybZkNrDR/sHdLtuZ0UYhJzZs1BKSkiW5tz5RaBcHj28ZNo6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lP15d3Xhh0MHvAikBDAGQS+AKb6dPVDzo7yaxNthuGuNpqn/He
	amf5llZneva9fkhFoZoeqW/2dCRSdKWWbqVkU20FNgrw/jd26a6sCDxldYp+KOwZsEc0SOT46ZF
	ttztGxQstzf2WyDPTmAQBR+PYbpEta1c/j6Dt44APmMa48YTUtVBDG83+GWAuFZxaERc+deFQ3T
	vWtgZL+A==
X-Gm-Gg: AYBFou32EGeLrRnMc+OUJM9ab3zwKfVXK3CRZaRzmckWhBp994BJGLqjKm5NIWei8vp
	+IlauVeXqaNk0Ppl5ijcdCWL9LhdzK3rBlbrc10/plNyOrDotacp4J8xx9SihlF77roqxKjdXaj
	i/GfH67Yi/q3RO+pUnHFEXYEysyUvs6I4JoROciJpX67bQEgaXGAjrF0UkhQ0W3V3VkShthhYTd
	aI6SX5Oa2LrbWFS8IpuvIHisdYeJEEEEzTZjrKO+Brgije0XwKcyvHkXMmMuextMrAcCCwSOnPx
	sVNpFV/PbxRC2T6zwzYYWa5seeoPAjmqI3r1nBUNKZEt9i3LfB7kYk8VLUucAIeO6LB8VaGrqED
	8jYcqMgA/X/mrsxk3wReTuqFbyYTJSdRZ4PUwyAvyayab65PgR52psrvoxGLwNvtbRQ==
X-Received: by 2002:a17:907:c48b:b0:c25:f7dc:2dd with SMTP id a640c23a62f3a-c25f7dc091fmr1249500966b.30.1788876231467;
        Tue, 08 Sep 2026 07:03:51 -0700 (PDT)
X-Received: by 2002:a17:907:c48b:b0:c25:f7dc:2dd with SMTP id a640c23a62f3a-c25f7dc091fmr1249496266b.30.1788876230905;
        Tue, 08 Sep 2026 07:03:50 -0700 (PDT)
Received: from localhost ([154.62.191.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5768c2sm616647866b.39.2026.09.08.07.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:03:49 -0700 (PDT)
From: Andrei Gherzan <andrei.gherzan@canonical.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kleber Sacilotto de Souza <kleber.souza@canonical.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Andrei Gherzan <andrei.gherzan@canonical.com>
Subject: [PATCH net 0/2] netdevsim: fix IPsec debugfs byte order
Date: Tue,  8 Sep 2026 15:03:23 +0100
Message-ID: <20260908140325.13367-1-andrei.gherzan@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdevsim IPsec debugfs file (used by selftests/net/rtnetlink.sh's
ipsec_offload subtest) prints the SA salt and key in host CPU byte
order instead of network byte order, because nsim_sa.key[]/salt are
typed as plain u32 and printed directly with "%08x". This makes the
reported values differ between little-endian and big-endian hosts for
the same underlying key material, and breaks the selftest on
big-endian (e.g. s390x), which hardcodes the little-endian output.

A driver-side fix was proposed in 2022 but stalled in review: keeping
the fields as plain u32 meant sparse could not validate the added
ntohl()/be32_to_cpu() conversions.

  https://lore.kernel.org/netdev/20220308135106.890270-1-kleber.souza@canonical.com/

This series:

  1/2 retypes nsim_sa.key[]/salt to __be32 (matching the existing
      __be32 ipaddr[] field) and converts with be32_to_cpu() before
      printing, so the debugfs output is now network-order on every
      host, independent of endianness.

  2/2 updates the selftest's expected output to match the new,
      endianness-independent values. It depends on 1/2: applied on
      its own it would regress little-endian hosts (though it happens
      to have no effect on big-endian hosts, whose old host-order
      output already matched the new expected values).

Tested on real booted kernels, both patches applied:
  - x86_64 (little-endian): PASS: ipsec_offload
  - s390x (big-endian):     PASS: ipsec_offload

checkpatch.pl --strict and sparse (make C=2) are clean on both patches.

Andrei Gherzan (2):
  netdevsim: print IPsec salt/key in network byte order
  selftests: rtnetlink: update ipsec_offload expected output

 drivers/net/netdevsim/ipsec.c            | 10 +++++-----
 drivers/net/netdevsim/netdevsim.h        |  4 ++--
 tools/testing/selftests/net/rtnetlink.sh |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

