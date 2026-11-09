Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240419;
	b=kg5N1CRtChxrMa72IF8Ul3wJGssjGptx1FrAw2k+d9KnXsXwQvd1GPq/mlkZ2RZxkkuu
	 cOpnbGtn/BYtW6d+GWm4tTZQoFjjInfG11d0rD0bwwORDjceh2zjQVL4draaBOEHSbVDp
	 KGlMf1cVuYz3bekX5Xc2MrxXLOoSVYzu4R8qwpjY1nYA4CMNQS2/x2rcuNrPsXk+WTqwB
	 DgXIOeTNXVHjuAfi7tUti6gfsa54Tn9e8eSz9222bZU8zzUqX2jgELZH1prEEgoH4o5z/
	 9MuW9gdeehhBznIzIQfGxLd8lmuu8lkLsschBZEy//8YKqwf81ynlkQLApNf6zpE6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hI5l4bj6TcV+Vd3lWVQWsAgDn5n3YxniOdSZG9zMnJw=;
	b=BDOc5uIAS+c/UIiCGIlCzaz6tiRt17e2Mg5r7RHUu45Y55I4DjX6mvGhMfmZDfXonAkr
	 PJuElfSKi/c8awOX97UytoC2aFtGEZAh8miMU+O6EVA80Tex33NwP1fx0X1ChPf/eTGQQ
	 BMCsOG5cdV3obsi08Jq4ZzXcLy9xIsxTCtYHxMfr9XiDRULbmuNDtdjgu2TItrDwxZbLO
	 AxyFPK5xaZ1S7I7OvAJEdMCduRsTevCz5CGsI+86KgKE8Cz1iQe1rXDAp5S3Aom1R34C5
	 rp3z5zQE+Pbr9Ocu5UHudT7ECqX3Fi7EN05x+NIpj2CQpYg4NB4IyIw1uzkunn1pPiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdzRGRPM;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FCE606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FCE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdzRGRPM
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-554c0d47d17so3276741cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240418; x=1794845218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hI5l4bj6TcV+Vd3lWVQWsAgDn5n3YxniOdSZG9zMnJw=;
        b=rdzRGRPMR1idrJRKQ3PnfTN8tJ04fwid2deV4Grs8wbhxYaxSg767fJeiuLdJtLtet
         Qol6UoI72Gb3CTqedOh5tkjdq9xECUh0xBdUcAXQRB90bLNH2Mrmgd1ElpfcwKkC5AZF
         G9xdFvRo8tVWNelcO6nsEaKOuk8nkl81WuaqcF9f8NQKsTY46vGo4dR5f8YInCvdQ4A2
         42tUjsjA/CjXW8eycZyMT3vS4r0S8KMwUdR7yp27IwmY/c2W7fW7T1GtOt2TOgoqn1XU
         E56zFv2yta+BM2yDDy+MPI2TY11+m3g3uXKDgnwezFPPfda0knui/rk4y0b0k9dkDJhD
         q56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240418; x=1794845218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hI5l4bj6TcV+Vd3lWVQWsAgDn5n3YxniOdSZG9zMnJw=;
        b=kMIPPkEr/BU5ugTuBIYzchGTnU9Ho4klv2vQLteYqRApvPfNCHemxOVZrR8x1btujD
         AFiz5znYojDARrIS141I9pkG9+QljEtH4cpaS3nyCWoH76Mu9gq22nYZP4OGKy6Obz4w
         47+xByPaDHLJywoFFKuxepUCvQShBBz8OupXQvyeswm5U46hGDMwUBZovP4nW7UcvVWL
         RS63/dypLb3H9K3rrukXMJ5q6xzCeOX0mPlwgLzEVtYwmEmGfpEEkrQZfkv63A7bL7CY
         7mY+VU+AD6p9Pap5qwhxBJWM1GT1uTtuvMkfLIRIIZTwzIGDViIZ1jE4IdSn+C1d/lMG
         m8JQ==
