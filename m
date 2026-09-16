Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44533A83AC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545274; cv=pass; b=pQpLdsthA+GsrR9rOOn2eIKUcBMDvVjIB3xhfatNWTWr63TsZ3zFCv6VTp69C8SUlLSN91iCbf20LodX4i1ERb33wE8psi4mLhny1QUAXwCB0DztFzZ+4/Sj/U0qTR4waS7U+l+CH8PCnwmQzsw1EX1DP4HmErS3VbT0u6Ni9AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545274; c=relaxed/simple;
	bh=HSQtSh/WBX64Az3Kdhpb9LI5nsWLBxof4MszIZvqUt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwvqFNsmhfdxZeNfmGaUkDbdAm02sktcIxB3n9pD+69bMsS3owQq/Co61WvnQO9rKWwafEDTC8GrEH+qKxqqDe3VTrNYyaQ/nQCxc+cf4caDo2A7yPATLRRE2rn8FwbkcNNYJB92+zcq4Hkpba9o6BXVbeERgzBFLT5xGU497tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKzCRijK; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKzCRijK"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91064d2d54fso5465696d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789545258; cv=none;
        d=google.com; s=arc-20260327;
        b=LMMqA839wY+aMBTUGTlgwfCxXKBXTCZQQdtvZem0zAF5xefoDjLSm/y4AZWlAJnJWO
         duJ2e4qjX0n9/kKofVb/Ku4My3c6IgnRsdghk8iXQ6nYQi78PGa0IMs2eumLUZSHEW3m
         3bslphWXg66xTEa93VLFRENJs5S5Cgy4/sPQ5eF99A/Bu1HNfsBiNwsjtQq/nzw+Dd6k
         49cKyU7+28Na1WAseXkFCGulIvA/3VmhVZe+/J1M0UIUNM/Rw22alTBGqQ5knwizh+YJ
         qzljfEQQyfprwCfZM1uIgKl9tbAZcmXiSOBh2fNPSfftsv69Qzy+2WfXpHAaFps9NVAY
         igNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HSQtSh/WBX64Az3Kdhpb9LI5nsWLBxof4MszIZvqUt8=;
        fh=3Vw8a0D5QKImUjjWj5qbpsbqdSxwacahum8MiHmf+Jk=;
        b=tBWuOk4UVYAqWSVSuIJrgrhCmQwJBudPUlHHqURk6R4k+gXpQ3znlmb7Mb6fzvA9lF
         eGmtrE6nDNkECF1WK1FqdfboCGg/luaO54B68yRaaB9hmHPZZRFeDwY1WxRq5lSwgm4M
         GGCQbDzKh0aX1A0P0aWt+b2QLXwO7MggT4hrA5uANhgnlV6ZlcWhevhwk3HWq7rg9ZpR
         F6q5yWXng0roTNsjF0/xdtYizCYJ2HlTmCaRW5+QobI81Oh27MCZfwOQBCzrXU3oc5yc
         wkw2XjeyQtyfFBqejpjyT1gnPbbPxIQiPYnfII28yHy89EPGcNnGajxUv7mr1AM7C2Sh
         AXag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789545258; x=1790150058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSQtSh/WBX64Az3Kdhpb9LI5nsWLBxof4MszIZvqUt8=;
        b=eKzCRijKfmCHHZiKgh/sX/8aL3JWce9ZwEhI1ahFWN74uSpobeK3CHkb//mMQsWBMx
         zONX8u0DzKP3QMyJYXTV+ILQQW3WJFSLa6YbCShbeyowLKjQQ8vdbObij+zS9frIqiCr
         Z+XW/PXrhhV1MDXTiJQcrHcWgG6K3VkGXWvOq5pr2DcRus3nC4gUE2mMD1JRxNe4Mxm4
         DpeYaiyMyOclQaD9+BXd6QYkEIa95hjzUQwLaqXsIQZP06pGqBlreuUBpl1vkfVZ9wbh
         buf2q7MQLT9AwL+vk/X5SSQsXbQrQw1NZQaANtwn959MBQgfhoApAV+kV0q5Bgx3ELZP
         eliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545258; x=1790150058;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HSQtSh/WBX64Az3Kdhpb9LI5nsWLBxof4MszIZvqUt8=;
        b=LFJdE5gUrxskTtf/5tmFRh33Ybyx70Qp0F38Ok8sS3h3u9IEretQ7XWx22osNyiE4o
         4pHtZcbO37TJGZP8gx7OHhSM9VLxsFz5QagrxRSRD7DCmiPOatO8+Dfc/+CJKBsJdIPF
         x/Uic7Pjb86+eedhIYvqnruIV21x5ZEaJU3PVAdroiyOJfPN1WIXZr/XoMzusIshdKr+
         z0Cl9BG6IkZtiyk4dcP/w1ecvYStZxy5sjkLEKPQjkwUqKn3nOIgEEZnoRNbtL+8cK+g
         r0zYyQOY3U78UmXTyixMO2eVR4679HJNqPwaP5Ovcnt4j2Mofel2WvxrdVfBeSciHMLd
         lbMA==
