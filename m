Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C13BCD1A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942918; cv=pass; b=beNUzzBeiNLIcjfhURz3A9ItGxIagHuCfIQuyUNUzQym97vsQV3A7CMN7efomueH3KcVUt13xPhV/ommmnb2XTmSE17RCt6N83+xAC+NQsbAFxcPvEty2idJ0oWOqSx6eUtg62j0DOz3Kx+qVaWtGW1XJFBRvqnSqOLrkgq6++o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942918; c=relaxed/simple;
	bh=adx6fIvXjZgFuJ/+Gl0koLCR6NGkKja1b0VlhelWFtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbiOVutBR4mMVdBcx/ydgnf6O9K+VBbsASYY7AHD/VQl5U0R7KghczQah8PGGMPAwDmoqkbKXQm3yk2Ka+rGDxxLXVxrYg0/oYVEOavoTb+zbkyHk9mr0YrXGu7/ErW+B3tC1WfF1oyY/1dPPoWpFCCKa7WF1OWPMXB2gNlG/ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TfueFUTV; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TfueFUTV"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1478702a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942917; cv=none;
        d=google.com; s=arc-20260327;
        b=BkRkjW/PT7RVQ6x8fQA3YY4rI4gONjtdWDf2EBhsRyuyQ7s6M/qsJJcdR+245LqGnF
         MwzsLvmWx1FwYWpMZNnHP2d+H7uvz6aMd/SlAs25/yKopMitPE5JIwHV18vgiP0vsjQG
         tJUI7qP06bRe/t95M5AWyKI7CaCJVS59+fnJ8Ng+1zk/kC8Eeyys4Cpa5MboM2JlL5Eq
         PzWfEB8s4Nh1r3POddwWi2wMMu4hhpliz76HvvbQCE0DAXwCa7g/a+SOYG8LJwLkdtzT
         k+E6HPN22l4rXldhs4PWoVy2zi/gokcekSWzJNe448l0AWZIbijdEtKsLkqAduO+LMAP
         j1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3Y/bbGVtW+ZEOaZ1fAMBPmwdyLY5JaPej6ICz5dmE4=;
        fh=MzfQ5ewEi4DulI6eX4L5TiOQNvPhYkBR0puFQSGMz+A=;
        b=Plcm7YUeOGZjc6gJS+0ZN8ZrFyVK0nnVxMrnxuIw7ySOiqcgP0F2VtdxoRo1RksisH
         Q0YCzFZqBhRbrwBe2bbm5tjtVTGR6Az2LUp//ReIFsNCQHH675FD+cIItqmnyM3TywAb
         Mng4h8xB+rfaMjhu8A61VDo5h+ARUbetpKXTT+XOM5kU37pdJOp7KNLzfJ00aTZFf5Ow
         Mgzh1zuJ4/tk/er8tQF1lysRqzW2pKZuhSJiXhCjfr99Ft3e6cVDsNEaRcs63WN0/OMf
         DL270bedvBzHqIVpasZ0ovGH1g9cp1vCTCs+ne0GC6TAKJHCahnRaAXrqmEVMbKmeSBI
         9btw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1787942917; x=1788547717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k3Y/bbGVtW+ZEOaZ1fAMBPmwdyLY5JaPej6ICz5dmE4=;
        b=TfueFUTVz91cKtiaYW0RTm9RUJPq76aWAH7Gt9e2ICbnVEB7DtAlpTLVIU+eeJVHkg
         ObQvExnZ2U00ymD7TZ+NozoLskbvwKc+ndQlOFzvhuHQN5QJF/PQRaFF2rvDk+t3SnDN
         k6SAFDI227GK0M4fZ6NgGUVub+FnWfIbcXXEPCPZmZEF+6eh/smOpo6NSEm2/4ROFk10
         3R1OPSLXKnVg+8BVRsbF4QvmqXfWrg8UKCLakNpFHw5QIt1uRvRD5nt5UqViFZVGlc2w
         U92BSrZjCI0sn3//5Rh/UkFJrsksajdC8vX+kltuPLZXV9TkQvWBC29/c4c6DVeTb/IV
         Ba8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942917; x=1788547717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3Y/bbGVtW+ZEOaZ1fAMBPmwdyLY5JaPej6ICz5dmE4=;
        b=O5bmDQpLDHoO98mhQ14Z9RUAnJyz8s8XFi1rtnejnqOnwiHqmxAbxgAj+DywghutMa
         /EsFQgy3r5Guj+jGDZvyehE0/qGgir4LRsNJvRxMALlz/ukRS0pUwWxSAUpdnt0YeA3c
         xg2/j6kM4uX5sDfpndYh41I/uTahO3Dofd4b2mkBEQFnF9yFSusknzRLXYw53Z0bUgiV
         r+lbShdniuRP/u42A03lG6fZhxUTLAs+GQU/+I63lXGlAGabZB4GSjZ878Vm+vCs0oeT
         Wv1HWEIc8vko/ZW6aDn/aIyuuuGDf8MpuR869v1RFAh8tj+Uqi2UB/FcnRfs1FjBdmAI
         lVHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpenpzzOYAg3yVKu2D6iLTrZIu5AvHFi/1wfOqAfOzJswR/VcLR7Ke//cFVAqGWLzFFzbqObi7YQe3hrwE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ5cQ2LnD/UMcDrB7k/+kRBkkYYmAKLHWpCF9/vrN1WKYkswBu
	ggp4QmhxRHnQXINTqRDi67Lui6kE9QXz9/pTiHdxxrCuwt/CJsDGbinkpwqFr5+ujqTpiNvTLtt
	2wsCvU9PW8jj+8Z2Eeu24wU7V3A2eL3LSCL+r5qyY
