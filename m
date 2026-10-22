Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652979;
	b=Z3617dJDmjnq7msH6QCwp2IOGr4qZiB6vQC3g4WCDsI1M2IWUXtq1e+ecWFeoXmgYRxl
	 SOpl9UW5WkXVw+h0A3/r1Ubp8vB7wj1sJxAEMN/qDGDgdoy2LfPUtFEAMHRkh6GVQh1q/
	 NRQoqQOQW7S8fHRa6I0xVXeUcrs6XD5KRCnPB57I2LYLMlUczly7pXbBUVrTVBL4D1z2s
	 bxZG2JnhorliCPJFwsHI5QFAggXV3GjNCEM67ZKVUeG5Kr712ibW/UhkRWPAUxfAGTKsv
	 IFnq6OJUS849yQ5ENrId6tt8PX1py9TloSradKaluyiZB1mFEyf5uGp8h7crMo4rj4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y8vRmEfoyjBwhFBdczVPnT1IHPEuzg+vfDA5yLIzw3o=;
	b=hQd1slg9C+BIRqVSx/ToY+ZUtyRGgH1TSbL5byWlUNQbLXUT+3mqDCrKJwne8hdZbe5N
	 woDy4kKfUwrb0RAgbGSn9+/YB1HiR5Ivj2PkVIp2OANZ5jDndjy7xhUBi5cG6Sc8i5rmO
	 UFsD/NVubOj4ILEACs2+F1jPCLPBXk6syKV4yV/NHsjs+rvNXetTJKu1bPknbNcrSIt2l
	 c5l8CJrWKwZhVoViwH2IlIpnaDWLFMHX+aV/hieqUDqgSZhnavYe1UVcqyKClG401kPXz
	 /sYjYIhLZ2IeJtqm3RyuBIO1xZKKiERxSczL2kY0yZr6UDLHlE9JgxqaSv19DuQdCeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="NpeQI/zS";
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F36606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F36606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NpeQI/zS
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso291512a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652977; x=1793257777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8vRmEfoyjBwhFBdczVPnT1IHPEuzg+vfDA5yLIzw3o=;
        b=NpeQI/zSvEQxTUCHDlatv9wagKFyhbSq4iYaKIW5O5xnPR1b1UJnU2mVcSBRe/NycW
         USkvqDpY1Nr2gjg62c98xwoqTZxA2BgDDiHRX9I3lWk/7rtBKJThc4mLd9INLBQWvvVw
         yDF1CMrUm2PDdmhbK0usfcbOAaPfJ2/ICjM8Q0dPigwy5PRFAgnxiJyIbx/Zp/B+FPzm
         VF3d7gPwUZ2IJE1XmdAv9oRuFFHsJWDcKOIBPxO7gIwycmkIii8GcsErzdqCP8lbfItc
         pJcPIFIF3nKIL8hfzBqmSelulYlneGMOpOprXwsSOe7v32PJkPMxn4O/qsKAVx4SNkE6
         i35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652977; x=1793257777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8vRmEfoyjBwhFBdczVPnT1IHPEuzg+vfDA5yLIzw3o=;
        b=VK5TCdkWa9T7eXrKAfdSlnFORBa0VTsEJo2wrWhAj/+f2HvZXkfMxhdX8wzSRt5Cc4
         YNj0RgHNX7ggiGh6zdX96KQxN9wGrPufqg7inpETgswm3WBzFKNcMThu+/YZuWJOwFnI
         osJde9gjXNgnUTqO6LvTgHxU3v7DBSB5qe0fSJfwOBxKokk+iFNBS4yI4aCTAU4Io1Um
         u0S9SncpowBzmW3vR5UWhuimZIa5igFiX+vajTJsg3wS51XnII5VeSVlpvHeKlBiuuym
         8+ZXp2SWnuQFsfl1ryHUm1tdJiL+jxFvuv5Rm8nRAF6Km4IerBDxKrAgqUO1quukA6oF
         kI4A==
X-Forwarded-Encrypted: i=1; AKwUvByeKjCf5Gnh9jXCvo1fVJ82s5xdcv5p+yHlnI6fUh5IRXcTTuu6Z0FdU1HghCZAl7C9LNAj+CLPYzOB6cA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYpXYZC9Ee+Hx4vpq2MxyfEnmraPy6qyzy0+t3vLOepetai6PK
	BhXxwTmLyo9/zXMwi8j7xiyJO+6YNwY5Qb0ofo6i4xIZpq/3IXOVnX9j
