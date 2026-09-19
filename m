Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803923909A9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845650; cv=none; b=e+caREboXIA4710NJ5L4EoprSrCcB4jfcTONpAdJ88HBEt9V+zjkKPwzz3hQNZD9V1bqctcFA4Ztve21nuE/IFsQbXk83NsV6qDmSkdcFUdcHQHr2WWGW1OSjYcGM05CJl6EVMCK1Ryw0t88YwVl1n2S5J604ooEYaI6w7fGKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845650; c=relaxed/simple;
	bh=pwyYfRVLdkmd5N5Logo84oAtYOsGm4GJuMOw/mAwfH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdsufl6+vokjQllzdfzmni/rIFqWW2G11I18MGmG5vwUkI11PO2OeQEWhnCMebD0C2NO8gs2cC7GnS4UgSGhW/0L6s8Js7RRSir8RZH68rWkEAIY0FLgxlA1abhF1Bu9KQQRTIKZvz58tPbxDNFMVb8KaAn1mU4+GNZi749IecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSJhMCre; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSJhMCre"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so13271625e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845646; x=1790450446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4YJdmYOeUNhSU17w57J3KEAsEIgs0iLdMFga4KPQms=;
        b=sSJhMCreai4TWaTuNvlwtI4kq6TQGgNN0jvcBac9QjtUUrmZbyoEdbxRFDjtD29bhK
         2+OYeDcXNUnQOaut0XBnQEjDo/3RVlcgyJWVxl6NFKBWiDINsmZlcr0mWIP0O/XwRTJp
         POorS2w/nRn0cTRSfB5nSolgYHWRElGYT9N3wGmtbgYiqbNU/rZhEPyYGMnnv0jMaROY
         g9UVkYJC3l0Amk+UsJRCPgACzSxsxVkkavxOhoO5JWLqCsL3HuQLbUYamWUSvsv21t1C
         Y74JtZ+nChBtKXpnmA7+ajTLU/JKPaLlv7VezAPrhnj6UfU6HgxxEasR8CiAfAGX6GEq
         Wlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845646; x=1790450446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4YJdmYOeUNhSU17w57J3KEAsEIgs0iLdMFga4KPQms=;
        b=Zpbz+HZLVztRTmbbaQXXQ5/Dap/23BMbs+xIFpmEJXOkZoDC4NaHiJSHVUhOssfh1N
         JvHsK2qB81+fHICtImy9eX6MAgsPR0Mtnj0nZKm7mVQeZ1B4PxUR5UfY7+Ye1AnzwULf
         h47xHEeu7VsHFUa6ncwvXubmjuAf0WaRPRw0oi466TKXU3++Arq5lwq6eiB3on8lBM5y
         CEjhYtZnXCWFASa0xGenA26nWBy8neSk1zwIDKvAFGhEtQhN8lSRPW8u1UmqpsBWn/RJ
         qJVOYvnCMYfuqPIRhU60yHxW7F1e9L5G2kyp/rdXuM7TPsFcT0nOUzn3V1Gvk9WZabGL
         Rjnw==
X-Forwarded-Encrypted: i=1; AKwUvBzC29iGiGnhPdpw3LOzxW+t+uMHkJCnK/3le359HIG73tjSpPiNDGDv+6Ot72ppRQ138XqrY3DXKhTHyq4=@vger.kernel.org
X-Gm-Message-State: AFuF++krGFkoZFwxa/YkBEQ4msiHx8QevOyrVg1ZCsCqbTs2/cfHy77T
	sH/ku2fgbhwETVsrsKN3KG7d55Ajx+2Yh/Z7AdsZalkUa8pC1XhPW5os
X-Gm-Gg: AYBFou3ysDTwFmmRqhNIRkSQkUCsPd1Y4myJpCGpuOZjIs20MKNRP9NQDtR3lFS63ti
	BSdqRJUT77l5y+QJasWyN5ubT+tsMzAJlGzeNaWSBUt7JEpCiXMmRfmog1LjSgam/ZcARIe1kJX
	NoIMjppG8FhmHlaDgktfnVbD6NOwWedT2Fwnhs7AWS3sYEPW2wSswXat7S33XAcPC2UFqnNwnND
	BpSqhrjUFA9i3lywKXGoYPsYJG8q903+476rhGR3MSfLWAByjxpiPhxESwY79LoGpYj0qfZCy1J
	A6aBBlmPR8Vk844vZidw9qelblOcOSGn3kpprs/4M66zN3cceDT28fe42m1JkVsIammsnp3J0PR
	gZMmy3VgZrzqOthG30K2lh8z9YL96K7VYHEAOlU9XFNfgfNwAjSette8O8paZUUMa6aNx8tvqmB
	D8uStEiMWqiveef2cx6rpgoZUOHaSfHM3/eM/HDiGP4HgX21ftw6rujm/OXL5nXVgiKs9FwSk6u
	pLfEKjozh4yXupsUIfQYrTEh17eS/PRU/HjZ34Skv8BfHTVk38=
X-Received: by 2002:a05:600c:3ba1:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fc56b5754mr106076785e9.12.1789845645497;
        Sat, 19 Sep 2026 12:20:45 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm163812045e9.3.2026.09.19.12.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:20:45 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: axboe@kernel.dk
Cc: hare@suse.de,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] block: z2ram: fix dangling gendisk pointer on add_disk() failure
Date: Sun, 20 Sep 2026 00:20:33 +0500
Message-ID: <20260919192033.271538-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

z2ram_register_disk() stores the freshly allocated gendisk in
z2ram_gendisk[minor] before calling add_disk(). If add_disk() fails,
it drops the reference with put_disk() but leaves the array entry
pointing at the now-freed gendisk instead of clearing it.

z2_init() only aborts and unwinds when minor 0 fails; a later minor
failing just leaves that dangling entry in place and the module still
reports successful load. z2_exit() then unconditionally calls
del_gendisk()/put_disk() on every entry in z2ram_gendisk[], so module
removal walks into the stale pointer left behind by the earlier
failure.

Clear the array entry when add_disk() fails, and skip NULL entries in
z2_exit(), matching how a minor that never registered is represented.

Fixes: 76487f024142 ("z2ram: use separate gendisk for the different modes")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/block/z2ram.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index b216cba1c3bf..e7fabaa53ba1 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -333,8 +333,10 @@ static int z2ram_register_disk(int minor)
 
 	z2ram_gendisk[minor] = disk;
 	err = add_disk(disk);
-	if (err)
+	if (err) {
+		z2ram_gendisk[minor] = NULL;
 		put_disk(disk);
+	}
 	return err;
 }
 
@@ -379,6 +381,8 @@ static void __exit z2_exit(void)
 	unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
 
 	for (i = 0; i < Z2MINOR_COUNT; i++) {
+		if (!z2ram_gendisk[i])
+			continue;
 		del_gendisk(z2ram_gendisk[i]);
 		put_disk(z2ram_gendisk[i]);
 	}
-- 
2.55.0

