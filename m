Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495933FE09
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791707173; cv=pass; b=fPzqoFbPsp15GhDHEWjfkdVwC88uqm9L4MXqqkNLSvm6IgK0PTE6J47gcMfWlWunoXuKY1nGxDTC+wS2pYKrl0H0/CL+MknqkAxlLmqDjcmeSGsbhvxzMbGDRb6iuuVg7CGxOjo0AWG7GnIBjKGLuwcCj1N7cNL9ditaPFNhljQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791707173; c=relaxed/simple;
	bh=Gzi3XBZDRoRSqdqcBjs7mFyCYLhCofPl4EqjLrNpO6M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=X71xggfdbJBYTQpi6rNXScbyuf069O242lw7qgcArzZbT2El67VjZXE27+mmXxRiZ89oTFHsi2cnwy1gI3YikRg31xjWoIBldSZ8VN1rf2FE/aM96TuYltVMo3cDo/JVwyq438rttWYHZsElfQjWL5JaKnE67kRR/W3Ds52PBms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lites.edu.in; spf=none smtp.mailfrom=lites.edu.in; dkim=pass (2048-bit key) header.d=lites-edu-in.20251104.gappssmtp.com header.i=@lites-edu-in.20251104.gappssmtp.com header.b=01/9l5vP; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lites.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lites.edu.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lites-edu-in.20251104.gappssmtp.com header.i=@lites-edu-in.20251104.gappssmtp.com header.b="01/9l5vP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso169411666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791707170; cv=none;
        d=google.com; s=arc-20260327;
        b=SqXZdZh309bL/d16F1x4xIVU94XbG2TYVwDYIFYMtgZ6YNo0vM0k9+ucA8YIi/SCvI
         nYxE1R5Uhfg0M+eJPdGxUsVc55/JTz98TAcu8WXger7NL9N29dIeaPyNRt7KQ29ZLAgk
         1LFkQsoZORomQZRoS7Ym/u0wHDd/IbJN7G4jmConN69e3ys7+A1pD6IF5UXnv5ejF/1x
         81sht8MtAYkBuInqn3woST8phiXf9QJz59tm+x441T/5bMwQ4mGudIwFB0loe/ygj/+f
         Amb8NBLkJpddZnqnAsAVYDLi3dK78B7D68GmT5+TRBGOYhbSRaaw/hH71t774ICfkpnl
         oA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VeWOzt/vR8ac6bidgeXLUz43ws7MNm1pkFX/k0pzLAw=;
        fh=dP/LgfaqFsSN+ROBEJtgES0r/SvbZJf9IwZEtJPQqhY=;
        b=qjJe+nFkkQG0cTk4NXl9U4PfNRdbYSP9A8nv7zQobunYxsvJOAo7TlgewUgD2wMuVd
         XkB72qR79nRnd2/rbZxjSflFIzhiHQSG0a2euPhMeT1ISJQiaK1XJuyBq2K/MDXpsTin
         gituDaFZrPHNLWAb15c/5AljcggFMIrIYiELJetuSlQzfHtyTCf2uRRbt57mkOE0wLSl
         Qje/m7Xg2D5T79+4fEUket02s+dgT0lNU/ZIwDY08OjmnaMM3OqB31oVLV860oggvQXv
         rtyHLDz0FBIyLYxThTOT8y7ehXXeYzQ2XnMoQx/N3U1Voq5L9Bf1HBnRXY8rEdKdL62T
         /6Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lites-edu-in.20251104.gappssmtp.com; s=20251104; t=1791707170; x=1792311970; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeWOzt/vR8ac6bidgeXLUz43ws7MNm1pkFX/k0pzLAw=;
        b=01/9l5vPr5k3pc3ZTMmV0u+goVPG02mr/riqHSbCt9cUguZnRA3Cj8CqKJYjujGMbS
         VZ2n+iUSFsfaD8wN1wEwUTpxptkVWfornSco3L8/y1ON+RJUSo239PIf1DJYjLsoLVJv
         XtK7Y5qJKpigm0sRiqLpi2ogtuGNyddL0G/MXOkzeBSyAfckEO2wKSciekbH1erqw7MC
         /bahA+uI6D56/1/vd1bkzOSXiB8YDStv12OB7dtim0U8ZuFqWseWlotimf92dvP2BwwA
         pjS1pkX1RtCpoAP1m/ZMtCjOIP48B5pu9eqDfSwLAYRlbxsUurDWADMyxwMWrKrWzttZ
         xsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791707170; x=1792311970;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VeWOzt/vR8ac6bidgeXLUz43ws7MNm1pkFX/k0pzLAw=;
        b=jBXua+Kym+GugrJadYRuoebh7Sgk1B9cDSsA79UtcMcm344wVkUv51vtc2Wv/6oUF/
         QlHp+QQZ1hE0hJNr/Kes07AFqAWEu3ldGmjsQJ59cEkkpuAouJEx3e/W4Eqfu8Sox+Vi
         ZMdnKzR3xMlhjNxcumKmvRuBXeX31Bc+71I0QBXcQfetnTK6DSyYRZFKnoPMu0sVhDFi
         Oee9qOyhLPOYTRsUii13UbLi7GXwTA3G+7UYxRCj0FBOWB8iDb24gLpSdO6UvkksdZt3
         gttCevFlKLdX7Ig17ECJL/lgbLDDOihR4OCux6dkRmebYm6zVj1/y7mexl8D28K3wE5A
         +s4w==
