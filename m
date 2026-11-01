Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793512857;
	b=a5QCjf/YwKDWEJLjU6Xn2Gh88/KEVuKkl1AZtaUcqvny9/QW2GZF3HjRgq1W7OY4HgWI
	 ZBNvaFNd9TGKmbKPkBfRuHORS0kDmdBD85ZxqXAB7qPhGfCXE88v9VDZU4rPo1aFu3YAH
	 a5UcfFT3vgjT4Fpo44KYT87X4S9kYEOZFnweD3XeCLTCdNdF8bpZeUs2EIwwecN/IzSBX
	 lkeA5mkLYqY3bPj3rBq1+k0OxW9sOxdZEqc7tb1Ga0tyT2/lfNMw1MozHAlbTm7EfFzuh
	 MSSICD4RramBpxta2xsBqFBQsxOroJDaCbYsLU6lPo4q8dBGch8KIoQgFzkNe5JsSaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793512857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ngY1AM6TCdnkDJjcM9h3JQmf4MV5UDS4/IP95R3sI9o=;
	b=FbNE4f2AFwwDMRbeFT/gm8PPMtuBKLmW44239pTyH3rToQLb/5rqX0QP0SwUhB05sfjG
	 PBvQDVFF024etdehDekP5bjYe0HlD9Hsk3GVNAY5Q8S0G99AainpibrQ6cuxL15N78XRW
	 09VG9QvbhaeMvkTPpLJJomVmoIIyimf7x/puqFssNLVgbjI2+bJlBH+ucqEl+dKfSPTFi
	 EeAmEzDKNwAaFbNRLPKhxhQWcdXtsThf3jCR0qNsuZY1yo2lElWsDZUTQspf+Emb0FIoc
	 eu76msv0IKRnTMd1MB22gTm0BXAwP2WvOE0gO1w0gfbcgGJhIP8N61zvW8cMuJqrorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6TlEyIR;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6330606A331
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6330606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6TlEyIR
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so994624b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793512856; x=1794117656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngY1AM6TCdnkDJjcM9h3JQmf4MV5UDS4/IP95R3sI9o=;
        b=D6TlEyIRqGM2XAa23eofqa3q7Lo42j8/q3/nekB+0rPA2aWfq3E2pS3PvCv/7D6EBu
         S6AgjhWGbLPIRVbx7+1FVYZ9hubuBUKsMAco96wsAQPMNfdTM2bo+DEgPAiDieJK2ZNs
         GcfNf6pNekEq5A4ziv0n+xlKEiyaFPQBK4myysj6qKO7U0MbXfcLldi7DsnlGNUJU7VR
         ZptS1L3RVIHPQg1cvJGjqhIUiw9DKPPcc3XHPWcDe0/vD1j+7vKU411IqMgPFeC91tmd
         muwaxvoHFiXjhuVeUVx6UOtS89ab9JYVEcwSYnRpxxgGREivo82kZuuP6QCLMylsN6k/
         J2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793512856; x=1794117656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngY1AM6TCdnkDJjcM9h3JQmf4MV5UDS4/IP95R3sI9o=;
        b=Bh2dJp/0bHmsbPV/bihTS2FbCdqIZ5uWho3jMJWmDNM3Ap3HoLKqTABFAui3EyYtih
         980KnsBH/ppRTXaaMHiOL3lJszPdjw5VpHBT+HkJQDBPfxrDOJWhallFGKAr0LODRv0X
         CciZK5SmQ9X0xhHhARyOS8H/OnHhgXulJCrqwLYj6juqlWqGa7xnusHc18UKmQDyjcCr
         LNhh2jY/85x3WECIstrBTIzCpGVrmMh6Eul2MqPV4TQ6EwfV6bDfZ3fC7kZJbt49q/lM
         SmgvPDDLrKmldT3Ugw2CjFIOY1XPd7WOtEyCK1iEUX9ZMRV6alCAMsCkehWZtCzL4TA/
         Xl9A==
X-Forwarded-Encrypted: i=1; AKwUvBz15w9iR9RXfhlV2eGNh3AAjU4iYMcfxshAP4FoYw60gMP1ufly8axAJ0i/H6fnNbcgK1e9c4I8xvjK7Dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+hXlpTFPq4RL0tgRKrzlg9cRkCHBzMhiTXmWAcZhIjMPACyfR
	IdUn2EgAKXLUlzZ8ngow6w5qzdW5t2kICh2efekWyn3sIU3S52Rqhua8
