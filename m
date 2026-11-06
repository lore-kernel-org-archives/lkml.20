Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009386;
	b=jWTqzqP7zI5pZzL4TWWUVOR7aPVOTxM8NMy6zM5ErqhvWk1Kh54grFMgbs07In3JE8Wq
	 RobWNjwbIqzknwKHhFJxNakX24wQBs773Z7ZW6pPlww3qxDEkEoFviAx0UOqFgAehphpH
	 nNUUYX70mhStrFj4rkrhq7uvTmPFw9IwdSA25CJkuu3RNKzsdT9s/itQOnbed+qlIXfwn
	 ZJ0EimBHRFs2q6lQ673ODgJAqUskSD7f/L8Q3pTGCfbWmzfNSdLMczIDsRIIPyrbRjBdW
	 QYOxbQJS37ZDL8knMyqI9rEhsAywJYEvU+/+m7z712HXZW9LwTwg/TyKHUaNXudfDSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
	b=Om5oGDvVHIJ3m9yZFaX/VJ5KpO3GtBRmGjXREmFXMnFeNolZ4Lkxf4Ka/cx7uMSPSvEE
	 P/giMQ3VHF89BI5YvC5r6pH8EY+x1t1ccfeRPIh7LkPKc0zKH4Kjsm6N0W0JCzNtTiujs
	 Qv+vC/cJtlJbVbwWXt88UPi/DPx6FboJhIMveQsiiIYN/sPdQWy+5kvg51+YNH2kZXf0Q
	 +DqQdXkHMaZfjPu9BNTvoKxyHAZ0wloJdnj/nxXoXL8tvWk4t2AVVW1SrXP1pe0rYIV8s
	 4/BE++ADDKyjXAHKrSKhi9WAFR0cJbL1go0EL56LsVCDojxbWu64Mm4Al6CRAa554qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mblKDokH;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD563606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD563606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mblKDokH
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so731525a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009385; x=1794614185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
        b=mblKDokHSLubiDUWUA/efr02qRXOAVSIL6WXu+Tyz03aBCkmGF0IQLkQ4zshri9ttC
         TWIJ/JkBE2NSTJNOEJLp4DmzTBN/Cdq/7M19Xkre7xHh0I4h27bYyu9hZjenLBLP7Xl1
         KNhFG0lqutu3puY08/eOgRzlS2Fkb9joLGdWJMxExERyQMdMp/fh+TRiaznv8/M+hV8t
         OoKDy9Dd3xASlc3XCBTVY8zNy8X3iCBkKTFjqCMgCyeqMzu4HCRGCM5gAX/7Xutd9IMQ
         uvporIWD3X4WIbgsCZI7OnzE19gQhIayPZQtBZSStgkXdMXpN1+8/Jzozz/I/PX1U5Vp
         o94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009385; x=1794614185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
        b=Y9Ky3aQieI2S6EccLFQ/bfHVBC6UMXqr/Nm8of4gXG2JkdVx/u1AWwKYXFanwZLrTc
         wl7XFfRkYAIQlLbvQBaTVJ+rh7HYpNlTpvKUcy/cRGdpfmBi9Q4F4Tf9Z1HoibCpJqNc
         SJT0m0pJ5uz8S9xi4kBTJzyuTG9M/sbQbINyIQxdQAj5bUhjh0VW1351nxIujQMqbyDx
         y5ECjsxTcWnfH6RF4QP0I02MwOqW4lHJQ2S+/mb0x7wjgW5fMnKFAM6PtctstI+a4hhM
         r2uaIAYRH3WaalpGkxCekrFhGQwvPptm9PbQokW65c3bcZHgH5P3hhvrN1Nf9bUBoo9L
         kPHQ==
X-Forwarded-Encrypted: i=1; AL+hErEUT27wNYGO5V/uQQBw7r93Rh6JV+UnM49FR2ME5vpRhRXvF4xO2OfmH7r4AZAOqzFH2hBg7fdN+Y7/Y6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D4kNv9rvfCrl4wRlGf30nQHUimgrK7+bQc1fgNrPsRpxJIeV0
	p5U28sK6KuEiFhduzyTezQFYv49eedej7HX9SCvJBHtzbqnPbJChcRNL
X-Gm-Gg: AYBFou1zHQ7X8QlbbzrwJPaa85Km7Juk7iiSaDJ9c0x3Eh+/aFCf5BDq+tJPBQc0e0R
	BT83rWCnEL7R1aC+VOb0xfhXcgcHnV0szaxbMHnuADAWE7czNeBpM8fQijawnzKHdRg5A37oSmB
	pmQRzR9aOc7uQfBxzn+w5GSvfDAK8K3ExxkCYrtNxLAuZKM9qhoEl+8zGHMgwdej6mZXe96Lu9u
	Yhgtc6trY3yTgaaI1KL0LDg6rLmNJxP/V+/KG/QJDxrnCQFE8OFu1yPM/xJnOsMleifJS4+UMyF
	Bw0oXeL8Mrv+2pYdlydGAsSSi2C+EAoRlcnJiJNS3aEa+/w4oxW55I1HiYtX/VhegYpjEBxs2/x
	vEaY7Tngmgz3itd68wv6KkaDlaelIb9t1RX2vXLHdNqcDKKng68VJ2lFvNPMl4qa3nRUc/baQKI
	283JEwO3rX4h41t6xn4nh6Fo6WikjOcBt388EEf2HG2kLhmxAbPvEoqO5l6DsEABVCyHKGOOgGi
	zXEFVMWVEhLBQsn+RT1Gc0Dre0ai1KqvfqvWLl/NxjDmQupY44TgvJi9DjJLSqN5aDbVDp6ZofO
	Q6wMV4hU2v4exC6b2lhS
X-Received: by 2002:a17:90b:530c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3b0db6f4c26mr3934488a91.40.1794009385039;
        Fri, 06 Nov 2026 15:56:25 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:24 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: errata: Fix Falkor E1041 Kconfig name in silicon-errata
Date: Fri,  6 Nov 2026 23:56:16 +0000
Message-ID: <20261106235616.1533003-3-takano32@gmail.com>
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

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol defined in arch/arm64/Kconfig
and used in arch/arm64/include/asm/assembler.h is
QCOM_FALKOR_ERRATUM_E1041.  Correct the name in the table.

The E1003 and E1009 rows above name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009, without the E, so a missing E in the E1041 row
looked right; only the E1041 symbol keeps it.

The Kconfig symbol stays as it is; only the table is wrong.

Only the text of the table changes, and no build was run.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afea5e57ab95..f554fa04662c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -360,7 +360,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

