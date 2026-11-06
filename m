Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991343;
	b=gEDzm1xqyiZ9By/8/bFBk25qExDBcKSqFrsD6qZdJL1hlbAJ42jKyiXi0ErzbAypwtrP
	 7jLBGJztgrFLRR2KO9NJNICHi2ArK4vW/0JDjyPpW52qZkQrFOljHrIo2NtHbGnjMTIT9
	 cUECeaZUAplLY3CwHI1F39+fMWqOPElk3bFR67VRdrwrlCH4gOdSZE2p4gU8KxhOtBEr8
	 NqOAxh0xX2W4gWHdEHTNd3OjOK8yuodHHSqHR+lA90CVLNm2L7te+Zh4ZUhi4L9kxweHQ
	 vQYtxWsxKMZc7c0saHws/4QzBSoc4zYDSx9bd+bWRix4Yt09iRCu9u/IFhZXwuamZ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZGyxnJnZbbXGMPkgOS5KrZfDWbz6ljrwSXVVr6mtPoc=;
	b=WeFaEuFL7nf1TfHIPxzhLgH60C8SiP2fkHWirfxNtxtHYsq9z78Wju5qVPsIdNThihTD
	 zFvrrv2trjG/l8aD9xTIRyhxZrImG0G3d3lW/P96o4sVRa28yUgCefG9Bjmrv1w5TAkEi
	 sYFpc2QYE4bVMKNNlvgCQmDHYVKCqIJyLrQdY1eTk/WwtvyFvbPfjhbPeJxIIM0wrvgRj
	 UH7YSDk+E1cQxxV22jDgW7x1YnSZk4KgtECSVgTCq0ZfQJSqNGF8aG6ll0l9/P2o+2kN+
	 F32V+RgVgAr9qgBLcYBs3qjyfOBEhfj9ofxqfgNth6JHtjJk7GTK9p4X+mZ7R2vWJ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O64ZZ8O4;
	arc=none smtp.remote-ip=74.125.231.202
Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB38606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB38606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O64ZZ8O4
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4f742fc5d09so231168b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793991342; x=1794596142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGyxnJnZbbXGMPkgOS5KrZfDWbz6ljrwSXVVr6mtPoc=;
        b=O64ZZ8O4Otw3jQgY45uKa3s7MDVMBUfVYcPhZ0dL85m++Y0nU1g2lW5fpiMjaCul0l
         SeKRwKGkTwguv59Rjil8siP4CjPFaWgDeN217uY0bE7ZfqG3KF0p/e9TiYdja2PjsybD
         nggmuNsFpbjXpdot4sLXJ6Qd1D1gSon74JuxLtcx0e+hpsx+c2/CFEqHp9ZWkZ82Iso4
         uWwv1yEwR5S9GKxA5XlfjzJWj5Uhhs2kRmGBHZ9ojPs7DfYcpn7JRmATCBL/SDt6Y5mO
         94lqsgPIpDRe/DONK5J6RyWZUC+ikfnGzo9aFEuB/Nya8u/Qp6OoUbnApbcknwZMEyhv
         ZrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991342; x=1794596142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGyxnJnZbbXGMPkgOS5KrZfDWbz6ljrwSXVVr6mtPoc=;
        b=ebl3mX0by4l06+6QkJ6/i5BA/smR9LG+gKGBbNmy0O7WeJcm20Pr8Xkv6korhUmOKp
         IiFV/tSFX74jqqu3RuDtesWdh7wTVLC7QS72Y0mJ11Ba7O0SqyQDA6E92PYA2OYflpRE
         1PiaI67qqVCRru+W5YtnOM+hg/8RMWov/6dyFvoYGifLM49aOzKogEZoORUYTLa3jSzI
         MnwD4L6X//N9YCEG6o/j5XwQPwhy2zrXzN0euj9ug3wdthm4WTbf66vXGWSTjNyEFZpT
         JNyk9AjbiWAdFk1fo1h/4q2u9i+zbnDOshtywTRZF0D3Pmn8G8GShRD5IcQVCvNbTSfK
         SHZA==
X-Forwarded-Encrypted: i=1; AKwUvBzgV0RKnYVAuV2lttSo+QD6NKNT3rGBTczOdTxn6/gssVfKfSXmFQR6iTSKyVJarE2Puz2CK+f/2sff9Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VPWfG+tNs4Wbddx9YE1eBfzQ+JfkEI9Iavemr+yC5UztQMjra
	DZZcSoP3GMC2KQooqBBIQUkhA5wLYr4queb9U2KShW2YSRaP5u7/oToZ4gr1FjT8sBw84Q==
