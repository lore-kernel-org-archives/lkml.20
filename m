Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDFC4AA1E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366896; cv=pass; b=PXDsoMithEaoXUUdyANeC1RFThIGgLov82l2uyqujVHoKlwOxcr2IcA3cWwI8FU1noDrms/q6Wrh/4dVBTz+LhpZkN0rmqOAfULD39ceRyg5usnJhGDkKECtXJWndTS0p/SsRx7jM6U1dwZkYpjGecc0Qod9GFkv4bzDf671qiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366896; c=relaxed/simple;
	bh=BfEmlkBKcWe2ccNduTBti/ySDv9Dy75blbe5/+Ct4XU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qJbMRAJVASvU47BwcBGSDUBRhYIggqeu2o/TGPldVwgfGUPzRMh33iroxucVL38YsgW/yIiUY/CHDjMg/kkJ86B6MjLTQtWWSEqdRj9ia1hspyEgF7bJmii6/IQ3UEYWFLCB2wXde/9gu0EYUGUuHQCcMp2vrC+rQOlP4OMbHlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy8rpqnI; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy8rpqnI"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6acc74fef22so555712eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788366893; cv=none;
        d=google.com; s=arc-20260327;
        b=VhMdVUy7p+mnxx5XONO0YNxjOvrb7vpEKmnT3OCdM4sHx2wMvbT8p5UZdHM00ft0VW
         3DeRPHoBsXYN89zkmln+x0WYzpmhqNqA1h3EddZIB4m0GF4aaiMWjes4X8+J0OQr7Y2a
         rgW/7hhsuA085wMH4FZ4BWN9j7tFSabRW5xW+Jzx3RnefL/2x+YIKEHGBQYytQhOmr5V
         OLyZy3dSFB5+ZYkbvIZ+yB9tPTPzu03hs1HW/2B4CjMbRmBkAMu8srIWVz2mczXAbh0p
         q9MEkU1KJzAnjYrR+vz0csqwTl+U5vDoufjHe7RpaqJZ2jjlqKQc3XNhMhVdgXLQwj91
         ZAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=US9Ylb+9AiTeXprRTRZTmUqpRaQkuKyTcR67E8oUP7U=;
        fh=AqgbQSnCmhf8R22cK2MIqe9Kn97ANXvzM10SOqHnvWE=;
        b=oubfLY7kl173B+29ogJ/UmT5lVKAvjohXAyzBdTN9hHDbFNQKcIUf5OurweVKsPxnc
         pTfp12Q3nlgrbBqKPW53urgNBiW5oi92LiCacnF4he5GHNlUIp+m9YwHrKdIawCLMAAY
         cTDXMAZadSPExQmNRZfiiun2/FyVZM8AUYYVGFidJ6MijGZx0Yx5cdONkxv9Orhbv87m
         XyDP5yEn0qJmm59ZXG6bI/tf3s7ObD8TQB5NPRDcTTcYeveBivTIyqCBz3YTiz4BUhr4
         GkpIfBrnvMXnsbmtaIymd24AOGUIhGnUB7jM7V/dzOUQdMYGLH5YrDjoPrvMOW9sEd36
         NSsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788366893; x=1788971693; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=US9Ylb+9AiTeXprRTRZTmUqpRaQkuKyTcR67E8oUP7U=;
        b=cy8rpqnIQ+2VJ4lINHfL74L8S9OhYhckBddCBaqsdhpu/+kTlXr66den4h5ZiYrqRK
         O3XzW5PpGUVUyWFyfZsMM/RJSCfGY9lQYqGfmPK/DSlWng1bvgd/BHYokxfippxaP1Xs
         KL7HwhjyX/MXM06hhaP8AZ+355XS/jiwX3O2/T/ZzENfb/wIfsxUqD8IB4ysOhfXkipM
         8sIXG415I79dE5eeoR05szl6VbYlm/cmHyribtNuQIQqh8ZoDWDzn6RSr/6554v3qkuV
         J2mi6c3jSFIJtrV2qf6HI9Q8Pe/2qNl14r4Pu70ISL3ZVjIKLe0z0uO7Fbx6YTQxy1W5
         iQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366893; x=1788971693;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=US9Ylb+9AiTeXprRTRZTmUqpRaQkuKyTcR67E8oUP7U=;
        b=f+oFnTGCILvNRmF0saVXIGgAmq5m7Ur8dkFj9Smtmti07yoeicoM0mEijYENB8/3gt
         WlQ4LnaBZRzA8G2wb3r5B/V27NnjQ/FVqEQe3OnBfYVj9wJetC3qdyPhMB9cXKg/rgdn
         yXwd5muO1A7qD8eP/LksLo/oF1IJhtbc6KMaoulJYqPMIA1jcSdDOvitgpbw89+noP5A
         eXnZlJ2QIJmlkqoD9CDrKuOKFGbcfL5ME2uJnPwh2H8fFYSITwInmfKXsQt08kZJ/026
         RRKnWg8iIPUNzkNmwVveSiGMeJ1t4izjaL+EfY+A+Y34/ORmI+S4CRNyJdHJI/MDqh0p
         TPJg==
