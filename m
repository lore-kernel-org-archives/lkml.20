Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46B490BF7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594628; cv=none; b=eg5pXGgYpOTIQ38HAQ5SFP7lQvUNDbbqZ3R3Q4SxB+LUZsXiQrKLf23gy6H8NvVZ1eApNsWfjg8ak4XMhMntKj22NXXTRpmfPfXQRa4Vxq7/JTCp/SmrBwNSnxUWgW6e3yhATO48OW1ThDTrE8kOVlrSOIMtNCYMgbOmRZ6HJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594628; c=relaxed/simple;
	bh=z2tQHhAwEFt+agCaRWeVzBR9XVTRt1GIp8bQCvmiYuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKQIst/BN0gpnMvnZ+wY02Q0i325KuGRPoiMdycROYpnycXdHyxOZMEOwhos+Oebgu+1MJ+E7rkU3Makyc1UphltlO7qtht1Ultx2J/QGvAWEIXNO5ro4EAbOLiyGxhAXoQVAXDzXhSqTgqVapzjDN2sV2XhuA857W3eXPJLDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=EA81dlCD; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="EA81dlCD"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso83594fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789594613; x=1790199413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhuOR/yTpkseeAWrvSpKFTY7Og9vlkZJ0CujlTEe3/8=;
        b=EA81dlCDWK8Brg7yFLt12E8nZlqjwrkN0YEPpAojkNirkQk13Y9EBI8WkR5wMuziOn
         J8PpG7hJn/L8j6WmijRAO6sk+rbNKqmXZtKJBS6VhM4TP9N5WXGrHvRaTGmydE2VgwDS
         OaeLEKKULlqA19YKFhlEEUdIx2+cUr3TUXyGivcSng8lCnUT6cXJtyg6goStQi8X2chj
         CzSy953u9/uyHqrpMumPFqGLQgdwU+LxIIiyRVB2WSkT1OwddN//BnZ4o802EtXzjv/S
         Q3veP9F/7urB38Ozg8Yb6Lhy+2YVoH8NVVytMxhAafS/6CMYAnUBxrnaNaNEXuOrf4Bo
         mHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594613; x=1790199413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhuOR/yTpkseeAWrvSpKFTY7Og9vlkZJ0CujlTEe3/8=;
        b=0/25u4UvePcgvc6MEobCbBpCouuCcnvJ/Vk+2+jsGU9j9CJKYjyxPFR3w1Uvm6dlNZ
         Z0r2GQyh0+W7BDLjVs59trmtj2dgS5R/G7ygXjhQlBHSXi+CER/Yxp7kfryYgy5YI5Am
         Nfd2EX0Gx2bOtK3bH63Y8zpkEcOECtcZRrvlrLF+oskWuMV/1B8NltRwXRF6wum8TjAi
         p0vI6LOr5KyzoohUVUSI89FbtvlGrSQjOLcOSzx1ohntiDEMp26y+iPXAE1y3m5Y3HvS
         c5TivIxhxfYJy/2kjO/h9DneTcwTxeIzxA6HYzj/0g3/k5wdt83aLrc1tT6Iu+xNHt0V
         C1Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzX2GtSrwRwhYemUTENSWpxWqZm+VlCbKuhHuXM88w+aoS4HKJIH+6PJieIHST9Om3maPT1usftYD3g0K4=@vger.kernel.org
X-Gm-Message-State: AFuF++msW8R+vK98TB+m4MgWohWKEpOnrbXvIwa2ojf4OpUwigGcI4D5
	0aMQvrazAd7q7CaZuRMb9HQm48mE5bzS6ISCYVf1PLuZnyIHRw39tHcbuv7XNDLrK8U=
