Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F9846D562
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189944; cv=pass; b=ArajvcrlK2+MiqtFZY3iRku6j5CC4Z4D72ufmhXukE3LUFlFRTajYD+KVR0QGaY7marHEZ6b8Eo5WqbSsfMW++hPk9toJOI0Iuy/yQzmjPfJWFDYH5pp5awCqma0eO2DEvBha/mqZaHJQ7RR1x0UcNk61RCLE5V4xYoQ1jat4HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189944; c=relaxed/simple;
	bh=5r5lIWIE05yql962Lu66IpUSpOLRAbYoczG3Qe81sGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prU4vagqwW9R2rj9qkv4mz7hXOOD9HRzwwhYwk0wvfuVaxsrXWz4WQ94DVFPNl+zaUCgPOQj4fGpfi11x0Q9A5XgbJC0qGRW3tCmEf+wJ/85nwMqYRLPWVYEiF+2T6yIdwFkbjJ8fVoWDC5nc+aAc84eHi+GVcDsDcnTwwJE/Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6osjXU+; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6osjXU+"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66f88b68518so114000d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788189942; cv=none;
        d=google.com; s=arc-20260327;
        b=rkB4sYCCxd3l7LcFzjm1iFW80P9jaBorTWZyztLw1SiKt6Dp+oiNErYBT7dX8vScYS
         c1KAoC1eCuNgiEleiBAYJWDGyysQ1IZuiFkFl5adqpmnUlAZjgtitwe5ap89pDyljvnf
         E9PnfJsz0H55OVRAQPb1w+HQ4W2kRfMqC+x+K2RpjJItVCTRI4kplsMZ4ya/MnTBK5w3
         7YBc6MxwHsOSr+gqPe7pgsWaCuy7wKU3iSYIcmq5lZW9gHNWS1aSssJk2GIslf040gNn
         sHneuJ0N+iwqZd9Exwg7o9wMCC8Uwgqg1cVHCt1SU7an5xXf/fnMdkgYGM6Vdv3rMes7
         C5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2lfcBfmQY62Vm348mWM4CEGfElAKI7bW/B4d2+TFnBY=;
        fh=48XoqTJ0AKcmbbal/DJO9YmF+AUJVX0DS5g2FrwGLHA=;
        b=bDWnPwe4gZ3jT6icm+4ClyiAppYH7VNs93zQclfC592V0C1EvTiz8Hz7M9GGv7a+Td
         KOqxrsID7hxPyKIfTIkEaRpYArRJawHtF1E6+YDTdnp83hkYp0BA28hJrDmED1XMkAUK
         V6VOsIX+k8w7M9Ch69DHr78DIy6r0VdfNJ8rjJgpn6oo46P55GDpT8RWilusMH8wWuan
         PzlJulFjixsPQF94meU3dasrpH60qUNEniUgdMzXPC434TLPselnDM9kmXj4cZGZtYA6
         njqYFikYhXEF8+bGdeYsLNVM8Ubo0IfagyxIMchZu1G1snDux77X/DcL2HE71AL8c2c6
         lH6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189942; x=1788794742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lfcBfmQY62Vm348mWM4CEGfElAKI7bW/B4d2+TFnBY=;
        b=Y6osjXU+kW6Jam4k1IzXYyj3nNibFhcTM+I5jK2qbm9mDMGLIx1hPxjDBoFcNCY3Ec
         DAii1KiqmZyrUsr9JN2gVDNeyqCrHhp7ppAXrD3VGfMSDGE+NlVW7hnC/HL2RdaEqmlB
         /CzW3lzSC43kheUmPJOK9NGmjyaziTpAJD/wtE2Yrtiqg3t6Dqj6DKoTcHpZ0inIA+C3
         mJLg0xbTa5j8x3pRPmt1tG70FqySbqsYXXiIHCn7XWhPArKfZ0/aVxMdNYqukd6XlHMS
         I5mSMCjOcM2g77EFw1hAE5CV8UUIBhzqXuWtKSnsNtvAGGm1FhjU2Spe/7fqtRiQV/tL
         J9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189942; x=1788794742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lfcBfmQY62Vm348mWM4CEGfElAKI7bW/B4d2+TFnBY=;
        b=e0NlQ93yH/j7e0iezmL2QHMv0nbDO0a1XpK4h9u36ZoMgONnowFohh/LiH4IlvwQKj
         c3Bwb/TvoYXUFEgROL/a6TefbtWXxvTDgqHaSKl55BYceGWpFaAf0DFllVCEboXOSZMR
         lYmTBH5ow/G2ZrNgzZQN4s1Qw4T64juQwZm3C+jiWLlSrWEewnyudPAF13qvxDttyTrc
         ceycxzha0p9TEjoYhsB98MZ+Blih8Nt+Yh80OlFTHarCEblGBvbXXtP6dIkJUmirpeQQ
         5jf7+AQCBH0G8+ddEDK2z6GHobjYy2OOHLWyafqpgzACjobL6CbQDG7F+CBejUbUP+Rd
         lW1g==
