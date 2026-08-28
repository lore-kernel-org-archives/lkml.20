Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD813AAF65
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956686; cv=pass; b=Lqy9krp2awE7oIIuyEoV+wb20ytHU954m0H0vp5ObQf7XlCugOZv0BcSC/7/NOjXxZ4h3R8wqXncAYa6WhvY/Y+8lxfSAVnzczA3+iNzlLxcuqG1t6YeyfQKWULyP42Ue0bi+7hi2xe72an7tP6lrKJgI/mKty8+7uE14R6/w5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956686; c=relaxed/simple;
	bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo+nxGL2tve5DVH+Szj25/V5spK3b8exXt1MLwoqbFmcFOr6yYcMxqZPZVO9ncWyOCig0PF6t2iiZIHIzG2ohemR6lNblwYyVcOy91lhsgdF1t4dsZy7KrF4P7Z0QjxSAB9QpwvMC8wyOlAo2nF24dmXTxZOyDBxQ4o2l89I2pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGFD9c4s; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGFD9c4s"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c01c79467so90881cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787956684; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCXPmUBr9SDL/wqB/nlSyKfbtNcyA5/O/jHFdd0HCIEu1XnlAffR/Z0Stm/m+0z0LL
         pllO7nvkC4jJSiHxSkiXapyzwvQvC4g5NOQWBJYP0OF/vxKHcmIgu4pHgY2p3pzs8p3m
         VHgx9tIjZhn9J2WGX+o3+lE5Q9CVcQ6fwwJ5vbIppRDtAStGlucGTvaXibpssPclFds3
         qlxOBVushuY1F+70jBFCTC1lBJ4y6N7KBsENvcHpiNiBEORgMSCI08R0k5mjaMUBVcBb
         ho81ymGK+DTlnnCOU90RjCBaSdfF7o10ql6xjndM9fQJDUy1yui4Uurmf0msPIOCEaDA
         TEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        fh=J+duy8zB2eo8CaKLCrcLWirQIjkNjHkddqunXD5gH3c=;
        b=Xh3NNqLwfhl0hTqnTrm/j3S4FBE6i1RnlcZnDSeFUN6w23GGPKSumLrekMJl3L8g92
         YR9CuEnksLkuzfpwxdvU77YmsOkO13qCcXtAgnMH0lZaR7FRXu82aLDZ+D6G7UgGyDJi
         acNIArBf3FcfcSaQDdnsCwSh6blnkEMHnmS4XZzjriALwvFEeDs5j+LpPHJnvmIc0aCL
         m2KIDU/tw0YVXjV+PKw440H8aJaGkf12D24sAhvFxJBDSEjbIhoVk0e6LSBySCJzmFrm
         f5FJahUXHDBzORMHu+KnfHjIC1+LlAjttnSQ4B4M8EOVq1SwtEsz7imoiDiir/bpw6kQ
         1m7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956684; x=1788561484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        b=uGFD9c4sheMP1v2k8UheA0WnYDpKEMiTUBEjRIXCaLsCiighma3nuw7tbWuQzGJEYY
         UVF+x4KRElLSP3wP+vnxUylsJcJmRf3bBmplHUYI3rZdiS+6XteiIY7RYMlKM0vqA9fT
         P4BfjJtPIeyLBnq5IdJikriFTDFwQr6JS6lbQLjvHlpVdIaRrLRKcP74cmkkboS0Hk92
         CE51IxcsBl1Q67hxIGbYJhXfeqPDvjDeETm+fC8+FLcvpv74OINN9Gl1qOqN76mvsuoO
         dsOgqDuIFCJf9+cr1pd4WXmRIadxT1rhV20ACSwaqjBk2lfawIqFw6dWWfJ+gyEONoy2
         T+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956684; x=1788561484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        b=lOXEvbiwR/xGq+EXspLUsEg2YjYU6MQjL0NRKQG/ee5WeGwW5YGaXonrx4E4Du3vUe
         kB2va9cqMZksDQv7xV6artq4jYB71E1P87/r9cb3pNmdqaqVj5rBL8NWC7dVRVCUwH5r
         vgwMOyBU8ktg1CjpkMJFvub+xcciOO2R0kuwnN2MAG+X+9UpEGCZgjJzSElXuGtDMWYY
         Qzpo2f2F7Ltg3z0X79OEVO0s5YeO8LbFR6Ae7oqOMn1L1a13KoPiFA/CYLNgWu5soh1j
         Jnh6P2hHNZKRNR0ORqnmMsAH8btAUtRbYk7GqAjk/F4hz2aPYXAUqBW6OhfroilQm71N
         IuQg==
