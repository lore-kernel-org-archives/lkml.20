Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8E379EDA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238448; cv=pass; b=W3HUVF6Em3QA2qhzI2efbkDuvmN3jbYOuCdN8J6kBJisMx0YAjhhj1bkcnDnYsa014Cove6AsUNC+V34/RVvKxe1I3QpK8Sq0tcmL4U+RrhEjVX0ELvXAKyS3Br503VNEGpWbB4sDjnEk9FaB+OYlEUQuJw67FM8HomJv2ToamM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238448; c=relaxed/simple;
	bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSuMSh+83GdCNI9MIsiqfCVoWW/TU+ZfZQLKA6xc0eXajaVn9LSPbNEp36Qx6vD1kh6a+8jx0MjYJKAJrMmmp4jvUvVHwJlayNJCJCv91qZsQGnlttTDiZc6p0NS+PCDWrYlPWTBnIlc7jmNvRNdF2JvIRHUx+l866MyIB2207E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+NLp0Jc; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+NLp0Jc"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cc64570deso7840486d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788238446; cv=none;
        d=google.com; s=arc-20260327;
        b=BCllmNaTnzYUiBsQAqoQkh2th328QgyHwwuko337DAPwCXliEQm2I68MAWymlF75Mm
         HLc+5g2w6Mmlsz5pVCJ3B4tfn43kuUIkECi8wT09D25R2HbJxx08Cz4iuGB6m7hcJ88Z
         /8QXah6AN00udylBfNOP4Bd5rNT0X6Dq9tKNoBHVnq0KRO6J91gq+HLCHZOUGI3Bmm6P
         Wj4Omq8H+SBDfz95XYnbukEYoz1/8LeAICBXDW3WXh8LyoItZk8ReaLLHXn/hLXKFMCA
         E/QyjsYFfMbg0fRWzm4pc2W9aLqX4fcSLdweNfXaPNMCAjWN84uIeq1lh5q1r8umZ2gI
         u5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        fh=zsmaNGOD5KzHUe93jOzovWUPghrYGt5lK7EOtGdfAGo=;
        b=Pp2Ml+fKQCRpbfvUpiu+dhPEH5RNwkxCdiS+TA0g+L/+rM6+qLMXMVIdnssP05KwzN
         6X4lPkfTewvikNf6mZPkQc4Zi8eF5V8PSXKTIi3iGM6r9vqmtvVNmCxfn3Aw7GO99CHN
         i8DVpaXN0KzekB8/mcwzvY7y97qVJJWdXniUvBKFO4ke+VVR1Y0kajEi+2XytoTtelk+
         NUzqYGAWbRLQf7w9v/Pu7T/yoztPV4TaF3WVKPeX4txN5UTQGpJ+/Aj+ZKNsEp99uf1l
         rlAwhJ4+5mG2EmwGUPNhN8V5acodP7gi2Xlxj4DGZ3WN40sU+VILKfNHWlsekjYH9PsQ
         30nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238446; x=1788843246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        b=m+NLp0Jc80FG4HwrbLcEKEAVSQXG/hORtZjytvZiPGoMlZhVHc+IMgyUnSWSt9ExPi
         DabQI5GGYrLcpcKfL6eybC+L1nfBo/Gka6P+Y3lbtj10TK7i4O00rlM2vGeMZCwxLUEx
         anBzWBHBcdkGKn5Wh+EImqkgEiFlmixxf467CGg+MhaPl2k0Mb4pOkzinXN0OX2nH33t
         Etql6aG88QOhjTs8R0pXGHwVRHLIa+odaczQtJBCuDENkKuFCxGYqXqZr+VOYzaMtvFN
         M9UA49xw1SQFSdYfaqBLfwDR0Fm10IxHIHZIsjMtjPBLVdETwUq39hGQrDAXwVn/glTF
         jTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238446; x=1788843246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SuycrJ6e1WFHR/TNYgsJOBfzYu56DYt41F/4NfeqAU=;
        b=D96Qoa/qx48qrSBiwLTXSNKkvwunEpWHlEgxoB+3avvqPOxOTVu2b9m2CwFwPglkI4
         TaagTpn2AVu62ChMc+E1GLSb4qOVCe45j3Kho/mWCpOZNDr/7BzKe/7+vDPTFXjZD3ZC
         g9cIwoir+D5txHOYgG+pp4mlGtxRGEFMS5+OQfQE9FfY6Y6YzVoHRWPHxyn2PPbvb+vm
         oAwKt0SWKdEwvPXPUfHZA7lwWd3nSZYdURnLlvvO8eyEZILg6ACoeAuE7yxz7zyjIe6c
         0Kq1zBTsZEjN8AnNanXOJ2vvgDUDt3YsyUZ875j+9Mo21HxcOtmt7E40WY7KMi1Qiixd
         0IVA==
