Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793234734;
	b=OgUutV0urwtC4Wm0qxqKd0JZkBMxMxvBJpNOLcAURzaE8DUT53UKUSsca/8A7LkCMtKZ
	 CCnAw+yYG5xXAoAWECexSOIqEAItmZ8YvDMRFtKyvbvobmW+M7jV0mS3pQFP6MGic2/AZ
	 9Jp4ZKmC5StEUB6EnFoR5jraVkm17EEzdMx8brOyxKaJK72pSEq7K0ElebiehViRAgG6Y
	 EYe8UiARKiyfZBtyvJyPLk+w6PXe/NFwzRKbkxGlQ5gH+1Ki4Pf9SHtlkn808HU18Fkll
	 DzXYeMrDqPB7sZfpWk673T70iBfgP9E1oXyJyhNTJEQeZ9ArDd4+eB9xpuMTXv0WJDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IX66bHE1Qh/sWHYMzKZGzmSLPQlS8Qn4BjuO8xpQVSw=;
	b=AQkSFN0dcwS0lWUWQ6WRZd+mX7m8mNObc4/CWeLGONn6+6p60Wzclw/g3y0OcGLtj5Q1
	 GB6askJZB9+njBKWB6IhL9ZfhyIluf9TKolcttzaQ+i85hNt1PptD4mdCLOpXIgHLF2Qw
	 kzVjcpV8NzSX5Npux+0bKeExuL7tIU8pQ+V2BvbCq46epFAi+gGAfvmIdKQaQa/HxHMPt
	 NstLL4MpwEHAEai6uaTYKvhGFZuUrOqNswsP1hgdJnqTRUEsfq21FbcuKxu6BavgUF7wp
	 QVulbBtmzeYYSNf+GY1+0KLco6bGxfrAp2eNTBDNnE5kyPcw++TkT5ENlh3FUy9jyeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uUyOHE3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F02606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uUyOHE3
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3ac4f373d3bso2058351fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793234732; cv=none;
        d=google.com; s=arc-20260327;
        b=i/JW5HgROEaeDDPGEvZsebVhFfuqKLaERHh8Qk7hAglwsbb2fd962qj4lhZPXHu/Fj
         ZW+w1rZXeJ4DHND+RERuAhTXbjXjGjaGlfFaJbEcsC7BLq/uqCPcKGlkEs7GFD/0Exr4
         ZFWd6d//kcZI6MSvrl50lWT66SXY8dvTKfSU4eAKPIOzml8iDjg1Kbxn7HXq3lCypDl/
         uUAkeMGmad8nGLPP0lnPn21D82dEhQ5QiHDlC90JNnbrZGkATKquUlsrStrB30K8p9Yg
         AbGSQWASVpMisoz9oBTDcndUO331X4wIGy6SRMiBQuxX2/ftHqdggXg9F1jBujaWqeIz
         eV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IX66bHE1Qh/sWHYMzKZGzmSLPQlS8Qn4BjuO8xpQVSw=;
        fh=WWxz+6SPuVeuwcFdDALYVK13p2B9fxGlQQIsVFKn/rg=;
        b=KK4XTpSEfd1wdhYKOxz9rlQ3n9ACEfidnmHnsJGV2v9r999DZr7cm9BiczyC6i3BM/
         vZ4sbbJWzW+95lL/E8tovgDgkOp1S37njccSxPzJ59US6Xn2eRQskppy6sYRB5UW8crT
         jUoAQxFhJVN3pbY+Vw0vbSwRKDvyY/yumXfwC74kWIIaNQo6ZbWMHZfw65xfWAu/sxm3
         +E+ICjMvEqXADimE/UBvGKWlIAZQYJjksltLiTAQW74Fq4DJ+Q2CVEranAzOjnl8FQPF
         IPaO0lph6gqqUbB+BfeSvo+OJKZ4Jnf+wb320jLyz00VXpzhEDuCK7kiNQr+S0dg28BI
         ejOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793234732; x=1793839532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IX66bHE1Qh/sWHYMzKZGzmSLPQlS8Qn4BjuO8xpQVSw=;
        b=0uUyOHE3f8jNsMWp8FK0asGRw9EbEY1CXKry67A2oKasSy2HG2zwirNGL+3eeHeCiF
         fICA8MshW9HlWQFQqeApWcIVaE6cFsDUgpN1Gf2FtjWg6t9W8tppgEfIOHVpucFW/hMg
         1h0/u2xIm2bWfHTAlbDFvqVkttTyQHL/IhzdaLhWEC2Mcdy86MkQ/2NvXVazb4Pbwk0o
         dW/vFeRaMnTV0A1e3ZjT5vX4zastObB82nkwqY7TEhnLOFwT/QQrMPcLj5gtrSCuG58Y
         DrqBy4w8+kAblPZb2vNJzaZewRbknNeqQ1AZaEtijvIeldQtr+m07a/mqpm/3AlnWpZp
         ZY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234732; x=1793839532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IX66bHE1Qh/sWHYMzKZGzmSLPQlS8Qn4BjuO8xpQVSw=;
        b=KIaQl44ZRPdD8uejjcDBqN2w5MvyaDqjGa4dtA4wgBqEgIMRP8VPUTHcqfJf4TUKFb
         EgsBnzXAPhSSyvJKUJHArP+XrBeNd08RyhXt8inAThEY3wXP7FNX7NsPldwhHOfOpNMT
         t3iCQ6AMSmIzN54TKjLgQGQQ0pSQIgeseo2v6InKE4as/FwrcbveGA1jUdo+f23WO0QG
         O5Eli8ZGez2d9d6mGWoSKkK+xdWrmHZH52JV0M279NqDzD81Wu6MGv8JlXJ2VbpmH33d
         D+EFUwKKwtMq9iFL2TI5SHh5JyBSBByeWzOvCmNLwjy35nxt8wafVOCZg1yIThRp/IF4
         VgoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrFBeyvBm9AGkWGHd26mv9Nx3O+rFq9Hxicnpl+xL/5cHRaJAgWKAVPWlpmFxlOkPkZJwOs11sZeX/3Kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0SVkt+9OzqHN0A86uIyUoizzBaNgW6X22wA9TXXzRUsCL86jM
	REl/Ksc+Fyx++qXZiIsSjeZnng1deTdcMq1HmxkWPCxsmg6ou1yZuXjpzXGeKdX5X6n/L/o7+s/
	vvWl2gojYjCbGOzHJSugvPhYOQ1iWVCp+OB1eioFYE4Q0A+hTxA==