X-Gm-Gg: AR+sD11JpFDeIWvUxXVx2KAm4s0ZPDJ13WXfxZi98TMcLj55/7gDDtto9+AKigccSh8
	djU+FZ3do+/2dNP5KpqKKAqGuS4BkkmpFOIjmfGDqur/XfQGWEe4BpLab0j8OaAERKeUkqlZu3B
	z8qWhunhy8gcPI3caHuFdk5hHYjMy3II9+ff6hLEBLoiUB8grKDi8eCCy5AKBKg71ugdADQLUm3
	e3h3e10xkQZFlf0xcw63JUuQ0gImZMT0WmmbSNnNnqR5eAQUFQe8Y2WMtHti/rNbNrYMFzkctfe
	j+/0jKSYkB1b+Y3/grAM24DeJOrp7xNkm7MlbEWN0Ofv
X-Received: by 2002:a05:6a21:8984:b0:3d3:aed2:6f25 with SMTP id
 adf61e73a8af0-3d3aed27354mr1179453637.25.1787942916987; Fri, 28 Aug 2026
 11:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovChn8nTkgAs3sw+_YDhKWszxMj-tssbPdwGjPMMC7zEpyw@mail.gmail.com>
In-Reply-To: <CA+0ovChn8nTkgAs3sw+_YDhKWszxMj-tssbPdwGjPMMC7zEpyw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Aug 2026 14:48:25 -0400
X-Gm-Features: AcwNN1XKi_Z1xekj--_sqjnfGWMHJnkG7-HImC4ofFVGoJEsumduMPxYISz00Kc
Message-ID: <CAHC9VhT-xBQgidnKEwFZsOX5JD+SPhwrNSph6gQNLZR2-Uf6Pw@mail.gmail.com>
Subject: Re: [BUG] general protection fault in security_path_post_mknod
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, falemi@asu.edu, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:11=E2=80=AFAM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/178-genera=
l-protection-fault-in-security-path-post-mknod/
>
>   Oops: general protection fault, probably for non-canonical address
> 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   RIP: 0010:security_path_post_mknod+0x49/0x1e0 security/security.c:1430
>   Call Trace:
>    security_path_post_mknod+0x49/0x1e0 security/security.c:1430
>    filename_mknodat+0x40e/0x660 fs/namei.c:5172
>    __do_sys_mknod fs/namei.c:5207 [inline]
>    __se_sys_mknod+0x3a/0x150 fs/namei.c:5204
>    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>    do_syscall_64+0x146/0x480 arch/x86/entry/syscall_64.c:94
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Our reproducer.c is available upon request.
>
> Happy to test a patch if that would help.

Hi Farhad, thanks for the report.  Do you think you can diagnose the
problem and submit a patch?  Bug reports are always welcome, but as
you may have noticed, we have plenty of those at the moment.  People
willing to not only identify problems but fix them too is something we
are running a bit short on at the moment ;)

--=20
paul-moore.com
