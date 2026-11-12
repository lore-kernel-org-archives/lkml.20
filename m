Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458852;
	b=srbJHvXI+4kZCzFB3NtxU+l90ZLALlI23Vc/QfGWQG6FdMvcV6RVilE4IdFoQJb4H0GK
	 A0Vrbo00/4DGRWXDnPXA3C5yo/jG8bMeVmYwxmVod5pq5AJG4I8Y/AcDdR/1Ny/VecbY4
	 /J83WTLgWedyK485uH10nerpYk0sasuXzCiTbumA8Wz/Siv2DLZHFNADo53B/wJkir02w
	 d7ZZj9Ziw3tyms29ccVnAwiWGjv4FXS/+u9cLiRVfh/EQIkJ/bK471uhQGSVcHqp0SG7O
	 4TwMFMxnopaoojVFwKAACPUINvGHvSbhwr5rGdzf1jT8LhBFVL0Cv1vZDBOvndtDkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WR8j2TwPDUPevNVljLnHtKoNr8/4X2azosuFtL+wyfU=;
	b=cmGhXraT37mPmOjr/69OLkUAIzN88WSjb/e4vFNbkIZeaS17lsCoxCxvwoXjcJzcZ20H
	 ryMO9Uh3TPl5Uh+0lHMLMmKIQSIKdPuj+TAJP7mXF3vakeCn0ddNHpfmqrptoa3G3kHSH
	 Smiz5jbCVhhg9XUhSgT5/rPnT0QQz7PIM+DZzNirgJ1/3hl2UWT2UFZ9IV1fJLKyhiOr5
	 CnBCoDnDVofs4YfDLVjZ3JUN/AoK/wzcrR+MevjPrZzPL2YS6xh2bGqlsyxVMozAr/eUV
	 Z0Co9SvWn3YbWKdQw2ZwQDlxbcxP2UtUKZEfnNKf3R07z00mXs1AI7/HrT47rzHw9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKMwDZF2;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426FC60A3818
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426FC60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKMwDZF2
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3943028c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458850; x=1795063650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WR8j2TwPDUPevNVljLnHtKoNr8/4X2azosuFtL+wyfU=;
        b=VKMwDZF2V7rHE+kLkatC4a8bzZpq5qG5dbBrzyfhl8TA2vUfIu2E8cFgnr0muNEQNM
         z4iVImathAoImGHzpath9hFOwWxYv4V/6bCEye6KEovXsMAfWGVG6JGrbZhAT2Q3Y5xM
         xNWJXVXWiN2bSxZzoxAc+Mnvhu2z0u6nAdXf2wtL8gSj/avjLdEH29kXFYD6DqvULih4
         bPC4JYAuvo9OjkgcJlNAXNXDqSyDnIJoHnnFAac6Mdt/SkFLSbb2G+eR/AzGvkNsdIlG
         kvbAdjeVDGFfudjVfQR9CvBHhApl77XX/aM51orYfm3Cxt7VQ1exiG3pI4t1Y/TrcSqW
         hI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458850; x=1795063650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WR8j2TwPDUPevNVljLnHtKoNr8/4X2azosuFtL+wyfU=;
        b=JCBYuYWfUQKSKR53XMjRsscrdHRLA9Ihf/nWEMhpL/roTtA7JM8hWctmHESV4ssJeL
         Ga0g05U7bvG7GoReMgqcOI9x0zhqb69qnsioEFa1u4Qwkot5DPY1Pql3/JSRFJa04Wso
         obgfdtWziPCA38m9WVPblWI+zSucgHD8gsNcSWgZx2n6d6TrgYOy7KXHFgYZ6V7LEbQz
         P9qKnOKxK0LJVwMng0xArkkeWMt9LuoXUCJ5C1bZBMPb3uFfARI92l8JGxQDOWNBoMoc
         AqJ1l+rgV+GTf66vYiG/dJqNRMTqO/IUSqx5uOHLGm0HWPZNaudpIFQ8rXhIQlsnx2CP
         QCVg==
X-Forwarded-Encrypted: i=1; AL+hErG14aNpFoHEDNmvP5VNxfzfFB1xwTqUaASiuKqTPL9Si70DRV2z/9tsZosiGtSdHPziTfrH6y5pI1Sqb94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8U95w6GDJCXBSwGkkkTnSPfW1x1TLeBKwiIJ7DDjmOryKHSk4
	ZHJrv8pPOesMlLA8sO2igMG7dhcbDaQiTxwAIMb1Xqu43CjYygWIMgnV
