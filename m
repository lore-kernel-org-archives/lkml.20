Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252532;
	b=HuC3ykOLFj1U/S5me1IfCvjj7uzWY0jKyi7ukM49yTH3QjLO/auNoyNVkYmQduU9fOSL
	 NK6Ex/cWRRMi8n6sOpCRJQ7voDd3zoWdLG9oSewXGlZyV0seRq7kPEfXvFsHPqC6kDdbh
	 YJkqgx1T8+J6Q2mQrdUSJRdHf2KwSGkE62OSLlKPEya/o4KdJ4cCb2mhQ7nW4wismwsN9
	 2Q6vAcMqsZ1GGiz7of8hhCOuDVVdTndmsgzk7Ly/C6vsf37K9u56DMYMek0cHXHDo33xU
	 bC6RqOA67hjAAWYVWyciHNHb4iQFgAnhV1/DlKATjITUyvy+Rdf4IOcDBDlNHym0OXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252532;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8cUldOFx96eMbu0IrP5ywGI1BLDLAlGd12WAjz4GjNk=;
	b=XgKdPZrHTFwSo+crCrmNYKr98yXK1dwfNGJMXSFg8hoxOKekGfMeegF8xbAQfXOSVBCZ
	 ZhBeym1291e3jp2EXnX54JEPoEH2YoRyCB49JBBN6YgmBhYFGQU2iLVKyQJ0UQTqDJ5HL
	 0FUCSIYmfVyXrIip4hNVJg2F2cqIx1+yH2c0HPxOV4bspeFH+vvDpaRXuwkphugkvGQfa
	 DNb9U17/RbF1SQd+NRNvfYUI+BjCIkNKYr0Jmv5Hbypxg3tPn2/O/69IACf+3GX99GgXV
	 rjoewiWbw22Q3KZE41RMfvUg+licqvz6RzDDD1JuilUtk+OmB7YOHndt2H6mohCubeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=navercorp.com;
	spf=pass smtp.mailfrom=navercorp.com;
	dkim=pass header.d=navercorp.com header.i=@navercorp.com header.a=rsa-sha256 header.s=s20171120 header.b=0TXkPpz3;
	arc=none smtp.remote-ip=114.111.35.180
Received: from cvsmtppost03.nmdf.navercorp.com (cvsmtppost03.nmdf.navercorp.com [114.111.35.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01387606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01387606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=navercorp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=navercorp.com header.i=@navercorp.com header.a=rsa-sha256 header.s=s20171120 header.b=0TXkPpz3
Received: from kr0m-hmac-real-0 ([10.111.46.243])
  by cvsmtppost03.nmdf.navercorp.com with ESMTP id mGjs0Dz7QcS0XNijX8A1OA
  for <linux-kernel@vger.kernel.org>;
  Thu, 29 Oct 2026 05:42:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=navercorp.com;
	s=s20171120; t=1793252523;
	bh=UdeNdqqvjEGuQioDVmuUirg0BGsMU+r/jEd3GK64aGA=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=0TXkPpz3smMS/kXkHmYqrCmeu2Qp5k8q4pfOq4Z0m8unmKDxeBvV0H1wSIc8rB+Pj
	 HG1WH9ui/wgwkfBNkeU3lCFOo/tNXT40HOr3pR//K4pV1Nq+PCtl6AoGLysrT9XiaV
	 E86tFVARNc/rvCfjN/EwX5LuDQgRNEsZVnHhX8GqrG2t+nlMBf//VEreTf2B+wcnqk
	 3MszhDW0ZUHNPx5oxXiSdzzBSVzyfu2jVwNp6vHDbdlaYzBAMLoGomTSiw5tBhw9Pa
	 7TlxL2J7noc47i89kp+bMjXUZG0u/uH3t1uDyE+HugCTCvFFC2pp9KuxRfyHrc+V/g
	 09rkU6rR7GKtQ==
X-Session-ID: 23gjFADbTNGa3DEO39y9vQ
X-Works-Send-Opt: TdYwjAumKAumKAbZjAgmKqKXKoJYFHmwKBwYjHmm
X-Works-Smtp-Source: /mbZKoKlFqJZ+HmZKoum+6E=
Received: from localhost.localdomain ([10.25.69.129])
  by cvnsmtp02.nmdf.navercorp.com with ESMTP id 23gjFADbTNGa3DEO39y9vQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256);
  Thu, 29 Oct 2026 05:42:02 -0000
From: Gyutae Bae <gyutae.opensource@navercorp.com>
To: stable@vger.kernel.org
Cc: Paolo Abeni <pabeni@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minsu Jeon <minsu.jeon@navercorp.com>,
	Jonghyeon Kim <jong-hyeon.kim@navercorp.com>,
	Siwan Kim <siwan.kim@navercorp.com>,
	Gyutae Bae <gyutae.bae@navercorp.com>
Subject: Backport request: Revert "softirq: Let ksoftirqd do its job" (d15121be7485)
Date: Thu, 29 Oct 2026 14:42:00 +0900
Message-Id: <20261029054200.97234-1-gyutae.opensource@navercorp.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please backport the following upstream commit to 6.1.y and 5.15.y:

  d15121be7485655129101f3960ae6add40204463
  Revert "softirq: Let ksoftirqd do its job"

On a production 5.15 PREEMPT_NONE node, long-running overlayfs
getdents64() calls prevented ksoftirqd from running.  RPS IPIs
continued to arrive, but NET_RX processing on that CPU stalled for
up to about 3 seconds.  Over 15 days, the node logged about 1,000
bonding ARP monitor failovers, with no link-state changes recorded
during that period.  The failovers stopped after the workload was
removed.

On a 5.15.27 PREEMPT_NONE test node, we used a livepatch to make
ksoftirqd_running() always return false.  This removes the same
softirq deferral checks as the revert on this build.  Under the same
load, we measured three 10-minute windows: before patching, with the
livepatch active, and after removing it.  The number of HTTP requests
taking more than 200 ms was 17, 0 and 11, respectively.  TCPTimeouts
increased by 25, 1 and 21.

We verified with patch --dry-run that the revert applies cleanly
to v6.1.190 and v5.15.223.  Both already contain the related RCU
fix 1dd1eff161bd.  6.6.y and later already contain the revert.

The original commit was intended to prevent user-task starvation
under a softirq flood.  The revert's changelog points to threaded
NAPI as an alternative, but it is disabled by default.

The revert was merged in v6.5 without a Cc: stable tag.
Syzbot has also reported bisections to this revert [1].
Paolo, Thomas, Eric: I would appreciate your thoughts on whether
this revert is suitable for 6.1.y and 5.15.y.

[1] https://lore.kernel.org/all/000000000000a249880603717c15@google.com/

Thanks,
Gyutae Bae
