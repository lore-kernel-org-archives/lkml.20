Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332F3264F9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620036; cv=pass; b=ZgqmgIhX0OVanhZQiXFRQ4CaLfXutwjRQz1ZOzsqQ/hmd63Dc1Tsk7rSGKzwTGloYCoWjKUhvO7Rrcs+UTjUSJzJSQPUJmRLJPBT0P7tweFEQiNllIyq4z24b1Dgf38cZs1EuNnL6VmP+gVPZrt9OaKEsTqcigPbCjMvUyNcwnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620036; c=relaxed/simple;
	bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4QW1wYN3GeMADV+rC279kVeC0yBfvHyxrdEv07cMav3E9Zva1U/F22byZ/8+/dZrTD6hgSA3ZnwGfZHvTR1JSxhhWr4zdsEAKdDelAtaMwHUgVY0sCVdyUh6FeUJmqo78lA/DRe0FpwHfF+VnpeaERgUlRkSXFYTcAhtFYtHJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDPxHFpB; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDPxHFpB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9ad623098so4679981fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791620033; cv=none;
        d=google.com; s=arc-20260327;
        b=mkVu/XBxVtR8DdJm4erbTnJosLZg63Ij/WEZRmKWlwpnJ8f5a1lq1fOrs0Dfp+hG9o
         UyO7GsYDHTItz+OuqcdIGcfrS5jjm3DVaUARVz/zjB0mLGvrfpT5AmM7eok8VY3GBcs3
         EGyQX/hW9+bqaSxq2OSuLJIQGmZTJvU455qsjiVf0sWacQudiB+t5ZtOjxbloZ/VGc5H
         IHQ6DmSV4QB3mrQLRBcxvL927OyUShzmlo3yPWEpHsQCLQEAs8XTdJnFK7r9OGjFMkjc
         BNCkACz6npX//7faToTM7XmfJBkqMBjsVSUIoMmoMS9KyW7PkCEgPD0caBcv1EP0k6dw
         zLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
        fh=OqEZh/t32tNBObERfnZPI9j2zRZS6IF36t18RLPIpCI=;
        b=KuvKmCvsdu1G0vnPPW99ATlnzHxQ91RZxcp1T2UM0v4OzFrZEVl6121TS8mN4AfiLp
         q3tbqiTkvlvbbvqoj5ItT+cXaG8/9Wc2U3Ekh7Z83ttZt1hhv1zJ80DQAed4vi6FPnGJ
         JSAGVODPV2sv4aJZB/Co9fF9IZwSPZNEKkPluX1Vp47j3QqlHokMSHAWK2fsLZ7sREE3
         3uPeCe0JfsEMtZjE2poGgcIFiuKc4fl3G8WLnPYdu+EUoHU0HHZJzbe+Y02HANSazWwy
         oLM2JQiiOyoH+/bGd6CeIDXJdqWAaXFNyabh3IYVzN/uQOcym8rjl27F0UlX/zg5SErw
         gykw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791620033; x=1792224833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
        b=cDPxHFpBELcnjvKXwPUyrO/hGqo7t1TKxGKuXajuq9+IyMeUGX5eMdp8UwUQR+aYEs
         UHPFIfHz+q0JDufwle51VI+ov7K8NLJT68WGna6PItKu3/TkQ8Bdli9E1Av3bvEGd0nY
         KOrbdisGlEfbODk61LDXwSdkmqR5T5WPwARdn3Ifnn6JEgTRwcV5SwtlJy2OLA+gTU77
         ztmwUeH4Bm3o67CsbpXUMPxgCJJGRFO+KsnP1h7L6SQwk/X0D0v7JtMqTpnz5hvn5qk6
         Ond1i+nYxi070k/r4V81XHACQ0aCAifFliavmGSCm4oTyQa0lmAVaYiQzDmmVsZDJEr6
         402Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620033; x=1792224833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
        b=QASETE5An87azxS/qTtkFcNa2CS7pxXQviVbFWhF9keVglS6IttuENtoa3PHA1Cexq
         d5HYKbQWaTio3wCxXbGZ4HnVv3CqW7/9eQh6znEVV72AgVgqv75oZh6qeS4PboGkfpuI
         WeCpFCPCOmkIskKmijEe2mH7h/DEtzjUVscflr7OGROZbwtNp22XdkHykZRWEa5Nzv7B
         EGEZSGoLqvoU8qSHYmIxFn0YPN8PKKbO1sSC92NIkWsGiSKZA+tyJBsRhVrUB6bDtQc/
         JSbBi34ioiOebHJO3x88h+S1hbkEzOD/p0zD40Q71qZ6aMMfB6jP8CWE5deKzV/eECmn
         Zdxg==
X-Forwarded-Encrypted: i=1; AKwUvBzz/hnxOQfZBWivaPQDBjHYUok1J2WnmRKH6dvPrLxr6Pmsy6SGsaqcPXEEzbziivJO0LfO9kPed/u0JsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYILbVUkcJ913ynyNpdwAzbZ5oTApNgWpn3pXibkMbNuLnRMRo9q
	ujT9H9WlxwmKOThs7Z15ZwhkD8f5OrL4HzTXofPTcaoqdDc1c+m1l+GLJ3vYrM96jODoLJLxnq2
	3g6KzSrymS7DZ0SsWrt9RgraFJ9P6SQw=
X-Gm-Gg: AYBFou3CERF8BPqP5eyskECCf7eLRv3KKFSsMP+NVqWNlvFuExWVxJV5MzJkSQ0dsdr
	0b4lXVzkVxUFSCSMeetN3r5rl2vnMeTJjbjaIBgLjEzhMvHalnDnjpqWhiJllShUxMw2DW6mYbY
	LQkqvcV655lgShJm5S51wjcrQpXDCzN7ClFyUSRQsHHJxrleFae8XwEtqxvhWWSLiNlmXW3EuDz
	gbC3cvjgcJLZiGiwiwleXfk7ckalq/KAsz6X8+6e3gTXz0Eydz4bJoXudvkuWB9k4z0QQm5/C7C
	10W9ZWv+68JrInITcGlH33L1t7aL0wJRqrDRevTvTniUt2VfpH645CtPhg69HCQXwBQl3xTMbEg
	iC5jH3tABl3rdHyrS2SPxzQwnRzJXH07xxU2dA9K6b3iP8Rv81pXzOoKTG+QpaWY+9d08XxUUM1
	pOaKe0kiS3a1hStQ31GUM92CqmYpDbn9P2No4bty4=
X-Received: by 2002:a05:651c:2221:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a9c53985d2mr10277901fa.7.1791620033148; Sat, 10 Oct 2026
 01:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009154526.43528-1-cenzhang@linux.microsoft.com>
In-Reply-To: <20261009154526.43528-1-cenzhang@linux.microsoft.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 Oct 2026 11:13:15 +0300
X-Gm-Features: AclHuK87hlToSKlaS86YJtsi34MGww0jdhpR8cjy__Mr0Dxl209enwY_IZs85Ms
Message-ID: <CAHp75Vebzu0XHN0h_ehpmNfipzcR_7xS+Lavyd2beHUmR7t_7w@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: update outdated struct fbtft_ops comment
To: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Hungyu Lin <dennylin0707@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 6:45=E2=80=AFPM Cen Zhang (Microsoft)
<cenzhang@linux.microsoft.com> wrote:
>
> Correct struct fbtft_ops outdated kernel-doc comment: 1) update
> field write_reg to write_register; 2) remove non-existing field
> free_gpios.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