X-Forwarded-Encrypted: i=1; AHgh+RpX1BRaTBFDPjPV66LxYZsSLXPERdZBw/OA5BgbqJuqsIMdCrN+d46CsL5fd5L+dOfUTIKWI/pX0EFiYUk=@vger.kernel.org
X-Gm-Message-State: AFuF++kbr1QJBtjtconvlS9k8HzTHOhCf/y/X+gUmc0K4bqEHP1DvTX3
	m3AXK+i8XJbPsVPfMDPVe0MqtBfr8OZV6PEYnSqa+nMlONvSeu1iDyMnwey/2nWkvlap0OEhKaS
	GiibFVOi335xLtJfYK+Fi2eZjJ/hBdFA=
X-Gm-Gg: AR+sD12OVmGgHEnILvaEgSZ38IPYlaci11tefIGc8LpmlmP0XAQAjzsHsilr1hhkUqY
	czqvTK4I3c8v0SLaVNXuU5CQHwEhdxIWbo7LKHirblFtKrlneBnTafJLOEnoz53nMXmxyxLybRM
	aXQJ4LDoxQuQfVGbNG6mh8X/qECNRj74pvei37kqK5a1YLwWhbKncjHxON8+GkGW5MbneHKxSh7
	SaKs7m8IAYGS4JnHwZZ749Kf3UDKFDx9xpGJ7+8WcW8hXYrdlKTvto3KG0RpJYxP1antGPOeDAq
	/HPQMORFlU1vzNT2d1r54GGt7cSmCy9CEtZUJxKH9Zej/x4DMZH9jwPKgEBMOkCIUGwlgRp58BT
	RmXER/QbzZDFFHOlq99quPH8NPpZbCIi2v51ybL+11/CzTxnlrCeZAD0o5HIVe2lVhcn6BMrKOV
	NZFe0nlGy+nSEhbi2N3t0t4HvK9dFC7WMgqxOEtcfP
X-Received: by 2002:a05:6820:16a9:b0:6b1:445d:aaf9 with SMTP id
 006d021491bc7-6b47d4cd775mr4034068eaf.8.1788366893040; Wed, 02 Sep 2026
 09:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrew Wilson <wizlonex@gmail.com>
Date: Wed, 2 Sep 2026 12:34:41 -0400
X-Gm-Features: AcwNN1WhXm-Lt1F0X-OQuMqxjgk1a3bMvVoyZLhgjbgALurTS0LPjsCCof-Lok4
Message-ID: <CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1+xSSg_six-+po9kpvQ@mail.gmail.com>
Subject: [REGRESSION] [6.12.y] crypto: ccp - Move SEV/SNP Platform
 initialization to KVM breaks SEV-ES VM launch
To: ashish.kalra@amd.com, seanjc@google.com, aik@amd.com, 
	herbert@gondor.apana.org.au
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	thomas.lendacky@amd.com, john.allen@amd.com, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	1145026@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab

Hi all,

I am writing to report a regression affecting AMD SEV-ES VM launches
on the 6.12 stable branch (first noticed in 6.12.97+ / 6.12.101).

I completed a git bisect between working and failing kernels, which pointed to:

Commit: bb1c84647025 ("crypto: ccp - Move SEV/SNP Platform
initialization to KVM")
Upstream commit: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab

### Bisect & Verification Details:
* Last Known Working: 8a599f4f74d4
* First Broken Commit: bb1c84647025
* Tested on 6.12.101: Cleanly reverting bb1c84647025 immediately
resolves the issue and allows SEV-ES guests to boot normally.

### Failure Description:
With commit bb1c84647025 applied, `sev_platform_init(&args)` is
removed from `sev_pci_init()`, assuming KVM handles on-demand
initialization.

On bare metal, the PSP firmware appears to remain uninitialized (does
not reach SEV_STATE_INIT at probe time). When QEMU initializes KVM and
queries host SEV-ES capabilities, the ioctl fails with -EPERM:

  qemu-system-x86_64: -accel kvm: sev_common_kvm_init: guest policy
requires SEV-ES, but host SEV-ES support unavailable
  qemu-system-x86_64: -accel kvm: failed to initialize kvm: Operation
not permitted

### Hardware & Environment:
* Tested on: AMD EPYC (Rome / Milan) Supermicro platforms
* Kernel: Linux 6.12.101
* Hypervisor: QEMU / KVM

I have access to Naples, Rome, and Milan test hardware and am happy to
test any patches, provide dmesg traces, or assist with debugging.  I
am not a tech-expert of any kind, but I have time to do some testing
if it helps.  THANK YOU for the great work.

Original Debian bug reference:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1145026

Thanks,
Andrew Wilson
