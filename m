Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642183976A0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957682; cv=pass; b=CrEE7fBD9QU1OunP2N1rMYAh+cxFVjs2dS2WQAJPQeKS16cMa7+GDZu9xG4F+SABcmsS7FLyVtc93TjMAgnSEohtn6U9KYNjXonl6YJpuXiQDKtBh8SynULjNiKFqFmexqjYO9KHAuu1+mHaijWUQ8ePwrf6wDC8utFpONt15bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957682; c=relaxed/simple;
	bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNA9HJgsFXTiTK5sWXiuUvnOgePjbh95WXqKQ5tgKKjMSZNQ6zz4JCJrZ4QBKxswLqL5fU4gWx5pEXJMOWkFZEi+EG8n4aTN1m2Y0a+WCOkUyEaYtuiIFCaIR4b8eT39X3QvTADtryiTM6I6nU+AGVUzwCG9Vhu9tl1OUYhkwSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wl3ePovg; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wl3ePovg"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52fac937235so45211cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957680; cv=none;
        d=google.com; s=arc-20260327;
        b=OtHMFqBhDGRc/hr/BSOsr/jAVcBrA2Cd0BPMgkjA2g5hYr9BCo/Fp5x2lDtV8JGDs3
         exQK2B384NPCwPqrM3/7bKoxnA6StCqR6UTy3kjGD16ZqsIoBbdg4wr8sQ+drvD3Rxv5
         JGJotdZwd1KZeFI20/TyaA2Rx7Nsq4lQp0ZiMKRVOk8iqY15W74bnwG7zBmAzzHI6hQR
         Ine4q9OWGPfqORMDBidGIyQerbD5YwWsIUAcn9BRS7rEx7O8Z0WRrafKa7UAnmg7zIj3
         O/smbYrQ4BFlYeM+DnB7y4WNVMPgiIbfRKEus1vWkKEyS8u2eju5/ezsAuoBASOKvh2l
         fAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        fh=Iv0s/5meNw/cRTKqt1i5Hy7m8IYuV8ZZZtqWcGmz62E=;
        b=cXeyP7J+I3C0iDGaVI6i2Hob28Apz1ywhv1Qmwv/wRg88MgJJTzD1DKyLIENGOy6ah
         jl7zr47bGP9iIX3Z8I55QN4eoypdwYptsYGyX92rOv25uMg9+AlE5QLAc49bubyyuRTX
         mycktSt1kEBqKUZL71VNj/XfhgD+Ftq3EpTnI/NbGQlmwFdJPRNHrTW8ZrzMygaB6Ub9
         aC1Ax0n5KliM3/SQXt+7ASrQ5h8mldqcP/kwdyJCC/RDumCr1CCAmTMTwu+NnSiGVpjM
         BZXTitdw3kraNOuOLE1lVSiLikR5U5TRHJM4UnM1qfUtzixTxgBzci7qN0w/GNv0Shda
         T1yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787957680; x=1788562480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        b=Wl3ePovgS5fvjrS/gq+CySuWQC7t+AbrE92aPHiK7CMboSg08VRJhs+eAGo2JP8rq3
         IgfQNJHMN/tb7gErer5o8rT4yLNfNRmrs4fIlVdUPorUAI7dWoqpgC4GRT/fdOz2e9Ao
         XHTHWQEZ6GQBFNB8oxNNR462YPSgCoS0/IfdPdKmbLH55+RP2VqSgn5rD+Z4Q90oyiXk
         wpe+bLPzKqNrDnKXVnl37Is/xKD4repSWwrL/Y1kMIwlMvnKp7L7R8asD41/BGPyLasF
         fw5tjfgSWu0e/QHOeMlFs+AIx5Wb0hr+Q6E245WixjqGn+lf6AyTGG7xVsGLMu6mvESe
         sbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957680; x=1788562480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4unzX+NMpOtBviw882dRQzRaeXOD1/xti/3UhI1UIHc=;
        b=kj0/rBy9uXYxManYYdNN+PWU8yZxTDUU+hv2979cB1+zaG09bH+K3IzEkwIcdRlU0R
         3J8+ICero5qEDiwplxPCCAuyIxabFFIEgYLl0ED+dMoSCqiOn/CWmjnNhHDOllKxQYnC
         ixuwV5oEivBaUr7egCXBr8t1lIBoiMcbrCPyNk+73q+Vv/+fOheXXYq3GiwjkYfJ8SV0
         hEy41bPA53uWpDCDkZ7rF+DyYoRwfF8c6YyRe1000Yv0yS0do4BPAz1PgZ6t/v2CFqho
         Jr8G0ZE8YpRlF96WtHjF9WsdIwBf/IBuBHH0ebNZ0FkVZ38N5CB/q/G4EwtcwtqKWt4E
         GIKQ==
