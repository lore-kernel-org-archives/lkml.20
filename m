Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467130;
	b=zYiYZB6ZMDjjY36d/mBHSBbJzfKAT8s7uD1lXjXMxbgVp7PYmylnYhmdP3vi+MA7EGWo
	 OzwbmwQy4mzWEal2rflWcdyVScbqlXOmya11CqqdfAQ24K9pXq7YBmgba2SSH1eaz3CQx
	 Zw6v9pw+I7R2FJ5okQIJ7iXBE947aVur9Z5B+HI7S8XAuRTcFUAMzGOA/3atkdFkJvCu/
	 8n7KuRjDsN9r0+vQZsozlaZhUFhE/xjhEjL1+Cq8H6lOPft+sJEm9T1ksa6loTwTH1lhv
	 lCTZqb7nPfc83l/B43xryMORkHikK2WZEqdlIUoSKn0UpwPBy0kUsUqn2hI3OVGJO9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vvOcZzthIG5GlUnds+7TlPOozWrdyPRuf7q82N1WgUw=;
	b=Tl00rAxxMdq9jmlDP6/gfCbttA2bgwTV1CkN3Zkt0rbs739biDOguy6oN8uxmeRCzNxD
	 cVHEJ/ikDYgI7DKUJQG7zshog+OsG6MsL/IZKMyMbfph5Cusi7bPZ8+9ogluJbjjbZIQ2
	 DaAjVE5kZMcSlsd9xefkEYaZGw1BHbCCd869rKKyrk+catVzeDucuq2LxWFtkFPtxzFTg
	 iE65Z2Ncho2PYhxwQNXTzA98QYuQ1Cc6kUHCTqfHaFlry9cR6w3/lcgsmxB6J/BI6RPqe
	 6yB4Nl1A/ACfiOeo5JIDM+t3bbDK//XLHj2xMjEZqFxT52IFnQVDma+UZYDK0TpXqrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sXOBjTLA;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCAB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sXOBjTLA
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so16239315ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467129; x=1795071929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvOcZzthIG5GlUnds+7TlPOozWrdyPRuf7q82N1WgUw=;
        b=sXOBjTLAZdqPFiwMSAr0VBEc+ruBLIjqQB5uIo6YCPoA/wCugUT4TNWmMXzKetKyXb
         GZTSGa879UZbUAA3hG98Qxi8wG/k076J3p78C3nlOifbrT4MNUhS1IJr1+tjBomvzxnC
         khNM6FDRRIHN356Z/eA5/PfK29zIsYk6A8zpXDXv+FX1KZZmhVSWkEjf67gLSOLKvLzc
         ZfaqXu0r9CYsiOEK+XbWs+sNp181bfiKJHEtv+OTSmzrDpAXNYPH6ypGZhLRoef5wr5e
         Xy5/fVqnIynNLzetywjRcIy0hsU9eEbvaiHGNLnMDMfDri6JUOawLAT4xwvJyOvvvJby
         cWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467129; x=1795071929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvOcZzthIG5GlUnds+7TlPOozWrdyPRuf7q82N1WgUw=;
        b=0uMO2MXqKyCp3mg9xTK8s41P32BTAekGJimvFcIOdD6IJ18uP77AFOtBFNFru6x8eS
         UN6ISLhmp+z1KcEA+J8vznNCdXsaKm1Zx5mIbGNzkViddWi8mo2QjD8/J20GOZVltefi
         BSiNDdiQfC/xPtHZdrwgUv3NI0fPSViCeGBEYtMvZ7lNw8Ft4KYlJiTSsixE/GsHqHYj
         xglDMRDhohoosObqr2KMbbnaEH8TDF61u+ta9SKWdujmLWIlf3//8T+uSewcHmiGORYD
         kSsS+wmdyH5o4RtqakLJ3Ph6bherhoMujoF9wgjpirHm3iNE88nf/zD/zBlJSep0alaJ
         4YUA==
X-Forwarded-Encrypted: i=1; AL+hErEJqtFamCL1qPIkrcSqawTzoZ9Y5xUSFiU+pdphHkBUXodGDvXdYoGLiN+hikYH+PMWcasi+c/croLKYQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KQjxUc8ZNXJvjY9dGneyYYLgmwSfAQRHrPOB69dKFSW8YEjfC
	EAFhjqvPRtnJYP1DDa8dLFLdNBKg7nnjhF50jcwbdKMA4Jcms/NEbouR
