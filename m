Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BB7457E71
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143914; cv=pass; b=av+4MJGuvVnos6To1SPqYhmRh4sEcTDtGAVaR7V5TpV/0Nbpx7nqQdMLSZe+/xaraqutqCmJ+50Zgw+nTcVjrlep78ta5ZjW+YZRY8wPQ+6tmcgSO0odWBcm2tyb2wOaf30SeaYFfTM+o9yVbJrgmG5D/AT7JFTbBbfRMe4iN3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143914; c=relaxed/simple;
	bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aF59NL2KpbrXsAoEQihcYsfaheX7PFKLv7IjdjXEVBpfRxtFf82625carR+ynqZ5dtaBz5eq6zrulydwhCNyssfcZWA1Y3liuGrR40vdCOrSBPgLBE+7CLMprJM4dIm4oHWTs7yv0B2L2OVMpb+RnabViLvyFdmerMFm9nlDCqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHvnM3g0; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHvnM3g0"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35159e0092aso726132eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792143910; cv=none;
        d=google.com; s=arc-20260327;
        b=kUmCi1Qta4NfDGoxXT2bmdwh7wuX+wZlJDL7dCaorHMf/XOD4WU85RNDPhT9YQfCz2
         CgUeMHhVdjXTEfrxHNMl8cO+ccq2FEnXwXd/kxk0doqBaypLvfldz0t4zcMZn55k8fHw
         lHclyrhnYMn95U/yx6ckGhVzMp7afusl+KCHS3ZxdVJoPTzATdUTWlDpUxK1B72Aj17k
         KFn7VMiPdrD3+lEAwhDggxw8vdWU9vHRLanStRcSf5cEB4+27r92/03/IpZaEalzY0us
         4jUy+8/PIIdFWQEd1LD7XBmWmKsl+axenIChJb++ZuQr5NmLfOmGSbj54H5cCpPNncbd
         lIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
        fh=B6sYdumaX0AC0oUpu9VJISPQ56AldG++DPR8OZXgMtw=;
        b=HHXYdXYUcpQ4jpIAq/xkRECrG0T6fP2fnMK8lGDuPXy8wCXpF0LCmLi+GCP+4oK9l4
         jqgpCD+MYOSdhHmeuTrYf0J90vZ+O36lEN54A8EA6+ucZtWz4VK+wgafJ1G6d9YxR0pO
         QkqLlA/hi9x8ntlHZLaZUISv10FCkluogFtEHRQcahm0yEyi0Xhj0m9rzD70sAu27W7A
         DRBH/rJ/ZOqSeCRLhQC093RmG5/qZzlNZx/0KqRCcs4Xax7ZGBn1WvycEIPa+Hq3ltIq
         GujBqO/0vnmf50DcMz4c5Zvb/BiB382JmQFMYddqSJE6DjAkTqGo2wY/xDiJD00Q2p+W
         ptTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143910; x=1792748710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
        b=nHvnM3g04LFxofrK5Sg13nk5Q6gJJfEuN8wTFfW76Buqdh/r7NlBKT0M3Mms0oUwFB
         +5s/qHOjCiP5RwteNWiWnjGRwm+wKEUxnJRVZGdF5fUEGGE8oddNTq2kCI+yw/r3DxqT
         gVnE+yTybaoGLyKGnpNvYOhLvrtuZxMAOo6aBR3tJ9audaaoKvjZiej450ToGuZoLGYf
         m44Catq4ReiMgFziq0U0YzCSntZA+X2Igpid7USdws695W9T4H/W0pO2b+KYlziVyyXZ
         JjRd5I4wCz8UDuP5WxDQbY2dz5i0mKk0gnCGeSh6XfSNV9BJuk9jr87dhAy2I6qqAzrp
         rupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143910; x=1792748710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
        b=QwCEY1ZOqx6N18XecO5MNx/SKlXF2ngJ1mOTHFqgIM+g8DjXnjaQn51e2zzHjarB7k
         5F7nSA1Wk4AEBeT9pIRDfwCJE8m79WEXIgii5aHlLPsgfLbKrWHqwszvbC28JuLdxoaU
         dweasckWygbfmMXVdpUb/uxmpRKmm5KMpYK/Q9fZwHHyFbXqKllnG11QFLzfCnWbMvnN
         GAw2Mnyk9E5jcUofuSXplpE0iO2qAtDOy564biR/ib5OypH6GZz8XR4Yfse2S6nTNL6Z
         s8EHHbfxTbZ4BDD5CbUyZWKOIXkdHj+uT0SoFBFYFj/VXuw8pk9RLWxFbOcNlAQ4EtiC
         T4kg==
X-Forwarded-Encrypted: i=1; AKwUvByqAXGdzLem+8EOpCi34Zyniv231B6f8EKmZV8PoCTr/HWcmDEDm8JLQ9sTzzOk8sUof6uYGi1l/b+ZKfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJORaSVBP3p1zli0bd1oAKNFQAAHE2coA4t0HaDUCgIn26oaIEo
	aqDRCznYnBuzVMzV7AJImTQcfnOYzqiCBJyR84AfGLflrbIKBVx0pUcmziKNqDAV2RGeS/4PHk7
	9mteeeaKgntmIvVlyVQysfNsS0l1qMio=
X-Gm-Gg: AYBFou3qjKbTKKilPh6KwGMdZ7L+yrVpGW5HypaF+cw25ppN4/6hxCtrCEUUWOEHIeP
	c9KpYcEO0kDTzHgz/nu65wesD5DOO+YYx33lKJkqXnNassUeD8rr43jgv3ma5Q+uAJsHh/AemhL
	3+6x5iDW091VWU2ALluFHq/hUIDYQu8tHCEsD2vq0JOOsuTo9UfhockUXQPaTO224ERfJXIt6hP
	y82gucf8MWg4gIcp9PyXZEp3/oUIhb0koR6Od5aSlcrzjccZUdMcvh/wpdnpeKpJcOpq0TDS8Th
	V8yj3npzUor6Xw1ZqJTrIVAF+FX0viA1dX9OjZIH4DtSYaTTNSrTqlaGGmWjwKkMRtTfP8WUKby
	kDyCW+KVgfuabfnNyeKZmsV84IWRDsG5nijPpcjDoJxLJLyAFblI95JLVHlnRlvGWpqjfETInAw
	dyPJc9Hs8ZOf20y5s1bikaL6EXBfZwkd/ymY2sn815PIM/Qqe3VbY=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr21983206eec.0.1792143909709; Fri, 16 Oct 2026
 02:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014232030.GA3382959@ax162> <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
 <20261016023418.GA3746059@ax162>
In-Reply-To: <20261016023418.GA3746059@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Oct 2026 11:44:57 +0200
X-Gm-Features: AclHuK_1HbfCKCwQ23wv2v1S3AsFdibLw7WDClp0pzQ9hEN_e7mFm7luShe5I_o
Message-ID: <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:34=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Whoops, I am in the process of uploading 1.99.1, which should allow us
> to cut over to LLVM 23. Thanks for pointing it out, I need to stay up
> with Rust releases better.

Don't even mention it! I thought perhaps there was some reason like a
fix needed -- if it is just that it wasn't updated, then that is good
news after all! :)

(I am happy to ping when there is a new release if that helps or
similar -- actually, they follow release dates like a clock; I even
have it in my calendar as a periodic event)

Cheers,
Miguel
