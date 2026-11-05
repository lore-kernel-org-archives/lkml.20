Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900564;
	b=IRhfKnGLPArLKxIVEv60j5Tu6XPa3fpypcSAyokzGdH+m1arm5my2JkvZauNLR/N8rs4
	 XbcO2YmwSunDemrJXIW5e+SpyYWSzkwlgXUIj9JziRgezySAHSLLp1ACp/b6B32e6P39y
	 UjnThwxsqyZmx4E/y5FOSPal4TJlpvj2cRzPVuWplnFbyO0kpmWZ60qlXjf2yasmsRl8D
	 Km+bEGCZsvwoyt1PxqeqQJeMKby5b/Qkrt3TtH/QsLqxx6nSgBXd+PXKx7OV10O7+mBHZ
	 ZAzhhBxscbjtGQiWDA2suja1s3vkZFHZHaAXyPFMv9O1UWLX70z3eBeFwwhBkI4d2Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lkKAejhpVXm9seL1ehybdpNol6UMeDxsIrY79fbHsys=;
	b=ARjfpThFD79BIQCjkyQxWpqLy2TEz3wEdn6rYXkxYtdZ+vPXwxmgxEUVq6HtoYIh+VpA
	 kBUUVXK4GwTaRSIV1Gq3GAfs/7OqDCXLJVPcPk/C2oSQdT+dhCQRfP5wop4wexuVxNmhS
	 n77tEiv48RafOpL3+jx6+V/2vUjMpdbsp7KwFQyakzhS4l1Qob0otpViNxlZ2Ga3tN9Bc
	 WF6n6/pO2CrqtZPo/I9X2M4f/sWnssV1B83bOFLViqJIw7I85/d4eL8hOao+aeN9ApwGA
	 PwQ81lXIHfxT2jgErtpjqI5ce/zLkVJjejinOhR6yHGnlejxZSYRQ8kWEPYKI69+AiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cCpBXcz;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF45A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF45A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cCpBXcz
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so2984116c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900563; x=1794505363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkKAejhpVXm9seL1ehybdpNol6UMeDxsIrY79fbHsys=;
        b=0cCpBXczFYatbN465cchPeAyHME4783rqVh3+kL78PzF4IlkhKFBfE5QUc6pCUThe+
         p4WXpGfbMQ8mn8FpHx7MMTutgqAqvxPCVDJo9FwfTet0dJOYWpVxzkZX/UPxIsoCMuaW
         7zUEND9WP7c+PNDLfyL0V5Zr8Va+nAaPgI5xke5C5zjT6zZmNZ5141TVUikpJlNXh+tm
         e+A6AxIrh++VB6UJ2mgMHkfQUHhO4qPFtKv5ynToDcG+gYHr52aihGwah8BvrO40fgiz
         Krhff2dntNB/rAgijFx/fP1Zdw0haDcXxuF/yP6Od5kjUsLelS/3tyPYexfEotJ7bIe9
         KHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900563; x=1794505363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkKAejhpVXm9seL1ehybdpNol6UMeDxsIrY79fbHsys=;
        b=tDfHUwoKM6zTTQc8HPXmdLUW8ru4a+U1MgYlxSxy8tFZTKBwgh19W5BQJb+H1k39Ub
         sN81DBOU0NivXCtTyULNpHubAyF+aDnMJf6UpBoos6VOsziQ69qrB/bQRZY6K3mM3Mh4
         urDyUo940qhfp40SGfeP8wzefUFMkb84DCCi/80X/dsjaShqgSuuDOWpmL/NOSlpdgjy
         5NIa0nn0iVi2Y9YNpL5eVcHRX/XaHtftFOSQ5Loc9xsfH1wNMZ7qQFhmrsmNurRybCir
         fwUYMBUQ1Te7aRTvTcNI0rhQkkpxTUT23bvAiS/v8ZTbGvBtO3wg8d3ouC9v0Qu26wHp
         1jcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP8T/YnbR9oM5D79XzagJ7ICUZ7Pt97Ty5Z1oc5E+Ji038OZQ13N/w1uYng6P0U/za9C0Oy7ruYIqs/gE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3ZGaGCra9EZCzg2Gvb9i5T9VDUzAnPyPi3jQFaJBvTyLQyPcp
	X+vhmu16kFXHJKBeC9vsueB9BoTh21iNVq7HCeelj7VJN0RqFYqrBEWD
