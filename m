Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CD27FD74
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834777; cv=pass; b=mY0gLg00BwXqLZMlyRDs7k696xjJxbnpjRcQfIwgnGu9HC5EgtZNEhkMmGcOTm5gjYjDourrX4vYEgTKV6IWQWrZ7V8kV0ISsI+sq/dTCNGFvXpey1bZIzncns5bgqxUtFhTsoEHRlIgfBzXnq+ceMDhQPOzpD7ctMmzCmhcLGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834777; c=relaxed/simple;
	bh=VtSG3PkCoqr4SYLiHTFlkhdpj+dkerjUWfVmiPHXaOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCRPCs6QbSBpWPN+7p6YiPlOT+VgP65jM99DYWsr9nZnTzQG45+o7lc2eFaqnysO/SiZJVA5cmtyq4TBqIThwxONYrp8wxpFTFslWih5sMZuQ3CYjU9vxa3ygFKIKQasH2+RaRj1C0+E9eyzXhx7L9U6nSh9MYMrNshdSfxJ6Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/vm6d6d; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/vm6d6d"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5e866bca0so2946595a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787834768; cv=none;
        d=google.com; s=arc-20260327;
        b=KSICLJCgE4ns3o8oKRh2ktIIx3/OcO3xZiRWITPXu3CjbBcTBDnqVGW7HyqHMF7C1D
         vK+z31ssob9jMeDNZh8c/1KUYzcfrBoSGEptsfKyjEwCmFTw2JxZ6kSXRRv6cY3hWXhf
         DRYPgjbjVEwtdpK6QwnmpDprcFVYOPipQTaOBBzlcBvWxIDo9y4c7yKYdz/pzI6KoLzs
         qEUgSiuACWBsWrZb/47+n5OpN4yFPCvHNgpL4m3lHCnKFJ5bIJ/c4vagqbyDStB7dbfJ
         ouX8+zxEZoLOMikxw5BlnFy9nryb9Zv3/T3xbII22lUby7vQLIgtbuxTtoO3uCqk8lK9
         iGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TiFeCb1mWzRNV32sFee9OVcleAQF9Zjh0wO6Dwjz8+0=;
        fh=hQvS7FwhtSgw8IAcwMpdCbIyXYoLJUsusMoLtuWiuDA=;
        b=pSGlbLdVv+0Ze577Epm268qGY9MUaMhI7f2viZTrKJYGZtEofhXW+c1UxjwbWc/EoG
         zXOHi2OVXylA7JT8YU817x5C5xXMBkpFYTOtl3A1KfsSq2x9RGuV7Z3PLKGL0Doh9nmr
         +ufVcOz+B8VAHJA7Vh+5wfR4MsVqb6THtoPORy8gtWBKfPyzKodKCdIe7tLnWI5PD2cu
         E8xfh/hms/HA45yzwm1tftcjlTjTPVlDlE9Hn+xhMfAJ1pDdkBPLrbwDsGozAlcIqTeA
         Swm9UcFpprGazEA1GdqJcShS4xtk0dIsp48G5OSe3dUjAQp2Bo3xKn5QMjCoRjfGzsyj
         /HTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787834768; x=1788439568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiFeCb1mWzRNV32sFee9OVcleAQF9Zjh0wO6Dwjz8+0=;
        b=L/vm6d6d5ux+ohBM4fopVrFQC9bKM2XHBZBJH5iEzFSDNszsbth7B+xPRqj/BCMyEN
         aC45FkFw3w5kn6b4PpNo2P2tISSntXCJLe4VbLkbmo0lSOYaKQtP33tDZlYSt7kRs6tz
         VwUIEeKlAhTQQCpITMFsrdTE9sbJMtaL38xBAFjx8Z1SVRsGOlskl1p9FGel9HppLEC9
         qjClF5MKbb6lGV4xBjgRcAo+/bGD9HpzeGewXaZv9sHqXauo92LbONN0E+dF6N0DZObR
         npDayFBIt5QLcPnmJLj3MWHUQrTWfIdKeqq/Nw3u4o2FsUDYxvC8ovi4qxDoM85Lj0my
         OLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787834768; x=1788439568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiFeCb1mWzRNV32sFee9OVcleAQF9Zjh0wO6Dwjz8+0=;
        b=rB90dY7H1oraYRbP0TDvcZJxxGWbYULMqj21tO6fDgILgphcK1svb8SLX/Zv+6dJgX
         yLrnj8CQIpaUEC7EixU5OcPV7GvY4nVEwwkSbAc69U5MPOVz4cOmgwgsO5FgDDBSLeFA
         1DzAigiThILFGDflJ0jRK0yZK9zSGHkyzstQcgg9eNDOFGE4BSlTCMnxqkPTMWo6T/2E
         YjsrREw7t+7J9g5/n4nWpNy+m+Hnu7BydqfCeH0ETGf3cgnc8jkSg6F3qyuRK8SCUa96
         nWipBxbaVB7SVNiWjKEFOCdkfL9LjUhho6d3YBSnqBvsoOccdU4YPYCr0KRSsXV0bYW4
         8tYA==
