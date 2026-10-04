Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829B212542
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791119888; cv=pass; b=C4pjlwW+zbQXPAw+icCTPsGoQKCRk6wVY/cpTrxr/0srLSrcUKgr7YRtTEI5O82wDyCkyWFcfBoEHLrDNOdp0G/CzNoPBLR+8yfw/A26sAEQKGLC7z/veunv9UQBXQ55Y+NtplXUgEtLXwotFefeRLXiDMceWDy3x/4SWbM2KvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791119888; c=relaxed/simple;
	bh=kYFPIdi5qIwk5fFvla5ev9INmB4S2FDhesXe326Sjh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qu2uqDrU+/qKFX0txRIIkpVtff6RP3UvURPI7eCDyExTsICPrFdat5vk/GptZk7M1Wnek5cl0RRk0ZTe/s8JOZd6U3H2LPZZHq4HyJL6RsBfJfLhF1ZUKJmXKbyVB8XDpXmhbkKIpirz2GyoV+TH1vhTlZTHEnhta03YdtggVI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ewifg35h; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ewifg35h"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-86aecf49833so118909b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791119885; cv=none;
        d=google.com; s=arc-20260327;
        b=RS86l+ELs/AwJjL64Eaa4uGnkhC3crnscZetmO/Ws4vxrC8PGllIsDuanLB6ww5+qv
         sl5H4dYmiSAzRJOiupSNox8jCdd84OPTgb53HAXj6nIubKqezup3r7Hw83EkKAfTi6+s
         a5By4RsP6UtNJDj6tHdTG7g5YbofxPMarvkKw3KbiTXGEAkaU5oqCq4U2EIYQLzcHp5m
         lhgguJisMkJNIQKodf6y6DJNYydYPh0OwJZg04iBJmJl4QDut274SOfMBG12H3zJfz7+
         WP3v4SThuOmhpl05L6nEBnBrHSsGdgwxfQSrIm+eczCwzKdzaqwHNykSPbBFqN7BdGVE
         Z3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iqK29hcraqSjkwKPoayt4W5plvnH9pNitz/JPZ6I+94=;
        fh=0U5NN56bOlGVSTKSP+OmqVnFWlaHE2FU4GadgQZ2ygI=;
        b=o7f7Q0+jcNn3tKhq/cWikStd8QXKMi+/9jyDD0cPpEwH7BpcrGcYUedri2tuyVnpSG
         th+NXl5pRqm2JTSDM9Hocj6VSfZaIV/iw91YVwYVTe0YfFYixGrnV2fsaSh4lU3RHIYA
         gMBwQLfYZbft/bnffscvAIMeXM+gU2hwpe8bzMjfitAGRUTPcPi2dGlemn/xOBgazXTj
         WV7sWQb+cmCAPBNVz4oGgdzPaXgLhSIpxF75sIoPZjMYa2gz6gCGIk02Pz0u+hOf1a5G
         THj5K6Q6BmgFxAqKL/ZpSRqdYA5wvK0ncFNS7YhASX2m/uunAgzx89JZZfCnAJqNDVgn
         dx+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1791119885; x=1791724685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqK29hcraqSjkwKPoayt4W5plvnH9pNitz/JPZ6I+94=;
        b=ewifg35hKNmJo7++/l6XBeGLxab3+vtVPZngOj+k5KRUjKjiq8Z8+GJs9qmVkSTsrc
         ifyXUqwSftzmJzFTgA/W/VlRQEM5ncCLeRv0/8yV/GlzfjLKnXsXVwp2vwIyfnoa44y6
         oYHnPfGHs9PpROzwgyHINRGGZJKHky4TxXmeEKNRbdq2mU37cfKRpz2Q+CBfW1BDUzo3
         wy+gIbvlRDWJQ35xharx0Qwwk0j51+dZbFvmljKQXDDToBUWxGbpJum5imAtoRAwlbeY
         MF+0nXQNJocCXY9CFKvl9CEx50parfa35sbNYugCRSvU1M2uFw5waw4/Hv1/tP1ykCN/
         2kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791119885; x=1791724685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqK29hcraqSjkwKPoayt4W5plvnH9pNitz/JPZ6I+94=;
        b=F0SYZx7Y4Wq3/RddTQMswM6S7VV6cP/wMSs1HX05T/hbDba0ThOO59PYzaJ3OAHtOT
         spBBMqFKkuBgfj/wrjn2xFzEpM5IJuydt9n7mz+lnKtcK/mGu/t90NKTE5XyiCV9wTbG
         MG/yApegXbrPNrsQbC74jPq5mWxy9dRjNhoRICQj03YC431kyaK8rGYQ2zuRtiNY05lN
         WfQdIOycpzPRgSuaU6wpXSoQxyCOh8ACqWmujd/oKL0jpeoOdphfDMVc9/wBN8dota2G
         Mdt3DQaqq4Inglb9D8z/n9PbK8E22bpzBxhSNMBl8FwTr+NeoAoWLCQqU/J3zTZafWay
         Hlcg==
