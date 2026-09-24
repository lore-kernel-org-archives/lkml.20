Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FB5318BB3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283916; cv=none; b=CTN7uJMghjuYOwhVAMKAkO+Pjbs+d4U/OGUZhjZElDUIicWj0vwd3UVe5MBUCsgqy9/7v1aVd3udRwkewLkPp9AWW2wEIMjcivJ1PSPygghSHiX7/w6esj3GAf6IO7We3EXAR1RNJIPyZv29ltxSWv4VLmIqFX/HoHbnKLv/qTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283916; c=relaxed/simple;
	bh=BSSyDbedCfcC5HIwqyjke7tVWmreoxRseJ4xRFGZ8Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dea/t7U7uzlfHAFkc64L8VBHodFRamfFaHXUFHFHH5LziiV+U5U/2lR0lg9lgnm+nSvpMm4Zm14dx25EJzghEILF6EM4hbqU1d3n5a/FY8hj0XzeE3m5R26Y0dYibVMxIVMBcteh+XMK+LvWHo/cvxswnGsHiDuN45YCDRWKTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi4GE/BU; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi4GE/BU"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd05d97dso220363c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790283914; x=1790888714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NmZmhgLOy/YmQC3GmGsf1VOw7I8/+ySPDXRuFIlrI8=;
        b=Gi4GE/BUpF+eXYarjXMJg/hcbcJ019KgMO4amgGGv4JxeZUuwsqoPpSoHVByVRJrz+
         KDnXfJojdFkdRHtYccc9YNLjDRWJxG7YLKmaUbpBL6Flm4Kt+crmye/u9+AQk0DkEPKs
         t1q6ZFMbQ8f5j3xe9+4AqscHQZ50e22zyP9sYfrqzgoqx5tqYVe0lwYg7F4KX8wMuA6m
         +STES1FMbm3LelDuhKadNximl5oHTjpSje1kQ9YLbefynvdhpuqLBKN0MaKlUS2J5BKm
         zotwhrzCDtBgNjZ/KHG/j9NQhX/FdxfNUuLoak7NGt2wnR6fFnaqtSTxKV2qTpo2oKjs
         6LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283914; x=1790888714;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NmZmhgLOy/YmQC3GmGsf1VOw7I8/+ySPDXRuFIlrI8=;
        b=kSbZXZI07UkWnIKMdkDYbewhB3mShIsqhTyYuw1b0KBAkE4PVmzHwfsg4IABNPu+uK
         z8vkmsJH3InfjxCxDqova7B4ALnFXcB0OmErNDlNPpA8SAfI7Fvz9oXXyH1qA69kQvu3
         ko7ud6EkW6PjswIkXFK+HsQhtaeAITPFdAnXdo5XDhYXo+Gtv1K8tgxsO0FxGuEyf/8/
         4dCZ/Z0KnPw+TCHCqPfPxFClhMTamH57ryzVCmUC3HdJsLrbSWKKESKrpycRI2r5gDfA
         p0F/H0haP2cj/bNKdXKUPOVBSce0SJ1jF7I6HhUfckBUvM1PVgSi2DyS6Zfci8vX6zKF
         JYdA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ4+zOxQ+jHd0roxPoxRhNeREIvwGczncbC5GL6rdvnR/Bv9sDZfgPoBl6mfXbD/qLDxQfhwFJRrDzJ2g=@vger.kernel.org
X-Gm-Message-State: AFuF++l8qYqpOia2bBW/wGMDTaxXWtr7vaJmAxzj/DR9D4hxXG+opoLc
	fRzWc0WQS5WpUkbGtLf9ic1dR1jWFQbH9ZvZfv8ij2byjApGTaIIjATC
X-Gm-Gg: AYBFou2B5te98V7GeF6rjQny+cwX9E32WYqaz7r6m8sUfZnAIvqKHNqR1/v3oEgrp+p
	4+SakuJu37bXW77RlwCrOT6kcGH6uUzJ1LHkyPwe7hyPJYXIFo+fNc6gbolKJZN77YzlN5vkDEp
	Qb2XzsiSBhFrmFVOJ4/BcMA1S/R5iQrbh/QsPnebnaSjqtpwXdE23X8D8a3P78r/HoKvJsmbhG8
	ptlAV0Nmwtuu12wCF89SQYU5DbsnoCaJOs3I+DPdlx1nP+J852O0BBvu7RIOE+rKDxqTyxdwUUL
	9dlPU9OMM5BhTMPiAKVK3rfhlgTs54j7bv8pFaLEAjC58IO4CjZb2J1ogOVkUHM8vQuMSKMkd1d
	FrqtfwHEohiwlqTJFgeGsKEDKd1u52lVGhFuppFAaursZNTIDc6NYC4JojCUhMWD4lQ01+WCuUT
	iN2xZT0wPphTpTcVocEtQzSOF41hn7nLerXahy3hmvehwx94TqIF0NKa3AvS+raSUnnOdvmR3PD
	ZZx2ekgYDroeSAHIvI=
