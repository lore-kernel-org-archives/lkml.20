Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784474;
	b=2sGLdH8AN/hynFT26D3t+xAHU9EXZZmbgoDE7C+o7GUZjv9HJn95hte6GqmRqvo4ORdL
	 /GxUjuQESxshPH57vBak9dungtJV7TQHQRx73v1OuNb+VtmTrD79cYiyWmzoCQNEs8qPm
	 Xamzjp+1ng/y5sTaGIoaCjm8WuGf2BKui12u1o0ls4QUWUFFDhU9Etb65GvWuEazc/zzD
	 KOMPpiw8y1sxh895MVBLnvYrXeWPJd2qBt8LFxFHudfREkRER84ujG5Alrzt6oNmlBxG3
	 eW3V1PBRUypFMjhbRPW4BAYEQ5TBAUKJuS4axvGFBSpGcTO/BB4mSEVKuDF9KxZiomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FbhRWltBxxgl1MFTaTpQhGPLcLRKiwH3PA6H6UKwK3o=;
	b=aZE1fPzgzvEMfG05/JcM4Fs5DeKxSWGg0HZB5pqJFC/PcEgjuAWbP8UNUwuzYA9pcngz
	 NSxgeaH9pyqr+CocW0oIhh+ezsnX9IjXD+7OoUNyT8j7gssEPSzNDTw+0OfFPleBZCXMD
	 pAyidHvobgZMst82PoPweo0WSDPQkPr0Y2ZCiWlAZnRli2XCaQYn8NYXQ6OLuJfPsq1tJ
	 JqBxJCEykdjMLsRcy6uS22SasGZuEU7gFDrSb2p14P1PsVFKTGdidmDJtWEV6BmLWBVkW
	 xsCtnGZRZW118uS3Lwj9vzAORPAY0D+N4f+T8e6rMV+6RpamXSeAWZkzyf+Zjchr88w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAOMf3Yj;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE3606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAOMf3Yj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso806534eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784473; x=1794389273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbhRWltBxxgl1MFTaTpQhGPLcLRKiwH3PA6H6UKwK3o=;
        b=vAOMf3YjiLDwHmLw8A3rGCPSo1NWhME1Mxs3KoaPzTCPlNo4/uQsmONl9NRDO6hqXB
         GXfZQUHDlIn9RfJuamSo8HQ+z05dvPHSY1cT/QmH9jtmzdiMD21/cMhgje1N5AGOODZ5
         9L0lsb3FNPdxNET8TPFShBUyi5rgyWP0U9t6VuR04k2IpNmvIs80H+lKAMrl9qWJGZDu
         cAoVY1q57D51vHRVGcKdP+YNDHA2Redi9ZausgWSa8GU3AyCNhDGCMQkCqUzMRtsCt41
         wXLIKGr3EwGZyEKzkMa8zv2CBxnHYwFPwStwD2//nBpmgpQc4p5pD6JuI7vFqi8C2n4r
         KL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784473; x=1794389273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbhRWltBxxgl1MFTaTpQhGPLcLRKiwH3PA6H6UKwK3o=;
        b=VwjHcouzmD8WsCgzP30zkOUwN0YWxA0hPZCcLDjWhcPWqTuLm2VTD9IHomme0iSVMB
         QFmn4iJCDwZHnUkEOz1aE+rYp/Cir0HCc5jYAIKC1uvm8yJZ6/yXElCJ48Sywr+0PmLF
         LF/7u5MP/hcqUVD2xIrZztyVLVvL3Gy+R4A2YEBzPYo7Kjf8XAqQnu3SRkESlBUck2Tz
         NC75xcUo+oxaOOqEH9P8cZmu4t8xxJD0nX9Yvtk9IIVwNTrFjrg9Z+l11b8r7nLZppud
         xOR9MqRG/oYwUh2gnoPeetF23TYe1BeCmQZqzv1sP65ZX7mXCu6LesxOIVxypndxFGkD
         NKpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF5yZkVSJ4f7g2bmUzfCLE8MnIbjRDwZP36v1pqOVuZQ413Nc38bJ3ogy1kpOHfyPuNrZC9X3IezWdHkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PteMRSVCbP4IP1gtJPoJzgYyMIaNDOmyRVR/Ms9wpFOUwJfPw
	YO63d278c2tiQS93bzheeB3yai+JiFTKTnYPtfKAN8RFGXXBVDY1rdTxW6vbMT/9
