Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85C38B7D7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529410; cv=none; b=GAD6mOGShQTsAW/CZX2+l491pL9d4t2vIRZyLVvuZwrGV/9U1CJEywPti0WYhPSLwc3kdlW0VNP6gsb56uXBvD2hf3YVaPCsB1sY2mpjlR0treQEHTU3Y4QPosF/twgZxXElSsxCVkOhhcVKdI57KFwCirIZs5M6TRcCeBplL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529410; c=relaxed/simple;
	bh=lADoJEvJwLqad1Os9IZPoKdohrwVmSPNwKLow4aYg5Q=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=r0OBkfh1DZaZOyI9ToS3Z87FQRixQA6eiGqQKCreZKPUsDdkvEeBROValz/oj678nXCjWHoX00JAKVcV/k16YOift+wbvvkFfquxl+k1kXlklAXHd3iLmJoN8emQr/KM1z0xxdmq3xbvJmhO5FOV8jUur9Z24qaOnvdPF9/3eLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OH7+hthr; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OH7+hthr"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530e2f50d01so4919961cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789529407; x=1790134207; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bm31ePa7WsV8qeFRceTtEGTceD7Q/MB+XojEjfCZKc=;
        b=OH7+hthrzUpNeHKYeYOdtaWhni6Isql8vs2c0NKuX2NCWCbAI5wCrK2wt8OT8DqDHh
         8Gi53QBJ/6Zo9Tw8M4+KwkjWgeNIQpLoTKmQuom/wd0+/NLAG8ltlBrwcwddIlmxTg6Z
         8RtoohipTkW00LsL/fcLpylbxVHXJxkcSn4gOsfE2p4633GUSiJJ5+f+aGqLU0Y85tYR
         c6/TAle8X2TbiqyNNhhKIfFjq0Yh5Nu8DxIjXwLWWwP/us9kBevxJ1n0hwG1x/igfytA
         35UzFKqsCGhJiGCgOYjunMhQOpgSgeiMpFkGSJKeyFmeC0N9A2P/Sacij/ZqWZO9xLX+
         u9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529407; x=1790134207;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bm31ePa7WsV8qeFRceTtEGTceD7Q/MB+XojEjfCZKc=;
        b=al2M2/XcxLnpN57mNPidQtK0rQ5aZOyPaMZVeygahf6CsENVVe7TxhytSdQb9wimqb
         qn5NLE8GRKeUUmvKffBkn1Eddhq9UIPeABMF73C0c9+fvCkny90V3/d784DFbZLNT/l1
         FRKKQkAPHnIINKS0B4YVv/ucu1c/vFZHzeCRMt4TtgoyrNaRTXuiMlHUd9yfqWFuNweX
         LWIkw8HQE2H+lJR7DIEJPBifOMrQ6n4ygaTCGVm4gy7GNo/N4bMBKRrYaTm2dfQy/Hkf
         Wk4ZFFOpwYEPyV0XTN7AYSuNqJeQXlElOoD/ZH7fbRfYR6Xt0NZMax+vdfluJc7Dqt1f
         03Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw9PBServS3fwmwe9gvftTFv1n+DSBLb5c8TIKzbzZuSxMxxGJxxQT6K/KSL4vjtSQWAQddNfpz9ttHlMA=@vger.kernel.org
X-Gm-Message-State: AFuF++n3uZgC88HSYaldCKQFhl+mt7mHHsZ6SJIKcFpuU11f4x7FZ2MW
	FRdKkIkIOpw+g0kJgVPWXUAnB2SW9GOqi4rA5EH7Az88H6o/wLANWPfdyDNxQ5/dwA==
