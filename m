Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9FC3B9D96
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896061; cv=pass; b=PMTh8sBEuMdoxPv9iw9PLthoycaMgH/9DxDBH4hmZF79YBJSrQwksS2z2Uh1w2K2cbOReFfnp6ydfEdB7oIelcBBkh7G+esylDkuKdC2MI89J15MMzp0E8m9YlQdy0etP9otHUEg5oEP7pp6LhIEn5ryVE2n59a1hZDGwOkSkNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896061; c=relaxed/simple;
	bh=DJsTYJIcYnU7vioWdYNKnIvZWxhAdOa6rfODFDd/5vs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=d6vsgYCgW8V7RGH3hLZbzvfinLZ5CqhFK2fWKmvwRV/7dg4l7SeytylTaKpUq0rXwO4qU4q1b56253t0qiol4ACPKV10x9PZUZRURHFM7yRuejbkCgzUk0JjLKaOEQjxgTwNhOIi3KldJVDKpPCMXeU9eOaUcp+qPihLTc1QSI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=Ozjk/rtq; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="Ozjk/rtq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceaf8a1265so9031735ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896059; cv=none;
        d=google.com; s=arc-20260327;
        b=oSY/Y5+afkKfd4ADyxS2ibPb01Osl/gDvgiYxlJriY803JZJWjDkQ9EXrFYSo4p9lx
         G8VmxSKamRSkUtBdwmrORlK8QOHwLmMdJrVAwdsiTTRUjsRBjpuNpktUsCNmYmNiwxrd
         M637A7+E9F+2wtD8wYWzh3yYVCVfti9xNDgBWHSdvomyLhVzll2Ky58JYbBd23aDrOAe
         xbPOQH8ILwUZRaSorYv+vPY1e/VjxDEUs3l4/CeM7VvPUS/l6ceVnTILZcDqxtNb38TF
         rf/SCANLKxuuO4mRrVIT6mAXjPtKoW5Z88yveJsZECj/b8v+ZCDrdtttiZ4n8AsVKIGz
         hh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=xw0u3y77s06SS5fejAicY/4ObOINDzdiC2R7DRjet6U=;
        fh=6RYDb6NZR/9orGhIBaWxkBE7VBpfr4/dyUcoNklyd2c=;
        b=Luit9f2mqXbq4q+7oODeIHVspcusg2xi2uXa45yZ36csOeZ6CiAtVljrSUpY6wIWLk
         aHjrBYTmFsZcv3r8emB7FlrODexiEMn9gB2x12MZu5H+LwS4/Wr0qe7MNzOyvLUsRYjH
         WiRaUmt9NEhGRmb9rR9K+F4FodMMd4Td8lwGcTcWSqPqK17TJ7uT9xEIOaEA19MgpvYZ
         89dTIq7HT86KBZoUDqWjnXY7/AXNm7/Wfa17ovUzpZFKil8+k6oPt0bcijGRXqwdtsLr
         7nBl9zWVlfGXgMywBlSma0eetVBKeezgbw76tvzmSmuMtY6rVeAqpoGNuyXmFPSojZze
         ST2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896059; x=1788500859; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xw0u3y77s06SS5fejAicY/4ObOINDzdiC2R7DRjet6U=;
        b=Ozjk/rtq9mPBn0Gea7jwhAGrjnlDLnSvVWSQllwZTylRK3/xR5VqFwBbcb8Te5RObL
         C3yRXzWjUqev0Qt1YNd57YruwJfr3bq/hzf4B2gEbMA1Pab5/lMVox15pCSrLChGD/Uq
         Fn06NVcycD13mr1gpuke1YLq59EJZuhZDa6NntWbfyxNOyFziJzvBbZDj8kw8KGLkf8n
         dLrtqWv73aNQpn+bObdOivKOZ4JcL7p5DZo7tZR3XITOMIQmGaCUy1MG2wrq/Tb2ngok
         RqoRDSY8md+yrC6960RCd6v8gqWQOfxWawkjeISJyhhyRnYUDRHAL/ehEUvoN8VGiAYg
         WYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896059; x=1788500859;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xw0u3y77s06SS5fejAicY/4ObOINDzdiC2R7DRjet6U=;
        b=IGxc16tSwjux5DZnwnRdltDReJ2umnASUozQzgSCZVCmV8H75pZxSXzFjHexW1eQfr
         FX0DBRyfI++r6eS6QppSXogkeQeWwfffdzWlBEjCZWFIYxHGAjEv1trWjfENi+mmMg3B
         1lv4jfnaM7AGYo+h+/msc+/xY+de9pPiavgL/E9vrVCjtyKBVmWjrhlOlXeey0L0WCoQ
         LXR1CwRsnlzFkRP4ORlJUg7MPjurBBsc23DblcmH5WfxcpImdxbw1hT0YNkiOVSb2ID2
         4riy0ELjMWDYgf88NPvWOoU6f617tEeRr9uPASBw5gzfuxkVOco7uSISP/nfmeWFxB+9
         Sq6w==
