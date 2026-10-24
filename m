Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792867571;
	b=Fo7c9Fp73+EvGjFNCJUl3eTGrslMi2l78Lj7scD8TQXpIWPBCtDTIjI7Dxoix3lPHcDi
	 EfOv8NulMJWibkMdypgCoVMMcjkimRX6M1PmETcVDyiDjNUCXKd/KPYgFpiOZQ5fzsq+M
	 CO5vBSvUMUG7RQI2b1k794c17lyaMTTURlFOG9RGJ2U/1aru38gWtGPr2h7FXpNvSSTJ2
	 U3c1OEPo2HpKfNGPPzmcKMoBm/v3HxoOX+6jVVrdLioJxf2LgIn0D5kKPrh/Cfo6a3/c9
	 Ux7coAPCyLRHfFJcZG9hSmtRHIIEjHtDeRZiGKJpEJhxEvQPy/MPzTDmdy/IHdLGdkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792867571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=os+CpApFAeFMQFmoyWApV92IYG427+6BdGY0Jd+kTAA=;
	b=Y/0x1MJaIAswwJyBGfFe3S51HRf4PyiDG1LnzqRlT/WJhYnikCEAwQE1GsBkwUIXD//C
	 7//GCU+JHmy6LTdHDylTwdhGp+0IRFHZYLrTDPNRSDx4ZjwYHT3JgdarMziaF4SVYKpLv
	 N3MhVSTRBGftHwtb/E9EReyr6OWcKAFn9pcCHMnA+Kw1N37wR4xN0U9X2II5hMTs933f5
	 PjOVqer1+/Bl8jSWWRKE4gtM7sWTJwufdyW7x6MkbDGkCc/40m7yqsjfUBSEpuxYabPv+
	 kPvYoEGacZdMNNKOU7XMMoBS5Mr9NImpGjDm34jPU9KDjwV+j/dHS6gAruFpTgvHBPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JlCvgwFE;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01243606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01243606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JlCvgwFE
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2acc1e170cso260722466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792867568; x=1793472368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os+CpApFAeFMQFmoyWApV92IYG427+6BdGY0Jd+kTAA=;
        b=JlCvgwFEtJmWven3RZlWYJVNV/wI8QiKhnv6L8OdjttpmsxQ3YqwRTrhfOUraRHtQe
         vNaJ8ebwvLE+ayX4JoPkuPrRGjReWjqbOJwFxrYflLxeKGQITSyVxpdfCjHtkO7SlW1L
         SwcRKkNlHL5qc9JQM1VOxJLGcAdeUefzFL2ZRiz46A5vRekSVtkg1rhG1NRzYegACKGR
         4nusgAQpMuRhywl/nIiGcbM9E7oUUDwbNAjdz2Tx0riuIVgATKXimbyraW85py+uVSRo
         fr4jmsWq/mIYYYZjCQiqjbv6TaFydtu52bsEYTcPHwQzCOM1a8qVS5G7JBSQ77PvkjDr
         A6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792867568; x=1793472368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=os+CpApFAeFMQFmoyWApV92IYG427+6BdGY0Jd+kTAA=;
        b=2rsBst9snxMEUAMMlCY6cZBL3jzYeX/mkbdvqzfI6wQH74Zabiq40Rb8ZZXPu0Y1pq
         f4B38UGp7lK6cMH83VIR7XlAhZD+hYdLuETIEhFYE+r8wAQmwrN2wL5fWfDhVwDxm4pL
         eArJ1vbOgGZax3zSv2TZL1A92eRiMMnurF3TjHsnTWu5OOB0nJOZ+EXd9DMvPX+J9okh
         oBDFgHvSONpFkZ4tb5TuDloMf2iUGvMFsveAorIKdNOwSdqZ7cKwikas/l/F21PtiKKm
         FW5jbNw/rUxd4B8ORTE+r0KCHlWlKJXVGViyMWX4gVOFpI6D53zdc8+S0DVJimlZZ9OR
         2rCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJM5P9Qnnyo7dKck4FdcWiVOpFfeHIxZ1+4/wFsFIXwViQBMXflCtIwZGb5mG96/CyFGeH8jrb4KyAMeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjvyaSAzPNCHQjfDuteDPlOUGR5jV4RihdTvSPf7OcSCkjHhGZ
	p76J6NGVb+99eQiafQq8zRN71FKE2XzJpfmKJ6Gkd6RMKOmuaHRBUaD+
