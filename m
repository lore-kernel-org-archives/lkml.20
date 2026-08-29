Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D23515D6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989023; cv=pass; b=Mh7fwKhsNufmKhlOiYjfsjbYhcTcHeP+f8flPKtjIOxxU5WhxA3IY7fCvHqD8na3NTwqTg36iMbgjmDDkdORjRYSj8v8wjczGQjx35d1hEl+//Zm1SbmbAGE/woF6iVmuJgQQLbH/hxdOORcXGzbcNfnQyBS7e2GYPMcNLy1VXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989023; c=relaxed/simple;
	bh=Sq0THEICTPM284NMNHXd2EjYwdjNxq1DooR5QncznmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCGxSHdWJwb7fPpb4w5jzroNAVOY0JBu5aMDuIKWQnsdywjf0bAxdCY5hEO4EZ1rUMty4JxaHoqu6O7q3qpZoLnm7MiOWjGyXI2EABd9bwZHuV3O0hirdG/j/aJ3aRMFoWBInUFHnUKq1+eCt6xiHi3ZTike5hTbDyllmWbP0QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=ZVWFMtF+; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="ZVWFMtF+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccf2360620so15760455ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787989021; cv=none;
        d=google.com; s=arc-20260327;
        b=BUiVwEkPfe3jx6mWWorwWFEkjXfXpPhfaUejtTnqe1UbVB6k4CNnod+rRmNfN9oq+k
         iTa81DKKDd2JVekSReX9/7eDZq/sjbnLNDPRghVuXNzk/laKLCYkmX7F03l9vNmrzpd3
         /RS/kP5VYpLk9UNS6t4e0YhSQKZdizs61Yi3/nIHL4SxBK9M5Afe+vUhJVqMVqHiQ8z5
         zBCz7uyNtwf8tUZwgYvkID3tjVxJ3Nldxt/0iGddOpaMMEyiswAXRd3u+rAthVJ1Zdm7
         KQWSE6rqTWW4/Sar4DWDF4be8t0qE2Hd/yFsqsRBiIVi5IqS69jYzUtoJSKmXzj/zC6I
         08Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MSSL4DpI3S5luBJGd7I2XVsr9+lwZ5Fn38DQgSdC/s=;
        fh=Z8BDfbe2mt3o744C4MjBU853AVmnCSDoJCf8Vl8BZFE=;
        b=b2vkteMx3GmVtgPhaOrOlQZO5Vd7v4IeIOZKnFeBKsxC9u6dtaht04f+8aATQpBNKH
         OQuHHNTLk0SmnYortStkQNFPoErwOy7r4OX24yAagm3tyuOMDSWmOCWItlvJ0qNw+JaM
         NFgY5sW8oA/sgAMjZ+GYh/2VACcJOH2i62ibYBRIc4G76coOwfEjcE+KDeTTYnSiXu1r
         OTUZGmBwt8r+gnF7OMggqbZemzz7XU17X++1+cT4yi4DOHXQgh4YPuoeomYswGh7Xh2h
         tBfFi2/NvV1W/GA+AcqiSc3FzNbs3hzohvvBr3TYvBW723IUUw/ibjewjZ7QVfMSUBZU
         tNxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787989021; x=1788593821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3MSSL4DpI3S5luBJGd7I2XVsr9+lwZ5Fn38DQgSdC/s=;
        b=ZVWFMtF+S06GRBvuwt2YMjMS/2gH+x5ENJz/rAEm3Qr9FFhoGhCgJXYOmkhDQxZkeg
         5LrGe/zG/euP+tf4emQ+8bMeyPa1SHrRr2DPRx2YuxCVno6vGflnxx7A3rA6g5RoL7eu
         5etlhYe+RkpwNFgP9GUUZwpWaA6p7TwMZc64xfKvTeGI1H72Emaip+sqVL+nJK9p9Ub0
         shBX6QRbVR7lfsmMtKz/7xVqwW8iRbtZGOaFiB/WIlhdY4+dSc3kvxJNV7p697AqJYbX
         ZJPC0cTcn3Zuyonq+k2NFjD3opzzwRbgQd4Oe1/rx+LVSKnjBXH8kn0qPY/NYq8neMOV
         IBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989021; x=1788593821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MSSL4DpI3S5luBJGd7I2XVsr9+lwZ5Fn38DQgSdC/s=;
        b=HnWpktAEK8Kt2+o2PthdRMc6VcsOS1x+05Tmxe8cd6YsE9Is8EmkhYbGc310bb51sY
         1MRavFUMaOnSBGNFdy+IsTuGza9pJVeEAop5LZXo5FzN5xjhhFom4dcJdmn1I6ulmAQL
         4vxaHVtsg5/E5/43YnOIE5sd9a5q7H1LqJwfABB0sewNT/FEVw8Qd5Q3Jg0IJxobSLw+
         hognKMq11MTbXFTpsx7XwsZOLC2EvQzF7d6ik6ChtWUZICmpco8fSNQBOSxlwUBov7Mw
         m/W4geXpS61pzNM0LvpUFVsGmAX6bR2PY6vDozEWby0VVYgEI4lcrecUMmxDpPyH1sqd
         wIUw==
