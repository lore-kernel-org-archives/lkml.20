Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EF3AB47E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871867; cv=pass; b=RGN+x/k8M9f8DqsoxjZWWJk8TRcqSaVKYkul+Ehrg+dlachOzTTsKJr0POsQuZUFlB2QfnqQqP57JTcfsB3aaRtDU9y91N0zw3WLnjp5viF09+egttzAbHK2lfTQi7BLBaB1n8BTfZ7PxRH/F+FC7ZJQMblkL6fYLiJxH8QWsmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871867; c=relaxed/simple;
	bh=QsepCMeiTbPeNVABwKQ4kjsp/vlAuUKCw6UJtp0V5xg=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=icYm/x7kIIMOevXIrfeG+6ic4t7XIREkWApnRy/1x9p5qIneGwWFkriqS5L0dRE5AzEzETh14DT5eeupImq9gZzmuxkfDihAwaWOVaJNKlLM1OepaqVGz+Gkurey9moevvk60dDCxd5f8KWiCUl4xEud1SLQHO/jHoK20ul0RlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=FoTS2vbZ; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="FoTS2vbZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6f9e2f681so1625115ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787871865; cv=none;
        d=google.com; s=arc-20260327;
        b=bXWDLEbq3BRhXlO/9PqN0Qg3QWEe3QHrlsf4HkVn3mqo6jBQZnGCRPwJfQPEi3MFqU
         80TksQA12G1u2mnUdHLdquMmuV207+xuCaDhxG+DumEKwshKCR5ejdQPWbN34IGdYCs5
         ETzk4xBQp/ORQCxUeZUMwIFWu9ethZCVvszGq3mYvWKRNebRRODnWJJwK7dV+Bo5Elxy
         oMKetDziTxakbhCTlKRDHumVgS7ZKggFYM2L5RXh9ML6Jme3LSrlU8211WM/cXToO8ax
         Nt561T2slU0n2R0I4RY/3L6jCiStX9QG0p5kJWTw7FQ47UjBFhmoDQN/SlWsctxt2ro5
         tb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Y8w8/99lXpipXNugsU1jjmc1wW/tCaLOM5DmuIqroZU=;
        fh=Kmd90z0tXoDIX1Rxei49WJ8/1QSyAzU6RBmfkNEqqmI=;
        b=R+U11sSuat4R2PYVEElyjKyJQ0ZmWP8XAjlPEu85sY3AHpK1a6Cs6nakZI4xCZQqSL
         Z7GJowrgYy77Q9CWDg2G9RxQekS1jEsD0ciAUreHk/Kmz1K9UGN7qMh2QlpI5oneyYo4
         I/zKnOpJhWCGONBaaoDRpsOmA1YKjiIgC5HfO6nBQJGhVNdHOv+e32GlDr6r9ONZullS
         Lnmi60YX3F7vJq3sUDiZ1uIZVokl7HP/n1B6Z/tvdN+xqOTnXsc8iCNBk6fdDWwB4Sgr
         f6iHUNFCElF2zP5XSr8CbMMI5X+AOrvokv8eDmUrk5DlBzv9rn4g+uB1CkZVE8Ho2zHD
         hV/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787871865; x=1788476665; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8w8/99lXpipXNugsU1jjmc1wW/tCaLOM5DmuIqroZU=;
        b=FoTS2vbZkRRkjDB7EBc2nKiRYa8AMVaHEiwtyo5oMzraRznkyCAEb0otyY8h59nEaA
         1R3LeZV5eR9MYaMRKr+upM5/qFfN8MZGx2zSwIcNHjq1XxoXuYP8YeUvOlfeKcTefCGf
         qsQiYJFTLB/9fiVhmp6M2nBDasdSQdJS1OIoKX0C0xdgb9NyQ9un6lsdufkG7ye2VlLZ
         V2K7N+3A7ULImo3ee/pqtjJxeVt4WRlLrp0ccWWvshmsgES0Qk3unaUSF7/uJyHmF+iS
         k0Nf6fk+Y0W4wAg8kpPsfqoYU5X5gqTAKIB69g5u0cOmKC3dvLGHYLVX4NrQsecUuaF6
         ngmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787871865; x=1788476665;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y8w8/99lXpipXNugsU1jjmc1wW/tCaLOM5DmuIqroZU=;
        b=AGZJZfKT55GYDS3fWCHyIOpOu0wP4270X/aKB0Mjpt163EmmPLN3JLs7iG+cerY+cD
         Mxo0vGzWLHypF4rRacshmvCy4bJuOxlKFGSfz3zaZIumtBkwXB2Tm0MS209BKRPnKPVc
         PlaU+kxZLZuVv9tVpo6kKxZMXWXozjHgQLrzNfTggQeyR0yNVyHrzZD+XA6OveD/V2W0
         1VJz0p8dYSNQtieF9sBTRRLNvo7Jnq9h8JhL/p3NtswMywsMJ5OjvIq/4YIUDgTSip+E
         JF/PF9Di8+9y1NO1cRFyZ91xkiYbnfHNJrIYfbYlxoXIlIEm2VFmk+hfc8tosFoPzp1p
         98Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rr6E/nL0zLZaHHEKiuC3PhIAsWo5ypEh886XJMvbR6RS8ykMFPSs6VjG8pyJJo3jxD5FK9Yy0DAcsTlq94=@vger.kernel.org
