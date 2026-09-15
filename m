Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1D4A49AB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461922; cv=none; b=N9wPPYcZj49hA8TZHzOeyIU4bltcmjnFa+uRKg6icRmJSPAbxGOKl3Nln/e+ocA2i+t/GoYyWVTIKyLM1xIz0T0yqQ69E5SO0FwvQz/MNPgpFpvzq7jc1tAppd5w6pM62w3su4M9mgXPdB9HZCbhxPEw0xHnAHscELV2nTF0lvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461922; c=relaxed/simple;
	bh=JJEh4YAJ1Ay2ewBI2yqm76bIt6T06gfWmYFb9OyhK0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdEnC9cjNTWqwSOTqniW54ULS1uAVjAQHOdI1UGpeqOYbCsjXm+6UbJb+Ivwm6O1hIqAoclSAbYSS8EOwISjFYprqoJCRRSU2U7LUn3ZjUKVdQ6xA4M3ZS5TakiNKaBp6UCd+ahf1xMEXVI7VT7EbXUz8hWkmZKmI4jOiVN17DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACnep8l2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACnep8l2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so2746309a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461921; x=1790066721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZI2a8mxGmbedcX25r+wjJ7cUUr+VErYdMtwf8Y1lyI=;
        b=ACnep8l28gZvUECVjSWT2SzT4JVPT2rYaepkeD9aHdl9iRVQL26yDaR21QIjNCh9xy
         76krpr7otnqZRKU+y6S3j4o9dxf8Oju/H5fnVxxjsWzxfWbJbVYNyE+EAACOHRgeY/ER
         2NfBDvbSNKr90QoHvhYGbaa/N2hsE3HOMzw0fjIC9ynJ/8QRDd/VDk4JwLt/ahUlyPpt
         MjJeDLbcL00nVqSSoQfCOh5hMkQJGuXW2QYIpcCAE3YFasJEzHuPI1joxVXt6crnhb0Y
         3n7f9cPVdpPQsdS/YIiqm2Z8fxUhB9VPQ2jhpyVFOt/YJnjQeQXdCABOUVt6fa89v7Ui
         raDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461921; x=1790066721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZI2a8mxGmbedcX25r+wjJ7cUUr+VErYdMtwf8Y1lyI=;
        b=a/xfhTQD/w4Imf845xG43zZFrOccYRTMS/ng+c9D7Ykuwb3RxFyYGWUzuzTfmnYYMd
         2crzeFb6dNFQzVqg7kDm695vOkWkY0cnSc+REjg/C2Jra1PiLE6SpVHDbPXMhPjVeLh0
         dZYzr8UnwgRDeBj9mU5POjCegmGfyBJo2C4ukq8+/uin2eKz0in8tjyce7LAdALgOX0j
         XdH2CkRuwyrtrTCT7sjN223b4TpAKgv0+BF7xdoL9IbXmXUbRghT7H0kDOkOgVVfknjL
         zVM1JcRwIStlqSzXNRsjupLuXsM58dvH5d8p/5phenGerJ6zlRBI0rxA2Qh4aI9ZLbtV
         Pfjw==
X-Forwarded-Encrypted: i=1; AKwUvBxXultLk/HgLxxDmS8fU1yfysuELSQbg7sYgRix64p/Dx/AAunKp6mJCa7pTw5QSmIKef6efiYpwsB2n3A=@vger.kernel.org
X-Gm-Message-State: AFuF++mzCoSICQgP2ter8VcBWb2zGPH1XqleuzDL3I39xyr4hqiwASKr
	XTggCppV1U2U6mOxIl3SZhpwMdULlql/ylsv+xxeMaF2hBb1Z/n0w1n7
X-Gm-Gg: AYBFou26E5f+eVkdjUe0y5XqOTH1hhRfWVLAJ4suB9RYxMFORc9Zi0JGtLlFgzHDeu1
	PstmeSawRNTFhUiHV5ZKrXjqpRLzGukzpgRDNoMDnXQx2aR2+z26peGaDBz+Q3lejfrOZNsU+63
	aTXGfuhnM3bKRtXYSE5XVtbzFnol0H7EOLundIODPWHHeiHLCbixxYG3Xdir1MEwSKIJIXtyteT
	dVdDAy3IF3a2IT5NjkuC5cHDPjaw6wmVk/7aThWILMRJxaV7pRoAXF7hE6KhXycC47dxn8beRAG
	ID7fSCxRqfFxCbYEyiie46lmvU4t2KQqybncjA7fGl9C8Zt4aZjKVuBuYbBEP+YwZ5fowWccQc7
	dCu6oWKSXLbFVABxIFkyWp8Sri0mZb1DP4WYdojf88Z1BWb0NY9p0AVUplIdiiOWg1fbxFgwXuc
	EatpLlDafOnZI8vldSOKKZsjDuTByoBRpKey2Ezoy4jTICGU/0/N28Y3kBG2vaaoWrrL/R61AOC
	p2M2YDs37N4+d/BKtcnN7QQ
X-Received: by 2002:a17:90b:39ac:b0:39e:261:4e0d with SMTP id 98e67ed59e1d1-39e026159e9mr4070187a91.25.1789461920196;
        Tue, 15 Sep 2026 01:45:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 18/23] ALSA: pcxhr: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:19 +0530
Message-ID: <20260915084424.1007757-19-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/pcxhr/pcxhr_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr_core.c b/sound/pci/pcxhr/pcxhr_core.c
index b3b9ab4f303e..f855d3bfad4b 100644
--- a/sound/pci/pcxhr/pcxhr_core.c
+++ b/sound/pci/pcxhr/pcxhr_core.c
@@ -802,7 +802,7 @@ static int pcxhr_prepair_pipe_start(struct pcxhr_mgr *mgr,
 					   err);
 				return err;
 			}
-			/* if the pipe couldn't be prepaired for start,
+			/* if the pipe couldn't be prepared for start,
 			 * retry it later
 			 */
 			if (rmh.stat[0] == 0)
@@ -913,7 +913,7 @@ int pcxhr_set_pipe_state(struct pcxhr_mgr *mgr, int playback_mask,
 			if (err)
 				return err;
 			if (state == 0)
-				break;	/* success, all pipes prepaired */
+				break;	/* success, all pipes prepared */
 			mdelay(1);	/* wait 1 millisecond and retry */
 		}
 	} else {
-- 
2.48.1