X-Forwarded-Encrypted: i=1; AKwUvBzOxj98IW4qZpuYAjAHodECe3y6FYcpcONGkdYi3pbQOPQfjN8JtRLo2sZV+D9djLiDWVv8NEk04e9OHdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw/oCo2CjxGrWIpmJ5Bl5C4VGKFdYRUeZs1gc2s5FW7FwDwTyn
	+pWuylIeFSek3NkBTfTECphglxduA+PaFXvO8/PfFHfWP3Tf7gpkJVxaNzimubsyz9k8CqxI8zo
	1sf28Uph2UW8QWDjyBSA4ExYTpHwlVyrv9JQXPqm8Bg==
X-Gm-Gg: AYBFou24HKoZWdxXyOi1TwOO6T75VyQ04DF3CyLC8lKf0XdNpWxz5mdyuSpls8k/u0z
	Y8g5pUfnxByln1Evs+xjvknroCT6r0YSlvITALgvCugVIJcGaYBtsRspXrfWX7XnO4Jrqnoqd2V
	5J/6WiPyP6baHggPlzylegyHffx36ggRbCEkknJznXPDsCXCDQKbaA0Op8TqZGCc1ETxCozhFtL
	1JP/93fixLSrPgkn9DXZ2Bp33kRtS3rEYY43k1O18jSEZMZV3zdVOCPlYz0VZmmcI0cFiWdxihy
	v3KTOMhyKgzNOFVBkLJZkwfOi6AkSCpQa4WkX2owo4Esk2cWccKpNWyx
X-Received: by 2002:a17:907:9707:b0:c2b:7672:8e29 with SMTP id
 a640c23a62f3a-c31a9fcf4aemr621862266b.16.1791707170136; Sun, 11 Oct 2026
 01:26:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: 961222243021 SHYAM J <961222243021@lites.edu.in>
Date: Sun, 11 Oct 2026 13:56:38 +0530
X-Gm-Features: AclHuK8SDsnlF8XMjH3_wRqVb7_U1OfFqHRGBm3v2xIrPO2hn7zfN3izqmsBOqU
Message-ID: <CABQ+_V+HMcZ1C8DJggKO+-fwQOxREch+Cgfp=aob-5rbXwLy=w@mail.gmail.com>
Subject: [PATCH 0/2] lib/math: rational: fix semiconvergent comparison overflow
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Trent Piepho <tpiepho@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series fixes an unsigned-long overflow in the semiconvergent
comparison in rational_best_approximation() and adds five KUnit boundary
cases.

For input 1/ULONG_MAX with maximum numerator 1 and maximum denominator
ULONG_MAX - 1, the current helper returns 0/1 instead of the closer
1/(ULONG_MAX - 1). Doubling the final term t wraps. When t exceeds
ULONG_MAX / 2, its mathematical double exceeds any representable a, so
select the semiconvergent before evaluating the multiplication.

Validation:
- x86-64 KUnit kernel in QEMU: 13/13 cases pass with the fix; applying
  only the new tests to the original helper gives 10 pass and 3 fail.
- 32-bit standalone build of the actual helper, executed with qemu-i386:
  all 13 parameters pass with the fix; three fail without it.
- Independent exact-fraction oracle: 20 full-width boundary cases and
  10,000 deterministic small-bound cases pass.
- Standalone GCC -Wall -Wextra -Werror and UBSan reproducer pass.
- checkpatch --no-signoff: zero errors and zero warnings for both patches.

No affected in-tree driver or physical hardware failure has been
established. This is a helper correctness fix for large valid bounds.
The 32-bit check is a standalone helper test, not a booted KUnit kernel.
UML execution was blocked by this environment's ptrace restriction;
the kernel regression tests were run using x86-64 QEMU instead.

The series was developed with AI assistance, disclosed with Assisted-by:
LLM in both commits. It is based on the mainline commit recorded below.

Shyam J (2):
  lib/math: rational: avoid overflow when comparing semiconvergents
  lib/math: rational: test large semiconvergent final terms

 lib/math/rational.c             |  4 +++-
 lib/math/tests/rational_kunit.c | 11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)


base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
--
2.51.1
