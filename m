Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128193;
	b=WtRLUtgsHrIDeyiiKcXhhYs5sfvo860DvB6mRNSurtfGLAXYJE7K+S1f5E7arXOQ46mr
	 lENMloRYoDsIKPxXIlZ4hoJMljOD1x93MqrTal9aWSVZvl04pyrVL3i3QTmG+2I2dijFZ
	 Ik04jaJ6k+uYY0k4pGjube0cHjWnqRVlDdEFe3jKMw9Ct1xQA/IpEZX6HrQgwYprsNP1j
	 OYhKpNJDCP24oTg2bvnKehba/K4kkx1MYIJqV/ZxLRc3GV3fStIxdku844KHUWcYP7JxA
	 fElpX7aldiOFcYwSQEkym4ENXhM1l7G6d2WjwYwYK5a0pCkq/QySh1L/o/GjSpNx+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y5Er5qEWvFzLAS9aWf5qOCZttioGJLL2l9OxkXkcHF4=;
	b=PjEdAPtEN59xA3+TyNlwiNyWpycs4E4J1TenVMXDC6jXNpq6mBXxGJNY/HGMWVzptxzA
	 3TtlXtImkmM02IrTZkOCNtua7bCr28Qp5LXeNAYHqmIqUAdR4lCYPF8sBILBPbwMqXeov
	 yIE2l4xH6oFfVVWyTBY6i7f27uHST/fso4krDSIFJz4rnAATNXLmfMcUw0C+5/wNFjtUG
	 eRU2AsE+D1E3hrGkEFCFcImuBHD1/QNEyKe88LwUxJtLUPbK+6yDSxKdSy2wcXr/Trw42
	 lArOxgWd2vpoS4hhuuByYw8vwNyihtE5IfOS7a8CPBpwiymq2oOJzIbOOANhnVqhEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFwc0Qxt;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C09606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C09606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFwc0Qxt
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c75267b0fso3596906d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128192; x=1793732992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5Er5qEWvFzLAS9aWf5qOCZttioGJLL2l9OxkXkcHF4=;
        b=iFwc0QxtKG76JUMl2HWekEwDI33TNnCt2y9nWcJ65IwzjkK4LxT5CaY87gCvkOC+oK
         57r9O+M6Fp0ONj/vIOuk0J7sWgFogPwiD56E3H7vIYiAH2e4eqx1gXB6mnzcyIsWgg7a
         0OoUpyIvq36IsQ8WvDgU5vmy74firXzRHebDvmDH/N3V1ZHZQFqVRuHP6Gjc+Fam+Q4l
         i/uQtZpeUZmKbPS63QICi6k09ZyNp50r8QCz2i3ina8w3Mcu0khyN/AKTHsHnrmo6gb7
         rPV/dvhNzt+yuVTjNeIhQkVzWJ5FbBy49tJozbLHZJkEOvQE+GddV1Ved1+SjLPwEGOF
         vIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128192; x=1793732992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5Er5qEWvFzLAS9aWf5qOCZttioGJLL2l9OxkXkcHF4=;
        b=Pbys8x3mcSRLjf7oMiZg46fJHW3+CpgC/+fpQWC9CYwK4UJ4jQjTnxv/1iRdq2MqV3
         wVah6i9bOU1FYV8/2gS4t61Cfee7/vcuPQHabMjhzGGmyYdZ2snDhH75FuPe/Sk/YphM
         rO6ErQBOS45A6JqVsMmWULJ8Vw3lo2t47lLPTW9lTpxLhFG8xRIhJgmoqep6gl97O2Hb
         yX5QJLWD9dUxATZXm++CTuTtbwrMUq9Q+8CleEI+R67DAXa1YMlggAI74cu95qc/+6E7
         V/IfjXmiXg/qPIvEzYYjmXXY/cUJMb8hxUhhEahQXI9O9psKRfyOT3DsrjACceuqYXc2
         F/2w==
X-Forwarded-Encrypted: i=1; AKwUvByEc+rJHMDFzfst1wuDMLQFZ3f8ipQxa8cxbH6sCYXM3WrzjNRvMgEEcAxOwoee75/ICD5prxRAxWfEM5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzR83ZOfCe+NcmFEQ/NEczqOuGnYAfqa1pXUEHrBhBvoZioq+m
	t3OJR6MLHlFY4Rmb9Lo5pm5CJIjMpRkBaQJMiBAzksKJ3BIO3NiE08q6
X-Gm-Gg: AYBFou3WfBQKmdoaoF6fKpA6+SsJ0J7tnDBJwzzhdYhRoLKJaoTk8d2+kNU4H2ZAuLY
	uvyp64E0A0EhiWU3ElOUrq4d5XeEIRwm9lwhM88+ndeESXLu+DRBsMF4loUAngExAmkxokiaPnk
	bkgflKnsH1iG7btqYa8cukIqBER/LtV/KFhbBL+IiwOYuRz6kAkChrT6hbGIzxiQcWY+sVmHcJD
	It4P47Q6tHgkzTeqmvLtobtoby9dbmt2DCLDXiTW65QnMnlTC5NfbbAIkH1o3Ocqn6Og80vrHEt
	6GD4EGd9IGPQPhIZSDrmkoKdOKSduLZtQdgAJpv07ycjRtOiyRZaXztUiySXAdWZLEzSejbcuyI
	XWfFxPJ/iEZa2M7esoXvFx9nxYs7rpeG+AgX9HLNTbC5t4a2LEnYG0zwH0wMSbtqW8TkjoM4a/x
	ijZp0frvMLMj4rg09WEYl2FJ5e4inHdS+br+qOkx2oNnYWIUxzHIyOuyIkJCk55VnkSn1KsYQkr
	nZSvp3npe1QB1v8eaYvv4DWsQ3I8g9KDKc8sZCyyFtvzF/d4AOouFMw3fSqQHxu9zGg84qaMSXF
	lRYgx//yE3ITIX5tD7ktmoE6ufAz3crTmVwG2Q==
X-Received: by 2002:a05:6214:29c2:b0:912:517b:8fc with SMTP id 6a1803df08f44-91c7d1dacfemr422896d6.46.1793128192011;
        Tue, 27 Oct 2026 12:09:52 -0700 (PDT)
Received: from [192.168.1.216] (static-acs-24-154-158-10.zoominternet.net. [24.154.158.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a69129sm108541016d6.4.2026.10.27.12.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 12:09:51 -0700 (PDT)
Message-ID: <28bf49a0-63da-44a3-a9c6-c31a2e0f4e09@gmail.com>
Date: Tue, 27 Oct 2026 15:09:50 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66
 Raider 11UE
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Udvare <audvare@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909193104.26508-1-audvare@gmail.com>
 <2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
 <87fqxv8pif.wl-tiwai@suse.de>
 <1ca10bd0-0452-4411-8577-9753ea50f56c@gmail.com>
 <87o6cf382s.wl-tiwai@suse.de>
Content-Language: en-US
From: Benjamin Pryor <programmer2514@gmail.com>
In-Reply-To: <87o6cf382s.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies; this one included the code from the original patch as well as the
line added for the extra device, whereas the first one only included the added
line. Below is the patch for just the added line to the latest source tree.

As mentioned, I'm still new to this. I personally use the affected device,
so I figured the easiest fix would be submitting a patch myself, but I am
still acclimating to the format. Would it be easier for me to submit a
new patch for the affected lines, or will this suffice?

Thanks,
Ben

---
  sound/hda/codecs/realtek/alc269.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23aa175faedd..1d3f60ea9adf 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8330,8 +8330,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
  	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE",
-		      ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
  	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
-- 
2.43.0

