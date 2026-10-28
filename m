Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231568;
	b=3Tk2rW3fdcHJNeCMxp3+zPAyXFwSc9DSuN0SlRkRWUAZ3ra3T2E8nrNbINwTExdvLAvm
	 qgjFPWu7ygduaspa2LL+Gmg6wJqE7tZbkiVFtxOraa32y7m8Nt27Qu+coZLq6U1twSCU8
	 SWhTvJvFe/t4yHD4mA52qcUtIz5szUDcG9FlDkMdv1PikYPL2zHXKsyMmiZcYIVO7VfdM
	 NekI8XKTk6pIljzul+7ZqsdsbS3eyi6jjeR+cgHd9/5H4kRYHdBK5V+mxuzGwTj98XHIy
	 JBIe/KnA6XSILNiREAmDkShZ4tu50MptK+xoD9Ssq8Fv7iSOTtOOGFGKnFICcVYlMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4WsOLd1UHsYxqktmaE+tPwAPjAowkbjm66X13t21J+o=;
	b=yKNREs9XRPWtdKd3Tn8HGYIyGneUZW/CKTtqOQEkZX18VKiq5dKtDMQTBLRvZgJDZ+VR
	 lD7lGHNi2QP11PWjCsMnyxYYmzyKpXT6BOeN1GhsU9ZnK2pPL11QFNR1secNey7Mh/zpI
	 g7IjrdlB61Aq21Iqpj4VxNjnrP4fBq7FxZWAQ2SqiP0ZVRNkPqrUDs6g8bMWZ0X1HIJv/
	 n4qC8u+2cKERRMOo7S8WkrIe5rrWILT+JI7NnidZFnmWZZn+HVTJMZj58Y3B5XdhldOr1
	 eiqgdqxhSl8GmG4Az1K3UyL9miibjVtNbvGg1IsKLOCPvbkqe6tevu/M0watD1Qi6Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sH8c0Noa;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A650A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A650A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sH8c0Noa
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so18760285e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793231566; x=1793836366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4WsOLd1UHsYxqktmaE+tPwAPjAowkbjm66X13t21J+o=;
        b=sH8c0Noat/9o4Ev/8DOjxktSSBQCeVVy5ugZdyB5DVeLVPmixq8K34WEg7N0QpLnzM
         HRkC77EUSg1uMsdS2sEYfZ+kDa85TNMCQGya4ylfzFBajPHhom9HBGZy37jNCur55usq
         E6q+z4pg8ed4FDN3HdtXH3lleZnsPmqrzrlvV/w7uli5R9vPuds105vQ8qWMs85TUmdW
         QtKPzLgEg/osd2kivNcnGjZBUcvupFLmb3zgpYNJ/GOJv5XrpzmO6Z/oN8EnrsJa/g2H
         hnxHXU3d3+QGLK+SBxwrdvCXBKx/ofMIuMeKx8zWEcOwTO2ToAZMENnl4I21xuBb0P8A
         SaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231566; x=1793836366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4WsOLd1UHsYxqktmaE+tPwAPjAowkbjm66X13t21J+o=;
        b=lbh8dQOwCb6jTLpRKy9pB29+33rvVZcOIJ1JdpmDXpC4BI5JMB34colFXpMmFNZnZd
         myaCxlQwLxtRhk7/qV7O29ZhXv+MRy3yuGVuKwFkZXgpLNte7NvTh0e7jMjedGFh/6n+
         J/a6lsCZy8QWfdRLzTcmprGN+wp0T4P/OhyMl5ibPnreywjkcp4ks3w7+xWvo+Uj7L7P
         gqDzag1fzIx8sQZYQn6tJnV2q2eCO3tixbCsPuzwH3/cGv/L5eFhalifMNcK7yPIC3Vq
         vTsKsYEpavt56B37++85njsW4d+wg4JgDRjOHBTzOHidfJR8hGbNKs5//7uvM0DYRH+v
         M7Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzhRSIX2HNOS7lEsWAvvQ/h0HmX8sIN8Fh6jajYRMWeUSgo83vQ8dMuMTM1pIWDmQw7txie0UEFdxRDtOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8d+5JW+2cBz2I8DdyR/nWctI3ZALCBplKIs5xXFBsRJW8E0MV
	GsZVOanL2Gcyqn1RrkCBUwIUYShCOD2Kbx1x0jaTgQklKViUEumqnCe0