X-Gm-Gg: AYBFou1L8qwZt7LBp8KWy3cloWVKTGIE37vkIvAP2R/692V0DMecG3WHFTjPSYk/T50
	iIjLxjGVzAGbQkHOACLSyyg/L3cxxRzx8u+GLVecD9tuRPqCtSG+x/arWlq7l/3FXJR+yPQb6YJ
	kvwS2Pu5DLE99PDKbKOk+RMgdn/Iz9bl2Sw5tHdeaQR1hWjQWondjEH6q92w6lYyMWZlPlu31rO
	VEanSFS2+A+TkNG9y3YVidH8tuA5lcTbOrm6bZwUDWOUDr5WQqM2QKCGLmd+6bYAH3uPcSqvpGp
	TAFJPzggjWk0dGAnRluAtMHnXzfAMupxG2chxDJCi4HAluiGlN42wPqk/UekrUR6KEaoHqW4kEz
	KWZkqReWcySedW+qOan00aRDfVkep/b85uHPwSvXeKQ+6Q3o8AGlcb8cbIkOiECuhlWwmLoMwyb
	L2zMYB67BhYZNLhzddLIkV6pB3BFW8FQKlb4HyewCHyAzosTI70F687SFOT+U94OWsHZiJREZsw
	VT6IAk4aRSWIw9e+/mq7RoPXddDNZNR0MD4zqFflhc1o3wg5NeNZKCiDPKLXCOvv9EDpwozvo7t
	OchWlKJKiAqOwO1zQe/tFnM5O6Q57Phz/+sFmtGB0luxZJYVbXl4wo+jCaIiVkjyIg==
X-Received: by 2002:a05:701b:4550:10b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b24da6bf63mr5381543c88.34.1793900562754;
        Thu, 05 Nov 2026 09:42:42 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm24291014eec.27.2026.11.05.09.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:42:41 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ksmbd: refuse to read a handle that is not open for reading
Date: Thu,  5 Nov 2026 23:08:38 +0530
Message-ID: <20261105173838.1882328-1-wahidzk0091@gmail.com>
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

smb2_create_open_flags() picks the open mode from the read and write
bits of the desired access. FILE_EXECUTE and FILE_READ_ATTRIBUTES select
neither, so a request for FILE_WRITE_DATA | FILE_EXECUTE |
FILE_READ_ATTRIBUTES opens the file O_WRONLY.

smb2_read() accepts FILE_READ_ATTRIBUTES and ksmbd_vfs_read() accepts
FILE_EXECUTE, so a later READ on that handle passes both checks and
reaches __kernel_read() on a file that has no FMODE_READ:

  WARNING: fs/read_write.c:518 at __kernel_read
   __kernel_read
   ksmbd_vfs_read
   smb2_read
   handle_ksmbd_work

Any client that can open a file with write access on a share, including
a guest session, can trigger it; with panic_on_warn it takes the machine
down.

Return STATUS_ACCESS_DENIED when the file is not readable.

Fixes: f44158485826 ("cifsd: add file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/smb/server/vfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index 1f2bc76f0..cb3f4f5fe 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -367,6 +367,10 @@ int ksmbd_vfs_read(struct ksmbd_work *work, struct ksmbd_file *fp, size_t count,
 	if (ksmbd_stream_fd(fp))
 		return ksmbd_vfs_stream_read(fp, rbuf, pos, count);
 
+	/* The access granted on open can include FILE_EXECUTE for a write-only file */
+	if (!(filp->f_mode & FMODE_READ))
+		return -EACCES;
+
 	if (!fp->is_posix_ctxt) {
 		int ret;
 
-- 
2.53.0