X-Gm-Gg: AYBFou2WWNv7MePZYToYnvqwO9Ym2b3aHIKromgWZhTDlV51poH9eMrt9rDiw6dMRlC
	QUdH8kPkY6Sk5dKjQZj7ZBXmRtj15BCNb/5Y0JYRmvjSH6rdhGe/5w+G6Xmf99MDl1qz22w8BpI
	jzdhiBB6ToJ9ysghfEp0fem/D7RfF5mxefcfTicxWxtsX9Ce587UojyL5SLC/DTlsOOKzuo4Xdo
	RiCsitHNUJRsyNRkwb7mXSCjExk6zKTkhhcunV5gybAGo2Ovusml6ExJ+L6PdkSgf2kznveES7P
	3iV5C0cLA/0+iUvIbacS9HbIX+jzaLRKa1z0Kd5ZGTNdPHenC2oND7pePoxse3qIgmLD3pmPtUV
	WO06PIWOv3oEFMSB6CY9PficYyJtGV3vboQ6ffFaG2Ux+h0xeISYzFkOo
X-Received: by 2002:a05:6512:10c2:b0:5bf:a2ce:1a21 with SMTP id
 2adb3069b0e04-5bfcad39f9bmr1447564e87.12.1793234732196; Wed, 28 Oct 2026
 17:45:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ25PZ5BM+83Vk8t5NUY3ksLGz5nzONrncipu2_MZhFSsg@mail.gmail.com>
 <auJYmq07gDhTkJfe@dread>
In-Reply-To: <auJYmq07gDhTkJfe@dread>
From: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>
Date: Thu, 29 Oct 2026 08:45:20 +0800
X-Gm-Features: AclHuK8bMR8xx8cfMsFzPtwhX3EUD4u5xaeiHNGfFd4E3fzBEuOQaMNxkXZrHCY
Message-ID: <CAO-4RZ1noJO3fFYZdnVLk7K=YS5uT7+=CS2PrA5XuNeZ+cxBLA@mail.gmail.com>
Subject: Re: [BUG] xfs: undersized log triggers assertion in xfs_log_mount()
To: Dave Chinner <dgc@kernel.org>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Thank you for the clarification, and I apologize for not checking the
relevant code more carefully before sending the report.

I'll be more thorough in my analysis before submitting future reports.

Thanks again for your time.

Best regards,
Zheng

On Thu, Oct 29, 2026 at 4:18=E2=80=AFAM Dave Chinner <dgc@kernel.org> wrote=
:
>
> On Wed, Oct 28, 2026 at 01:00:54AM +0800, =E9=93=AE wrote:
> > Hi Carlos,
> >
> > Executing the stored syzkaller testcases on Linux 7.3.0 ultimately trig=
gers
> > an assertion in xfs_log_mount():
> >
> >   XFS (loop0): AAIEEE! Log failed size checks. Abort!
> >   XFS: Assertion failed: 0, file: fs/xfs/xfs_log.c, line: 597
> >   kernel BUG at fs/xfs/xfs_message.c:102!
> >   ...
> >   xfs_log_mount+0x4e3/0x590
> >   xfs_mountfs+0x10b9/0x2270
> >   xfs_fs_fill_super+0x15cc/0x20b0
> >   ...
> >   Kernel panic - not syncing: Fatal exception
> >
> > The log size check reports 516 blocks, below the required minimum of
> > 636 blocks.
> >
> > Is this an expected assertion with my XFS debug configuration, or shoul=
d
> > this malformed image be rejected without triggering a kernel BUG?
>
> A brief look at the code the error message points at answers your
> question:
>
>                 /*
>                  * Log check errors are always fatal on v5; or whenever b=
ad
>                  * metadata leads to a crash.
>                  */
>                 if (xfs_has_crc(mp)) {
>                         xfs_crit(mp, "AAIEEE! Log failed size checks. Abo=
rt!");
> >>>>>>                  ASSERT(0);
>                         error =3D -EINVAL;
>                         goto out_free_log;
>                 }
>                 xfs_crit(mp, "Log size out of supported range.");
>                 xfs_crit(mp,
> "Continuing onwards, but if log hangs are experienced then please report =
this message in the bug report.");
>
>
> If you turn off CONFIG_XFS_DEBUG=3Dy, then what happens to that
> ASSERT(0)?
>
> That's right, the ASSERT(0) goes away, and then an undersized log
> causes the mount to fail with -EINVAL as it should.
>
> > I am reporting an observable assertion from a syzkaller reproduction. I=
 am
> > not claiming a new vulnerability or a specific root cause.
>
> Please do a cursory code inspection next time, because the code
> often makes it pretty clear what the answer to your question is....
>
> -Dave.
>
> --
> Dave Chinner
> dgc@kernel.org