X-Forwarded-Encrypted: i=1; AKwUvBwBJSV9b1sHPanzw6gP4olTs3yOluPhZQWxMhZRFrapaB3L6jBVG8H6GetPKuGiykeR1DW6mZaT8aWE0Lo=@vger.kernel.org
X-Gm-Message-State: AFuF++mnp8sN6Il3zzlHMgyWzdhZ7t7iJIQv/VVl8Ckz6mkQQhxN+bSa
	/1THef0sBVUifqZFNA8CaDUeKtV3KVnESc3meJTuFLSLB+RC/Gh2N0fZLB/hIuZ27sdBBPVd8rJ
	GsJ6Wv4rkSlFq2eLDX8jxAEm973sjBx0ps+l4jsgK
X-Gm-Gg: AYBFou0k3nMFWmVBLpvjQj2lBegbae9O41D689HYsUfRGvqK0AvgSXetLAKNF8KmR2V
	FF4YGnAmyxkFfJzkVehSuMj51OaHAPLEEF1/6VUq0slSwjMq3tScDgFl4IVIzBHASZHBwKM/Es5
	3NlLYqrISGlcq+8LADTF+m11WwRVkHyh3yYgTx4h9DHYq1jUOC4azC2koW6fFXUwKveNz4k4hJB
	2YWPCSsH+S80fkocfevpzt1lYFT5csh3zxnUDahU6qLT2ViBxFAM8TEipH5EhubjNGJzuzPb5xi
	UsckY8Buc7fpp8ZU8mj9gmpAhwQomqicEvGEDJmDXPYHvw2nBdYUzy4yAbOT2bjf4A2+UIZggYU
	Q1/qo3tuG9uhf+ot1YA22djZa+YHGVNI=
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id
 d9443c01a7336-2d74df0328amr245182145ad.12.1787989020140; Sat, 29 Aug 2026
 00:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCjUB=g+56ZCrT4MPfWjqBJX_CO=vfp12JLOrh7B53uVWQ@mail.gmail.com>
 <CAKYAXd-+bctZycpVKNkQTifthktnWdfOHsKdsNBzL2droo_yHQ@mail.gmail.com>
In-Reply-To: <CAKYAXd-+bctZycpVKNkQTifthktnWdfOHsKdsNBzL2droo_yHQ@mail.gmail.com>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Sat, 29 Aug 2026 00:36:47 -0700
X-Gm-Features: AcwNN1VBtp80MVnTOITevZF0ucoYfN-z3oSxf1HJNZTS2Qs4XRS_nWl-BWNkbVA
Message-ID: <CA+0ovCjKMHB-TquTScxKkmRascnfe6pfrruT_V_W1TXv5fbg4w@mail.gmail.com>
Subject: Re: [BUG] ksmbd: use-after-free on iface_list from the netdev notifier
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Namjae Jeon <linkinjeon@samba.org>, Steve French <smfrench@gmail.com>, 
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, falemi@asu.edu, linux-cifs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on 388b607d107c07aaade04c7f22f344cab6bdccd3; patched version no
longer panics.
Thanks!

On Thu, Aug 27, 2026 at 7:39=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Fri, Aug 28, 2026 at 8:08=E2=80=AFAM Farhad Alemi <farhad.alemi@berkel=
ey.edu> wrote:
> >
> > Hello Namjae Jeon, Namjae Jeon,
> >
> > While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU'=
s
> > SEFCOM lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/117-ksmb=
d-unlocked-iface_list-uaf-netdev-event/
> >
> >   refcount_t: addition on 0; use-after-free.
> >   WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x9f/0x110
> > lib/refcount.c:25, CPU#1: kworker/u8:3/9983
> >   Modules linked in:
> >   CPU: 1 UID: 0 PID: 9983 Comm: kworker/u8:3 Not tainted 7.1.0-rc5 #1
> > PREEMPT(full)
> >   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> > 1.16.3-debian-1.16.3-2 04/01/2014
> >   Workqueue: netns cleanup_net
> >   RIP: 0010:refcount_warn_saturate+0x9f/0x110 lib/refcount.c:25
> >   Code: eb 66 85 db 74 3e 83 fb 01 75 4c e8 db 45 27 fd 48 8d 3d 04 03
> > 1a 0b 67 48 0f b9 3a eb 4a e8 c8 45 27 fd 48 8d 3d 01 03 1a 0b <67> 48
> > 0f b9 3a eb 37 e8 b5 45 27 fd 48 8d 3d fe 02 1a 0b 67 48 0f
> >
> > Our reproducer.c is available upon request.
> >
> > Happy to test a patch if that would help.
> Can you test if the attached patch fixes this issue?
>
> Thanks.
