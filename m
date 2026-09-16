Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D224E4331
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602843; cv=pass; b=suGivNcfLXNvbDi3pHJcV2HLqVJndFZNdNqvV78zpZ4uH8xbmp3S4GNgHHZ1rO8OoMyFe4va0eZ8w1JVMNaJIJDt4+d/df27/myqPpDAjfrA53+ZeHulaN/iQnd1Tws2XgYEavOZpb2pY+SJc50SXNtXKh1unqA6YfFRLRE4Xzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602843; c=relaxed/simple;
	bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uk9RCQ6BJF0r5LV7Sgyecir6TLIuf4u+rrcALuhESA6mAVdNwIeqMCqlzO4S1UJXZnGCojHFYnUBbe2FTPOcTaWbDv+G0gBkcZ/8f7gdsnq2EcZJ+B4uuNpTL8Abdj8GNm3cXDZ1fS5nlJHinVeKnci1/K+lwbZVukOibf2XJXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArOkzrg8; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArOkzrg8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe60d5fso2823786d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602837; cv=none;
        d=google.com; s=arc-20260327;
        b=anJZBOniBD6zf/4etFhkFordUxyo89Twxdj+E59XHQBSOwk7RdMSUKvCT8UxXcwdBx
         ovTSXf/tj33H/+Pqr4+JbFmcpQKWDc3SprEuUhy/o3Rbjfv0kHLcdIYiexqLaEaMv/hF
         yCVpIdx2x46q5P03KItTBJ2Ag73470Kkjbv5h/j8klrvoPp9N4zqhz9nYwjdZGo/vnCl
         nFCBkZkmo6vGdYAqXornZIvRItfPNRD8wUyHahS5upbOmBj3qsn2zsBxsvnFueHZSDP/
         s0KHCAYASIaHOqqvAdwruzaEQ5xYvzlARUrXZnHuAZg0FzzEiDL4U990/kilBhhAADqw
         QBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        fh=fSyrPJ9S3JUmjFx0//7jC/sYFB+KPIjF1Og/awEeIAc=;
        b=o5Yg0+Pr4zx+AHTZyddFPNfOUPYBUZl+QCqX+kgJ0z05U+WVMCp/DYUGsp0u3Ln6Dq
         UYjw5iBrlOW0NTJ6mKYeyn+BpWXY1Lusu3Wk5L7ps/5tHP4EkDg2GWz+/U2pu8Iqz/uM
         jv1ywVOJscl34iQTVZIoGTcBe9Rwmk26BDAcW0Ziege9T9EAHRV4SCmgjULMxfAINIHW
         mRfWiAShgBXwXio3e6hbfrhdDG5OtMrUvgiP/6ubhsVOIk4FdOPUlgZqWcXFvWj/IDbd
         KPe6bltaSIFWALNQS+d27y2FuNOsvtj+KgEu38uLP3wYKBXyL+1FfC6yaqJrwMaaPOGr
         YqPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602837; x=1790207637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=ArOkzrg826arSO0VE1NlwbWu/vL5x0ReoqjRP8VxbLlXBDnsEsuU+pXazae/taCubh
         X5LqWj8yiH5a2WMQDp0lsLoarEtA1B50vqLDtT9LJ5D6RHafupLw6/8yEMNj1XD5B4Rw
         vXpGOsHrYHjj9zo0PGYT3hd2DcjLRnfCpWNzn5AYb2q+wdVKUaLnyNk+JTcgqb/tnQdH
         PgH8IqL5q8MXU8QJ8NJGK9bwSfaKLzLWUBLx/7UXOWiJpG/R8gPKUJGvXiTHIDSugIFT
         uvBHT6KqjBuqCp+qpri2oO5K+rmPhLLdhcMGcRGE2pj2aFwA7i8T/QBZj09J7bkjEEg+
         VRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602837; x=1790207637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=jnwbUs6dXa9nMKoK9PvMH9IQ4HqRLCRecUDAokItbWCAcdXPmtrxrUDVL4tsSju9+S
         KZDwKgF7RqZhN6madbYzSieFjtS2QdVSmUWM3qbBcN5in3fnneUfvpCJgcCtS7Cg/n8q
         A4K+s76ZuTRGOrYxlvcxc9HgHSCSPZjR712DMwDHeywie8+f3MzHvEkRI5fnyILg2hL5
         UccjkEYilPWure3ntfKQYBsKlrPdSQxca829V/yPKAKL4R9bzicTkQjJPy0ntmbgGU7f
         XDCWbNLO+9zI/xgetH8srApHrknuMKTx4B4OUQ3KjaOY7GQtNChs7stouhpX/UrXRC/i
         EK5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzY0NVV4+CLm8f2KEAENAc2QZfDiH6hgRxLbPe+K5VeOpb7AVq2ceujc4XkAAs7qYaRBiS5e7mbxTQdOXM=@vger.kernel.org
X-Gm-Message-State: AFuF++mf/7TdZYPeSssIcFh2zACccCDTSboAsxcc2WibcpBxiNTPBN0c
	1amG5s0QRoWBz67gu/YI+nauAJZSnSnBBRn+HngAyFsdX33m2Zm8047pzUiuQiOESngn4V3eTEf
	Nwwgm+Ve8fnXyRgrGDMVT8wdgN4Yb8jQ=
X-Gm-Gg: AYBFou04xtedCTrZFlSXvuImEOgrrZdCtVknwen6PqISXrkWlqIOchK62Tmdv3wQZoy
	mte6Xpce6N5Cv2Qqi7ANpiWwIeA8A6a8lQkBs1t06Bu5y/KYGFQCjLHK37O8LYLt6HP6eYs04Bq
	pUA1ZypMGo5JWh6MryUgsjgj/wA54XjzkZS7JlSb7ty+96es8oT/qSJhfJT4VYVx/C9BaJhUgN4
	oe0UoJ/JaM/j3ZiObRvOpTRTXjOzgF7JeY9Mf/O29pVE7rESV1YlaiqcBMbSIutioUI28pUkTc0
	RnAhEvzUJeKj7fCFKYX8FCROPmSXPsDkOeIwsoAAi2jjfIzrFWDybXXVt/JxwxvHnw==
X-Received: by 2002:a05:6214:cce:b0:910:94c6:2ea1 with SMTP id
 6a1803df08f44-9123d7318a0mr91642006d6.12.1789602836616; Wed, 16 Sep 2026
 16:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901083001.8044-1-ansuelsmth@gmail.com> <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
In-Reply-To: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 17 Sep 2026 01:53:44 +0200
X-Gm-Features: AcwNN1XEi8i0bR0p6V2XML1oNL1EMS0XGZ-YJo8qlzp3ByfRA3buomyIp2Ok6rc
Message-ID: <CA+_ehUw0KK8mHDmaH7UBKxq-By7CvXCaWDUg9NvoMPzSe5cgHw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 16 set 2026 alle ore 18:20 Maxime Chevallier
<maxime.chevallier@bootlin.com> ha scritto:
>
> Hi Christian,
>
> On 9/1/26 10:29, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
>
> I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
> series doesn't apply cleanly on net-next anymore :(
>

Hi Maxime,

yes the conflict was caused by LRO patch on the airoha ethernet driver.
I just sent v16 with the series rebased.

Also Andrew had something to say for the mvpp2 patch so maybe we
can discuss how to improve that.
