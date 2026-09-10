Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46175678CD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063274; cv=none; b=Cl+c+hhYXtlDYJ9y+cSjXEsJFZtfQwhcRlx1w/n2Zn/+7raOEI26c6g4a1QPLbvX6Gpg9rogo3EhmUdBpBKbP/LoiybuvxA5Oddpd/0maMpTgfwToC9e3U5VZYYbhhC5Ny8et5fSdKsszHh7kMmOx1l9Sjb9syGpEQCJ6NKZE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063274; c=relaxed/simple;
	bh=cNmR3QCqYOVJn8Vw2rwUhPvlJ1Ijvn0auVR+xCz0ug4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UL9r8LDkLrc/QeIsBn/9P6IW3GxqqKVdll1G0djd+NqUDCzJ9kCGbDqiSxq2IGbvC4SFBl9nNsAwZGhrBy+CZfO3G/KRGLQhXScVkcU4ygpLsYvoCTHAGbhA/c4jRD1uU6tYMGnqxvYn3nuxyH8GR/cWFcvbGSlvuWtcP0R4I3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkhSAblC; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkhSAblC"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92f0b5ed131so846215085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789063272; x=1789668072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPSEx2E5juGVh+7+CkjxpWQjRnb00L9DvXVIbF/QJ0E=;
        b=KkhSAblCiYXpGmopT6CUvYMvZS6CPijAhx7Spz5fhtmTBKwpw9N+tg/OzyRJGpTSLp
         4IdKJrdtYkWJNjtutcn/Yt+HN9fFcf3YU91NX+ja9ETl15mhkAcuU5NwKUy6qqx39Xxk
         e9+zTIKuPy+QQn3P9fWxMM/Eqsq0zZl7zjNDfJxhuBbJk51udmijsLUNRKmrvqnewR1v
         7rwQTKFnBzDiymi5rgKVXw9WV/mbuXz1lEgwInsjezJRXiq/dK2bTilYONyGRI2X8IQ7
         c0+V0C7FPLzIjWiZLWadZthWcglII6yiFuBC4tMuYgv3536AY8U7O7/15UZvcJU96Xf4
         wJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063272; x=1789668072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPSEx2E5juGVh+7+CkjxpWQjRnb00L9DvXVIbF/QJ0E=;
        b=VZlaOgwtpF/cNJDXmKnS5L5nOkXI9nBzoGyQ1vGaLYFccUJOJUYJmzXosVitEwqgpu
         Pf8IEfgmyt0TCojPHBabTQLJnVbMCH9I/bzPxzPXJ2Y2Spi6c9SPo3ur6Yjvgxa+uv1h
         uMS+iR13QSyPXLT8gxALIA32rSXnd0Vd1oRTHI+WjXka/b/phM4A8EyCRk6ZZBTL32Ns
         AUC+rkaFQnGSGZWwDp7OBcDn6kPx1k1c8FF5hQ5PqWAqDmBBubBSTnzZFZIggXufHFWj
         lI3yd3HVHoPBdbFtF6LOS8ZmOsCKYAvFzGlBc4cijrJhzpfYueeiEmbGaUu/rg9CJ0Ib
         nqRw==
X-Forwarded-Encrypted: i=1; AKwUvBxCdncBqels/Aq2vBZcdySXkiDvskcDB6hig1dK67BDFjubr68C0mGNdtREyx+nGNF2sLrZYq2k9p1OIuE=@vger.kernel.org
X-Gm-Message-State: AFuF++nQEk9MgZIuTyT5w59w2dJM39hGjB4FmWLbaKsYAA8zgEOqcygb
	kvwOI8stpvS1UNTaGT7SVg61isCIFzQmfGh0w72ghEofBus1TdpL/cFV
