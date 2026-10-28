Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198132;
	b=t66P2LIwwh5soZlsmVYmiFktsJCvVVtUB2kuUMy+ibfaFxWr6H8NFDfjHy4r663YaEzW
	 QeyL+WN9WCBOA8JxDUSBvXnh8X13nMsLViF6lCFqVqp0GpqBzVBmXXlQNNSR/+/Ss96es
	 AzNb5NP5ZQUaGp7NA5nQF2irtiVgCN1RoOajRWL/be6Ry/ZBpvpvcEEbpur8HBZ764ZPl
	 ck9pBa9lpXRnjLt3EUGYGo6T/WWxFFFKV+LgBDA1RUlxZf1BOZoh7EEK0btUz4Zzb0LAl
	 6x4eIR+Ql5n7c801HPdkE9GblM+c5stS/mi9x5VxsiYFlOa4Wa7Of6ZOC1ZKClUm/pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pN1MSQu89b3Fcl+JyWjZEXsAVAkBhCmDK4pMhtAcO+I=;
	b=X3M3Q4fe45DLPXDRoJWemBoJBc/YlfRjItjNrbu71hZ9Ku0rL6ZLhtW+XhVdUJJviJCF
	 N5vc2ukvMj8BFDgiTti0pn9dbGjNcuT7Y7kCmOkA5NZGvq1YAhhG2k/xql6K8++iDhzQf
	 D1KQS7nIdhqFo+R/neyG1QWgA27VjL96zyYDUSsfKaIAIUrsayWAVLz/QXSeFWynDZyjW
	 jkM5TuTrS2dx5fUlIAz/s9AiIh9aLnbYiV+QCqGjRM3RSJihJNSXo1Py8LCaz5HermJG6
	 aQ0hLaRNOFIe4lDojLeDtlVSodHQhqy31StfmFX7LAUu8Hgz4P0Q8G9LONKCXP0zKXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jjzM6C14;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBA606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDCBA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jjzM6C14
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so935638a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793198131; x=1793802931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pN1MSQu89b3Fcl+JyWjZEXsAVAkBhCmDK4pMhtAcO+I=;
        b=jjzM6C146ZMrMokFin0gW0fPWv57lDjWWpS3+UrVXHjhhzyBbPfYGuomppIZcSul83
         HbdAjcRlgHxUeF5J5RQ9YIFfNxkkJKuvRkOIYyQpriVTk6nIJmuOw9iQZUP9HV2JqIiv
         DVPfYhwSj2HNoeF60mAx1yoTBiM0u5EdNEX58nBCBT1Fd3hSBgzMuyQqHrEEokLcCbQD
         R89kTyQ5kds3jw5PJjdCOiYp0EX5gsABodanb7EfBjzUigsE2jlaMx0x2gMDe2PZyaDb
         V9mnm5ww41ikuc8ebp+uRkRSGPYLBw0Jmbm9fQ1GXoLhFQaXntLXqFaAGt4As4UWeSXI
         EU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198131; x=1793802931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pN1MSQu89b3Fcl+JyWjZEXsAVAkBhCmDK4pMhtAcO+I=;
        b=VCn865/FAtFcmVcIR0D5gYzkD+oc9aUad0/P5zZud2nDtf6IiA8p8er1s27h0tY1Oh
         KcrZxdKynv1Yv4fne0+lT6KS+7fdJX6tijDWoFN5OfhVqlyvmmfyzxAFdmz+hdbdO0sD
         QoQkwuXuwACMlprBXR3iH2vvKn8E/Xnl+xIo8edlrYBtn62Is0RIvu/GGsqu/E38GrM7
         0FrchiYdmAiGEflT16js06i9VP2+Md7VlXsq6bojnnfv1mX7hyLXXqc1VYCtEzOa4E2b
         6JGI/xZwmPYKMrTEO2u1hsDPEP6MZB1p5pGB1nGKvlG4crMBq8jF5ErynDsy0uqA88jw
         kW/A==
X-Forwarded-Encrypted: i=1; AKwUvBzgaA373n29YY8tWM7QadLNOVC0q5KGMwbe0FuRYxYnDI/QltMveegH6FGZ/erCDnLTXBsExGSYwLOlgj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSfW53E5XWr0sUb2+G6fzRBeLWaj3XeXpnS8+T9U9TDT2Oe14t
	555bVWzIylyaWlsGoRv6xfL9F1rAiJweaFmzRaC9QPHptBQ7kHW3nmXZiM5ecA==
X-Gm-Gg: AYBFou2gVLXrXx7BF2XUkVd38eXyYlRqcnim/5HnoWikD+9ggtWP+xdgQ8EcvJytjMo
	LN7iaJSnQNWDb7NhSKFv7R/+CXTiXOFqmjErYqZ/Wf3gA2ncUWg+JdxR7S+aPqNN1GXbqiKeXlw
	asaxldKc6t5dERPw2iCk64VzB7K9R5B2On+x6H71oGdcHW87MPwz2NRbopIX3Q6X0FVmrNAGzmc
	nzV60SGusCvYK4t+/AeBDtHjAzU5H17b6BqMt5QQtAHy1IzP7+nmSRtdmAv60IrwiFSwxjYFUgE
	hx03LiXgE+Qpgm15opfvNC8DrgdHpqbZ8dVtZfCraXzCROVpSXg+PI8E3MCyoGRJjV5YwPQ8Yhj
	vxpXCzUmGnDoRo2rAVempoAGea17RMFOQsnwaW80+F5ahFWcnE2iqKF2+SZzyIHBCAyYnfgvCHp
	gmeiHm2hrC5d0lunhf4EbyuDOKamomP0fJGrPkcAvm3XAxF3pFmW2rc/URCIumfy4gKhkPkqphb
	8CGh1kJ189Zfb+CbGGI1LGlHZY1AFlSZW8v3JfPMCFWedQpECLw/qMxsysB76nSdjjzc2ZNiwE5
	k17FMLT+mzlYoqzwtf4g2EUE333VYjqDF8c5ZDWjeoudSYwsUq3t5P8/R1l4ciDWj5vL5nnzJ/s
	=
X-Received: by 2002:a17:90b:2543:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ae581b5095mr1763826a91.18.1793198131090;
        Wed, 28 Oct 2026 07:35:31 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5834b1sm3422045a91.13.2026.10.28.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:35:30 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:05:22 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org, bwiedemann@suse.de, 
	ryan.roberts@arm.com, mchauras@linux.ibm.com, agordeev@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH V2] powerpc: Support for generic TIF bits
Message-ID: <auIHxotTRFuyJGBv@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261027074710.129819-1-mkchauras@gmail.com>
 <auCJ9ZDlTpHlnyTi@kunlun.suse.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auCJ9ZDlTpHlnyTi@kunlun.suse.cz>

On Tue, Oct 27, 2026 at 12:24:37PM +0100, Michal Suchánek wrote:
> Hello,
> 
> what is the interaction with
> https://lore.kernel.org/linuxppc-dev/f6c831c95f1171e0b82353e611485231482f3deb.1791975972.git.msuchanek@suse.de/
> 
> Does it supersede this patch or should it be added on top of it?
> 
Hey Michal,
This patch is applied on top of your patch.

> Also does this one need the first patch of that series?
> 
I took your both patches and made my changes over it, so i guess yeah we
need both.
> Thanks
> 
> Michal
> 
Regards,
Mukesh
[...]