X-Received: by 2002:a05:7022:fd09:b0:13d:974:a42d with SMTP id a92af1059eb24-14503fde9d8mr4585588c88.22.1790283913457;
        Thu, 24 Sep 2026 14:05:13 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm1054300c88.4.2026.09.24.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:05:13 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: alexdeucher@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu/gmc_v8_0: restore the FB location after a re-POST
Date: Thu, 24 Sep 2026 18:04:57 -0300
Message-ID: <20260924210457.13100-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_PsKKiOXPuH9c8n0u8viyg0u3rTeDnPoeDBk11MP4V_hg@mail.gmail.com>
References: <CADnq5_PsKKiOXPuH9c8n0u8viyg0u3rTeDnPoeDBk11MP4V_hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 11:21 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> On Thu, Sep 24, 2026 at 11:06 AM Christian König
> <christian.koenig@amd.com> wrote:
>> On 9/24/26 15:29, Francisco Beltrán Millalén wrote:
>>>   cold boot:   MC_VM_FB_LOCATION = 0x007f0000
>>>   after reset: MC_VM_FB_LOCATION = 0xf47ff400
>>
>> Mhm, interesting I'm really wondering where those values come from.

0x007f0000 is what amdgpu finds when it loads after a cold boot, with
HDP_NONSURFACE_BASE = 0: the framebuffer at MC address 0.  That is what
the platform hands over; I have no trace of who writes it before the
kernel runs, so I can only say it comes from the Apple side.

0xf47ff400, with HDP_NONSURFACE_BASE = 0xf4000000, is written by the
VBIOS ASIC_Init table that amdgpu runs on resume and after a GPU reset.
I traced the register writes across that call.  As far as I know it
is the usual 0xF4_0000_0000 placement of Polaris boards elsewhere.
(The "0xf400_0000" in my commit message was wrong: the MC address is
0xF4_0000_0000.)

>> I think the more defensive approach is to do an ASIC reset on driver
>> load and use the values the AtomBIOS init function comes up with.
[...]
> I agree that running asic_init
> on boot for Macs would make sense.  I think we already have a similar
> workaround for some other mac models, probably to work around a
> similar issue:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5be7ad8f5f0e067613e9197638f216f46252946
> Maybe add your device to that existing quirk or make the quirk generic
> for all VI boards with apple ssids?

That works, thank you both.  I backported a5be7ad8f5f0 to 6.18.49,
added this board (106b:017a rev c7) and dropped my gmc_v8_0 patch:

- On load: "PCI CONFIG reset", "GPU posting now...", then
  "VRAM: 2048M 0x000000F400000000 - 0x000000F47FFFFFFF", after both a
  cold and a warm boot.  With a debug print just before the reset,
  MC_VM_FB_LOCATION reads 0x007f0000 before it and 0xf47ff400 after.

- S3: 9 suspend/resume cycles (lid close and rtcwake, one of them with
  the lid closed for about 7.5 minutes and a USB-C disk attached), each
  followed by a few minutes of 3D load.  MC_VM_FB_LOCATION stays at
  0xf47ff400 and no ring timeouts or VM faults were reported.  In 4 of
  them my old patch was still in as a detector and never fired; the
  other 5 ran without it.  The kernel also carries my unrelated PCI and
  ACPI patches for this machine.

- Cost: the reset and post take 20-35 ms, and amdgpu init up to fbdev
  takes about 0.23 s longer than before.

So please consider the gmc_v8_0 patch withdrawn.  I'll send the one-line
quirk as v2 in reply to this thread.

Two things in case you prefer the generic version:

- The GPU here is a Radeon Pro 555 (2 GB), not the 560 I wrote.  The
  MacBookPro14,3 was also sold with a Pro 560.  pci.ids lists 106b:0179
  as a Radeon Pro 560 and 106b:0160, 0166 and 0167 as the Pro 460, 455
  and 450 (the GPUs of the 2016 MacBookPro13,3), all 1002:67ef.  I have
  not checked those IDs on real machines, and I only have this one, so
  I only added 017a/c7.

- From reading the code, on VI the reset on load is always a PCI
  config reset: the BACO capability is only known once the PowerPlay
  table is parsed in hw_init, after the reset.  That is also what
  happens here.

Thanks,
Francisco
