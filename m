Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D29032C942
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895895; cv=pass; b=V7dwKv2egAw+jlJwXpD9H8n+KzsO4i0zjtu+vRyiQOLwTmNU2Gz6tYtQRsRwfEClkiL55Ow+qytt/uUKYTE13k2QueF8a8Q3qpoYTAmEBC5datSF670cxd6y+DJtS4nd4D6wgxgwA+6cOGUhRt0OuI/H6K39PkkKPU0gReKonnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895895; c=relaxed/simple;
	bh=TyNvMMqIrDrrdQrNSTAkjwcw9uAfd2HiNJdpFGlLXMw=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=DMy1NUgSbo8L+C3GOEfaeFJ3HvdlvbZeqlPslo2YMl06UtT/YMtXIBGVecEqc/bHaM2bJb0aTk3jl7SsHltK8wCBJRnaS6/HUnKL1vQSh1OqgU3iFCxSb4FbKwRF+oX/ItNDsA991mfP89qUzGK9m1lUV1w69q/kvcKG56Sri9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=nZewbbOn; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="nZewbbOn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccf2360620so6087415ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895894; cv=none;
        d=google.com; s=arc-20260327;
        b=OpYEvOU3wvkzT57s787f02PDGEyhmHzPhP2L04AGmBcCdoo7/BY9GePFfo2m0mgvZn
         WxChe6LzaPK+Hk1yb7K68+MltTG2xVFbvAIpLGGF4tZSWF8+VjgfHcO/aj/RPuSD/hlI
         WiE11Lh+kC7xHSzVIQzokf+WGhHmNh2uCAMNdeAScX/qJaaAU7l6HIK5XQkNS5O1XykP
         8zJwMqrGv21A09wEBeiuM56Zqo6ZPK7UgzOSq0CobNU98YKHYzrpwh7bkOifBvjRaevO
         GVue8joGGPujlOIyul4fbcPZHf/HuXebNt50BMxQYbiIUbN3ug6zUHzFj6PJSFbbGea1
         ViRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=GlVbWj9nJs4r3HvjeZeXaQSMdk8WIjeCxs6FsayvhQ8=;
        fh=qiLKHOne+4LT5hl/itSgn4HaY/FIOC/mRTXI7gkfbFY=;
        b=OTPJNpC96DJXbmNguSeszfXGMVxZk6KOABs6KOqowfojE5szdt7dMm7o5eonbC+cxD
         5TSpysXnx9+GrreOXzM1yYxxl0+CPhhdGkedwGatW16ILDkK8Y+4nz538LR8JaUnKUR1
         MbNn4DR3foypfuw5rh5injKIgrHJvx9XUJKLSA2VkRxx68l32ZZuxkYr0niYpQPaKFKk
         KzUcqMeqiHn0b+bIE66+XzhKlckziqIIL2b7+An9sm8Wdpc/F63IJyTGTB6cPgB0G34v
         alm+vomRXXVuowcODB/tkt/IQwHFcgGB0Gz3MpvmQEvSzY4rNUNHinDjCcSStF6TV3ua
         y8Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895894; x=1788500694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GlVbWj9nJs4r3HvjeZeXaQSMdk8WIjeCxs6FsayvhQ8=;
        b=nZewbbOn14tQBRrQuiwSJTZ08OlAxVu/MDYknSVUwuOVFpZwJR/OyArHF0NZfnskn2
         OFVwxnxrWUjsqgDy8WVX1YGuYb54IcYDpQksoyJSLX14QiIHYmgplQiS0ub7k0z4Xh8f
         xAHFG4J4pcee3+sFqNMgTaIMtVMkN8HQ5UMxA3ohjLxAIR+ZIIIOdWvi8sAGjtUZKAT7
         4zUk1MfgW3/ADkp4iiuAatVsk19EhqxT6i7G+lu2hd7NsGApUsWQFGDJ6GDZD5ivwXvQ
         7MkH28H/prhSeuTrCPlNBumEgF5HC40HacH7iC7Z/PAJG4lrRm5YylBbzpm5prmyVhXl
         RsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895894; x=1788500694;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GlVbWj9nJs4r3HvjeZeXaQSMdk8WIjeCxs6FsayvhQ8=;
        b=EbWKOxx4cZwt79gmoVe4gNPqLkalngMrWfnK1FqNcNUX07XMnz7oT5kuB5OWtPvaoK
         3Z2vMd3k+qb0tHqRwB8dxFqyyYtrMmWIuPOr8QE/okuJsEhiNPOBQxGEvAOlcay1fPP3
         j4wFRizjS/wb+PjEOwoTaFoUXlshX3gMj0NbWSUEqegIiqvuQfUVt8/gWmPuVTqZUe4h
         Oobr1s2M8Iux7bP8RPzru66zcZAHI9134W0jq0wsUglZ1jyeNwdURucYDid6+o4aNtq6
         LuSmQuyv7EPGM/D9WiKmwbBXch20H8pOlaxjPeSaYlXFqIwF7r8jg/cLrlBd58HlmMIs
         x9Lw==