X-Gm-Gg: AYBFou1Q8mvnEM6n45X3ThF4W2wg/P7wWX9m+NMNphid31ubV5J17ancZxCuDiNm14s
	acrbinfyqR6F4q4J5JtY9+hECFMecfDwXLgCIaldKH7s+UOaX29Cyn8/V7NAOTgkzrIfJfrFU73
	xat9TGXf/IhVpie84icEJcI17glVwmMV7HoqCFhXpcLdrE+oC6xdnCJi3r5SyL7fRnE4WQTqr7e
	21dvgkFyeqLxdYdJitqlXVvgvSl+gYHWSjSr951hLskVsbdFMbz537qOXlBjNrNuWAYz8W/7j1O
	pI1979Qw1zgAhfKhPEKdaFoWnnM/gtO8vCDhE30yfP9SgMAgbd94Er+WrEA2x3FeXep2mcwIN3T
	lOtpwan+nNZshRfej4cQeAHjbvMEa8TovserEfDj/btVLrFcVKYcZXMTOe0LEziP1Ax9pY2THvb
	Du/vTkFCo/QY/fsaIhRj/0R6FnreiEyZJyb+BkunJjCLl8aTwRuFXMpOQuft16FWBUllbpVFP/2
	+KZZJKjlmCJHk7CetvaXVg1qKb4n5+nt9PGJ0AKsf3fIPngq9kRhweHjkzB4ElGBm5q9FfD3r1s
X-Received: by 2002:ac8:6543:0:b0:530:b2e1:2f3d with SMTP id d75a77b69052e-5327f5a6abfmr16520821cf.52.1789529406632;
        Tue, 15 Sep 2026 20:30:06 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326201c60bsm11362971cf.13.2026.09.15.20.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:30:05 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:30:04 -0400
Message-ID: <44bb4aac4a7957bc4c2418967eaae790@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260915_1728/pstg-lib:20260915_1318/pstg-pwork:20260915_1728
From: Paul Moore <paul@paul-moore.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, selinux@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, Christian Brauner <brauner@kernel.org>, Baokun Li <libaokun@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] selinux: recheck intermediate backing files on  mprotect
References: <20260829213256.51527-3-kmehltretter@gmail.com>
In-Reply-To: <20260829213256.51527-3-kmehltretter@gmail.com>

On Aug 29, 2026 Karl Mehltretter <kmehltretter@gmail.com> wrote:
> 
> mprotect() can be used to bypass the SELinux checks that mmap() performs
> against the intermediate layers of a stacked filesystem.
> 
> mmap() checks every backing layer as the request descends through the
> stack.  mprotect() only has the lowest backing file in vma->vm_file, so it
> rechecks the top-level user and the lowest mounter, but skips the mounters
> of every layer in between.  With two nested overlayfs mounts and a policy
> denying mounter_t -> middle_file_t:file { execute }, a direct
> mmap(PROT_EXEC) is denied:
> 
>   avc:  denied  { execute } for  pid=71 comm="nested_exec"
>     path="/payload" dev="overlay" ino=9
>     scontext=user_u:base_r:mounter_t
>     tcontext=user_u:object_r:middle_file_t tclass=file permissive=0
> 
> while mmap(PROT_NONE) followed by mprotect(PROT_EXEC) succeeds.
> 
> Preserve each intermediate path, mounter SID and file-description SID in
> the backing-file security blob, copying the saved entries when another
> backing layer is opened.  Allocate the array only for nested backing files,
> and release it and the path references in the backing_file_free hook.
> 
> During mprotect(), recheck fd { use } and the requested inode permissions
> for every saved mounter, and include the intermediate layers in the execmod
> checks.  Policy for nested stacking may then need to grant intermediate
> mounters what a direct mmap() already requires, and execmod on intermediate
> labels for binaries using text relocations.
> 
> Tested on arm64 QEMU with a small BusyBox initramfs and a purpose-built
> SELinux policy, on a mainline tree containing
> commit f2381b546e7e ("fs: fix user path of nested backing files").
> 
> Fixes: 82544d36b172 ("selinux: fix overlayfs mmap() and mprotect() access checks")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  security/selinux/hooks.c          | 141 ++++++++++++++++++++++++++----
>  security/selinux/include/objsec.h |   8 ++
>  2 files changed, 133 insertions(+), 16 deletions(-)

Merged into selinux/stable-7.3, thanks!

--
paul-moore.com
