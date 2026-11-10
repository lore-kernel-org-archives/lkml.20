Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285017;
	b=Ml/hNvHkS+CsvEmwq6ipO3otK7tqbgAkF4arz0IDxhnzNuX/LATn2G2eC5LhL9qAts9E
	 eStfROBjTwlMFZgB2YssR+JCRwUHK8XA0zCW5mAoIn8tiWqGZjUIIEpwtrWVn5oEeH6vT
	 9GWmMsQjaxJFVDoRgNSejZJOOmr8kMjNsD/WhmS8SzwBWB8LT7L4J2VYW+iaQmVR6rT3X
	 /xXH9wig/qOYZ6hrOqDdK/p6BzyFaOdSWbYSCQE0GSwyHKHlU9GlkqjOIdvaR2wLtqUMO
	 8MwUd80XkrRGTM4X2os0qs4ocrb63AxgyElo26E/i+sWsni0v0/1/pr0LMv8nEEMsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m9ZiqV3STCrg3BhaNCa8Qlk+MJM+GYUBrMPf7KJLgGU=;
	b=s8gIjHp7AXXqDXkEoJ7E+5+NVVjwUkRC68qVjl4NAoRsiTMvmHD/iPzcrpplV/D1X9zK
	 6OqfWxW99gBr0Q6kVPc7yYnZxRaVfoW4S5G0TaY/5pIAMlUmYOuFx7gfpWmkmM0XRaeBL
	 dE4SgLRlHZkDq7qdhAqKqwHxgAhhgNeYh+u0l7gS+p94mWCbljbfYqc3yXNZ4u/pdDu9S
	 DUE5QzVI4Z5ws2NFTnq3KTln7g/dkFFRQpGNSlHA/lF6oiGF/V+2Coy/U7GeFgNemoGP8
	 49J5CqedJL8P8PcN7a+Bn3Heax7Pvl5/TRYrPDu/GImFfJHyQDxIkmpkT5wPfnVSfIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/BfnfVJ";
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55125606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55125606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/BfnfVJ
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364648ae07so14413571cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285016; x=1794889816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9ZiqV3STCrg3BhaNCa8Qlk+MJM+GYUBrMPf7KJLgGU=;
        b=I/BfnfVJEqNAcIncWiFEIEy0CQgE8VyTmVPyGTEK9+2XgrwtAyUnpxVxpxY92ZjhyX
         BmtrZe6nKvuI7XLyxZopfOU9phHDG8Xviv2Q2F39ASFwCmIysXw01oylmpU9ez85AcvK
         m+PkqK747ScC6FvPS7Pz8zLV5HvdxcevK4yUERburF5YekQ8PL6STG7yc2QHA63vr0er
         67Tube1HToUSX3RGCqO67FfnDJpqxN9oVoI72yTCY1EU573b2zyOcksy7GcP8hL6gmrv
         JmZ4rmtwX6CsfcbOQM67UstmBvZZorZHwz14M/egE1IZ/IhGYFC8hv/wkxAXYIWkk71H
         ghtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285016; x=1794889816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9ZiqV3STCrg3BhaNCa8Qlk+MJM+GYUBrMPf7KJLgGU=;
        b=oxbqNK8b0iXhgB4IreOWqG2Zb5xmj0tvlNPMTi/1RvRAqOjLSjmykXcE8yT1iHAooc
         5PlwBB5+fbGJk3Fy2z87VwoFF0pnLghN1wZBS6geS8M05pQDYnkdxW+miOdOmglqPYLs
         uO4P4f5Wcp0RTM6e+dF1KLDK1J38Ix8wlpitm9bQLPBghrTDqgKOWwgMaOyRgrIk8fC0
         8XtjhfGwPkCK2mx8h40V99T7p8K+QzoBGe8hycG0H1mH16m3lRQFZhTy3/YnBQUCJFou
         iBRoS0J13qMfzA1g6pyIocoyIp3M82lyKUIKbh7JPgf1Dpzj3LNXkSb5WjvWdE5APMxO
         9yPw==
