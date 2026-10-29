Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283640;
	b=Dpgtu/TnpaLI1tRQLPdNXI28muCJlWX6agsjlmzhc2/2Ny3IdlzgtfAvpI1BteZxVYIm
	 eOSiH6sj+hazHUzN1Uef9w3ATgbmXARgv1s+BSljnvX7/MnRe6pGq7Zk9p+72peGjOceY
	 33C0/lFsJ6y9E6MndyEuiPpkjrGcy7s4o3bAf5Eod8zhB5J2S4F/rlib7SdVJZDDEmcSb
	 ORcODS3Cbj6jK9bey6P5fRKyVuv4faLUrl2R24ub/DVrkbAr1IX3oI+PeXNBzOqTWoDSe
	 URf0uLSBPhdqJYxMn0oEOw+ZETKGUp4amzAAjj3l/kbH6IcYASbTvhfNJaOOMf6qkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Q6siEznL3HrayKiWtNURn9ixKgVxMPjQjopWdTKX9SQ=;
	b=bEELbXP/tbqyzxCq31ks6sue7bjkMSuwN1DwAg6uVNqPos6+qHlRkraxR65PGCvCWGNS
	 znnzBBYSSdjA32Y1qpUlZHjmFeu9YvXWi4MAoWwKvwtjbl6oldjHgSKc6XeOhsM9GrSQb
	 6tZ9ldu4KnNBwes4h7M9phMa/FkBktwKAioouTt1QvQLOQd39vBi5Zyxr7gtlNn5KeYcq
	 QJe3Wk/Jh6GaYQlFCNF49/91UdBPQrnaBEkPKqpIdzgU8ykaURX135f6gbEk7dcEcCSq3
	 td4tQ/wE+4s4kx+9xRpm6EdRZ/PD7tztMbFSSv/UvES/M7wxRF++2Pwaat1TuAxvoRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wD6bDOAt;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCE0606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCE0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wD6bDOAt
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b55859245so28950276d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283639; x=1793888439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6siEznL3HrayKiWtNURn9ixKgVxMPjQjopWdTKX9SQ=;
        b=wD6bDOAtYDZ7dbGVnnQsM+dGNAAzQ2Y2lEYX6usxR8Mb0DwERLL2f5rrYsfhCmFHXN
         d0hFBpCNMIZ5JsqhQjsrdy6XbVsRhil2wXbcujWM/cPjI5oWxjdqrvb2VUBPzmCE/P5d
         h/fYgEGNFBkje6CyvEfW31vBEmIaR3CqOlXixfqay7VA6RFlSPOGpCJJXerOvyvse1AZ
         Ck2LaxANvxfYiKq3BhSnd3taNPzH37r4xeWa0SvflF/y9LgUiLGq/gB3TBDAbXiFw3FF
         i026M4e1SCXhokTseCF3k40gaLYTdVrcct0ZPAZC4jtdMC8lG3nTMi7kHpl4MlYQ6DKQ
         SJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283639; x=1793888439;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6siEznL3HrayKiWtNURn9ixKgVxMPjQjopWdTKX9SQ=;
        b=XDVUbHF33Zl8RmRKoxpYTKoNEhkzGCXlvvjl62RWXUidliQ/CZcY14K+c5Bx1mPviN
         Kbv5DukHIQPD6H/j7rjKn5P5sHRxCsYzAeqZXOzr55TtvAygXT+ixJQ1GtRmXPhynHd9
         2Zmm/p4kkWicimiOsWHTxYqz8nEU1aSLnKYZpuSlntM0+GU4IBATiUYMi388+1xX/z/G
         DmVrwJz26CZ54jnj9vWpAfQr4PLfWiIKtpYvT/nJKL+lmF/TtVIBYLSqIJAYxts5cmEF
         dEtuv/N8sfsYcl5DxqEu5D8OOX0VhKu2Z9Ry9+mqwNyaZdrwiLbBqHWyfiJIgv6z9N3O
         gFuw==
X-Gm-Message-State: AFq9FYICx8obbpytjuCn53TqzizMeuhLDAdmCsAgQBMHPZFlFgCkgOVD
	5tUqbxmExiVYn1F3tG4KaGUV2fOAXKusNMRlhnbnBqlBegjxet6qM9bY