X-Forwarded-Encrypted: i=1; AHgh+RoOSrLDFFY0rIAnvkZeucxRvfOa2pr4R0IrYJQbzSmzfzOKv3hyVOmB9rNbD7bAJA7nbK8YQRl5bzehT5U=@vger.kernel.org
X-Gm-Message-State: AFuF++m74jGNFmT97bMpfh1NW9lODc3AZxGcCUaa7JoBKaL3zqTe7MPK
	Qnm/YmghkUe8w9DnVlpBOMx25jT81DmaaGwuNoHvlV9Ek1g9XJAT08D4C/asZlW4Ht5mZHUgkxW
	YYof6sKAt/nkiMm03YHZ4xR7Hh7svqkM=
X-Gm-Gg: AR+sD13vfC+o9rtEDWfC3yXorJhHkBZWL4oXzysrek//ec7ZOLIo+n2ZsoXHVfEeV8L
	WnfhpR3Ld/3Gs9iIIWdwvzk+kdqTU9ekHBmrJpe3V0LatAGdpET7KL8vwiJl5YWmmzwIHPfJTVH
	obcIr5i3EqKh4MhgM2fa18X7cfTGJcCx8VPUfbg6oazOg9qSS1mKkaQFZE4B1r0SPN4Cct8IU6b
	FvqyV6YDdtt65ivBjwUD0oGubfLUtikJaoO/3mYLPwRZ1/pI04KpElLAp14s80rFFHuBY6Ye5p8
	gLPqjgGN3EoUxILaFV0p7TNCxx07G0kS+Em8UkxdiP4hhk/UQQA2pWPp
X-Received: by 2002:a05:6402:a5cf:10b0:6a5:f912:b092 with SMTP id
 4fb4d7f45d1cf-6a5f912ba3emr2236191a12.6.1787834767865; Thu, 27 Aug 2026
 05:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827045007.3831259-1-4ncienth@gmail.com>
