Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710792;
	b=u9Tw0htyZSf9muHCvwFSqDGdn5mefbGuek07a/cHJz6YQNEkU0xkNSYzREpUu3lQvd1o
	 dLvhSlnLVfkRsIUTFoS2q9ap/JFHeV/xx2kaU23QGZRBiuO22ENwcMqp2AP/b288XVl2w
	 RJ1bN6gFQLNAK6o4QXWPoCyCOzCo10f1/viJndl5IkyXCygPOoYE078i3ORLpxhZ1QGfz
	 7n8Z56TD97iYjr8lQ7mSF0Nefs9NQ9FIqeIPENOiZ82yCIoWn11Bxz0icjKmdlMOb1aJI
	 K5TlAYRknWLXF0dAHHoxVOMjcBtEAnzvJTLnUfM1dZgyhKvCqrE6z5iVcqe713cBSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
	b=1KSN7RQgz7UA5JV1R8giRHVCE1pEx0hw8lo9jReHnkFdHdffV8BChAek6zTgiW9ceT0u
	 lsjJPSrE6Fmdo6+dRTqyiyn5KRLJ1L/gsOcemJJRLG8wQidxhiOV2cN4NiW3Kj4JmZd3k
	 lCVeeTe5ZwkqaB1B4KcokjUZm3bg3qBL/zNX464OBGRa++LmJaogwkfsSPn1wMDBltH+c
	 pj8HkM9g7peCbUzaYiu5KYupTJLw2POsdtbARpLa2iweQw0W83BjqVSuw7I5243MtOVhk
	 1truCAk1fCE1rHJ71rmLc37njB1CH8ChsjdWH6uhxeMNWSEqN4eZ0A2+nLL5D+k+R8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNQ86Ghs;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A505606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A505606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNQ86Ghs
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677bc4704cbso3539176d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710790; x=1794315590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=lNQ86GhshBJaI+ue0tJpUXRW+nxMg5T6+SuJWceb7EdYMYmexzQON2X0hDizsNNjQj
         HaJKuZVMsMFRZ3rHMQ8gvUNNGC8M23Adoz3UBRl5KNFnKQm/OmD2RJNvSbwy4aJucVjK
         w9oOThxPsOpLqDOdilOJWYQvTr2XQrXxrbA6G6TViu2NB9eqdGLY9MY+PwImL/TFa2XL
         VXgxqq05oM2R0LTVnoW6dxhFj4fiC9dKL/ZYUNwEHAU+G3cBzVhyohbfJ6xQtekJKLuh
         uCVSyhpQrONcF58PKptppwCwZUDWfykZ27d+WfE8lebavEeWPa+DsV6VTGhDjR0DrSaI
         LN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710790; x=1794315590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rehtB/RJWCoBYXPyJu0f7lT3D0OaoNNCjHdpBYFEC34=;
        b=q3SCx19K1M+rBYSvY8/UR1gV/sFW+M0d0MXu1QjMFalrNeHl+DWJI2CaEUyCiQMvwk
         NufPuX1yirVkdrbJM/WVQUV9SgiQss7kQkeZxnx8No57LIH79ZGWW3orgdUCOoSGUsjK
         5UI1KvHoe+SUu01ytiYVrBIwvtPXa7HgN8RpYl1iGGljOHJ+jpGvKIwKh9KVR0QOIFHS
         KBR/FG7lJenmZBzlwHzdXzy9+YPrlHhnn3LEq637gJgRerXiFfAorJPxTCFZEvl2Q0ml
         Eto/HvQKh/jW4S6KQ75rdC70Ju9NRHtw90mRljTeeqnvJTbzzIqsbL2Bf/GINZHggP6E
         YfsA==
X-Forwarded-Encrypted: i=1; AKwUvBxDIn0bpzlSXFeKuri+ejG2rzDyYI+oG9rICDfXdTzFJz3VgH/drXlJKQDMgXDIRIgpa17SlA2YTIYjff4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8szmcIfDCLRohORB6vrBkddleLrDa6rYd8sZahNTA2xO7OsoSr
	UPgJ5MpysGHQnjQ2WtlvFGc8XL8NL09CnqjTCzrPRP1SbRDG8ZgscEor
X-Gm-Gg: AYBFou2DUq5HAePE2d0Zz/O7EKpFw07FhtLxuTxwWva5uWUoyOhvtA/EE321rP3+RFs
	fr3V0P4juNATPjq1RgpNpc7dcXuckA0aPu/zKW7X9Xvo3rty85QR3qu+06rB5liQ0Vf1GK+6fwP
	QaF9csQrKlPMNslZb5eLL53KwofT/HYK0zXhGFwo2041Gd7awpCZS8lOVW0b6gHAN9PPMKY+dOy
	K+JMSIAV+Mi+916xn2JdQWabxfR99Hhix1oU6T5pCzrzb43GD6FH0X3V7EKivuBSb0qxc/JEhJt
	lR/0QM5YCHaW8CkGLKsgj08Yp8Yom6P0d0JARbU+/0iaecvg5x430Leh2VrG+5Z6Oi5v41I0m0V
	UXNVcNlklPWb6oHY6l/JvrVrJmKYuFHKACRFi8yhlzvnUNaXD90QSly6ohDm8ZDYo2mh3ql/rXN
	xs0mazzRhWcq/wdEAFa3xY6j/Vyr5Tq2CykPEHKFKZfCAA6xoY5TGUM0mCVbb5jsz3O0bi/XiiL
	vV2MJbCNRjLg5wNcCkeRpzHk7QhHbolF3wsseVDTbbm+UgLWUP9A99o7il4t+2Ogddilk8Qfu7w
	AgmJNMX2G2Hyl8VzGw0HStUzn65mcRKOlsQiIgKDaVafbMcB3dHBVeT4BHrStDb59Ds14G5g90V
	nihTEU1pBkTSD/crfu5KF5M+UxSaN9KaLEXM/
X-Received: by 2002:a05:690e:d8a:b0:679:9b4c:5b95 with SMTP id 956f58d0204a3-67ba5049d99mr6926082d50.97.1793710790484;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b6d3ba5bsm70882847b3.0.2026.11.03.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:59:49 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Tue,  3 Nov 2026 09:59:36 -0300
Message-ID: <20261103125936.156701-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
References: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Enzo,

I tested your patch on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), running
Linux 7.3-rc6 with our local A733 patch stack and SPL/TF-A/U-Boot,
without the vendor boot0. It's not your exact base, and a733.c applied
with a context adjustment (same change).

On 10/30/26 22:26, Enzo Adriano wrote:
> This preserves firmware voltage modes when explicit bank supplies are
> requested.

Three warm boots with your patch and one with our local A733 pinctrl
patches as control. In all four the main PIO and R-PIO voltage mode
registers were the same from U-Boot through Linux, also after the
unused regulator cleanup. SD card reads and USB1 Wi-Fi (with R-PIO
GPIOs) worked, and the R-I2C0 bus is there. The control produced the
same results, so this validates no regression on my setup rather than
demonstrating a before/after fix.

One detail: our DT had no vcc-pl-supply and vcc-pm-supply, so the dummy
regulator reports 0 V and the R-PIO path isn't exercised at all. I
added both (3.3 V) to the DT in memory for the test. PF already had its
supply.

I did not test cold boot, 1.8 V switching or A523.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z

Thanks,
Vinicius
