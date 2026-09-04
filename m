Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2324A8FE2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530628; cv=none; b=rTH1+aJ2k0qHU9Lv3a52mAWlzSjNVuWypY5GRG3B0/J5x3CcM145DG++gJn3oFkFfHYPa5asZA3kuSH8l4zZYi7SDXgiHc4ACycBYmQ02PsaBvYPB9kv2NJZcg3EJID8CxNsHg99hE7U5iE6dZPQNo/kKyaZdq3mQGeNTBHgVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530628; c=relaxed/simple;
	bh=l1T/TPElEBIBckbkV0zkS+lAJ3dGZHogNKbOl0Tkkoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFxGxyzTfNvvnC5ADIaYr7XHHWvN3BEw20xpAI0tWRgVRQb818chMzR0C3Vt3i0Gk95BNaxqfq9i6caTCmAKYZPoAqC/0aFlvXI5b/GLFuKyNbSdilb8OP5B8zFIb/L9pjy5HxUte6PxBVEarRKfpt0X0RE611wPghdDxAfUrs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=K/rG5fTJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="K/rG5fTJ"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 89FA542954
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788530617;
	bh=3DF+MIyFr5r6aUv7sE4j7TVrrTvo12iD8pFcT2yVbKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=K/rG5fTJMt7RAqpR97Bj3x0qUnOcc/98nFZUbQq6O4+sx6PYGZBdi4MID1Gk9niZ0
	 J0TomwoDBEu1rLdy5NnVnIrLmrLFKXQVoS05Q5ALQIT8vJwxiEVZAz6coIEOjw5Ou+
	 Xz1Qb8xrSVEO55tcE7donEIakXGwQ6jPJTUiFvCtqmUqOWFJGPpa8nPQLLewMXGcjt
	 GFuhY1YDd7ETlP+pYHtpOAC60iZ+HLmx/V0qCGG1ngPIc4AvqxOaRy2gJn5YVwLlli
	 3QKWgeeJ+zETSaKv3Vmh0gSjfxRLN9w4GFf41Tm0iVwaoU/nNFRi6UeNi6xjLXdmUP
	 K+ukQKray9iKI0jncaL/YNSlOWDn1QFI3M7P/gx+IT9RKG++eY5Gmy/2ceFdrDUFUh
	 rn/lWIpi5G6Y8NzI4TFvHIr895BKfF6bbYWrM7qKjy5WAfgDuHWxSBoRAQJyWgJ+Ss
	 Lu09gPdye8Xv9MqwuZti+9fYT/iNO/ZTycsAqHNGd/KiuZ9Tsf9ZLphts5KMUT1mRp
	 cldzf5+ey85xFG1UiRoXczuyGCqXavLz+VPbSEBXu5NV1zdzfxNW1o53Ze2w/6ECft
	 5ngfL7+hQ35TH7C4ruCaBw00rpsm16B6Qc4tGu72iSJGoBPm33MtGoAy4yA6jh53UY
	 708BOzhIe1NhEiEe+I+nl3eI=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15e6109f9aso92810866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530617; x=1789135417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DF+MIyFr5r6aUv7sE4j7TVrrTvo12iD8pFcT2yVbKU=;
        b=eYI4f/tiPU+wXHfo7AC7vDjCRCMWIkVw5v71HLJvvpixNPKq8ufAG0ptsRvjmaKy0S
         DcgIYKvQhX1/VfSBYuiN6Mb8bj94mxJwKnrq6IZEeg0dInWCzW0D+sBgdaJ09RZIDdJG
         zR1JsgvlUqeoqmtnltuNjoIIoaQhKUxh3J4n57yXmCTJj68mrk228X+8DgbZyZKf4UI0
         gAQAezPq7mhOvxFMA3V00iuTn9GAKSh/pVMQC4feJJKwfES7j8Gj0J/C6de8pUpXaq23
         AiydjuxENFtWAOKIjbXKOE+7BQ0iF9M5pPwzykQw/8K2JHu2ImtplrvqNDdLl4mwuXux
         FTNw==
