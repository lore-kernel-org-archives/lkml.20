Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6636C5BB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103349; cv=pass; b=Rdih6C++dP3bMvSl58NBopzexMn3cmwsfI1GNOR4B7wEv+6p5bhRO2ocUQovzHFrlU7CmtvI4xmN+3Z9RpYi0xxff5ExMKH4hIEslfIyqPX5E7kkCfe76/5VSS/m437+6/rhJjPu9Drfdz1bV9QWPPci91zXLKyYLdGOqU4r/qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103349; c=relaxed/simple;
	bh=NiKDaQULsN/FekldlPoSCg9eoNofARkit0zgu4y2lf8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izv/R9+uDaEVQ+Zc5RUix7PLqeTHvHKFwsYJA2eXvlV97Sv8Us76JorHrlX9kSVSdMxCP655zkBpFqlTMUk53at0/RVKFAZ2NdckZj8DA82h4BZ2ew4u4Mjg5cZSt7Necsgi/beXxh8OWdQcFbXHCF3yxD5mn2HOs2kcFR9GMsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWxKcVyV; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWxKcVyV"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67999045530so2202305d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792103346; cv=none;
        d=google.com; s=arc-20260327;
        b=C5ICBxJUxdHh6+4qbwfl7DATHmAhEhBI7/KO+dUJZVMCMsgaeiEAxsgGtu/z2JXMDY
         7ohrH1WLgE4U6gSiVYDVrc2LyYYzDMDVH/yIYrWJF0eAYNJHLOtPykoHDrlkcKGf8JGd
         WE8cZvDUEwk4PrjioNEP912Me4NfdJwACkqskGUoAU28KPf5nEyJRXqYoZLWzZIMwikr
         stmP6pzn3DcXEaY8CSKCMCfvP0HQTaS/3bMd+WmTwc4FAY0IfCLoXafMTM/bgSfx5oCC
         EC5vT5KRH4v04lD8VeTEiVhlhu2ARN+eIgu9o21MVWn31xtEGiz5ObcM7mmQiAl6rHJ4
         r6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Bj1Epb5FfswhvVZ0TJyzF1qW5a3SYkt7ENfvhFrub7E=;
        fh=BdknfUYpheQN7sB7p9KEKZLleqRtZ3KRY/N4L9ikSME=;
        b=px64juwoVoJE8vWiMIjs6o2XVEKe+FMedr2WUYHrgKxfKzP7dJTUq+iZNMQXpNudeQ
         vT994RSheqZ8mkj+inB0PVu107jQKV2xDJog2FH/gTlHz7PDznOKngRRlmb6rq05SBIu
         25635WycZv/8HGLhkHZtzDf3OOHsmRIvSZ2TSgu/Sz+dvJGZpQJXvXK5gfe2Nyihumo3
         OoyCoP1FD9gp2cbRO3VFWOczlL+FtORgLGfnQh/OGLdAZIe7Zx8WJNqhq5asOb86HsZG
         kGqU/yz1cD7DpAGa6apc+viOg9ssde/P7pTrthMeFoPRmWirjE/wnYB6rGH2cbtjWXzA
         zSrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103346; x=1792708146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bj1Epb5FfswhvVZ0TJyzF1qW5a3SYkt7ENfvhFrub7E=;
        b=ZWxKcVyVMOWCxxzD7j7MwMFyWKZ7XKmu+WL4trFsmsJPzyhDTyP5Blpe79MtLrp5gr
         +Bqpx5RwXqRgjfAquT2ApWQ8qqKq9VHM8Cv/O3dnLC+tlfQo7UbRohAc7SzR1r0f8fdL
         kUFUntNXXn4Rq3nnIiLQaCebjSek7owaVVKTJUA4PLOSFEw4nNzLXf6aV5y0IrkuC9TM
         nOsELBQCzuB2uysOFRD1cnbGjrXZ4NaY9vt6/AkMXgSnXHunzdC7QQt0691bIDZE3tnY
         LzitqwGnmjYUXsla2vzPykjzb0oYlhlEeAc1KO22nyBSWmJRe4xrv2dnoIysT/lWNVVI
         IPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103346; x=1792708146;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj1Epb5FfswhvVZ0TJyzF1qW5a3SYkt7ENfvhFrub7E=;
        b=t8MsZkTmacf+L36Hfz4+7OKRaQEPLNLcDWvfD7fvnRBOiRltFtzT1A+ILTYnFCLPWJ
         AgFi+H/gFvaphOpzdzwfjX/MltlgOeu3FUn3vWg/Vggcuc/jzoKw+iNrrFV6exB7rKWW
         fLFTafCgUXp7bDtTILqPQ6+Uk34DVS0MwOiX8sTlgulQ78fQdww+bsGBZqEvEGGbAElg
         /AneK7S+oT9WLUlT0PzBqvqySaaTN4YRuEzgxHARYOTmbV6Hkyl9dStk1mm3xAXOqhT9
         LC7bCDuhZxNLr1Ht3kmjfJV8KgRo7zXKVpbT7MfgUNJf+n9/A2TldKcPOUEQb2nUFeMq
         Ri8A==
