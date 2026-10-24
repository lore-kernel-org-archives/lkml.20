Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833734;
	b=iUQka3uZugkFilHHA7XuTOhjltrxupU3rY+JFldPGQPG+GQ5uWXHJhSu4LmUbTwGwfWl
	 SUVSCBZ0gaHGKwetMQcLqmjjcSi2hLpc5cQx/imUHlskyf4qMe/nsRUSXXcAtU11qVJFa
	 rM0pAFGgf+gVdDNtLDGASODJ2FDGLpD02a5FT2bhugKfvY3oDIeH6QvU1ysmbbb0vgS88
	 GEMz5w6KqJTf9fszTKxD+2nPG30MObaEuDojMb7tYnwo+o3sIyPuDm3CV9/34bRerH1Rg
	 zNbtYOsmXoQpSqIqH+rGIJMadw3IUBaiKm9O1JttE0ra4VvQeVCRgVxeTe9/57Hb7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8UxGyEsK1TTsAs2PHw++qV37HG8gWyYxh3d4UgtmYeI=;
	b=safGXzgNRe04RzxliBu/1DA+aIMQkXxV3NwhoSqBXgw3cBZ8AGLnvyi8swvQQ/1Guuji
	 69foaMcmRnBJM8Ir6Q07GHmds+wztUu4ip6N2/Zad5PTwfJBLLvsbzUK6/jT/VStP053v
	 ybJbMm61SaW5CeGH3+U19S6y/yIKX1UzkrgoN74/vjzzsCNsFcSHBuI7bSQ8aqxKB8fgN
	 IYLelRmd6QE+MQJzbDwiIUdAaCwZC9chUfhgALwiM3Az9CyqbwduYYVMg2wvPy/up8Dri
	 3bY5JU0OKS72cPMzIxH0GXJgveRYzSCHtp+fqnxLUZBa0lBrY7Jy9Ag+5/HRfqgk7hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VIVBw5YE;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C6606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512C6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VIVBw5YE
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2838556eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833733; x=1793438533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UxGyEsK1TTsAs2PHw++qV37HG8gWyYxh3d4UgtmYeI=;
        b=VIVBw5YExjWrWshHNOja1mPDl9GVcKFeCW5G4JzxHEdrkh6UMMa5vXqdeMAQfb199e
         fu4npVYSgHjTCaj0199ySkA+V5q3aFp44a5ONE+CNSIHJ0HdM42hGuRYdB01bRlGYWI+
         n6fFZg/lrAql8dVXwakkRPSDrz2ckpxd4x/jdPH7hZbC+aNaYuclDdQBjU+AqtuJHU7R
         Yup973kvML3rbwmZrrAVTyOmIkP5CMWfpU6BP05Uwx4M42y6C6vIFEUH7MljnqLJpzKG
         l790qcZpwTQrDhD7bapyOQOivtnHmmenfax1gD+8yqmXdFXWsa3yh67E3uBKHv/c3n7y
         V57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833733; x=1793438533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UxGyEsK1TTsAs2PHw++qV37HG8gWyYxh3d4UgtmYeI=;
        b=Ugvc3ql3fEcZU1L62U6tAa/jad7X6ocX/eqSopmz6fmjCgF5BQLZbG98ynaDE++p+S
         k+79FouEw03spX5brId61NT7E4T6ZRlntroIQgjwVXSmXYzcUIgHX+1SckJaYDbCQXdx
         sDw1xwPXXNWDGMu3JfbKqcaT1A+jVgFcpCcgF/FzvLBstYSHgMHpsyCn7wkw3cJlg0cI
         78wBI9j5q96OgDWKFKPXHSZgrXe4Bl45YrRA0l4eYNhS/zOtKLOZVagoNmBDc73QtKD6
         m1Wv4BpE23jb1D+OydxnioDfjTkJVXpUJkq9IDTvcAr6ZwPNz/FBxseB6uS0UY7o7rZI
         Fdgw==
X-Forwarded-Encrypted: i=1; AKwUvBzH4EVICTqfk+eDudA4bDYP+2u5laHXPquCpLJuo1CO52rXyxKYluK1p0NA8uoG86xZFfyPif6nl5rLQOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwyA46AEGknKtcxvH2/1SyXC7fD7HcYJWq/FpQZ3iDBZNbsN35
	4NboxDO+qVBIDIJg5XITdZSKftfR0J9mpjD2lyiTOm1xuJgYCE3a0Zmx
X-Gm-Gg: AYBFou3CBqPusQPTJ/vIrez6+HK37DOT8MDV/WJCqPLXZnwji3q05ydNcE79e3LmwRZ
	++MwFHJuMSJGc0u2RlKXBMBnO7Zp2Ryth3Vtdlzpxs2FQG5NoKRTz6oauu2c7fTY2dgD1+Ln1x8
	tm6nbQZkMp/jxRbvrXTeYxLUe0BSb1YBSwxB06BvwBaYHAteyG5I80M2I1i/aRmRfUyZ6qsGbJD
	Pm6trEF8IgnemHkiAIXvjhZQYgrHUdmA6SdT4wLRR36oV9lMAHAf76N+rY+8X94t8sIKoFV6D2z
	ZNh0Bo7bhVWrEGqWmnt7sLoxcAZ0dFzBdSCnhXgK5hfpIOve5rCgz2M/JwY+Dq4lxCa/GWbe2zk
	JIJe5TPshllOAziX3PZ4RWGugwSFIi76/oGf8JVenuIX6E7NTdn0FCYaW9Y2DVvVTN6mEiZ0HOC
	kpRvo7RjmQS4yFPRB20hovr4VLma5MzBtCNSfLo6UUjgc4z7SnrhpL8kjMEfBU4c4Txp0UGypMR
	kMLSAsW4qR+VwKGc6J5aiTZJaYOTi1mHFgzGwsxeLkbX7wHRwWmc3dmBSX3KVYmWdtpoD4NYGpw
	5HvWUGwtSkBhTNLXxcTp+BEjQEkTUGt55ZcFhL8F+ymJl16MQZFZ4wB+DaG2VjkkAbQvyRDveUH
	INxFac+vdy+JBjFJrjNywz7Kg8A==
X-Received: by 2002:a05:7300:da05:b0:33c:e74:4624 with SMTP id 5a478bee46e88-369e84e93b5mr2335562eec.27.1792833733242;
        Sat, 24 Oct 2026 02:22:13 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.26.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db450bsm5108584eec.17.2026.10.24.02.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:22:12 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 1/4] 9p: fix header guard comment in acl.h
Date: Sat, 24 Oct 2026 14:51:51 +0530
Message-ID: <20261024092154.1844-1-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

The closing comment of the include guard says FS_9P_XATTR_H, but the
guard macro is FS_9P_ACL_H. Fix the comment to match.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 fs/9p/acl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/9p/acl.h b/fs/9p/acl.h
index 2d1b24abc..d123ab613 100644
--- a/fs/9p/acl.h
+++ b/fs/9p/acl.h
@@ -51,4 +51,4 @@ static inline int v9fs_acl_mode(struct inode *dir, umode_t *modep,
 }
 
 #endif
-#endif /* FS_9P_XATTR_H */
+#endif /* FS_9P_ACL_H */
-- 
2.55.0.windows.3