X-Forwarded-Encrypted: i=1; AHgh+RrkmbDE2BI/o3QrvmisVf6EvbR/f9oj0Uil9Iic+9kzzq6hEIsnli3R961u2T/W/tA+/AfROaNz6nfPbDA=@vger.kernel.org
X-Gm-Message-State: AFuF++loJNdTLBuOByKShMH1RFJHIjGMxy0gDCOOyQ8ODZFjz1NNRXyX
	sF7MJ90Kn07qeCis8ZcX9TaWMIdh8Y9Z24wMvWOFrITxc/FVvXKaA2W8xPwP4wUlLyzTc8KkDjL
	BLz1uVRgFHr7h8rHQqu3R5kzRZw/ChPL68MlPb4cS
X-Gm-Gg: AR+sD11sRsZLQpbTaoD33o83gNWj97Til0uYtH176aXvk71+mQ+eINvhmWXJZG4YJ9u
	qJQTBzfMZhoyM2dFawo3CcWzggH1lzXX2a8dOM03pYeVp/a/mJkgxq/LM43cFy7x1p14kIkM57+
	+OZw6y6HDQvP+DbngJbra0mIZ9YgndJIs3IyBnltylg+1ac8yeWDkU33/NOrYXNEqnbqC+yxOvd
	fJmWTxRwVEOxCLOHViJe+KoTekD3vhXQYpZJeVMvuT14P5TgXQALAucO+gnlRXo4w1p40+iDx+V
	RrWKTbGZWBVTPcI1LCOQI5O/SNpEpiMNy6R4Hz2rMQDjhpGJj/2AJKwDNBlfu9oHbT2iW5gkAwn
	cxUHRgb7oaOoUZz6vTi9jDxfJF2M7v8+5
X-Received: by 2002:a17:902:c103:b0:2d7:344f:4a6f with SMTP id
 d9443c01a7336-2d74ded6d76mr60093875ad.8.1787896058433; Thu, 27 Aug 2026
 22:47:38 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:47:37 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:47:37 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:47:37 +0000
X-Gm-Features: AcwNN1WysQaTDa4WYAtaf7a5tp6RrsTZa7alP9IXFixhGCml7UKU0kt_NQ3GowY
Message-ID: <CA+0ovCj=ojp=46PzmrDUxf4sbNRtF32eKDe1FNmBCcFhnEP8+g@mail.gmail.com>
Subject: [BUG] kernel BUG in mark_free_pages
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: falemi@asu.edu, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/181-kernel-bug-in-mark-free-pages/

  page:ffffea0004c00000 is uninitialized and poisoned
  page dumped because: VM_BUG_ON_PAGE(PagePoisoned(page))
  kernel BUG at ./include/linux/mm.h:2265!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:page_to_nid include/linux/mm.h:2265 [inline]
  RIP: 0010:mark_free_pages+0x49e/0x4b0 kernel/power/snapshot.c:1265
  Call Trace:
   mark_free_pages+0x49e/0x4b0 kernel/power/snapshot.c:1265
   count_data_pages kernel/power/snapshot.c:1417 [inline]
   hibernate_preallocate_memory+0x14f/0x750 kernel/power/snapshot.c:1859
   hibernation_snapshot+0xaa/0x3d0 kernel/power/hibernate.c:429
   hibernate+0x28f/0x680 kernel/power/hibernate.c:839
   state_store+0x234/0x290 kernel/power/main.c:821
   kernfs_fop_write_iter+0x2fa/0x480 fs/kernfs/file.c:352
   ksys_write+0x14d/0x260 fs/read_write.c:740

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
