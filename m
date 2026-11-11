Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382413;
	b=PQTvRmL7DXiRLla2lB1z/70VgdA/448dsumQRY8QQVUH+Pry47Be4bJGj3it0nJU9XXV
	 9ZGd2niQg5dAjPBs3mus5Nl/7hjIDkGf85dlh06xgwDkO/sEa80aqAon/rh726ZgYB3vt
	 iY89WZiEJw4mUDAd7picJy6Vv84bDeoRL0Q1Aw0OemBB+NecVptstDkqQEz4TfnORGeqx
	 YmR7hVNTMxfx1auSuA7pruejdw87unCnyIwgeW5XGgfks72bljBmY6XrxajM5cRdOfxc0
	 NgMMWkVN5nqH5AOE8SvcUWlGjLLX5lQUTRqbGbBJISqzXn+hYFcv7UP6AtXrRoaLb1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0nbeGxwiuQ7g4O8n464ixeD9tsVuwafSDhk1FhHV8ow=;
	b=aGZCAbn3GyOwJXJS0YiQlvXQl6V4jYbtUc2fqhtzNYc22KUKV4MVdd8kMuompLPocPEi
	 U5aZXWaZHHJyhRHQSEu7D9VRxg2kau1qB7goo94Lk2k+SVjPHfqlBczq+3e3mPc72a9Lv
	 dYHpIgxExTtqMsNjhN6kYHz8JX0llFipqkXjLBq9bDvRCyjto6Au353cBG/ytEhQGoT7G
	 5puEybHAO/4CWD2XPDYUrHuSrZVALg3gzr4yISsnrBF1YjIQ5+G9XHU2kErwPSl1bP5X6
	 Bpkd+HJcfAYUDUECA66gjOJJ6Xi3gar5/tMNp8yUw76WIoKtEdwzkdazjj4BFVySUjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBrs2ZgV;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09597606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09597606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBrs2ZgV
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so431107566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382411; x=1794987211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nbeGxwiuQ7g4O8n464ixeD9tsVuwafSDhk1FhHV8ow=;
        b=lBrs2ZgVCKkiSzxKSfMMC3tmWFnbJDTRnbqP13M2/1lJKrfShrHxCxzwJ8QMcmYbIA
         fcMxwtWvBDiYQpalQgwanVvDHJ7K/FUealJqLqY3XbHVOWeQ/1LFZ9tg9WqYPPM04TcC
         aM/wIJKZ6Lki/xD9GEC3nNtz/4HTBNFQEc9B3LCCXyX4Qp/S7eg/povf7RtpzLBavnuW
         Az1qf28A9yINTaTFu/CoxTyshX2nG2P45Evbd7sjYaaI0HVop8Yk8Oe3ueqEtxY/SXno
         640HrKCUfl4S1h8qCk1LBmYWyd6bObkGnjMSLtBDdambu+hUxBJswvMF0YTIb8DyepPu
         wbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382411; x=1794987211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nbeGxwiuQ7g4O8n464ixeD9tsVuwafSDhk1FhHV8ow=;
        b=GAmFPO7z9ONT/BBmotB0Z+pYN/gSLsvE3WKEbRnh+jtizrklfW0KCuMIITAVB6s2sj
         WqYvg6MqCr3imiEwrGKz7CzEiLR8nmDJ5ZU4IhHjLJ2pFkYqZLC2WH22kw+uo9G08H6v
         ZgPP7mGR5AdObVL8VCc1ToS8mqzNUUnYngMD2NHlkKsSdpRc67a/9TRYHMX+u+Wkgghc
         jo/abFyryZz5GDtwW8GncDUOqblPiYpNb/hxHQMpiFR6dhUnrem9QonnPBjxoTXd4YT8
         So1ZeXStqCwaEGuCK511kdi1NSul3qgWvcNftaOW1+SdAkwSnGHKWFapzWeRWUYlKAx5
         H5Eg==
X-Gm-Message-State: APuU4Z8ijxGRsYeOsAzs+G7I0Lt+ss2YYdS8MwvKRLlUxNaSSj/MR9g5
	aBYcKCHqAVCZCSB6T4+dXNlz8XZ/lZo7GohgGgcnAn2MZX/zXsoIsSvsNjwBLKGg
