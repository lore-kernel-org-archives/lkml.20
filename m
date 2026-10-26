Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025301;
	b=JXLfcbxVIyzcGs/MukUf+yj+gABa+062wpJYZY78+mhdNY2LwIq8bW2RwUJYBNulAOqR
	 0BmndcMWpYJxnK39V6945rAD+QG6x0jC0ceTBUZreAi8I/byrcAvaO0GXjrrhSg6JobWf
	 tRg9f6JITgiWvbzNAuK6vYMn9svZUTnXggokFfZorWr+QBlqTBNQyQ/7+eisxdgOqLoNW
	 WCCSTiF/oe+Xxqd0WsiZDyAft59us9qh0PtzcaFjaja2gVHJ8ybc/JLkXxenF6T/Qg/Kh
	 4MWLWqco6LIKvKFyJU899bdrgHidy9ouCb8f5dS8gGn7LXozV1fGiqv6KynI1lk/3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AJlRJiaUb3FddV3HcvW08WgUihgRnnw5sljfSO1z0r0=;
	b=JoNBlLzS/sMNs16IIRco5wVZXHmM26w3qj5jEeQ+siiaazzAzhIfKjxQMmv2DBH0VWPY
	 q6tE7DCceKyrEL/0dqDi/+74QlOdyXULF1j7e1QCBH3wqzSt3jOP1k0JXAdQAwJsAmHzQ
	 szi1qdUmxPwT3ZUD2oeQTDkAXfbTxWZosPtlpdINXWuqq8eeli0e8l6w0Kh/nStd590N7
	 juRKszoRafJuZJvKwRVXXIawRCV8Bha9LGy8DT3+KNqNdjx/cm4uwMh+SDp9bGLneqdJh
	 7qa8LpjpdNB7NgRA0EWU6Eiskd4XKjVs2IUGBGQ95DhyeF79rgq9TFTZHinwhbMfG7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HEoG1wDP;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E57606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HEoG1wDP
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so4754403eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025300; x=1793630100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJlRJiaUb3FddV3HcvW08WgUihgRnnw5sljfSO1z0r0=;
        b=HEoG1wDPpreCiDZtpuKMMHCqi6tNBz8P8HdgZsipTD6JZB3Oe+L/GznHVJDLLCkYUU
         EuWvDMf4YuXJz4YEi079n1+46QJVbhOUUEdD0loA6zhLQoklHNd7pIg0v1Yd5uw/8l5V
         VKSxUeOj4tOBZYlatIK5DZtfAZkjSonU1k0Zd2OVDBFBWZr6RuDv7hBgGVB62YOG7C7U
         NtTXHKPT0CxtJEfrrSrLXDKRKgQqJfe4t12OBHyZLjg5wZ8nSwOJSQ5wDZX5FUS9P9hm
         hF5MHfPOCMPhZ7mwxQGvat47SHtfW9cX+IxnYDsaUcjqo3CblftWui530cz62+imm5gC
         fcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025300; x=1793630100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJlRJiaUb3FddV3HcvW08WgUihgRnnw5sljfSO1z0r0=;
        b=IrPhp1k4wEdRJG6QG2MWlOq5bw6fFZkyKiQjJH8ads22AZeYXPocKNpnBqovA5eN2n
         CbH9l2mCm3Xxpg6+24Ij5NEmguMSwKmt1wG+82OZUDdv0ywrAiPja6JS8K41EjqbDzsy
         wyqGH+eeuL4//yNQAleLTxtJNia0suRLGrUmBBpo9bAvgu3wglJRp/VosRotyxqzk3S1
         yXBimZEYY7ChR9+auXQzMFWfy9mJ5K61+bUw9EBukMDv2lW/gx2y/h0AmvZk5EXcFZ2e
         zs1u+Vq+IKLNQqrvtnQgLPBnV6aTYIaxjuNhzW9fHaBq0cEKd1NOeCTRxzveb4uQCUpu
         bYpQ==
