Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526696;
	b=rM1oyzPStSsv7wbM+sgwFTdJ5PJLfmyWsh7oot8ItfkutimwNCp8OYFbd9b8Szm0wnMx
	 Uu2+m0q5mnuNeYJS2MRBob2WuKMU0x78kb5wRAl4HUvlAQ94PsHrmlVS3UT0HF9c3CoP6
	 ZGelAudCSgImLA4yK5/9TVUhtiPHHfpn83xXpgEo+cul8KMUAbBFGNsYjQfI1rTWoyIR+
	 mPQBf0M8MCxlEQJr4j4FaSq7Sip8+yj3S/NfaWxNZ82FIhqXW/5NCltgMkUTrD6BuPSWC
	 nnMzHUvdz9xROx5Pze/CXN5u4QIgGBOJy8SifBtPL/Gxv+PRv8ckwN0TF+ciqH0LeCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xMZTvVnvR9FWtNNDaBKX050k2N0y/5tjvvOdwrkPXQ4=;
	b=wth6xYGcMRtjdCKB/VgqCTJIA3IqHZBErH8S8QonjWjgr0wW/JRHSP5J/2vvPPUrG8B4
	 wrtllIb/y9wuCwH+Slsc5Aq2fr3t2U5yBkHGT0qqEOnTqhMMRyZflV4Y9A2HvmElXmadC
	 WjaV+uY7DGFo5lNc2ON/Y4s4XpvZ0WDq5oylM7ylYvyECzHCmed5ghj4fI7bzMAP3xtw2
	 kxRSPI63c24LtOqPr8xG5kuHrHhtpR1PVHdn9nPrypmBzfmQsie3r+mbRiWbB+9KHeN4e
	 Sb+UVz/JPmCDqjEUKYdu02PiSZKqWO3cNAGTMtrlD1xnuXHcaQTdxJEbdHsAY2vKFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="B8NJI9S/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B8NJI9S/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so19383245e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792526694; x=1793131494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMZTvVnvR9FWtNNDaBKX050k2N0y/5tjvvOdwrkPXQ4=;
        b=B8NJI9S/eyruMrE5iJnI28LVu3YcRWv5BuNg9PYiDjMh60lTmTouCskW5ErpvkyeCu
         +HD0/e+/sIidcUIpKv+rBnUJsCKYSMYjoPvlCtjLS4/lDrbL6eeCkd9squSRciqznx6N
         06rmR4ADVnDzBfkubL621eFSYn2cvgyG14RTG+KR10AG1RPR8UfW6gXITMdPthPMjkCs
         0QIwM1Fy9grtqRUm43WwOhS5ObcVZBCUYGgr/IHXYAeD+NAAQ7k+HEO9d7fuEgHkBG5y
         Oo2hdQ+4dNYZRfuS9hbKpzentIbfqoTdk797DdcpFMhK/6WDh/l+6Bhg/6LbeZsMvz0H
         V3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526694; x=1793131494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMZTvVnvR9FWtNNDaBKX050k2N0y/5tjvvOdwrkPXQ4=;
        b=KBy1J0ZFmC7iKOeqomwvunUR9V/tLzz5rWTQtCciYi1xfbXm82h1YKH4bJaFDjCJGy
         n1oXIrwY1FGwzbrpH84ISDPyn09bwky2gdEEAA2ON8f6f/qLkiq7mCqY/IzlBSEyLsLj
         Rs2rYNggvZ1R00yZgrVmct3zsPDuXRG6FQ8XMvXYK48vgI7cqPEpEAXJ3Czt/q57S0sl
         vEhKR0C0raHmcQQfzMILOJODLp70u5XI+o0xWJFwpudREFUwu4T1OzL+cnmnXy2zYMTA
         azxzwciJxIz6pCyJ5wfskWAgrB1bdB0LvCkfrGwf29v0MbLE/Krkl1TIDIz2LKu8I5Oj
         DRLg==
X-Forwarded-Encrypted: i=1; AKwUvByL84RDNx8I7WCAewTVAFV9eJPzXtoSAaADZl1mZRzA6vALhOCCjrKZ4jDgK4qZifrLK+uIZp7QXsCPi8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJC1usJPhYj9m4hSjvZ4TUF39YYyhCyE4pPk2ehto9ZkwgB3EZ
	BEgaeWct+NrXqg5wL21efM/rGse6QmL8SiB97RH3VAAJ5ZLDJSPDS5KB