X-Forwarded-Encrypted: i=1; AHgh+RpFHs/6Ma9JrHiN3489rVJnpkFU3mQhTskXe5b7qClx75rH2nvT4Q8FpeyMkTInlc7FmP3lLGBxCTI6FS4=@vger.kernel.org
X-Gm-Message-State: AFuF++m2CGnv3j/+wtVh1ZAPVtMlA0z0NKAcCMVAByHivml/FEraNnID
	/9QrQWxuklj6v+sCYOdeRQFuELjFYbTF7/5tXPgx+mFMcC6EO/6Tdl8J9bhqoObShY/ic7wb7mi
	khFBoOarjPndQyDG9xmxmYNk3R1AlHFJHLULsd6Lq
X-Gm-Gg: AR+sD11fvaD5ff4pqXWJCDvLWO/HMBR8FjGQvYlory1DzqZE7/KvCDup7+LyfaqlzK+
	VrM+eNfwYc74QVn8tKbt3y61HxL5Ghgi2hvMaREb0P/t5QtFOT+4hnp2CLV+ilU2C6uOI11xUs6
	1APTVBkcZFzFHKI2WXfTqqlBmfL+HjjgBWYIM/th6XjE77jiDmJaeYcZnnV/lDX9zDJnajN/YO7
	dtyCLjp2CeH+VZGwZ5oAqnEHSIkyzSWXubr55WyPsG/kqoYwyEV+jj+kthkE4AzchA2D/k0zHVh
	nxaMzMmTamWR55IRQ8TM0Z/6akm2EPLa1Q1LzHVgLY9+8ou3qU+6Za/Og/PGzF2cTK72SRY/YKy
	WxMgCSAL/iclrz4X1uyEy/VxzXQKcavV5
X-Received: by 2002:a17:902:e74f:b0:2d7:5ebe:a588 with SMTP id
 d9443c01a7336-2d75ebeabbbmr24264815ad.13.1787895892791; Thu, 27 Aug 2026
 22:44:52 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:44:52 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:44:52 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:44:52 -0700
X-Gm-Features: AcwNN1X8SEHOkHuj9cQDgmFe2kkXov2vM2emNM_BCi0ltZI-VSEqYIh1j3pwqxU
Message-ID: <CA+0ovCjLWPoUdo=W93DQ4vKj-A+Xo0AQkjzcM+SQ35ph0VzukA@mail.gmail.com>
Subject: [BUG] WARNING in ceph_fill_trace
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, ceph-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/171-warning-in-ceph-fill-trace/

  WARNING: fs/ceph/inode.c:1632 at ceph_fill_trace+0x493/0x3a80
fs/ceph/inode.c:1632, CPU#1: kworker/1:5/11236
  Workqueue: ceph-msgr ceph_con_workfn
  RIP: 0010:ceph_fill_trace+0x493/0x3a80 fs/ceph/inode.c:1632
  Call Trace:
   ceph_fill_trace+0x493/0x3a80 fs/ceph/inode.c:1632
   handle_reply fs/ceph/mds_client.c:4050 [inline]
   mds_dispatch+0x4753/0x77d0 fs/ceph/mds_client.c:6384
   ceph_con_process_message+0x14f/0x530 net/ceph/messenger.c:1425
   ceph_con_v1_try_read+0x2f40/0x6f20 net/ceph/messenger_v1.c:1430
   ceph_con_workfn+0x1f5/0x1440 net/ceph/messenger.c:1577
   process_scheduled_works+0x881/0x1170 kernel/workqueue.c:3397
   worker_thread+0x988/0xde0 kernel/workqueue.c:3478

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
