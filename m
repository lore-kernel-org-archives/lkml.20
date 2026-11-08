Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177193;
	b=cAv5aKWbT6zem+vK6RPUUNMevYj3y1sFLebsfFWkzL0otGwN+x4pBwwWodYATNfdin5I
	 vnbVuAda+r+7Yb8HTbOgSBl0VX1qfcW1fgcodyd8hCxXbtwshWl7Tqeo4F+fqD9YP74CG
	 WrV84JDT0lJJ8nnvK1am7FDhlx4+mE59HHCSa1YU7XYjCVvy0gvGoE/JlAldjIaKInLNF
	 E5i7YDSOhiQf2YBZEJAogWXAnoBqoiLedWSOum847pwZ79EzEWTpLEAJ+K5xTdx/JR8Zm
	 GguKDviZ6YXtbpklv3N4rYv+r500N+rBXDAbWfEjYNx+oAL57vjO0SqVQwT3re++SPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PkdH+wEUMUSeDLAeSoZy2bnkjMkJXd9IxOdgSs+yng8=;
	b=NuDTzkNr/kBsQDZtg5mAezOB8+AS7AWaaTmuSYIkVffZ6sqhYtF2E2nxX/o6/csDtZzh
	 WI7WNtiXufbNyILJjfvQTczGRhumqePa6ewfEgvZFdVOegD+1Iar5swucSwAQNWkOjsef
	 sop6Pk+3qVg55317bulknSVjtP46jCt8nstBcgxZT5kqHzU3z/aNF3OmuSq8iY/reu58r
	 6jNV8qN5ypM+LCA/4wlvbI8ztGn/vURR6XZCJTbjmfSMb/gmKODO4U035klNZz87qWIcf
	 Dqs2XEvvMCI7Pnu09dOrtiYOdGFPVohMBlZNkjwmgqJ2DvoRdMwwtIrjFQ8FcWxVyjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umCAbGL+;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC00606D80C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC00606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umCAbGL+
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-49429181ce9so204668fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177192; x=1794781992; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PkdH+wEUMUSeDLAeSoZy2bnkjMkJXd9IxOdgSs+yng8=;
        b=umCAbGL+7eK2RSXF3PTPeizN2u4fnldl8IaFPRWXZIv/kGAY5sLqwglRyGbID2YvAN
         /8cx18GwT3pMgPMb7luW1s9BWY88rgn+CvKoocJMIlgqMZeo5FGdk3lP+FJ3cY1D2B/n
         jJKmzUjV/RaYyBq3enqyfcj5iCYx9Zn44c0rGWnwX5n//vVqnVrQRoN4a7PW23Hj8Fdi
         60bjHtbGXSsW7LYIz3ysO7lOBTHc9ooaOYDTOd8WzynPtx5n6eCyc2UMNwS3gK6IaOY9
         +3qXO10txO/kAbkPyA9uKfPSVXgzuJgnTndbEmPhNIvgdi5tpiZXCZEua/EOOdDc8kjA
         1VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177192; x=1794781992;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PkdH+wEUMUSeDLAeSoZy2bnkjMkJXd9IxOdgSs+yng8=;
        b=OsxOSRgamPv2gFsaU3lh9fxy6lZVwc6X6+GFgHs1F2RgRRfky7ZqR7kQ0h48c6OtL9
         52PAruLnG/nMHx7mJ7vN0UihV+sU43ldnvl7hJ1H6lBSZHPkA6YdABG036q+iREXmGdM
         ovlcBEc3/dBuXTjhnw0mlZ9H02Xbbarg2BbIoE1xcWJdqt8JpI4LfZQAQSIKrHJDEvMW
         wToIXeTC78/KXjL7lTcfZ/8WtS7P8beN7epfm9I9lr+TJ70m4/4mtl7M/KdnaErh4VNo
         xUvoVtpR6q6WEGsKZdioohAbfrfc9F4xMLPiycI9ZKWVLSRGMJKnhE74XiKm2LHwtpHJ
         mdNg==
X-Forwarded-Encrypted: i=1; AL+hErEOd7AdDE5jtBZOUxDrju1RSS82wgxN47slzaqnAxVToiK3+rjduaRvOAYz3A1aDYCuleINiqSmmkJfSq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J8sv5Sk8Icnk0r06NYKDLmmJ17HLFX8JxH4uRctMeNI5NrzY+
	SObvx4rHmWYhakGuIRostDtrShc2Afb8WUSKb63gNyPDsEmSTAA29FoI
