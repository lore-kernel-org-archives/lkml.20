Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946780;
	b=QYlBkUk8bw1naoira/EdYiX6Y2/tW1Zw0yGLvisfjm2tLr+LniRRwDv0U+nQh8nw630M
	 6tiocXQCiJdFpz90Rqo+mvqu/GgdJ/yFErgFDa5OLDZvtBqUlVbLxeHOY894yTz3Ii1o4
	 RD/1TkKIjPoIRVf5+9VyUFJB/gDBL2f5T7o7Je4eIkSwG2azx2vBirH7lfVUv0LyKfWUn
	 pLLpfYcALkMwJOE79DnhMAUx+2RHPahciHyFSpGhbL9Y7+jHNfB8cjJMbjN8Z43J6HMoH
	 A/S5OJYCM5ikFXJMIp6qtGICs2XoXPeGgQL0daGn0lfX3YnbIaCDk58lya8ktgCrFbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xG6MrCXFC7R3FF1J0tGLDByvgSJFyVyerh9PIkr8DcQ=;
	b=PhnSDFgRBFCeHs6oDIUbyLHszYS2KaV8KOz21KdHzBDZA3VJWTCwvVDXd13AGxOqd5TP
	 fIDLzXWjfkikhb1eQbtjBX6YMERm+xyx7tr5temxItCm8Pmw/dv/CnIZ1spq8kkMmOO0a
	 cR9wm5aFLHccn9kakX1itikSbiShxyl4KxR/A99KKSZAG7JewjPaYjMomYMmmtj9SS3aj
	 JXR5Sgzxurt2EbdzprXU5YU+rTfl1RZ7Pbgv8VIOZZTbrqmCZooQtkOqpldIeP9hSVkrx
	 3r3sWjPBcWjy54PDaszVK3GHIdh9ngKue2manryrHYixDlVOPnL14PYZ9tlTV0A8+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pDcw8uF4;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B2C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pDcw8uF4
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1701383a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946779; x=1793551579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xG6MrCXFC7R3FF1J0tGLDByvgSJFyVyerh9PIkr8DcQ=;
        b=pDcw8uF4GXPFER2LwaLozrGEMlbRBWKIeeQRXypzbGoXiU2il/EY4Jp8WMYpcRy9n7
         X59rvLqfsIFCCLPxBMo85Scvjnr4hiaVWdq58uNUMRTmui43HzAWTmynNFKl5yPFr1D9
         B7SRvcrdvY2dNLPOj+6zaWnbC68Jp7AoXyFvT9Qv+SB90I9jshGp+MneCKKlpmAwKOw5
         vrh9okELyJboqZNLJ1t1REfejeqzpO+w0XFFfyahdcz7G32t5nqmNQkdedyabXxezkaF
         HlLr+OPZecTXT4yZZSF80dfp2QzQbGu0lSKviqAEjmnTMOw+o/fsxZe/raIIPwalBIt6
         1PTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946779; x=1793551579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xG6MrCXFC7R3FF1J0tGLDByvgSJFyVyerh9PIkr8DcQ=;
        b=y/0gPSm9KPaKho+2Lqoufta4Es/wxmS+S5yJ4ZM+5P+D4kE1d+oPKUzoKlXZCBMAaf
         li4tEY8bjnwQSknQz8TKlmtonA3D5CKypBlmNu4Gq8YTLCWFqIZ7ousVOE7BXDDy+Bb9
         g5t2S7CuGi1Jp+i+Jz8kv0e3kGbAAy+AEyhMzgF2SUryJHuSep+eQ8ZfEX89Dbo++zaR
         xmd/Cuij2UcMPKe4wJ2GjnWfwA2vBSTj3od9I0k7m9nH9ve4QZH24x+AYFaEWq2gfiNR
         fwqSzVf/20YRhiO03Wuan9Wob/hVQNhArS9qGa3kU3xeHEIUG14DyHA9ETUKuhUtlGqL
         Ddyg==
X-Forwarded-Encrypted: i=1; AKwUvBzPyd3pa1lvXnJcFCQtH/eFApbAJchpCFkwlcRWYafIk1zmB0Jsv6s6dtPI7weh0rUKPbcaHHLkXGXI5Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL21bcPwh9deCY+jMo3u2e8JCyGvk0Q2cMLVzeY+pjuCu77tSk
	klSa3hdqNNfF0PXCe0WkdhYQVNpNy50N3j4fdnCYVaYFW8kgEvG7TKeI