X-Gm-Gg: AYBFou0I1ygrZnIa95pYosk6a2LsTHQ0POmcepr5lAFgXovcgOHxnUVYBe6lzfEuXs2
	dumsZyrlQCZTSqxUpksfFGQ+xprMNcONzMySEkA25zUxxM9fIwputqEReK8HQqpJwc75oYhN55c
	rFCnPDhfhOep5lFKpkYq1M+SfZdHlUXKQXFT33e2qBMLp8UnEtDqYGRRpkT8OYJ1Wqln114hAAh
	ygFKZBcgCSw5GPZsl4CojAoys9Cm9U7thw1keSE4BEYzHeSy/PJxQNp85WSPqg6YGaU8Ph5WCKh
	ba9doqhXNLI5j+cfPwhKah9BFJ2TVP0uDZFYESOtnNAGGAvLZ3ZQyWyIV0vWjHPJUEjelEszH8j
	WVVSdpScuJjGBUSz7UtqkVb/lYTnG8QJIsWqGH+5t04RacYc0e+Tejs7KBT6LAhhWGpMV3fw2gJ
	I6pkPWIH2XHj75TeZQY/2mfx6Ivdek9I88Ja0P+HjN+dExxCA0C4phA8mapDIEZtZewidx
X-Received: by 2002:a05:6870:b3d4:b0:475:a1ec:9621 with SMTP id 586e51a60fabf-484778f2bd2mr4152184fac.35.1789594613524;
        Wed, 16 Sep 2026 14:36:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:947f:31f5::4fa:4b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a23e310sm3387557fac.12.2026.09.16.14.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:36:52 -0700 (PDT)
From: Frederick Lawler <fred@cloudflare.com>
Date: Wed, 16 Sep 2026 16:36:38 -0500
Subject: [PATCH v3 2/2] integrity: Replace integrity_audit_message() with
 integrity_audit_msg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-report-hash-error-v3-2-73e5d95e9efe@cloudflare.com>
References: <20260916-report-hash-error-v3-0-73e5d95e9efe@cloudflare.com>
In-Reply-To: <20260916-report-hash-error-v3-0-73e5d95e9efe@cloudflare.com>
To: Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
 Frederick Lawler <fred@cloudflare.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985; i=fred@cloudflare.com;
 h=from:subject:message-id; bh=z2tQHhAwEFt+agCaRWeVzBR9XVTRt1GIp8bQCvmiYuk=;
 b=owEBbQKS/ZANAwAKAasltHYDktNtAcsmYgBqqwvrmVrK7ESQgDOkwOK2VK1kK4+HrtNpxxvea
 iBnILRGMd6JAjMEAAEKAB0WIQTLNBqMVmu1PHvjOe2rJbR2A5LTbQUCaqsL6wAKCRCrJbR2A5LT
 bV/uD/9wvueyIbMy+vcKKZMyE4dXComXFcTtuZRJhDcc5DnG+h+yNYsKK4JLnE1BKm5i3Vog4uP
 DZXGjaJVBZ6dYP6FG5oIKKyE6xe5PQzylgbOhDCQQH1Ogj+kO9bwdc3aliPDrL2nCk8Iq4S/bVF
 EtlxhXPDl9jQjhZUJIa5oaY03bXz05eZehXZhHxG6Pas6SLhZBbgSdmMrtcUDaFagzJT80OL3gq
 jFmJngTlmZJUHZyfwazPDDTx/ltZTzrt/cCxjE98xkFEA04Gq5QkHfgb3dazPMuffaHI9sTGLzr
 JqFqMHc+v1C0FZeYxI8SYGZM5/wwzyYwLsqhg/JadVucvL/64vh/s46S68VpsRUAXFD9jnPCXeD
 8pvpAQOVW+adIVTCdKVggnu85//0B1fgKXffGaznAde2/zAXwmTEZxb6f/03ygRr0HRrvsrRPEE
 z1pF4piiWMlwVqorNuMn0hPNNHzdjvYyJNAIpRn/1VA/LpBHpw2Q7pyAUgjF0KPQgi+kda7hfaw
 spcyEl7Xl6f4xGZPR8N8yQaFDNFUlPr8mMK5fha85Zutm9aikQE2nx/iwY/JpUEtldK3e/SCI1m
 jxM6ZIvzlDVYF/nvfe37LanXSxyJIq2sloWsd7PGzWyz00BXBjgS2T+CiYMb5DcxBDPtdocdi2H
 7nBu+Ssj5st78Rw==