X-Gm-Gg: AYBFou0eK2MSIPvbUuiMgdVja+Hxa+3AUrAuj2NVytNwOzKqpSfe9dkuEVopMK0/KKU
	AmWVSUf4GQXIa67ctnRpHYPa6A8n0fp1eDNK7CkluwqGdS0ZJUUp6/yg1DUg1grsjYjNUFJB/Sa
	T2is4J19n9R+aQVYi3bISnFMedAtgEP4ntOKS8UqRm8JH/bJV/xj9qQWerYDaqDF+54l5Gz/QBT
	rqsRjQ2ZiN+aMtXavN3FnFCJyA2z5LF+Y3dsMODRUh3bnETWikOHfLpNQcntoRU5tXbf+p5QHEP
	bDuHmi5gcegEjfY3x9x4mKkHpMCB1IpAVVHuWthuvpKElBrp3P4F9dk+3iavbdF87ljdZNcM+qj
	1xm9t+ezfnw9gaTIDp9clytP0JmcCboDDu0u0UMiwYhwz6ij0Ri2/oyRpwlxAMXaFzkjx42hfKZ
	js/kd/Vt7n1pBj3yDS6kE2KdZarrtX9YJiEyi6x2LRT2hKv2tA7o7pY1WS0qE2DubVqDB4KFUiA
	fBmmMNw49FNFLk=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a1d7616464mr263477385e9.27.1792526694104;
        Tue, 20 Oct 2026 13:04:54 -0700 (PDT)
Received: from linux.tail9b532d.ts.net ([194.9.6.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb96bc7dsm22714845e9.15.2026.10.20.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:04:53 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: cem@kernel.org
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>,
	syzbot+9d8e687768d0f38c1f09@syzkaller.appspotmail.com
Subject: [PATCH] xfs: preserve buffer item with outstanding references
Date: Tue, 20 Oct 2026 22:04:31 +0200
Message-ID: <20261020200433.3298861-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The buffer log item can still be referenced by the CIL after the buffer's=0D
synchronous write completes.  In this case xfs_buf_item_relse() is called=0D
from xfs_buf_ioend() with bli_refcount non-zero.  Freeing the item leaves=0D
a stale pointer in the CIL, which xlog_cil_committed() later dereferences.=
=0D
=0D
Restore the reference-count check removed by commit d2fe5c4c8d25=0D
("xfs: rearrange code in xfs_buf_item.c").  If references remain, keep=0D
the log item attached to the buffer so that its final reference release=0D
can perform cleanup.=0D
=0D
Build-tested: fs/xfs/xfs_buf_item.o (ARCH=3Darm64, W=3D1).=0D
The syzbot report does not include a reproducer, so runtime testing was=0D
not possible.=0D
=0D
Fixes: d2fe5c4c8d25 ("xfs: rearrange code in xfs_buf_item.c")=0D
Reported-by: syzbot+9d8e687768d0f38c1f09@syzkaller.appspotmail.com=0D
Closes: https://syzbot.org/bug?extid=3D9d8e687768d0f38c1f09=0D
Assisted-by: LLM OpenAI Codex=0D
=0D
---=0D
 fs/xfs/xfs_buf_item.c | 3 ++-=0D
 1 file changed, 2 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c=0D
index 1a4ef34af8d..80f0cf12825 100644=0D
--- a/fs/xfs/xfs_buf_item.c=0D
+++ b/fs/xfs/xfs_buf_item.c=0D
@@ -80,7 +80,8 @@ xfs_buf_item_relse(=0D
 	trace_xfs_buf_item_relse(bp, _RET_IP_);=0D
 =0D
 	ASSERT(!test_bit(XFS_LI_IN_AIL, &bip->bli_item.li_flags));=0D
-	ASSERT(atomic_read(&bip->bli_refcount) =3D=3D 0);=0D
+	if (atomic_read(&bip->bli_refcount))=0D
+		return;=0D
 =0D
 	bp->b_log_item =3D NULL;=0D
 	xfs_buf_rele(bp);=0D
=0D
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>=0D