X-Gm-Gg: AYBFou08f0cP9a/tC9oCW4MVUin9HWhF15oxk8U2/JLyfSA36uVCwgSOWBi1nKLN2AU
	Yf1mZ66hWqzjS33w26E+UkSpOJdN2X8CYk3xmPMADq20X58buTFzH1DKYyydWhk1bmw6yk9557q
	lsimG+15gBOzSYT6IJQsxzBCSn3xwZumrxmtjcU3GhRNuwSGMAWYGrwQLg4tC8jUinKcVKgZCuu
	IAPfNLEfzXomo2K325zsemuSqzGRyVfQRFe1Wln/4uB0IGmciGfylmevt4tWj/AyW7g4pC250mk
	3E1R9BDzXPMFyFya89zrAbPPiYfYJArURzMgYnBpYZUyrT9niFMx7NvMV15PApVfq1KyZEkLEHg
	1oTtp49QaOZIDbNxo+Kcht+5/N93A2q+5lepd5PXlHEyq2q/WkyLEZNzLHIWgVbbAbSg64yOWGX
	bvpPl4YSt1Xgk7sa+jhNg+gMFpW1bqJlXMuUmMkk3uWX73sD5rcMcl/Cm1+wMicpYIat1hjl3cF
	d1D+ws3oA9vjVEOL5aFO794dzbDZAPDlRNVYoEvi+7/bbS6ldN8I9wbLpNdt8K5UtlOxI2J1rsc
	SFD1wKsIA3GOwa5+HX5FhC5g7NP6
X-Received: by 2002:a17:90b:1c0b:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3adeb104d43mr3872406a91.67.1792946778932;
        Sun, 25 Oct 2026 09:46:18 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm5285671a91.4.2026.10.25.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:46:17 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavel Shilovsky <pshilov@microsoft.com>,
	Steve French <stfrench@microsoft.com>,
	co+3a967895833044fc@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] smb: client: handle unmatched encrypted read responses
Date: Sun, 25 Oct 2026 09:45:59 -0700
Message-ID: <20261025164559.439328-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

receive_encrypted_read() advertises one MID before decrypting a large
response, but it does not populate the corresponding bufs entry.  When the
response MessageId is not pending, smb2_find_mid() returns NULL.  The demux
thread then passes the empty buffer slot to is_oplock_break(), causing a
NULL pointer dereference.

Initialize the output count to zero.  For an unmatched response, account
the credit grant from the decrypted header and leave it unadvertised.
Publish one entry only after finding a MID.  This avoids sending a partial
linear response through generic unsolicited-message handling.

Cc: stable@vger.kernel.org
Fixes: b24df3e30cbf ("cifs: update receive_encrypted_standard to handle compounded responses")
Reported-by: <co+3a967895833044fc@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/smb/client/cifsproto.h | 2 ++
 fs/smb/client/connect.c   | 2 +-
 fs/smb/client/smb2ops.c   | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 00168839c..fb181e727 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -88,6 +88,8 @@ void cifs_wake_up_task(struct TCP_Server_Info *server,
 		       struct mid_q_entry *mid);
 int cifs_handle_standard(struct TCP_Server_Info *server,
 			 struct mid_q_entry *mid);
+void smb2_add_credits_from_hdr(char *buffer,
+			       struct TCP_Server_Info *server);
 char *smb3_fs_context_fullpath(const struct smb3_fs_context *ctx, char dirsep);
 int smb3_parse_devname(const char *devname, struct smb3_fs_context *ctx);
 int cifs_ipaddr_cmp(struct sockaddr *srcaddr, struct sockaddr *rhs);
diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index b6e98eb31..d47f166e2 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -1221,7 +1221,7 @@ cifs_handle_standard(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 	return 0;
 }
 
-static void
+void
 smb2_add_credits_from_hdr(char *buffer, struct TCP_Server_Info *server)
 {
 	struct smb2_hdr *shdr = (struct smb2_hdr *)buffer;
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index cb4fd09f9..6f75e6620 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -5236,7 +5236,7 @@ receive_encrypted_read(struct TCP_Server_Info *server, struct mid_q_entry **mid,
 	INIT_WORK(&dw->decrypt, smb2_decrypt_offload);
 	dw->server = server;
 
-	*num_mids = 1;
+	*num_mids = 0;
 	len = min_t(unsigned int, buflen, server->vals->read_rsp_size +
 		sizeof(struct smb2_transform_hdr)) - HEADER_SIZE(server) + 1;
 
@@ -5306,8 +5306,10 @@ receive_encrypted_read(struct TCP_Server_Info *server, struct mid_q_entry **mid,
 	*mid = smb2_find_mid(server, buf);
 	if (*mid == NULL) {
 		cifs_dbg(FYI, "mid not found\n");
+		smb2_add_credits_from_hdr(buf, server);
 	} else {
 		cifs_dbg(FYI, "mid found\n");
+		*num_mids = 1;
 		(*mid)->decrypted = true;
 		rc = handle_read_data(server, *mid, buf,
 				      server->vals->read_rsp_size,
-- 
2.56.0

