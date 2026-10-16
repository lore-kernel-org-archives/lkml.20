Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580B44C678
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141122; cv=pass; b=EOdZAPkohQQEYgAkCzVbY0shEr9G+Z54WdYvIJ8CeVJ0TZKFtYuL6gqkPtfRXuDMV9fxc0NtGtm5DEW0wbqmcv4TV1W6O4dWoN4nuTHroOnSBaH02Ysjz+vOyrknduvE/9I4btzKctfasPdD2zwiEo3Ue6rn3P6C3xB8crMxb4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141122; c=relaxed/simple;
	bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3DW27CtwIJxO2NzYaOO6DhuODDbCm9vAdFPm8fpzgVb7A9qqGgfMIcZmeARu2kAqdt79X8r+Gd5QUIb7mB9DhrvAs3FFD7vOTJ169sIz32GsYPf7z5f4TIy2gFB94kG8ndL8wk7NiU6MHTbobRwCSPR4PmWndSTvElpjrt71dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=h6ysyMi0; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="h6ysyMi0"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533797e72e8so14956031cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141119; cv=none;
        d=google.com; s=arc-20260327;
        b=SgA/z835BITkCLNHLKCW8ALeY+8tYadh/m0CwY9PGmoKW9VUXdab7wDCoPXf6VFgfb
         1Sw9GRFOLtwF7wFo0s/DqUGuwSvzz1COe4cOJVZxw7kuKGgrtyDpm/xy5tdrW9yLKwT1
         8dv2fBQk0w9u58eIS2zH/hRxD6agsImie7Je+dbhW9TdDyEdQwtY880+S30Kzd9AqjRB
         T7wQ4ttZQ0LwLVpaLDN1oAKeEMTf7wTplkubeUF5ODr9lDJ+Ls+H9OxoRfSoF0SVc7fb
         ZWX8R+4q297Vd918KmM50qShpyM/xhlG6PtqXXLxkwrPtkQ+5g9axI5fnBg2V0Ot1VuF
         TGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
        fh=/mEq65qKfYAPDiGWasKWX0JnrRdb8FSlBASTH9tQHyM=;
        b=QuCCeYAfezJp35Vx1nFeVUWem0p8K9Gb1SOIaQM1O7eYCNgDc0D875OpuFcqac/RJb
         5dGmp9aUnEXH+iP0LYgFQlKpypwNRayOH6iZfhgOVkYNtaX9C3RHOtKkPvCjmW9bp8Tq
         4pcTsE32JiyvBXMvuEv2Rc0DFBb3C9Gu0QQyIwK1DD+ZhFddeLX9S+AUlbIqBeU813yf
         Wm4x92Z/I6E/MNBiBKZHDOj6rAMSXE6B9oKDzq3IXCSDNdJ/OmbwGiXCFNWUR0d63S3H
         mdtI2HlVtMbwSepdbhdd+v3HwJGS7dOAPxtsq7NM2kQACu+mYRElEFzk2+IBW+3Jnmm/
         MzfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141119; x=1792745919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
        b=h6ysyMi0mncT1RBpL0m8Lkvt6UWlkki83vArzdTg52KKF30H5YXCDYY5qxR+xeQh9O
         EhAMmlGx4hJdEnQQIEAj/wqS/EBcd8mdhqXp4iI9Fv6vkOQ9rcn1kV3272OTaVpYh0VC
         tdO80anV68OrDgv/taqJaiNKZUZ9Z1t2TLEb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141119; x=1792745919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTfPJ6PqC8c32ihJFSptJ3qTYD/mP7sZzo5Ard4uuBA=;
        b=H5owzLJKwUZrbtTLBTL6DphCAbIA43nwzFqAyuGMBMW02ZU097LqiAgcr0IfE9UEfU
         F9VXrOEQM4hVMSH2y1fdBvjcqS/DanKUHZyi9gqE4dGgE/8TYdr+zLuI3JX8MgYs26EF
         fQ8C5JngSMmbqQzLlbA8tKCcgr2my9gO5uTiwxpTQ0jL4PIBFqEdkvyADfWUtC148n7w
         J8yxevFgLyjKXD6OVETYQBZNDCdTty1SiCQ/RxkX7vEKDo2njQqmES6veHBxRA2bFsPj
         mV8QdXqUYrcHWrnzUdpZy6bllxXpGVG8Vgn/r8JGfSPjKI4uZMYKg16TjIp9MsmB0sdw
         Zxhw==
X-Forwarded-Encrypted: i=1; AKwUvBzHQVeHnbBQF+z4cAvbdUibbRJ7sI13oN6POFBCI/Ou168MOoiabHESqtMgjZu2vEZUmIG2/+wwCZT7zHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwCJ+1KshFPXvctqwMTqJRXNUdVOxuwWuP5Eb2jhmI/bQfFQxh
	oUeYnS7h5Zft8RbCM9KFzJFJ5KGybzFJtNGSx7sFJWVU0OhKJNLYdl9/m7mn7xsYjG57gsRccEI
	ZVWmopD1g4AKL1S4oFtLb3T5vs9DNsuLg7zhzvwA9aQ==
X-Gm-Gg: AYBFou2pnE1iL8OqUxIFnr2HO9mezXb2gJy4F0FHGq3uf53am7OfB/wcrevRKgcLG+i
	QmgZnWUfdLmbpXCtHfjMjT8rUUVRmhQV5h3KQeRFlPlq/phYz6xJlm4QrSqZ/Ccw/kv2PHv7EOb
	u94MwmrZYk+fxEgvMzOocWbNvcDogaheNNRIlVom7oqTaZxIENs3r7DYXkaXu6K01hDREi1jEGQ
	heV0JxgihdT1j++tY2EGGhtsA1NGQWpjihNRDJJ4LOELpSyYWQAjTFbU+q6lDM0sN6NMw8PU6OC
	tPKK5Y3uwaoldNcFXzg/ZdKdxH0BOOqG13WHIcHkbD85Q2S9gdiKgJIoOE3Ga62YiW/+wA177/9
	SmM0ZSuE=
X-Received: by 2002:a05:622a:148d:b0:533:3af3:43b9 with SMTP id
 d75a77b69052e-5359fb3d14amr366334251cf.44.1792141119518; Fri, 16 Oct 2026
 01:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910184424.156341-1-shayba@google.com> <20261014192014.3373048-1-shayba@google.com>
In-Reply-To: <20261014192014.3373048-1-shayba@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 10:58:28 +0200
X-Gm-Features: AclHuK8gvmL5wAjcEDGO2fjptGYL8jYpJoRVGU7iFqj19SwZtNo9v9Zwvm6lwLk
Message-ID: <CAJfpegu5agxOB7_9zW2u=0AfbLuZvp1o9OaW-A7YLvb==voamQ@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Shai Barack <shayba@google.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 21:20, Shai Barack <shayba@google.com> wrote:

> Architecturally, Linux VFS supports filesystem-specific fadvise
> delegation via the .fadvise hook in struct file_operations. Implement
> fuse_file_fadvise() in fs/fuse/file.c and register it in
> fuse_file_operations. When passthrough is active on a fuse_file,
> fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> to cleanly invalidate the physical backing filesystem pagecache.

Applied, thanks.

Miklos
