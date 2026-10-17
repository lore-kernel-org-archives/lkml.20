Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D094CF47A;
	Sat, 17 Oct 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792232407; cv=none; b=j8bVcwYY/SCBfWJ3C9+yCquWco0WCxnPsk8wcRVujghhm4BtAg3FcHXyBEGGnrTGzgYOrqg8GdkDBcYDol7a1B9embnb8j7UGS57oxXDEOrm9zA4ffxFRHgzq8LsBNVbbTYkHs3XW5E8iyfJLW2hKouj4HmCeoCeJe1QIOGl/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792232407; c=relaxed/simple;
	bh=o+5IbCAJg5N2g2vKghmB96Ml9i7PO+ok+afNnvQCb7o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=erlap31d0yROKRoN2bmdsAzxn58G8ndz+212ll7TZ/hZ5enuwvvCedJxwAqAuqmV9bArTC+5TLMaAqHbfsuf/0ebN8toJfNmtecXmyWGxQirivhDaFD3QbbSrBsID4shg0Pc7fQQL3is4WEwxKVyu7Az0hHQvA+P4nUh6u5u6k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 413572337D;
	Sat, 17 Oct 2026 13:12:59 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nikita Maksimov <nickstogramm@yandex.ru>,
	kovalev@altlinux.org
Subject: [PATCH] ALSA: hda/via: Apply runtime PM workaround for ASUS X55A
Date: Sat, 17 Oct 2026 13:12:57 +0300
Message-Id: <20261017101257.215166-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS X55A requires the same workaround like other machines with
VT1802, otherwise it loses the codec power on a few nodes and the
sound stays silent.

Fixes: a0645daf1610 ("ALSA: HDA: Early Forbid of runtime PM")
Link: https://bugzilla.altlinux.org/45606
Cc: <stable@vger.kernel.org>
Tested-by: Nikita Maksimov <nickstogramm@yandex.ru>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 sound/hda/codecs/via.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/via.c b/sound/hda/codecs/via.c
index 807312cffd35..0641fc14b346 100644
--- a/sound/hda/codecs/via.c
+++ b/sound/hda/codecs/via.c
@@ -933,6 +933,7 @@ static const struct hda_fixup via_fixups[] = {
 static const struct hda_quirk vt2002p_fixups[] = {
 	SND_PCI_QUIRK(0x1043, 0x13f7, "Asus B23E", VIA_FIXUP_POWER_SAVE),
 	SND_PCI_QUIRK(0x1043, 0x1487, "Asus G75", VIA_FIXUP_ASUS_G75),
+	SND_PCI_QUIRK(0x1043, 0x1c33, "Asus X55A", VIA_FIXUP_POWER_SAVE),
 	SND_PCI_QUIRK(0x1043, 0x8532, "Asus X202E", VIA_FIXUP_INTMIC_BOOST),
 	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo", VIA_FIXUP_POWER_SAVE),
 	{}
-- 
2.50.1