X-Gm-Gg: AYBFou20pBs5wuc6j/RyRvDdpHcsGQjZG/dhF0dGUGy2L8oUCgiKPBQsr/X2EqxWAJR
	8IdRddwr4GI1L26w8OCY0dWCYRtjj9xAFEmCqaXzXCN6N651czxEbzSubIqW5OtPqxgu/WOxj0G
	ZNPCiJ/fV9aRWGFb4lV0k0LJAmBj5JLnJ21hD0tKKvBR+roHMi06d834H1FszpmBoONlQvUMewK
	f8j/LotITAFiDmSS1R85Nf06PgiBh7eBpbMLjWG2/voj11d0+Pn1Ysp6VmlSSV6bIvCP3V7VEXb
	a9hDm81X4oxyK9NBtBv1HG1wVo/edKkVeiegCKIzyqSazUi2dduMytkOhRY06lqbcZpVxFPZr1I
	v2H3L5Fs8P60Lgz+pxFA3QtnJpJmmxaFhdxdA3ttcAzg1dhjFhsibwps9umifnSjmf9Bh52Gg3r
	eA6TKpDihMvlqZ22WLcRAvMuXYIBoXyqzPfL681shC0usnogXi8PpCQv7af8uN5bWuoVgeUmhSs
	0fZBUXRJqDlgvx5ihCpvutIW9/zZj5GKNfxpczQuPU2leMemaRuErzUFRMoFDhI96fRhXJS6HmF
	6NXQSuJxWpExD3whXsb5/CYc+UqGNbN8Xe8nq/yRdtHJa2Bo+cmOVrmaxY+ln6myxkWf7Y8Fi8L
	IrB4yA74RKrjG
X-Received: by 2002:a17:907:930a:b0:c2d:ca32:2176 with SMTP id a640c23a62f3a-c46bdc2abbcmr300585866b.8.1792867568098;
        Sat, 24 Oct 2026 11:46:08 -0700 (PDT)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e7c94sm117451666b.27.2026.10.24.11.46.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 11:46:07 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: pc@manguebit.org
Cc: bharathsm@microsoft.com,
	linkinjeon@kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ronniesahlberg@gmail.com,
	samba-technical@lists.samba.org,
	sprasad@microsoft.com,
	syzbot+c2ec61adfbcb24e5ec20@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tom@talpey.com,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: Re: [syzbot] [cifs?] KASAN: slab-use-after-free Read in cifs_crypto_secmech_release
Date: Sat, 24 Oct 2026 20:46:05 +0200
Message-ID: <20261024184605.44432-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8bb0534e33a5f5d152d2b1768d1fd7c6@manguebit.org>
References: <8bb0534e33a5f5d152d2b1768d1fd7c6@manguebit.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Paulo,

On Tue, Oct 20, 2026, Paulo Alcantara wrote:
> #syz test: git://git.manguebit.org/linux.git cifs-fixes 

Not sure if you already have verified your patch but
In case this is still helpful:

syzbot has no reproducer for this one, so I tried to make one. The
natural window is tiny (the demultiplex thread only rechecks
tcpStatus when its 7 s receive timeout expires), so I widened it
with a debug msleep(10000) right after tcpStatus = CifsExiting in
cifs_put_tcp_session(). The trigger itself is simple: a TCP listener
on 127.0.0.1:445 that accepts but never answers, a cifs mount of
//127.0.0.1/share against it, and SIGKILL to the mount after 1 s, so
cifs_mount() fails with -ERESTARTSYS and drops the last reference.

Without your patch this gives the same report as syzbot:

  BUG: KASAN: slab-use-after-free in cifs_crypto_secmech_release
   cifs_put_tcp_session
  Freed by task ...:
   clean_demultiplex_info
  CIFS: VFS: cifs_mount failed w/return code = -512

With your patch ("smb: client: fix UAF of TCP_Server_Info in
cifs_put_tcp_session()", fcf942f9eeca) and the same delay at the
same point, 5 rounds run without any KASAN report.

Tested on UML (x86_64, KASAN, PREEMPT) on top of ksmbd-for-next
4623da395dc4, whose fs/smb/client/connect.c is the blob your patch
applies to. Without the delay, 50 rounds on the unfixed kernel did
not hit the race.

The reproducer, run as root:

  import ctypes, os, signal, socket, time
  srv = socket.socket()
  srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
  srv.bind(("127.0.0.1", 445))
  srv.listen(64)
  held = []
  if os.fork() == 0:          # accept, never reply
      while True:
          held.append(srv.accept()[0])
  libc = ctypes.CDLL(None, use_errno=True)
  os.makedirs("/run/cifsmnt", exist_ok=True)
  pid = os.fork()
  if pid == 0:
      libc.mount(b"//127.0.0.1/share", b"/run/cifsmnt", b"cifs", 0,
                 b"username=u,password=p,vers=3.1.1")
      os._exit(0)
  time.sleep(1)
  os.kill(pid, signal.SIGKILL)
  os.waitpid(pid, 0)

In case it helps when you post the patch:

Tested-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>

Thanks,
Michalis