X-Gm-Gg: AYBFou2Fq8inzQ+3+BwY/6MbDpiSGSewXEPkErp3kDPFNS5JZBqdI8ogEHp/1lJB4cc
	9wXWBCAEwxCImpqCPkoLn2NTdMkv2rrFgHToITkL4SPKBeC5OY2U8j1PGNVtLx8bJ4ReIKFykIg
	0z//p2IxpEX/G4R+iavu+BbCJHrEyNoBaYAEz46vMkVS2J22FqZNOggP8wDG0MyE1jWBcMToXS1
	RtPjWdKqI1WW6OlJRghbVgEt5pzNun1sbT34ZjAgvj6N5XbbkRpRpxsNwzRL4Lspx4vh4/UYSV5
	n7kuVifSAYNWSS2WVX/53ajsTJ3F8Xwj18IP8/QtL0wf/CvyEQ0xT84128tI078sAf5oqghsJJx
	CUljFsKOc7uKP/Wdlq340eqLrIP+4ASikUlkUTQ+L1fn1hJ/6whM6gheoBg/dqLKUAfEADaujn2
	JkE748Q9k50b8y7sRnJio/JRLLQPaVyuijThI7iYFvW4FuGcaJ0F2BM6YYfNCGysw49ShLcOYup
	Yk0/DqBP141+FdKD6PW6jCwnjW5VixVpmFbldc69h68GVv9BIb/kUDFLDdFXT6GIQlr0aGi9tzJ
	VXy2w2TyW2tboGTNUUma6XWDt/fKn2Ub5ji0xS72NAuWg9tlst3PK5iJjpfWjktyY69k
X-Received: by 2002:a05:6808:10d3:b0:4f3:36ff:e521 with SMTP id 5614622812f47-567e13f9a5dmr2809962b6e.58.1793991342161;
        Fri, 06 Nov 2026 10:55:42 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7e70338sm2162164b6e.12.2026.11.06.10.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:55:40 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: john.johansen@canonical.com,
	georgia.garcia@canonical.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] apparmor: fix out-of-bounds read in unix socket address audit
Date: Sat,  7 Nov 2026 02:55:32 +0800
Message-ID: <20261106185532.3338123-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

audit_unix_addr() logs pathname unix addresses with
audit_log_untrustedstring(), which sizes the string with strlen().
The sockaddr passed to the LSM hook is not NUL-terminated:
__sys_bind() copies only addrlen bytes from userspace into an
on-stack buffer and leaves the tail uninitialized. A pathname
address without a NUL byte within addrlen makes strlen() run past
the stack object, and adjacent kernel stack contents end up in the
audit record. E.g. on mainline (05441d697f7f, KASAN build):

    BUG: KASAN: stack-out-of-bounds in strlen+0x93/0xa0
    Read of size 1 at addr ffffc9000287fe98 by task poc/1004
    CPU: 3 UID: 1000 PID: 1004 Comm: poc
    Call Trace:
     strlen+0x93/0xa0
     audit_log_untrustedstring+0x19/0x30
     audit_net_cb+0x3cb/0x760
     aa_check_perms+0x19d/0x340
     aa_unix_bind_perm+0x73a/0xb60
     security_socket_bind+0x2c/0x60
     __sys_bind+0x103/0x200

Bound the string by the address length with strnlen(), matching
the abstract-address branch.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 security/apparmor/net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/net.c b/security/apparmor/net.c
index 136d14226b97d..cc8dcc5bd619c 100644
--- a/security/apparmor/net.c
+++ b/security/apparmor/net.c
@@ -86,7 +86,8 @@ static void audit_unix_addr(struct audit_buffer *ab, const char *str,
 		audit_log_format(ab, " %s=none", str);
 	} else if (addr->sun_path[0]) {
 		audit_log_format(ab, " %s=", str);
-		audit_log_untrustedstring(ab, addr->sun_path);
+		audit_log_n_untrustedstring(ab, addr->sun_path,
+					    strnlen(addr->sun_path, len));
 	} else {
 		audit_log_format(ab, " %s=\"@", str);
 		if (audit_string_contains_control(&addr->sun_path[1], len - 1))
-- 
2.43.7

