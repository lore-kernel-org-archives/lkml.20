Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830400;
	b=zeLSmlHwol0OWcbMfwgQqGu2HNoUFatBUTsa7oRO9z+Q83vze+c5Bu2rN+VUsThgeltB
	 odH9HV+SI30KHoimCKqxzIz15otqMASd0h5i8ATp+3Z3ZRGSWi7cUP2M4kBNZ0H7WwpCv
	 UzZTamgAuPbFwOIPS8QynYYkUvF2WnCTMnwjSmXKrFtJzb3YsK37kpdaIp5yaQHire81n
	 hquS93uOjhwlKjLDyHF6GjOfdc/HkIflrDkW64YUWa7IC5RnMP/FisEwFVLYFye89lRAr
	 Cgld5fgtyp4vVk8FBWgc8zmDixNeTwHh9gCuVtVILlappGjJKhOqbqoK9VxKGJcR7Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5QImqI83e36mT/dw/kA/7//9dXkKQdA3avebzT1aW5E=;
	b=Pnl1xQmYwNjLq9bbcHUSKALJ3Myg2EInek9WeNkraxzDT9vL37CFcqLEb9CixJfo2V1Q
	 15paNy/LQ7zCC7KYls0Jq4erG+KWI/4VzEd7E9GhxgGCG2z9VwGaTMwdE8Rmky2+pDKRY
	 GSQmFD2BkDGP57JvNO8zprvyA8B+CU9iV2h8JhvO+P+dVa4umosCDpTefzoCWSsBaOis1
	 fADIBcvrLTR5p8CDQXIKo0xiEZ8HG+Kud7EHmq83b+Yfzz8webvmw6nhBSBaRy4HYogP3
	 uEzRRQUwB9MMiJrbOY0CtiHN4jV6FuuaLPLWqCMldbUickNqpyv2HsCObaW75vSMMcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nmzVZfCr;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA6606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BA6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nmzVZfCr
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91befbcad6dso26867926d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792830399; x=1793435199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QImqI83e36mT/dw/kA/7//9dXkKQdA3avebzT1aW5E=;
        b=nmzVZfCr2pXrL+EtREBKGcClpv1x2lS2Y/rofm90hyR/z7evX5Psds1zLlopJfUz4p
         tjlvx3T3Rne8z2YtCs2lJCzhvtGbHZMxub50xoYEH4e5S6xHMAw1ZBgnjsxn9HeImhH4
         PD/26m5I6Pu+g+Ga59CvKGWu2wvgOL16rc0F3Pwe9a2NHKel5LHhxUCENkkXc2s0iEAq
         CxjbzbiwVtQrlL9RBX+Jq16TrCl+pYRWf0Uo+u++H0gMb411Rz5xymm7MY8Qmf0lXvtp
         jOvz5pOX7m0sNIWI3XSaRPeT1B3ij17oGJcmaBEcuxhNpOaxn39K7aezx3MVzbWW5ag1
         CBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830399; x=1793435199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QImqI83e36mT/dw/kA/7//9dXkKQdA3avebzT1aW5E=;
        b=CKO6W/emFIEJnhncYErfV/k6b/DThIgjmhcjOmZuIAjQwTA9j0p5LWITu6KjqOgFuA
         uP9VdbUKw+BjRUu1gWhiLdgGdzmQZjIIQHZqJTqPPP+09xET+fuhp2kaITMVlaTdWTSu
         xnwOIVKduZnLD0wi4TR3giN2vQ1sWigM2OIqwsYeJU/sk1S/kJQvf8ZaT+WKXFSvmrQY
         DAjgwnu8SU2wcLaAqLFPEm+uGZWGLbmfgVIg4XKSSXlugW94pSc8fxW0nYG1AucqCHgG
         bR6twz3sCKAwFYL5rEoWl6NiD7FD4kamHWsGa3IUjqjUD8wp62FjP+M7qNMiQHgPzRpu
         WAaw==
X-Forwarded-Encrypted: i=1; AKwUvBzkCLF8n1YAYiRNe1DHBZ6uPpFwS/Y3eGEnMMz1YV3EUJvULl7ElUJ0zn9SgEyVPiXhn4NYVI3rmqStFWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQAj6RToQFgmgrlOqbU/jpTP4xwIQdrmJXDN8ICmim+YZORYoi
	5L0NOmvY4qiCT/k3pB/l/B26EadOgJUQZeLn1rliQAaOnwJEX8tqxBJpSQ/TfUS0GSU=
X-Gm-Gg: AYBFou2MR+ZTjsqRnmcIF5uyjMe12d1tHK7nsYathGGV79OaijRNoNVgItyJtWwJmYq
	RjWGeH0ddUwRgRLiFu40bdYAPxE8xL49/M5TJzZMsj+IZP4f8syVNW35bqCsfnyWLR0nOraqzUZ
	VyS5TVk5DvIFHi2FIvQWk1Qqr0Yjx9grNho6bzI9MIvbNsYJIOksnrUJVfKSh3EhAJ0rWMMBeBg
	o3+xqkBhMCRDJz5DoIGy1zGpINLYQbdm28mnKS7bj42ii3pSopQ0Tdh5YXF9kP61ScF+xBEY0Ym
	iUoxFncOD+IS5TK0PnkzL5gz68OSwZtJbHzb2sy1scCJoBWSAtkA/kkQzeo88klYHuS3T7ilpJx
	EV1rK2nCKvKmnooRisYLC8QcXlFCBqv/1Cq7lMS9THmNExGXzUXvi/4jFhmgw70EXlImDAkw29L
	iKbC1GdMiYmZOL+ZiFWEmNH0mOspmlAYfwStVy0z1uUXbhzIE7US0454Mwc6POYRgxMkZsePf48
	Q/e+3LtBasbj2OTS0ljj88Oc7+1DhJiV7q5bt2fmgdih9jt4xKLs05cTic78JXnmjq6i1/OqcQO
	pwXyRg6VS/iOHweF81fRKXd81pDQWWgFxn/xEA==
X-Received: by 2002:a05:6214:19c8:b0:91b:5d3b:7ab9 with SMTP id 6a1803df08f44-91c48ebcc1dmr22164846d6.53.1792830398964;
        Sat, 24 Oct 2026 01:26:38 -0700 (PDT)
Received: from [192.168.1.216] (static-acs-24-154-158-10.zoominternet.net. [24.154.158.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd5b65sm16066826d6.10.2026.10.24.01.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 01:26:38 -0700 (PDT)
Message-ID: <2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
Date: Sat, 24 Oct 2026 04:26:37 -0400
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
To: Andrew Udvare <audvare@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909193104.26508-1-audvare@gmail.com>
Content-Language: en-US
From: Benjamin Pryor <programmer2514@gmail.com>
In-Reply-To: <20260909193104.26508-1-audvare@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Add a fixup that programs the amplifier's initialisation sequence at codec
> init, which turns silence detection off.

This fixup should apply to device ID 1462:1305 as well, since it uses
the exact same coefficients as 1462:12fb and suffers from the same
silence detection cutoffs.

See: https://github.com/thesofproject/sof/issues/10475#issuecomment-6380540623

Best,
Ben Pryor

---
diff -u alc269-old.c alc269.c

--- alc269-old.c	2026-10-24 04:14:40.174188675 -0400
+++ alc269.c	2026-10-24 04:14:28.725047392 -0400
@@ -7593,6 +7593,7 @@
  	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
  	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
---