X-Gm-Message-State: AFq9FYKdDQIZ02rXxKAv6Xb2Og9rKw9IfWVV6v7x+WPRgZJix3qdSpWR
	JLlIpdkJoFIXxQtaIpa0k+OzRO8DiIDsjq4GoOnVNZGo/OfEofB5ormC
X-Gm-Gg: AYBFou2xqaow4YYP8YJSndtHmQyxTrgTtDbJmjo7zwW1RbDIve2L7GrpaWCBIQMCAcE
	+jnP37ndeT0ucAdmES7JYvJ8hgcWRihGtyy+9NHIZtrmSNTb9EyG3ZxBUeK0OgnXXxxciKh8e1z
	XPBpQ4Y0ou0ISXZ6WMXRuBKaK/LhgEZpqTbROCMJA6sTr4p9SBWgYoDlvQ2QluihC9VXtltVicw
	8Tqt4zj2oiFZavQLJpD4Xa8wKnLMinCah6IpDRGAnsgVPLEHJNyZdQeAsJEu6V+aGIKxRgMFkyK
	h2MabMLH6Zk69s5cwzcs5UzIm6hPnRACp5+sKzOydHhIJZPI0icAXnAjkoP2+4y2C8WxjX1Lwyy
	ctkSpLaGgzXjaQ7TXSDZSPYlBDkEiYgI0izDCmYfQihKi8ZclXrWvS3k6bvFwnqmBn8tuXnVg4y
	RDB+PdsRuJbeFrohsEtkfv0Vq71cxjF0ar4Qt4M714+SVCrCgZtAWDE2akgQwVlQCalo3PvN0j7
	4ufzIZbo2jb2h45Bt6ad6f6MFC6zJtJts5K3loJLadAkYYtvp0=
X-Received: by 2002:a05:7300:c00f:20b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-369e84d7f7bmr11143154eec.37.1793025300231;
        Mon, 26 Oct 2026 07:35:00 -0700 (PDT)
Received: from spidy ([106.202.59.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm7841758eec.2.2026.10.26.07.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:34:59 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
	Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH] befs: fix shift-out-of-bounds in befs_check_sb
Date: Mon, 26 Oct 2026 20:04:47 +0530
Message-ID: <20261026143447.201827-1-gowtham398gs@gmail.com>
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

The consistency check for the block_size by using the block_shift caused
integer overflow. Thus a max limit to the block_shift was defined named
BEFS_MAX_BLOCK_SHIFT in befs.h. Also check for the block_shift was added
so that overflow does not occur.

Reported-by: syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com
Closes: https://://appspotmail.com/bug?extid=fc26c366038b54261e53
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 fs/befs/befs.h  |  2 +-
 fs/befs/super.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/befs/befs.h b/fs/befs/befs.h
index 7cd47245694d..c395eb5e9a10 100644
--- a/fs/befs/befs.h
+++ b/fs/befs/befs.h
@@ -13,7 +13,7 @@
 
 /* used in debug.c */
 #define BEFS_VERSION "0.9.3"
-
+#define BEFS_MAX_BLOCK_SHIFT 31
 
 typedef u64 befs_blocknr_t;
 /*
diff --git a/fs/befs/super.c b/fs/befs/super.c
index 7c50025c99d8..e515e98cb3f4 100644
--- a/fs/befs/super.c
+++ b/fs/befs/super.c
@@ -88,6 +88,16 @@ befs_check_sb(struct super_block *sb)
 		return BEFS_ERR;
 	}
 
+	/*
+	 * block_shift check added so that overflow does not
+	 * occer during the block_size check
+	 */
+
+	if (befs_sb->block_shift > BEFS_MAX_BLOCK_SHIFT) {
+		befs_error(sb, "block_size too large, Corruption likely. ");
+		return BEFS_ERR;
+	}
+
 	/*
 	 * block_shift and block_size encode the same information
 	 * in different ways as a consistency check.
-- 
2.56.0

