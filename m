Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353339;
	b=Jc1thpF3Z1WJ+iyiA2TmGs087YBiT4KMAYUwac+8XA6v8hzqfDjfRBArsKuVTULA3M+F
	 xwdwR+fcO3q7ZyP2c7D1Oz5DeYYrrhfyhg2nLp0mxY3xpCcSxrbQUoNZdR+sS2xlulKCd
	 2nNjXymq+yW+3CAvBtopYuSpUQfgqNqKaUQaXypFLxeUmZDzag8ifktEdYmPUC+7BMkma
	 e19AgYwVh3KFGD94d89qvhehZYadnFFs0Sk8Y3zgLA8wgSHa1TEhOvQK5gBYv5iLuSs3t
	 7f/WsqYpSkBZ/ih53B1FeE9C6u/G492sYI3kAgddnN6xIac68FMEYMng+Sdt7BxPIgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ynUwHadLmvdOhAgnzO1JkFQi8taE5cJ+NHtIgb7JTBE=;
	b=Ihms5HIJvODZwGFLfCWC1zKDjYlv2hj6wsoIX+GnBfmlIx0ReMD2f5w0RltdmCpWwNBT
	 uLG64+GgUw4hkiIphd8GvdPzJNOZ7rJIBYafdu3cz1hbDtZF624yBrcbMZRuvCQ3ctAmV
	 OtxwgThNYMC4CDmm0kuwplHkSOrmhA0J7mci1nVHRcDNwXYIgCiNOoDDsEwJT8L4mzUVs
	 C3QoMJCZaADw+1g3nqXtoNSRUs1oLNs2UBRL5DtsCWpvLsVIemvpBVVjizfvNtCh+eg8x
	 LBH7XvsxSSG/Td+FQYCo1cEJ64rZzXusKwLUgU9UW/4i0I8SR76EoHeTag/wFUBxBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h07Ay6kK;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A424606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A424606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h07Ay6kK
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e954d87b48so39160535ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794353339; x=1794958139; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynUwHadLmvdOhAgnzO1JkFQi8taE5cJ+NHtIgb7JTBE=;
        b=h07Ay6kKiqs/bNZ8GfvFs1KrZP6EFshDiQhOPI54SAezvPp49j9L97za2FiyBixRV+
         lYIJjWy6z2E4cCKYTaTv/aCTD/E6P/jvLsd7AdOIxb/ppaqFUna3uqwNlmPWgIEy99cj
         QihCA2v7WZk4xZAPazNr1YTx2967I71U8dlrsL4kcMgAxwmhkuPX14D0Tc32J4kvTnJV
         b6rwDhq6Qgd/2wNoBY220AW6JyETO2NO/UAvoL5kX4LD+MOEd7oBZLPrXVy4ERWqwIih
         XhCuueenyn4qYm73fv8wVEy/JSjDNRXoaOvGDxOQn/eR/hwGuJsnpB7Qzw/WTitqV8MM
         JbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353339; x=1794958139;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynUwHadLmvdOhAgnzO1JkFQi8taE5cJ+NHtIgb7JTBE=;
        b=diQ51XNQ0lOwc4qJPP4hMGPyc+1RYg8XT5GHbj6m9NOtlUX8bwAmmYCrThsSg8pjq1
         XsjKM1naj0/gpLQfyTDJ5265hCAn89FqElICNw3vlO86Irn9TjbQCE9Ezv2c1KfmcqoW
         1WPFWLXC/ZKyZ/T6YKHYzqgANYssxyQAj43b2/HnDLWFBusuoGlaqQ5yGEOjuI9p85zp
         hWuoarar2Gu/kXYPzfuukq2yIXwsiInH85Uui2n/Xs40uXd68KL062nCAs+mdp/6ShQO
         GuF/GumF6uMaCdI8CY+R+Ri+JSPjSYXb3dKxU6R5rxVuPMZK3PmadxyOdpj+jYuFmWVX
         dM4A==
X-Gm-Message-State: APuU4Z/QznOfde4ecCtXO1p0HGRMXsABY8GwegeAMqqcetHwAdNVwfUO
	/VRq1b1slNCErM8uvGGPEsgPDvvniu0eom7BsesI3DcQuEDZOuzARHTSn69vORqrDu1ANjP9ucQ
	UTp8DBA==
X-Received: from plfu10.prod.google.com ([2002:a17:902:e5ca:b0:2ed:40f0:5f81])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce02:b0:2df:4876:50d9
 with SMTP id d9443c01a7336-2edd76d1b3cmr7615645ad.18.1794353338477; Tue, 10
 Nov 2026 15:28:58 -0800 (PST)
Date: Tue, 10 Nov 2026 15:28:57 -0800
In-Reply-To: <20261105164531.313849-5-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105164531.313849-1-pbonzini@redhat.com> <20261105164531.313849-5-pbonzini@redhat.com>
Message-ID: <avOoucIBV59_ELE9@seanjc-mac.roam.internal>
Subject: Re: [PATCH 4/5] KVM: x86: allow handle_exit_irqoff to return EXIT_FASTPATH_*
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Hillf Danton <hdanton@sina.com>, Steven Rostedt <rostedt@goodmis.org>, Harry Yoo <harry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 05, 2026, Paolo Bonzini wrote:
> Let handle_exit_irqoff() pass what it did to vcpu_enter_guest() and/or
> handle_exit().  This will be needed to trigger async page fault handling,
> and to suppress reflection of APF #PF exceptions, once vcpu->arch
> will no longer have a host_apf_flags field.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