X-Gm-Gg: AYBFou3hCoe5UMCpIo8HaqNciQYAFW37tw5zwtpEv4j6v8Wwijug3V+vN3VpcCipsqO
	vx/xlrhPljvnmDuRG7V85D+N4m4T0wjKGZxPw0DTZksGraepGxublonpGODCDSYhSc1skmEuTCG
	63Vnn4l3qqhr/Ep5d/MvspwqPXA39ooZk1HJfVj+C4gD/VOAtwu8q15d4KAOAisk04qMe1upzNZ
	BejBqb4ayD5+kMq3uFRT+egu0iWr3sRxAT7yeM5Wd1IKnHc1tUEOzSlVJDB+v9Gp1nwhrr2/Yrq
	c8OwvYXAqvDqZTAfonBWrYwOI8YekSTkHuBgCuAJkkqcgnOjVmodxzFyKSVwvL6WLKvnJQXvMgB
	uMIjoYhPTvySNvxCrA9ukuzQ0bJTolM74lc6vifduRrMLCtJqvDkW4qgw8vEsEoDjl6bBTNq8Md
	Ms9xvF4M3UZ9TjfosC2kuBTurD/55PZlWdpvA3CM+oJXV8OyY+SE0E2vQ6CyCnwlt3Su08/fMAh
	z3TMSVq03LkPf4uBDKreVIHCBhZSRzcbpcFj/Rfg71sE6+ojCa/5fW5DoQSbOt9wgpcUkvTW56K
	8/qU02aLAnYI3DBgNIPIQL7MRfdtSX50dyxaYVnoUL+P8cRxqySFCBn/dUwBzAA0rGgjlcncuq/
	OO4eXEovVez1b/7ePgkiXHSm9oKdUm4MDLAKqCS9tUwZfCTUY9Ia6OCO3Batnpv1Utlp4wWNuyv
	R9YJxcwnJVovE=
X-Received: by 2002:a05:6a00:84a:b0:8a0:602d:3d27 with SMTP id d2e1a72fcca58-8a8317ddce4mr6059821b3a.14.1793512856045;
        Sat, 31 Oct 2026 23:00:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:9201:5fb0:4dc4:c510:e576:213e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d067cesm1062706b3a.29.2026.10.31.23.00.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 23:00:55 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v1 2/2] fs: use must_set_pos() in default_llseek()
Date: Sat, 31 Oct 2026 23:00:49 -0700
Message-ID: <20261101060049.81441-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261101060049.81441-1-sidchintamaneni@gmail.com>
References: <20261101060049.81441-1-sidchintamaneni@gmail.com>
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

default_llseek() open-codes the same whence switch for SEEK_END,
SEEK_CUR, SEEK_DATA, and SEEK_HOLE that must_set_pos() already implements
for generic_file_llseek_size() and generic_llseek_cookie().

Replace the open-coded switch (whence) block in default_llseek() with a
call to must_set_pos(file, &offset, whence, i_size_read(inode)).

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 fs/read_write.c | 50 ++++++++++++++-----------------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 86ce8cea10d7..b15522cf96cd 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -333,47 +333,25 @@ loff_t default_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file_inode(file);
 	loff_t retval;
-	loff_t eof;
+	int ret;
 
 	retval = inode_lock_killable(inode);
 	if (retval)
 		return retval;
-	eof = i_size_read(inode);
-	switch (whence) {
-		case SEEK_END:
-			offset += eof;
-			break;
-		case SEEK_CUR:
-			if (offset == 0) {
-				retval = file->f_pos;
-				goto out;
-			}
-			offset += file->f_pos;
-			break;
-		case SEEK_DATA:
-			/*
-			 * In the generic case the entire file is data, so as
-			 * long as offset isn't at the end of the file then the
-			 * offset is data.
-			 */
-			if ((unsigned long long)offset >= eof) {
-				retval = -ENXIO;
-				goto out;
-			}
-			break;
-		case SEEK_HOLE:
-			/*
-			 * There is a virtual hole at the end of the file, so
-			 * as long as offset isn't i_size or larger, return
-			 * i_size.
-			 */
-			if ((unsigned long long)offset >= eof) {
-				retval = -ENXIO;
-				goto out;
-			}
-			offset = eof;
-			break;
+
+	ret = must_set_pos(file, &offset, whence, i_size_read(inode));
+	if (ret < 0) {
+		retval = ret;
+		goto out;
+	}
+	if (ret == 0) {
+		retval = offset;
+		goto out;
 	}
+
+	if (whence == SEEK_CUR)
+		offset += file->f_pos;
+
 	retval = -EINVAL;
 	if (offset >= 0 || unsigned_offsets(file)) {
 		if (offset != file->f_pos)
-- 
2.50.1 (Apple Git-155)

