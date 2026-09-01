Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEAA477981
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290390; cv=pass; b=DBXIS9rq+axvSbW80kn/A1ju4pynXfpnP/exjnu8ipYPO4zgKft58EthupCNH847q4EOAXmZ2E1Bonx7hftcPn80AKnwHHeLwfzEWKS95t3tKvODy2Sdt1w4R8ie5IrHdv1zMkfn3OOIrhA9vv4fBUp45kuUbdKBJ3iy0buKFT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290390; c=relaxed/simple;
	bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgTyxiStb0hn2QwHSo3WD54d8+7GHhae4kP8aCOIe4XK+MHkVbAq3TyJuaviFTYjGHwJ7AITugtW4pLd2knoUKn/R6R4KwFzosDxBHoxzHE+tJPGzXF7YnmX/L+xjTD/5wUMbh7V7Q77Uf/+TWo1PAkKxztjueZlcgRzrRezcuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE/L64JM; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE/L64JM"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7855bfd6ab6so127909137.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788290388; cv=none;
        d=google.com; s=arc-20260327;
        b=DOF94Ppna0fGcoc363CvLRqeMAjQmNaHHlazv75xnxo2T9bUb08pAe8/VTfeKQffbu
         5aCPAZpV5C5iJqhY9ELS9mlTadNO0X4CMT+i09x7KFToeecxddcA/7oFrWYt5EnfpDIN
         Py8kuVJrb/yxAzUTHkAWoSPPLwuH5Pl+TPtrbyjzsCt9q9YTVYFzGDfxWSRVRvB4DRRX
         PZQ94c7S/PQDDLnhZ+/dfCSzlvCsLsoONB5JVp3PYLvpoaI1GJo2rZqNwCfMsWHL6IWR
         PSdpecgX6j6iTdFO8mv5MMdC4x2tjc/DtAuCDUIqYJkGCjVwb42V4glLOe6zN209X0eI
         7lxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
        fh=w5KKZ51EKCdmdVM+XGot1FXtAuQdWdi+pp2nUu7h89k=;
        b=QOLDvWQyOPy0PRfKL4PQ8uvSjPlqE8+Rku+07JfPL5WFcNzNHD/WMYDFTIONHP2OGK
         oT423t16XWoAxknRu9MCtdtH+XNguLihwmK9QJdAX1hLI0ao2GUzdLCWwb5c3fjT6pA6
         oJbK4vmiwEPinXeqadarJbgmKYRDW5MKAhPkw+Ga2wHJQFOhh572N5vpWhr4GtLFyuqK
         DI+ROa9+KoU9YpYNeoUWXusbNlEuGcPIw78TGM9CBJcYtZMRHssL5s2n/sWWQ6UFIk0c
         dnCrVt/ZqViNv7ySZEiu11fQQs62Nws6u4RbD73Cz1krb6GNKLaxCiPzCuaZEWTBq55g
         o2sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290388; x=1788895188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
        b=KE/L64JMYW8qdYveadiAStk5did2TxAzFacqIinZC1vJbJ/Om66sG/K+SaFRkbVNXL
         NX6M249DtIJjag6rfArHwpA5TXgdF3AmQFac1WCjiz9iSDLo0Nh2I0+B34WNvMLnKQL/
         HlhX0EvCdAliYYp2Ykbbw1Nf7li9m1wyan07sFk7p7YMv8Dxu/JL+YBMgDnWxiybBS4Q
         m3feFQuDRnCFxXPLKL2PDUNXbEOsV2dQm1K3U+CvHED5vPDdnkvWyswQvdRWYFHtRI62
         LssFY43Qbqdbxq/VMlTRK9PiehJuRzidzUuBA6v9WRNpJIELzIG/ik68XAKR4MQw6PfZ
         hDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290388; x=1788895188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
        b=XLbYj7ufpaESsza9+Dy+UXlSBmKLs6tRlaJpb7hDSCT7srO/xJ1E3Ovb1mVaB/3HBr
         drrs1rMDEOtC4IpNbCgQyrB8CaFYIpXG9Z9WdT8SyBRF+aBLwyjhgrFmn6ndqiOb29yj
         hblcrXBmqUBPQlwKav/kxLAzqfNrcTxfPASrubkuo/E02G3DUrHXvovAOcqADQ0G8uxK
         LwERH9SCnYGBaKxpPnLMeTghCwQh+zvQB07r4n37yV4M2S5p3DXVWCmt+zEuYlyeNypT
         RG/Obr1OiUCJsx7CphLaNJy3PAfjxVr8Tap4qwJHkHwAnH0jjj1H4jsgiGG8IKWXoAw7
         3qSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2fUpyRuI0SlYuZbw+I57AgLijfFNrjnMnrzoOjBI/ZqO4AP8afvQ3kUKOr0jFR9wox5LEPzRN8q5ZH9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lyMkwHXHGRD2eH7BEFbkAkOC9gBGzy8kAhfX8tIrg/LdDc916a
	EqYMFh7cxsG6ZdCjU2dAWI9Tsv1sn9iL7EKUUyfhqeC8NJaQmL0IMV5pehAU+lULGTlaM3eNULL
	dB3J78iZL0YiPxPSUu7Fy4xHEB0QK5oM=
