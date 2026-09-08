Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD62559315
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876258; cv=none; b=t6JXV7biCgYYz4Ar0DfhNd5DFI0vsOQvwqxTrkAKhz/UC23NBMkOIbT86trVwn8GlnDgdXz4hZ20kS9KNxFollpb1H453S3Ns0jIAGNbneBN1NnZPKFNaJYc5hBtSB26j30JMJCsv/6giFSpYHF0VU+fLU2lo2JnFN6YLxQWyb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876258; c=relaxed/simple;
	bh=T6U9OLyO1XxLOwAi7oui+xs/MXoNt7l8Uqjk+PGlDXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVWDfMxIkq8z8Ej37A4It/px/GQJgcmxdp6uwvgdu79ghLxyBtvcMtQWJ8TcRrAFR5o8u5Ds3pMUYZ/jn3ZLBDEFOAycMTX17ui1G6RbZj1kkZ872XhVNo37UODP7R1GQi06zdZQKxBcCtTr5B3wD6Mb/OAFcNqoL0wLBpV2Oi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=BndoaZ0d; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="BndoaZ0d"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 809F83F272
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788876239;
	bh=oZW+3HacXHXxgA1Yfz0voc7XtCtL4kOFjCa7sts9YXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=BndoaZ0dIIEOpy0aV0bq2DWM5KhbG/oso5uX9szZEXHYObhnUh1zkIRx9XiGY96GS
	 yVUB2Ef6zBJGLUvbsZt256f8HqSJ7xpYR0mY78X5SxexeHxWZIgnrCbcdDxhPlnpqh
	 XPREQvTdxeg+dtdZfI8aFIKetZqREhi0DUkPX65BLCFm0zz0BBgkBTJ3edWM9tm7yH
	 dfMSG6VwiatZcJ9VXBfx/nz+gqetZHbmD5N50YREBSUPFSTVHUvp/YLG/ePCadKcqr
	 HK0VUshdoeD4FzwFdoaAzVyj5evYKe9z+iQIUSmVEpFhEPc+23Tzff1QcNdm0ppHLj
	 YQIDDBe7jNM8LKCQNwbRXd4w0EMjpt2F7NAOOFsG8sZtivuWkSnlC0NcfXKfKeoEbw
	 WZqZIX0/e8soRIYF0Q7WMJebQ0ACbvP8UD0Y9WEP1W/qaodXctNSiMHAmEt22bK88j
	 wnm6WZ08Mff5nsVq8ZNzdagrWbye7jZP/TpPI9ZMDQQ+zJMjD3GmWv/XRpmpbXF3F/
	 Ewvk05aNFtITYSD1s5hu1KV//cy7bRJ6d72jIPIJEmODUlOxlZKkb11YXXRPR4aY25
	 hAcFVrbMosbhdUNTuiG8LTSHU++siUQHc7g4wErfywa5f4L8HioL/5CmZzYwVWd/4T
	 PivGjQAHpRCeX5vmm/4gkFos=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2580a59d0dso401298766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876238; x=1789481038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZW+3HacXHXxgA1Yfz0voc7XtCtL4kOFjCa7sts9YXQ=;
        b=KYFEBxhCuDHjr9/2nbqcxKcZPh7HToavlz6m+ZBzMassZkPN+91Ys8tltzZzR707vA
         UDgy1/6o+cvRVwEpoqP7dyHO24qgCBr8z8ZT/8wFUJvaQARU/Hnw/UZ8f8VZDeBsYW3W
         QV/A3hEqqVk/8vFQb0UgnLbuZBlYzZcBByF89PQCFd2GuKHZJb9XGVWQHgSge1kKmmMU
         M0hT1psH7eg6Yphjnkx8YFpFVa5jophbLGtZZ7R/qQJqSuBTRbfXM1CQkqUMdtkFvm0Z
         7mRNS4k3uimAiQ814kiFEfP50T+DkSIJhGwquiwDojTdr6t6c402XPfBIffYF/Vg2VDF
         Yyng==
X-Forwarded-Encrypted: i=1; AKwUvBxOdoOvZESeoHeK49wYcS8wybTACMsSlhWyTTq+HtXrkCuuk8LGp2Bcz9jUW3eXizVuC9M9//vW6RP+MzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n2K5hr8gkU8yVFFu8iTEa5XlEiaOuSs1M2tPe1h4Oo2ERoWYVf
	mSOFBaJYuYtQuMWxGvKMhS3nu+Z6h8dROSNft2u76HP1nWXxVtWu43PzZVDzYje7/O5tA646GEG
	npYaxdJJvtXn4Mr/U4UBByF640sl0wt/IzXGFyv9sc6og/J979hNJBB4xN6dwx2srJaWQ9RKGPi
	IJVP95PA==
