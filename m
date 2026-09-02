Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B5488220
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350797; cv=none; b=YnOdzbI0f7jXIVUvMoyOKX+jJBK+9LIazEsJ3qT5CNDAHFQrybDd1fWy0PMUwsq+i6aHRARYc/wUTeEASzUSczLh6IGG74BzLrmXsAN59xH1fu7MsbjXz5klCl8j4WQxQ5aWnyRL2EwgeAmrT7M48wmWr/D9HnnEDIDKdTUmxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350797; c=relaxed/simple;
	bh=5UCt+d0wqU/WjjUjEZUTVPcpF9m87vBm2+lIg/OdQ8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Brc5TiSVpqq8MYjypbgAT1du8mmLwFt58BDhJbHS8lDsfHRUOX2b3exspS7ueCb9VtE/rswcopkF+54Bg04QWNQcG1O18t943ySpN43V5rauKYIhpGZ/yhHYtVDm8qQdaZIpru4xV13shJhJwUEbJyv7hYkYBmmbZFtkoszaeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WFXnluX9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FdsqZEeI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WFXnluX9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FdsqZEeI"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788350776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D1iUjExZ+5WyJmTn3rZEdbGnudiQsYYMbZ/Kw756+64=;
	b=WFXnluX9MIdAjjr6pxd626OMY5aFIFBYtufHmkb07Dn3HjPPFAlU2UF5zyYlVf59MxQ0KM
	XU932YT4UiBOIFE65RZwg29smmx2eg/DR1KxILZbmkrojYJbCUheoVJlP3qAyNdVnu7zcF
	8mXSo/T8FhUpontpqDsaGkDKyfsvQfGuXP99wiNUFE5UVlDoWZwHCeaYkCfo3yLV8S/Kyj
	Gwk+xCrBOsManq1exaDgg6K6mS8yhyHhnJuMfQu/6LxKjCcF4zUE7DtVKd7+grPPZXVKTZ
	mXDHNJ/qtI0rWPQaqVH/J2VlNSMuYp496sgoUDhvYTJgcXZtZuN9LLYMl4EmDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788350776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D1iUjExZ+5WyJmTn3rZEdbGnudiQsYYMbZ/Kw756+64=;
	b=FdsqZEeIDdW2LQLxJBxCWjeggVX7MzTWnrNw9tCutgxMvPfJxSCQ6BpsXxUEVC39KDL8AU
	3d1k9EV7G26RktAQ==
Date: Wed, 02 Sep 2026 14:06:15 +0200
Subject: [PATCH] vdso/gettimeofday: Clean up read of tz_minuteswest and
 tz_dsttime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMj3bKU4nzdkirdJEtLyzQT42Qjk6QkJaDqgqLUtMwKsEnRsbW1AJq
 zhoNZAAAA
X-Change-ID: 20260902-vdso-tz-b999f43c24bb
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350776; l=1291;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5UCt+d0wqU/WjjUjEZUTVPcpF9m87vBm2+lIg/OdQ8g=;
 b=hwgTlaS8AQ47urSYzFImT2tawy7ixa8+XpUEqumOO09sJaxbbxO8KqqMeDbyFwIf1RZS6nMCc
 sEmO9ca4sSKBIJ8o3YHT/F6FTVcM1p8yqY/iishVWqhAFtCAGXHgJv7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

When these fields got moved from 'struct vdso_time_data' to the new
'struct vdso_clock', this access was forgotten.

'vd' is not an array, but a pointer to a single structure. The code
works by accident in its current form as CS_HRES_COARSE is 0.

Replace the incorrect array access with a regular pointer dereference.

Fixes: 886653e36639 ("vdso: Rework struct vdso_time_data and introduce struct vdso_clock")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591aba59f..6e9b03051bee 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -374,8 +374,8 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 		if (vdso_is_timens_clock(vc))
 			vd = vdso_timens_data(vd);
 
-		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
-		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
+		tz->tz_minuteswest = vd->tz_minuteswest;
+		tz->tz_dsttime = vd->tz_dsttime;
 	}
 
 	return 0;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260902-vdso-tz-b999f43c24bb

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

