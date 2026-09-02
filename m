Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F6480959
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353425; cv=none; b=kRQc8xHq6HJw8gf6KMkztCN5BBxctncYldAQOe4/Soy3FduRvhrja8QZaUVMMTS3zQBIm0phGSMgwV518XoMae6y0AW7Pguk+Io1UHFOBr2WAMkH9tbfkvra8ChT42oABxiv7BVzN+IpLrXv6EOjPP4+hxWQz30MIrLnkF03nyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353425; c=relaxed/simple;
	bh=Q6o+psk043H7QaDBOb2T9aD1u8V/v8iD/Wiko61zjSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nq4vPwmYFLxswSn89IvBBV4BD3D0BuRZOTreUAdFNdeVkKESmX90KiG2wuypebNePzZx6Vv5HTqjBToiwDO6ASgIMH9X6LEaN/PSVACpMFGZiYo3u7V5E+W3qVpFmGsuBEbQ9WetdHGpo1GiAJ0WOPD+/dcGk5MNgKz/vWvnorM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZAs3zsh; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZAs3zsh"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cc9f5bee2so8864335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788353421; x=1788958221; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24c84bwyDgqYl1alrwdlSmQQcTBYQp/BbzXBbK2dqKk=;
        b=qZAs3zshERZ8aK+3OuPOmyGilAJv8I7QrWrPr/zkG/7T7+DUBnNg3quob9ua3BtrAY
         bEkgVTyZMulI7Lb6EI0uiSWGm5Xo26P8M3iqtEa6c6sTXbIW/Z6DoEwrmDOHlqmij+Jy
         loqBkSHx0NGoIoBBgIa9qh9/yxMU7hdLA5bJbWET/Mqsoi4IW9DCVdabKNzfYVe2atJg
         /svje9aS3j7JN1OIjTEoG8DxxumdaGE2+1MkHSlcFOUyi8u9dcq/Zc7wYHEIEYOtsunT
         X3ZDhmKHziza3DebG8b0C9SQU3OsXLihYdwrPzMGwG5uTic0gwJtPy+xR02HK4Q1UqVA
         7/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353421; x=1788958221;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24c84bwyDgqYl1alrwdlSmQQcTBYQp/BbzXBbK2dqKk=;
        b=GCECOjR0/gr96XKCcI6/Wr1IeVPwxdr3dX8Gwct//0OXC8TKlK/xbqlkcwExO7w2y/
         Yir3A5Wl1UFSQdl3Rx3NjgyV9OudY7Qk2MS6dczTVLUq9NMuOL/GdrmEWkUyDQyc/ZIf
         V9FpyeMxsniJuo6R1Kl2bGptrt/Gqf9IbxnVGnBjiWd8DHw+LTENxfe83k6jDz5VNxl/
         +OYJe9cUcmCeXrmQ9tX5HL2wCvzU1PNyiudZbH5CIotli4UJbV1vZDDHPZevmryeQhtm
         ED5nazeJaoDJupsAVxfJYVNoPWtl48Sa24RQOp8gNH/Rrv+/UxbiWvsl+MJzYQjiud61
         UmXw==
X-Forwarded-Encrypted: i=1; AHgh+RpvCajlGMXuHPRDwivdMn8DB1dz9AudRcvRvYfpGcOxSQXYrsd/uea3I+RgMJuEQIiRkKCZLgGkUb7gpz8=@vger.kernel.org
X-Gm-Message-State: AFuF++m6iHNyzP3/bA3UW9uoSmOCNhQ4F660URced/2CgE9oqOmrUiat
	H92k/buw4uTZ7MCLs61QaWFsH84/RcixVxAXIpzSGHj9NTfv6swkROchHtLhUoKyI5khCmONwVk
	5eErCNZW+kFjDzXTbdg==
X-Received: from wmjx6.prod.google.com ([2002:a05:600c:21c6:b0:499:b2b5:78e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr93341175e9.14.1788353421254;
 Wed, 02 Sep 2026 05:50:21 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:50:20 +0000
In-Reply-To: <20260901205250.1638304-6-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com> <20260901205250.1638304-6-cmllamas@google.com>
Message-ID: <apgbjOsfn4oFMmAC@google.com>
Subject: Re: [PATCH v4 5/7] binder: check vma->vm_start in binder_vma_close()
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 01, 2026 at 08:52:45PM +0000, Carlos Llamas wrote:
> Certain operations like a failed mremap() might trigger vm_ops->close()
> on temporary mappings. To avoid tearing-down the main binder mapping on
> these, let's verify that the VMA matches the expected starting address.
> 
> Cc: stable@vger.kernel.org
> Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas@google.com?part=1
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---
>  drivers/android/binder.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 185128577829..3d359490436e 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -6018,6 +6018,9 @@ static void binder_vma_close(struct vm_area_struct *vma)
>  {
>  	struct binder_proc *proc = vma->vm_private_data;
>  
> +	if (vma->vm_start != proc->alloc.vm_start)
> +		return;

So .. this does work in the case of mremap, but how about instead doing
this?

static int binder_mremap(struct vm_area_struct *vma)
{
	vma->vm_private_data = NULL;
	return -EINVAL;
}

and then check for NULL in binder_vma_close() instead? I think that
logic would be a bit easier to understand.

Alice