X-Gm-Gg: AYBFou3yiIxJMJvhp5OjIJ18xnNeFTz5oUqh02byESikh9VcX4J9ARFueXHZhYHYGO3
	z6lSONpZZVvYzJn6CchF4vup8QIf9gim2J3A3HokET/8cc+MxYqgFpPIIZXFm9kECIRky0KK14j
	FZ7GtBwDJPjA+xzFBntENViNRWbqFiN9tHEM4IBEyvwTksaBtmcyIvJxvP2BqPheuFv1AspqERE
	6Nr3Qk22euZWwRUh/ze7c7xZu+MfpiChYTH1agFP+kuyD2JbnW3kBVtQtxKtZlmFODDNWDMKMmg
	zqigGcSKlsNWtP2KAS18D4Zc/WH1c3Gybxh2PXS4W+FHQBo/2oYPuEXr4aV2XCuMF6zKg78V0wd
	sTOW9YE+Cra6vjkHK8u/yH9qjhPJ+VO/8nKVrpg4IloGA9Aa2FbDcDF2TixH1jhqYb2kBUnNEwc
	rllO9EefAEPmHKBX0o4+uNSo8ccJp1ymmDjMs9IdC9Gmz9uurG/cqyLFGzEgwoiyXPyoDSdDR6e
	Fwfil4FzTFQsJYtSHNWiQ9oz4Qhu/i8OeJRUr2/1k8tinEHA36HAnb67qGfoFZ5wZIp7BTag7KP
	ZSTjhc5DNBD5LDPXFk8MFoLjNLEKaj2hEas+jy9BGHXre7mOW7hcTHehZ3Hu7jUq7hFiOmdySyH
	wXCH1h1+1Mvo+id9kIDLp5kH8
X-Received: by 2002:a05:701b:251c:b0:193:9aa3:474c with SMTP id a92af1059eb24-1b3c03179a5mr4030746c88.21.1794458850321;
        Wed, 11 Nov 2026 20:47:30 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm21024827c88.12.2026.11.11.20.47.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:47:30 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
	stfrench@microsoft.com
Cc: icb@fastmail.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	ematsumiya@suse.de,
	lsahlber@redhat.com,
	hyc.lee@gmail.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 7/8] ksmbd: consume the sequence number of a request on a failed session
Date: Thu, 12 Nov 2026 11:46:44 +0700
Message-ID: <20261112044645.4074-8-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112044645.4074-1-mike.michalo@gmail.com>
References: <20261112044645.4074-1-mike.michalo@gmail.com>
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

__handle_ksmbd_work() calls check_user_session() before
__process_request(). When the session is unknown, invalid or expired, it
sets the error status and jumps straight to send, skipping
__process_request() and therefore ksmbd_verify_smb_message(), which is
where smb2_check_sequence_number() consumes the request's MessageId from
the command sequence window and refuses a replay.

Only a signed request on an expired session had its MessageId checked,
by ksmbd_sign_expired_rsp(). Any other failed-session request (unsigned,
encrypted, or on an unknown or invalid session) left its MessageId
unconsumed: conn->seq_low then stays pinned at it while conn->seq_high
advances as credits are granted, until the window of
KSMBD_CMD_SEQ_WINDOW ids is full and the connection stalls. A replayed
MessageId on such a session is not refused either.

Verify the message once at the start of the failed-session path, as
__process_request() would have, and drop the now redundant check from
ksmbd_sign_expired_rsp(); verifying twice would consume the MessageId
twice and refuse a genuine request.

The commands of a compound that follow the failed one are still neither
answered nor consumed, as after any error that ends a compound; that is
a separate problem.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: fd8c97d7c1cc ("ksmbd: implement the command sequence window")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 32bed8672dd2e..52eee04e0d93a 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -109,9 +109,10 @@ static inline int check_conn_state(struct ksmbd_work *work)
 
 /*
  * The keys of a session whose Kerberos ticket has expired are still valid,
- * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
- * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
- * signs a response to a request it did not sign.
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. The caller has already
+ * checked the MessageId (MS-SMB2 3.3.5.2.3); check the signature
+ * (3.3.5.2.4) too, so that the key never signs a response to a request it
+ * did not sign.
  */
 static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 {
@@ -125,9 +126,7 @@ static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 	if (work->next_smb2_rcv_hdr_off)
 		return;
 
-	if (ksmbd_verify_smb_message(work))
-		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
-	else if (!conn->ops->check_sign_req(work))
+	if (!conn->ops->check_sign_req(work))
 		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
 	else
 		conn->ops->set_sign_rsp(work);
@@ -277,6 +276,21 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 		if (conn->ops->check_user_session) {
 			rc = conn->ops->check_user_session(work);
 			if (rc < 0) {
+				/*
+				 * The error reply below skips
+				 * __process_request(), so check the message
+				 * and consume its sequence number here, as it
+				 * would. Otherwise a request on an unknown,
+				 * invalid or expired session leaves its
+				 * MessageId unconsumed, which pins the command
+				 * sequence window, and a replayed MessageId
+				 * is not refused.
+				 */
+				if (ksmbd_verify_smb_message(work)) {
+					conn->ops->set_rsp_status(work,
+						STATUS_INVALID_PARAMETER);
+					goto send;
+				}
 				if (rc == -EINVAL)
 					conn->ops->set_rsp_status(work,
 						STATUS_INVALID_PARAMETER);
-- 
2.43.0

