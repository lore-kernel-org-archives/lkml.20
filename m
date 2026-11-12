Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451063;
	b=sVXtqATI4qxXLHqIl7R169NHNm47nvTjNQH8fW4lSBS1dEtNkjZzaBVjoCJqNe8inmQ/
	 zmYrNUIBTfsDVuGdc1X6SZbe88YEuKtowd/tWdR0dZIWjOMD18r2+4OhMT+wXjysGT1MP
	 mO1G08YKEfefZy2kXwhOuCcycYR9qYAow53Qyg9l7HBRqBCOSXJFSuusQnyQOljEIm6Ye
	 lC9IwYCKd1MxBiFaDYOHHYe+tLB1n0gAl3rqWHBfp7EeOshoATbNGN3s/O5HQ+QTiZqqp
	 xtZhl1UbirpYRCLKftk8ih0qJr7JXIIAxS8vARpowMVmI8YU2DVd9ftdS9C/sbVu/5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0klULBeGwEXi6KGEhap05nYgaZ4KtkuN8mxtS+61Oyg=;
	b=aLcIhitxt/kr0u7kdE4HBNwS5WaSuatnIG2zkXe5XRQkp4RwoM3WYYeGo+J4Ch4eP4SX
	 a/OlM5T9nclj27lWO9hlS+9VCa1pcXGr9otHQ7inzO238p7gsSRqSvWw87Kv9bLtupZ/j
	 frE1c2hgFuDyjNZdsOCcWo+EB+wSermOvC/KSht6Ob0TI6uZi1JH1wU3R/RzUTU8lSihx
	 wxNYEFC1T9EmHmLL4qc3UZy1E2tUFyTy4Ig0OpPc9q4JjhlBqUydUAuFzHlJqlM0M5iKx
	 FFrrNIVbJ/VSg2yISs3xTAVkTWpROG+0Ta6tmAMYp/iCq0zi3WK+d11/rALK+WNpfOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZF8+uiqU;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D060A2600
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77D060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZF8+uiqU
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a85c656c58so2569276fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451062; x=1795055862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0klULBeGwEXi6KGEhap05nYgaZ4KtkuN8mxtS+61Oyg=;
        b=ZF8+uiqUaUQBvw66vOpM4hLJZ1mYe7AQ05Zfa8iOQ6USx+CXozBaBqvaq3IZ7SA+5h
         caPTl++oJB5dzZC9R8GR7nZR6T6lPdZaoPOkReiKnD9cmMCLbVg56qg1LniMwwt1Payr
         Bgo0JcuYcMbN+CZCmbKxblR9dWtwclO58+50uD1UumlsGUvBRuoNEqMMypv9DMDZoccy
         t6cWu+vPQdqwO0R+crid+Dx1PgCz2wFvJIQaryP8leFWK/L3EB3viY/O3kVm01dlNRr1
         XLYaJfkIMH1av+ylE4b6C09SmspDefhML61UQr8xE7oA4WJBSpOiWQxpmNj7j/RvoTEv
         MAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451062; x=1795055862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0klULBeGwEXi6KGEhap05nYgaZ4KtkuN8mxtS+61Oyg=;
        b=N3K/GfLT4SbCc4U311p/wz1+DOkRDXyl3HDMpCZW2Rzf2s8Tl2EhbagJt0cn6MeYu7
         K/P0PtNXE2YtDxnWTTqF33roKxg1hew0PPluyP5DMF/koUMGCKft1r0k5d3ASCIWTTVb
         6adBgUUfzSivwYHKFivwaiK0kVegmYgMpjgFGlokWWDHCDZlDcaUqRwD6cJCMDR75cVJ
         7nZLdHEJkppCwZaTdUx5bpwIisKObSfgv232t6T4NftvthTF+qplk2Y3bWQC5QHEWSqj
         61Yn0+D3c0sKioQnQ7uaVQqaAC/0ra/X3eVWr7GxKoUMOlncKjcKli8zariqKU42mp0o
         Jxpg==
X-Forwarded-Encrypted: i=1; AL+hErFwB47c3U6iGVJQBXJ+wZ30dRGkKPnd4E0iFQD6KG6iVo68ZdKhdDLPrQTioHD1GagOGd635/PQCz6rXLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WKhbyFKLh4rQNwtCOSQjaZPNtiliRQ0Q8vOFUim7uPPTVrHny
	0jGT7zUC09YPWz2QY19DAcTQc+SB/STqVQBi2B3Vssl93Ovp2Md9T/miyvsibQ==