X-Gm-Gg: AYBFou37ZWMQGkwfw1NwoAehtmKWhZtRtXQg3Q0Mnj/f5kkUBOOV+NOVZLY1qGw1a3G
	ck9GSl2k+1Lc8gLIJMBZaRugbZbpuhRkC30Qgal5YRkiceeuOZGL8WhBqF2/QWuO+GL0kUu54gM
	gO1mFiCVhq9+Wb+aRUar2rAvDBv5Eb4CKu8IYBqjl/v0pUNQzFL+m4s2/K5AXZarFisC/ymy9oQ
	DcxMLGhQKjDd3bejW7N7Pdu8dLqQh/q9PuXQkDqFwtEskhbC60viKETUUhMgDm3+6VJ4LdytGF3
	AEG2pNZ/1EYi5ixlyvwY3EhKjPdnDceBvh1lxwRS8kFneK55nNOi/yxKrv0I7+Xhke2CCs8Qmaf
	EPFGNbefBJhfwUk4Wa+wFK4DLK9Z6Xa9kU+uKKNK1VPKUlS/xlKPd431FOc1YZpq9LSkw9LAucW
	F9RTiQ8I6pOGHXK5OZ7fbHrYuXuTVYVCkUFN40gS3rW3Rt9/241WFHOE+dMrfZ/q6Yxklxvb4ju
	Sst623wU3sWdPxcfqzzOTwS2yuu9i/7SBjz8rY7YTbtzS7d3+l8IALJs29vo5fgrFR2QfglLFwH
	q4n4GKvkiConWe2eVFhJavX+7wNSViJgovDVmM35OosmdwundYf7bNCRIvwWdSlUNlY=
X-Received: by 2002:a05:693c:4154:20b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36a420574admr24483113eec.0.1793784472621;
        Wed, 04 Nov 2026 01:27:52 -0800 (PST)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm5492547eec.8.2026.11.04.01.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:27:51 -0800 (PST)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org (open list:FILESYSTEMS (VFS and infrastructure)),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] file: Avoid acquire on shared fd table lookups
Date: Wed,  4 Nov 2026 01:27:49 -0800
Message-ID: <20261104092750.2998440-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
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

__fget_light() reads files->count to choose whether it can borrow an
fd without taking a file reference. The current acquire load applies
to both branches. Only the single-owner branch uses the count load
to order its subsequent fd table lookup against a concurrent
close_fd() and put_files_struct(). The shared-table branch obtains a
file reference under RCU instead.

Read the count without an acquire and use
smp_acquire__after_ctrl_dep() on the single-owner branch. The branch
provides the control dependency, and the barrier preserves acquire
ordering before the borrowed fd is read. This removes an acquire
barrier from each shared-table fdget() lookup on arm64.

With two threads sharing an fd table and each performing 10,000 pipe
write/read pairs on separate arm64 cores, performance improves 1.75%.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 fs/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/file.c b/fs/file.c
index 4cd40dfa6129..20ab46434abe 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1337,10 +1337,12 @@ static inline struct fd __fget_light(unsigned int fd, fmode_t mask)
 	 * entry combined with the new refcount - otherwise we could
 	 * return a file that is concurrently being freed.
 	 *
-	 * atomic_read_acquire() pairs with atomic_dec_and_test() in
-	 * put_files_struct().
+	 * The acquire on the single-owner path pairs with
+	 * atomic_dec_and_test() in put_files_struct(). The shared-table
+	 * path obtains its own file reference under RCU.
 	 */
-	if (likely(atomic_read_acquire(&files->count) == 1)) {
+	if (likely(atomic_read(&files->count) == 1)) {
+		smp_acquire__after_ctrl_dep();
 		file = files_lookup_fd_raw(files, fd);
 		if (!file || unlikely(file->f_mode & mask))
 			return EMPTY_FD;
-- 
2.47.3