X-Gm-Gg: AYBFou3n342nsUcbeatsicW/XbAq0n7VAgGizZJq1uIKGloCi1PgwS1xUhjWjyuf9a6
	YIvz9Iv0bPD48cVJrevQ7FTF/+AQqSgmMnh+4h38MS01juaW3F/nEklPLqIXWE+9NvRVlMJY/vz
	U45dKwmjyj5SuaxY4iD3PUtOyLYVWKg8NEZm989CZtHVY3MA0WwlCzEPv20ItARVNbFlLqF2s0g
	F40VVULiRSUOuMVQi2u65iIsww0A5TUwhQrhOzU61nlg7OR5Q1gCjKOcAif58ceisi8OikjH2wY
	pfBHZNC6KFCYGJ7RsCcajH3cnOs40NCPOUHEBveOO0D39E1JbkTqx1PXrrAYokLil2ieQLd6Hkx
	QQaInYWX4vchPorHjnRx2QzpFXCFHuXLRnxBH+Sb3/ZjTEv3xhbGaBWlt+RKH1cpqaNjGhQSWIs
	OTDYXMgT/N2IROH4uEnKqUOhWLGGvPFl9gUnAVrDBhadGxH4NPPjmUevjVch7dv52RL9BdBMV/j
	6Ef/tQfPWDRqr+RVvGuXF+a28aU5EFhSRFdn7FZMuabFHj5bCel/Yp6YCqeuLx9eu7ZEom/XNCM
	8iORab16jeIjXV5JFsI/DKPN1AA=
X-Received: by 2002:a05:600c:8b77:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4a966c3ff3amr75213645e9.23.1793231566086;
        Wed, 28 Oct 2026 16:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm23669055e9.4.2026.10.28.16.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:52:45 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v4 0/2] platform/x86: asus-wmi: TUF keyboard RGB readback
Date: Thu, 29 Oct 2026 02:48:50 +0300
Message-Id: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBAGX8X0bMluKS315HsYDwUK1PBjWmg0h
 HeXYmK8aPY0yTezC/HGWePJ6bAQZ4L1dhw24McDKVs9NIbaamPCgAkEpqj2s6fTXFPXFDRwCkJ
 XKtUCBBRks+7O1PaxFy/XN/u5uJlyipm4aK2fRvfcXwaMu70OimUMQHKeIFMSOUVaaDfNujPh3
 PTadkk59iRGA/vWBEAmWJagxEzAPy39aAj7CcAkz3MJ6pe2rusLiGY/XSUBAAA=
X-Change-ID: 20261029-asus-tuf-rgb-v4-06ad93a6060b
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

Patches 1-3 of v3 are in review-ilpo-next already, so this reroll
carries only the remaining two patches, rebased on top of it.

DSTS device 0x0010005B evaluates the DSDT method EC0.KBLS(), which
snapshots the EC's host-visible keyboard state into a 16-byte buffer:
lighting mode, red, green and blue levels, animation speed, and the
four power flags.  kbd_rgb_mode and kbd_rgb_state become readable and
report the write format with n/a in the command position, because the
command word belongs to the write verb and has no state equivalent.

Changes in v4:
- report n/a in the command position on read instead of a synthetic 1,
  as discussed in the v2 thread: the command word belongs to the write
  verb, so there is no state to report there
- ABI documentation: describe the n/a command word, state the mode
  clamping exactly (mode 9 and modes 12 and above are sent as 10), and
  note that reads fail with -ENODEV on hardware without readback
  support

Provenance: the KBLS buffer layout and the speed-code semantics were
recovered by static analysis of the EC firmware (ITE IT5570VG), with
the help of an LLM-driven toolchain.  Tested on a TUF Gaming A15
(FA507NV): the v2 readback on kernel 7.2.6, and the S5 behaviour of
the shutdown flag by A/B testing both values.

v3: https://lore.kernel.org/all/20261010101601.888709-1-bartualev@gmail.com/
v2: https://lore.kernel.org/all/20260926005625.171560-1-bartualev@gmail.com/
v1: https://lore.kernel.org/all/20260925200744.129714-1-bartualev@gmail.com/

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Bartu Alev (2):
      platform/x86: asus-wmi: add TUF keyboard RGB readback support
      Documentation/ABI: asus-wmi: document TUF keyboard RGB attributes

 Documentation/ABI/testing/sysfs-platform-asus-wmi | 46 +++++++++++++
 drivers/platform/x86/asus-wmi.c                   | 83 ++++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h        |  3 +
 3 files changed, 130 insertions(+), 2 deletions(-)
---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261029-asus-tuf-rgb-v4-06ad93a6060b

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

