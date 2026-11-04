Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826538;
	b=M/ZEU5wTotd14W8ySEaZTr22vSJTV0cgp1jap+II3r7aE5q26uILFQC1cIqfx6GFGskU
	 AqqriJFXDou4Hg2pHCng8nysOOLtlzUm9q7jPrHmi+m2MpGIVaYjF5xPjjrXdVl4EygLV
	 H79NiAkoeP+4qTo4XH/IfVakJ0+elyi4mMP9agLSyulN1cQQMt1/TZpYnsMEnVnMUn91l
	 UVnaJOvbl3rVKBn/5jv0uTnOPn/B6j6QC4bPiVew+2iwafbxCQyOPnALTMsPYgCkwO2Ej
	 c7aHmqEsHC/UQU7aupSSPYb56tqb25MDCaxfIWU1v0XscgPfRQqT2vnpgSwoA+VZwSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wx4pJ0HLwTbcqPJBKfgxIdGigPrVHgc2rJS/1aTbB3M=;
	b=KWsb8EviOEWnFM6+9rzdcUH7suZjqYwPJ4JNsKIJCQcMTz0JmF2Yl47CAYKvG14vOI0V
	 bFtSlFbfuoO91gMIYC6Xrec3OC/SefAVtn+J6NnQFtY1kdcW/BwJOrOGswImg69Wf9xCG
	 JmK121jwdNa/MbPjSjqp1LZNT0aeBkw3IZunWRNiR2HdIOuHMsFui4HtT4gtVFmrcbe0e
	 4XFCfJ/dBUJ8OZ0X3dN+1MygIxeokTFSiGF5ivmemWM9jA8ih9W19g+9ssc34ZluI0+9d
	 XicN44lquUhG+Q0ewj4VyE/hZz9E9EHrp5e9YOqEwvPip/PMsALX6+/4OjQiKhPjy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPZq59FL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86760607C0B8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86760607C0B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPZq59FL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so10731285e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826537; x=1794431337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx4pJ0HLwTbcqPJBKfgxIdGigPrVHgc2rJS/1aTbB3M=;
        b=xPZq59FL/LdAYt2ofE6opelD2ogyAljWJpR29J/hfD1ormxa7z8JKZcsOg9mr6VZa7
         3tgPHBX2oJFVcOb6FJ9kifHIO85QJrmL9rBMKdXWdFdGj//Je786Eb2pGSmf17K5RDc1
         h9rTw9B+LvhlLC0trXnS/z6K45j/yjtEmYiSn183ZNwbY6jJZ7ZtqtiRnzr78oy2lMU2
         NP2Dhj1+g1srRraqIxb8IdVpDoJPaWm4CDumcKn/t0n10pJERunxGr86/12a/k6Ebvtd
         kY0vwD0EWQ7kE7JZnDo6/5BrlJFBsdXi67+l5RlnPNgAYz1dNTr6t/7zgnOTrrLOOiAI
         y0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826537; x=1794431337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx4pJ0HLwTbcqPJBKfgxIdGigPrVHgc2rJS/1aTbB3M=;
        b=o+Yl26CBLewRXpg7aafnbBDwcaAVHkTRekOHsMMCGZuSjjEdex01EXuwMznvmJlVMJ
         ezT1bI8c+v9Va2PtWWY5HDxsv3RY3GTyoywOg1L9TyNkItcvx9S7HszEsyffAuLpP50R
         BQWiiTSwN10toM6apYN/+8S9vPeWhqKoDNq34nfN2O60CWo6Uwbi1AFCkyCoSJjqBTN7
         e0czo1nuR2bWlHBYMZRaB3NA6g6pQYnGc2kj10qDopr6roBDRsY2QWAvcKknoskEIeSj
         Rg+q2Rr3VR7J8CAwCftW97wL+uHj+LMIj2Xjfj1pv0InFLiWRP1r9Ljyhos0+6zr3Hy4
         SXXw==
