Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3A355F35
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953756; cv=pass; b=ZTBV6YFHudGqijwEBbzxdjYxZOwz0oI+u4MN+w1R8+bXNnXHYLALLXQN87p8wr3L2QiJfOrZ+7zuoFvwm0S/lw5Okk2cCCVksSGbIA0b+i+GyE4wGLw8hANTbtaZZp0w2n7j+DwtCOYi5IWBe9POlzVCIYIEpqjzwsWgZWFjY3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953756; c=relaxed/simple;
	bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXiSjgLRZ88PT/H738dvDqzEgrYO5r0KMzLk5SkPOWSzqokTXy5F0AP61scc322F0kTKdMidQTJ/3zSMwfKNhFu6LrI/1hhFh7rzKaWu5/XDA0ECwSaJIuYDnyuerlO7bIzpjQeI//EzeGltygTfOJ1JydUcu/Zl879RBZBelE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IIt3FcPu; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IIt3FcPu"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52fac937235so33121cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787953754; cv=none;
        d=google.com; s=arc-20260327;
        b=QRFUeBJAn7uxQmDoWwi5RopcgbPYRRw+bIk7a2zI23hGfKP0+G5295kWsZjZpM4/x9
         vMQwiJxgxl5U4nFuXa6qJ+1YggRaPa+2TqtTGrjIiWj89ONgaR5Xt45OHYUEGYFqWklK
         dhH76FCUtC49vdx4GW91AoLYedGzGWFaHy2w4z+UZ8GMl2Tcw/Tp6mqc33IWV/8300j5
         R+rIJ+b52slDk1gtpAT0xji1NKxKzUPEk6TuycD+Yif3Zgt4QbmY5enSeVOB8siH11nN
         nYpWzoMBavA+QjDvZBXWoIK8ePdaEoNmVuy0ooF6CbynhnYLtqVAKtWz4M+TW2aCl6f3
         fLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        fh=4unHU57PqVv62onGAGiJQWVSJfuupybeYEU+ttNJDDs=;
        b=oLjnkuGx9q46hvlKurkog6b8a4oUf9FDo/BOSwN1iudnny4NCagcfhE+p/1U60grfY
         bVDkVrMlpsN95McxGRtnCzk+UGU9ofR0EDPUrtI+0LuCW//Pp68CbMeW3dpEQrxvuDIM
         vMYkPtfxhyoA4OTUKnr/TtvzfO0kJVSCXWx7VLfr6TEL6t87KwcdsfmFXQr3qZY+Ck10
         XF5FkeGJxgO3R4IobUYdI9Dv0ytl8EJjC7BFZ8TSD95N1V6ZGrTbEv6+wosJixTaaT+D
         6G71r8soj538iL1iu5+2NoUcIXEJKEJYftBZxfmvJDkQkGvwTYsOgl6psQx3QOZbT5xD
         YbTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787953754; x=1788558554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        b=IIt3FcPu4gwqfcq0f43QVaw7Dy4mof+meN2gRiV/1YL/6T6vUBCh8TtVKISBYcGVnf
         zIwHvuK6O38b70jcy3+QkDyZJgBVazXbOzxrX2OoA+jly3OM3tXP5DFpl4vPpuaKinLs
         iPEoUV92oh1OIGegntnS/8TELhCiXr0Fx8pp90rbAXE5v2S9Vjx+8QQrC+xrV7IxB4hh
         Mrj7NM8KEv+p95oZ5eAkHq/poNVcTw5curLEsp+YK9dcO75taU++qfXBWM0KGYQoZwXZ
         oAw8wV2Xb4ssZXg2Vu9nFGX8vwbFrHd3Dp+X4gRtr7BHMp6KB+jFbV8LhS2nyd7tw8X6
         wf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953754; x=1788558554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS7ILyNRDwIZOyOLSfg3QhGucIcgXedbcky3j8j+fgE=;
        b=VACHfR3z0m0hx4mEwLxY1I2e9XTxZnk/fOCIczBbgVWnlEB+G4eNZZC4UJmyNEQQCE
         L31GUJyKFqBCTt18w2atIhWTCElY8BGUWNx1nvV8fmboiLF+EDTvDMtc9XyY7N3WH2YM
         FEELYGZFzENP/XsfUNSErKSYmTzwDMY6P1nM/BtaiVfv7XE8EX9ZEofCoxDf2Z8BQGme
         v9+u5azjJ6gpFss1QsxZExixgxYX31SESScCL8NMkgZ4UDeNOzJtJ1lOSFJ0RE5CdBWR
         5FwGM92E17eymkhGR0GfWF7n08Xvp+OjO4FCndrHlMbkD9P6U2hU0ze/GDv0dIRPPiqB
         teLg==