X-Forwarded-Encrypted: i=1; AL+hErEdDHulZkakZm7YrHYXRBaycI1aaLLU/58Lw/xunS1vNiuojeMp9bt1/veu8SxJ4YfAfc2k3ULli/kcxb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2leqJsynNa3LS6cWWv+byL1MBcBj9BZGpzvfUUbslKBwGltLL
	Ce3U7DAfapQDkPPIsCy2MvKkvrxze2yVIOBm70E4rXXreio+UxYykVMR
X-Gm-Gg: AYBFou1tw5bzkayo/i0h8KgBx6LFkkpkR0FuTzHVJuEc6ppEmc9PqoWW0aDpKZ6uj79
	9UNjNg/Ex7tmK8fTjpF5J5f4X0FpH7jWRKb0X5lzKwrl5kJa0a4dLcz6MmrU7T/6WiOxx/Iiv5s
	puf9JR+tJJb99r5LDcgHqSXVNDRtYhhcNnfy00vv/YcVKBuI0Q/8hhsR1iDMV5zNuphgQBP94sQ
	h7GNNqeUZ2Ny0d+v4Lh1wNR1xS0YAC37qvjhehkCUnHQi15CD+NN/5f+70BpKvdv1th4oEr/Fys
	Q9EkqFg93cBy3J678ofL3htuZXfMM4kJrsT95qHZ1mffzsZI4KlSc32M3+xltcFF1ygsfEpM8gk
	zH9g6OnXm4H0CZMsnRD2DrKlEN5k+wpw6OEwAiWUfkk7A1Wwwj+ev5oSrt0pLF+tG+0J3OzljZm
	tkMji7KYXdrUR7pYv3OQzpshiEZ1PRshSmfZPtuLo1WR/xWQrccNt6pXIJ6YCdzpgexTPvT9kmH
	sO7XK7HvHuwUqzoICL6s6Y/5eMmvF8ebvicnYClgpUsSH4SaNre0w4RKpiNw93HHcfEMQzpMY7j
	xkQ6tGk2LOdGkRg9V1k=
X-Received: by 2002:ac8:5d92:0:b0:536:645f:c901 with SMTP id d75a77b69052e-552a6634d05mr69872741cf.67.1794240417643;
        Mon, 09 Nov 2026 08:06:57 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550be2e22esm438061cf.23.2026.11.09.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:06:57 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] scsi: ch: Remove the minor from ch_index_idr after device_destroy()
Date: Mon,  9 Nov 2026 11:06:51 -0500
Message-ID: <20261109160651.986356-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ch_remove() removes the minor from ch_index_idr before device_destroy()
removes the "sch<N>" device. A changer probed in between can get the
same minor, and its device_create() fails:

  sysfs: cannot create duplicate filename '/class/scsi_changer/sch0'
  ...
  ch 1:0:0:0: ch0: device_create failed

The new changer is then not attached.

Replace the IDR entry with NULL instead, so that ch_open() still fails
with -ENXIO for the changer being removed, and remove the minor after
device_destroy().

Fixes: da707c54c342 ("[SCSI] ch: fix device minor number management bug")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Reproduced in QEMU (x86_64) with scsi_debug (ptype=8, add_host=2),
which gives two changers on two hosts. Two threads, one per host,
delete the changer through sysfs and rescan the host in a loop for 20
seconds. Without this patch, device_create() failed 992 to 1151 times
per run in three runs. With it, it never failed in two runs, and
/dev/sch0 can still be opened before and after a delete and rescan.

 drivers/scsi/ch.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index b2c9fb71c9e0..390425671a3a 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -952,11 +952,15 @@ static void ch_remove(struct scsi_device *sd)
 	scsi_changer *ch = dev_get_drvdata(dev);
 
 	spin_lock(&ch_index_lock);
-	idr_remove(&ch_index_idr, ch->minor);
+	idr_replace(&ch_index_idr, NULL, ch->minor);
 	dev_set_drvdata(dev, NULL);
 	spin_unlock(&ch_index_lock);
 
 	device_destroy(&ch_sysfs_class, MKDEV(SCSI_CHANGER_MAJOR, ch->minor));
+
+	spin_lock(&ch_index_lock);
+	idr_remove(&ch_index_idr, ch->minor);
+	spin_unlock(&ch_index_lock);
 	scsi_device_put(ch->device);
 	kref_put(&ch->ref, ch_destroy);
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

