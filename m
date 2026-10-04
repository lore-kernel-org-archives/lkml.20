Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625B4483AC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117496; cv=none; b=LiN3USw888GdTVpgexMQORy1ncRIEcgBnEtK2Nh1wi2NCEIrBtTTh7AV7nFOT6dw8BsC3lQ0nDBdknq26p+0mVx0hDlk6n0+jT0BcWVkxd10iHTkdp+N+cSC8YLkKcVCwkLRsPy1MPNkTvQv+pVpCl15ZTJGdLROQ7K8hKWZA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117496; c=relaxed/simple;
	bh=nbzSApltMb6Mmzx6pDMX1NHejjTdFwoNtGdhP2hrtZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqyKAK/lGKAiZ9fJ8LQKBTaOWsE3IpXZRGCqp7wrTZkkEXJJjJpHDSj0b25F8RumFmOq6uf4vH6VjyC4i9cCHfqpwjdZJtUXzcnqzIR7XKC8xE+2QuFjFC1fYhIC98YNo/c5L2gWBJmhXfy2Ko9U75ubM710TBx/MQvslfmnY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe/xnYgd; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe/xnYgd"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7beb81b2834so178740137.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791117493; x=1791722293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QkwpOl3Lc/mMo5+42pmcC+xB8UyEuLu9bt8ien1zho=;
        b=Fe/xnYgdWMRP4f6wvTn0qxbpFH+eCkwc4Tey/pf34voNKiuZPzdVVEAOxLr+qMbcYB
         hcHOtSPi6Bay/NaDmz8brARS6H/hPucNHdIG7IR5gMgUDJCnL+ZQEVW+NWty3GaOWiTv
         TRfV+6/UeNx85B/9ppA8rXMZSGAqg4GutuaStgh7nr61k5cCVrPDiMOegyddFm/dw4yG
         VLFhUsSGHtTIClm2STdjl3cTrrfRJQJzamQLezU29v5gD3PVoU+9s7mHvMTtTln9wtu6
         n4lLvANQYaYuhYG485R/FS/xVnSrgnaTHPM7F43ZVKmI6qfdZGP8BzIntx8E8p0okbB4
         +G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791117493; x=1791722293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QkwpOl3Lc/mMo5+42pmcC+xB8UyEuLu9bt8ien1zho=;
        b=OGwwRv9s60pkFiaxPEs1ZCfn/RzUBGB09wijpFUpk515pMFrL6+nTTZUaeMX3WAqc/
         8l5CnpMuZtetOue0mZ01jHOeJvo3vFW05yx+rvuw1H6uH6U+wW6pP1MMgaN0jvDkm289
         i0NLHFjj3InztajJCt00wkftlD7YI4m+JWbfRW4iEmFkN4xsApzbfcKvKPBYLkPTfI/y
         JVF+fTxtJBL9RGjmbpvTfnZSKID/1wUPELROLNsfKc/ltEG6GM1Inkc71+E0ZrTKadyN
         lmpdpQl+ATRmOISpjygtlDFbz5K72LM8IgaqzoeqVCdN6sL2HYIXZ1HAUGQ13mOrFZde
         r4hw==
X-Forwarded-Encrypted: i=1; AKwUvBwpzsAlncHQQw4Mstf5HRB37t0/DW9aEgC6HBiz0HMw/TodqE+q+z1YnV03YhtrthyqqII7L8eEWOgTeN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA9KYLk8awOXPY7AH8dNUfNRuuLWWGUF9IjwxPaPXho4Qdrzuy
	cJug/Om6e5rqBhWNliSau4hOBM+s6LDDehY1yPTit4hLoqVU7prGgo54
X-Gm-Gg: AYBFou3EBFxsnO7O5DiZEw2ujx03dMSaRc/YdSL8ZU52nrBXJJJ1mU5vpi8Ibj0ENKc
	7gQHc18kk9A17pyPbiFyK6RyLOrjqnhzWNFi2dt5JQRi8+CQEU/NtVZ8xJwxKJEaoC28u8m8Hiw
	DqtzsIXjnhX5y1Pxf0x8ooJK8PP7JNygcZtzLQSdDQMWrVWCsnFTirqGq63pARMmNQZiK3GfHqq
	lQUL3gy4QJwn2ZWrNkfh7X7lT0hOPp5kqFpGjl1IjlPgSqvch+5YghHplEs3YoESj/T5jidECa1
	MJ2o41aRxDRUZ8AlbLgKs81gDmaS43kP2clyV3xEJ85JsTKqho0itx/jrgLLiyoL7Jgr5RcS0m7
	urCnBrjN/X02so0fbeG2Myel94C+GaSIhAIpLi2GoxoiQ4zwGH05ETOcxlG/98jjBtPD1S+yx8K
	23hygjk0QPdcUMwYu2hK/gyjukLkorMDqKwg0g2PtaQNcxLQsHILUVz/oVSIRvZBhh4g==
X-Received: by 2002:a05:6102:f08:b0:7a5:9a:3a31 with SMTP id ada2fe7eead31-7c0f5bb206dmr1662153137.34.1791117493357;
        Sun, 04 Oct 2026 05:38:13 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da641688e2sm10530137e0c.18.2026.10.04.05.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:38:12 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	stable@vger.kernel.org,
	syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH v2] ecryptfs: validate auth tok payload size
Date: Sun,  4 Oct 2026 09:37:55 -0300
Message-ID: <20261004123755.14642-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate that a key payload is large enough to hold a struct
ecryptfs_auth_tok, and that the password token's
session_key_encryption_key_bytes fits within
session_key_encryption_key[], before the payload is dereferenced.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
Reported-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
Tested-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=03c68e42ce4b33f7ce9b
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes in v2:
- Add Reported-by tag.

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

