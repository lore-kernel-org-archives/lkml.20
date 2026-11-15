Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768342;
	b=kEr6WVuVOxJoK+qWKSEBw5tthu6gw10kfpMYlkB8Fz+byl1G4QXh82CWC/L+q5vxBJce
	 a/qMsf/Wt/4HrH/gvikWi95r5ttkBDB+QmAZ31TdctAAeuLGJTyd/yFb2SREGAhK4d179
	 dl5E3LnrwLt9fPDDsdCxCj7kaHcGY+2WYrhxQZftpCnelSao9CrsDZgPdPKMTqZtKH2iW
	 AD01Y2b/J3UB1EE3x0Z6fFQvze1WKmK8qqcdnVY7QA9lJoQGwcQxY5CHV7abLw/gOcnuq
	 u36S+c6/7yS/z52zFaQ89XDfaUuWWYlND/nW08oz5qDElzQsiDiBuA3xE739uxg8+0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Kvx3OD4ToTTcBE4UmOeEbrjq2RxGIJgBoPuswUMpJbo=;
	b=2zm4v+VUIlvO/pabjMOo35/zU6WyNHnsMqUGQ4TfTWO45uHWsgv7wroXAMN+YxnfF8T3
	 tO4yJWZQgC+4myqvsm7KPn43RfaAn8tI3PfiiIbx5S5xJJmff+lw/emqiZuke2hBK4T4R
	 jDLP286E9VLyIGVL9T21xsoflUd88nLj6OWpI+UxDVj3g5jiLMfkmax8pUbaSxVfofZw5
	 MC3oOjVPfCIm6XrqTxgV5HNPtP8jYUle2obKMwQ0ZkzFG3a+k7nfb/qJ965paPOYuA/3W
	 N4vxYsxqV40KP2w7b883gpEf49cuPawx3ZIZmztXII9v+TNjEGOd+V2nxL9lZZr8nXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AZK1oJzl;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AZK1oJzl
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40f29667e6so488120666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794768340; x=1795373140; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvx3OD4ToTTcBE4UmOeEbrjq2RxGIJgBoPuswUMpJbo=;
        b=AZK1oJzluee1pt8ew+FJbElyQlQoyCtN5x9nac3gtsssf67Touw9OSNDkxMf+TRXq4
         PaG6Df1Z+bNu5Aw59bmTLNF3Gwx2OQDtrSlT3NR21sVeQy7QiwPRq57NezQbjcnPe/hk
         OuZ10/4uUrGwR468g0qYK7rR6h6V9fhZ2f2JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768340; x=1795373140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kvx3OD4ToTTcBE4UmOeEbrjq2RxGIJgBoPuswUMpJbo=;
        b=gHn5xLRyrbIpEHQzzkyYCNkhXcYiFW4tFkeFWLDEd5iemO8ySpDBzAX9cHOJVVAtVL
         sWeYU2JLhPf6DL9+KZOEgkNjC7+x+09jw8lulnhX+8JLdLPw2asS3lpKqAm7laXE38P8
         KD7QUaStyfvpmT3a47sI6kvGxHXbywrstxNysppiJKLU6tSETwGk9ISIe9tY9VIA4qB2
         AkGT8MjFDGPMSHnnjojT5XzH1LQGP9cktWAacE87tVDAR9020gJeVWiaXe2gS7gfKH9y
         +ml65o7lHxz38+5qNSqGwFVbG0igtT7RnOLfC4DHyTmgO/AqCWmItuy8SNUNCxIsJBap
         RSxQ==
X-Forwarded-Encrypted: i=1; AL+hErHv0BLTbWn+6wzIdSgBZu31PxMjV/oeZ7lyDMff1JKyYks5BvQ35+tZ63xzHp3qyh+W6Vlc0rohaYkvr+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lKAswtukHIrcKKaFta6HNyXZvMUPUbMAyCV7sVkiU1cUwvjED
	+IIQldro0r5ttVXwb341kzvqWiA82F/F5LPjNaOynFx9QT1YgE3J6scP4Aao24TQdWOsKaSJsSR
	giGDZri9odg==