X-Gm-Gg: AYBFou06C8IyAQHjpmb+5oIUTldgS2VwCIbbDUn/nWDa+o84oDl6fMZx/+LyE75OeYP
	iYUG5HUUBLFC2wlftNSr3xt1N8cwYp9VGrA32bVs9ogSUuJXcugZQDrnrDVJQbkPlAng5oNyNan
	KUIbYdpCzs8hVldNyt9vEwRyBKwCamr70rOeVFR/hDrdQPOGVxw5h0PM4nHQjJ4otknBLvtCRKt
	kSslMj1qBdnYSARANUK2qfnUqtCwqjloJ3kZuL4+XljP8f18OQwx+x2JSShPyX71HDzKflKwUlM
	ozDEIY/T4Hl7QT4TSJPh2Hd5/2uDKXnnAzN2IGxLDUFDOBkhDRnJUIh3RXhACYYO06jiIMpW7cO
	IzdCRu3vKIHaQASwz1GtaBKM5Fjb6ZtIaa45MK77EcSyUrhGEI4/dkZgiuItVrBBQDY6nda+DqE
	60h5H4Xmq9K5nwUctRNwC4d8S4JLTsZuzrPsoWKUlG8QL0+8xLvofSzfSE26pGCUG4kIRYbKVL0
	B/rxl62fe36CKRrCI/B5N3oj2gVSUoErDWg4l0Cv/gURSbMHCokBcB9FDD7+cyvgHvIM0eKiA==
X-Received: by 2002:a05:6a00:1883:b0:8a0:73d7:aa7f with SMTP id d2e1a72fcca58-8a089e90a35mr3761029b3a.41.1792652977248;
        Thu, 22 Oct 2026 00:09:37 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:09:36 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 0/6] USB: add usb_make_subpath() to replace strlcat() in input drivers
Date: Thu, 22 Oct 2026 15:09:23 +0800
Message-ID: <20261022070929.20820-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021123146.17202-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
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

Several USB input drivers build their physical device paths by calling
usb_make_path() and then appending "/input0" or "/input1" with strlcat().

In preparation for removing the deprecated strlcat() API [1], introduce
usb_make_subpath() and convert these callers to use it.

Patch 1 adds the helper in include/linux/usb.h. Patches 2-6 convert the
joystick, misc, mouse, tablet and touchscreen drivers, respectively.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

---
This is a resend of v2 to include the USB maintainers and mailing list
that I missed in the original posting.

Original v2:
https://lore.kernel.org/r/20261021123146.17202-1-shlomojune6@gmail.com/

No changes to the patches since v2

Changes in v2:
  - Add usb_make_subpath() as the first patch in the series.
  - Use the helper instead of open-coding strnlen() and strscpy() in
    each input driver.
  - Link to v1: https://lore.kernel.org/all/20261016170411.51025-1-shlomojune6@gmail.com/

---

Shihuang Liu (6):
  USB: add usb_make_subpath() for formatted device subpaths
  Input: joystick - use usb_make_subpath()
  Input: misc - use usb_make_subpath()
  Input: mouse - use usb_make_subpath()
  Input: tablet - use usb_make_subpath()
  Input: touchscreen - use usb_make_subpath()

 drivers/input/joystick/pxrc.c              |  3 +--
 drivers/input/joystick/xpad.c              |  3 +--
 drivers/input/misc/ati_remote2.c           |  3 +--
 drivers/input/misc/cm109.c                 |  3 +--
 drivers/input/misc/ims-pcu.c               |  6 ++---
 drivers/input/misc/keyspan_remote.c        |  3 +--
 drivers/input/misc/powermate.c             |  3 +--
 drivers/input/misc/yealink.c               |  3 +--
 drivers/input/mouse/appletouch.c           |  3 +--
 drivers/input/mouse/bcm5974.c              |  3 +--
 drivers/input/mouse/synaptics_usb.c        |  3 +--
 drivers/input/tablet/acecad.c              |  3 +--
 drivers/input/tablet/aiptek.c              |  6 ++---
 drivers/input/tablet/hanwang.c             |  3 +--
 drivers/input/tablet/kbtab.c               |  3 +--
 drivers/input/tablet/pegasus_notetaker.c   |  3 +--
 drivers/input/touchscreen/sur40.c          |  3 +--
 drivers/input/touchscreen/usbtouchscreen.c |  3 +--
 include/linux/usb.h                        | 29 ++++++++++++++++++++++
 19 files changed, 49 insertions(+), 40 deletions(-)

-- 
2.43.0
