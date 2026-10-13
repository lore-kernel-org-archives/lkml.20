Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8543C09E5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900154; cv=none; b=DP9W0eZ98jWvMzuyazmUSmAx4Fd4jK+Ji0k86auJGKDlL90KRlNEZ3dA2FKsOJQMoIX8rTgr/Yah7cag9RucbcExzw+5yIU1Rt7D4EDltQtbZWfA9mr4axAQTtUWcICLYqd/rbM+CZhDMxqxu9vYySFV6x5twzM2JkWdrx0iBjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900154; c=relaxed/simple;
	bh=Tawb0P4WHQbChCm0POAm0vP/OT0i3bQuplGTDM9ziFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhNZ+UERCEbePyb0rXtws+nYOkxHJdYcJZWhiyvTDl80cct9H1UtIfn7asOY7DRs7QKVz7nJpCcyxa0PXanZLmiOMq+u+94FUrXDtPvxVefSrmz0xvMhKV9/vfvWp9xL6nukzsdDZv04jXv86yuCfUukCgoWqg54YpX/sMSmEGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=0wacYjbs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="0wacYjbs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8455755f3so15306185ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791900152; x=1792504952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpvwGadULPDGCwDez0VhWNS62rM8BYPtekPhIicjGOU=;
        b=0wacYjbslPFBJHaRaCfeH3+kGmnMbBD+0IrKW+MwkiZz50vz+AZN43toDt7RdsEBMK
         RSnkfpVfGYRnBxfodvjknMclg+yeYQYwtHaz82FEUgZw9getGYePqMIJOSD+dUCCtqUu
         rDgX6HeaPyYr+ZH+fhpEa/4y7t1U8OfJFlchcpSnoLcXeIguXdtVjjJpLXdlTjY3as+6
         0aL9KBQ5nsbazSH7MZ25NeG3VRp+0ayFUVVWL5YQdSHIxLicBj/RuTEmJW84Es8Giftr
         q3grA9SL8+QEjS7qthbX4U7eDMor1PTNT9T4n4E4Q4GolQ0t68+4i+T3o7lwYc7NfuTJ
         EHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900152; x=1792504952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpvwGadULPDGCwDez0VhWNS62rM8BYPtekPhIicjGOU=;
        b=m5U0Gnu411viMlsLmZ7PUTZTHWMSaNE5EDdaOY/YQZPAtAphX/xDCNQZVtkmzO3rMX
         W2y1+gINPBfT3kIig2KggmVT/liczjCeoog/jycy7WrXKWjB25mwMxaHLzQluV8FjXIM
         ffA3CO/KOctBBf2atpRMkeJpEzI6o1o0mrW3InwtjOyFxUeB6XOHlWYlKHHfl81+79eY
         p+7doCX9RU7SgyOz5KvGffmWYAF0BkQ9bwJUFIB8dxMKiYM/d0eVgLXDteYToIhqJjjz
         ivcoDtVMPwyZtfud00PXlNKQ0OUmAqEiO/wENO9TRHhxiftC0HjHr15X2NIQo3K3kKvt
         PD5w==
X-Forwarded-Encrypted: i=1; AKwUvByU9JlqQkVSs1ExzXbZL+ZrkWnRHHBBEOouqPf3WAxOjt2DceqhoHbaAf2adfYkHDxBHYj5wLExRH2jNMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUUtWeBzJ7Pniix7u8I2oNzz0VPwoHSY9knQJO7R7FQMij/v7I
	gEB1EUDzaHt0urAZZh4InPJIvrv0wlgxHBQbeDx4vGBHlvmErFEc5bvlXosBgRhJIM3+0dhzSIk
	1dfb7ATtDZw==
X-Gm-Gg: AYBFou3itD6BanXIkQF0isyngAkdFUkQtMiC52D0wQwLAy1v8fYfRWn3nYqZpK965s+
	AsJJx2unYIPUE2OhL9G7YwiQ/NCVylytqHWI82T6uCAIAgemPBGwjuvIPV38NNL5I9oPdbacwSl
	jt5VrajggvEaS5VnNKPq3NYFb+3zcGoAr59Qwthv7oJ5IxVqtLNTi4lVIFLSbZWzu2R1gT1tWjT
	JxHb7dDIeirnRgFOakIX3fhmjAjshrRJ1xMpwfIwBIGOOJlQY5qj7YlytZTpf4aJxJUE6lPAzCn
	KLGw3gMz02V5eO2t2U5B7Ayl3v+UxXPSAS+rNrDsrNfbYnPkcLo81Vex1SqYxeNQlDbZNpSMl2J
	NCWL8ld6mnErU1UekN4hzqjQnL4rHB7D2uFB9+dnszLEtUxtX5OtBjpwEn6MNKTGcg8N9NNZbBw
	nNSdE39O8zjZdkfyA+LqdxR0EDdazpnRj2j9DXo1fByIKiw8YwYGqXmfIs9OcEZIswcz/QbTFJT
	TNPFyu70d2WsSEC3IzQ
X-Received: by 2002:a17:902:f54f:b0:2dd:c100:b2c3 with SMTP id d9443c01a7336-2e842ce0ad9mr102000625ad.46.1791900151506;
        Tue, 13 Oct 2026 07:02:31 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a02f85sm56433065ad.10.2026.10.13.07.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:02:27 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 0/2] scsi: aacraid: bound adapter-declared sense lengths
Date: Tue, 13 Oct 2026 23:02:12 +0900
Message-ID: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two spots in aacraid size a sense-data copy by the destination buffer
(SCSI_SENSE_BUFFERSIZE) rather than the source array, so an adapter that
over-reports its sense length makes the copy read past the source and
hand the trailing bytes -- the previous request's scatter-gather list
in the shared FIB area -- to user space.  Bound each copy at the source
array size, as the container sense paths already do.

The two sites have different origins (one is as old as the driver, the
other came with the native HBA path), so they are split for independent
backporting.

Yehyeong Lee (2):
  scsi: aacraid: bound the SRB sense data copy to the source buffer
  scsi: aacraid: bound the HBA sense response copy to the source buffer

 drivers/scsi/aacraid/aachba.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

