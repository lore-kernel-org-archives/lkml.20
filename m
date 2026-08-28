Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611FD3AD530
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945339; cv=pass; b=AoUuWCUn1VJgHlm4awJYfuJ4AJwoW482WCBAyF9jOIs7IFnbV/q8h7AmJmyzDtm/6mwhxd8eGmgcXch1Q9Ek0IFfKhU0mj36iTNCrTypKDcmzCtznlTOjXtPzv5keq3G5F4B6p6YMBWPSfol3IvHCt3+FvDMYpXlAb5/Hlfv5NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945339; c=relaxed/simple;
	bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+buFRZCpIt3ZRhGLvNyrrpOL82ArvUZoH6cgLXQyXIX2ScNWjQWeg1n9Pm6V3ZU3lVS72Kq3NIMBY6Yu6DUS6cqdN7vN+aVN3ewbzRugbiD4QXJa+jIHVT5XzMNCaPyh/lKXiKGtDd/hdIT46JZ4WZWqwzrNMHKe1DbLLnkGic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=In3ZmYPM; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="In3ZmYPM"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c10e86e52so46161cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787945337; cv=none;
        d=google.com; s=arc-20260327;
        b=l8DBhgcQB4hs+x0r+VcvF79MWm/cpx15+avdAmKJoaBF9j80ERRzIwCbUOS58vDqvd
         Ud/hm82QaPI1u1YY8luKotNwkeeN0AFoLyi7uovS1iJU6bjudi/wxHpveymr3OrI1V7u
         16m/KUZfnsffny9o9Aj73nhRLMsR4yUIuVfRTmJmy1lEHt8NwBntks7wi+vmA5u6q2Ba
         yP8/0MYFnD5xISxtU/xveU219ID+BYTW8/LOV03xMBKpvqhVnUmwWDzZVv82Wsv2O6/1
         HuzeY9z9LNlCDyXVE3X3pDpE6gkGd1JLdxzAijILRLo7J2FhF/+rO32hl5X8o/ctDrTr
         mcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        fh=s6n7rziZlFqscR3zL14W1Z0SpWct+7Fj78tGF7Baiu4=;
        b=C6uc7EmJREiAD1Y38HQF4lS0+kaE1HqRMTT8ziV6pVdSmawURySimuD7ztQakgdhTz
         lupi19YrIjDxdatSIdPbjDUm2wXGMXTl+L8Mis4UcAJQQaNYThPbsUA1vCrF4jSZrJWO
         0n5t2gC80alcSpX5hLwz4u+PEDZL2sgiV69z6M0a73SoWlRbT32fxK3P4vMF2YJe4eq1
         xof0/z74NSDignPSlPGZaQUViCZCY91LYRP9yD8KLTdIqEh+xSm9lZHIREx6QsIg3JV5
         oKvbqEYOy2bonWZ/RoaGrYOnOsDT15mQMxHmOyUnSRAjp3jQGMo5h36Zu4AFKpxP6OcQ
         UlDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787945337; x=1788550137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        b=In3ZmYPMsuDb8+i0NXhjvHnhY46y0wRJe5AJVwXyINNYsncPS09KRKMSxov4cVXN30
         3yEuDO5ebDuAhfkWtlXwx2+9kHUNsxmPK0NtKE3EhEkkzlOOna2eA/RO4O2WlM3rvTtn
         F71TMh0+ypFTDkk1BeB6lvwNKasMadoYvxXRi/9oK0cW9jIojsTad3ecyqtSXoSQQcTg
         7TpNRQpjjjE4k3KarUXa/6kcgssWcIbBnh1pp/JPgKWSY5q1e8rYexd+jbcQxXNOlQCD
         pFvPAghbvt+nTDcrWK+mIbTnQPtkEteurKFUPSWxBm7bclOIu6mLq04orQhh2Ltd0QZq
         HqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945337; x=1788550137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        b=Re3svtbO+rgJATmijKIgkvlusvSAy/mMpFwEUxXdrwvLLVqCc7hHGoT+XrTDYPc8Q+
         5qcdDhAx5v/fnhErAPwPM0TnEWFt5Bc3+xhJETIA4XbgrKbKPdLfAcdFS3piuJws5a0N
         Ndv5rbVxDyoGe/yWra4jqvtLF0+oTXt0bMIKyauGm2D1W/ZdoXLvbpvbxDgYcX0RUNRi
         B68FmeBq+j6KWQ8xRo6q1GifHLQzfelU1p7J7lo6d1IR+NCCYFYn4ollcrmwdpnJXZz/
         1t/7d2WMMfPT7VHutJ6YsSZHildAuB0SLh/nwnDuDjE3bvltHkB6QHFaWsq48YGDuovu
         4u7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq3gG42WidxoSXIcb+00Rch+N4vsKJucGMVOGkpOiw+cnzthdXQcCzYc87/JAaEcpRMhqWJfvvwm8dnxBg=@vger.kernel.org
