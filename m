Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A434EEF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314425; cv=pass; b=rDTIBJSDkYcxTTBMVLuQUBXPqeZv/s1BQzd5eT8qcqaRgW/sGelfV77jTC55fyIIB5wlbypGLoBQfnk1RHgfxdUa+GTkZy2sksM2b+DUUVprvdwinH7aTLv7jjwlU+JRHJoxIyUPLOvjT1OtwQHxxON4b5SewgadpmJ+Ayr+YYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314425; c=relaxed/simple;
	bh=1oADZaik6pnkoG+ihP13J3amltU3W4R/mXTq0FvOI+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c56dpbSIiOoq7rKkR7/LX4M2XWbEodVmKmjufVebVL/vljNDLyexE7QCkofHsdVy/5yKjxsvi6+Mz96ThiNCdHzYs+Igm8Q6fFHgW3fczyg38wkx0oJdt7oHcH/E2vL6jRWwNI9g/vv6GU4LuGdA2DIMvAdQZCqr8fKOBbMaMzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2x/8qjA; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2x/8qjA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so466605e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 19:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788314415; cv=none;
        d=google.com; s=arc-20260327;
        b=JQsDyZAG+kD3YWirWGJGco0x2HIo9pw+qyL4fvdXea7TILYzchIK65rPkIt9Vi9F2n
         F9HM4B8X/fAV/Btm++k9/1SYMsaSRx7cNOgMUyBb2d/92AJK1muvKwN5ecEXgrp0ygZx
         Yon0TgMevaISBmfM5xvs+AiOiOs0DtfrWBxbpTaAfjIGdQug5uwAPSl3YdqSX/eh9RJC
         H8GxHfjWOcuziQkpGWf7O2xdleZmHAkl27m90rlG6Wkb782tUFHeGlb6bE8ZHkgGe7fQ
         POdDda6hlocfHNQITukHnCyXv75USZDH+TEKczhbUh8IXqYUO6cizMR2wnyGGP1SFwcL
         17Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FycLFIgmhdNfFE6Eim7od4aPHIzWQVdNcWKO38Md7VQ=;
        fh=VUkcG7i5uZbdL8KEIGFX4/JGTQQKRGP2l4B8FZ17QIQ=;
        b=ETqiPToq4MMBbKS0E9j5iAg+vro1Dac0ttV9hUYWHwvpgOiGAXQe5HYuAHCvr1X+qB
         RGSg9dv4XkULugY79JYzx0r7rp5eNXKhehm52/D27ZB1tkl0o9l9Dm726O7b1yipCjMP
         iSAw/mTLKbmABeU2BeCNRsHyLxMM5P+l1PrgV8KunBKgNgPcEMgw86gt7zgnzrgAxCKh
         I5+OlRBgtGHCdX/uYiPqhQ+C3W153EfDkmHiQlVJ1lwYnI7lREiItiHHyg8R0O5jd1kB
         v0duCT10S8xkI3hlM+Y41sTfqdoxbcw2NO+N1NoGLZDPpDMkC4XYSLmqpwnl5XUiN8GJ
         J9ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314415; x=1788919215; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FycLFIgmhdNfFE6Eim7od4aPHIzWQVdNcWKO38Md7VQ=;
        b=J2x/8qjAv6JNXw2/VCzXlRb9zDcbPz74FWN8U5G53kqb7eL/X/QkKDyjbgaXVsaFB+
         aEyCzJ6xY2H1ZFvhI4SqVry4hBgt4ubq/JyStwj3ML3umH6X4pisVDab0GSGXMFq3p0O
         u3hhS83oKToCac4AXbuDEz1YW+/5jDkWGxCT/m2M+674uN6HHcoOmf2Qyerx47511wG7
         azGJCT4N6OmNWzhSrNiL/PBcmQCrayWITAbcizXGKJDwvxnl2Z6VvseosTk9ptLlc/wH
         LvhUMvgudludXCSZBlLzwvwMmSqy06Fj/XtRqOvg0bf7//ZHdau4zZd6KPEajpVOpRvG
         FS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314415; x=1788919215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FycLFIgmhdNfFE6Eim7od4aPHIzWQVdNcWKO38Md7VQ=;
        b=W8LswKC77g2gP72/sio5TtEV6rjjl251xTn8ydS5HcuNIrYmUxd/H17e637qrUnVA1
         vKu9048euhPLPa3aMbqOLlmAkHeulal6rUUsRS/xl+HO/UO/zzxrFAxfM3k1+dSHFsFD
         U24yJhrPBllAV2zXkEv8YbLu03hzlqMrmTU6fkUY4RVkK/65dPvYDBN/HPeFUArZoaYl
         t482K0t+YgSyk9ZuWj1/TfJt8aNQCepd/jNnQRzxt/IxjhiirNVwpNSUE9nzd7v5doOw
         gbBsLDScaTkwccZ+vIxkvPurbqE19RWcck8tLZmS5r3UU+l+FGqbc81GhAKxbqndR7hj
         ItBg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ3++4EY6N2Eh6jVvorqr1rNJ2YV10zQsC7g5jEentBgFPyd3ONp7nUh3PFz1eIuH+kxIyObn+K2rp8Xg=@vger.kernel.org
