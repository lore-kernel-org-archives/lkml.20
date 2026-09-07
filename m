Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA184FDE51
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793283; cv=pass; b=GwaGR6x7S+lqemADRwtEQiuiYA5IfN4ho8nj8sg/akpjK7gU//OsBVEK6Qp5C17mmol6Bn2RVlpIOWOcJ21RBzF2mOr53XsPclssCYku8CisilcqTFWV8dwC38edxUzmCAUejET+p7AVaqeTuBLkgPZ8ySyY8e4aITpW/o1CLxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793283; c=relaxed/simple;
	bh=ejxJdwEwCnG7d1R5fYdD+26zyrLO/631voMN9v9G5lQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dfvoYsoWf681p1+uz21r73oxOF8zh5kPImW+tdKh17efcEfP9V9e/Pya2fWkMze0Uhzf0qKR3uIdHqw0MCNe72hmCdZKm3Kb/NenBgB8Pkp5YSacKqChFLd7pe5U4OwTBb0mGPMF27MQUuH5c4llf8ahFVPbcoXsYOaVpvgKnc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDQXF8Gn; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDQXF8Gn"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694a7so21358466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788793277; cv=none;
        d=google.com; s=arc-20260327;
        b=aG1JlIpBNvjCoyhy/oAbuPCZAd6ScNX3s7eLIySuBLKwy2bllVSxeGpP2Zi5xRl6VK
         jMySdmUmhN/JkgMWy92R3ZmZTsuL9FjXwRO73XwlmsbVxOjJcbeRhOuwrssL/xvuXi/n
         6tBh1F1R5S5bzHJf6Z7AdInVMeqsu18m4wO/NcW9OXAvicVXNQEYSGvvB64W1TH9K256
         /q1kHBoAw+LbsCPW9Dsct1NiTPGlGKq8Rjtlx0k3p8tlo1iKoRWRkmmIOEVTbua7qVvd
         mh/0ccfcSK3JIMTVjeW6mTxdbLFeQcMr2cExJwqK5guzEVmPbAhZFWNR5uZKVEZx3Fey
         b/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=C/5SbezyWi1anxyCL1WLStNOIqEcreSWVvPab6/As70=;
        fh=L1RhyMg3xZsxfh4Sk+ZTqolwz8un0VPEGyNIxsWcvRo=;
        b=MuYa15sxeGa1mviuDyf87vouMaiOhmjMToN71+BToyiywX80+8kSN0yq3Fb8fi6sSK
         deZAQg1EZC2PQd6Y//zykL3qSNmLxSvMZD2CvukLEZGrh+THPoBlXFQUKrTlRlrneTnM
         KoUK17i+TVp2Cy9a4qyc36KfgS5VIj3ydhG/nBA5NUVlufdbvkPrKc1U2F6ApcE3KDdv
         iMS2cTqCqes1/plHqklGJXqHj665zEEf6Qse0bx0L9Acb2xPm3PAcDXZZksNiL56TjsL
         Ege8iWvn25LG//chXrkmmbYy9SWSJQw4HPTDq/7OkO3fLEAx7bFMIM32n1kVdFWCbwyQ
         RMdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793277; x=1789398077; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/5SbezyWi1anxyCL1WLStNOIqEcreSWVvPab6/As70=;
        b=iDQXF8GnocdX2lRcVz9T6z6mCql/2j1XtEbNCKRzymVHKD+YmNGFsIVPVhRUkR34Oh
         /0aTAadNblZRc70Yekl9/v+YZROjMZeDZK1GZ6oE7uSWEcS+Qq2eA/Gx04zjlDa6AwOO
         cE9rlxSeU9lA3Sk0CmgW66W8pCvzPgq5GGt2uurFmAckQpeMKiNzDGkWJmKXOpRytaf6
         C1zsInaoTpKbcyA7jy+FINMhfggAULKi9Qu/PPdn78b5zLXl4Yb7dx3XOWpgurZ41gih
         bstbYVT8e5P7vpoNjOqJTZrkbmtuXn2is9ICyVYC6jn3IarqmUh/pMQ60aaqooNcelZr
         EX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793277; x=1789398077;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C/5SbezyWi1anxyCL1WLStNOIqEcreSWVvPab6/As70=;
        b=muMEumxHUIiMvKzzf5C9yYnhGokrbIhfSMx7smvf/7G97XPtpNsplp77zM1S0NuMbX
         D1Gv6cujXGst3R1V7uaT5+nwUFHqOB3VH3afFZmgQasrvUm2oM19rpucVWij8mhfMPt5
         v9+6eSGdmsdnqQy2p1KH27oJdi6p6ZsCEKWK4GTsm4uylGH+PIj6O1uKs7yViczNu7NM
         jZAVX+M+oz8LgCneBPDD2lIlO6NHvM48ajxxE/sOyu/3Ap71MowgRiBPQ0C8hcawLL9s
         IxMursutoeEAQ9D9e10dN2hepJNZR+z4SWOVUfFUVehas1jYKctCL3SOk3PMTzHitiGm
         nEmQ==
