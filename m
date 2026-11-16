Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854049;
	b=e4pRZFG2yjEGFXN7ZYxtlJB0W3P5YN0ZOb/54DEo/4d+km+VvNhgbpQg+sDqS72aDrPH
	 XDfiH2l5Rc+FXlEkYIcHwA8drXgdtD5oqB2XcDiFWkpQ6c4cOqgpZoDGy+Q+Web6nYa7b
	 g9yHrEvTGuzo3+EHUt1CPhvnDJpwnGwV3u4lQtXM3QNXORxKLTOJj290Ka9t+3lVsVh3f
	 E8tknaAHiheNNU8ned7RC6zZnGsAK1b4pU4GmQJxgAbxiJSbMdQHQaKWU8czoGjp1q0hr
	 z3Dm6qhyYzohJ/ctS9BCvVOEFGV2XOWWmtWS9XuCJhMd90vA1GWQDOY7OMQd/sn3b5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/xG49e14ZCh+fO/7DHQykDuVPv0J567RTNrYYSBGnHU=;
	b=XY9T8RMvsQO0Vtp3XZZHGgjjBGoyDeYwcjQYqybd5SO9r4TMSqiPKjpozkdGOpgYAQgV
	 WBwQFtPxK+Ax/Cy5R+ujV6w6F2j96tfRnLDYu2bODcrgkBRNMVRkU5lgb0lCZJc6L8/Ej
	 Hg7aT6fjpGCryEFAgdn1JvD4287CWHWuIVYNHpXD6wSOiS1Z7rC5+fIHzh3EPwmmXWLb+
	 WkfXyqoB/MsqpNvochHCjgQTRdsNT20D80oMMa5Y9DlXuWgtzwidGx4GJbdpmVeOeJL/4
	 brdQz7wy+ewcaChBVF6D5VTVkRXJCbHxtgG42y26GJZZF4ykKLR1AtpW6UzVkhjYEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiBmJx9I;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E87606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E87606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiBmJx9I
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37986eb6fa2so4908510eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854048; x=1795458848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xG49e14ZCh+fO/7DHQykDuVPv0J567RTNrYYSBGnHU=;
        b=KiBmJx9IsXzMPGZyOjDfDB7adVh+EnKlpCgo8oi3YdPr4lBSlxHX5bY7aS1hlzE7ao
         naLJ29iA1d7Kf/Os3nzAuzjyQ5g6zwCosDq1H/cFxljh6vbYNFVC9J7GF3mAZ5rJc+jL
         m7FvSYBKifbJ6Kb5TY7JxNXlLF985ZryDGx0vDBPlX0PX3e6tMA41upY6F3EgqbI8Pbz
         X65GMugm+TQDyyFe5x3nQyJAxAIlr3/j72b+pbUT3Ws40pAiiEOeEolub/cNCcznE071
         +6Ajyi/YtuM5JhNd6TrUy+fUQTxx67y8tH+1zNgPJTepTl8ZjTnemxzDbeqY0e0Wyp57
         C9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854048; x=1795458848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xG49e14ZCh+fO/7DHQykDuVPv0J567RTNrYYSBGnHU=;
        b=MfEuABx8uPec/IuzKsoFy3LfbCcfbLnND0vqRPlCaYf2WbhYZ9VBx82WPwzdN8SXzT
         h90IZa/5AyT8lxPJk1pmSjwLZhSo+1R1pl89FUZo+4Q9r8cK/S371iUjXFPXUnJ6D6Ho
         U8vNg+nhTwLoXY0RVloRyAOCa2xWOMcoGKmQOC8k2YhmjzLhhJFtlD0u6XnbARu79lu6
         kjYloRWnakV6ezv1JP2PwrCKEsNevBB2EgcEtF81qkzuC7jpQHz/d4fF1pjYvNyb/YlD
         5U5c7AYmH2d1Vz0IKakTYQVcTrE3R4O33QSccNKFbvfGHBjSQhvSuMaXNEtvVtSyghzj
         HMYg==
X-Forwarded-Encrypted: i=1; AL+hErHZtITYtBhM50Sv1OAeOxBIibhvYAS2MpB6hbzkHLKYage0MuGHkBLAdsJ9KAQD4Zjk8nGZyvn3G5zUNEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rwi/FNWXIlRpHmCYlwnXm9o9CQPtObsG9X79iGQ+kK+ORSHkY
	mECNsqXhwWdSYs/V9VNi+RPyAENaIowbbPClf8OU7wjjaEoiKDQwcRdA
X-Gm-Gg: AZFdTZc92LvCiK+saPb0YP6cqW5ha31tkWmqUxciX183iyg4yiQ5vZRrJFSJxWRt/En
	x/e4g8lCBBJgbbeBvabPvpNJCFEt6xdkv5de/9KEuN2TGaFXB+vvuxzzoXqcjKfNmQdK+hhIWFT
	JS6cMl0RJOyNwkM90SNOlf0DAvS/tyqrNcd/v2/dU5vXtsoeiorosmUMVOzz0RMU8RtFvfJHZIZ
	4Azm4AO73iejx7N5N7lD4XCG4FB8f3TB1BbW4vIF4j9Vhu9aOnLl8nepGZPmKLAu9HdNH/Opcx/
	cnL25USl9GW/ipJlD9SZXXfgzgMz5cE9WP3Tm2PCHEDt65m/qhIXQ3aQJt2ZvzaiUdX/l+q0x7n
	JTmDDtQ5GtyVYu2/PJpcL1GaxsA/yJwuoCn6cXNaFcR6WuXSRY7AEi/8St+K5V7lHL2iXHbu6ig
	SlLBii62szZCFroI+/x3K8hGAPXC+kj4hsWsl6FpU5YtajCXJ/BLTa3zmgdDxUG0Er+0706ySvI
	PanG8D0OY8IwKEChScl6iLT/DzwiQD3VHrpX7FmkSuGI/fd5kNjUs1kQPOG3QM+a4bsSw0usreY
	Y0we2+iEG38JmGP08X7AHnV9il4co0K1D1kdhexJCSoGSqgXd0RMdRW7dC18tG4nH2DELSVZO66
	2TP/wN/WNAFtqH89L7BXLbk/QI+E/dGE1+3inheoM1z5i
X-Received: by 2002:a05:7301:fd04:b0:36e:a265:8ee with SMTP id 5a478bee46e88-37966771bb5mr10661121eec.18.1794854047447;
        Mon, 16 Nov 2026 10:34:07 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm36636803eec.7.2026.11.16.10.34.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:34:07 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH v2] staging: most: video: Document locks in struct most_video_dev
Date: Tue, 17 Nov 2026 00:03:55 +0530
Message-ID: <20261116183355.22563-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

checkpatch.pl reports that list_lock and lock in struct most_video_dev
are defined without a comment.

list_lock protects the pending_mbos list and the mute flag, which are
accessed both from file operations and from the rx completion callback
called by the MOST core. lock is assigned to vdev->lock and is used by
the V4L2 core to serialize ioctls.

Add short comments describing what each lock protects.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
v2:
 - Add a commit message and Signed-off-by (Andy Shevchenko)
 - Use the "staging: most: video:" subject prefix
 - Make the comments shorter and accurate
 - Drop the outreachy list (Julia Lawall)

 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff6..8833ab5c7 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* Protects @pending_mbos and @mute against the rx completion path */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* Serializes V4L2 ioctls, used as the video_device lock */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.50.1 (Apple Git-155)

