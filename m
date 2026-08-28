Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82503BBFAD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895613; cv=pass; b=JHwHCus2YUk1AC30dnyKzHHIIO7u5H7/dIotRdHFJ12ZFZ3AS7hGNEh6//JLbwUbzKCoSESDh1QRbu1EvJlmtyIrwTGGBZoD7WJ6kjxlF02ArqfdV0DG7Kb4uFWWXE/B7+Zr1XwOjf0lW0Zs/K83ytE9mUWqGv+2wO59iRhNlEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895613; c=relaxed/simple;
	bh=DmJHBRIgTIHnDaysgbMYNL5Sxs3/1dzntpjOgveg750=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=aL097aqd1W401dP8Uk96bhZrzPBb31Ht3LBE/rM92UdXG4Isxq0PZoBSPd7ps+qq3Z4MdSWIj8LdL+4BYsyvGCJROFIR7y9KvZvj4HsZKcWt4toNbKHLN4CcH+vJjp4OuThlBQaADgABkxotDVpowbqyQML3FrzX3rjkpI+nlXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ZJTEItq1; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ZJTEItq1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7340975ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895611; cv=none;
        d=google.com; s=arc-20260327;
        b=UhxQPiE8wyoR0oMBdYAuKHKFqvNinmNdBgso7bLoBkfavWamodSxt2wNDBjNpK1rwT
         wjamkaeUJd9Vg8aTRBy3l5i724ZChLxjiVUL3jM0oPtadmsRXwRNpl/DXkdg7wcY9sXZ
         e7I5xVSKRXmL4BJ8t8IrFXkz8Ioon16B6K8xKuuzSJBes5yy8IhTGmFoNA64kEmLp+Bp
         5DZy5/YTK9m0d1NdhN9eVP60LuwfOXOAGQSj0pns50qxtgNnRxKWEIAQ2F8imZlC8zOg
         WRwDbwhSScpI5vsNt5ywtYu++0kTY71SMRZf7l1hDg3pKje5sEp+t5wKvh2NjgVE65uD
         e65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=kX4001c5uQsdS+9FkPB6xzWvEC3+tpgtec4pqMg2mvw=;
        fh=CggA46n1eNXLPMaUiDOgjrTERFs5n4Rqep4cfdU+AFs=;
        b=eJ+IYnj/NVPbXZz0lodQG774egJqzX0pUtylEn5gfS9EQfG+R9zkxmbiySjqOMaUt0
         PMvmRbc4QplEUFIa5HQSASaKTcI5DJ5OUvFQf1x8J6rJHjrt+CHUuDEdnqJk1miBVQj5
         rsxraaUfy27LkD4EPnATj8XWzfyohjXObdz84yeYS7mkJSc6/J0a+ViQa6kOe30GpwPF
         gQG/bZLdSqmM/mxTdwrYW+tnS6yvFaJQrkr7BOdNivVVweATQRCXXqLTqABBKYn0aSQI
         H4OqekzObBwhwjYMocmlkR8PwMQXzhwAqLMd1I7j47WEFxiBorXWe0E831Y4PjrQ8AW5
         o1cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895611; x=1788500411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kX4001c5uQsdS+9FkPB6xzWvEC3+tpgtec4pqMg2mvw=;
        b=ZJTEItq12xoOGAI1HFkhBLwY6OBKDzGBC/syyqVOHwSVSJEaCD/Eon+hhcTYeavnVR
         GATeFvxGMvthZA3Wc5/afyNKunazLGfrqC3ccBjw2egTSJPyWwHMizd88O9sNT9jOR6N
         dHejy9F3nTzZfBHyjfI36FY8oLcXKHO82X7Sioln1TZKo0/vE3lnzUxXL4lLgK15O+V8
         hX9U0kN6UIah4RDbAREZFJjLnVIb37ORALFMRQSBP1Uih7Vy1zOSX+zPZ6VIzjqe06ba
         VGQbyZ6/zCzpuje/Q4fvslGSxleSkj1N1bEEk3MD5o7gwUMyQ+4anhbGfpgNfmcvLaGR
         UXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895611; x=1788500411;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kX4001c5uQsdS+9FkPB6xzWvEC3+tpgtec4pqMg2mvw=;
        b=ptSB8Hjn9J72Pg7wV83aXCAGFlvrqquEDbUe3vWZJiebdLFswhh2LuB0YiTTPCSlzy
         ujh1k/mxkM12tG3yq++4Lpec+gKRvd7avQH6kiC/BlguK50KEFSgTIOUaAbpRuFc849/
         FJgyirzOJJ9aM3MgUR6t49Wc+V0LeP+Rf8U+Qjp3fSL38RyWYNb2x03HuvCdaNnxv8Fr
         OVx5SeMzgdiOneZo0x1JFR4FlUMnrM9kidhmaYqUyeYnmfVyHRhAMDLOKOsBLwTVyIM3
         TSgk1PJWpSphHDWvgYi/d1+gpLVsZaUyJ/i5e/2FaLw1Nt+fIIlnw+WX1/LKf64IyxK3
         hjBQ==
