Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887562;
	b=XwWHFBcFl72AqvMeaMwibt13SEVQjejhXEzvClqJEanGx2fcTHOYyIMjcFL9t2GkN9Q/
	 3jVq3IDymppMIcNVwUbocC9DuMbERA7b3xtmkdBdF6r8d/iW+sxScgVY0RKYoWMGQRGnf
	 OIwIQyy9rnf9HjdKTjAR2ID9yDVdwxaNOyILcP1vC3bW/O7sP7mcw+CZ7il79IkxRUaeb
	 EvLAOESbOYaCjgk+1IEwU25JmMyJK16A1wsAMJoKn7qoXcyrYThbaENXfIzl/2gfGiJpu
	 JFBzMD+sKuTiwneo66m5ZTTFwhADiHBnOwBd2uolcFYl30VYJZFoMWJZh9IiB1oxyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=98ojD7Yqgp4+QWlLYJvCdz0SkGgcS1ZlQwaV98NWAJc=;
	b=ovHuzcENZqSVrJsCWJjQT4+h74Pk/QRLxRxd2o9KUcu5RmFu4aKQ/M1qaS+dVU+wHobm
	 ABLuyq7KRiC1a477X9wX312EdkzS9Ry8//Y36X5BB1dY57K5eG6qMiyiM/gKAiPPwecoV
	 IODpuR4r28gsBmegQBuTXfA+FfdQdPaoWbpzJBJjN+iEW0ORFZzFI1BS90Ix4Q9U6UI3m
	 ho7FpRUNtQH3mDZ2FVNHhN9nK6+cy8OnvzHaMG6uS+RO2Ppw0AAZhKX11gEN+drqWog8n
	 qzdAOpXHnRFHvLRawz45nvW4XKepXNMBMVjx7Mr02kzJXyrjjN3EjSd8zRgmrgd5T6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAUMfgRT;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DCB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAUMfgRT
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55d2d380f6aso24617151cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887560; x=1795492360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98ojD7Yqgp4+QWlLYJvCdz0SkGgcS1ZlQwaV98NWAJc=;
        b=vAUMfgRTe5L+FRb473+XUFiri9OlSQzM3Fwq2mGAYI/xsd0MceiGGUJcQ9xOa5PjfV
         MdSdmceyC8DFmiY/IDttc2iRbooc5gFbbe7uM2JHXUIiVem/1A53TjNfMj66fIf15WM3
         uBCuqJ892sii2nySQsGBZrHATcWI+f364XmPYEN+cvDRdsAZ/eteketmDA5hbuKJI8L1
         Y9AFSbHYVWyDhw7bE10JHga2gzr/Gv+VWJ/sUf1ZNlyznH4fdFJA6ul9wxOyh602Y5II
         t59+Wr+O/iFuuAW68ItNnWw/AfCuLPwWMO2xOpGVsCYj7jQXkAlS7zlm9OxVDRVx3Lxw
         K3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887560; x=1795492360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98ojD7Yqgp4+QWlLYJvCdz0SkGgcS1ZlQwaV98NWAJc=;
        b=U3DMYwm+Ch7y0NP41Qli8sjUXJ2eaHdbpyWu/Km/BZPmaKUlSLbq0qFF41q6hIPVVM
         dmI7ezCDEYi0cu1vb4mXJTvaciUC76Y5P+JBVZBO0fQgWfyA561X6DbokLAKB0S+WI9c
         zow2ugG1T3GdmG4vKh8P4nI1Ac2v0RIrv0EyIA7NBLar9d4jEyj947zwPMzuvU+m4icK
         nm0B68UbetTJGjUpMtDMrz35Jli9iiLxVESdvRC6S4CsS8wzcxMgEiSCzPmwdZvdx6KV
         j661CH93vA4fmpfogY0lZvOJLACfYxJk0fDdT9pvfBEFn8hpE6fnThvOr9Slyr1nojLG
         Vxng==
X-Forwarded-Encrypted: i=1; AL+hErES5l7VpYvQdgGJlNaeYhAYOty1pav/cyM+j4I3g+ETSQuk2DtBf6i3Xn/krIbR5HVmmju3Jw1Gxn1uDWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KjChjvQaxi9LXefF0HcZCbESGZX3hmul4ZwbmMdJOJSx6ARdy
	cbvDGkNidgbjls1S8HgjTQq2XWRnukb3MEk+zUsW9E29k3dhC42wemXH