X-Gm-Gg: AYBFou33wYAzqyrYlhxPPwQ48NC/T7CcqRcjX/F5KROA0wDImZzKa4XuJHEAFYIiMS9
	MHMzNQX8CAcN39wSULYPEdPKiK7FTpN5uCE7sNWRXfQdS9wI1WYdqW+26F0rUbSQg/rGTo19qlJ
	5aM9wS7SOIP9FLqUJLu+tHzTOoYybML0Yr1ZGjdmKhdcAeFun3zLeK/n6rxRgSTNjZn1LCd51+K
	OaTAxGnlIZ4FkaAM4f0t9uFCYh+WSKocYoPlJzI30/Rn1Px1cX9goJhzvV3gHHnWajXgLZb/y0j
	avyUeGjzaVsMiyHzR0j4ViTFV9lqrUXetl10qlR979xkQ2VDsgiluhu90EFK4z21udHPKJSHUGY
	eaOgxW2tHjPXJmqbQ70/qHZYDHiMwCFEGr59jj4NBv4zAynUOgczFdb1YpQm0Kfe95XJ1Zpt1Sv
	/KKXAFNlit373wGfRXUOUpaqMSdyNfaAGb6Cvcir971agNE24J6OKCD69KdJoVx+4SLWbjDlObq
	h+zVrbulbAdUXc89HmtAbIBYSVfCfu9MNElz/ELQDK17B8Hk1y8E2MCfgFM0t9EHHAMnqjuKgT9
	ScCd+DjGbzcvs3HAb0/AGmHmqET66l2zImXKUrTd9H+hxnCoiKn7j4stmzKvUKYkHt8CJIxHGQ=
	=
X-Received: by 2002:a17:902:ebc7:b0:2e6:913:57ed with SMTP id d9443c01a7336-2edd768c309mr50026705ad.14.1794467129023;
        Wed, 11 Nov 2026 23:05:29 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7d964sm29274135ad.32.2026.11.11.23.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:05:28 -0800 (PST)
Date: Thu, 12 Nov 2026 12:35:22 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	chzigotzky@xenosoft.de, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, 
	ritesh.list@gmail.com, harshpb@linux.ibm.com, gautam@linux.ibm.com, 
	amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: Re: [PATCH v2 2/3] KVM: PPC: BookE: Load FP and Altivec before
 enabling the interrupts
Message-ID: <avVkgrSY8v8yWCUz@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261110053238.3794500-1-sshegde@linux.ibm.com>
 <20261110053238.3794500-3-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110053238.3794500-3-sshegde@linux.ibm.com>

On Tue, Nov 10, 2026 at 11:02:37AM +0530, Shrikanth Hegde wrote:
> Christian reported that booting preemptible kernel on FSL Cyrus+ board
> causes boot hang.
> 
> The logs pointed that system was busy in printing below warning.
> 
> WARNING: at .enable_kernel_fp+0x30/0x78, CPU#3: qemu-system-ppc/4884
> Modules linked in:
> CPU: 3 UID: 1000 PID: 4884 Comm: qemu-system-ppc Not tainted 7.3.0-rc1-powerpc64-smp-preempt #1 PREEMPT
> NIP [c000000000003338] .enable_kernel_fp+0x30/0x78
> LR [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
> Call Trace:
> [c000000085ca7700] [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
> [c000000085ca7780] [c00000000005f2a0] .kvmppc_handle_exit+0x5bc/0x5cc
> [c000000085ca7830] [c00000000006204c] .kvmppc_resume_host+0xb8/0x10c
> 
> Which is...
> 
> void enable_kernel_fp(void)
> {
>         unsigned long cpumsr;
>         WARN_ON(preemptible());
> 
> And...
> 
> Though irq's are hard disabled after kvmppc_prepare_to_enter, but
> kvmppc_fix_ee_before_entry enables the softmask's IRQ state.
> That causes the irqs_disabled to return false.
> Hence leading to the warnings.
> 
> Fix it by re-ordering the code to load the FP and Altivec
> before enabling the softmask IRQ state.
> 
> Fixes: 3efc7da61f6c ("KVM: PPC: Book3E: Increase FPU laziness")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/all/33342fbf-eb7b-bde6-2c8c-254fe8bfb993@xenosoft.de/
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/kvm/booke.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 13ad4cf5fa71..c35e98d544ec 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -1404,10 +1404,13 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
>  		if (s <= 0)
>  			r = (s << 2) | RESUME_HOST | (r & RESUME_FLAG_NV);
>  		else {
> -			/* interrupts now hard-disabled */
> -			kvmppc_fix_ee_before_entry();
> +			/*
> +			 * Interrupts are still hard disabled and soft enabled
> +			 * after loading the FP and Altivec.
> +			 */
nit:
Do we really need this comment here. Moving kvmppc_fix_ee_before_entry
at the end is self explanatory.
>  			kvmppc_load_guest_fp(vcpu);
>  			kvmppc_load_guest_altivec(vcpu);
> +			kvmppc_fix_ee_before_entry();
>  		}
>  	}
>  
> -- 
> 2.52.0
> 
Apart from the above nit:
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