X-Forwarded-Encrypted: i=1; AHgh+RojQR9Or0WBQ5rFTCvDvI6Jev2df2s/Wo6yiqzhOxG0vWU8I/Gmrwkh6gjiVFMNzMhk5euerHZsCSdxBzM=@vger.kernel.org
X-Gm-Message-State: AFuF++n5VDviV92NgbC2Nwz6txrVJ62QG+/xP+4hSX5OKqEH2TrqeopY
	YF46T9CciCzx7yXcR2PMOxVwhlDHIK4LQPYNraVtDb4cRSuokTuWWSwZsy9xT6NLKwAbASZMZQe
	DNpfdNOvuboBMV39RR7MDIQYPU14vF9xIfEg9lPBR
X-Gm-Gg: AR+sD112YDbpyHbJe+wXvA0SUc0m1Q7WJmhERJpl9tE69fTsc5QXO526mOw14v2dZKS
	4UvvlA+k4tu+j7+Ptk966ekFsacfxgsnR5TXwRC+X9hxhivGMmiWdkPE3K8APlRWc98U6g0g//1
	mrZLZUSp0ETRXEyXKE6nVMcnMVJDNzc0HefxJtxkYMncxmsC/aJaUbVURGYTqCbnlO3o2eKGvgl
	OZNEF6xO0/AxUdEqMYob2NlZ5zYy8YHhJCHHaSTAzn5pgha6ih5A8zi5Ade2R5svw+f2DPhMFbQ
	qtx+Zg3r4ma4L5n4CmgGY6i2GtWUkXa23kswRptqZqd59gEvx/uonCz8TJvMqXf3SNMRkFdQR86
	5zdoVj8E3vxqtfFRGbRHIqWIAvOPeTxo/
X-Received: by 2002:a17:903:1ad0:b0:2d6:f9e2:af7f with SMTP id
 d9443c01a7336-2d74dca2148mr90214615ad.1.1787895610029; Thu, 27 Aug 2026
 22:40:10 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:40:09 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:40:09 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:40:09 -0700
X-Gm-Features: AcwNN1V1xXokhQQ7CNk4vlQXfjGfvMBUshkzw2uzUqY1xboKWA3St6UdW4awAgc
Message-ID: <CA+0ovCiuSWBLetbWVJThDc+LzRU=xp+FmZeGddF3vOd_0UevzQ@mail.gmail.com>
Subject: [BUG] ushc_request -- URB submitted while already active: WARN in usb_submit_urb
To: Ulf Hansson <ulfh@kernel.org>
Cc: falemi@asu.edu, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/160-mmc-ushc-urb-submitted-while-active/

  WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x7b/0x18c0,
CPU#1: kworker/1:2/992
  Workqueue: events_freezable mmc_rescan
  RIP: 0010:usb_submit_urb+0x7e/0x18c0
  Call Trace:
   usb_submit_urb+0x7e/0x18c0
   ushc_request+0x3ce/0x8f0
   mmc_start_request+0x202/0x2d0
   mmc_wait_for_req+0xd9/0x240
   mmc_wait_for_cmd+0x183/0x2a0
   sdio_reset+0x1fa/0x3a0
   mmc_rescan+0x6d3/0x1020
   process_scheduled_works+0xc99/0x1900
   worker_thread+0xa53/0xfc0
   kthread+0x38b/0x480
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