X-Gm-Message-State: AFuF++l6mzdl0pGUTL0+ebuJMy7vkD6/VYUy35feNBK26EqQXopHoEuy
	f9Y0l9Tun8kbJ69vCbEZsPJwV4UxtBr3zs3aHo0oCDJtWZpEfyMigxYkqLnjFvAkfCudv1OF03i
	6X5hiSjavgSCaNJtCqyvntZYRwGDOxGRU+pY=
X-Gm-Gg: AYBFou0BYnCLkF/NbJKhUUgVyFR1zj+WGiM5tfclhlkdk2dmt1R3ruLudie+5ppNi+2
	a/UbMLxVAvpwlVjxK86LIJB94hSpGSl9STU4l32Ft0Di7TVAiX74p/RsLEj+cyOxnTi9y6KK2hu
	Xfo0OMKKk59lv1rkqNjLlp+UzNVg+jPxKvE+yCHPg25WeJ951aUx2V9NwJoZlP0/PCeWl+1fwuX
	w+DTa3b47xQ70YJ+RhWUb35NMjicl6HLOn9F0hNFpWkzOjIItDVgYW4Lofz1pWkxd8zBam1gk8S
	eiDeOhsgO4r3J5T9DBfpJUK7uIevKNiXtHJVEbJ+dQnl4JId0ruiSJHqzRc0YoC7avQUnWpAeaQ
	jzg==
X-Received: by 2002:a17:906:c155:b0:c25:8b1e:3750 with SMTP id
 a640c23a62f3a-c29044392d5mr61538766b.12.1788793276384; Mon, 07 Sep 2026
 08:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Danilo Machado <danilomachado2002@gmail.com>
Date: Mon, 7 Sep 2026 12:01:04 -0300
X-Gm-Features: AcwNN1UiCuTQvo7sl7tJPmxlZo-IKKg34erNkbCORKYwkqa5XlsrWnMFLo27VyM
Message-ID: <CAJ9xWr+xGevB00DzELbFK+LLGTn7Oj_ZbJ7OBN05+kHe-D-vNQ@mail.gmail.com>
Subject: Re: [BUG REPORT] AMD Radeon R9 380 (Tonga) - HDMI no signal after
 suspend / regression tracking update
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org, 
	linux@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

#regzbot back in-progress
#regzbot monitor https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142389
#regzbot monitor https://gitlab.freedesktop.org/drm/amd/-/work_items/5123

Hi Thorsten, Alex, and Linux Kernel Maintainers,

I am writing to update the status of this regression after checking
the Regzbot tracking dashboard:
https://linux-regtracking.leemhuis.info/regzbot/regression/lore/CAOnW2VTGBP=MMWM=W41uPDLrzTVHM1sw8P1myvftnNk0vEMMFw@mail.gmail.com/

The dashboard currently lists this issue as "fizzled out / resolved:
inconclusive", but I want to clarify that this bug is ACTIVE,
UNRESOLVED, and actively tracked. The lack of recent email activity on
LKML was due to ongoing technical data collection on Launchpad and
GitLab while awaiting upstream feedback.

Current Status & Verification:

1. Launchpad Report (#2142389):
   - Status: Confirmed (assigned to maintainer Timo Aaltonen).
   - Heat/Users: 220 Bug Heat points with 44+ explicitly confirmed
affected users across various AMD architectures (Tonga R9 380, Polaris
RX 400/500, and recent Vega APUs).
   - Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142389

2. Freedesktop GitLab Issue (#5123):
   - Status: Open.
   - Link: https://gitlab.freedesktop.org/drm/amd/-/work_items/5123

3. Technical Summary:
   - I have executed 3 full git bisect routines on hardware
testbenches, isolating the regression behavior between kernel
transitions.
   - Recent user reports confirm the same black screen / no EDID
handshake failure upon resume and DPMS display wake-up across multiple
Linux distributions (Ubuntu, Fedora, Void Linux) and kernel versions
(up to kernel 7.0).

Please re-open and maintain active tracking for this regression on
Regzbot. I remain available to test candidate patches, kernel builds,
or debug flags on physical hardware.

Best regards,
Danilo Machado
