Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793454486;
	b=kjc+iXBEXPRrOGdZhWbUXsiYaOpIEnRL8TgXz60IISbYcQAL7qWQGWe7w7z+pr0JTIdI
	 NmrHnwrbxhtSUwoXYyBq/T4ozuNouPvUTgCE95NCfPe4KxALCxLtIm+h3DkAxrbF4XWRk
	 LG2ioH4pBs5cc/I7zmeLEiWOM6MoI361sepvLMVzE8ROgYaUfS5vmriQ6q4EBdjNDYNY4
	 V8J82ZyX7Ya1TzRL0J9Vi7Qua06j1e4HB+g3kpXDeUU1Xv9ijD7txQkAWH9DF0zhMs5rM
	 Juf4WOrVtdvYqS4pYFJMf9RHp1CQFzzdD4AIhG3wQgBeMGjrKfCXTDhWsKXgY1fkX7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BbQ2P2hdcvSxuVd0XerZaY3G71JLR+7tFvsWSDDSvFg=;
	b=K/fwWo4rkpQLDkCo6833FBJMwzBHl+BNfYWqQ1NuN3Jj0zWQUPkCqOqbnJI2W/9HFkuo
	 cKyThp87XjCsTLvhxCyyPo6wsJWqbt8qadT2NAADcFSdg6BwqU+K9+ic0J184mzAoqnVv
	 YNs483vYgICeDNKF/XAokuD9yxc3HYQKTHRKr1lD86cHkoKXVShPYS7HOKTmW1ve73GGU
	 u72lNeYgnOReD2kIMswDzamdg9FWAm4yqGEvufpGuE6mL/G8pNg6Mq3GP6El9zBr1KBVO
	 zJwjUOVotWiWYm5SYsV6eIyIYEqMDzpiQ0WaDWwoarCe+llpqzqonpsUWyT3Qc3UWgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rkDRkqWi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC7606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rkDRkqWi
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so994499e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793454485; cv=none;
        d=google.com; s=arc-20260327;
        b=lH4fR1MsMdy5tV/6uSITerFdQBSP9iUa8FW/8HyNm5ZXkWsZlhQvtyCXqeZ79fmx5s
         8pdomOLnDwbeYcAVo2GOVF+ROqcquG/Ow6ZQ7S9uYzuybWHggeNZEmUDOlibfvKFg6uy
         lZGaR/wFRwjRiLk+j/9L6TcdQMbXCu4cT/Phicpy6Op+ZMfizsTrJzhlFj+KHUDjvj1z
         WUKYoYtCYIM6ImPFP6JWKTA1Pq+Qb2/jwPMpGvJFcvVOTt/5+9Lujs8xi3VcB3Cz/Dti
         EPFg4VrutjGEgDOgpned2p0rJ3Aj/mujFScl7lQ7INSXD0K0wk9zDfnRY+cbdMQxiI/6
         TNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbQ2P2hdcvSxuVd0XerZaY3G71JLR+7tFvsWSDDSvFg=;
        fh=bth4UIub3BfKgFznipVrfuiOqh8jPBo74CwcqmdB4EI=;
        b=VTIFyR1ITQ+DW9eWVFY6zJAzaIU036rxPW+Yj55eqoTs9tYvnGKvKtZFG7j0THYGXU
         2ZATPZ6TK6aLrxgFaWvRnpHZNbgb1KzMVDK4qTZi+hIikw31EUYSxFXvnQp7pFoHo/XR
         bNx8DwgDptTreA9qvunMlEJKHuDryZw+/DxbPTiDRhBh72ZMLHzWJpYA7tgqgxgBpAV/
         ElZc7PJ9iZESmofq508PFdDV9muTPfl0MYZzNvmBTnLEltwwxR/bHIv/B8F49ld7hQuF
         b83dfmGAfqlUV9WQ6HjBMx9LEVx2jFPwR+KEB6GNY5bVvofYl8cOl1+560/16cb8otbH
         8dZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454485; x=1794059285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BbQ2P2hdcvSxuVd0XerZaY3G71JLR+7tFvsWSDDSvFg=;
        b=rkDRkqWiP7mYasGzl7HLsSyvzgviydPmn2SFlPqV2nM0CwtFqG7brFBDLIakLKQVA2
         KYxP3jLGnrG+5/8BNcD4wAUoY8jediwgqGrJV0aZiRQiexnGUkOVocxVMgrDQM9UwHJo
         BYu1MbMROC6gUJTqoXAi0ugFZhLv6Xx7i2o1JG6a2veTgUXZ8NQmM+r+bFXZ6d/OWMZz
         HBS+9lUN2pFLAKeGpFmglMR4nOXrTku/FS/H83VOX/8pyj9rI9R81u6lhKqT8+XHIqB5
         wstnB3ykdVefN27zy/RjSJWPZ2oG69ew3Nw1vVjqSV//dkLpJNrV3ZJDioq/Lrw6O/y7
         kzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454485; x=1794059285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbQ2P2hdcvSxuVd0XerZaY3G71JLR+7tFvsWSDDSvFg=;
        b=IfLhfkCVxkC+FdXK/uEosvRPSmpdwndVEfoxnHlq1vjGURBbVV78PWV4u7gq6n/FK/
         XlgVUBxe6ADH9dWIeu4QzeJhi+RZoUIib+MR+1Re1yEKD5MGYKMFUmEeBEINJnCw39Cg
         oBRgUHM6wJZ3N3Stm68BDKWGUgGvgcPB3Undj4P7lzYh3UEIa/WMH5m/nrAbCtAHSh/X
         ulx+u08S4xpue3w5x9/NGyk6UeVCbmP0a73jBMyTL7hQjFziy33iF2U5ChkRQbBh6rbC
         Q26WD1tkoo1kPtlu3XP2uQcLX2JsGRbD1hA+5JeBBXWyOLc3BluiTh5SkStA2Doa04PS
         4uVw==
