Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517154;
	b=E9XnsDtWG2+fXmGsk7xTmHyvoAvTSClGzm9B2+goWfKkCcMBSdTEfm9oQ8AuXOytdBg6
	 Nfz7F2elZ6i4Mrfn9PNFEkDQYVHvk+pzR9NoQuHbjWUcli0seFpbYFY85pO/GDR/ammS/
	 rvWjcWrnIPtl0zL2UadsuGTl+8xRXnp5aNmFgSadfuCusAe97/RDp6uJSKnYUE+BGQlfs
	 a2mKsylazTNXXBKL4vDRR0C95y2Xso5jhi1nto00v1/NxYbKes2lsv9HmG7emxOSKPwkC
	 CxQApKVpmjf08XDOBkOCZuhl5rIRMPgCwBLzGWrTaLJbpnWHQwInUsgHhg8QAw/Yv7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMWSzfA+SfydjBoOKmnPHeymhURsrGIU8URLyu6ax4I=;
	b=gk5BShVNr3UQ6cPHZoWi4Vpnf02S42I9EPV6UdpY9SnQbrR9ZyscMzwijq8vYif4ZZI6
	 wP8VdTsxlg14IkAZPh5MY6dHNb+UBpKrk2TY8JUToeacShOUfDiDH2w3NvxZTxl+y9AWo
	 ZhJHmyF3HyH8oa96cRCCxue2ZbgaEXH6KD36Z44ypxTwLvSMlS+/DP/HzMheZQRxYICSN
	 7MNbiItMCA9e0nqDMT0BZBxUgIut0HcE60vrgIXjf4PRF+s+cBcvCSbg/o0Ui4sO6jxnA
	 agkNH8+XMrZwX+W2FvmI1NpAaUR8nqPPLuBOze0uidjdzyrZ5goDxzczxwakDRGmusA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nck9EktY;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E0A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E0A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nck9EktY
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso240865566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793517153; x=1794121953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMWSzfA+SfydjBoOKmnPHeymhURsrGIU8URLyu6ax4I=;
        b=Nck9EktYlqp3hm6Q9oarBwIBaZ8kcl8Dok2WFL+e1unEUypWzExPeJSnE8SVJGhKGj
         J1/70RnJR6ePJ81SalDqdLYzwj4VNivnSf1tqeuOUJaURgL0B6Xmx95AQpPJfgcKkpcJ
         TL7cARTIoU4d8CzDlfxuq0vXZ508X7sslp33zOmUQfOEhxEZ5UNnLv0cxulcR0HGyWiz
         Ify8d0TyotVEaHs5/lYek28+eOoHzPn6DO/N3Kos1bohzLGYxrLDbqhzXy9nkpwIalrv
         CnjB6AW1pvIYhF/LOugy0wc23So1lCg03um+keKEP8F2DCEwP8M4R4za1ckzrdqr/4Rp
         cg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517153; x=1794121953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMWSzfA+SfydjBoOKmnPHeymhURsrGIU8URLyu6ax4I=;
        b=HI3zB6ne0P+cT1Nmc014IwsvODg5V91RKyXt1ougHse/0B2m4epj2R6nVlXRJMK34F
         m6Kks0Gse/0tt36rVVNjONpg0N1FbByNVR/WjO+Cc+zESFMMST7L/pqjBUozjQ8ebuMx
         LwR42ov2WXlRbS8RaHqGNd754dtue5DrNGX72jRvMav1yGWOBxyMJrliDyrPafL69Mv/
         66mbtMOticgDY0R41j/Lo+gOloi9u/DRjKTmobImQ+FQBqajiqppbiat5/wQ5pl0C+MA
         p0OjhIPirmcXdm2+oOK4pfYe84NtvXPl0UOogJBscrBYJKQrZAtUL4m81l2aHi+T/c/C
         K1GQ==
X-Gm-Message-State: AFq9FYIZA8KaVr57EsR5MMXyGAahWfcckQBr4qwPrkurPpSDZNhJz13m
	hYXp79eDsWeWHarl9II5w73aYvSIMRKMHDeJj6r4/awwClO8EEBzNwbx8z6PUS6B
