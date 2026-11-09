Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240038;
	b=SUyDcYf/nctxIP2PKU2ypGOxzgGJiZrbdT5+RaucMnqXNi1vxhAQYrLlHTS4dAZ7cyAE
	 n5Pd2dBrJMMNq4bHYOD4bPULWFlbSTMejUMeP6tzJcrp/oUepJfcAbFWhtgOuK392As0x
	 CHzFRE7+PoOwaxv4VRhCctv0YvSY7lFiPndPvNhN0Nuu9cKi/zQS0q0I6eR6PGv/x9nkW
	 PzkBoMeP/FEJKRQM6x8UDcsLLlIsSI2Nmni5xsAjw+vHsOp1EHdcXXU2FQzRLZwyOrtWx
	 CgB5319l9sOritmuTZ1mflmT2lWhbkVX+b6lX5aq149ZsRlYge4ZEfU56FEj97+JWqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
	b=STpma5s1yxIVtPK3IuWSqFLb4yq4z9cq8R0ZPXhhd8kL2oPLogHNdqwqy9D5AmZHtuRx
	 BflSwD82Cugy4c1FOvA7aF90pv124yFx3qDQB/xMVxieM7l3+RaMY+U9dXUeDf4/S/WPR
	 D33dh0XVCAOOYamBPWj6E0WgGnuYESN0BO5RI/AAheK1pc5Gc9yUcLDMXP9mzO0etAKzt
	 0wp4JuJyZr+GXTDn0o3WGk45t3n9U7tW9C7O454cXf/3svFm2NeBbrLSp9ehPlZW8amuS
	 w/4R5kzYrIwSjjnFnFApHHVKDYPbZUnQNUlpUjgd3VTdZ9fOSbQnH2suqyLfA2GpQrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kMnje8W8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CA606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786CA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kMnje8W8
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ec396c93dso12255936d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240037; cv=none;
        d=google.com; s=arc-20260327;
        b=LXSK4hWcCViZ97MPUxyqi2AYTfWlthzOb5u+W3sT+hMBpi3fhkPXDJjPKRWYDKencj
         mqYHwE/4IBcsFHHh63/JRVMka0t0a3lAg7R0kjkr7qjioV11LxIIw2jam9ZrzW/T3L94
         lxxf63+q1LxpoWfxJpA62Wz/R0RCb0skaGNXW62N2bozHPUueaqq9hcRvQtwsycB/sSZ
         c3mDCWqKtpEO7oSHRcGF07rRqQc2sIsI/jZRis3Nkdqv8N8q3sUno7VvU9p2+suuIV2i
         4OjBSJpEywcuJqNHluCgoyVsf/k/zwjqKa6SWsbAWiFchxHfDAA0/0xhyo5KSkgWHG86
         os2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        fh=Ni0sVKlAOSo8DrLZzMTSyw6RfG0huISPZ9PMknbNSmo=;
        b=C8KgZ3x4EERGdcFAJZFIpHOpiP+8Rp7BUtGi3TbgzAt3ifkbEA1M/uDU3I+GEHawxx
         bjNJZzHyssZ/e7nwn/Ru8ULDh/0kbbf6RucML+xl0sStdkO4SZrvz7uLAf2jPxl9t7n3
         YzdERM2sUsgtMq3eUWOKmqVNnJstwf2ZSK5gw7WL8sADO1nrv3pAsp7tyGWLMVFDXdhZ
         Iko43fJUVyi9kz2mPb4mKrIRV/q2P1jQWQOT6haOKdW4IQz7T+k5JiKj3w8LTgyiPRNy
         jw7+ot6Pty5YGmC6XHUgOJB3pTTKh0LCdzEuLbEEiAvNm35A5+2NbnaMW9nrGobJTmg5
         +OUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794240037; x=1794844837; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        b=kMnje8W8g/JYnugbNNHI+pmFVWJmCOfl7lIl1FIzm9S/wjPwFsL0D5gN5jnu26wiR6
         7QrwsYDMIALex15kGj+PZ93dilYTkKvaVfyRHmGvbelBUSqPrlGK88N6Ec+yOO35X3/f
         4Cu3wAR5B9c7jUYOO2bd0iEU/nJfZQndXTu/qbO4wgqEZKQNetD8la4PtHNWLeOVLD1V
         N/nz46O6hGbMxrUofNqXfx2M5iMZV/voFo5hGX8lvY//jbKP9A0PWeXBnyUGszzkmExw
         d2pRFF52nYqVvvRn2sij56DlcJEGAkQqswFSR50AZ1OO/Q12zOl+MHq2FvISe1eQreH1
         qNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240037; x=1794844837;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        b=g+nlcv57j35z2e+mCV+wsvxtPv1+7q90xchdUXE8n+YC148/fgmiQYYrWVaU3sh14c
         EPGSSAC8SvUq7eagIHsSZaVnNH/lbYtD8Ss59Qidn5+9xy0Aohvzy/Y2fNrgq55FcPfs
         biPLTk9HcTNbO+MuO4emAhBuikB84GYD29OzjJDI1olMQcNxIBREAwJqxylWC2cKTgre
         fRiTZlxC0ZTaYI3lBM2dejNjE0Lor4nS4aM6tzmjwrA+98wPWyFQtHcribQeb6YBUUQa
         +bF6OjQUexAZCku5CgJAI1NjdTMILZ7mMUW5UfSaQhSh+9XMvGilsjyXjgvSYOEd4q7M
         VuGg==
