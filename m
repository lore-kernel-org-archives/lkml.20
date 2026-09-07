Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878B346E55
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816668; cv=pass; b=BzUZALtS5VqEiDBdgrzVCtZvFAU4z6kX/NwDe1Bd2g+vusCaXhwu/05hPDdKcILhzyY0VUS5TlQxON5Ma6MTA93J+o7MrtSvXBmTDNJbX7yDWTuZvw6meL5ZLbr0ySvJt/tGLpXPl1iSg1JUchHRMug5eMZHBs2bIuL45k0yLdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816668; c=relaxed/simple;
	bh=KCfQ/o2jQIWmDhYUMFPoTF8OvDrs5HT3JWRI8Lf7DuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsHCG6WaJ3UnsR2+fQ85TSENiWd8XpBGNJyLjmYG9lL24GDREEjj+swEH79RqSD+vF4tqSll2YT6Ex4BfCbqWCn9J3yiOJJgcq2u+UXxAMqoEWBp2QOi1oImnoqJnhYuSwn2QH4VALvkK/91DMo5inHK4fYC8cVC7vkL/5zQu+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LpO6jbpx; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LpO6jbpx"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca07so166545ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788816667; cv=none;
        d=google.com; s=arc-20260327;
        b=OQ0k5kEtvBJK+Sh8T4L3NJ3tZbW1pjhTWtqc9UHxwn7HmbTz+zFxU//VHTZyVWShn/
         fbBnSIvtbJQk7lKljvJkYwPj6Rj67nFo7/2cvLSFjr691+fBVwZeE6bSBLJHphcfsXoq
         EwY+nguBq1McKNPXtqDV53kT4eYSpZpprfLVzVGBLVlQb2ibB5jKtNKWX5EeUbAe9HeS
         jEI47Jdpiy9u4cuYmIKOXP7IEzqaeY1Vci8UYOGaM9zxrW1UTPsHUJgPgjKyplgUXCkw
         iBv+/QurdMxTUoWsyBfTHMLcFhujL0c+AqiCczUv7P5Mu9G8A5VnZY5aW/6ZiesVS/NS
         9LjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMhB9/vf0+R2BNCntM8XD0je4RadngbF12KBKt2v40A=;
        fh=i0dK5Tc8klOJtmjCs6JEZaWVMmegQfoHUqj3NQk4oa0=;
        b=OUhxaZ/vHu2tAIIOC/WcrUmk+8uKy5F3rnU6ys0UpJHJqAyFz5pSatMKLfsmS37GUf
         2VFwWSYdJS3Ne607qb2/zSYftATt/AVzUSOISwg+DqYQvfto8ygV61H7AhdFE/QTodta
         kn5jDM9ChzOpkSfdVuTd75jM/k4pWX7/hH0GfQkfAS/q+zGJp8ZBkjTPZjiWhmIxahhX
         q74YtCzR2juf9G3BGSJeYfMTsRE6g/z9I2/rsO/nHOxiIa39HPS3EPbKrpoRFkkf8PmX
         4bhbefAmjbbqB7sZAyMWDAGl6Ejixtg9ZeQ7guEsW2Hm0jbs8wEK++7y+KHtpBC6Z/vT
         IfIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788816667; x=1789421467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMhB9/vf0+R2BNCntM8XD0je4RadngbF12KBKt2v40A=;
        b=LpO6jbpxb3ysZVqrwaUfXpmMZYK1kfFL1IzhoqFQKV+7qo2D0g59Rj4NGEUBGR4Bjn
         o59ZnX+94vIJDVHSMqDmytGOj0xYdYJ1PKRuc2ToFoG6I24s7W8555Yc1Vn5q2brPGNQ
         Y4nq9jDHovsHc78Q0jlQgrVaDAHBMQ7f0HagVf36TxOrIg6P8w7G2SbyLDNnaPnKHxhX
         lS6mSu0nSKouwGqTXj+RzQ1StYyjxoCykJPv07ICO4TJ+5d4xmfZYfHg3A/V/3J2fpqL
         4sMQrcoBJgvSRCoD+BaEmVaWQgVe2Lj9dCNBVlJbR2VWASCrHZaDnMkwMVJBx7OFOoWH
         5EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816667; x=1789421467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMhB9/vf0+R2BNCntM8XD0je4RadngbF12KBKt2v40A=;
        b=d8Vaj/47ZQHypYlZsDwFtUVvoUo71Y0OzbAGWMUmIQLPxbQK99mqsBc6VfCXDYC+mc
         mV4ukX4Tur43zpH3Rdo/nQtZU6/uQXI44j91uaB9zCKCcIVmzxQPYtAqbsCIR9+OxHhX
         PM5maIt1gp+tAl+hAM94ljibfSLItPeGd46w5AHshkiZS6eXrBe0CyD1fmRNUG9n8Sn8
         ebFfgeeDrkrUE1Y4JZRoX1we+bRlq5kJq0xgQTEeLfd1i8Vcp/C4+oOQjq0jkpgwm7/n
         586rz7LpsAhMaUd6kWg1eUZUPY+Mfvqn+ti4z4xa3/sJ6X38PPS8JXsmOh9VWT2nSGfn
         dCQA==