X-Forwarded-Encrypted: i=1; AKwUvBxHXSYZHaayqAePfKmrtPfWW+YmpnIIjZ53GwoAGeL6QaQdDggQn/WwUpmOy2Znosn/Zc8YVG5U/k0UiCE=@vger.kernel.org
X-Gm-Message-State: AFuF++m7ImQ59juHq56pYb7GU9Ui7zN04qQ5KUUPMUUy+wvrTVXQcVFE
	u5NqaH7Cwiw8C9Ay91MudoSeiFlnvmk5Ca4qiIPxj2AzlvVH3dd0JCsvum93TT3KQN5TaPH+Gi4
	+qqH8DKlhRJj5v5gus96dEvJBbJ8hJkWcNSQ67q2jIybsAA0W2f/WXgsWoGWk1WQzdOKXmOGxF4
	Ms2Px2wQ==
X-Gm-Gg: AYBFou37dMltwtWv211/0sanDZ0OdVqgCC+Npil9d3UHXM0HTk37vPXxVq7bkc6xyjp
	f1gPWetvQGx7tkjl4nGRefMGrLFEzoEf0RsrpkpLxuUZiN25EgOlRNagDUIhBBihbFJzjvkMn5m
	oPjwkOknKZg0J5XcBcWMU4f4CYey28qwAI7ectMaIDKhf4dCiaQP8R/JMaRmiwymxm9g06K3oCX
	5sfk0Ij5M5zg66dKIog53O8LxoMuF+aawnRHxWI5H97KwpyudbkPHi/99ZV/UBcLC+hhtETDjSe
	IPx/4C8lejV4Dgth//Lbc0TZvrTfw+55u1sWXnF0YQxmq/47uk6JbZSqI4IgqhLeHRPkmLrsKp2
	fqkmyWwDq5eb5PU9MGsNBSHrZk0YqH1u6tNXQNl8J3UqXH6Odti7x
X-Received: by 2002:a17:907:3f88:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c260c9e2213mr292883466b.18.1788530617034;
        Fri, 04 Sep 2026 07:03:37 -0700 (PDT)
X-Received: by 2002:a17:907:3f88:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c260c9e2213mr292880166b.18.1788530616630;
        Fri, 04 Sep 2026 07:03:36 -0700 (PDT)
Received: from P16s.localdomain (staticline-31-183-213-56.toya.net.pl. [31.183.213.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa5acsm111956666b.12.2026.09.04.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:03:36 -0700 (PDT)
From: Kuba Pawlak <kuba.pawlak@canonical.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	kuniyu@amazon.com,
	Copilot <223556219+Copilot@users.noreply.github.com>
Subject: [PATCH net-next] selftests: net: Skip so_incoming_cpu on single-CPU systems
Date: Fri,  4 Sep 2026 16:03:34 +0200
Message-ID: <20260904140334.562593-1-kuba.pawlak@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test requires at least two CPUs to exercise the distribution of
connections between per-CPU listeners.  It currently enforces this
prerequisite with an assertion, causing all test cases to fail on
single-vCPU systems even though no kernel functionality was tested.

Report the unsupported environment as a skip instead.  Check the
prerequisite before setting up the network namespace so skipped tests do
not make unnecessary system changes.

Link: https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/2023546

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
Signed-off-by: Kuba Pawlak <kuba.pawlak@canonical.com>
---
 tools/testing/selftests/net/so_incoming_cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/so_incoming_cpu.c b/tools/testing/selftests/net/so_incoming_cpu.c
index 4740701f1..1b7344238 100644
--- a/tools/testing/selftests/net/so_incoming_cpu.c
+++ b/tools/testing/selftests/net/so_incoming_cpu.c
@@ -81,10 +81,11 @@ static int nr_client_per_server, nr_server, nr_client;
 
 FIXTURE_SETUP(so_incoming_cpu)
 {
-	setup_netns(_metadata);
-
 	nr_server = get_nprocs();
-	ASSERT_LE(2, nr_server);
+	if (nr_server < 2)
+		SKIP(return, "requires at least two CPUs");
+
+	setup_netns(_metadata);
 
 	if (NR_CLIENT_PER_SERVER_DEFAULT * nr_server < NR_PORT)
 		nr_client_per_server = NR_CLIENT_PER_SERVER_DEFAULT;
-- 
2.43.0
