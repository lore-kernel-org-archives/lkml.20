Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B505949BD67
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818601; cv=pass; b=VS7xZ+JfxBH0q89NCyDac5eTbUetBlJU99hdf5zL9fzhrhh+sTXnRf3uJYwC0r9y7tn+eKY0CX5NJLa9qxlAqFipymap3nHeqLUvumTccL7tQBOAtmNi1g4CSOMLvsxucN60B9Y/3qIuou2ikWpvPjN+2GUw21Fc8jvSwDQ0q6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818601; c=relaxed/simple;
	bh=ZTliVUlbqhN96UOmLmVxV+MSqDsRny4axY4ONWBVUaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgLAWiQBoCO5viiPnLlwl4hF0d3QO0hSs3Hy5QP+4jmyo+VdnO1reT8H9PeeCaQiCypm91I2rwqsYDrOBXXkThOTg0G7nJi3HBS4m87uaf38sdnv7waJlQxLKlnz4Cjd82jJWte9DJAI9sQcHVWnmxnhC9vCPymP4j78v5GWYPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk72UCtg; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk72UCtg"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67687f279b3so1517226d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818598; cv=none;
        d=google.com; s=arc-20260327;
        b=F6c99dPlmXnv5XjXA/GFaSQSfFRCD9MaDZJ73q1BD+JdBdn/Sz/MGvG1zikZAuTX+2
         2uRhoxN2wF9Z9X7kMCbCKch5VOl80krEzQXTO5Ifv7DiRSFNmo3E5uNRPvroGTXI7aXX
         Kruj04Fij6yQDRnP1gCA59WipPKKtu3yKKGTyhb2u5AUU0sg2qakxE1+f+UdUzBMws2X
         Jw7dFEZhg8DqtgRFsUTmhhSHb++2IOWy11zpIPM3pAuxnjcr5db46QrD9EGv9xsCLPn0
         3KuX/HBgXcO3J4D1hcL9gsTPSNCC61t2XXBQtKJzJhTe+K4ah6q3tsVKU1rZ6GIYPE/j
         o1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dxe5/7iE0L8+p44y9JDuvt/mRgid1dnQVUsBId/B/e0=;
        fh=Y/Q7mqoRFz5JE1eBFMYeSz7KO4bCxGxjRr+Lxh8AijQ=;
        b=T6HYPovpM6Ph5qhA6d4VnezMJz2l3ZKRtadx4bXPuLd4M3w9+HtCDQSCcNpCJUO4Jn
         0rL7aay8SnYaR0j4H/BmwhuOq79XrR3QvQ7gLabbLinGARPXQJK3WmB0/rDueUqPvR8e
         G3OGLCvze+WQTSieh/8543Na/e+0oA/4ptNCmdz13tKANBhvfesRGeBTmaSles7rgwCg
         MaPmHdRyGM3RDnpEr195SZYKotUlx8InuiN5sQPPAsM4mjRzq6gHI5qUpY3KYrWMJ7N5
         ZT2vKDIRNAdmy/6WAmKcLf1TxjIbVu/0ZSaB1woXaqsAyw5qX0L4PqqUgZij7EYbFcOS
         nhLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818598; x=1792423398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dxe5/7iE0L8+p44y9JDuvt/mRgid1dnQVUsBId/B/e0=;
        b=Vk72UCtg1FJGt6IIETfINuJHT7wXKgEY9Qbw3qEt7O9vb+OAcU/e68raoZtAWUJ1jG
         tD73IhvgFuFzgBtbS42Rejf/O54aW7yaCMlTCgODMQ1XZU64ujWo8oXLdqkp7c9X8b1z
         s/vjqh3D+8ysnSrOVytEVjqPNY+FX+FGWSXXcuWSezEb/63ldb0JAFm7Bu2cRo/+n2Vy
         1VX7Rvt/uEXf0RXCJOhSVAZMqap+U9zpCmAY55LLvA9S6+7OiQ0QNWGGxkEVwf0mbiag
         fi4T7kMtKuDZi+joA4LQVRfO/nkaJ5HAxaauZ2ierfzrFbiX2GU4UUbWzYn7aBz/Jh0w
         obvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818598; x=1792423398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxe5/7iE0L8+p44y9JDuvt/mRgid1dnQVUsBId/B/e0=;
        b=OiQGZsNFAbAw3FeWeyKMfBdKKbR/WyZqTIKCkCkWfSCkIVLUvBE8BfZ4mDihBGs8Yt
         1VEUbDqWAGEk+Rig63U/N49ftU7jz+3R81jKDtygmyShNPGmG4rW1OEZilMIUkdR6BgY
         FUDCpsp9hhv18WoSgD7wvxwTPOiNyD2wycB+Zi1skgd5sEXwwk66U7IoQp5Yhjwb4yeg
         tOw1wRUQM5V79ZJiflMwDODjVEbfTXkgSHIBe1NAyt9swhNjHRqIiAUxHZRlwm47CLq+
         FegZwyN7tvEC/UwjofqjM8cJyfwL5sD9AG3W2IO+jGMdg6Cud+k7hVVEeEcQPtIBI7nI
         aSeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAGxPkdJ4h9IkPZSnTkyO7K/GBRBL0jOi3214Cur0/DicaxkDDdXxja8uF8p1KLql2YnvhG8ooHH99m6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhyTTPJ+wG9YG27+Qwni9Az7hNYLcYPdMmD96NANQcweHuAf3d
	nGxubDo7MvP6D7JdHgw1Yo2JsJdHoHatb54LL+4apaX/ICbgCDWcfl5O3pd/QWhOqts0poOWBpD
	+I/h0j3H18md8/D8lMplxiyrMVZryySI=