X-Gm-Gg: AYBFou2b/2veIT7tHUUSavK9cPHMb4rgw10VDkCaklR7IwopZicoJQuMa3SVV24pLa+
	YEP5Mi5tT3H2kKcCAqx+FvbskVZAAeLIEMtZqQI39qH2YxGj5Nd700zvaskV5dm7qLP65BmUdVV
	i3V++ebgjIc6o5I2/34sqveB/ZdtUGFReP5NNkcoqPpnH8BQAlk1dQbxKek9FRW6dEQWJ5puv4a
	loPrR0jgCGvBhPeE2cUA/E+FdOwcLdouPALCK5IpEgvOaIfCo4zzgLd1M5BQAwV9BMh596iYHXq
	YTBU4Va/tTvtvfkQVbHIHPVtUmRGG1Q4xmuWPUumlfZCLpF4G+mECKDiWx9LrEzTLqObW03J3us
	9HzCeae3OlTRniQAHW8TrVWM+ylZl+zYxaPYBlLYOiCjCYqj4AzAgqUJMDZfds8Tfb/2LrOx2YM
	zPI4j+IZadnA+W3WR5AuO1z191v5gf3VoYfAyBWJ9spbTQNSJkTM4DIv99p2caaaG2qK6tsE6uz
	Zje3hZjwZeIGOsHbV3T38Ep/DAwAwD8CFN9NfgsM7X81hBH4PhDGqYfLpj7J+nwkqizQLM0K8EM
	B5JMO8B5YzVlbl9uVjd7y/RRubs7Uo1y+3Xyw8gS3uHwig==
X-Received: by 2002:a05:6871:5825:b0:48f:e3f5:c419 with SMTP id 586e51a60fabf-4ae46cb13a6mr3949691fac.58.1794451061574;
        Wed, 11 Nov 2026 18:37:41 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:39 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 4/6] ALSA: mixer_audient: Fill the cache on first use
Date: Wed, 11 Nov 2026 20:37:18 -0600
Message-ID: <20261112023720.1503814-5-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <avOFQAGTVkCXgs2l@khmer.arcnet>
 <20261112023720.1503814-1-mrwillporter@gmail.com>
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

The probe reads every channel of a cached control. That is not
necessary: a get or put of a channel whose cache bit is clear already
reads the device and fills the cache.

Remove the probe read of cached controls. A failed first read returns
its error to the caller and leaves the cache bit clear, so the next
call reads again.

This changes behaviour. The probe sends no GET for a cached control:
that is 12 fewer requests on the EVO4 and 56 fewer on the iD14 MkI. A
failed read no longer logs "cannot read channel" at probe. A put to a
channel whose cache bit is clear first sends a GET, then sends a SET
only if the value differs.

The probe write of the init value of write-only controls stays.

Assisted-by: Claude:claude-fable-5-2
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 1bc6b4bbd2910..ff7bf518743ee 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -1091,10 +1091,10 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		elem->get_cur_broken = 1;
 
 	/*
-	 * A failed probe transfer must not fail the card: warn and keep the
-	 * control. Its cache bit stays clear, so a cached control reads the
-	 * device again on its next get, and a write-only control shows an
-	 * unknown value until a put succeeds.
+	 * A cached control reads the device on its first get or put. A
+	 * write-only control is written once at probe. A failed probe write
+	 * must not fail the card: warn and keep the control. Its cache bit
+	 * stays clear, so it shows an unknown value until a put succeeds.
 	 */
 	if (ctype->access == SND_AUDIENT_ACCESS_WRITE_ONLY) {
 		int i;
@@ -1108,20 +1108,6 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 					       "%s: cannot set channel %d (%d)\n",
 					       ctrl->name, i, ret);
 		}
-	} else if (ctype->access == SND_AUDIENT_ACCESS_CACHED) {
-		int i;
-
-		for (i = 0; i < ctrl->hwchannels; i++) {
-			u32 val;
-
-			ret = snd_audient_raw_get_one(elem, ctype, i,
-						      ctrl->val_offs + i,
-						      &val);
-			if (ret < 0)
-				usb_audio_warn(mixer->chip,
-					       "%s: cannot read channel %d (%d)\n",
-					       ctrl->name, i, ret);
-		}
 	}
 
 	kctl = snd_ctl_new1(&knew, elem);
-- 
2.47.3