X-Forwarded-Encrypted: i=1; AKwUvByB71UoXUDITtLrvXMFpfQcVwydc4EpFdRcFAXInxebKb9IPtkwtjHbW2ZJJCSjndOZC+m1gQlQ3FlFk7M=@vger.kernel.org
X-Gm-Message-State: AFuF++mttJFHlzX9Ff8kJocrRAbXlJoVXlFFofwpq+yXFGKcAWX2lhIy
	vSwlgvuxsdTYrg9Z/E6fEQqnjpk+00r5PjyiRC/NBXEXhRS/L6yCWtGuJF4o2ggjRstbEz7qYu9
	DBtNujahMpta1fUi5mVoz0WBDmnTl+i0=
X-Gm-Gg: AYBFou3k3cRTIG3qNSoD6pu/eUPUI24TEPq1mmbIytq+s6MFE/ST+yxgwSUIc/Gz4X1
	jO2pKVEfEcTyO/TZoIlZJ0Xb7WB+AhpQ7+hhbGEz0P4KEs9dIieX1atiCuQITfU057M0YbRN1AQ
	rJ+cS2M6ObJkzqcu/QtsofBOdLwKSRpPVX6BrfVJfqXTedLw3uwX2c2Up5rBDHwYCExHHE7jitq
	/99fJE/tWnbmBeVu+zsQmIDRCs52r0gyzGS6KGJlCdtDMcbyBIu4UUPCz08xFo+wCrnZdC5+3pq
	zSwBTEv6f3eCKTbIN/MSLuxs8XITpDA559xshlGW7Dmwneoq7gH2YL/IeyC4TKH7i4p0qnGORm/
	Cy2psLtcI9RchqcN5Z5yCbGqIXfvjtZxBuGdsejV/BHN0/OVjuTgJ9sF7xirKyeVB7uxyZCqCS5
	ZmRIl5R8Dgn6Ml3fEd8uXwi39pge+a+OO4J2PPH9KHDuSvUuXQgA==
X-Received: by 2002:a05:6214:590e:b0:910:3f0c:b9e5 with SMTP id
 6a1803df08f44-9123d7078aamr38407266d6.6.1789545258042; Wed, 16 Sep 2026
 00:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909074556.55709-1-luka.gejak@linux.dev> <20260909074556.55709-2-luka.gejak@linux.dev>
 <15af360d-5098-440d-a0a9-3d20ec43dc7f@RTKEXHMBS04.realtek.com.tw>
In-Reply-To: <15af360d-5098-440d-a0a9-3d20ec43dc7f@RTKEXHMBS04.realtek.com.tw>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 16 Sep 2026 08:54:05 +0100
X-Gm-Features: AcwNN1UgIQjFhrklRnP6j976pqqgi-Ol2d4fYUf19XemVpuj7kl9cWCwgLI2DiU
Message-ID: <CALeDE9MeWQGagFPy3TMA5WNRtw6-tRT5VS_uK8Kq5ZtKNd0xeQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/7] wifi: rtw88: add the RTL8723B chip type and SDIO helper
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: luka.gejak@linux.dev, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 05:02, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> luka.gejak@linux.dev wrote:
>
> > From: Luka Gejak <luka.gejak@linux.dev>
> >
> > The RTL8723B is a 802.11n combo chip whose SDIO variant, RTL8723BS, runs
> > a Realtek vendor firmware that differs from the firmware used by the
> > other rtw88 8723 family devices. Supporting it needs a number of small
> > adjustments spread across the shared core, all of which have to be
> > restricted to this one chip and bus combination.
> >
> > Add the chip type and a helper that tests for it, so the changes that
> > follow can be gated without repeating the chip and bus comparison.
> >
> > Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> > Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Apologies for the late reply but if it's useful:
Tested-by: Peter Robinson <pbrobinson@gmail.com> # Pine64+ and Pine64-LTS

> 7 patch(es) applied to rtw-next branch of rtw.git, thanks.
>
> 673662a0411e wifi: rtw88: add the RTL8723B chip type and SDIO helper
> 5f92fb993456 wifi: rtw88: rx: mark zero length packets on RTL8723BS
> 4d688f22ebbf wifi: rtw88: tx: extend the TX report purge timeout to RTL8723BS
> b81ead28aeb1 wifi: rtw88: sdio: zero the padding added to a TX transfer
> 5a95bd460175 wifi: rtw88: sdio: track free TX pages and OQT credits for RTL8723BS
> 8c17eb82a0fb wifi: rtw88: sdio: set up RX aggregation and interrupts for RTL8723BS
> 28eaf7971a20 wifi: rtw88: sdio: add TX back-pressure and retry on page starvation
>
> ---
> https://github.com/pkshih/rtw.git
>
