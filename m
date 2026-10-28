Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202108;
	b=5Y/Fp0PFA0ErQkQ58qrmeAimE5A7sDDsZkqIeUwoHLrXKv83DFULQ3XyEldxwd9+uoPd
	 h66/KF34m2cMdtei1g97SQ8ByCwUDuTjI8nfaxCNJrklPiJIgetzHjy1M9ZdTStPPGJWG
	 0Coo+YwMGbeXYVrUKiflU2uK0v/aESKWTyiM5tiReY+Pa09pRXVbY2ZwHmXXjp0PkiDZn
	 1FksTt3NVofvv+AmmMCBTDsSSgV5jOcMJL0h3kH5y0MSA5g2Tu3G7h6s8p0AQaV5Ni4I7
	 SL/Hl2lEeCguWO8Jti0j62B2bhbNXC6Cf6Pe2sCeBbWiO4bey7CYOlVAG5RW25ud7pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=tjrlHX/0kdwAUKf7ZIYHTYFr6AhUQSO4XSQL32E0SVU=;
	b=VfVL/AEpXJcBrMBmxdokPjWyyImw6jJFGeK1h5EioyFuhNIJZz/Of95aSr2kPo5mKklH
	 X4KxOXH4+3xPLlYxYcGBzeopgI2lfkTH6SzrSPrPQxC9Okw3pqy0lH0+F94jEZfiRXiHf
	 h/0pNqIKV4z/zcVLaFDUn8e5WfTJ5OBg6yIZZN8HM4J96c7hlHMIzWQjsHd9dR4T38Nlu
	 LIAZ74wJJ8rXt24hkiadJblmlNGJmjhXtQRW+IKrLjtN8nf25GLVxYNjuDt8xszPid/2+
	 NjM71MXrmE7MSpLNRtsql+kooDf7H5p3KBc0N7bnl/oK3Wl5Xl3jhxLlEWqt0kL3VvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2+pBuBK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5260A2603
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA5260A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2+pBuBK
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-499f20c7054so601296fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202107; cv=none;
        d=google.com; s=arc-20260327;
        b=n6bhINjTphSilMsIi11QA7nsMhgIFEqSxhpUr88O3sXBLxQpuDt461fP3d1Alx/Su7
         Xz7TpVnQNibUMvOG2cR+KQa+NLfzTd5DxcYAUtdKKDVJn6/hrebBAGy/ExDBCiOwIMDV
         cJTU6alsSaAXZN0JNtONEV3/rPegJLDIz+hRjk4foaJWBXg6KU5N08TYjEZpXSM6RYiT
         Nt2tgLWSaabHyJHFj6i25PpECP28ihuEYqIZpy1jf53TqH36h8Pxg6qWRGlaH4b/ADbJ
         4zhek8jJQ1e4Cd/7tBUmeK7+Yvb5m+sjzhV1EpYrApvMurfOStdCSOY9B0zYkOwRn4Ot
         e5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tjrlHX/0kdwAUKf7ZIYHTYFr6AhUQSO4XSQL32E0SVU=;
        fh=7InvDaTLX9WQrPx360gSHYtT88fUGpf+ipKn3Y9XpWY=;
        b=MfOOmGo+j2NS672ToyKXzPLDBWPSqBRqWRa2r7aIko11U3luVMYKxpCtfdu+JKo/c0
         LWROxnZqkcWumo3gZiJ4pNbT4l844SInUyJgxqQvxQ5S7jyGhYfNmfNr3BOGGcYFXMXh
         ha5T83bAsRdYJV2TiswlQbI2wEOetk4xBt6XHd3EirBL6g4VkHFBLOQkqeeAgIFTAcwX
         mtsnJxve6gyGgM4W46ABamlRT0JBsaMUSDS11kkUaH/SY6tLVERjHFXdlX6BK527LUUE
         nFkzz6uw74HQuqUTovVEiniLSJojTWAXj+HuMRdBUdTxPUIQ4fhH83ZbrNjt9b9h/RxU
         bQ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202107; x=1793806907; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjrlHX/0kdwAUKf7ZIYHTYFr6AhUQSO4XSQL32E0SVU=;
        b=c2+pBuBKpMrcTM4Fj/aKEJXXW8NZq1OG+IQlwwJuYHFBMsAQsldJEvNdTSzKmgXHpF
         z9z4jr6dfOZ4k2/JHLFshAOO5/lrmz5iY0AqIVoTFaCSxne3pBAWJN8qF6PZqpaTxf6l
         fdPto5dhQH4pnfOPP3lthbkCatmfWBExe4bdZzlBKRigUa3SZxs1FLsKACvU0xNpUV01
         EgtXWQsIK09V3CeswiMcfiEXC6RYjHOO8dn9X9NSn5FAnZK4xTxkapcerl6L/gwDBeeL
         +dl/MTVpnPGmbbM3gQaJBxBhMVhTu4GWTfAyzDrySavI2JuKXSAXtKkyumFYKYdxbgcg
         15Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202107; x=1793806907;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tjrlHX/0kdwAUKf7ZIYHTYFr6AhUQSO4XSQL32E0SVU=;
        b=KAJmK+MZKgcbF1vevucQAbEPEqSzt732TURyW0pHh9oB9ZGhKejDwTxsGtw/eyl5mo
         1t3wiWd/0MVQlsj2wKWTi+lygYB5XVOMnDBEB98SHJucw0b9DEOzU30T2iqokfXlJXpK
         Jb64J9SZNkDNypLKG9IoxaqwLzhNxPAfwFdxuEP/kD2WCUA+j66uvIF6PYv95zc5jviV
         P2mqwRP4OjjUiWWH2b6vgXx2wENjjK6TKNhsIcJTJysZO5dsh6dSJbKTzvJzPDFgYQJ6
         uvn5F6l3euffQL/UJgC/M0xh0GzawftyDeEgNJoRH5tkwaX85gdhAbGbk+1t+HoN6xMx
         FnSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrbXwjD8Z2bPKXhBGY9wHc1xVtcBeA7iYZTlzOh+ulo194I0JOX7xACrS47/mAcgTZ9ssuEsliMNqiYgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJufFxEvCOke+4r7OwhXX3MVLvstUu4olY6vpXD06nGmwxSJvLs
	tJjh/DgWfGHRwudmBql0llaz+CypUyfr1Nw1xaw4clIbgfQfMHbuETUGuZFwBESGLwb8iRZREKV
	OYMM0CovH86LiNDJHGm/Hc62vJdM5DWQ=