X-Gm-Gg: AYBFou0PRYw7ukFjrUYeDLlLzCwYiPC9v/tfVMQ10YsROf2dCSCddRYBD575H0hqM/M
	eXkNecd5PAc04KlX1RgRCKUQVAJTzW4FXDDsZsn27glz25BcocYZjm5j4xM6lmRQgwJhLXQxK2g
	M8fcJmTM5D7QOTAb6RFErDZTrgdF+XcOXqJ2evS2M44ZWQbeFdrlyWmcC2/WBp1yXTxKg/DHRyk
	HpAPxKN457sPyWJia4+ovbHB9H3UwXLtmq1zui8jeAcNkNcXRyizljdi04ZQvWPNTjg4KKTLoPh
	nwcsYcYQHbCqpE4jQN8qBUARJ98j5ogRCxP8a9zaUQ50I2EVtyXJ6bHAQfgoWmdop8JTE8xzzss
	G+D10GKXjHL6yAD1+nv8THDFNyAJTLJ3qzFLjJ7BKYpn1ko0H4kb+1lLAsuzfSevHRWYPoTkqiq
	PDzMssN0EslsdTuQhDEkkq+6Y/w30Q4xY77l5nqiNka+Qw//ESpiqNxHGpwClNwkYuNCcDT7ERM
	xaRYEoKAy5gh8wCSNAKp5r+j29athZG4QWpK+HVRX5k
X-Received: by 2002:a05:701b:4203:10b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1a6c9af1e26mr7960419c88.4.1793283251997;
        Thu, 29 Oct 2026 07:14:11 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:11 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] ipc/msg: align compat version-0 msqid_ds with native IPC_OLD
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314077.648427.7284615104475689945@gmail.com>
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

The compat version-0 IPC_STAT path copies the 64-bit counters into the
16-bit msg_cbytes/msg_qnum/msg_qbytes fields without clamping, and leaves
msg_lcbytes/msg_lqbytes zero.  A queue with 65536 bytes, 8 messages and
q_qbytes=200000 is reported as cbytes=0, qnum=8, qbytes=3392,
lcbytes=lqbytes=0, while the native IPC_OLD path reports the clamped
counters and the full values in the l fields.

The compat version-0 IPC_SET path reads only the 16-bit msg_qbytes and
ignores msg_lqbytes.  A caller following the old ABI with msg_qbytes=0
and msg_lqbytes=131072 gets q_qbytes=0 and the queue stops accepting
messages, while the native IPC_OLD path falls back to msg_lqbytes.

Mirror the native IPC_OLD handling in both compat version-0 branches:
clamp the counters to USHRT_MAX and fill the l fields on stat, and fall
back to msg_lqbytes when the 16-bit qbytes is zero on set.  The compat
IPC_64 branches and the native paths are unchanged.

Fixes: 4693916846269d ("msgctl(): move compat to native")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 ipc/msg.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/ipc/msg.c b/ipc/msg.c
index 62996b9..71ededc 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -686,10 +686,17 @@ static int copy_compat_msqid_from_user(struct msqid64_ds *out, void __user *buf,
 			return -EFAULT;
 	} else {
 		struct compat_msqid_ds __user *p = buf;
+		compat_ulong_t qbytes;
+
 		if (get_compat_ipc_perm(&out->msg_perm, &p->msg_perm))
 			return -EFAULT;
-		if (get_user(out->msg_qbytes, &p->msg_qbytes))
+		if (get_user(qbytes, &p->msg_qbytes))
 			return -EFAULT;
+		if (qbytes == 0) {
+			if (get_user(qbytes, &p->msg_lqbytes))
+				return -EFAULT;
+		}
+		out->msg_qbytes = qbytes;
 	}
 	return 0;
 }
@@ -720,9 +727,23 @@ static int copy_compat_msqid_to_user(void __user *buf, struct msqid64_ds *in,
 		v.msg_stime = in->msg_stime;
 		v.msg_rtime = in->msg_rtime;
 		v.msg_ctime = in->msg_ctime;
-		v.msg_cbytes = in->msg_cbytes;
-		v.msg_qnum = in->msg_qnum;
-		v.msg_qbytes = in->msg_qbytes;
+		if (in->msg_cbytes > USHRT_MAX)
+			v.msg_cbytes = USHRT_MAX;
+		else
+			v.msg_cbytes = in->msg_cbytes;
+		v.msg_lcbytes = in->msg_cbytes;
+
+		if (in->msg_qnum > USHRT_MAX)
+			v.msg_qnum = USHRT_MAX;
+		else
+			v.msg_qnum = in->msg_qnum;
+
+		if (in->msg_qbytes > USHRT_MAX)
+			v.msg_qbytes = USHRT_MAX;
+		else
+			v.msg_qbytes = in->msg_qbytes;
+		v.msg_lqbytes = in->msg_qbytes;
+
 		v.msg_lspid = in->msg_lspid;
 		v.msg_lrpid = in->msg_lrpid;
 		return copy_to_user(buf, &v, sizeof(v));
-- 
2.34.1

