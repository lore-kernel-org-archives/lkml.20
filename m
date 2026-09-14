Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6127A916
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344050; cv=none; b=M4QI6PrLRN4to8HdfRTHS9z4ekue2/SbJdktaOW7yrWclw+jum4vzu9lNRz6jCi4cajtM48yQ7EFQnoDoDP7/fxrAyt4wEj6zc6CW94pEAIBZ4rIY/nwSuGwvjtsQeMLrss+87ExysPRzuuhJTErl5zNxAAQOpvyr66FCb/9bgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344050; c=relaxed/simple;
	bh=LOlm/F199Oz1jthnigxJQ/qoRWpSZhgpu4PEMQn4zG0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gPThirsZeJvhbT90lyOI1zluodnVGFo4HEIYOicl/uqItkjtYiEwVASIfGWsrMBtUqmqpAdVxY7hjpvZggBdjTJmocdIkUPflUYSKhSc4K49lI2SHfSMTDODujGLgXHkzY6lL3bcv+ZW4+V7GQkXiGu5wtiqRgz05dYqF0c2VxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7su7GFk; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7su7GFk"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso1042026a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789344048; x=1789948848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FGToR7Z/2uqTTL1DA1oZsKRTfaaI3ZcUANMjrmqmGEY=;
        b=h7su7GFkKUkP4+5cVW/SbVYUpwtm/mOlFzVDrhn+NMlYqvUstPrynn7M2Eqwpi2Wdf
         izwXrscpvv+LLCz7cp+i86zeV+O7UTMg+qsu6+Yhvwd4w+bsOFg3qp7TLiI9l8F+wfIo
         4U7+WorsAJqQ48J8rgIWdXypK82nGbbousavyzVt7hOHhAnMQca/tkEDPOhju8in9rBJ
         +fJaTL7cVLxRebt+Gl5gInNBYsCWi0rv421WufM5ho5LjAz1vjq0lo8Slw/nhV/cafoe
         EfpSW88WVi/xsTohEyxtt4JnLBiS2st3DBEv6FfRwTfQ894d8MXF8S7Zmme2HmR8eI6o
         vDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344048; x=1789948848;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGToR7Z/2uqTTL1DA1oZsKRTfaaI3ZcUANMjrmqmGEY=;
        b=SrNZTaqtYVT+k03oM/LLyOsAFGpiWoc+tRNPQJwLf8Q2ju9x3sFcCvOA5tj3EoPyCA
         znkNeH343FDMQlWOetlpZWof6cBJnzDP8p5+RJYMofW84GZu/gM3SjryOU04/FyUxX7L
         FiC1/RdCXKX14B2p15Z83cOyZCbMeE+WRqOh4La8DuHCNXxlBRY1loXBY091d+aEvog8
         sqSjkneEi/DjjhRXe0/J4UjTxCBsXIonq+H4w/n7G9UllGkIMR8onBKVusP9LBhgbPGb
         6E1i7O00R2smWwEFUHzBbUaeWvFqUDxCsj79XO9IS1n2/1N/E2/u+Qbph37/hJ7q8ri0
         pV5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1WdRUBsTCghHa8FGAbICRtKmLb0eAbRjXMljw1JTR2XfOGBrEtkM2MaL+aYVkmzgfifV3qhfDgq/jgfc=@vger.kernel.org
X-Gm-Message-State: AFuF++kcC6n2sUvI2f7sXFXO/Gxi24lBz4N2VASfBuZnrOTzJ0Odjmwo
	ceBt7ba4MFTI8d8vhauURhbeEL7joHlGBOfaYBjo0HRV3mXoMoTcekBDOjA3lQ==
X-Gm-Gg: AYBFou2GbLjSMDHd/gsQ+M8s5/HzO5bQEVNG742xLDbcT8LfN/0CpKj5Phk17upQo60
	gzGYzBFfOvELmLToo187INHBJM41B7zI0ofHNKQeRsf791VwWf8oRO3pt89QxNt9NjS6EnhOsOD
	eQ3dmWlody+x1Wg2kqq9ZjFr6TQCdT71Ksb9RMNh2WyUzcfxm2l7dGbatTIrdA3O7hmlufSzAhv
	3lFb40UHBdketpo8yg373evW/jPwH4252KkjqwJsuyfyIT3Q2kMyR7fkunhDLamZoFlf1jEkcbJ
	FGLQ7OCsidODEchWP01JzEcIijXwlOBgHpfLNILTSDoAVV2cpqgXxcPR1oOLrOY0qRKqr3x3IqH
	qD2CdeRKHUIH5B0ivNTitR5W+Sc7XXHoHG8ughlsE7QcaNnT2SY9qFzlgSR+bdM8SYsul8sS/1k
	lVgTrHCivwWx3V05AyP/Sc1iZrRQkNktEV9nZ76eYSl40ipxTD5ufJMPrsy4w+ac8SgjtJrQ+z4
	X9Z39S2Ct0FqfGQskUKMx+iadCV7phinMYzKvoAYifjOylSwL+jnbfuMbTuw0J6DS53Vw==
X-Received: by 2002:a05:6a20:3ca7:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3daed16281bmr30856238637.7.1789344047641;
        Sun, 13 Sep 2026 17:00:47 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm34029696c88.14.2026.09.13.17.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 17:00:46 -0700 (PDT)
Date: Sun, 13 Sep 2026 17:00:45 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
CC: Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: correct typos in hid-lenovo-go-s ABI doc.
User-Agent: Thunderbird for Android
In-Reply-To: <20260913231004.1007869-1-rdunlap@infradead.org>
References: <20260913231004.1007869-1-rdunlap@infradead.org>
Message-ID: <1E3E61A6-F084-43BA-B9B0-D5F21063133C@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 13, 2026 4:10:04 PM PDT, Randy Dunlap <rdunlap@infradead=2Eorg=
> wrote:
>Fix spellos/typos as reported by codespell:
>
>sysfs-driver-hid-lenovo-go-s:185: intertial =3D=3D> inertial
>sysfs-driver-hid-lenovo-go-s:185: measurment =3D=3D> measurement
>
>Fixes: 168c91839139 ("HID: Add documentation for Lenovo Legion Go drivers=
")
>Signed-off-by: Randy Dunlap <rdunlap@infradead=2Eorg>
>---
>Cc: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>Cc: Jiri Kosina <jkosina@suse=2Ecom>
>Cc: Benjamin Tissoires <bentiss@kernel=2Eorg>
>Cc: linux-input@vger=2Ekernel=2Eorg
>
> Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>--- linux-next-20260911=2Eorig/Documentation/ABI/testing/sysfs-driver-hid=
-lenovo-go-s
>+++ linux-next-20260911/Documentation/ABI/testing/sysfs-driver-hid-lenovo=
-go-s
>@@ -182,7 +182,7 @@ Description:	This displays the available
> What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>=2E<interface =
num>/<hid-bus>:<vendor-id>:<product-id>=2E<num>/imu/manufacturer
> Date:		April 2026
> Contact:	linux-input@vger=2Ekernel=2Eorg
>-Description:	This displays the manufacturer of the intertial measurment =
unit=2E
>+Description:	This displays the manufacturer of the inertial measurement =
unit=2E
>=20
> 		Values are Bosch or ST=2E
>=20
Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
