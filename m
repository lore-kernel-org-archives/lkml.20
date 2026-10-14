Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D554CF4D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995074; cv=none; b=A5VGIiKIvNNmUD/5Vu3OdQSRxvW9vFFRn+PhT6bNI8fS3qO66bJi3OZJoD8nr8g0sQKDc1i+VeK4MDFk1/ZJK0JORihnUpAkV4mWPE2+BVRqXq2CaRLmFX3VMRPCokvUu6W01Zv29/2P13pWIc3tUjZYMzLxRXfMoRzBZZcjcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995074; c=relaxed/simple;
	bh=/0Th4cc1vO+E41gV5mMuaLCXH78VA1Yl6fBR7oSaQAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGZH0O0UY9qPfKompdsr6bu3nd4xcZacct3EgaERTQwe1LJR6Dw8FHRpNPgeTQgRvuRwuhpyGfe6RJTXNUYWOb5w7Usn/C9f2W3Vumw168YgQdrlvx5fH3/9QswUolQNnzG0ajmLbLNVS8vfNCvQXH+0M6jGFdL7+xHn5B9LFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=ZDPSm9Ge; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="ZDPSm9Ge"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1517bda04a0so2951402c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791995072; x=1792599872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPVBPUAW/BeX8HkZROCJHuR0r1MMomkKnirbqP6fatU=;
        b=ZDPSm9Geb5Cj68QH0Iqx2V2qQTo99UY6xrxvfwMXYR36s93Ol2V7KmTvv9MSieI1aH
         Whdc53VD1actpn88rZ/yM+pX4OfXw2eZsabvI2WsutYmWsw88akX+fh7v6CFCd648Nho
         qFeTr9bvMDFxxxdKJvX+rNN8SZFfk9/WM8RI9Z7remBYIIzpgJQ+EMRGlzHaStrO7c6m
         QBI7K0wO3ZwPgSmdxBpm866Y0k1HCpzIHNZtlOL3BVIBOj3DO2lVlTeDIeUQc8L2QAGG
         cd8qP58MPKPBKlHkDWpjTBC+/K+K6eBLgieoLnTJF43GgnaBPt39L1nsdA9MpErzbCAK
         zKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995072; x=1792599872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPVBPUAW/BeX8HkZROCJHuR0r1MMomkKnirbqP6fatU=;
        b=ixkNNeP/AU3ctWmqE5OM0lP+8yllyTvuq6jJXkDFTEgLvHXEIh47R3itl2IGHrRo2c
         eojpGMeS6tpUuttc5U5OfarpX6Q/lBgnvzHwCoV4LVr6fGGvsVuZ+fIgttcYKHGauG43
         Tenq3k0ZybDEtfzlEeRzwJpOZNP5P20VM7ILa1vnEAqEJtYH8/w8XrtVC2SilHRHFmVk
         D4V5Kx9giXJX544N6k3M1G175t0X3BulaHLPsxvbH8D/V/Iwokor+/FT9muivWu5Hk1h
         G5cSKK0Xuc6SzsW3KUY3VKmAvrSQ/Gn6a31gyqRIw1G+DM2r7UTOIPoc7lhQeLgISb4w
         PJ4A==
X-Forwarded-Encrypted: i=1; AKwUvBzawAvv5Z9u7Ap8VUjZULx03gWmVOYf4PWY61xefZNVrvV22xELOK/K7Z4hf50EsLz9/4wSLkKfbcKJhco=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhZ2igcBAApcB7rTZ5n9DyI77GCxCVTznRjLk/PqAkpN4a9pfd
	snDdbDFWdudK0OOitwaq63Xj2MAoPYCp+N09UI68yCwzKoDf3cMsi8dszH5NtgN2Vpc=
X-Gm-Gg: AYBFou2V9GQnjkT62XV43l3bIUQqOGOUe15gRsPgMGBF1iiZV4cI306ZJu6Qaq424Sa
	DQAwvuRU4emUQAI5hotUqWxyJP0AJ+hgptd8R32rXvdSCWtY4dBGKT2Ea0RbEnHTDhk9rxiDdlN
	41YXfRz2K2l/5qeL9LFmcH+NNwAqQ3HjRJqocFeWNNJZtyjRbXvi5jnIOB4lpd/xdjrWw8/cZrf
	ciegoVkyMPzykzHsnPRLejo7N45I+mnHACAaupp/aReNz95GKaJi+btK+VT+We4OiMhA8Vv0xbg
	kGtsHlVZRoxPWRNYQD2QVs8GZca+k7AX9zsBUd5LvdNWZCxSAt+VtzOf+PtehrDrf4z9tkz4zBE
	UJ+Qf27fCNd7BOCT+WwxCoVzZCGGgRU30EKH9m1M+PLdC9OxITELneVaONmaWLt/pQ8UXl24C2M
	vKHW1ijFUX+K2O3E/GkVgVp05Xmsk4OLZeT57PLJHYL9AwgaEHGR+/VfNvkvsuUz4L7Mey6Xhz9
	eVIaoCpp0LwEo14j6kJ
X-Received: by 2002:a05:701b:4510:10b0:144:fb87:5b91 with SMTP id a92af1059eb24-16a5ef28a68mr20362324c88.44.1791995071477;
        Wed, 14 Oct 2026 09:24:31 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm48816685c88.8.2026.10.14.09.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:24:31 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v6 2/5] scsi: mvumi: reject an out-of-range handshake frame length
Date: Thu, 15 Oct 2026 01:24:10 +0900
Message-ID: <20261014162413.3649841-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
References: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_hs_process_page() checksums and parses a handshake page using
frame_length from the page header, a u16 the firmware fills in, without
checking it against the HSP_MAX_SIZE buffer the page lives in.
mvumi_calculate_checksum() then walks frame_length bytes of frame_content
with an unsigned char loop counter, so a frame_length of 256 or more never
terminates and the probe path hangs; values between the buffer size and
255 read past the page.

Reject a frame_length that does not fit the handshake buffer before using
it.

Read frame_length once into a local and use it for both the bound check
and the checksum, so the device cannot change the value in the DMA page
between the two, and use READ_ONCE() so the single fetch is guaranteed
rather than left to the compiler.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 38a92f8c25f5b..2378b676a7a78 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1039,9 +1039,15 @@ static int mvumi_hs_process_page(struct mvumi_hba *mhba,
 {
 	struct mvumi_hs_page1 *hs_page1;
 	unsigned char page_checksum;
+	u16 frame_length = READ_ONCE(hs_header->frame_length);
 
-	page_checksum = mvumi_calculate_checksum(hs_header,
-						hs_header->frame_length);
+	if (frame_length > HSP_MAX_SIZE - sizeof(struct mvumi_hs_header)) {
+		dev_err(&mhba->pdev->dev, "invalid handshake frame length %d\n",
+			frame_length);
+		return -1;
+	}
+
+	page_checksum = mvumi_calculate_checksum(hs_header, frame_length);
 	if (page_checksum != hs_header->checksum) {
 		dev_err(&mhba->pdev->dev, "checksum error\n");
 		return -1;
-- 
2.43.0

