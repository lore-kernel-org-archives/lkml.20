Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C0D37269B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845184; cv=none; b=N2L3BRzf5bxij/gp9hkRAggIYXO3ZZJFZBWYxbSEDxhg90/ESArYXgLokrApTlaC3KFKTrnXQvUOGe5tD/1+kCRED1cG1H0qa7cUhAF8mS4Vz/UgHUMk/LNQudu4MnD4bx3+MoR4iL4Q2wn3dBIwo6cxiXPPF3y23OoEHbjtNIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845184; c=relaxed/simple;
	bh=Wu4MFNvM9+B3qaLFMlJBJ7B2feraxxXczXPfqfNWxOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su0iU+i8S0OpKYqIc12C7lgNX5BsQ3g250/XueTFN3+RulCi73tGp048EJof9pi8zETw2ayLT36ndADx70KeLuLNEU4ehcy73Xj1hw8dgcEmBXQJr/uacMi8bKzQB0H7oQgVRVMbPo/gP/zDRrRbAz1Qa7pETk8a2xZRC5TlkuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z44fveco; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z44fveco"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6efd73032so42927865ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845182; x=1789449982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=Z44fveco7Kmdjwu0kZEnjeyJqOkjZYgYaveyyw4PqXJhWpJIPJXxtKz7Prbfj+ggRo
         PBET7I1d9lJjsEVsOCxT5st7fhG5bQJ6kCGWU6iSP+3Qw4aZFtvXhofyJgv4xho4p+KL
         LMJsEexbhI03F6syK8xbNXVW//4zr69QcPZ7UQ/lqOpBC4ue/m2DaDdXIlBm6r8qBUjk
         AwsAwyysVubByEEbIw1mT7NSZhGkFw0ZEbJ87DY1F4u5834Tvli+EoNPDiTuVl+GlFO8
         UsGF7Z4oJMrdmzX+mU9ntdt8EV5wwBcCjPjJ4Is+SImHfoU2h4ZEhI1O/Lx9vJ3+P/FT
         le1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845182; x=1789449982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=bzWFCA1QUKQ/S2EnO6NOKPKv6bCi+AWwPUhsObO4YlfdpEZEzE8P6GnAex4oM381gj
         yqqY/MHNVHHcrqrsBVV4hiH14ll1dSRuRRpYcd3SyWilnYn8zePI/Vl7zOWz+kCF1wbb
         EeEhDf2fk52DfC1Wu5iCRo5C6mapDi4Em1QYcbkddR+mPF5nMst1diPxQtSsZ58FmS71
         1JuALxfo3x2fHKbUzLmLI9jDFCZk1bDfj8HPSY/UiBJysAmjl8/ik+4W8YVCytwhuaB1
         BYrkv9+XArjNksQPCXinggDGb++q2NDtR/Kw/zLO3BTZ4GwatON+X3A0S8j77ZGYoC8V
         goGw==
X-Forwarded-Encrypted: i=1; AKwUvBw/fhQxvl57xW1sJQxclx8rz6K5I5wHyxehbhfb2SDMnXU5mJ1v/Gfw7ctNsnF2PFhfffRx6TaaUozRs3c=@vger.kernel.org
X-Gm-Message-State: AFuF++mWyctP3/t7GfJDVSmfo3a0RmmYph+qZAwDVPId4i11vmt3jOaU
	GlzXed8uatbAQl+B64YxD7S8RXNtrqtyGj6A+85tXzl0P0Sva+mG/cQ9
X-Gm-Gg: AYBFou1FpN1AetDnZVTMgADI88k2UKZqdhyFEWQOS7hW0bPUWvJYP9M+bYfLXnuPiob
	HQvvptwM8jKaL3OPhSAxgkkHpl87FL015+lOEeahUCTmEMgy5ETxHBnBSPrIlJbCcnlamt5l2PY
	/Vps7RoYZHOZrLtfLumrS0/1zF4eUztSMH/zFnTP0uXN9TxkkuNpk2NDS14do3NXcxpyfJUVJuj
	1B+Ek4YvL9NN1/nAw9esWl9dN56EUGaJFOQqh/d62syshG8QOMB7+5GU9iKx4FD3vySx/i9ztqA
	POTBB5x5h9cYwDp8ADBhysKvsEiEw1eH0olzg6wYA23yq0uAk/hCgFzpZHZph5QYdE+XuZpASbI
	xUPZFkGnJX4rmL4pmaNhA2IFSq7hGErekgTEQHPM2xm5YqAhWApPzUCsiaD8xtRih94OZu3O7a6
	2oPNMz9t2m2z5SlkcmCbMRucWkDTcXoeU5AgHDnQP576Fyi20uoR6mF087L28o1DpN5AtINR4h3
	9BzeBsbfJUffYh71oolqH9g
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr36864640a91.32.1788845181942;
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 01/10] net: llc: fix repeated word 'all' in comment
Date: Tue,  8 Sep 2026 10:55:53 +0530
Message-ID: <20260908052602.27497-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'all', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 net/llc/llc_conn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 260460d50f54..4b6fe9a473cb 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -193,7 +193,7 @@ void llc_conn_rtn_pdu(struct sock *sk, struct sk_buff *skb)
 }
 
 /**
- *	llc_conn_resend_i_pdu_as_cmd - resend all all unacknowledged I PDUs
+ *	llc_conn_resend_i_pdu_as_cmd - resend all unacknowledged I PDUs
  *	@sk: active connection
  *	@nr: NR
  *	@first_p_bit: p_bit value of first pdu
-- 
2.48.1