X-Gm-Message-State: AFuF++mnaWymGHiQRZ4qjAO40M94pcXTux5Li/DnE2lLRWxCS4418NbU
	bbTuqPhvXV5jHE7lsgwBBIKXA1gExyiR3j9W0/BQls1QSZMmfwBN8+KqmhOr+UUrBn1XE8emluY
	MGbsPfgo5aEngD7enkYKM2cONgfJZZWU=
X-Gm-Gg: AYBFou0XEiXGKoZ5pl8c29QqxsBaCyimsc+TwmySliV287p+WeNVEOhEzmae+8qpB+e
	BLUfWAJWPWe1zbJ1b9CvHWLVSpdoQJNeu+I+50GvKvTT3RZmDHmnLqCTiGOLDW0EIETCWT0Hv1k
	J+bg6jUIbpFZBZsupX5o0cdYTyWkSLh7NFT3w+iKNU5PME/1OE03UqcqE6CwG2iXIzpBVFv4yEU
	hP7X3iBUxwD+Nq6zOp5LGrEQegA/1KT7H6vDHsQY3NNLDwzzxczugUNEXCkbRNdZEkFedh1W3vQ
	H6EgcmCVsK1zfE0bf3X/CxSbEIBMNKPMVXEesEt4J3Rl
X-Received: by 2002:a05:6512:b8f:b0:5b6:423:7f11 with SMTP id
 2adb3069b0e04-5b6087cf8cdmr424424e87.31.1788314415027; Tue, 01 Sep 2026
 19:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091519.2885376-1-liubaolin12138@163.com> <20260901091519.2885376-2-liubaolin12138@163.com>
In-Reply-To: <20260901091519.2885376-2-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 2 Sep 2026 11:00:02 +0900
X-Gm-Features: AcwNN1Urt09KpsBbaUWi0KSrWxgWovvBVLS3g_-98g_dNLNQJdyHnSAOUCYf9Vw
Message-ID: <CANFS6bbVu2mrQXtKJfokDA=6ajReH9Xmm9OA1zVDzQhafHy0mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: implement fileattr_get and fileattr_set
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Baolin,

> +/*
> + * ntfs_fileattr_get - inode_operations::fileattr_get
> + * @dentry:    dentry to report the flags of
> + * @fa:                filled in with the flags of @dentry
> + */
> +int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
> +{
> +       struct inode *vi = d_inode(dentry);
> +       struct ntfs_inode *ni = NTFS_I(vi);
> +       u32 flags = 0;
> +
> +       if (NInoCompressed(ni) || NInoWofCompressed(ni))
> +               flags |= FS_COMPR_FL;
> +       if (NInoEncrypted(ni))
> +               flags |= FS_ENCRYPT_FL;
> +       if (vi->i_flags & S_IMMUTABLE)
> +               flags |= FS_IMMUTABLE_FL;
> +       if (vi->i_flags & S_APPEND)
> +               flags |= FS_APPEND_FL;

It would be better to set FS_CASEFOLD_FL as well.

> +int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> +                     struct file_kattr *fa)
> +{
> +       struct inode *vi = d_inode(dentry);
> +       unsigned int new_fl = 0;
> +
> +       if (fileattr_has_fsx(fa))
> +               return -EOPNOTSUPP;
> +       if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL))
> +               return -EOPNOTSUPP;

> +
> +       if (fa->flags & FS_IMMUTABLE_FL)
> +               new_fl |= S_IMMUTABLE;
> +       if (fa->flags & FS_APPEND_FL)
> +               new_fl |= S_APPEND;
> +
> +       inode_set_flags(vi, new_fl, S_IMMUTABLE | S_APPEND);
> +
> +       inode_set_ctime_current(vi);
> +       mark_inode_dirty(vi);
> +       return 0;
> +}

Currently, these flags are not written to disk.
I think that we should store them to disk or
reject them.

-- 
Thanks,
Hyunchul