X-Forwarded-Encrypted: i=1; AKwUvBzFUS3NkQUC2AC/ef5d0dLJGFtI7uE/Vl6wj88FXAUVHW+9hSQ/7Oeh2tJJ+crN3lydfBaokpYJhv5xrrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRDH/fLqTaRgf+AbgM2dAf69rjatTfCarXlSq9cgIHug25j9Us
	sJnXocXsQmyaKvuaBUIYhpaySwD1DfOsskcMJwaDySlZM2Mdn2/WbCEzO3uk3rmee59Qez0yh6v
	JATbzkQSfP0AC8OJ5OwYaoHFEsAMQfXo=
X-Gm-Gg: AYBFou1MLapFU5FbkrM6WhuLnf0EJ5OMTTrlaiGeLkai6jQ0xxSCrS9xwburIji/Yrt
	p1OwGZBWXBtKVT5cFZCzLKaKjbSya8Ql8ugTZnhH1kceLNv9mmlhXX1E7hUsyNxeJodq4P6mU1Q
	sM0QJ69WDeIOSTC6/AuMmfjGtTTMvwkQicfH+HZRixR0E6RJDkTNPp9NIWo9ejfxX3V6W+JuS59
	wHxAhPqnjjX4KEfdsQpGSIlprNp1W0xvZ2eQTk0TY6El8UOJik8yBNtrooHvoH4/D1yzu5mh+1q
	uSSknW9pMbQhGoc2893sUKFI8uUrmSg8X0u1eWmQt+wt5bVl4WW27Po6C64Kt8LpwgPjFc9cKt7
	THtUPbdByuJ18lu68CztDhFNiiDnLrt0Cy4mWLT3NSQhcBw==
X-Received: by 2002:a05:690e:b85:b0:675:657b:8049 with SMTP id
 956f58d0204a3-67936a5bc0cmr7401301d50.77.1792103346176; Thu, 15 Oct 2026
 15:29:06 -0700 (PDT)
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 18:29:05 -0400
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 18:29:05 -0400
From: Gemayel Lira <gemayellira@gmail.com>
In-Reply-To: <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
References: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
 <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com> <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 18:29:05 -0400
X-Gm-Features: AclHuK98rkwv-JrkBYl5rNF6_HbarRJHAp0tGUDDcKLhldq08QqmjhpqYPvCG0k
Message-ID: <CAD96ZTJFD5pWcZqk1FRRsFS6tmMMiOGduxK+4SGb45jeZvp1OQ@mail.gmail.com>
Subject: [PATCH v3] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI
 leaves GPIO1 unused
To: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Jaroslav Kysela <perex@perex.cz>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ASUS Zenbook 14 UX3405CA (SSID 1043:1A63) already has a valid _DSD
and uses missing_speaker_id_gpio2. ACPI sets cirrus,gpio1-func to VSPK
on the left amplifier and unused on the right, so the right channel
binds with VSPK: 0 and volume drops shortly after playback starts.

After parsing ACPI, enable VSPK on GPIO1 when it was left unused.

Signed-off-by: Gemayel Lira <gemayellira@gmail.com>
---
Changes in v3:
- Rebased onto tiwai/sound for-next. missing_speaker_id_gpio2 is still
  used only by SSID 10431A63, so the GPIO1 change does not touch other
  laptops.
- No functional change from v2. Still no generic_dsd_config and no
  internal-boost override.
- Test kernel is now Ubuntu 7.0.0-38-generic. The running proof is the
  out-of-tree module of this hunk (srcversion 955693DEB4FC9A01D9EF0EC):
  both amps VSPK: 1, SPKID: 1, firmware
  spk-prot-10431a63-spkid1-{l,r}0.bin. No PM -110 or SPI -16 with that
  module. One earlier S3 on 7.0.0-27 reloaded both amps with no resume
  error. Not a multi-cycle S3 claim.

v2 discussion:
Stefan Binding replied that enabling GPIO1 on the second amp should not
have an effect and asked for a bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=221896
On 2026-09-25 (comment #15) he wrote that this unit has no
CirrusSmartAmpCalibrationData EFI variable and that missing calibration
is not something the driver can supply; contact the laptop vendor.
This patch does not invent calibration data. It only sets GPIO1 to
VSPK_SWITCH when ACPI left the function unused, which is what stops the
right channel binding with VSPK: 0.

v1: Message-ID:
<CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
v2: Message-ID:
<CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>

 .../hda/codecs/side-codecs/cs35l41_hda_property.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 272421d1b..002771848 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -479,7 +479,20 @@ static int missing_speaker_id_gpio2(struct
cs35l41_hda *cs35l41, struct device *
 		return ret;
 	}

-	return cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	ret = cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	if (ret)
+		return ret;
+
+	/*
+	 * ACPI on 10431A63 sets gpio1 to VSPK on the left amp and unused
+	 * on the right, so the right channel binds with VSPK: 0.
+	 */
+	if (cs35l41->hw_cfg.gpio1.func == CS35L41_NOT_USED) {
+		cs35l41->hw_cfg.gpio1.func = CS35l41_VSPK_SWITCH;
+		cs35l41->hw_cfg.gpio1.valid = true;
+	}
+
+	return 0;
 }

 struct cs35l41_prop_model {

base-commit: 7f21312381fee99f58b383fa07374da3c614aec4
-- 
2.53.0