X-Forwarded-Encrypted: i=1; AL+hErGdUw7/QCXwt0lo9TXBgMHzeH7+G2PG0Lr+1Ka3EOSpHn+QiJqCmpyo4jNg/qfeC3s90jpWG4aJLVohwvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uo9iLCLYTmnej7M3Xa1/z4xOJU8xd8vHl11JjV+1JtfDQQ8TM
	gqXLkOSGtsAaXy76XPtWOtnstmsDNRTNlnznWxHxpOqpOOPw0dGFf1jVYa4vGcpt4Us8yaz/HrO
	uGiY000xFzi7iHkIuD7EydJGmeGP6hBthgMtXeVC5
X-Gm-Gg: AYBFou1m20Pxpg9tLmwVMQGDySsApTh51roLGsj0z3f6M8IPwwQQzq7waW/KhIxJZz5
	LAbU0YOuqg+q3dYWo9VDdkaMqQrNpSkoF/8Gkzxy78mYjh+xmLt94+Zfbpw1cIJGacg7yClylJZ
	qs9g8IfWeObY3P6iEU7TRVJYRQCSl0DOC0peUQmtg+RYfrKmLpSFvNZK46LTij2saLo+yMlVIoG
	QBIxaDEVXOVZCP9sRU9eFT78edf3Oul++ClTDrcFUDWccss3tXrkxodZB525v26cuFvw1hDVD2g
	TXiwpwWvRg/Wlpv+WPX83Or8q6XG58eRiauZvvhWdFS7bsH1o3YimUyZ7JjV/9uJWln15cyo/cW
	FDDLfFc3716qcvxTqm4IdqSTMIaZs8KZJkb2TTny2va9JYEFGLGjyJRB3NV3eXfA8mg==
X-Received: by 2002:a05:6214:5402:b0:91e:ee31:55ba with SMTP id
 6a1803df08f44-91eef8c841emr97756d6.57.1794240035928; Mon, 09 Nov 2026
 08:00:35 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 08:00:34 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 08:00:34 -0800
X-Gm-Features: AclHuK8G0EZDW3tY7sTDlhlnaXZOXK3ScUEr2v83dxDnmQ6yymeVPIAKQ5tIQLE
Message-ID: <CAEvNRgHhzFxfXB+jXy+RCwTWevFTEW3RH4q51xztrFZYa4Xe_w@mail.gmail.com>
Subject: Re: [PATCH v16 02/20] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
>
> Initialize the TDX S-bit and the GPA tag mask in
> kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
> is initialized for SEV VMs.
>
> The TDX S-bit is used to distinguish between shared and private guest
> physical addresses. Its position is determined by the guest physical
> address width, which is either 48 or 52 bits for current TDX
> implementations.
>
> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
