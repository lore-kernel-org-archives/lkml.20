Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008746;
	b=nc29BXQwUQL1FY9Q/uS8vhpdL7w8+G2bX34j51WfpfuMY6xUqnWpomcHUwqMHL57CwTX
	 Tsye8ofsRL4ylJkC3RhrGqAHQK5HKEzZiZ5IAyisjv1xY0bGiLrHF79iKHWpjFT/5SyWg
	 lccA//8UWeRCNTJFz056hRETIva4fEbrupsHIweIIqMG1WuvgMaXRtmEIz4BYOxzmm4df
	 NVmE0kQEJeW86Q2VW56g+N2yvXc82Zax71FKiky+955g6LlAv27Cg/pq7fVOIJaLTwsmN
	 XUS7clnB7IQ9EcrVIRv1TNxojraiFbf5y5hw9D9s53tK0lmf4oUyROnoUBvaX9CFmbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
	b=bUWduEQxzIg8WTz6QRls9CvRIVVLU3/LliXq+eHu1WRewGu/GZTaCy+43bvEwRhmfi9m
	 gaF58jSFNnD7lIovJi0sFkJUXDG2M5MrvecqMFVKgFx/l4CL+hoq1sJBQ+qpkL817DJYA
	 hlfzXFxaGxL3yPMqNXwcTXdYppqPG7yqrHxw0JA84FKBgl3SI/A85usoJBshU4Zj5JopV
	 Yxgmf+hwsMTvUtx/srgSMgxR5/GNJOy8hltQ+qH5OJTHtMWlfCpSep/s+tIWuCF8tzXR6
	 UEUrkTLqBtT6Ch/QQJ5blOOmq7qJsored4dAYQXps00DAUxdq0VqbOIqDPLO2FHix1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvKpTxkZ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C2606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B7C2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvKpTxkZ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so989792a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008746; x=1794613546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
        b=AvKpTxkZfLrKF6dsI+Te3PU0pd+p5S8Y8HIwO/1LC7kP3um+p85fybyChDQHUgYOsN
         /MDMEZTmqcw7Kcr/5Xtxqc8xVj+3CSzVs2XR8QdaxKxzrnM27+lHgkZi4ivXRpXp8jFE
         KVby/y7PL9v7fmM1XMYTNCkKjIsUBiYsfqC1j4dwnxYCPWR3+6QKCRm1QE7YPY9Nw5T7
         KGzzYvwdQCXGw/ibq3xXWfGuHoFqruyiCANHKfxPo/Npx77zxBkubd1ocdp9hHdyKp5b
         wTLsazLyvYi93bt+Lsmubq1thcyAldZmupsA1IYyPYPc/ptGGRW60t5VxniZu92XgrMU
         XE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008746; x=1794613546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
        b=Gkzve56XgSk6dX6HxYoGunFFKCgThaJO8+soYimOwu6mmDnCtKD4BM5jLX0No5iRKc
         mZgpih/F44o685OFnR4SlubPpi7RZ5Fsq+5Sl3EwqzA6nGDLeVhJOuurU+hiOHmWrLCU
         SI5Ew7vRJFBqzAcHMpYlKpjqtfrZqdda0HMRJ7AUol5v+DaMaE/Rj3+AvOKhnsKHrd5j
         0mzKHwDOG2FUwMnmV9uitdO3GaZa2/VWMPB/3m0F0s/sGDWYbXGqf36p4rHvO1CSv2Qn
         M419/ZUuxXddetlJNrued01Ii53E4kxyKqG9JnvWaw9xw9WlSxaJ3rFEKtVbPKMbIoGQ
         X/LA==
X-Forwarded-Encrypted: i=1; AL+hErGxKiTMnHXEzns07imQzM+zKoZAmZ3FgERkwvGR4HnyfwF6l81MJbM3k5LfPKdhBu6yIKg6cT+HOGgSsX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x7a6MHmIk+IRn9Egwm1Lq4zcznHiaPDj0CbcoPWtwL5qrFoHn
	GbH6pwMJu8QJ0QnxjpwLmrBfz2C2JQA0ZASvIRsB1FdRMCwAhf94Qa4m
X-Gm-Gg: AYBFou2cYLZ6fhlAF7kOzMDoEhV+7Icb3FqXOSQRZIRM/nbEXafKKbKMtDFX+xXhzWH
	tXl4fraou+Wk7rcg+JGBojXzOSRQS5lixm43+YS6ma1hUqb5WDIuk/iHRcahDyENKN+RdJ8FAOI
	SZ0vxbaONCjSRRIhG6gV22bSavUM8xu9uy/dRtS2uqwFfs7b4KinIucOcDvV3tBZVj+21CEoidT
	uyAEPPTV3o3wliAR87D/skQ9ru8TbXkeIbU/hl96ny2WYOrnSfv7O7miMFypXTp4FUrwfBbgf8j
	thHCY1iEzMghTv5zzMevA+k9ROu1mpFo3KqjLl6mnwngBKdOlqJVMLqid+M6QloJGAS4KH7YPAS
	P/ru6r96DMnG6vndIsb9KgSO7JTmuJZzHv3ZcunB6WPV1q+BFjmqUFkjKBx3VfexQq2fp8z3ruJ
	wKlTZjoLmPwcWzfwVqrrcH6Zxuup19TE83y9w2ElHMex1U7GhqUzRnsPeTy4RcGMbj9R25TLNGl
	ICaWqdLOF1Wrpo1/WD1eG3V2EARvIdTcsYLGWfKX4Pb6oA2WKThUjv8kPrPwi1xV0CCujAUV/P9
	2rtC1+kG4aEVPVm4Sq2L
X-Received: by 2002:a17:90b:4b04:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b0db6d2668mr3884714a91.36.1794008745732;
        Fri, 06 Nov 2026 15:45:45 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:44 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
Date: Fri,  6 Nov 2026 23:45:39 +0000
Message-ID: <20261106234541.1474324-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Documentation/arch/arm64/silicon-errata.rst names two Kconfig symbols
that no Kconfig file defines.  I checked every Kconfig name in the
table: these are the only two.

The GIC-700 #2941627 entry names ARM64_ERRATUM_2941627; that workaround
is a GIC driver quirk, matched at runtime against the GIC's IIDR, so
there is no symbol to name.  The Falkor E1041 entry names
QCOM_FALKOR_ERRATUM_1041; the symbol defined in the tree is
QCOM_FALKOR_ERRATUM_E1041.

The two rows come from different commits, so they are kept separate and
each carries its own Fixes: tag.  Both are documentation-only changes:
the table keeps its column widths and no build was run.  I did not add
a Cc: stable tag, as nothing outside Documentation changes.

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the
tree and the git history.  I reviewed the diff and the reasoning, and I
am responsible for the submission.

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