X-Gm-Gg: AYBFou2oVh0fEY2SxqOUeFk5EqpZHca+yCUyx4sq88ScFxKRgmkgpWW104p1JLSSlol
	sb2FZ6K7w8B85QspYM0G9Vy1aDzfXZpeA1Lr/RO002LO8e9s7jIQiEqyEW41xH9BvYCDFzF7AKJ
	6bLE9M99SlHtqH0VB9C2TBem5DSK+FGMgC7oFn9EXLpDsSAl0fWTqWsDpHpCiPBmtCL12ilmgf2
	XUSMGzUiopXZrcerJQf7IYnVkuZjsTuntskTHqQChuLUoDcJ6zXisRDM9CXzOEhrDlTjWKopYJh
	KI56JlsrmAVkIZVXYARSWscN/CBeO2CP78sdOgz69x9G2GpStNhzxcOyd0vcyy2VyQwX2K9Lx6b
	hkBubY0x39GfXF4wHYeoQ90EyH+321Qjs4tl55obn2ZkP3uUHfplRig2u1239/7WOiQ==
X-Received: by 2002:a17:907:d23:b0:c26:19de:9ae6 with SMTP id a640c23a62f3a-c2619dea7c4mr931872366b.37.1788876238278;
        Tue, 08 Sep 2026 07:03:58 -0700 (PDT)
X-Received: by 2002:a17:907:d23:b0:c26:19de:9ae6 with SMTP id a640c23a62f3a-c2619dea7c4mr931869866b.37.1788876237770;
        Tue, 08 Sep 2026 07:03:57 -0700 (PDT)
Received: from localhost ([154.62.191.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm631394566b.6.2026.09.08.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:03:56 -0700 (PDT)
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
Subject: [PATCH net 2/2] selftests: rtnetlink: update ipsec_offload expected output
Date: Tue,  8 Sep 2026 15:03:25 +0100
Message-ID: <20260908140325.13367-3-andrei.gherzan@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908140325.13367-1-andrei.gherzan@canonical.com>
References: <20260908140325.13367-1-andrei.gherzan@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch ("netdevsim: print IPsec salt/key in network byte
order") makes the netdevsim IPsec debugfs file print salt/key in
network byte order on every host, instead of host CPU byte order.

Update the expected output of kci_test_ipsec_offload() to match: the
values change from the little-endian-only representation to the new,
endianness-independent one. No other changes are needed since the
output is now the same on every architecture.

This depends on the previous driver patch: applied on its own, this
change would regress the test on little-endian hosts (which still
print the old host-order value), though it happens to have no effect
on big-endian hosts (whose old host-order output already matched).

Fixes: 2766a11161cc ("selftests: rtnetlink: add ipsec offload API test")
Reported-by: Kleber Sacilotto de Souza <kleber.souza@canonical.com>
Link: https://lore.kernel.org/netdev/20220308135106.890270-1-kleber.souza@canonical.com/
Signed-off-by: Andrei Gherzan <andrei.gherzan@canonical.com>
---
 tools/testing/selftests/net/rtnetlink.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index ace3a99023ed0..4843d474538f4 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -932,11 +932,11 @@ kci_test_ipsec_offload()
 	run_cmd diff $sysfsf - << EOF
 SA count=2 tx=3
 sa[0] tx ipaddr=$dstip
-sa[0]    spi=0x00000009 proto=0x32 salt=0x61626364 crypt=1
-sa[0]    key=0x34333231 38373635 32313039 36353433
+sa[0]    spi=0x00000009 proto=0x32 salt=0x64636261 crypt=1
+sa[0]    key=0x31323334 35363738 39303132 33343536
 sa[1] rx ipaddr=$srcip
-sa[1]    spi=0x00000009 proto=0x32 salt=0x61626364 crypt=1
-sa[1]    key=0x34333231 38373635 32313039 36353433
+sa[1]    spi=0x00000009 proto=0x32 salt=0x64636261 crypt=1
+sa[1]    key=0x31323334 35363738 39303132 33343536
 EOF
 	if [ $? -ne 0 ] ; then
 		end_test "FAIL: ipsec_offload incorrect driver data"
-- 
2.43.0