X-Forwarded-Encrypted: i=1; AHgh+RrJovCAIyn6kG7hopbQA/XyZorFKnM9KWst+Ab+4UaXm9Bb+iAViPArvwUva4U5MhIqRDtKzc7ZCw5zZ3M=@vger.kernel.org
X-Gm-Message-State: AFuF++kRxonGj68dZimsXNiVTI4NmQ6xr7PFmxoIEAt9MpxjV4ZcDsAu
	ELgA0qqr4tyRHDaGAZqJTS9hp5l8mKPSSyvnZJRXfyWIqdjdihIWw27+8e9+YLDdTyqndzco02L
	xr/QNfh3EKNq0oHz+VMGylEzFrUeX1dPzFnEX+099
X-Gm-Gg: AR+sD11cwrWnQGc3Whi50q+6cY6WQMSgVc43E7FWLc1dgNaggHkUddnfyFfxTHxmqeh
	ZeXELK5mBVZOIdw/P2mlwP+DWvWTm1tkw/We6qep4lofPR5tet3l7SUsKqOhaG5lhsCTcgZfm9O
	6lS8deNOJ+puPbSoR4pyx3wjzhCJmEdVQpKrL7zS3JCGpF1LWlX5RQI0oWuQ1JA019F331IzOH0
	x8iePhSToE+j2hC1ioEqR84QF32CGe0ynJXjfT4aHhcr2AqNTd0sl210a1yScd0Nyg+vGfQm9UF
	pgsNmCZHtIZMBaWXazo346wtQpTMk/Lf/ARkKtMX8Hj1XiaxIQgPX/pgNTlU50XCml8e8F9Kvys
	rAHMc4bqMKw==
X-Received: by 2002:a05:622a:587:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-52ff741283amr4482141cf.15.1787956681880; Fri, 28 Aug 2026
 15:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-10-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-10-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:37:50 -0700
X-Gm-Features: AcwNN1WYsa0jAMLKRbnvpEBaceT5sA4-DylkYo8BvJ2OG5g_t8qOkwUGOnWXXA0
Message-ID: <CAGtprH82XzEmV+y-riufdOTAzJRwDavUtsRQY5BS3hYMGheD6w@mail.gmail.com>
Subject: Re: [PATCH v9 09/11] x86/virt/tdx: Enable Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization. Dynamic PAMT is a TDX module feature that can reduce this
> memory use by allocating part of the PAMT dynamically.
>
> The TDX module exposes whether Dynamic PAMT is supported via a bit in the
> 'features0' metadata. Unfortunately, the TDX module exposes the feature a=
s
> supported even when it does not support using it with the number of keyid=
s
> currently configured in the BIOS. Since no TDX modules exist today with
> that issue fixed, make the feature default off to prevent users from
> upgrading their kernel and encountering TDX erroring out when trying to
> enable Dynamic PAMT.
>
> For the decision of whether to make it a boot time option and/or compile
> time option, consider that Dynamic PAMT's memory savings are significant
> enough to make it a good default configuration. That is most TDX users
> should want it unless they have strange keyid configurations.
>
> The feature increases the kernel size by 2KB (when TDX is configured in t=
he
> build).
>
> All pieces are in place to enable Dynamic PAMT if it is supported and the
> user passes a kernel parameter.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