X-Forwarded-Encrypted: i=1; AHgh+RogbhL5gpK/NQ4wn0x5iVxWm5CkcVFOpv5vxXRMVL0z/Xbjy6DeQSkqRxRW5njJcI7OXzm7mj6HbqcfxyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mVOm1ptB4fSVfwExDzNQBgZYOD2AWEHy/dSkp70icQIGIqfKOT
	fCFRjgntLLHZ1G/bQlDzJQnTEgpQDLxmpzGqeDTZFg7rbusc/sC0j7XDyhC3tZvAB7fSr2g3o5/
	ra+XaeqlVgu36DtmWfcmHf18g+W8WhfdDHt9NL4e5
X-Gm-Gg: AR+sD10i3svktq0QRXeckE80g8N2tuAFKtOOF2cqtMgtLy57es3cKOeW+nQtFCUQ4Vl
	IuLOZBarUPP5A+Kzg6hs8JswvDZNk4Yx1lNTZ0TdG/9+tMwBcziNTnMdJg2aO48wATbUfRVX2Pe
	zpp2+zjv0C7cGIufXwixRpmjPlqXx9f/XWEb/8GVOMo4IVXrBJd+l4jtuB4lzqc/ueVPZ5lIJv7
	6qiQ4gOi+JvG+MGTV/DyqooI7jezmHiziePlnZEVDlTFLTfnrwTMOG4FlbD538W7N/i/gH8OQVr
	iqNXynrgVJMHPnE4aJDfPhSfV94TN7cmjEkz6tSUSz09OxWhRVh2YjXV+da8eywodBJkv4eKSHK
	K
X-Received: by 2002:a05:622a:5a14:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-52ff716a2admr5298061cf.5.1787957679730; Fri, 28 Aug 2026
 15:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
 <20260806020850.1221381-4-rick.p.edgecombe@intel.com> <CAGtprH9ERb_fFG-4JYR1Bjxyyvnk3Ys4q=9ioQz0Cq6QCXtVBw@mail.gmail.com>
 <9c0048b72834e7e88cb278476ad8d19f57373aa9.camel@intel.com>
In-Reply-To: <9c0048b72834e7e88cb278476ad8d19f57373aa9.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:54:28 -0700
X-Gm-Features: AcwNN1UEyg9LUIjstN53o3MhfwwMAKPLjXkthRuE3vRI8Rovt7_F8Pac_E2pZ8A
Message-ID: <CAGtprH870raS09USeB=Ec_TAY8Vke6-nV_LcX6dYZVn=wEhjNg@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "Wu, Binbin" <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"hongyu.ning@linux.intel.com" <hongyu.ning@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "Mehta, Sohil" <sohil.mehta@intel.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:23=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2026-08-28 at 12:50 -0700, Vishal Annapurve wrote:
> > Reviewed-by: Vishal Annapurve <vannapurve@google.com> for the
> > SEAMCALLs and the get/put helpers, assuming your are still thinking to
> > shift things a bit between the current and the next patch.
>
> I looked at moving tdx_alloc/free_control_page() to the next patch. But D=
ave's
> comment was more along the lines of just commenting the limitations. So r=
ather
> than disturb the already reviewed patches at this point, I'm just comment=
ed the
> limitations clearly. And then removing the comments when the limitations =
are
> fixed.
>
> So the only only code change here is temporarily prepending the limited
> functions with __.

Sounds good.

>
> Do you want to keep your RBs?

Yeah.

>
> Rick
