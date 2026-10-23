Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755845;
	b=NOUPfz603HFgVOyJeYUO3xN1zmkIr+Yn1ztgvUBReOPlR+nC/uMH1DMzRIOd2htvU8G2
	 yc3466RApm+tEw7EhoPxDJxKtdykmbJ0Bga8Ow+phwNG+r6RkRGj6XdkKwUvIpJKjDpHM
	 j/Aps8aEyc6gN3g3wNOrHV+rlL4IPdcLF5DQhFF52/6EomcV+d0ZxgmPFRPlppuN6zCq/
	 vmOZ8F0vIGuDTTjOGmmGwUlE7caeLhgMNZzK8KvZ8HysQO7275XY7F8LS5aRE27YSzVQx
	 kha4mZX+FmQlhr9U1xMMGM102Xa1QVIfxtw5BIaiD7u4/wIjvOPJkjVmm0o3FTPRSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=mdMHNip5Ajs/IL99pQ1t5NzpRdzirssqiKk0k7EB9yM=;
	b=SerNql8dsaVlzr5vqD86xOj8i3PT13rhT4mKP4L3PvfYya083pNC8u35zFAePktw4xia
	 6aT9TEoh629KjFz6V9HhWqpntGojJYhK9jFrVVEwKin54fvUm+kciKX+UyHDF/TVVSA2H
	 PJJ7NStUHteZeuq7/lnanfEKxCI7ovylgyRjTMrr7PrG5H6XSBfZO4kMI8Il03EQUzXYW
	 dfnFT7YLmmF1K4BaCN2Q0nO2NDIVdhu/MPxJYrgmTuehyzxPNIvwJpY0K6X3k0AD31grM
	 bnV3rxPrIjLd9ZWTTYq4XNQ08IQvG6uBqYG82rqWFyzEFfezW5BEN+1JeFGnfFKuzSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="LnvOA7i/";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E919606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E919606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LnvOA7i/
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so627327f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792755844; x=1793360644; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:subject:cc:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdMHNip5Ajs/IL99pQ1t5NzpRdzirssqiKk0k7EB9yM=;
        b=LnvOA7i/brG7N0j2MsURELHtU1uVnWoeTPV5Ny73Kz3sVRSrxv8qd/O4Id0eiwHH/h
         EfSDLF9BXR9MvpZwU7J1XjLjvAHOsRKlqmZvDnao/mar4lxaQ3OwJMRDhRICMzkfyi2v
         NszWwy27AKkAKmzCsY0EC2TEIFeBMwrNEUi2q84oDUvl15WWnKX6R8sIopWZVo+XOFDk
         Vay+Qcyy6uxl8LVNvoFf8VrKROj6rff6HPuWWBAhdoAsK920vl2sLsprby19UKvxq+e2
         f096NfPFpVWFbJbgK1nejlWQj/aMQkTsVSrahksPXAGceVx3AeLpGFz6GnRCJq4RUPnr
         hIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755844; x=1793360644;
        h=mime-version:content-transfer-encoding:content-type:subject:cc:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdMHNip5Ajs/IL99pQ1t5NzpRdzirssqiKk0k7EB9yM=;
        b=rlk9hYJ7pWSRX3SiBr1GSqeQs9N/rTFfcsn1IxCmZOEqGJeIoflju8O/xBPigsahNe
         aLPSZKN63HlVwQSYkpoP/x4IkTuFEDdj8LjlfrfgSjFHDur4u8hG/FCK8mYJdMuosxrx
         qcNMO+bRBxFhKSOfpsIvHoeDMoXvQ97Pp/H5p05zpfrNp0ij8fyhI9e/gigQLC+lRIpa
         1RHMOBeSYdTSYX8peHR17DsOwTTUf/NDwdwRSIYOK5oBPOrhmw6/XSx7pCEsa9iRAxMY
         l3z0qVYRxam2oggidQKMhYPd6+xEme/3QwbZDmq7eHYqjdRh+hRUX58OAevZzCMnyUUK
         iWkQ==
X-Gm-Message-State: AFq9FYLECNBTEj/RovSIrj4Y6KXxOuUsKArr7yabE135y/dPXhUp5hJt
	JNSgzlRE10F9poLXFNcRcdUs4X283wtQ1hiHe6y54xR0T2GYHcAbYENZ