X-Forwarded-Encrypted: i=1; AKwUvBwTgFmkqgTickP6llZA05LA+5qPbWfE4L9yiC/vL/1h2cENlbnhbfgOIpn9HmIQEqDIiVOVm/wj6hjtHDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8r1VxNZ3aYqOHXMfPMfy/QObnBZIkUeiVQQzYeU/EQajO2ver
	+EDcDV/1yQkAr02MUMnYUgWygN2D/Z+Rj1um7MMgguRBOhKC/Zmr4jyZkn4jDPUF3EpBI7KGt42
	1C8ydwlb2BC01FZqezpA/48bSOs/p7As=
X-Gm-Gg: AYBFou036rPiUZ+N5kW58CioRwpSDPMpm2973iuZHcmpEcAmKReYRn5o6S0U6I0VovF
	8ZpWvuUh4Iwg+F6aVl/8+bxiV2ZuIaOzEC//ffLYncVbxac6kDfFFLWfBs7mHKq1RXBS2Xhe3SD
	zOs3K+R9kHKiNjmvV5DC2ag5E9TekQlfl+IKXqHnmlJY2KJnTc55n3PxcJxHkStHNcJkidyfQ08
	rgf1GRx8zqGBFwFvFk/Hljskn6mAgFSTXuJd8Sa13xOeYQ++lQvmMh92hXJJWEAk5gCvM0WFWs+
	1r//2Hjz202GkzKzM/4TQUNFicGVR2U16xfb9eKsjGqlOZapmxrmZEGRFE6QQJWu2Mar01D3Ddz
	QZHlRGpN03yvF+VjJ3+igbr4LEbGUzWFlnXhpxf8xysk6M+Pf5GHystNNC52a1pWwwiO+Y/E5mO
	NjYtho1IKNSTpjXG8X9Wb5JwF7OxgjwogyjW4N6VoqL0YVgfLOjqbDX1B8arHrkyb0SMuV9Conn
	m432MM1+GNbdeeySbHces4KWeDM3/WIDWwG3GYYao+bKczxlt9Y7+S9CeOxekE/WqMAEk4N
X-Received: by 2002:a05:6122:2089:b0:5ea:bda1:7689 with SMTP id
 71dfb90a1353d-5ec6871d58cmr2859290e0c.4.1793454485423; Sat, 31 Oct 2026
 06:48:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793364709.git.edumucelli@gmail.com> <cover.1793442331.git.edumucelli@gmail.com>
 <undine-1793452028139689664-4d0bf20c02a1c855@undined.local> <undine-1793453483000634761-30a1647e17bcfa19@undined.local>
In-Reply-To: <undine-1793453483000634761-30a1647e17bcfa19@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Sat, 31 Oct 2026 14:47:26 +0100
X-Gm-Features: AclHuK-CABaNQB74HJ7PdtyWxA8ibq3ZtpeO760CuQ3ML4Pfc3yrhorQo8HvhwQ
Message-ID: <CAK0NWSMdLB2Hcyw64ah+SB2ir+-idmRRDJVDqPZUABzbfetMJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] tools/bootconfig: Preserve tracing settings during export
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Masami!

On Sat, Oct 31, 2026 at 2:31=E2=80=AFPM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Sat, 31 Oct 2026 22:07:08 +0900, Masami Hiramatsu (Google) <mhiramat@k=
ernel.org> wrote:
> > On Sat, 31 Oct 2026 11:25:30 +0100, Eduardo Mucelli Rezende Oliveira <e=
dumucelli@gmail.com> wrote:
> > > Hi Masami,
> > >
> > > Thanks for the review. I've updated the event-filter patch to use the
> > > explicit delimiter pattern you suggested. It now warns and skips filt=
ers
> > > that contain delimiters and both quote types, since bootconfig cannot
> > > represent them. The other three patches are unchanged.
> > >
> > > Changes in v2:
> > > - Patch 1: use explicit escapes in *[,\;\#\}]* for the delimiter chec=
k.
> > >   The semicolon also needs escaping for the shell to parse the patter=
n.
> > > - Patch 1: detect both quote types, warn on stderr and skip the filte=
r.
> > > - Patches 2-4: no changes.
> > >
> > > The series keeps event filters, generic trigger counts, histogram
> > > variable ordering and paused histogram state during export. It is sti=
ll
> > > based on bootconfig/fixes, including the two fixes you picked up earl=
ier.
> > >
> > > I retested the filter change in a temporary tracefs instance on my Ub=
untu
> > > machine, running kernel 7.0.0-38-generic, with recording disabled. I =
also
> > > checked the mixed-quote cases against real tracefs filters and added
> > > regression checks for both quote orders and all four delimiters. The
> > > fixture checks cover each fix and the full series.
> >
> > Thanks, this series looks good to me. Let me pick those.
>
> BTW, I will move these fixes (including your previous series of patches)
> to bootcofig/core, instead of bootconfig/fixes, because it fixes a script
> which is not related to kernel build/boot process but just helping specif=
ic
> users - who can easily get the latest kernel.
>
> Thanks,
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
>


--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