X-Forwarded-Encrypted: i=1; AHgh+RrjcVeu8ImPVmZpJ54GZcQ6waIgLbLLUMxVmV6FpBneJfXe1AG6dQUEhyTaPfSoUvdh82e+kCrLXWUPSqo=@vger.kernel.org
X-Gm-Message-State: AFuF++loZtqxYE/C1u+D/UL19pcxRhJXLHd3RppjF+awL4unNjmLpu5t
	eYbJBTrb1nVUVBFo+d8VYvLOujuu3LTGeO3mIncKisRS9I+RgKldLRyP77gYDiEN0pAxlrbMkRn
	Mgp0jklG/pt5diE44b5ff1GUvc+RHgOmNpb4O3Siv
X-Gm-Gg: AR+sD12RQ+Ll+3Q0T83AdWaBt4gBu2HNXJFuo6OB/efjk7AC5IqpDhXtSrwFPJEM+7L
	TKokLKfJVcpOINDG3V81P2QNgOSXmjnwm2DiGXRumvFscgkOOLtgL8wSD8MR2w/rBBQyzdlT0w1
	U1psrkguPamlFTlfqCDAvNhBXNSaOZseMbHso+X6JTrkkJDnrHLnzg6DroGRrxW39NsW4OIokfF
	P1B76LEIfoLXZlzPnuD+ms6i08Eo8Vz4bWajOQFy0F0QWZ+pt4a1bjtEnxhTDO2G7UKCHN4Vcj+
	XorvoF32S3jpW0EIlZ2zveXugdIjCVCWy3WSOLWWxTe1I5AuMK9iO3Y0hhMnqSMVz/mb6VYEVAY
	=
X-Received: by 2002:a05:622a:598e:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52ff6f30c8emr5308471cf.2.1787953753102; Fri, 28 Aug 2026
 14:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-6-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-6-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 14:49:02 -0700
X-Gm-Features: AcwNN1WQxsNINsmJYKS21-W-S3NINHdKdRHcQQhWHhl_kYf3xtibaEfoC6rNsbM
Message-ID: <CAGtprH8Rax32PfiCk54aY_SUPkpfCKYdK5ZKaWJ5-Y8vtFSPng@mail.gmail.com>
Subject: Re: [PATCH v9 05/11] x86/virt/tdx: Handle multiple callers in tdx_pamt_get/put()
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
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> tdx_pamt_get()/tdx_pamt_put() unconditionally add or remove Dynamic PAMT
> backing for the 2MB region covering the passed page. However, multiple
> callers can add or remove 4KB pages that fall within the same 2MB region
> and in that scenario only a single PAMT entry is required.
>
> Make the helpers handle only adding/removing Dynamic PAMT backing when
> required, by refcounting each 2MB range. Gate the actual Dynamic PAMT add
> and remove on refcount transitions (0->1 and 1->0). Serialize the refcoun=
t
> check and SEAMCALL with a global spinlock so the read-decide-act sequence
> is atomic. This also avoids TDX module BUSY errors, as the Dynamic PAMT a=
dd
> and remove SEAMCALLs take internal TDX module locks for the 2MB ranges of
> the specified PFN and the PAMT page pair PFNs. So simultaneous attempts o=
n
> the same 2MB ranges of the PFNs would otherwise encounter an error, which
> would not be handleable in the put case.
>
> The lock is global and heavyweight. Use simple conditional logic to keep
> correctness obvious. This will be optimized in a later change.
>
> The pamt_refcounts[] are atomic_t's. They do not strictly need to be
> because all access is protected by pamt_lock. The overhead of an atomic_t
> in this situation is minuscule compared to the global lock. Leave the
> atomic_t in place to enable future optimization with minimal churn.
>
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