X-Gm-Gg: AYBFou2fsA/L+2fqlOUUFrZFO5ZYt0vzSp3dHb8a8zAjZIjKw9f6IgqhM61mVzp1vbt
	BMrIpWufnNXZ47rLSijUuAY1Kgz0zoQaIcH7UcMb1rAxXk24r+swGFS5Q37vTXA1AihHKu/ER9o
	UEaUYMjaBaN5mVHi4eu4aT9zyBNASMWZwKUzh1OjX6SX9loK6veLkhzSGzxd3hU3xXr8kGl5PAe
	s9yU2Rw3TrU9pIr8+gwiSpul3C7Ol9QfLU2Tivx1a7f+PgulDPKgacacNwR3WtOzdW6pFuPjzmw
	PgeKmA9js8i7HA/BTUSKIDeuUqnPqVPzzXZkpwc4IKaRh/oSVvZvEafnMLzKMWSFdz0=
X-Received: by 2002:a53:ac86:0:b0:677:d0da:192b with SMTP id
 956f58d0204a3-67936006671mr3791582d50.31.1791818598572; Mon, 12 Oct 2026
 08:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_96F9E846FDA4A67FF38C7C393D985A44690A@qq.com>
In-Reply-To: <tencent_96F9E846FDA4A67FF38C7C393D985A44690A@qq.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 12 Oct 2026 11:23:07 -0400
X-Gm-Features: AclHuK-lsvXIdaTbY4bhYNDRFlD_elSj2POyX4r8YNdsklre3_y2ohDtohrCN9k
Message-ID: <CAEjxPJ6oN4zZ+0fTS8+Unp7wNRYZxjWCBrc5XQLUOFbt-xU2Hg@mail.gmail.com>
Subject: Re: [BUG REPORT] selinux: general protection fault in
 avtab_search_node() during an AVC lookup
To: 1sh1ro <yangguikun19@qq.com>
Cc: Paul Moore <paul@paul-moore.com>, Ondrej Mosnacek <omosnacek@gmail.com>, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:38=E2=80=AFAM 1sh1ro <yangguikun19@qq.com> wrote=
:
>
> Hi Paul, Stephen,
>
> fuzzing with syzkaller on a 7.3.0-rc5 KASAN kernel (SELinux enabled,
> permissive) produced a general protection fault in avtab_search_node() fr=
om
> the AVC lookup path.  The policy's avtab appears to contain garbage: the
> first fault reads a non-canonical address, and it is followed by thousand=
s
> of further Oopses (8850 in this run) as later lookups keep hitting the
> broken structure.
>
> The crash
> ---------
>
> Oops: general protection fault, probably for non-canonical address 0xe06f=
3dc280000000: 0000 [#1] SMP KASAN NOPTI
> KASAN: maybe wild-memory-access in range [0x037a0e1400000000-0x037a0e1400=
000007]
> CPU: 1 UID: 0 PID: 14271 Comm: systemd-udevd Not tainted 7.3.0-rc5 #2 PRE=
EMPT(lazy)
> Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-de=
bian-1.16.3-2 04/01/2014
> RIP: 0010:avtab_search_node+0x24d/0x4d0
> Call Trace:
>  <TASK>
>  cond_compute_av+0x59/0x340
>  context_struct_compute_av+0x7f2/0x11f0
>  security_compute_av+0x558/0xd60
>  avc_compute_av+0x86/0x820
>  avc_perm_nonode+0x9b/0x170
>  avc_has_perm+0x27b/0x2f0
>  selinux_inode_follow_link+0x226/0x380
>  security_inode_follow_link+0x96/0xe0
>  pick_link+0x447/0x1570
>  step_into_slowpath+0x928/0xdd0
>  link_path_walk+0xdae/0x1b20
>  path_lookupat+0x70/0xb80
>  filename_lookup+0x213/0x5e0
>  filename_setxattr+0x89/0x1b0
>  path_setxattrat+0x1cc/0x2a0
>  __x64_sys_setxattr+0xc6/0x140
>  do_syscall_64+0xec/0x4e0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
>
> Context
> -------
>
> - The task is systemd-udevd (uid 0) in setxattr() (ORIG_RAX 0xbc), which
>   follows a symlink while walking the path; the first AVC decision for th=
e
>   symlink hits the corrupt avtab.
> - The same crash appeared on three runs of this fuzzing instance:
>   2026-10-08 23:39 UTC, 2026-10-12 04:50 UTC and 2026-10-12 10:48 UTC.
> - The kernel log of the crashing run shows only avc denials
>   (permissive=3D1) and no policy (re)load, so the avtab was already corru=
pt
>   when this lookup happened.  From this run alone I cannot tell whether t=
he
>   corruption originates in SELinux or comes from an unrelated memory
>   corruption bug in the same fuzzing session (that instance also produced
>   unrelated memory-safety crashes around the same time).
> - No reproducer: the instance ran with syzkaller's reproduce disabled.  I
>   can rerun it with reproduce enabled if you would like one.

Yes, please rerun it with reproduce enabled. Thanks.

> 7.3-rc5 already contains the recent policy-load validation fixes (class a=
nd
> permission counts, level category sets, boolean values), so this looks li=
ke
> a separate instance of the avtab-corruption family rather than one of tho=
se.
>
> Thanks,
> 1sh1ro
>