X-Gm-Gg: AYBFou1MLCE3y4p6WTJjqKoipPPW9F+VS+mdXGzO/Mk3TNOd6Uft9SAlj21gm+nvwFx
	SPAqRUFVhdMO61BAX//Tn64v5biKmwQhHMxgAL0Z1ihVi8NqX6MrziIFTBvqabXdnhvf0eiG5C1
	Qm2DP1k1HLJU8pe3QDRYt4c+mS/K0P0xHLLf0GmRri/B5+e7VaoNK0h1awP2aDKfES+yNhdMC8L
	VsF55PCRx+rLJn+RC8XTH/FOohN430UxWDRS6Hb5RMvTAt2Jbh41CRjhvb7sKnrBdbzM5IxlmmO
	97R4Y1SNHlcJHV+qeyjIdScDmuluUthqjctIzx+RXSx88UDWb4Rk9AEKIfdFm3XGHmHjS1Qf5Q8
	Pt8G0jkze3a7dJfWPwg0T0TWlk1fGn7Yuu5QDqd8MoO9pRGD8JtFt8p6T9tmrL9WjnxgMq7IcBr
	HI/jHSwGkg6ITX4KmjfT2dePqtLXj5B5Y01PB+fvwjU+B9V2j4H8PJ3FNNB0fp437xQ+JMpuMbY
	1skGD+kn4xAJuco+MI1fHzoRbRgQFzXNF2IjxiBAyX1Bo5KYNXtK+iRxQBuV/sO5qjeGu2cdtN3
	3XuxuUFabB+vTopPqR0S3pKgG1fuhOgU8ZJ2bdpJrPxFy/Yfvj4L7N8fd6EcbERO0YzFUZQMyCB
	KxUnhR9bBRTwGQh8xuZ8Ndj1EvzWSgEaZ47iurFRhS4ev+JEGzc3r9gi19HERUFJdsw==
X-Received: by 2002:a17:907:940f:b0:c41:61b9:6ef6 with SMTP id a640c23a62f3a-c4ca7a66384mr511411966b.27.1793517152456;
        Sun, 01 Nov 2026 00:12:32 -0700 (PDT)
Received: from linux-laptop.dynamic.ziggo.nl (2001-1c03-0884-3400-503b-37c4-84e0-7f98.cable.dynamic.v6.ziggo.nl. [2001:1c03:884:3400:503b:37c4:84e0:7f98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb0d163c8sm217214766b.60.2026.11.01.00.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:12:31 -0700 (PDT)
From: Laurijssen <lauserve@gmail.com>
X-Google-Original-From: Laurijssen <laurijssen@protonmail.com>
To: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	brauner@kernel.org
Cc: Laurijssen <laurijssen@protonmail.com>
Subject: [PATCH] add setutsname to reuse code in setdomainname and sethostname
Date: Sun,  1 Nov 2026 08:12:27 +0100
Message-ID: <20261101071227.14893-1-laurijssen@protonmail.com>
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

- sethostname and setdomainname duplicated code with one field difference.
- added setutsname with arguments domainname/hostname to reuse the same code.

Signed-off-by: Laurijssen <laurijssen@protonmail.com>
---
 kernel/sys.c | 46 ++++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index 755bfa5ccd92..3a4e483c22d5 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1419,7 +1419,9 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
 }
 #endif
 
-SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
+static int setutsname(char __user *name, int len, enum uts_proc uts_proc,
+		      char (*field)[__NEW_UTS_LEN + 1],
+		      int fieldlen)
 {
 	int errno;
 	char tmp[__NEW_UTS_LEN];
@@ -1431,20 +1433,26 @@ SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
 		return -EINVAL;
 	errno = -EFAULT;
 	if (!copy_from_user(tmp, name, len)) {
-		struct new_utsname *u;
-
 		add_device_randomness(tmp, len);
 		down_write(&uts_sem);
-		u = utsname();
-		memcpy(u->nodename, tmp, len);
-		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
+		memcpy(*field, tmp, len);
+		memset(*field + len, 0, fieldlen - len);
+
 		errno = 0;
-		uts_proc_notify(UTS_PROC_HOSTNAME);
+		uts_proc_notify(uts_proc);
 		up_write(&uts_sem);
 	}
 	return errno;
 }
 
+SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
+{
+	// utsname() always returns a valid pointer to the current utsname structure.
+	struct new_utsname *u = utsname();
+
+	return setutsname(name, len, UTS_PROC_HOSTNAME, &u->nodename, sizeof(u->nodename));
+}
+
 #ifdef __ARCH_WANT_SYS_GETHOSTNAME
 
 SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
@@ -1475,28 +1483,10 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
  */
 SYSCALL_DEFINE2(setdomainname, char __user *, name, int, len)
 {
-	int errno;
-	char tmp[__NEW_UTS_LEN];
-
-	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
-		return -EPERM;
-	if (len < 0 || len > __NEW_UTS_LEN)
-		return -EINVAL;
-
-	errno = -EFAULT;
-	if (!copy_from_user(tmp, name, len)) {
-		struct new_utsname *u;
+	// utsname() always returns a valid pointer to the current utsname structure.
+	struct new_utsname *u = utsname();
 
-		add_device_randomness(tmp, len);
-		down_write(&uts_sem);
-		u = utsname();
-		memcpy(u->domainname, tmp, len);
-		memset(u->domainname + len, 0, sizeof(u->domainname) - len);
-		errno = 0;
-		uts_proc_notify(UTS_PROC_DOMAINNAME);
-		up_write(&uts_sem);
-	}
-	return errno;
+	return setutsname(name, len, UTS_PROC_DOMAINNAME, &u->domainname, sizeof(u->domainname));
 }
 
 /* make sure you are allowed to change @tsk limits before calling this */
-- 
2.53.0

