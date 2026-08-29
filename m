Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C5231A23;
	Sat, 29 Aug 2026 00:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964657; cv=pass; b=plOouJeE66krQcSXwyLGozimYSbAAXsB+naQbxMezavC8xKiX0uhYIZBc1qwwtQTogZGAEdjcXACufFSDABWsc4o3TXd7ArKnyvVK1uiMXYuXMGeBIEb0rRanHRylUUGDz/Ok6kqYWkcApy+GD06c+RbIl3tKIbsS6cV1kJw/oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964657; c=relaxed/simple;
	bh=hqVid05sXo2Y5XtykFtON6yQR4CvCozk3bsW36bwdfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzmwtrVIc1q/TIO598vEDQzcXNjwQpQ3kmeyqcFCIJhyWHCmDHoblCnj71AKmS7LY1V39Q+dJd5fNdporoaLED/d9a0JEFfYuR/azPK+MYJFH4KzIWCTBhccrcIkbtkkzlGMMrUeSvBcZ+R1fjJp8AHh/wTPyhrXvs7P8hC4GoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re; spf=pass smtp.mailfrom=soh.re; dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b=L+jb8KqJ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soh.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b="L+jb8KqJ"
ARC-Seal: i=1; a=rsa-sha256; t=1787964616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GbJP5hQLIaJQPN0iDO0YT0HSvEXymjFu9SHPz3pgwtHUvP/ciJQhQ7YDxng6hCy2At0eDMAsmiwrHVIMH6/KpsW8Xwc3UsJ8pI+4DF8h8LQdp/+l6zuz32TuGhCfPpOiTmW/EMPVdNxrNKZZPtDmri2CxkivWfaG6bTY7tt/ueE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787964616; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZXJksmxYjcYv5lCh3/A2GHIMEHhoFas8aljForLYpoY=; 
	b=Ns1t0kLBiH7DF2rDzy4OjsorxNpFh2L/ed9HNhFejMhpXnXo6mmZnXKBxf7w1gKI49FZZP31hq+x0AU1MG2CgDlnM6pHYUeHe3FzXN33FdrS8uRo63nReao10SyqmVOwUupnh2ZUczoibrvQZuXkOQPToZVvVpuyf+2qINJuTJE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soh.re;
	spf=pass  smtp.mailfrom=jon@soh.re;
	dmarc=pass header.from=<jon@soh.re>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787964616;
	s=zmail; d=soh.re; i=jon@soh.re;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZXJksmxYjcYv5lCh3/A2GHIMEHhoFas8aljForLYpoY=;
	b=L+jb8KqJU/yi6ELZfy+w6xnU7gzxrS0VliMA6CiFSej2LrDKtwjC08nR36zh93gQ
	0m8zly0142Y6AgxiIc3lIRHhNGzxIXkXJqNc6LAarQXwh3AyGIg/5VNP1YZqjv5jH/c
	5YIKoaw+Z9QTg1O5oj9LN2QenMiJP5MDAZtTuLOc=
Received: by mx.zohomail.com with SMTPS id 1787964614257231.2541926529036;
	Fri, 28 Aug 2026 17:50:14 -0700 (PDT)
From: Jonathan Seth Mainguy <jon@soh.re>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	niklas@aldervall.se,
	linux-kernel@vger.kernel.org,
	Jonathan Seth Mainguy <jon@soh.re>
Subject: [PATCH 2/4] ALSA: usb-audio: expose OCTA-CAPTURE control MIDI cables
Date: Fri, 28 Aug 2026 20:49:59 -0400
Message-ID: <20260829005001.534571-3-jon@soh.re>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829005001.534571-1-jon@soh.re>
References: <20260829005001.534571-1-jon@soh.re>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The OCTA-CAPTURE uses cable 0 for MIDI. Control requests use cable 2,
and replies use cable 1.

Expose output cables 0 and 2 with mask 0x0005, and input cables 0 and 1
with mask 0x0003.

Tested on a physical OCTA-CAPTURE. Control requests sent on cable 2
received matching readback replies on cable 1, while cable 0 remained
available for MIDI.

Signed-off-by: Jonathan Seth Mainguy <jon@soh.re>
---
 sound/usb/quirks-table.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index ef618a0f18d3..35eef9cf834b 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -1363,8 +1363,8 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 			},
 			{
 				QUIRK_DATA_MIDI_FIXED_ENDPOINT(2) {
-					.out_cables = 0x0001,
-					.in_cables  = 0x0001
+					.out_cables = 0x0005,
+					.in_cables  = 0x0003
 				}
 			},
 			{ QUIRK_DATA_IGNORE(3) },
-- 
2.55.0

