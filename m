Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E73547ACF6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251294; cv=pass; b=UkziYL32k44tQuqYgX/XJBUrDvf1EFo17RYNOoTEBXi3ektQ9Eo92jnkFvtIeplR5T9QlGEYHVmvDOiIWzhLtdybYfSU3BZRMtyonRIpTZleMwp6b45wu6yN51vpysxq7XCO61a86bUuiXE1YTuN4R1/d+z25lvlOhp4V4kM6Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251294; c=relaxed/simple;
	bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvWPWGojrsD9ny6ldYl6538iXWhSjBnoBFSFUcDApWGAoLM4C4s97PJ1hj0uaYDsITEkxjIToxP62k0Xk2x3lScZzmwqhnyoeI3igF7mzotyuGZ1JbqbY4D30uI+a+aR/9EUnRy//zzZQrn7XNSIKaefwltzmIsBOuXV7SEsy/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5OkRgap; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5OkRgap"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498012a61f6so38185e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790251290; cv=none;
        d=google.com; s=arc-20260327;
        b=okqPvcJHomj7uRDKIw0aChWM2xU3CoK8xiKTYek+bvSseuwYaY0TYaSvlB8ngmR8RQ
         08MZP3iqS5LTwsKbLS8Et+WuFk7s7J6HpDYjcVs4cjKXfwFwCL33nmfDrcNBiHjqulKO
         jB8EiTLUbhhdxN8jELqXcWBvW7IJUCvryPbKt1GmI5rm3c2LnFQT6NRbHlBXeiGz/Jbo
         maCr0/f0zi0LtfXkjPOUHdKIx3FUeS101ka+1jzhXFqRZys9FTWj0dnELelXaf67are2
         qoj8ZhxZBEcGQbGZYnsQD6i3jah/lTYAWn8BaP+3zv5zvBjAqSJe2K5+ApB9ggjXzV+V
         vt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
        fh=qQnCP3gW9pxZ+ImsF9tYUQO9VyF2XbA2UZKTE8ROnxs=;
        b=V77uykrBrobvGc7lHVs7A3udHWnUZAjokdPkQulD8R1UNasy0kVqq2RtOfdD1weMTy
         7A5qDXmdIFC39GGMWRjvTnh+GdG+tYuTdOl246PL/skY8cVnsuVn3gnNQssR4TDkyhy1
         CEDDfkmL6VO8L0JsiGZ58jq/wW6wUewIn4Bz9elwRwFjIaRZLHIxKEwBMN1OIhU5xvqc
         kw7BGjBEsmf6UdK5f4Np/rUz8qN2EbqPW2ZNZaQgLqYbqmeBL8bsSrlUgn989ITnySDa
         Xruiz7GMs8eNKg/wE7pA5ZN54pvz45sONfkqPKJMxAnNqr8YIVdtqB9mUIMiPCORfzEE
         NXPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790251290; x=1790856090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
        b=W5OkRgap3yQQo+gVYE0JiSd4ki5m8eK0DLUOU75qePH3XxnmKCytHlN1rxQmPqx0xV
         QEHlbp113QWtyQWka9CaUg2UNuICo6u95XEDMlTSJvGg+iZorTjZZf/1fto4kStOmIxw
         2772l5DYKQTTb200R57cmJU19rphP8ZRvIF/ddRog06dvdUQTTv410LUgAg30HW4EiLs
         jyy+4aEbbCm0p1GEywkhD0JmLjxTGMgIE5QvZWa4a1REJf+kocjVtjqqpFGduzhf/V1N
         sWx3QBapmGRiC32GJoscvyOOqEdgeohS3slkuSrwTaKlpbH4eFnQjKjnm30Ym6BP8UB3
         C4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251290; x=1790856090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADUClccYk206h7hPKOGkSKqz/BqS2N7kbEdhZoaJr0s=;
        b=gQhJ7nA4Fa3cRNdohIhH77o4ta8w8HgnWcLhS7YqNxHFur0ear863EhBWCYl285c/s
         k9fFhxbIN0kPY//bwBJ3meANlw3TKCQRuJizJXiDjyXpkeLpgkGYKWfLRbsRYuNvaSPY
         nRO5kIGIhCE7/vSx3URGVlugrWPxbKAOM3hAi0DCtzhhoY1xSszHAkqzmiFjeGeqrVoZ
         PkHJNZR3t+s9Jg5F9H8jRcncEoA94wC8jH0ApHTe4y6T2YDUBVNJIFV9cX50eTfmfI4x
         6tVrNF4T6aptbqzPRXR0sSlDdVe7fobTLBrVl6C4hJFClT99ofn3LNqiLKqbveB9pKSL
         ujFw==