X-Forwarded-Encrypted: i=1; AKwUvBwSsJwM4yJPbiVHsUO381qpc96Cg9wMMrtVk5kpqb35hlIjP1n7xE12rvOqdZp4PcuyMAepADNCRGKnQ6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z85+NZZ8688sx34X61ffDSCie+5H3aS6qvy4TsKKs5OibRvcYOo
	Js1+noXDLLhouOkeQF8WZ+jIet4oAy/hyJdsHOA112SdgI2Q1PXBR0s8
X-Gm-Gg: AYBFou0fS3VVrlGhwUlq0dHlT9fSES7fvWqdQYPX9x2AvJuOQd32YVnNMP3hrDt9XXe
	hAxJF1gggfVWHlVhWQcH1rytWqm30SXVFapMlu+LXCVIm92jfCpcVV60LyzbW6YFbYhBJ3FiT+e
	vsmD0dMhiGK0FBhXdjR7RnQ1NvmN3uy3zSx8qNig1A2QmTLclSGGW5c+3u6/XI1Xy0jhNE680iA
	z2aDNffbd/IZFJho8imO5UwLoIrjNrjxqnhvMl6Cotsz37rkZo2Hf0W9klFQM6qiJZ4T4sT9IW8
	aErn+r9EpY8n/W7tia1i6X9/wf+6Yk1bX6cjn2lDsYaI0Bev6CmXqY+THZVQ3YrPuQLT2D9kdbJ
	Fm0CfXwWBamd4eDC75t0Su9W+My3GVEpZY08SAEFjITxOG5/fxNWyNEQIj5ybm/op4m+wwOemfP
	RXpplAKqgDF0FrQTnatJ/t6PYS+oSPHBw9v4e3BGzYYe/8R3A9T+czAyzun6mOjZC0lV6rsmtCN
	1HQrGk4m9g2jVLqzZ2mat9jG1II1nNW1g2Ye12dWd6wx8X8SFSv8QfaTwRJ5qwf4egoj6sjpCxk
	k+wh5iC1VsEQnXRbq3LwixcBhx+11vaCMheReDHIxXv7JZuU9oxuyg==
X-Received: by 2002:a05:600c:a00d:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4ac185bc336mr363516035e9.18.1793826536887;
        Wed, 04 Nov 2026 13:08:56 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm10975625e9.7.2026.11.04.13.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:56 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:48 +0100
Subject: [PATCH v2 02/27] selftests/landlock: Propagate EXPECT failures
 from forked children
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-2-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

A failed ASSERT in a forked child calls abort(), so the parent sees
the child die from a signal and the test fails.  A failed EXPECT only
sets _metadata->exit_code, and a child that exits with a fixed status
of 0 hides that failure from the parent.  The child in
trace_fown.deny_scope_fown has this problem.

Exit with _metadata->exit_code in that child.  Do the same in the
audit.log_subdomains_off_fork children.  They only use ASSERT for now,
but this keeps them correct when a check becomes an EXPECT.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c         | 4 ++--
 tools/testing/selftests/landlock/scoped_signal_test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 4bea8c880a4d..502a0825d877 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -314,7 +314,7 @@ TEST_F(audit, log_subdomains_off_fork)
 		ASSERT_EQ(0, landlock_restrict_self(ruleset_fd, 0));
 		ASSERT_EQ(-1, kill(getppid(), 0));
 		ASSERT_EQ(EPERM, errno);
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 
@@ -347,7 +347,7 @@ TEST_F(audit, log_subdomains_off_fork)
 		ASSERT_EQ(0, landlock_restrict_self(ruleset_fd, 0));
 		ASSERT_EQ(-1, kill(getppid(), 0));
 		ASSERT_EQ(EPERM, errno);
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 
diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 259cdcc8aa5c..47307dd2e242 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -1090,7 +1090,7 @@ TEST_F(trace_fown, deny_scope_fown)
 		ASSERT_EQ(1, write(pipe_child[1], ".", 1));
 		EXPECT_EQ(0, close(pipe_child[1]));
 
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 	EXPECT_EQ(0, close(pipe_parent[0]));

-- 
2.56.0

