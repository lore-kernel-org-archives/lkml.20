Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B538F255
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529407; cv=none; b=kmkNQHxoAROLs5kfBmVYu3J4ZJmUf9+GVHzWBWoIxgxqGHA2HEFrv97SI6szNXBG7+hKn30TCTPxlRRwH8wAjvmGLWAgM4169jAdFGwnrMR8K+FbUlFy5qhIz2pCw2x0pmsX6O9Rf44QKXaijYt6T4mqYpGhZxrNt8SNJR9/Kg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529407; c=relaxed/simple;
	bh=hUkGjqs6qcYuVfKb4FdP0YcKEPyEotgH3ArbHxEaHSc=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=RFctILZfR87PWCZBTbf4LCIyaKHEhZ2DAam06VN939RTSmkmBUdWHoy1qzdCMORcCa7gEuwMIkP22c5EaZW4NaTzT6ciiBQha/vo0JgDcUEWyz9r0oX8P63e4mAQTJeqD8kf7jd3LvfHIx+iP7bXIIKObYJE3Pj0R1xfCJ4iwOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Hlpw/N0H; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Hlpw/N0H"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910c9ff1fso54737285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789529404; x=1790134204; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Til9bgq45pMcrN/mAeyzZMNqicB3+Nb642mFgaUojyw=;
        b=Hlpw/N0HkHsQTYtj7U049Cw8JPDLlHumzPZoCMRvVh47ABqMOdKmPjM/3x/3R3bKBO
         HPYs157NAxLqMOkhAMr2Ta2nSZLPD7YObYHyJqdDqTOTlPlmTwxtC2b2g9pYqaGuhEtK
         6ikSZnxGyzN9HhUvPjqqjnENe2HJe57yFSgPmRRS8TOc0dkvWxRW142W/TKz4GTu4ydT
         R/DgB+IeB/0q4CS9LvEEPQsduNBFZ7aMdxBiesFkoWEZOIAjEhwyqbWzvASoni4zjgOK
         kLJ9oQXTHDilMuHbvuc85vKEhw3XW9rpt8vfVEbxcZOyryESZG2ogmm2hj++uWprY7QO
         Yl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529404; x=1790134204;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Til9bgq45pMcrN/mAeyzZMNqicB3+Nb642mFgaUojyw=;
        b=HNUfVKd44vqOSnCBUow5sPo9Sc1tdXZ2XwJDLF8rLm65a8z8z28ejCUeQrzmfiRBDA
         OfB/LjNHsAfALyrUi3aHeaWzSBkKFv4EXsrgQ9Mhxms8/g1GKCltqPaosgxKP1a78Mp0
         GHk2vqW/Weih9wtvEZyrgPtXq+jbzO1tnR04IXQyqP3+d5HEb5Zq5eOUnjeYTi5XFLTL
         +LET0lMWlEA4Up73aDq0wtxNqEMIxz/cMN1mQRhkeKNASJfY3tiAnCUOjsAu8vB+eAE6
         hHXQsWsS0Fti9eHzebLJVBNL7mRF4pWEapI7YrD/ZxB7m7CRPqEJjfkNgdlnklnQmnT+
         J6YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCUDerfWPJwg/Iquyyfo3tRZL4dBlbiyfE2PXhu9dGkw7Pi6NX2coXYA9K0khohWGZEingldF1zSnlml8=@vger.kernel.org
X-Gm-Message-State: AFuF++mV8cMOSs6uymM3EKU2QHbA29uCv3H0wYdONilGoxecRJFEmjNR
	FVg5tsDEAn/TE7SL6Zs99A54iVXvoB7OkHmYYg5fjjIR/ZZCo0V4WIgthv+AmZi+VA==
X-Gm-Gg: AYBFou1Gd3eKplAhYpfm6xBcvyS2BecQYUufHuKdfgdjxVQue+NsDII1SLzfJE6o1le
	xO+fQ9TVB7nxPqtxBGqOxHG3BR1j92Oq05n1EfCG0fXpm4KVeXomlmWGxrywLNnII0zUjQzQnej
	SwNll7UjZfSqW/42br3+mPM5+rgbiJ24n/aNaaFmmy0l45rSRfp+oCrsN0BQXCMdGjgkGg1G2MW
	YM2Uh1o4SntwYnuaGMnpVyB8QrnHm5Z2pbn6F97i6pj21n5PDOSDQFcEuo2Ed4l1I76yIFKx3Iw
	YmRaAzPRZ+hjDcwkq+YYq9cWA+qjCTfRaw3LMImcSWft6pj3tTU1OoI+4OGmrk7mhOgytktQdyC
	E0LC1mv5Uujv1kB/AlMrkh8HD3Nda3wL4UZAT39g84RU5BIEBKA4JmGa2QXCgjxayUksM0iQLny
	NNGF/t8M0GtYjL1z2mGh6jGueN6+NcXha5sZ2v5tZSn90E2/Ps6OQefqpl5gCi19iuSCHWg+LnR
	Gj+E+LiMBypeFEeaYOEH9QNPLtGIOOEmPFGQkn+xk/VtK2XXIz8C7THmlt9+tSZ4c+dUh8vT/zq
X-Received: by 2002:a05:620a:4709:b0:939:35e5:94ba with SMTP id af79cd13be357-93bb766747bmr170559485a.6.1789529404169;
        Tue, 15 Sep 2026 20:30:04 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be648e5sm15710696d6.8.2026.09.15.20.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:30:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:30:02 -0400
Message-ID: <d852b4ae61860446e038f69541f36f9c@paul-moore.com>
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
Subject: Re: [PATCH v3 1/2] selinux: preserve user SID across nested backing  files
References: <20260829213256.51527-2-kmehltretter@gmail.com>
In-Reply-To: <20260829213256.51527-2-kmehltretter@gmail.com>

On Aug 29, 2026 Karl Mehltretter <kmehltretter@gmail.com> wrote:
> 
> SELinux saves the user file SID in a backing-file security blob so it
> remains available after mmap() replaces vma->vm_file with a backing file.
> 
> For nested backing files (overlayfs over overlayfs, or FUSE passthrough
> backed by overlayfs), user_file may itself be a backing file.  Its
> fsec->sid is the SID of the mounter that opened it, rather than the user
> that opened the top-level file.  mprotect() then checks fd { use } against
> the mounter SID.  This can incorrectly deny access without a domain
> transition, or check the wrong target SID after one.
> 
> Copy the saved user SID when user_file is a backing file.  Keep using the
> regular file SID for the first backing layer.
> 
> With two nested overlayfs mounts and SELinux enforcing,
> mprotect(PROT_READ) returns EACCES with an fd { use } denial against the
> mounter SID.  With this change, mprotect() succeeds.
> 
> Tested on arm64 QEMU with a small BusyBox initramfs and a purpose-built
> SELinux policy.  The original test was also repeated with Fedora Cloud
> Base 44 userspace and gave the same result.
> 
> Fixes: 82544d36b172 ("selinux: fix overlayfs mmap() and mprotect() access checks")
> Cc: stable@vger.kernel.org
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  security/selinux/hooks.c          | 9 ++++++++-
>  security/selinux/include/objsec.h | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Merged into selinux/stable-7.3, thanks!

--
paul-moore.com
