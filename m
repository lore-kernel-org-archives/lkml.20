Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661349;
	b=5WtBa5FhJeToFEslA4Cxz9NxCPrrpYpZvsEAMMAwq3T+Mme/mmyhjKcabuwqbVItqs0o
	 S28Ib6Bsi4Ae4PvcRVXA2BUXfrjawRZ5wXDW/A26uyMwW+neVlxCGxUgCCWjfYsngqlu8
	 Zk8fFCvJdZ7DsNlPlSMOmL2eMRoU21yZD+OfKyqVpX13tH/rMpgJo/OJVhHuAy0Bu3sbz
	 HIW3mGRkFGBd0owe/ZCmbB0wIAgde7nK8s+WZynRTTJls4EmLqT6W25QYolvYt1psEyQ2
	 l8c0rBWtsnDjyOQ9JDHWnqPEJ+OH1W06p9/bd23n/d+3qLliFPJ1uxq+ehQRmlsf05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661349;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B6Df8r70xTd0ONW6jfA8pbFSgTjk6p+YXsqooUk8tEM=;
	b=iT5qrJjApgIaxPIc8LVMZ5wtF0hJyR7twpO+29uBU0sMchqSnXwbZjQ0MZtlcj5JVoeI
	 PtAGqdDCXBaOhrbiNkkRhPXS94Bo+77BdRZYDukN78E7n5mPJ/ESR0VcUDfVamhRGREHb
	 v+c6d61c4R70l6NlPgSHARQXmfLGVa9qd8n6OwTQxgBVmxkOS6weU2NS4+07961KTqZ3Q
	 wo+bAfE1zazHFUW27E5ob2JqpgmfBSuKl95t5eKa6/arS6zEVW0I3U7MJZBxH8jgbySkQ
	 XdJzmwfDArT+sd6bryQ/kBCwXpZRBHsXy9YF/mccEqQ+mn4ncCoyYtav/X1BWWWbU+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="wfoYpZm/";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57324606A32E;
	Sat, 14 Nov 2026 13:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57324606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wfoYpZm/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wfoYpZm/eMPfY548oXFFoW+v3SW4yp68ETnb0G6k3wTIHp7ivTjrFuZ283MonK2DMhkBEWnZhbSQ4
	 cmzBqvtIOqAWu5ZBuHUC1Gc13HHE0LUCfF0VGuBysXGIElNuTq3O6J0efJx8lQCbD8EcXgVPf/KBlT
	 mSvh9DXbq4iKlDqE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af85bde6b1-be4e6;
	Sat, 14 Nov 2026 21:02:22 +0800 (CST)
X-RM-TRANSID:2ee66af85bde6b1-be4e6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af85bdc934-45598;
	Sat, 14 Nov 2026 21:02:22 +0800 (CST)
X-RM-TRANSID:2ee46af85bdc934-45598
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hdsp: enlarge the MIDI name buffer
Date: Sat, 14 Nov 2026 21:02:20 +0800
Message-ID: <20261114130220.142-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

snd_hdsp_create_midi() formats "<card shortname> MIDI <n>" into a 40
byte buffer.  The card shortname can be up to 31 characters, " MIDI "
adds 6 and the MIDI number up to 11, so the name can reach 48
characters plus the terminator.

Building with W=1 reports a -Wformat-truncation warning: the output can
reach 49 bytes including the terminator into a destination of size 40.
Only the rawmidi device name is affected, so nothing changes apart from
the name no longer being cut short.

Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 sound/pci/rme9652/hdsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 7dce548b9..ba5c8bf0f 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1482,7 +1482,7 @@ static const struct snd_rawmidi_ops snd_hdsp_midi_input =
 
 static int snd_hdsp_create_midi (struct snd_card *card, struct hdsp *hdsp, int id)
 {
-	char buf[40];
+	char buf[64];
 
 	hdsp->midi[id].id = id;
 	hdsp->midi[id].rmidi = NULL;


