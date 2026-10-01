Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5D2F0C7E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859015; cv=pass; b=LqDzNShc2q32ICGTuQ1q7C27Cjm4O7LirSVLFgvUjwb/8U0SSkHb/BzqaG35RNDnOKIS936iCeSx/Y8zV+kMY7WMUIIGkMpLp4857jCE+gUjkOy8TpxgC3Z2OiyItlaHlc8MLnJEHAmURV8JIZ6PQS+4qve/KuSYf6gWsqV6c6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859015; c=relaxed/simple;
	bh=IntBjALshESUxt2/Xcsp+r3Oo8K0liJGdBUUou+LzLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOnDG5nQeHz2gVnLWGn/8IzJE+4dpXwqcidL2S3Q4ouOdUqNgZv3lripxJ2SHKiHPigxIXmnZezPgYS0OSlgifilqjImmSD1y0UmBghPRmOHvCI4DQja0qP45fEHM+a/64DMPqcGfjVaNbyzF2V47v88O8QkUfqXEsaXWIqFSHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org; spf=pass smtp.mailfrom=bitbyteword.org; dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b=DDVhuqtn; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="DDVhuqtn"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8ab4b4f3d6eso13072287b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790859012; cv=none;
        d=google.com; s=arc-20260327;
        b=OLE+3v0oTIxSIgX94OvJaPLTSb1/hiyDI26A93tbYyBqrWEC82ZPis6beOmxGnRgRa
         ThYgtIX69/Xc7wDoCsD8k5Zu1aqUqMRd6NVzPNtwuDCfkbUUPl1oi5TtvQMMbzrjMVEa
         KFHsdMNVG7YhPh4e4WqB94fpgOu6zhlgneCC7Eih1n5Q/AXzxe58m17q5+rgRn7MjwFF
         DXZNnOcpIEOsWN7EK+pwC0vxugQ7VYsozflxCdrqqSulUo7mGgoMPNz1KIECLztcDK57
         AdBZjUoxtAUXcqTJLUWCjo5LkCnGpE2fm2tN9l/BvTVR8julesct5M2Tos/aJPVyhFiX
         2gkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7MmXu1MySFRvzo+Drdf+bzFzEcZgGkKpqjZcehScO0=;
        fh=wsIaM5iurw0YNhyFopqIMC4bnhxCg1poS4el+4s9iEY=;
        b=DeiCI2SRSpTljXkjOc27+zFRR+5BvPYOjV4QAUDyZckhd4NrKl/liwxr1ltndYvnRY
         gnwj2cEbBjzVO0DwWcAjgtDXKGF389t89imx2n3MVe/QUzXk4dYq17OlfRFTOwPDvMd2
         syzhnXmorCz3C+77qIGInm9LzrWxSE6EJV1gNITTIYFsgayfkDQR2xemtfjosfufBvLq
         NbMtEPQdU4AYUDeveAUYyyZeYe084iZHh0p30icCqYK4I36W+J+TbYxPKjvmqLE5EFUd
         zQrMt/H/XIPE4V6sMJteRxNd/W1E1jbvMRAjMsMLqZ/LIlNRlRULcA0Zon/A2TbBekdI
         CayA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1790859012; x=1791463812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7MmXu1MySFRvzo+Drdf+bzFzEcZgGkKpqjZcehScO0=;
        b=DDVhuqtnT9o9tqcjn7y3oX+aC94T3xbUd1GF2KB4QV9wDDz36I8o9sYyosaAfl/mPL
         NaXSvXxkVXnyxVMt4R95VdNZ/E1NjDw+7cthBWFyAlGZEXKFjsad68bTyS3TTk/E+ynq
         909xWHMMUSmJuuofKi8DFVZuR6Lghwj6YtJdokGiw87GjU5NFO0fCFKEWHeZeY74/brs
         04DnA5UpHYgotwmRZUbAMnXXgMaXQT7yYCPPw79OMoz2C3u4s1KkQcHF4Gz4Qu/PZvH4
         5MRPDu7poUimluDpt/2mCBwD13QoT4ypVoAHKoWewyeDzIaqBRk7ECYy3rpcKGKCFAxb
         Vs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859012; x=1791463812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7MmXu1MySFRvzo+Drdf+bzFzEcZgGkKpqjZcehScO0=;
        b=yQ7oKAKDzcab+2C7M1vgajNCwZwqCDbcYnsCaJx5mHPKWvAcVBP7EHh5lKHZogWZhI
         fOQh61wgZD1yM0B0zJQ9095w0j46ImkvVDKLVB8DFDT7NaOaN3ZtHa3SaNdR4XSd3xiI
         y5vqY3u9T1E2T3/u3eWMLnwhlhhwk6W44NKfrCRrLgnZa7M8BsZ9WTkTEiwR9cIEieL5
         17a3VVHzxWz42ORYmWuuTTsnaqwlARTRSvmTtsaAx8K+T/W+B9j13DANJK2NsWpZ8G3w
         2aCzT+Ek+AVlpTHKVK/drvkIc6t4mG4j3wbI/YT7e6vgthZ616PcpUFC/DbDxe5XPYKP
         /J9A==
