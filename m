Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517920;
	b=oAjkqkDVSCT0CRVItOEPWsax04iJ32VluligVdXZS1SV/RLI531psQEk5i2XM63NA5r6
	 dzq87C4SGjABnHIoEqP3PoYsVpkunpNkQoZZB5bgGyYX0ercrQf8DcwAWl4GXnODqMOtF
	 2ZcGQz1Xii+wbyJ8ALKIwX50Z8oLxMDA2b14qCJ/rnXM/c1xnb9stgQcUQJ+TCVh6+iHJ
	 eVqmHnOLlVy4z7HnV3y2Amt6N4voE16V4QbvPm9KrSeqAyfReo6cHTwkHWjfB52cc/o2r
	 zP1332PwC9t6vNzZ0i8lnU6eSwU+640bzErxOTWNk0z9EA1OLHa8JnUONKK1253GKkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sw+u/f9GrnCWR6VUs3++RZAN52TxC2uVPXknWSBOLT8=;
	b=pSELsLONZXd8IA9UQCbNkuWpjNpOcCCUMC82xzUBTaL/jIlBdAoEM4EYusETmu21Gask
	 bBdrpfidML1xgT1tDqHR7wLOpUFUsDPN71lI3wtnGFl8TPtxQuGropKrk0tgK+dP4F3Ex
	 73xwcQm7t3BPozImTWUuoula/K/N0Rpdq1QjRhEY9/9dXcZjZ1ZDl2/DQgxEX/9xek8TV
	 y7YuwuPLiBsfW5y2Rqj13mq8ptRL1Vs1pp4PZgz6QppmTJklrr53XRTwgu4nQ2cCVD9ew
	 pDObYO6L9TTIj63Tudvhih8+FqL9aEiAFmTC35j41+XQFaxxHyremuwTE47dT3U1Uyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3W0omNR;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F5606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC5F5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3W0omNR
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71ab5e64742so111213eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794517919; x=1795122719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw+u/f9GrnCWR6VUs3++RZAN52TxC2uVPXknWSBOLT8=;
        b=M3W0omNRHGTbz+A6sy4W4s2FN8ANNH6W/HkJcX8Jmcp4mXz3i3db04Rh5IzyxvmIH/
         29sN+n/uGI7+iZF6hxoR9/97f5a5zuhbhTSSMIRHvquO6nRD+UboUCqaBgyTnIc4dPzQ
         q4Bstw9i/TKMUTQaPmJbqK2MO5zfGHkxVSDdgjCavduFg3W0Ka0BnlrlTordrkmmrIRB
         wxs16YJwBUBJ5vPlwvD/asTNMCWNv84zXpOjzIXfjitiNxbKd7trC0pMwwayCXMC6laL
         OVkdv+h9rA5Ki4TQwf1cohY1XYUivG/yU7S6UtccK5UmDUNs8DeOJOwi2UU6oa2tjhMq
         4CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794517919; x=1795122719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sw+u/f9GrnCWR6VUs3++RZAN52TxC2uVPXknWSBOLT8=;
        b=cgs92xMn6K2PYV1WiyVp9PNRKAcSnso17lYgsdO0L3EiETu5s3Tgxb1210teHPaNiM
         ScG7UPVqhJUNigGYSPvrFuaZQuEZFo1xYE5r5TAitsS7cV24fmHaz/FBfA/d4WyQH4TS
         6EyoGHNsMVsqFcaNXlWFJxe9tNBVg4ajLG10L7FKJXXPfviUL8Asyi8g8gYopXO5ZHRd
         VwN6cLW24KnIk38jh0dWVOsIXssyuUXNt54RKtCIEB1tCI7+29rXwuFsb2GXJD09Rn/F
         z7CYAd59AGd5czvOjEOQuDno3cMUbMa63j1ixticd36L49sFboZ5iEZtjoiTakyFDCv+
         aZzA==
X-Forwarded-Encrypted: i=1; AL+hErHqONcvFtzs7RUpu1tSAn3NPOnt00j3tKGNKwY33TQrGYWlX9NqnbRoo0TVWQYvXAOYza+sTjjXsN+pKNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5c96HQUbSKGLVCjx7uch8AtLnqvBTef3kNcheYwoFCbFwrPia
	LSWgI9KDuPLNiRDYRp13zyBs2qfOwSB/rTsffgtsMScCClt6X38l3yVV/TiygEiD
X-Gm-Gg: AYBFou3JfoxeHG/gTW08eSjoTFwCFmFqtwV8sx1hVpvPwJD5DXoThnZVKSDcVNCJGlZ
	OjzTV0rHH0ZMDuv1gq8zJCOZsq/RMDz4b9N5n95psLSNSmRi6ewG6H/tV92EFr32iZFnk+iKkQm
	eUSUlmdGFweDAX97DG7Z6wT5AdGCOVTXXyr2m8Io150rsldCjQMh/c97YTySlNuMoPQB42thGFR
	RVRjqcn5cShHpv7LLJc7jEa2SakVDE6H26wr8LEcIPzwgEjjjZnsXqv+iyhs+QvqclwRiPgWy2Q
	O6FJTILQL02VXPbsUmYKltF568eedfGlvnwYkpK74hvzzom2fqlsVRoTU6IrGT/iT89ndgvFg7p
	SZBeTBkOQCy9jRFF4/HUFelr5e78m3ICl/Zk2ML1iVeNd7IK3WaujdmInYt+3mckYApw7s6+PRG
	wtyF0kNMIOxky/BdFQfYObrAl6g0Ln6o3gyrhZvcC6a7aEKkjn0wBLsXekNuKnuryNrNkzImssA
	w3wJXr0jDyCTfv0NPs2Gk8EtPTNXnpvGT9gCzh/BqbqXavo1wfv6ZkJ/DaNfl9EIce/IOXIncLO
	COvwd2UaXec0ykeibak5o0G4Jk9PjBCUKGcdJeIJE1BSjY9d0xfGizjO8b7cSP+J2GwNfhaFw88
	=
X-Received: by 2002:a05:6820:3383:20b0:703:8835:5fd5 with SMTP id 006d021491bc7-71ab4f55eb4mr186047eaf.25.1794517918643;
        Thu, 12 Nov 2026 13:11:58 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm364257eaf.0.2026.11.12.13.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:11:58 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
Date: Thu, 12 Nov 2026 15:11:38 -0600
Message-ID: <20261112211138.40217-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9d80c088-1a0e-48fc-9a24-09fa8c281cd7@oss.qualcomm.com>
References: <9d80c088-1a0e-48fc-9a24-09fa8c281cd7@oss.qualcomm.com>
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

On 11/12/2026 3:10 PM, Fenglin Wu wrote:
> Could you try this on your side? If it works there as well, I can
> discuss it with the firmware team and come up with a formal fix when
> pushing next patch.

Tried your diff (pmic_glink_gio_enable_alerts() not called) on the
HP OmniBook X 16 (Mahua). It works:

- UCSI is fine again: no PPM init timeout at boot, and plug/unplug on
  both USB-C ports creates/removes port*-partner as expected.
- Charging works on both ports, and a USB 3 stick enumerates at
  SuperSpeed on both ports.
- RTC via GIO reads correct UTC.

Please disregard the plug/unplug sound problem from my mail yesterday.
With the GIO modules loaded, qcom-battmgr-usb never gets a change
uevent, but the sound works anyway on both ports when the laptop
starts after a long power-off with the charger unplugged. So that
uevent is not what drives it. My guess is the earlier failures came
from leaving the charger plugged in, or from power-offs too short
(about 10 s to 40 s) to reset the charger state between test boots.

Jeff