X-Developer-Key: i=fred@cloudflare.com; a=openpgp;
 fpr=CB341A8C566BB53C7BE339EDAB25B4760392D36D

integrity_audit_msg() wraps integrity_audit_message(). Replace remaining
call sites with the truncated function name. Then remove it since there
are no more callers.

Signed-off-by: Frederick Lawler <fred@cloudflare.com>
---
 security/integrity/ima/ima_main.c       |  6 +++---
 security/integrity/ima/ima_queue_keys.c |  8 ++++----
 security/integrity/integrity.h          | 13 -------------
 security/integrity/integrity_audit.c    |  9 ---------
 4 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 9e80f40680d7be08d14d26ba48ed334d4e4ab10c..bd9997b01633d6235fc2fcaa9bef1931d6ba7247 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -1196,9 +1196,9 @@ int process_buffer_measurement(struct mnt_idmap *idmap,
 
 out:
 	if (ret < 0)
-		integrity_audit_message(AUDIT_INTEGRITY_PCR, NULL, eventname,
-					func_measure_str(func),
-					audit_cause, ret, 0, ret);
+		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, eventname,
+				    func_measure_str(func),
+				    audit_cause, ret, 0, ret);
 
 	return ret;
 }
diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
index b5ed33cbb272fdfaf7f5e945137c56e46e0d7db1..8adc8863ad5a540bf0c047ba47cc4817fcb46e9a 100644
--- a/security/integrity/ima/ima_queue_keys.c
+++ b/security/integrity/ima/ima_queue_keys.c
@@ -90,10 +90,10 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
 
 out:
 	if (rc) {
-		integrity_audit_message(AUDIT_INTEGRITY_PCR, NULL,
-					keyring->description,
-					func_measure_str(KEY_CHECK),
-					audit_cause, rc, 0, rc);
+		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL,
+				    keyring->description,
+				    func_measure_str(KEY_CHECK),
+				    audit_cause, rc, 0, rc);
 		ima_free_key_entry(entry);
 		entry = NULL;
 	}
diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index 2ab6b7e34e7ee2dd29ae03ae1fb45fa26d9c032a..52c5ec881cca468bde72c885cffa1c564877735e 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -221,11 +221,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 			 const char *cause, int result, int info,
 			 int errno);
 
-void integrity_audit_message(int audit_msgno, struct inode *inode,
-			     const unsigned char *fname, const char *op,
-			     const char *cause, int result, int info,
-			     int errno);
-
 static inline struct audit_buffer *
 integrity_audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type)
 {
@@ -240,14 +235,6 @@ static inline void integrity_audit_msg(int audit_msgno, struct inode *inode,
 {
 }
 
-static inline void integrity_audit_message(int audit_msgno,
-					   struct inode *inode,
-					   const unsigned char *fname,
-					   const char *op, const char *cause,
-					   int result, int info, int errno)
-{
-}
-
 static inline struct audit_buffer *
 integrity_audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type)
 {
diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 2dd2d7e3916e7bf35c753450315ff22e2d0292b7..22106aaeb0df21fef0990b80611dcd13cba112be 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -29,15 +29,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 			 const unsigned char *fname, const char *op,
 			 const char *cause, int result, int audit_info,
 			 int errno)
-{
-	integrity_audit_message(audit_msgno, inode, fname, op, cause,
-				result, audit_info, errno);
-}
-
-void integrity_audit_message(int audit_msgno, struct inode *inode,
-			     const unsigned char *fname, const char *op,
-			     const char *cause, int result, int audit_info,
-			     int errno)
 {
 	struct audit_buffer *ab;
 	char name[TASK_COMM_LEN];

-- 
2.43.0