In-Reply-To: <20260827045007.3831259-1-4ncienth@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 27 Aug 2026 14:45:56 +0200
X-Gm-Features: AcwNN1V-c4xu4UcDTK90nLAOAcPgyGpCSFwT49PXfHRzCVesR89Joqxdat255j0
Message-ID: <CAOQ4uxjtzGLVHeQT+J1rCaPhhT+NG237EVJC+3DhP3DRH6Npqw@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 6:50=E2=80=AFAM Daehyeon Ko <4ncienth@gmail.com> wr=
ote:
>
> Hello,
>
> I found an unprivileged race in fsnotify_destroy_marks() that can leave a=
n
> attached fanotify mark on a detached connector. On unmodified Linux v7.2 =
and
> v6.12.105 source builds, it naturally reaches the fsnotify_conn_mask()
> warning from fanotify_mark(). On unmodified builds, the only observed
> system-wide failure was a v7.2 panic when panic_on_warn=3D1; no memory
> corruption or privilege escalation was observed.
>
> Tested and source-inspected versions:
>
>   - Linux v7.2, commit
>     8d3ae59288f1e7d58d76558a6ee96d533bc5019f: reproduced.
>   - Linux v6.12.105, commit
>     14c37ff05f22da2fa7076d10f6a07c7ede330c83: reproduced.
>   - Torvalds master at
>     73e3f0710014fe6d4ed98cfc02292f6121db7558: the relevant destroy
>     iterator and fdinfo consumer remain present. Commit e422777fdd47
>     changed mark-mask updates and can mask the immediate warning, but it
>     did not change this iterator or the detached-connector state.
>
> The unconditional connector detachment involved in the race appears to
> originate in commit 6b3f05d24d35 ("fsnotify: Detach mark from object list
> when last reference is dropped"), released in v4.12-rc1. My unprivileged
> runtime results are limited to the two versions listed above. The limited
> unprivileged fanotify functionality used by this reproducer was introduce=
d
> by 7cea2a3c505e ("fanotify: support limited functionality for unprivilege=
d
> users"), released in v5.13-rc1; I am not asserting ordinary-user
> reachability before that change.
>
> Root cause:
>
> fsnotify_destroy_marks() holds a reference to the current mark, drops
> conn->lock, destroys that mark, and then continues the hlist walk. While =
the
> lock is dropped, an equal-priority mark can be inserted immediately befor=
e
> the current entry. The walk resumes from the current entry's next pointer=
,
> so it never visits the new predecessor, but it still detaches the connect=
or
> from the object after the walk.
>
> The skipped mark remains ALIVE|ATTACHED and remains on both its group lis=
t
> and the connector list. At the same time, the object no longer points to =
the
> connector, conn->obj is NULL, and conn->type is DETACHED.
>
> Representative v6.12.105 output is:
>
>   WARNING: CPU: 1 PID: 163 at fs/notify/mark.c:128
>   fsnotify_conn_mask+0x113/0x150
>   CPU: 1 UID: 65534 PID: 163 Comm: fanotify_destro
>   ...
>   do_fanotify_mark
>   __x64_sys_fanotify_mark
>
> The source reproducer ran on ext4 as UID/GID 65534 with CapEff=3D0 and
> NoNewPrivs=3D1. It uses ordinary FAN_REPORT_FID groups and races final un=
link
> against fd-based mark insertion. Both builds used a KASAN-enabled researc=
h
> configuration, but neither positive was a KASAN report.
>
> With panic_on_warn=3D0 and panic_on_oops=3D0, the unmodified v7.2 run emi=
tted the
> warning and then completed 10,000 iterations and powered off cleanly. A
> separate fresh v7.2 run with panic_on_warn=3D1 reached the same warning a=
nd
> panicked through check_panic_on_warn(). The v6.12.105 run emitted seven
> warnings and reached its 10,000-iteration progress line; it later timed o=
ut
> during post-loop teardown, for which I am not assigning a kernel cause.
>
> A timing-only diagnostic kernel also demonstrated that fdinfo can combine
> the old INODE type with the detached NULL object and reach
> fanotify_show_fdinfo() -> igrab(NULL). I have not reproduced that Oops on=
 an
> unmodified kernel, so it is not part of the impact claim. The skipped mar=
k's
> group-list reference keeps the connector allocated; I have no evidence of=
 a
> connector UAF, arbitrary read or write, information disclosure, or LPE.
>
> I do not have a submission-ready patch. During fix development I rejected=
 a
> survivor-preservation prototype because it introduced a mask race, a
> drain/restart prototype because additions could starve cleanup, and a bou=
nded
> retry prototype because review found an unresolved lock-order/deadlock ri=
sk
> when generic callers hold external locks needed by cleanup. I am reportin=
g
> the root cause rather than sending an unsafe fix.
>
> A tested source reproducer, full serial logs, configs, and diagnostic det=
ails
> are available privately to the maintainers on request. AI-assisted toolin=
g
> was used during discovery and analysis; I reviewed the source and the lit=
eral
> runtime evidence above and am reporting publicly without the reproducer a=
s
> required by Documentation/process/security-bugs.rst.
>

Hi Daehyeon,

Thanks for the detailed report.

Without getting into discussions on solutions to the race, do we even care
that a detached connector has a leftover attached mark in this tiny corner =
case?

I mean the assertion was added because we did not anticipate it,
but now that we understand that it can happen, the assertion could be remov=
ed
or relaxed if there are no other major consequences.

Regarding the reproduced igrab(NULL), this could be fixed by
using a helper like this in show fdino code:

static inline struct inode *fsnotify_conn_get_inode_safe(struct
fsnotify_mark_connector *conn)
{
        struct inode *inode =3D conn->obj;

        return inode ? igrab(inode) : NULL;
}

WDYT?

Thanks,
Amir.