X-Forwarded-Encrypted: i=1; AKwUvBwcfQSLZH3O0kWOKxv6c3nxN/2+Jjb89KoB7E1V+0LWmUld+TT2+1VmCsOn+jKGqkw/1Dxcp1anJVVO21g=@vger.kernel.org
X-Gm-Message-State: AFuF++n9yOghAPFHt/1isP/DqwYk23N5wCMvKHM0S7V0H9XZ2CcnXmrM
	fiqH285oM7teij4FWlFcuWIeQGDt+Fmh9Qkblrb6NrY3Vk988UUh9/fABc15IZNKhxonL8eQyKs
	uDkBy0iqyfzZY/SSPw2UmraJ6GFr0jj8=
X-Gm-Gg: AYBFou1l9Sh+kMmDB/5KG3iOqszilJimJhHKejIyx4KFlKL1Yud2KdVdwkszljmpiU5
	RfiErCZYoEpp1OxggCDfrCB0sJM0WguEv4uNS26S18/I1maDm40S3QmjQhKxB+zCYW36i1C2d8j
	0R8C5S5B+D1OOxh0+q3hmjQMFHZThwOEZL1Otl5bnn0Kfzy4mRU3JNZ1RH+Drdxa+o/bmaj7VF2
	+W8DNTZam2bMR4R9Cyeu2yQCRVlRIh3IlKX1VdIvLgPmKdWZ4bA9bitYPIA37Xga6aG3tS1P/wh
	slgl/vb1FzS+uL/Gpe6vDzQmGCWEceaLOi19e7Etm9nn/x0l8aJ9Dvt7Y/JccRaKCEf1XloEIl+
	zkDKZEXv8
X-Received: by 2002:a05:690e:480d:b0:66d:132a:875f with SMTP id
 956f58d0204a3-66f87615f57mr469041d50.47.1788189942058; Mon, 31 Aug 2026
 08:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710022854.3739558-1-michael.bommarito@gmail.com>
 <20260710022854.3739558-3-michael.bommarito@gmail.com> <20260831134023.7784374a@pumpkin>
In-Reply-To: <20260831134023.7784374a@pumpkin>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Mon, 31 Aug 2026 11:25:29 -0400
X-Gm-Features: AcwNN1XCy_2Zo6asUAI6Mo_MrE5tR1bf4Mf0i1abV1r9A7R-zlEGvrG8uEVg748
Message-ID: <CAJJ9bXzmVKLQopUHTNh7-C4WggMcBJ3s9KShA05piwm9VTMTOg@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: hyperv: add KUnit coverage for device info bounds
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, kys@microsoft.com, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, linux-input@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:40=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:

> This has landed in rc1 and fails to build (with gcc 12.2) because the tes=
ts
> in fortify-string.h detect that is it writing beyond the end of the
> structure.
>  module_exit(mousevsc_exit);

I think Juergen and Jiri already found and fixed this, but it probably
needs to get bumped up to for-linus sooner.  Sorry again for missing
this on the original series.

Thanks,
Mike