X-Forwarded-Encrypted: i=1; AL+hErHdxSakiXE27ToL6YaAg63QbbMLawZIEz62TmXahp5NzJ/i1qRARDcXVoCvloC8vRNl9p2t/caInS1klnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8097KME9IPGTCrF9laoahKXMouhMZTYWRACxi2axr2aH+vav4t
	fKRh8rqDfcLTASioHhIrt2Vkecvkh3eF32fj6npR6Lvf43/ZNM0qhsM=
X-Gm-Gg: AYBFou3Np7FnO5R+2eBRNYZaOxlPdgN5+ocuxV5tNSEtW3FP5Mgcf2t7qqudDQIE2s4
	YXa19GG/uiB5i4p+UqfKqHQuhYmENCec+0uILzMrCKZnTEm+Mvsfrhsk3HBZLiL9eWt4iLPkykP
	nceTjcgNzGQpK7BpnX0EHxbMHew0Jxdw6wfH+cfCwP/AOwmnnAViUEjt1aJMt974zbvv1hGseCG
	zk4Aexe8g2NKkSticYvjvVZaloeTPrDStLnoVw9ubHzuEZWPsd5H+jlHEbs3G1l9hULHvtFFz9N
	lu5JsKmPByoVl0OAk8JXYKpG1ARywUNBCkfAzHVQUgloNrc8XDp2mX2TGIZ9boMQpyTeWuD90vN
	26wOnK1/Eb9LDWR+hSCt/UAsXlvEszTIKAqWFbqAAfTw+94PoMQeHxnQuMyCxM3y0dHiSbj3QkM
	Z/MnttJm6WOt518jaBtQEh7zrIURR+WGetRgdXrO0V1xsKD3lXK0R2/N6YqPpEsyvPPBUmpAsAY
	YCE0GNI+Vg8Fe8d+kNiFwxhPM32Nk0RGEyk9wjtYPhcgpKFx/MEQfBXgpp4WOEAVDtCNMsQrrtY
	gGOzFld2fHS31exS4IJyM18wFKdOZslX0SvwWzxRSBuqTEsUJXAGd6XjsNH9Xp68ZWMSX3gJdCv
	2Ok+3fk/XR9R1OB/0eG3oo+9/xEBzCM2qOV3HxqEainCSaSPdLdi+fleBuHd4O1Fb
X-Received: by 2002:ac8:5a51:0:b0:535:1b18:202 with SMTP id d75a77b69052e-55527f0f4f9mr20274411cf.16.1794285016367;
        Mon, 09 Nov 2026 20:30:16 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555093d9c3fsm14579281cf.3.2026.11.09.20.30.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:15 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: rt5682: disable jack detection works on shutdown
Date: Mon,  9 Nov 2026 23:30:13 -0500
Message-ID: <20261110043013.56937-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

rt5682_i2c_shutdown(), which is also the remove path, cancels
jack_detect_work before jd_check_work. With a headset button held,
jd_check_work can observe jack removal and queue jack_detect_work
after the first cancel. That work can then run after the codec is
reset or, on remove, after the driver data is freed.

Use disable_delayed_work_sync() for both works, which can queue each
other, to drain them and prevent requeueing. Probe initializes fresh
work on rebind.

Found by a static analysis tool under development.

Fixes: 45a2702ce109 ("ASoC: rt5682: Fix panic in rt5682_jack_detect_handler happening during system shutdown")
Cc: stable@vger.kernel.org # v6.10+
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

 sound/soc/codecs/rt5682-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 43132943f6a7..db820cd9acba 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -299,8 +299,8 @@ static void rt5682_i2c_shutdown(struct i2c_client *client)
 	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	cancel_delayed_work_sync(&rt5682->jack_detect_work);
-	cancel_delayed_work_sync(&rt5682->jd_check_work);
+	disable_delayed_work_sync(&rt5682->jack_detect_work);
+	disable_delayed_work_sync(&rt5682->jd_check_work);
 
 	rt5682_reset(rt5682);
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