X-Forwarded-Encrypted: i=1; AKwUvBxXgdvInwhfAOOyfRcat/IkRrDt06BsGs2duAIEynWkfxgOkBaYZY9L4jbrqLMY6ZTXuvlbL6cHLlYt//4=@vger.kernel.org
X-Gm-Message-State: AFuF++nE3rIRCZ8iNujahQYydo3RwJPeKi9QqXT/GC1S9t/BOI21HhMS
	rfkG0cjDdzrsDa6km/Skegi+4prizJiY2bSU3DU2nxpbrUee99dpviIzqXqH2IBlJiJinA+BYt+
	TP7Rv6tKVEz/5uXhLn7axGvHlJhNcbg6y+3vxNkQB
X-Gm-Gg: AYBFou24dCd676eFRW1Q0Vq5xenCRhzIs3Zp984wO/dVk7k/IxuXJorIZlzj/Z0OpU5
	hg9hUedxD/6oB+Inisr+ScV+ucxmrDERM7whpFhhlKDLzAF3QiMSnt9qPQv3CMacS3gCkGNhDQe
	hivp57ZNKPU7JB4N55y3OcijKY/J5WJRCiPTawn8XXUhNZz56rHsfTw4kKROcr8IqWiDuWcHGLQ
	kTdUJXW3pQ9AY4Rx1oqWoOZG9hdXKQ3qeW+KiNR8K6qaT91YTffx7+HV2PCV3NQyZ4xVeCE91Lm
	OnSsbmRvYcqIxsenLhLYfA8jhWqgV75Zjrzh1UHhjDbAT2B5JLkdibyoMkYY18urr+VlsO72Wm1
	hRFufNXY=
X-Received: by 2002:a05:600c:570f:b0:49f:e1d3:fe03 with SMTP id
 5b1f17b1804b1-49fe5996f16mr573675e9.3.1790251290130; Thu, 24 Sep 2026
 05:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com> <20260910184424.156341-1-shayba@google.com>
In-Reply-To: <20260910184424.156341-1-shayba@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 24 Sep 2026 05:01:15 -0700
X-Gm-Features: AclHuK9Au5z8ENRx2IaBAjigCgDpk1SWcfpHMs-ScW16pQ0_dNBiZHTtShRfceQ
Message-ID: <CABdmKX0B7zVfLY9Rov37U+gOTEXYSCMUe6=xFddOrKDVneiBGA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Shai Barack <shayba@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Bernd Schubert <bschubert@ddn.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:45=E2=80=AFAM Shai Barack <shayba@google.com> wr=
ote:
>
> When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
> other fadvise advice on a FUSE passthrough file descriptor, the VFS
> currently only executes generic_fadvise() on the upper FUSE inode
> mapping.
>
> Because FUSE passthrough does not forward fadvise operations to the
> underlying backing file, pages residing in the lower filesystem's
> pagecache remain resident in memory.
>
> During media-heavy workloads (such as image thumbnail generation or
> streaming), single-access file data accumulates in the inactive pagecache
> of the lower filesystem. Under memory pressure, the kernel retains these
> stale media pages and instead evicts active executable pages from
> running processes, leading to severe direct reclaim latency spikes.
>
> Architecturally, Linux VFS supports filesystem-specific fadvise
> delegation via the .fadvise hook in struct file_operations. Implement
> fuse_file_fadvise() in fs/fuse/file.c and register it in
> fuse_file_operations. When passthrough is active on a fuse_file,
> fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> to cleanly invalidate the physical backing filesystem pagecache.
>
> Signed-off-by: Shai Barack <shayba@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