X-Gm-Gg: AYBFou1mPBk5TXUQSQ5H82TedTyOvXsiKwC6M4VOwaaeE5ehZqmBzz3grne+WR29Qqe
	OJT7bYD669dF+MEa1FbYMAm98WmdltpYLtmICPR+oC8IZPcAREGwUH2iSr1jQmJHmHn9Na8peGc
	LAipc02vDuRbsd6/iLUzpTcuWXT/vQiK+vPSJYy9MHIkZOr7VShWpQUJ5hehgDgfc1emGHjcNdu
	Zmre1VVElxDPETkzuqVq+x3QPkAT9zOFlYfdWN+hkHyt/WZjecsNoazPU7yfK5izkvhWd6001/e
	D08r76eEmXu/+eg9H6t1SLWpQlpOvPkWB0HNyp6EPhzuMLa/0gu8MvVIRz546y+Lr1orHd3z9xd
	Hhvubz32EgxKmdJLgYt3jUmxtMFUDdKUXm6Ym7iWPPq9LT0hTTu6ajDI998FOAOo/w8VwoHdPi2
	9au8ycZ8+e1a3rALe8kH99AeeNvvZ1RuVVmGe6kAFJMTwrTzmW+jZjNj9Gq1lmGfIMzlN0hhpmc
	n5AhELLcaQo5ViBSfI3sf9LpKxfRQ12OVdSGo0Un34l/Z44NX4vPjkV0T0wpMVvlJ6he3dBn3Z3
	gs1Yh9S2BKCkzUalYiuHMht3cEDxM7jsW77JKKATqG8Gp7n+zzcO/oDW0DJZyTqBaEDb5vKlQhh
	Ilbpd82+ymY1tSYT3/sIm2M+ZgZ9hBbybWv5KoGtvpf9xj561G4mYeth/mgfif81LN+s+7dcy
X-Received: by 2002:a05:620a:6f01:b0:93e:653e:6981 with SMTP id af79cd13be357-9494ba5556bmr1927137885a.11.1794887560598;
        Mon, 16 Nov 2026 19:52:40 -0800 (PST)
Received: from localhost.localdomain (c-107-3-155-154.hsd1.ca.comcast.net. [107.3.155.154])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm100944006d6.21.2026.11.16.19.52.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 19:52:40 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] btrfs: tests: zoned: fix NULL check of the active bitmap
Date: Mon, 16 Nov 2026 19:51:55 -0800
Message-Id: <20261117035155.86323-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

test_load_zone_info() allocates the active bitmap with bitmap_zalloc()
but then tests zone_info, which was already checked a few lines above.
A failed allocation is not detected, and the NULL bitmap is then used
by __set_bit() and by btrfs_load_block_group_by_raid_type().

Check the active bitmap instead.

Tested in QEMU with the bitmap size temporarily changed to UINT_MAX so
that the allocation fails. Without this patch the kernel oopses in
btrfs_test_zoned() with a NULL pointer dereference. With it the test
prints "cannot allocate active bitmap" and fails cleanly.

Found by searching for a NULL check that tests a different pointer than
the one just allocated, with the help of an AI coding assistant
(Claude).

Fixes: 1ba19a6ea9f2 ("btrfs: tests: zoned: add tests cases for zoned code")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
 fs/btrfs/tests/zoned-tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/tests/zoned-tests.c b/fs/btrfs/tests/zoned-tests.c
index 2bc3b14baa41..bb9969210444 100644
--- a/fs/btrfs/tests/zoned-tests.c
+++ b/fs/btrfs/tests/zoned-tests.c
@@ -65,7 +65,7 @@ static int test_load_zone_info(struct btrfs_fs_info *fs_info,
 	}
 
 	active = bitmap_zalloc(test->num_stripes, GFP_KERNEL);
-	if (!zone_info) {
+	if (!active) {
 		test_err("cannot allocate active bitmap");
 		return -ENOMEM;
 	}

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.3 (Apple Git-146)

