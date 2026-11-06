Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009383;
	b=vqp7Qr5P+61vRrzSlDihLnEirwtvqHMd6Duc4sn3YgxVTZYyBbqsp9VJvSM8OSdSNpD2
	 trNTcBBgdHy6bQWD+qFihNSY2bKZ39sBDyzK0DwomT/eeJCY98Gnrs13UKSY1hJL2SXH4
	 /NbixTmnMqH/iT8W8SSSf+Tz6ngpZsTkRzuAhF3ebQwUa4ea7OFkqBb8iMgwJFLv1e8pL
	 DQG3MEMm5L+ZHAf7Pjq0A4KvMBfgfHudHpoCNOI5zD521X3Bq1YYqrHP6BNwGPEohMSbp
	 UG0SM9cest+d36OJiDYu5nfXRBuz0AnUJnIJ5zle1ak5pl6E7l/QGRjZ7f1JErDOWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
	b=A3sQbr3JHOFFEf22qFkj2vrGrGE2uSzmcwPIu4EhKcZKDnV2D8EErqEto8RTZxE584vm
	 Hjs9nMMylj3NcpCdzXiUCof+GyD1iWFswfMYQzHr94zJHM7r3HnsrAsqk7ohetA30En3y
	 eGReTThSsUZSFi9QKpTWBHjdhgZjGo3vo0TgdB9egaW+Ndm1GuRtdXnBDATKcw+2VxNbW
	 KRjLrxCPUYvVYlMlCaQMkAA2TPAa5MJ68J4L1GLPLf11sCGDD7rXIhGnCKqUFShIxjUfT
	 AtGXGqSNPGgw0MRB4fHhGAvPxvl2Ix12aXdlUjm5a8YAFAmh+1eN9qiToYKfZVEVYcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQORgJoM;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8D606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B8D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQORgJoM
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso962573a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009382; x=1794614182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
        b=fQORgJoMvYMnMUgWrF7PSo4bl3GM8XuDObpV/T9gO3XE0G0E7RHrm81nbJAeNKtxQm
         HuE6sX+5mpPyMXwdj0Xjq6VWx3u5H3x1uLtno/M2ctX1LvDU1oT7v/Xb+lAvRIVUZtwF
         KRsuOEZAG3ri45muOX+n7fESXmjexh0a92gD/4UfIeBVGgDzWsyKqtDuPjET1nVG8mOP
         2vMwSOyrvTtqjjUXHopqj7ZICooVderjc/kbrWckppCYgIGtGquf7IhSzW6TS2/diP5b
         XdlhLnJIyAiv/TWrpB0SCUEr7Yime1SeCu31F7sgw88yRKuKHUfqogXrZbcl1ZRdEL/4
         34Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009382; x=1794614182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
        b=y5iyhiYLH5uwSm7pQNBTZj1u0ArlEGF8ZN699o/CEUrvylrMI3ZmRNX1Mho83Eup2k
         0/E2ZhKMoi153pxQ/r8H7nT2Z8D2edA/wLiPbW9G/IyQkY0FtSrt5uBugAYQFXNJAXNc
         c2Xq3JUDI/wZAeG6aoghjJgvEbawiwU5ncEauHCt9eSLXiXjISLMUh2bGCjUhbfUAoMJ
         bIfTwxdlXU+r13nITERhqrb4UvX3KSGBotyWd9wKKdLEVoLul+lXZ5QrWL9JNptJDmk/
         OP5IR5MlUBxBmudBC9YcV1LkzQFtcgHlgUfpMocOt/TwtRRWil2ROWVJR5VhuItbAudQ
         JK7g==
X-Forwarded-Encrypted: i=1; AL+hErE+fClK7Ns8pY/RfrUqyWSBt+EH5SXoritrQO8DuUOAFUIXQNNxWYF6n2grCKB3js6dHlDLXF8SAN7odC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+7la8DJuvP1zicHzCfZTtJxDwB3QcnANPh2RtcmMAUWW1dd6T
	pjIPNtxt23Ogifa5NRuGW8DiKr8dz0zJbEdoYz+0CKtGx1h/IhrLqYp0
X-Gm-Gg: AYBFou0AMeQzhBWhmLM00sxqJW9QIKWF175stnsPRhQNGz/z0/Tb9qC1YGYcIeye2tO
	FierUKyruFMQC91No4KREnYFfaL7w6zWkGgzq99k7UO5Ad+eWeQNoT35bdq2zHOaS0bOGtR7TeI
	aLmu7GgE9SH36Al7tVTvjJ8Y8peYm7z6TX/wKO9cCmi1VqyfyTM5iY8bIP7jc4dxLQLfgzfNL3X
	okfEijZSNluJJjl+nCjsR9qcQMXbdEwB5nBNROWkDPi1kBIn5T4O+UwQh7qxtRgYgdTDyZyUTJD
	xd2Wq5Sz0r4DT44wBUvDoq3nEoi/i5ngCcgdSSrlf1mjRqY63klRjUyTlUCs68ruzc23hXW3Ht3
	4F60XIFueF9j52R7EDKbnhhSesI0radk3iSKgkg4it8jBXPSxAOU8V9U5RWbmh18jRuGYeO6EmQ
	+XEWDeXCB4gcpYkNgFYuj5iq1BjxRobn2RsoMVZqfWi79gQcpJ84JEnceFvOLCEM68X5wloSiz/
	3/8Z9EnX+C0nhbqoWvMvjehJ2pYnF9EG1DkXRAEfPdCSS8Lfansrr04f0/NSfNXUi4lxb/1hRc0
	EHboS4ekhazpovkFiDOs
X-Received: by 2002:a17:90b:1a85:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3b0db6f8318mr3721226a91.29.1794009382537;
        Fri, 06 Nov 2026 15:56:22 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:21 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: errata: Mark GIC-700 #2941627 N/A in silicon-errata
Date: Fri,  6 Nov 2026 23:56:15 +0000
Message-ID: <20261106235616.1533003-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it, so a reader who follows the name
finds nothing at the other end.

The workaround has no Kconfig option: irq-gic-v3.c passes the GICD_IIDR
value to gic_enable_quirks(), which matches it against gic_quirks[], and
gic_enable_quirk_arm64_2941627() enables a static branch.  The table
already records workarounds of that kind as "N/A", for example NVIDIA
T241-FABRIC-4, a GIC workaround like this one.

Set the Kconfig column to "N/A", as the table does for workarounds
that have no option.  The row stays because this file acts as the
registry of software workarounds in the kernel: deleting it would drop
the table's only pointer to gic_enable_quirk_arm64_2941627().

Only the text of the table changes, and no build was run.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..afea5e57ab95 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -279,7 +279,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