X-Gm-Message-State: AFuF++kvDmpwmOFYJSlB21CVoYNCfAqYwLWsYN7t/4jer1ZMEJokO41V
	ucY9msLSA6B6C9WIBEuHtn2xq9Gd2PS5n9dbPMJkH+bbB7Zyph4byvlge/17/W4gxdFYTIhrXR4
	IJm55X6PkRI7YCvZMd6RBeJWM4ejKuXxm+ifZsqNi
X-Gm-Gg: AR+sD10o0FWqXMM4LRs0gv9WxxT5eksmkShkSI1ySMnkwevShjx8/dL5GIf4J16YOSu
	7h5VJlReyQg6amZtVLFVqzK5g/XVlYkAMpRNMW8g3pF/1Izl3UCYNzOimvpCW9HocLplqLy+cJs
	BGAgMG20VSU4uQ2nrmxRKjfQb0UJb3Rd40GXOBezpBLV8XMHbxxADNe4FfbW7WYDoB2oMY9e9U9
	KRbv1UEtjglzBlClFX+OfIs3QMtIM5g9nescd49Kzuaqo0Me2W4tGr+CVSlV8UW1KO16896j4Lj
	FEHmY2mSEaUqUGG17nu1EqsFkDhilPpDy6rwF7XXVEj2hhQEXxBeIDrtY2HaD1vpWcvoJ5fs6+A
	=
X-Received: by 2002:a05:622a:c18:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52ff715be0cmr2273411cf.11.1787945336495; Fri, 28 Aug 2026
 12:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-2-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:28:45 -0700
X-Gm-Features: AcwNN1Vl_L43jPWnHgUrkMtGPi--G2PYnVYEwuFbR2C4J7lwt5ES-sPxDWtK__4
Message-ID: <CAGtprH8JLx886qA4rVg5vCKg4M3u9sdEfPig_CtL1kbfvj5B9w@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] x86/virt/tdx: Simplify PAMT layout calculation
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> For each memory region that the TDX module might use (called TDMR), three
> separate traditional PAMT allocations are needed. There is one for each
> supported page size (1GB, 2MB, 4KB). These store information on each page
> in the TDMR. In Linux, they are allocated out of one physically contiguou=
s
> block, in order to more efficiently use some internal TDX module
> bookkeeping resources. So some simple math is needed to break the single
> large allocation into three smaller allocations for each page size.
>
> There are some commonalities in the math needed to calculate the base and
> size for each smaller allocation, and so an effort was made to share logi=
c
> across the three. Unfortunately doing this turned out unnaturally torture=
d,
> with a loop iterating over the three page sizes, only to call into a
> function with case statements for each page size. In the future Dynamic
> PAMT will add more logic that is special to the 4KB page size, making the
> benefit of the math sharing even more questionable.
>
> Three is not a very high number, so get rid of the loop and just duplicat=
e
> the small calculation three times. In doing so, setup for future Dynamic
> PAMT changes.
>
> Since the loop that iterates over it is gone, further simplify the code b=
y
> dropping the array of intermediate size and base storage. Just store the
> values to their final locations.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