X-Gm-Message-State: AFuF++nfHkgar8lXkGIwghJZyB1tTZyXoaz1/YizVd8uxdVFlJ656hXB
	wk+7Xy3aqcAWF3cHY28MgKclzz1NreKaDRdWWedOik8EQ9J7g6VGx6+MrUxX9J1eGcuGOBr4/yg
	Mjh0BxAAxYWI6oHXizWA+Y5uP5AhOSA5IUzHPj6/3zosKQUAEQmDAbg==
X-Gm-Gg: AR+sD11l7myIrPRmM/E35u/LjIkWPGMCff9Md5UfaDXSmo4Dro8M2gmIE+0SOK4RY2Y
	xYlHAfCu5vokfL61Cc7UIfXn8f6hh86hOty29sCXi0wkk+ZlNko0TJB0UN8kyK8seMOYFE9PBGW
	g1kQtBwQKQOdZ4G5spXDfE01BWmouXbNH3TH3CSpAP8Rn3CBGy6jVgRuzrWbwrenNV4itvdjPfh
	WJXki6Ud3ytj0cESWyCqlGNgfHSWtTvjN/x05ZhrkKDzWgfKO6Z081LPseYtqpw8cAujZzL5HCu
	LtxUChvpDoEynF535TUFfnoWkjd2kR25tpGsTRFiKrV7s6486zWv0hpNeimQDD6/xDbbeOUknMV
	O910WJFxsgatkENGwxly/U5kiokYwftBO
X-Received: by 2002:a17:903:3884:b0:2d6:3c22:993a with SMTP id
 d9443c01a7336-2d74dbe96fdmr48838025ad.3.1787871864030; Thu, 27 Aug 2026
 16:04:24 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:04:22 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:04:22 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:04:22 +0000
X-Gm-Features: AcwNN1XHtToPPwTQkHjpj925zF940Qhj869Qi77Jaw0lF76Q7nZ8RKTQuP57Vc0
Message-ID: <CA+0ovCgU4Y17ERRdtCydW6aVUGiYDMs9Uz4TEJoMGh13oEJQvA@mail.gmail.com>
Subject: [BUG] bcache: BUG_ON in bch_prio_write()
To: Coly Li <colyli@fygo.io>, Kent Overstreet <kent.overstreet@linux.dev>
Cc: falemi@asu.edu, linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Coly Li, Kent Overstreet,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/115-bcache-bug_on-bch_prio_write/

  ------------[ cut here ]------------
  kernel BUG at drivers/md/bcache/super.c:660!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 0 UID: 0 PID: 16493 Comm: bcache_allocato Not tainted 7.1.0-rc5
#1 PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  RIP: 0010:bch_prio_write+0x10a6/0x10c0 drivers/md/bcache/super.c:660
  Code: f9 e9 b1 f5 ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 98 f3
ff ff 4c 89 f7 e8 e5 62 e8 f9 e9 8b f3 ff ff e8 0b f9 80 f9 90 <0f> 0b
e8 03 f9 80 f9 e8 ee fe f4 f8 e9 0e f2 ff ff 66 0f 1f 84 00
  RSP: 0000:ffffc90006657a40 EFLAGS: 00010293
  RAX: ffffffff883dceb5 RBX: ffffffffffffffff RCX: ffff88801d0c9b00

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
