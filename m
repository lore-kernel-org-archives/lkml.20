Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33C4908AC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887542; cv=none; b=k6p1jKtTL5bb/kHgFVLR1RvsehT+UrdC7B2QE95bZAJvjSc0y7FnxIop2ZdiYRHmsFXB8gz9w4meHeVZeK0XeIHwmA7I9OO07bVzQsUBtMh3wU9xZmYIGpPXYQctPRYt4ATJh1liDYLDEhaaBjpX0p24WfGk+LTd0Qz3ggJZHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887542; c=relaxed/simple;
	bh=k+dw8/R2WqLZNu95k8jgGVbQ9TWiybediAKgdWrHS3Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S613wMbkX8oaMlyDI9eaWaVf+sMwu8r8XSe5i+CQWt/uUFNKiiG0LNY8yLnkasQ+vT2ilnAZ80kFPaJIDvWascNR2iu2qOKZQeY7TNfNaUL+nRo6axzjhEoojppcM0Z6tlcwywoq2+uubMssLEDvF1ytdbGl4KZnJNG+I3L0ho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82169fb66c3so1615572a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887540; x=1791492340;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+MH95l8i4XH/ZmIyTT0aXklaGidQuE9OJxWMHQcx8CI=;
        b=flB/PnCf5xLdvc9xl+QYW0rlmeBgk7LhEgSTGLJYn7coFn86aHlxJLT+2c4n5b/dkt
         1MdZrZxMZOGcdZ4PLsH/C7fW5gyfCGfWL3iUXFnsf7I41GNz0miB/yuAlTU05LtaAoIx
         a6ExSjdNrxyk3KCiOydibZe1Y4PiH1ODMmcOFLNST6kT+hBBi5Y8IhTUQmAf9zrBUed0
         ZZA/YeWddQf9mwutJj5bBwtq/LkIjmR3SPJA1TsGOirkS277lYK/sXWseh//8tak6yAU
         +7vM2F1Ups362uYORyWpp7YUVpGfIUCxDQ/OBKksEQyjLgMM6CoWmLQNAfT3EMhw6Dgk
         1G9Q==
X-Gm-Message-State: AFuF++l6fogHBk5ChzxNrTUvqLhQ38Sn4X17lWDMsRpycXJR6gNvbCxj
	d2bsvdCE4wQPgqKfhdFM0F8Z/LGvtJwoT6t+ioF9cGdvvMENyS0AzZuBpsb/Y26D68Z5a6AzPHj
	devVn5pQlz34rWrpv3TzyLNQYFfaRJlbHiGC2cRBCqwC7cfoIjjjn9cQtUwc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c48:b0:4e5:c2b4:33a3 with SMTP id
 5614622812f47-4f52b0a1765mr274445b6e.45.1790887539934; Thu, 01 Oct 2026
 13:45:39 -0700 (PDT)
Date: Thu, 01 Oct 2026 13:45:39 -0700
In-Reply-To: <6abebdfe.7503fbd6.2d3f6.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abec673.7503fbd6.2d3f6.000e.GAE@google.com>
Subject: Forwarded: [PATCH] ecryptfs: validate auth tok payload and sKEK size
From: syzbot <syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] ecryptfs: validate auth tok payload and sKEK size
Author: adrianox@gmail.com

#syz test: upstream master
 fs/ecryptfs/ecryptfs_kernel.h | 6 ++++++
 fs/ecryptfs/keystore.c        | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..4315c18ba1cd 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -88,6 +88,9 @@ ecryptfs_get_encrypted_key_payload_data(struct key *key)
 	if (!payload)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (payload->payload_datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)payload->payload_data;
 }
 
@@ -124,6 +127,9 @@ ecryptfs_get_key_payload_data(struct key *key)
 	if (!ukp)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)ukp->data;
 }
 
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..7f2dbc81fcbc 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -477,6 +477,13 @@ ecryptfs_verify_auth_tok_from_key(struct key *auth_tok_key,
 		rc = -EINVAL;
 		goto out;
 	}
+	if ((*auth_tok)->token_type == ECRYPTFS_PASSWORD
+	    && (*auth_tok)->token.password.session_key_encryption_key_bytes
+	       > ECRYPTFS_MAX_KEY_BYTES) {
+		printk(KERN_ERR "Invalid password auth_tok sKEK size\n");
+		rc = -EINVAL;
+		goto out;
+	}
 out:
 	return rc;
 }
-- 
2.51.0