X-Forwarded-Encrypted: i=1; AKwUvBzImTMcQ0WsK01dpGZsdBIkfeI9ydJj5Db9zY22ijIG449uDpUPnsNOnIkhp99tzmclZyOGPHU8+NRaqkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNWYNRo8Id+NYV902iVZp9axS9A960umsZGV7FLup66O+tK8CY
	8eW20J5nXTfbflAJntZBj527vksl9sjJxELPKw66pKVxbLjUdGUVuURQTi+avxuP/dAFC0Ql7jX
	HS41CZzaBbpeMlUD+aUNj36wAHhNUQnwuyUusj8R+UDL6EfeMD/qSbE9Xwg==
X-Gm-Gg: AYBFou07u/LvdS6XJw1L4hnAQxIBg1Pl7kJGN+G69dccn3EoIFwZqneNBv876WfGowQ
	AUzPqNm5caLm0Zk+qXFSzJDD6J686HLw8Oelz6g1VM763A6Y0ggRd1IKd/m9KOSRAINVIuce85t
	rmMwNSVw5ociBDhbGznOm4ahN3dGqactyRSnOIuSLrc5omo+7MgEdof3C/N8rNRiiUTyHh68lT4
	H2p36M3hTH7IOIUT+N1fXbUqibz5LXk5+FAYar/+64XoAgjezQmxlPuQ38lK8AlDr5ickniQOwX
	/J5RNIKfbF3S49CbTCm7JTOP/OwnfK4i1ypRnXMhiXMeLy/v8EhIVjo=
X-Received: by 2002:a05:690c:6f87:b0:8ac:bc90:292b with SMTP id
 00721157ae682-8acdaf52a9dmr11632467b3.13.1790859011960; Thu, 01 Oct 2026
 05:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar2YlFYjYUZ49ZA5@chrisdown.name>
In-Reply-To: <ar2YlFYjYUZ49ZA5@chrisdown.name>
From: Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date: Thu, 1 Oct 2026 08:50:00 -0400
X-Gm-Features: AclHuK-_N3_qxjxd9bTnnN-oxG5y5bJDlBCdZoAzF98oOnG_2AToXeAApXLnGhw
Message-ID: <CAO7JXPjPoLLMg39ZTPSoSuAdPUX3VZmPg_J9bKZc2FHxhO3khA@mail.gmail.com>
Subject: Re: [PATCH] mm: Make swapoff interruptible when unusing mms/shmem
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Kelley Nielsen <kelleynnn@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 7:17=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> try_to_unuse() only checks for a pending signal between mms, and
> shmem_unuse() doesn't check at all. That means that once swapoff gets to
> a process or a shmem file with a lot swapped out, nothing can interrupt
> it until every last page of it has been read back in.
>
> Just as one example of where this can concretely show up, freezing tasks
> for suspend or hibernation has to wait for swapoff to notice the
> freezer's fake signal, and gives up after freeze_timeout_msecs (20
> seconds by default).
>
> Here's a facetious example where one swaps out 2GiB of one process to a
> swap file on ext4, starts swapoff, and half a second later tries to
> freeze with pm_test=3Dfreezer. Writing to /sys/power/state then fails wit=
h
> EBUSY and this in dmesg:
>
>     Freezing user space processes failed after 20.003 seconds (1 tasks re=
fusing to freeze, wq_busy=3D0):
>     task:swapoff         state:D stack:0     pid:3175  tgid:3175  ppid:29=
55   task_flags:0x400100 flags:0x00000419
>     Call trace:
>      [...]
>      io_schedule+0x44/0x70
>      folio_wait_bit_common+0x1ec/0x3d0
>      __folio_lock+0x24/0x40
>      unuse_pte_range+0x2d0/0x348
>      unuse_vma+0x158/0x248
>      unuse_mm+0xfc/0x150
>      try_to_unuse+0x104/0x3f8
>      __do_sys_swapoff+0x220/0x5d8
>      [...]
>
> The same goes for anything else that wants swapoff to stop, like an
> admin hitting ^C in a panic, of course.
>
> Prior to commit b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> try_to_unuse() was driven by find_next_to_unuse() which checks for a
> signal before every entry, so let's restore that behaviour.
>
Nice find, thanks for tracking this down and fixing it. The fix looks
good to me.

Acked-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>

Thanks,
Vineeth