X-Gm-Gg: AYBFou0nUXrO27QxfJYxvUl9/rBYL+qH1NrGvN2R0AW8w+1RTaNLxDR6AS/GiOKIrY2
	1B+CEwxQyCbuxjyCD9dy/foOqDqVMFsjcB/Hp8ns/1uUIRHnO2nQ+k9KRFCVrLcU3YXwrhPu+7m
	Exh9ppTeyrDODJ1IomL6avI6yCFsl3TYpIG4GU17yhrpKGTK3J/UcBMoXf2QaGoQK2Kjkrb3bqL
	uAGf/1hJVU5laDFRxdg68pE4se4eviE2lwyxXH7+aFmapd0Td+E+AjV2hLqF+9sxGWDM7gq7njH
	E5hzJxcz/wMDYnnGwq/BsDsZdmQp+UKn/B6YVKW2roGBJtXNrn6iDx9tZOaX6v2+NmO3GnrdJVk
	0K9irFlXKvxbq6EKpddbdOgkgfzwl1ix3+6Rt42yBHKZ9YYUFcYGPxREZC8FyNyO6BiDZ83kfjG
	d7E8n1VS+1RLnyW8EtTPn17V8s5zppa1QQh/+AQPw2DqexyrmnrxsJ7vhKSzhMknLLLomSvHWBE
	cCS5SOeE/eY+oFMMKMWSSRT7JvjUNtoc57vSfQqrd1mS4apIt8+wUZ/BsTG3S5rFC2VxFvJoPiF
	fB4Iaxvvxb+u47PiPooZx/pNxbTE7ksPxWQ7PEgIDkHVkNKw2yPiGXnvmMdetTaNfYV4K7y5fg=
	=
X-Received: by 2002:a05:620a:410f:b0:939:112:d526 with SMTP id af79cd13be357-93980361ca2mr4985510785a.18.1789063263268;
        Thu, 10 Sep 2026 11:01:03 -0700 (PDT)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a0f5:ee47:8227:6ffc])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7d9f945sm41280185a.6.2026.09.10.11.01.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 11:01:02 -0700 (PDT)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	astellman@stellman-greene.com
Subject: [PATCH] nvmet: derive the CRTO property from CAP, not CSTS
Date: Thu, 10 Sep 2026 14:00:56 -0400
Message-ID: <20260910180056.81257-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_execute_prop_get() answers a Property Get of CRTO with
NVME_CAP_TIMEOUT(ctrl->csts).  NVME_CAP_TIMEOUT() extracts bits 31:24,
which is the TO field of CAP.  CSTS defines only bits 6:0 and nvmet
writes only RDY, CFS and SHST into it, so the result is always 0.  The
same controller sets CAP.TO to 15 in nvmet_init_cap().

NVMe Base Specification 2.4, Figure 36 (CAP), says that when CC.CRIME
is '0' the TO field "shall be set to: a) the value in the Controller
Ready With Media Timeout (CRTO.CRWMT) field; or b) FFh if the value in
the CRTO.CRWMT field is greater than FFh."  nvmet reports 15 in CAP.TO
and 0 in CRTO.CRWMT.

Take the value from ctrl->cap, where the timeout is actually stored.

The Linux host reads CRTO only when CAP.CRMS.CRWMS is set, which nvmet
does not advertise, so Linux initiators have not seen the wrong value.
A host that reads the property directly does, for example nvme-cli's
get-property.  Advertising CRWMS is a separate change.

Tested on 7.3.0-rc1-qpb-cc-crto-base+ (unpatched) and
7.3.0-rc1-qpb-cc-crto+ (patched) in an arm64 QEMU guest with nvmet over
NVMe/TCP to 127.0.0.1, reading the properties with nvme get-property.
Before: CAP reads 0x8200f0003ff (TO = 15) and CRTO reads 0.  After: CAP
is unchanged and CRTO reads 0xf, so CRWMT = 15 = CAP.TO.

The issue was found by Claude Opus 5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook

Fixes: 1e058089d28f ("nvmet: implement crto property")
Assisted-by: Claude:claude-opus-5 [Quality Playbook]
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
 drivers/nvme/target/fabrics-cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fabrics-cmd.c b/drivers/nvme/target/fabrics-cmd.c
index 42d1d1811671..3311b79e8f3b 100644
--- a/drivers/nvme/target/fabrics-cmd.c
+++ b/drivers/nvme/target/fabrics-cmd.c
@@ -65,7 +65,7 @@ static void nvmet_execute_prop_get(struct nvmet_req *req)
 			val = ctrl->csts;
 			break;
 		case NVME_REG_CRTO:
-			val = NVME_CAP_TIMEOUT(ctrl->csts);
+			val = NVME_CAP_TIMEOUT(ctrl->cap);
 			break;
 		default:
 			status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.53.0