X-Gm-Gg: AYBFou3VfARPnxGSpAEmfigTbLcDcBa2geU2GXcMyWspVzZWL54sZUK4Cl/IfXn6dIT
	OnrnmMO+gOVsJOE5GjPGrI99UfvBydUJKamBWfZjn8C1gsu7ybxNx+RI8YLh2hI6c6G6VfMR7lt
	xklvkIWAIHpH3ppyP9tXSc7FPw9DC1Lpx1zvW3PTsJ7f5tK0joBWnP52/iiTzxPF6lz3k3JKshl
	CJ2yiwhyniXqlthcIN2ml77OOBjg9z8x8/EsOFS0AOIQ8SY3TWKn+vY9Fj1b6D1+jePbzIj10or
	bfQeuiWaUwHqB3g22OeMexLzAlohROwK4xQ2QU/6pyjkFhFTp6nIhv4loCPa9s5MbqhDckofnrv
	E8/O5NvK/hi8=
X-Received: by 2002:a05:6102:8090:b0:784:b9ec:910b with SMTP id
 ada2fe7eead31-78a1c856b5amr85437137.12.1788290387764; Tue, 01 Sep 2026
 12:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827175703.1549-1-orgads@gmail.com> <2026090139-shout-unscrew-0197@gregkh>
In-Reply-To: <2026090139-shout-unscrew-0197@gregkh>
From: Orgad Shaneh <orgads@gmail.com>
Date: Tue, 1 Sep 2026 22:19:35 +0300
X-Gm-Features: AcwNN1XyWSUHocmPj2MzGIz9O3V7vm4LgQI7ayfr9wFZoCCSHoE-NA8v0K5-Wdk
Message-ID: <CAGHpTBKDBsecVq3Tww7qSo+h9=MVxe-AFAMkUbowK8MbEpu1xg@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: octeon-hcd: fix the FIFO-flush timeout computation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> Should this series have an Assisted-by: tag?

Yes - my oversight, v2 will carry it on all three patches:

Assisted-by: Claude:claude-opus-5

I used Claude Code for the analysis, patches and commit texts. My
Signed-off-by stays as the DCO certification; I ran and reviewed it all on
hardware.

> How did you find and test it?

I'm updating the kernel on our Octeon boards from ancient 2.6 to 7.2, so I
walked into it. Bringing USB back up on an AudioCodes M800 (CN5020p1.1-300,
board type CN3010_EVB_HS5), modprobing octeon-hcd killed the board: watchdo=
g
reset, nothing printed. Serial capture caught a soft lockup in __delay() un=
der
cvmx_wait_tx_rx(), where the missing parens on octeon_get_clock_rate are ri=
ght
there in the deadline; git blame lands on 3e195a80e096, and the cast hides =
it
from the compiler.

The flush never finished on my board because the driver got the DTS default
12MHz crystal instead of the board's 24MHz external reference, so the PHY n=
ever
came up and the USBC registers read all-ones. That is a board/arch problem =
I'm
handling separately, but it made a reliable reproducer: with the clock wron=
g,
probe never returns and the board dies; with 1/3 it times out after 100us a=
nd
returns an error; with 2/3 it bails earlier at GHWCFG3 and says why. With t=
he
clock right, the root hub and on-board 4-port hub enumerate at high speed a=
nd
run without errors, so the timeout doesn't fire on healthy hardware - same
setup 3/3 was measured on (8200 -> 4 USB interrupts/s idle). Builds clean,
checkpatch is happy.

Untested: any part other than CN5020, and the HFNUM wrap path in 3/3 beyond
reasoning plus long idle runs with a hub attached.

- Orgad