X-Gm-Gg: AYBFou2kGNH+DKVtS7RWHbRFxQXoOA3YCcJBBcgiQUyVW0YyQ+z1pW+f3Gy8Kx7OyzB
	l2j4EChekW7HQbV+tjQV9T0YNK0MMLZu+iZeorqpn0H7MouidMXGQg+YX/5vUsCUTsevx/OS4Vm
	lFmixScuB49fiijfXwb6dpGCbUA5wfqHw8Psd+WM+O8lBezVgNPqfcWBsZ9BOhao2CZvYKSmyUe
	x6cspTVTB/pFW7eOn/Z6OBbsg/qbCfpwm9trbjTv/ZeRkroJ0mwa1araQwJTco/045hz1ms1j/f
	hgI1qghFNrmCNBqzG9lsIBmD/t+4RpmSU0Btr/IMcFVLwHzna/7fUp+aftXAxkLrBtOa+R3pn0v
	t7zNCUIk1MyAWo3u5kgdaelMaNT4b8pZo+tMwa4EiuZbjh86Cb/fwiZXqflqWKUWcPsjTjLen3q
	+Xs7+2+TXCg8omdjwtfHC9fTHiB2W8W01+39Z9hHNXfSLSn4oDXS/mloOGbHgaPgee/ljpQqPgf
	DY8tV9f5kq0DfuNMwBlnjeDLjGryVc4UywcbV5RckqvoqNG68m9SGqaRQPTnnEVyoWWC3aEXvd1
	kZ6Dk8L7KgXO0cZiH2Sj/nyRsXA47Qp0caBHqDzLxNrxU3Xiq5El9UFNh4nmLoydLvU+fmlaWXV
	Mhlo=
X-Received: by 2002:a17:907:8e08:b0:c50:4d71:a85d with SMTP id a640c23a62f3a-c509641ab20mr581211666b.32.1794768339636;
        Sun, 15 Nov 2026 10:45:39 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23afdsm329796766b.13.2026.11.15.10.45.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 10:45:39 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so488118766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:45:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHST/V416Fw7ULAeewgybhhYnDg4iBL6kkOFtyuiHdJNsKIIaEAzJ7q17yj9D6wAwpRjWsn5sFE+7Uc22c=@vger.kernel.org
X-Received: by 2002:a17:907:3f91:b0:c42:102f:15d7 with SMTP id
 a640c23a62f3a-c5096398ac9mr616132066b.10.1794768338502; Sun, 15 Nov 2026
 10:45:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
 <20261113141137.1113517-1-usama.arif@linux.dev> <20261113160300.3f0d0a37@pumpkin>
 <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
 <E9C129F6-61F5-49CE-8948-064DAE86EF4F@zytor.com> <20261113233703.GCavefHwxVZX8mGFCm@fat_crate.local>
 <628BDCC5-B599-4B70-B512-E13DEE926DFA@zytor.com> <20261114224504.7574f7f0@pumpkin>
 <CAHk-=wj0MtJpBbwNr=NGh4kFPM__Wf9Hq+LZ1Qv1Yv1SCpjaLQ@mail.gmail.com> <20261115124205.076cdd63@pumpkin>
In-Reply-To: <20261115124205.076cdd63@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Nov 2026 10:45:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNdNjA_=POY-jA2ot+KKTVJ1-b7Xv_bwF6ehF-AJMmQQ@mail.gmail.com>
X-Gm-Features: AclHuK8p4cZJbhEZ0PGVwgBPKTtu33HQbdjBts5W6GrmO5Q9ctqC9Uji-GNnwMs
Message-ID: <CAHk-=wjNdNjA_=POY-jA2ot+KKTVJ1-b7Xv_bwF6ehF-AJMmQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
To: David Laight <david.laight.linux@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Usama Arif <usama.arif@linux.dev>, 
	dave.hansen@linux.intel.com, dsterba@suse.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 04:42, David Laight <david.laight.linux@gmail.com> wrote:
>
> > But having extra registers free could help at the call-site,
>
> There isn't much you can put at the call site instead of a 5 byte call.

You misunderstand.

Avoiding call-clobbered registers means that the caller has more
registers live and can do better code generation.

Making the calling convention clobber registers that aren't useful is
*bad*. And if you do a loop - which you know is either large or
unknown size - and take the I$ hit, adding a couple of push/pop
instructions really doesn't hurt AT ALL.

It has nothing to do with the 5-byte "'call' or 'rep movsb'" instruction.

(And I realize that 'rep movsb' is only two bytes. You'd add a 3-byte
nop or harmless prefixes to it depending on which decodes better)

             Linus
