Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673610;
	b=xsAnOg4v8fk5kOdHAU4FkJZUh0YjH68mv43wgAxBIqPmxXrXhG4FLWGTPJpfLMiHltfI
	 IKa3k4hHYX6a+sH9k2+/LjU2qv8+/Xv6G24B6QOdBcpQec4XNoXC8rXNKMfq/ajCsyTMO
	 xeKGOScPnehjqFB/B3xx25xc53wJzmuSfxDQwggFWyidLCznaQJkExSOMLkbTXfL4d09u
	 0crxM7T8jO6ylwl6msiID4rTKq6zMjkovngH9JM9NH3n8/nDrgf+VnwzbPWRJ621U5N5M
	 /JHkg2S2pIUdHnF3q8vQyabV3x1sLS0slqiiIAHbldpT0BLWXYIxTGVjF7bkmRSo27A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
	b=S03D4gNkk49+dWEXaQOrB+wRetkAoEOZhUBKBpw3RJBqrsjfb9ajQmgymPLvrrpPUmXc
	 WcjpTP7DoCW29tbkVuyD6dOmdfafTxoa/OyOP4XKtuJ5hwt8DAYBNZKSmHaRVGL1QCxqH
	 HtLN0zhGCDWNTWkk7lIfWeOGFizvFM5FoF26+o3obNQCODbme7tg6wSvuI381pxwZmbrf
	 mqA+1aMVY+8NJUBwTatg+qCRFTpk2nlWgVbVQdAfkoiATHi2/FQSH9SG0rh/QCfrbn5iD
	 ncAuijHIZKfbECHV9LwYn+Kx5Pm8wgxYl1D9Ujv3kiu397xsdzgHvfX2BTmZdLG+Hlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PE367vk;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A31606A8A8
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A31606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PE367vk
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1764762a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673609; x=1795278409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
        b=0PE367vkhMov64BmEHF86qirTh/Zmd0NSzk3nADN94n23tbjdGS+qcKsgD5PGI3qnx
         yWS8iMxIyoa7AAlQ/E37sXKWDZ0+MS9yIZjfrfdMjNC0Thf3pkkl97FYGRClRhuBLLzg
         rXhivnz0kCOlq35pKwouKf2g6hOCQSXTAqM5Y/YWkXGv5wB0VXPgv86XY1C/3vkGX1C3
         UayUE200nbgk91Nfnq/GPSxl/SWuSLMWf7Goo0bAmUTk0fUHufyu5eWQF61zNx+lw+uN
         Ar/i/zGogt3DIeWHK4PF2jWmZNM/Jrz4VMNNfHsc+sOwaN0k9om0F8t0CLzw2J38YpEm
         ZmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673609; x=1795278409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
        b=peo+6ARxjtpUBPz01aPeDbXa3jcMP6yfuguD5oxAfTDyFQ+Tp2Z8mZwazpGOvJVySJ
         7TGSxeoIpD03wqpsLMAWVMujTrwT82uQUmYsJIK17COsOfWkPove6+pTLqZVh2fo3M6Z
         0MGZfzFCtGyH3dSe96V8Zy317k63+o1Llx8nNG++n/8pf1lZdvcwPOg643fP95GWvaio
         rk9raTHo0dwts7Y02APt9lrDt7el5OvHjyie0h3exH6TDq6aA3kM1xHrX9OUBXQgoWTD
         peU1jJHtXdT6txolgfdxh2iMkLTF1GT+IiB84y7lwDmh9q5xeJTYk4zUJGWxHIquqOgC
         W2hQ==
X-Forwarded-Encrypted: i=1; AL+hErE3S+2y4IlX6x9+PRkAGQwcryJrNr3Ac59gDbqgXNCKyplFPNwnf+LfL/RPRknSpGROt9LpG7+36DBO/Xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XCEqTiuNZBMgsNJoZwkE1/Y0q4x7x6xqsZTZqg5Q3r0/f8r38
	LaIiSSv47/GYl0WhHcKPlkIJVZo9jPW/ePTAKDIyJvYverrAUvx5SOEf