X-Forwarded-Encrypted: i=1; AKwUvByALElISLyI/9aIilbJ8uIyxd0JzameJq+r8m7YmtQRuRLZTrdicDFOFuc9nE/ZwNwoyynDWzVtkLkM1jg=@vger.kernel.org
X-Gm-Message-State: AFuF++l8JxkOBQjk6WH4FMQeRm2OhvsQHV0S6K2U+t2kFR1WsBMlbhK8
	4m3nHqxxgAU86di4CZ+ww7LxkYXY0+mZIWTGf/dCVukgkCzW+qU8zZYNEjU57NWk+cghV60Y1CC
	alJGLtMmRbikyfnudpwMXahJaErFuoTE=
X-Gm-Gg: AYBFou27wLIfeHtBeWu+eBCHmS/MCQF/6ouYnInORsf9ezbKnZUs79Pi1Wd/GGtWkr0
	+xq9MeJe/GyrQixkzNh7PW4WPKYtAADsiwuoWc23ysC5nCCfFBww/s8YIpcs+42GkTxythwbjV+
	UyXi7ye8aLDg+uRfyVfPkXANkSEVr+LcOzresrkSJ1YjpT/wGlOLB9OeHms9nKiP7hAvwRAeq+n
	fObJggK3/75TB7RuORGrdWf9y7l8lkt+7nfgTgP5QnXFiYOMxySm3gxDxAjC342HKaM6Y8OqT7X
	5rQYCOd1jyw3HfkA5hj464PHhe6JCDOaXd//tgy7ZOs3YvIRsG3WgIqZIbay+dzmnTw2gpIWEsF
	/srSSAfuvvC3AzrbAwlj8YXUz9DxsxQdBG/MoRNar
X-Received: by 2002:a05:6214:5d87:b0:90a:7f98:15f3 with SMTP id
 6a1803df08f44-90e956e7aefmr37476106d6.2.1788238445773; Mon, 31 Aug 2026
 21:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-6-apopple@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Sep 2026 14:53:53 +1000
X-Gm-Features: AcwNN1Ud4VFQrRun_tYvFTt-qwucbEEO3S9gIfzjiQyf2D1HVIdudvpKJIZc7pw
Message-ID: <CAPM=9tw6nv7UbMvKOGSsZKKwoZwCG2hvwGk=JjmsxQcH=wGfqw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 13:36, Alistair Popple <apopple@nvidia.com> wrote:
>
> Add an extensible info ioctl and use it to report basic GPU information.
> One of the first things userspace needs to know about a GPU is its
> architecture and implementation, so add that as the first field in the
> GPU info result.
>
> The ioctl selects an information type by ID and writes the result through
> a sized userspace buffer. The kernel truncates results to the supplied
> size, allowing information structures to grow and new logical information
> groups to be added without introducing new ioctls.
>
>

This is a higher level for the future, I think we have two paths for
getparam type ioctl.

Either we expose a big struct full of values with a add to the end
mentality or we keep a long list of value pairs, and userspace passes
in a list of value keys, and we return a list of the values.

I'm trying to think ahead towards native virtio context support, and I
think having the sequence,

open
get_all_infos
create vm/channel

might have the most optimal ioctl count but also let power management
avoid booting the GPU on every open if we never create a vm/channel.

Dave.