X-Gm-Gg: AYBFou0LK0AiX665ivHc9uPQOfRcaQbeboCCSAjKHmVDfHCZEGQt8kOBAyv683+RNOQ
	KgkeM1+Q2W1ytIQYv3zR73OzdXo2zmyiN1KnKVNNkpiYusYb1naR9U0d4ZdfEusOZQuwq7OQQ3R
	yk6VP9ZHqE3C8Hmeab4mNBumWycWuya54srk8x8VxQs9X4m00njG8liTFLR5G0ZnoOF9CLg8aC7
	zMEKy1N5Z6Tud99GWeI5IuPzweXfPVmw2aCc53UEh6nivAPHkLb2UT7d2iQalWf7zzQNYLLpPi8
	DRnU8R/N6iU8l/4DZFZ2IRt5exUtKZcP+QShLbOldhjlj2YdhgU61DXQRav0w30ZJ7KDiL44M8q
	71Iyth86AMF1k1uE8UiPm9zl3uggtnUCJobycbrCNQFD0rlUzP23RzoqIz5qoPtwX2pEq8eDOKU
	PA1edIjaX1UMYxulYDMjp9S2Sf8iqLgEV5NmCWQxAMnvnfmp4btocavjtqbEFUN03Q/t5jEfQ6r
	K/Xk0uIlBvgkgXyL/WNLto1yYOWbkzI+hgu06EQQpnBSMZE6c6VW4ihqHLoDzxbzJGUMXWWWhBp
	56zLeIfC3c9zodg8ZM2eX6kTgq4S/ozSrP9xyM+VflqGgBMq+MicWwd0kHHyNo+PzKbe57Wa+iX
	Y7kyMrCMURekDH1aooC/DbQ9XxHmOZYdrNuLAyGC5siijhDpwu80BHL248DNWKTWUUNo=
X-Received: by 2002:a17:907:1c9c:b0:c40:d920:746f with SMTP id a640c23a62f3a-c5066dd1398mr113177366b.46.1794382411126;
        Tue, 10 Nov 2026 23:33:31 -0800 (PST)
Received: from linux-laptop.dynamic.ziggo.nl (2001-1c03-0884-3400-503b-37c4-84e0-7f98.cable.dynamic.v6.ziggo.nl. [2001:1c03:884:3400:503b:37c4:84e0:7f98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c505a93487fsm134837266b.46.2026.11.10.23.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:33:30 -0800 (PST)
From: Laurijssen <lauserve@gmail.com>
X-Google-Original-From: Laurijssen <laurijssen@protonmail.com>
To: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	brauner@kernel.org
Cc: Laurijssen <laurijssen@protonmail.com>
Subject: [PATCH] add utsname_set_field to reuse code in setdomainname and sethostname
Date: Wed, 11 Nov 2026 08:33:17 +0100
Message-ID: <20261111073317.93929-1-laurijssen@protonmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109114421.8414-1-laurijssen@protonmail.com>
References: <20261109114421.8414-1-laurijssen@protonmail.com>
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

Changes after review, cleanup of duplicated code in sethostname and
setdomainname.

- add static utsname_set_field sys.c
- call utsname_set_field from sethostname/setdomainname
- code compiles now when CONFIG_SYSCTL is not defined

Signed-off-by: Laurijssen <laurijssen@protonmail.com>
---
 kernel/sys.c | 53 ++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index 755bfa5ccd92..77fedd127a3f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1419,7 +1419,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
 }
 #endif
 
-SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
+static int utsname_set_field(char __user *name, int len, enum uts_proc proc)
 {
 	int errno;
 	char tmp[__NEW_UTS_LEN];
@@ -1432,19 +1432,41 @@ SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
 	errno = -EFAULT;
 	if (!copy_from_user(tmp, name, len)) {
 		struct new_utsname *u;
+		char *field;
 
 		add_device_randomness(tmp, len);
 		down_write(&uts_sem);
+
 		u = utsname();
-		memcpy(u->nodename, tmp, len);
-		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
+
+		switch (proc) {
+		case UTS_PROC_HOSTNAME:
+			field = u->nodename;
+			break;
+		case UTS_PROC_DOMAINNAME:
+			field = u->domainname;
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			field = u->domainname;
+			break;
+		}
+
+		memcpy(field, tmp, len);
+		memset(field + len, 0, sizeof_field(struct new_utsname, nodename) - len);
+
 		errno = 0;
-		uts_proc_notify(UTS_PROC_HOSTNAME);
+		uts_proc_notify(proc);
 		up_write(&uts_sem);
 	}
 	return errno;
 }
 
+SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
+{
+	return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
+}
+
 #ifdef __ARCH_WANT_SYS_GETHOSTNAME
 
 SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
@@ -1475,28 +1497,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
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
-
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
+	return utsname_set_field(name, len, UTS_PROC_DOMAINNAME);
 }
 
 /* make sure you are allowed to change @tsk limits before calling this */
-- 
2.53.0