X-Gm-Gg: AYBFou0tKvD8cADHHdrgw0yvRQNj7F9X0YzZdLpjnu0xJFH3ycc+CCcHiE5YRmmSvUM
	SAh4qJCC2+kFxyA2PrKldBkNSOd4BoaFoIJ3MubGKFsU0jC2tlEZaH5Pr4DLjkuzcAXZWPalZ4h
	G4NYegu6O2YkgSUfmm7X+4gwcXQRQaQt0FSufN1rokEkjazXUapkyBbddd+jI/Z3VHiTqb3SPAM
	cLk0QtPQd9wWTkYjS7cWteuxLur4qIA/0fYW2Zrb1Dx7M61bH0ugmoCobDDopKqo10IgONh3V/6
	Q7b3Kp+J6JmA1XP5EX566v0vQH9K5EC4Sv7IpkE8g/DCy79wm7Md/0OPC/ALAp57Y+JAte6JhB5
	Yn2rGOgL51kX6RN7AgK2xhksNrfhHLfMFgArmgS5gBiHMZFI5eJ4x/axvO5VANWOJ3EPS1xOWKR
	21w1mbQW5fkCaM1/FaI0+zwTE3qHMbvtXiAqjGYhDJwSHUR9IhOgFcX981XVb2Ohaln6rVDZkqR
	06N4/60bBXCXatIsZfNDPA6cHlp86BUhYJ7m8IOpfR93fKIUJGD1eit5dUiuQjWqOHvhOztcPqL
	aHSjaxKvsjr6ocuQzcYWNnJ71PCID5d/5JS0AMliwFp1pKth3BBb48LYAAl8GMUCitYxBT3NCxJ
	zZGlZ12syUupOiQRfofeFefXhixD+uglYmv69YCObP06h+sdcgLKeF+25gRUTtEfqf189IdEpg5
	BLm0+ddDmMiOzPexXHbJbxHl9Yj1WPEvS+hCeNxl9yJiAW14nA3i4=
X-Received: by 2002:a05:6870:a414:b0:48f:e3f5:c41c with SMTP id 586e51a60fabf-4adecbf500fmr1245207fac.61.1794177192413;
        Sun, 08 Nov 2026 14:33:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a326fdsm3563668fac.17.2026.11.08.14.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:33:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:33:04 -0700
Subject: [PATCH] mtd: rawnand: macronix: preserve OTP operation errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-macronix-otp-errors-v1-v1-1-8f64a2ad5a10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqDMAyF4VeRXC/MKsxurzK8qG2cGZhK2okgv
 vvqdhP4w+HbIZEyJXhUOyitnDhKCXOpwE9OXoQcSkNTNzdjaovpM8yccXZeo/CGMS9IqlETrgb
 r0badbe+m8wGKsSiNvP38Z//vArzJ5xM9F4NLhIM68dP5mnO4ipNyaMtwHF+SDBugoQAAAA==
X-Change-ID: 20261108-submit-macronix-otp-errors-v1-0f83783917cd
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The OTP read/write helper replaces the result of enabling OTP mode or
transferring data with the result of disabling OTP mode. Successful cleanup
therefore hides an earlier failure. The read wrapper can report an empty
transfer instead of the error, while the write wrapper converts it to
-ENOSPC because no bytes were reported.

Keep the operation result and the cleanup result separately. Return the
original error when an operation fails, or the cleanup error when the
operation succeeded. Still attempt to disable OTP mode after an enable
failure, since the failed command may already have changed the device.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204080@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_macronix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..16847f28b19d 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -377,7 +377,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	size_t bytes_handled;
 	off_t offs_in_page;
 	u64 page;
-	int ret;
+	int ret, cleanup_ret;
 
 	nand = mtd_to_nand(mtd);
 	nand_select_target(nand, 0);
@@ -420,14 +420,14 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	if (ret)
 		dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
 
-	ret = macronix_30lfxg18ac_otp_disable(nand);
-	if (ret)
+	cleanup_ret = macronix_30lfxg18ac_otp_disable(nand);
+	if (cleanup_ret)
 		dev_err(&mtd->dev, "failed to leave OTP mode after %s\n",
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
 
-	return ret;
+	return ret ? ret : cleanup_ret;
 }
 
 static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t to,

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-macronix-otp-errors-v1-0f83783917cd

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