X-Forwarded-Encrypted: i=1; AKwUvBwN511pWAz7xqaUawsiUDIyenlRJRULndUfrt6m4v8ujMMw1/sNKP4KAfBkO3tO3nWWcribSg609j6gcwo=@vger.kernel.org
X-Gm-Message-State: AFuF++m7c5TziA9AJ7e+4Rga662O1fVHtSJ/lftlyJCVSU6WcQu/gT5K
	NQxSvwSo7rEM49yLzVJH9SjsAwiia4X9rNu3BZRW/q2OT+lB7YdbUA6NDIp/6wb6ar5iSNARVz9
	O+nFWXPRZmwMZKhITxa2k59W4RgYsmQ1coBFCNvr0
X-Gm-Gg: AYBFou2m6SRt/YoY9W7dYfBghG0G3BVtn/HBVCB72ymjSmOLkt2C5NXa0bgtlqNgC/f
	/yXczmRSNVCt+ClTNNpF/VNe3L7MGn32bPHf0i0tTZXByf/hfg6UhsTOzyg65nyn76H4LVfcaRe
	xgu4ngG6bOmTNe8iNl9Mc31g0fiqVqnZXDkxnZGsMmJXk8P0lSvF0yjfn0lO3aKpRg+pqcL4+8a
	l15SmVs+Pq0aESE2K1x6VgE69tQ/b2HxfD7GTEA4tNn++XWWRT+wz/l57AFXStCdFbonvdpnckQ
	KMzf/xoRdKux1g5jNV0pQ4NCwi9jMNbSZdkbDKsnsP4QKqqe59Ivx7w4SF1/FGNe80oYBHUzd78
	my9e9eKtAHgK9DpgtN4cwdVhD2tFTZNU7ev5J2Wca
X-Received: by 2002:a17:903:1968:b0:2d5:db38:8013 with SMTP id
 d9443c01a7336-2db290965e6mr11954785ad.18.1788816666098; Mon, 07 Sep 2026
 14:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com> <CAG48ez3AYt=dYMYLEEhkrzO740wNsD1_3zZbKqo7MXThqEA+Zg@mail.gmail.com>
In-Reply-To: <CAG48ez3AYt=dYMYLEEhkrzO740wNsD1_3zZbKqo7MXThqEA+Zg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 7 Sep 2026 23:30:28 +0200
X-Gm-Features: AcwNN1W46hwdEyXvSweES1CZaIcz1YKihPPLWsHsVoGKqpFlrMy2I4FtskUerj0
Message-ID: <CAG48ez1n=BKDVJB2j-bcSLe_AwWsFkhOwpomaJpqPWaqzQemLQ@mail.gmail.com>
Subject: Re: deadlock from exec_update_lock and reading procfs
To: Benjamin Peterson <benjamin@locrian.net>, regressions@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arjan van de Ven <arjan@linux.intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Jake Edge <jake@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:04=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Tue, Sep 1, 2026 at 4:50=E2=80=AFPM Benjamin Peterson <benjamin@locria=
n.net> wrote:
> > After receiving a kernel with 6650527444da ("proc: protect ptrace_may_a=
ccess() with exec_update_lock (part 1)"), we encountered a new deadlock in =
a FUSE server. The FUSE server reads /proc/PID/stat in the file flush callb=
ack, where PID is the pid of flushing process. This can deadlock in exec_up=
date_lock acquisition when the flushing process is closing O_CLOEXEC files.
>
> Ugh, sorry about that.
>
> #regzbot ^introduced:  6650527444da

This should resolve the issue:
https://lore.kernel.org/r/20260907-cloexec-before-exec-update-lock-v1-1-801=
8c201a7df@google.com

If you can easily test the fix on an affected system, it would be nice
if you could give feedback about whether the fix works for you on that
thread.