X-Gm-Gg: AYBFou3f+zi/7PEoUJ0sL44YXi88WyPwAJO8Kv8LCugfDx4Z4rbpeW5yNDRYPv916EG
	6DmEoD/xlMcDCoofRfc5Tsh87CmFqzpadkAPYMs8u0F7JpUgea+eVRAjJRzVBureUVsKzi4D2sI
	J6RHzYGShN+KjyNGhbuRFrhoNp4aFgNKW+5Gh/BWG9U5Gt/0gWYXxg+kIM8+vorly8djDQ4L2gj
	BF99j5WShWMbgPvD7OJZQhd9TGL+2Ja3KfI5rPl02E4T5AAl6X4+JxII/sRkJc96ouSFshXkC/D
	A4J2wjSphU0ua0IrMQOu3XNyvMmVCbAW6cEY+UFgujKMQWXSG340B985CzzRZC0Ynv4MPaWcv2t
	SdFXX8tg2L5Db+mxrOuAwSPSRMB16HNriI46J69Du1MEMY0hKUjLnofZLCpEtqsM2eo6M9MUn8i
	a8as5PHwCopcpy93zpx6qWzxHf8uQ9w6s7qBb0yI1pYJiSpbyGdhzwpFGWoGrYciRRduQAGXWMe
	ppXQRiBsZ9hQabGaM6W2BknMe2pyhrTZc3i4m1R9e8RlL+AIM2tzZlWXeebSnpVkwumOcGuCudv
	qVDRXsrawexsF0OUo4U/AUYlXJ+Bj+HXNKPn4ffBxaHSbJ5JVozEaTndmUaBA4UBzB719+segtw
	cxi6c9+7zMxzOqP0EJ/sA959AESiNrYs1UA0Zy3ppkZHb4XRleTFPHrJr4VfqY/7CJ0m+qshqGK
	gzetmnwTF0Nzk5T1E8BDGifVyWxIAiIKh8xrWL3dhf
X-Received: by 2002:a17:90a:d2cf:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b1b0b669d6mr5757395a91.10.1794673609429;
        Sat, 14 Nov 2026 08:26:49 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:49 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
Date: Sat, 14 Nov 2026 16:26:32 +0000
Message-ID: <20261114162632.16346-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
/proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
observes a dead peer in send().

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 .../selftests/net/af_unix/scm_rights.c        | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..19aa26c60f3b 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -395,4 +395,79 @@ TEST_F(scm_rights, mixed_lowpoint)
 	close_sockets(6);
 }
 
+static int count_scm_fds(struct __test_metadata *_metadata, int fd)
+{
+	char path[64], *line = NULL;
+	int scm_fds = -1, ret;
+	size_t unused = 0;
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
+
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+
+	while (getline(&line, &unused, f) != -1) {
+		if (strncmp(line, "scm_fds:", 8))
+			continue;
+
+		ret = sscanf(line + 8, "%d", &scm_fds);
+		ASSERT_EQ(1, ret);
+
+		break;
+	}
+
+	free(line);
+
+	ret = fclose(f);
+	ASSERT_EQ(0, ret);
+
+	return scm_fds;
+}
+
+TEST(dgram_disconnect_fdinfo)
+{
+	const FIXTURE_VARIANT(scm_rights) variant = {
+		.name = "UNIX ",
+		.type = SOCK_DGRAM,
+	};
+	FIXTURE_DATA(scm_rights) self = {};
+	struct sockaddr addr = {
+		.sa_family = AF_UNSPEC,
+	};
+	int ret;
+
+	ret = unshare(CLONE_NEWNET);
+	ASSERT_EQ(0, ret);
+
+	create_socketpairs(_metadata, &self, &variant, 2);
+
+	/* 1. Disconnect via connect(AF_UNSPEC) */
+	__send_fd(_metadata, &self, &variant, 0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
+
+	ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
+
+	/* 2. Dead-peer disconnect via send() */
+	__send_fd(_metadata, &self, &variant, 1, 1);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[3]);
+	ASSERT_EQ(0, ret);
+
+	ret = send(self.fd[2], "x", 1, 0);
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(ECONNREFUSED, errno);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[0]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[1]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[2]);
+	ASSERT_EQ(0, ret);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

