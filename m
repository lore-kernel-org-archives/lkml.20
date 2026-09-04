Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD33C109F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557042; cv=none; b=vA01ZHONYTblz8A3oUt6JPuygtSjIQh3djeX0I3cTr0bU41xGhC5vAXm7Gt8NVSRzsarUe0cZX3DmEuMcudKIovB/Io5eY4XMhkKbAkcVCKhgYoJPalBvxGMkBAhYnoPm8i5kOrpEQuSkdptqHDG8Rxt5OtZzpRjgZqQS1Kq36I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557042; c=relaxed/simple;
	bh=3e74kbxsHUlzHuDQNs2xZxFXfPJyrE7viXZKobuCuW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TTiiKHSSnwyLM6rLskgRKHR5XI5g7CLTRi7/5VkLl48fOKdpvM8JDjkhXduwqtT0HF1nv5pxH08dcSTwhb0Hxq+N7G6WsgR7Qy1aq65MJh1hZChvURf3mRHd78+HdmQSyuvUPxxRpjFfdQpQ8pz+ySqU0AdIpbgRQq7w3SwBjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUhLSYYs; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUhLSYYs"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1258060b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557040; x=1789161840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8w5On1qTNLM11WhcuegpCfcpBER+s9xNoM1vyHsy4c=;
        b=NUhLSYYsydimH9ceNJlM/66kmNa7CwwBgEpKjLgyMAr15UNCtE+6zrf7Do34hiKZZl
         12iInjxsQE/q6VyzfRVnzXkzNyK72ekmIobHA0wtBOiyOsJo1EweW+d3lL5AO6Fh1WR/
         yEp7KXeuRTlL6BZ84dUbqooptQuqZwNP0KD2s5YyJ6fzin8AXJwjSI6aLrViUb9xbtaQ
         Bg6jVYMRHN3dDwx/2BbUFfq0E08B0dkLfVBzKsDPaxEHj9fLPUp5Vn31EBq+ZJABHOMJ
         F0coKY5S/0BtA8TpUdgY7aSI4hitUlOzqAAr1ofVKZiqx2S5ZXelH4f9mMQ8rdxlIBKY
         j7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557040; x=1789161840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8w5On1qTNLM11WhcuegpCfcpBER+s9xNoM1vyHsy4c=;
        b=MO4No2pqZM+Y0JWuuXQVQ5kM6Esz8AGLQ8zWXE3l3K1lC8dMOmWLIT8M0ifpk5qh07
         UAmE/8mihzLx3DmK5Rnakvy5iINLMxkjeMznRpfI9QRnKPV2WbsrUbPpnu0NzhYcEo05
         anBfFml1OjNenhyJx/voXijn2nyyhbzb1IvUxD6ADBEFonCZVJkdMX7HsqAjN2121+6v
         Z52ff/a+kgxuOOrRqfw0b6UdKLVt+sA6t7TWU+rf5lKdk/f0SDr0y2FbDzLObYjmoa/0
         EE0pFdjyiX5KRXK0mCclIF1dkLui+JJkSR/YgS/Fe7Vx/tpAxnyWDl4apvW4Q6zZoLzd
         We8g==
X-Forwarded-Encrypted: i=1; AKwUvBzHHwrNE5Z0eZFkreR4loEv4Awx7JjyV2yt4DXZAFDeHopRYCIIYmKMi4SYGrNSJtKkU1ZBrIhccvu8a+k=@vger.kernel.org
X-Gm-Message-State: AFuF++ndVcY8k81N7DP/c+B+JlmTIAS/3TeIRSHVG/F8VCFO2KEb9BIQ
	r/xvKWFkxXDysIhtojN0OzrUuuHKAqB/+OxzwIzTl12EJ3OpCcedD4f+
X-Gm-Gg: AYBFou36Kpt15KJ5h9+F4tM2RKsFOXL1+2K7y36m8yz+bZtM9FA4IMnuc+kYkp/f/EN
	QcFpsF40vK+1w9FtDYlqHDoIlx2L0QPMHWospTDJLOMv+JjdxrVbnr2ZeHI4ezg+PzMI6yDITqB
	zY6jEi4J9i+QmW19Y3Ii9QnubnFfCIbx0yHENB24conjJ91c1xDrv/oLHHDlcYp5L+RhVQ0bYxH
	uSQy9EHgM3R4qH45rcRPySAfKxU8kXcAUmKa9BHDEm4y55pUXpwloc7+3t2e8URB5pw6Nf+a/xX
	x32W5ktO7e00zIL81XHGFYcTEQJvyCKKBbLNhcZsaQ06Vkp9ZBtQbmsBljQYto9JmzO1QGPaNVc
	5hVcTOKKhCrotOrYMKKXRcwGeQw5J68Tq9yGQFQ5URXuy1Di2aWzSujhCluHS9H8mQE9h7roppx
	SBJRfZHMtaPiPpV4dwyx6EIRNfzHZL00C7Ya1sruZef3U1fsdX1rxMWcE76q7nB+oXaVblOIEQh
	mn1ZxxSYHV5Lh7p9+Sl37OkpsvUrf2ws0lavQOsoc86qBcttz+23xYB3TqZXVLfW5ovIWCTMrej
	XkuOo+PzR9Yl9xE/fY7aRaXmkQALV62ByhqHHA==
X-Received: by 2002:a05:6a00:b94:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-861660e2f8amr11904703b3a.4.1788557039953;
        Fri, 04 Sep 2026 14:23:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86207a4d602sm989020b3a.22.2026.09.04.14.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath9k: free clone buffer on fi->bf overwrite in ath_tx_setup_buffer
Date: Fri,  4 Sep 2026 14:23:57 -0700
Message-ID: <20260904212357.85611-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath_clone_txbuf allocates an ath_buf for the last stale subframe of an
A-MPDU and stores it in fi->bf. On retransmission, ath_tx_setup_buffer
overwrites fi->bf with the newly allocated buffer without freeing the
clone, leaking one ath_buf per aggregate retry that enters the clone
path.

Clear the clone's references and return it to the free pool before
overwriting fi->bf.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/xmit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/xmit.c b/drivers/net/wireless/ath/ath9k/xmit.c
index 89930eaf1fd3..b12eb878d5e7 100644
--- a/drivers/net/wireless/ath/ath9k/xmit.c
+++ b/drivers/net/wireless/ath/ath9k/xmit.c
@@ -2264,6 +2264,11 @@ static struct ath_buf *ath_tx_setup_buffer(struct ath_softc *sc,
 		return NULL;
 	}
 
+	if (fi->bf) {
+		fi->bf->bf_mpdu = NULL;
+		fi->bf->bf_buf_addr = 0;
+		ath_tx_return_buffer(sc, fi->bf);
+	}
 	fi->bf = bf;
 
 	return bf;
-- 
2.55.0