X-Forwarded-Encrypted: i=1; AKwUvBwzx+ucyK1tSWPOFXNIHQr3BcmT+pSsjny5bRQMofxdT/BRtmPWg962XYYPKre97hAc+faG8ur/h5x+yqw=@vger.kernel.org
X-Gm-Message-State: AFuF++mft19Kqo+3x55/yOu/taJ2ag+ZZLdtTMVh8uBJelg9qtlVUQT4
	e6YlxFqL2dWWOddTnPshGePg0zRTlT7v9Xc4jiUyu9M0q/zmzsV4MvgBw3oY5vxNLHfw56hasnk
	E0/qn/D+W4BfTB4KbUDmpDNLdEhXVEUA00KOYifwQ
X-Gm-Gg: AYBFou2bVtaj6q2fR9w5/EKl/QYw2bDBnVOJ76x2I3pDygVEw0lkx6rq8rvESn9TwnB
	M2Uqoz1lXpWa0dWco7m8PzUk/7wRvOyL0IKVV8aR5MNEajC1VJjAmMeAIihFhKRMnNwZA4u9tTP
	MkOP5yl2kgHG1KUaahoPSQ5D893VDKkWMdHO0o40JK7i6+fwQC2i5ywn4v5Rlyum+ZfFTcIlIF+
	iSI7kCMsxi2PeahjBrR6tjIFjTyZJuhUv6lGX1nGg+0oaxX1qd1mSUlEwYCYn+0aoNzMJZVYZQ0
	LzP8ql4c+jSmiQp3lj8cvx/+ww1mav5/UK5jf3jp435TdWjKevUHragXxsI+ryV6hb9t7+oN/Kx
	EcDZ46eurcNM=
X-Received: by 2002:a05:6a00:a0f:b0:880:7f48:5f07 with SMTP id
 d2e1a72fcca58-887fb5cadf3mr7829367b3a.6.1791119885275; Sun, 04 Oct 2026
 06:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703122548.1623981-2-rrobaina@redhat.com> <alaO+HZ7qJ1Iv9SP@madcap2.tricolour.ca>
In-Reply-To: <alaO+HZ7qJ1Iv9SP@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 4 Oct 2026 09:17:53 -0400
X-Gm-Features: AclHuK93CXILhWqVoyyCiJV7kNi7hXkohGtKrcJ5HI3-Ast7QrPAddVZAM79UGo
Message-ID: <CAHC9VhSosDsvCZyq0yY3Y61r5Od52WJecqcEjrT7XGkpyBi-xQ@mail.gmail.com>
Subject: Re: [PATCH v2] audit: add FSOPEN record to log filesystem name
To: Richard Guy Briggs <rgb@redhat.com>
Cc: Ricardo Robaina <rrobaina@redhat.com>, audit@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	eparis@redhat.com, viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 3:33=E2=80=AFPM Richard Guy Briggs <rgb@redhat.com>=
 wrote:
> On 2026-07-03 09:25, Ricardo Robaina wrote:
> > Modern mount tools (util-linux >=3D 2.39.1) use the new mount API
> > (fsopen, fsconfig, fsmount, move_mount) instead of the legacy mount(2)
> > syscall. The generic SYSCALL audit record logs the fsopen syscall but
> > does not capture the filesystem name string, creating an audit gap for
> > filesystem mount operations.
> >
> > Add an FSOPEN auxiliary record that logs the dereferenced filesystem
> > name string passed to fsopen(2).
> >
> >   type=3DSYSCALL ... : arch=3Dx86_64 syscall=3Dfsopen ... a1=3DFSOPEN_C=
LOEXEC
> >   type=3DFSOPEN  ... : fs_name=3D"tmpfs"
> >
> > Link: https://github.com/linux-audit/audit-kernel/issues/152
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
>
> Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
>
> > ---
> > Changes in v2:
> > - Better placement of audit_log_fsopen() call to avoid UAF.
> >
> >  fs/fsopen.c                |  3 +++
> >  include/linux/audit.h      | 10 ++++++++++
> >  include/uapi/linux/audit.h |  1 +
> >  kernel/auditsc.c           | 13 +++++++++++++
> >  4 files changed, 27 insertions(+)

My apologies, this patch fell between the cracks, but it looks good to me.

As this patch touches both the audit and VFS code, I've merged this
via a topic branch in the audit tree, topic-7.3-audit_fsopen.  The
branch will remain static and it will be included in the audit/next
branch as well as the audit PR for the upcoming merge window.

--=20
paul-moore.com
