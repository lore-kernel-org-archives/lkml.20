Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434251;
	b=OfXEHwBRpiMCCyAvHuPXAO1grAY/q68qDk1EdVvUwYVTkqQx8sonLbvUpL7jwGzoCoxs
	 VMqYRMkz4c462ZCutMkQDv5qS5RsOweqUk4JsL3Sv1uDXJxPfLORfzNxsz2OcbRt1h0tD
	 7xCitCWlsdwT4p6eMvJ6Swxdhq+n+ZdIkjBBVHFYNokhKIU4hGAWtoHZpuUkYMaLHibkn
	 R+y5VWty4/jjaMY53t6+FaXOelXN4oQ/MSXSgKbJEXk16KRVCrz9bbam9as0o58ljQqZd
	 iBl6Cgmu3aIGT4ZjEYNIPFl7PrTJTC+OAtS9NzwsQPJAQlUoOoMnv89kn6DR8UvCEaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
	b=T4ylGaFYdaLrzBxb6CoQrZ+PYobWfsVAtYf1aiR0TyWNQXIgIiEckcNb+/H38ThcfADY
	 xbXzEm9H805Aecit7Bfmsg4CrncOke1atFfbDdyCqCJYR6TuhIZ7FBvQMc2f4bu5Y6Qps
	 6mf8jA/Smszh4b2JU8q0mlbhvVxJrulnBprKLyrZ5dJ62fkezbUdCU6+kLovsNrplMD/8
	 XiJSbyTtvgsl6ALH4y1lJ9NubKA3m62wfL2qGp4aI/AdwD6y6qlWp0KkbFYSdN3Yv/HqT
	 HnBhbfdU6S9eVR+eYjBp2e10pRDQ4bkC0yqKWF2PolmGVgsCyDTYDLret0Ls+PB6bBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpRqHE6w;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6B606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F6B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpRqHE6w
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso6201221eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434250; x=1795039050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
        b=dpRqHE6wmn5/kypQAavyk2ufy8OymjXbdHszRThOGjX0jhpHZE2qgnjwzT3Vy1/b41
         yQ4Gi3hSMKciusY7qlEJ5+14hX1uBKQfaMxw5cA9h2m6f2Am4HkhyTRKppbGkixO96I9
         4xshsjXZE3rQFOSViTCZVmT9vw1xcGdCrxvzRzieFMx4zhtiRLUIObcxOwBbp+LDcplg
         A6OM9KKLpskJGQyuytSPCIf/ZJCEx7YbYp9PX4Rpv6SrtWlfX1tPBRbZKQWvjwWIf2fz
         TQxHreUPkPkn9Z+C4+hQ+743rtYhXfedsICOSLIje0r6hLPhyzp3psTVzDLlw1t16rGn
         EHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434250; x=1795039050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ggCgsA+NJ3WO/E1t+Aq1JDPeicUUtkRHraZJ7K1wtc=;
        b=ICqXF08x+z6qLNUrXJ7UV/j7VwUK2EdsBQMtMywphKk87lcxJr8UXvVulaPmoK5uiq
         B1XaPO3vcBpMOcvF3A0L/6GwBZCBGrDtv+2HDQrJ9geOe094sdet4qFpzYHe4QCb00JF
         7zP6ki9LgZ3GpNxeJr5qprdcWE41Dp8fnTM5712cDgiTBKs0nvwpKoYvKmSw86e7PtOa
         cQ+NvjS0v3/ONX/0ROybTHMQs02ClH72XsxNkKq8mLUew0vRH13I+0dbzouDwzK7IOym
         DK5wpIUihmyPZHL07j7uQJsoPhM0EBbdEhs+1I5tSf9cHxWXidBdA+0GylnOjwM39Q8e
         6pjw==
X-Forwarded-Encrypted: i=1; AL+hErGKMmK8bi4/X0Tcoo4uwUehUX2iSNWuCdxS//CLuwtcmKlgxc9NXzYH2VoQMBGthXatMtoEyxPH6flwDM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GTsuk+1LdQT+iYO2yRcjrHFQksK070IigJXHsHmIhdlJtnktZ
	5jpIwrcVZQrl2UoKYcjZdrMT+WfoxYkoCwS6EL7Xzg1qGsj9byezY6ir