X-Gm-Gg: AYBFou0rVU03QYOvKNW8/MZw2BmfVv3FW2CoxC1EiUrpFjbbanb3bxBne/dkwMgMPO8
	4esHylTRv1W/FgTZ0OKjyEDobJgRWQMc8w/WK60+WBJMVBMwk23Vh238tc02StzTk5jMbowptMm
	gi88uuTgppl1T7ppSxtWX7L8YHnlY91yTsAN1hAz3dp2IMq2xb7mvt7guXzysELFnAcFSF4zm0A
	RVoaV8n3nwOK8amTyBlRlckVZXry7grSTS06/ScTZelSVsV2ebsvvXVrEk+rizgDyaAKU719fwL
	/TafQ9/FyyxXqxJtKTy4xDkK5ux023eAxDT12F8m+mEYWXysjmf3lsMj/c4r/QMHiEaXEikJ/hT
	YxeJvGOfOhL6OfjjwndX5HwReE+gChi1zPzmu
X-Received: by 2002:a05:6871:7516:b0:49b:ef98:3f62 with SMTP id
 586e51a60fabf-4a8bbc2726amr2070793fac.35.1793202106382; Wed, 28 Oct 2026
 08:41:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Date: Wed, 28 Oct 2026 23:41:35 +0800
X-Gm-Features: AclHuK8sIaut7YlkPpWH227XFVgQSL3JAg2wQtfEBeRe1A60FwEilkx8nA8Jty4
Message-ID: <CALf2hKveij_sHgANY9Aktm1dPa4wfKjKNkHyp9yPbjORWFXagA@mail.gmail.com>
Subject: [BUG] watch_queue: RCU/info_id overlap leaks kernel stack
To: brauner@kernel.org, dhowells@redhat.com, jarkko@kernel.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, security@kernel.org, 
	edumazet@kernel.org, ncardwell@google.com
Cc: lyutoon@gmail.com, tpluszz77@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Linux Kernel Developers and Maintainers,

We found a race in watch_queue that lets an unprivileged process over-read the
kernel stack of the task posting a key notification. On x86-64 the disclosure
contains that task's stack canary, kernel-stack and task_struct pointers, and
two return addresses that reveal the KASLR slide.

The bug was introduced by c73be61cede5882f9605a852414db559c0ebedfd
("pipe: Add general notification queue support") and is present in current
mainline d135ab453a7400a34930bdda1ef4bdc8acfac80e. We reproduced it there as
an ordinary user. CONFIG_WATCH_QUEUE and CONFIG_KEY_NOTIFICATIONS are
required.

Root cause:

struct watch overlays u32 info_id with struct rcu_head. A notification poster
reads info_id under rcu_read_lock(), but a concurrent final put can enqueue the
watch with call_rcu(). Enqueueing the callback writes rcu_head before the
grace period ends, replacing info_id while the object remains visible to the
reader.

__post_watch_notification() then merges the corrupted value into the
notification info word without masking it. Pointer bits can enter
WATCH_INFO_LENGTH, causing post_one_notification() to copy beyond the 16-byte
notification record from the posting task's live stack into the
attacker-readable pipe.

This disclosure is independently security-relevant. It is also the canary
and KASLR bypass for the TCP stack overwrite reported in:

https://lore.kernel.org/netdev/CALf2hKvp0NPVLwr=a3+jUHtPohxbra8gox+aYAfWathJnn-J+Q@mail.gmail.com/T/#u

We demonstrated uid 65534 to root by composing the two issues in the same
unprivileged thread.

Reproduction and fix:

We have a short source reproducer, exact config and QEMU results. In
accordance with the kernel policy, we are not posting the reproducer publicly.
We can provide it privately if a maintainer requests it. On the vulnerable
baseline it normally reports the canary, stack/task pointers and two agreeing
KASLR anchors within a few seconds.

Our tested fix gives info_id storage separate from rcu_head and masks it with
WATCH_INFO_ID before merging it into a notification. On x86-64, placing
info_id after the kref consumes existing tail padding and does not change the
size of struct watch. We will post the mergeable patch separately and link
that thread here.

AI-agent tooling assisted in identifying and analyzing the issue, developing
the reproducer, and preparing the initial fix. The reporters reviewed the
affected paths and reproduced the issue and the fixed result in QEMU.

Reported-by: Tong Liu <lyutoon@gmail.com>
Reported-by: Qi Tang <tpluszz77@gmail.com>
Reported-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>

Best regards,
Zhiyu Zhang