X-Gm-Gg: AYBFou029Cwg93iZ/9tMlt0oNXtLq9hpRFZG1IYQJNfjJJ5uvjhgxFtb9P6xe2wBcRs
	sY4pmhA0wosDJURw7RaF+muk+kHQIm/VbQMiTPHZgJBDjUNMvFRVjOE2uD0XdSt+3Wuv5gDM6T8
	Am9ntfyaK0jWlTKOH32vHup7xHrsu5Dn6ij8OhyYlRDxlogDTMXC1XWoSpT0W7gYk1iab+gXnfx
	J+fQUpbjcVYZUwOozu6qW0pHZJxTxSvFHm3jH2YdQeO5yOcZo7Me7W4GOdCYawLM3J1ckDEElG3
	j4vQPAZqCuPgpwZMpnjfNA3CU/oRNrd+3NJfaf+kBgZ6Of548P0HyD+s3jqOyxTxYq9GLT75U7G
	ixv+4DoodU1yG+z39WvhCGDRySYw2lGvx1waTlFj4hgk4aLI/MK1rsuM9p9fR8Sc0mXG98F2RNn
	f5pCJ7lu2Mx/psO8q8nHx5esY4UrbfGBaE85RoAngWVv3IssWJen4xFFmTZp8OzoqNeV4UqT2la
	+FkODgDMwX7lP8yEP3BCQ8Si52TfDv3DCBBOUzUXjl0WNtKVGiwvkDzQEEisG2MkwcSHeRyTaXP
	F6zLSCBxVVVQzUpA59mvTtWWPlXcpYucOVMQ7H8JClG5pbzDSgk=
X-Received: by 2002:a05:6000:230a:b0:48d:dfff:fe6b with SMTP id ffacd0b85a97d-48e385be006mr2824703f8f.34.1792755843684;
        Fri, 23 Oct 2026 04:44:03 -0700 (PDT)
Received: from SurHub.localdomain ([102.208.97.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce44sm4742310f8f.3.2026.10.23.04.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:44:03 -0700 (PDT)
Message-ID: <6adb4883.dcf90272.1a940.5626@mx.google.com>
Date: Fri, 23 Oct 2026 04:44:03 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Dimitri Sivanich <sivanich@hpe.com>
Subject: [PATCH RESEND] char: uv_mmtimer: prevent read-only mmtimer mapping
 from becoming writable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

uv_mmtimer_mmap() rejects writable mappings of the system-wide mmtimer
register page, but leaves VM_MAYWRITE set.  Userspace can map the page
read-only and then upgrade the mapping to writable with mprotect(),
after which it can write to the shared RTC registers.

Clear VM_MAYWRITE on the read-only path, as i915 does for its read-only
objects and as fixed in drm/vc4 (CVE-2026-68445) and drm/panthor
(CVE-2024-53071) and ptp: vmclock (commit
a5edadbae57e2298a56cf7a4e774a027905a331f).

Fixes: fbd8ae106850 ("char: add SGI UV mmtimer driver")
Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Acked-by: Dimitri Sivanich <sivanich@hpe.com>

---
Resend: collected Acked-by added and 12-character Fixes tag; previously sent =
2026-08-19.

diff --git a/drivers/char/uv_mmtimer.c b/drivers/char/uv_mmtimer.c
index 956ebe2080a58..c8b6040f7a14c 100644
--- a/drivers/char/uv_mmtimer.c
+++ b/drivers/char/uv_mmtimer.c
@@ -154,6 +154,13 @@ static int uv_mmtimer_mmap(struct file *file, struct vm_=
area_struct *vma)
 	if (vma->vm_flags & VM_WRITE)
 		return -EPERM;
=20
+	/*
+	 * The mmtimer page is a system-wide read-only register page.
+	 * Prevent the mapping from being upgraded to writable with
+	 * mprotect().
+	 */
+	vm_flags_clear(vma, VM_MAYWRITE);
+
 	if (PAGE_SIZE > (1 << 16))
 		return -ENOSYS;
=20