X-Gm-Gg: AYBFou3fFDwxePVtIhSng6Z4kYinDvGFtcwCbvwCPIyF59XMYsb7vnLLLUU6Dnvfff7
	9LinF/HkbS+hzPOP29yEdqJWgq5hyRJxsHEtFGf+qi8McvASKtRF3r87psVkbh7ElOQDNrbNaVT
	WmKQSj3bh9snvcVIK3uMUuqZoSdF+801L/wBSmO+17M0SkCTn5bxBQjqXJgxycDqIDYqDSuelCx
	Of0FMrMhsrQ08dJPsZ62i+0QRQrhSnMoEpk7mXQE42HYemh7LPX92AdBjM8u+h/fUX9hYT1GIhW
	mbaEDI4120Y55xIhhqEEXAHhLIpuMfspJM1qvoyhrPIULJlau7sofsSPXFhmZO4cxOP/UieoQTy
	OiJSB0v91XYCIoFsbK2R58i3kGqfQzzAynIzSQlhZYVdpIwA1q7IitJBle9yMMGj3K+yBKbWsBd
	Gs8QtILdDjKo6050qcOWzuG+ZWQYx2GzJHbveQUrS+0LZvoBoZ6673OCgFuF4NbHfvTZiVuxR47
	iGE/aMu1kZPqlLSWcPDfmRq5+S7Yn0q+QveWBP8axbJCOtOCnqg1g4q+lpTmw8kBCLhxgbfTudv
	I+bHRJ5O7aIud2Se1Eqs2oiYP+eln69fwa0jJ2hI9HUAj46i6oTNdoMAeEXX1xWDFJ2FtXLos70
	5d/UliD6Cer4BDK5RpQ==
X-Received: by 2002:a05:7300:2d2b:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3768579df8bmr5681391eec.11.1794434249909;
        Wed, 11 Nov 2026 13:57:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:eb83:637b:7b26:8dfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm17823523eec.3.2026.11.11.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:27 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Martin Diehl <m-diehl@gmx.de>,
	"Alfred E . Heggestad" <aeh@db.org>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Slawomir Stepien <sst@poczta.fm>,
	Jie Wang <jie.wang@intel.com>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	usbb2k-api-dev@nongnu.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: remove obsolete yealink USB phone driver
Date: Wed, 11 Nov 2026 13:57:21 -0800
Message-ID: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

This short series removes the obsolete yealink driver for the mid-2000s
Yealink USB-P1K (0x6993:0xb001) USB 1.1 Skype/VoIP telephone handset
and drops its module selection from ppc6xx_defconfig.

The hardware relied on dedicated userspace bridge utilities (such as
usbb2k-api / kb2kskype for the defunct legacy Skype desktop API, or
yeaphone for liblinphone) to drive its keypad, segmented LCD, and tones
through custom sysfs attributes. That userspace ecosystem has been
unmaintained for over 15 years, and the driver itself has seen no
functional updates, hardware testing, or new device IDs since 2008
while continuing to attract syzbot USB fuzzing reports and drive-by
cleanup patches.

Thanks.

Dmitry Torokhov (2):
  powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
  Input: yealink - remove driver

 Documentation/.renames.txt              |   1 -
 Documentation/input/devices/yealink.rst | 226 ------
 MAINTAINERS                             |   6 -
 arch/powerpc/configs/ppc6xx_defconfig   |   1 -
 drivers/hid/hid-ids.h                   |   3 -
 drivers/hid/hid-quirks.c                |   1 -
 drivers/input/misc/Kconfig              |  15 -
 drivers/input/misc/Makefile             |   1 -
 drivers/input/misc/yealink.c            | 950 ------------------------
 drivers/input/misc/yealink.h            | 206 -----
 10 files changed, 1410 deletions(-)
 delete mode 100644 Documentation/input/devices/yealink.rst
 delete mode 100644 drivers/input/misc/yealink.c
 delete mode 100644 drivers/input/misc/yealink.h

-- 
2.56.0.567.gdb80ae8cd5-goog

