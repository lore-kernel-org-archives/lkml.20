Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84B346A15
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887254; cv=pass; b=Yu1MfKr++468N2nqUlVcSZOBzFxek7Tjfsnmm/fLTIH6PDqz9GyKFfI3NIgVm2Ce3f2dGHu4dXlPOREv5qHhvlIcaoAKhvrG4yzvl7hS1cFHe1vujjmChAwO8N8TlVGzvzW1BrpdiOnpHozUhP6qmaUIlRRTMFq8q0fjdgja3lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887254; c=relaxed/simple;
	bh=icOa9EGbmc1WLBk+PWgRJ2bum2ltIyAV3u5EU1L6H7Y=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=KjbpZ8evG0yc0Q4xuTpsYQyXbkH3duERTRM/2MpK0IUd14o+PFh1brJk0MwD9hE1vSeEyr4UsRdC90PJjE8gTIlU7DuHJUfQPX7BCxSBY0p8py8Lth2MSBa8l54jUU/42zl9rskPSwouCohqJtXfSt7heRu8xbpjR5uu37Ymims=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=f/D7cIld; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="f/D7cIld"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d049069377so6597705ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887253; cv=none;
        d=google.com; s=arc-20260327;
        b=ERkpFBeJ5lA8SyiBB7ZoMxk4jSMlPlHo+fA4fD0vsJ/89dOPf3AC33fpDoSKUrnQ+Y
         RtUHsJ2ELkFJcseWz6mcxlhz/Y1AoimQCZRN8dAAfaSPJ0wHn3uGk1yPJkCLX68A6L6E
         rWLRyMElbdw8o0SGKzYyRgyOFk9EePVx/Sdi+hsEtDtDo7rKAAX8yr8fW2psGKV3okkF
         AJX7e+7H116tFJfeW+o5ydD8x/K9XM30Q939o7P3MHFfS3ItdXysed2dFHz4UHMipQ5p
         GjOIbrF5frPDwco6oSm6S17soTnnaWLbRUng8ApOEfZVKXHw8QnrY7VsKh8xvtUIhKbJ
         HoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=1E6Kcf/lHHF0i15AP4vDC8gxkj17C5jINRJ/Q9+RblM=;
        fh=4R8fxf9adX/bQ0WChEaTYBP2n5yfpYez/9H7p+hZED8=;
        b=fsoJhe87zHqWowYsd+QtdB3onK/6fzWQSJVheK+YRiz8bm8uy4di1/xRaRD/hKs8hR
         /xtcxjHVi5BZC06d/RLuorag38ph/oWUiIBGAa2V5+3KIkLFit4dGe3sxnQzEvf1rTZC
         OyDdYUHVMKEGwpisVcFcCiR1kbi3NIFlKs4Op0j7lTEoVZ4e/iAEWQhYZ1CZDhALI180
         oc4Wad+Xy/odOXCYZ8eCxW/N1jyuiJvnTfbE685qRLB7WnBiheTQmIq44SjOwCiCGA4F
         rsK9MZ02gnICafAQNm/AKDTcy5f3r7oJnCdeSHaRoULPZKyTpK9kwHhvcX62ceMTcSuA
         0hxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887253; x=1788492053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1E6Kcf/lHHF0i15AP4vDC8gxkj17C5jINRJ/Q9+RblM=;
        b=f/D7cIldQBCy6Xv6MT2YRINAL1qPyKJcFMDWobGzhIW5BYpltMrvdXNMDo4AVFJezC
         sdDVJDiqowlL4NqIL/Q2xJ8+jWxPCXogbQ0LaC8dNwxOtJkB+jq9e2qPKyXiJwQSwn9E
         7yoaSV/oiS8ktQVet0mk8xpII5GJUAJftupQZzeNrrowWw2hPwHlF0rpEg7eixTx+C+B
         khEfwsS+8mCQ3FZxC9lKznBjUCwKxW6+DSGRsYCtRMH9vMozAT7oMglq416pewD4SkpW
         iNUDHU1RknLHCtBlxImfJxpI4dLdBw/KULaCT4BVphXn/OPy7LqWrtSpmkxEeqjcZoJr
         LxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887253; x=1788492053;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1E6Kcf/lHHF0i15AP4vDC8gxkj17C5jINRJ/Q9+RblM=;
        b=koYBM0RJ7o89ogWkJ9rrd2bc0JxKt8NZgoPsqzp4J0wRpyQDE+pkL72dd3hvgMWKAI
         mxLyknouYAvJG5E/Xwfk26MfKDgrbPNWjB657ezrNvDjVI8XFV6Rnd4bWvGYLBdsZ1Nc
         t1tAO7u04p5sdHMMvXoAljOkNGjvXPJt4c4MtmKosOYC1r0We7Oy/D2uTpP6bfNpxS/K
         55mvV9Lkfo3fSBwFkNvis+vwVOOp9W+o8bXBlfCZU2cJ2DnS3wlsgZ14rkHhYLKSnZVj
         C4Wdu6XGkS0yiaVKwcAv0tmrOMGEEXl1i2h02SnIooJj7PH1xCZTOVte8zO3vnVxTJiw
         yZ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoGExM9zH+aopuy9V+h1ATwGwEODiIE8kUeV3SSDBzEZs/fv9YYmc4YyFOrCkwcUI11pJ9nIVBI9LLbnS8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKh/VW7hArxFAFp3ebo7baCI605CUIRWaxGIIW1tZDQG6Zibdj
	FoRUsumdmxJPdhSbQGxDmY4EEeKMTZShx1ZYL6mJ6dFQJcuzJixwICoST33CsmLuFToYeTzWx4p
	oP+NNAEvAk97icJSlt20AcjihSI3mMS9mI0eDwHx9
X-Gm-Gg: AR+sD10imMWn3ucqbB+B8pRIgjEBMltfmWKyjKyR0e3SXyHZOu/0XKUDZrMAcvHOvsK
	22AziCr8nGc0bzluz5WePl777faIwugFkFAa3qiulvzIdM2xO3Z5hCQpl4ZgMHRCxkUZzs+E0w1
	NS02UgBklwayO0B1nlKkC8cnkHsiLHXnE2syb9/HWoOFmMTQKe58nhlBemb+ukvWuEWDq7LssmV
	/inmY2x8w4OoV/e4+lmrTJtyhEa2enzFnt2eQEDhVEtWOjHa7mVK9LQLrl05UTAnq8xUKDxSNHZ
	fZsP/jgo94IvNQIiQ89auwKKHa8aIsa73hahd0J1IuIRVSrFH8Y6y4FHTVRXMJaioO0Apv/AXGT
	6ob7pT0bisUyUKpZljiER436vL4vo7ZkFDny63i437mo=
X-Received: by 2002:a17:903:234d:b0:2ca:660:b1d with SMTP id
 d9443c01a7336-2d74ddc6daemr57509085ad.11.1787887249023; Thu, 27 Aug 2026
 20:20:49 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:20:47 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:20:47 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 03:20:47 +0000
X-Gm-Features: AcwNN1X0Png3mCiFpg0qr8t12Kvqb0UYEZhWDaRDZfSHDZploBz1NogzadCsAoc
Message-ID: <CA+0ovCj6dDADF1Q+qYyFCk+X1ZeJDaBrz0FzTqMbnsH8OnCeYQ@mail.gmail.com>
Subject: [BUG] afs_deliver_to_call -- ASSERTCMP when a server returns zero capabilities
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/131-afs-assertcmp-zero-capabilities/

  AFS: Assertion failed
  1 > 2 is false
  0x1 > 0x2 is false
  kernel BUG at fs/afs/rxrpc.c:572!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  Workqueue: kafsd afs_process_async_call
  Call Trace:
   afs_process_async_call+0x82/0xe0
   process_scheduled_works+0xc99/0x1900
   worker_thread+0xa53/0xfc0
   kthread+0x38b/0x480
   ret_from_fork+0x514/0xb70
  Kernel panic - not syncing: Fatal exception

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
