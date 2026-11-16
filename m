Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803663;
	b=Xfqsjj/ZbJKmk7tsdPOwCBPuSiYFoHQe6ptLQ+0pDSRQFCBbEXYEHoUNDJzQBE/4GRg+
	 GgxfDj1m3/BvqDiYwLz8GI7YhNu4Y1PHx01ZMfM5nzwa9vhMyhzmqQkRkrDW9B6NSRwkE
	 ENBSOKtJgQG4j8mV0ebw6NI5FWom10wujja8+IgZFS+mYzr3QY0Ga3IB2ebTm1cPt5kF8
	 n/70E3hcu1dfWZoVKFmGJtl880BvS5do1WSxkcFkwfRs9ndIlO3Hnz4IGvAmIs8L3ASQI
	 IvRK0eCUXmhhvfH4hOXGo3qGYvNrzXokZx6N860+k/KpKfyr25IQCK0Q7RSa1OPZaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=0RTPkBSn8aHOwll0NIb+MH6Rxh2TXo2nlFC6RRntyeU=;
	b=YG36feu+hhRPOij3vwzHyQS1Wx5/IGhuk78KsH4f9t6w7d6wpvo7IXcMM6c7luVYPTFs
	 x99icJcIEMKtxqMPwwluZJvEHydtx588mkNJXohlUHznXSSy+qy1v7YhV4RQJxR0rO0Uw
	 9xGvq9KNXYzs4xcSVSrkgj7NoYNNaA0FJPs+6++HJAdXUE6hXI3w+ESobqIvHhFeH7uSX
	 ivddtnlWYv+HOFZVh50C6MIjpsR1CAcvNoQLXoafg5uIaoHhbJDt2jTqa/g+PCOduBct9
	 ib4EFps003gGYRBMTPX9h+dMXVNZAiTcnsb9RY5YTERwhjIhrALVBrv1ijuSuzZnUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IvrpsDuj;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F21606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F21606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IvrpsDuj
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3268143c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794803662; x=1795408462; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RTPkBSn8aHOwll0NIb+MH6Rxh2TXo2nlFC6RRntyeU=;
        b=IvrpsDujkb8+xQxkW8bH57B/Njtz9j5nrLpeGfuYrBi6nX1JKFJylBRC6sdQEERIVw
         HtGcx7CHi/CiN1Fk2bHltHeShULSWGB/FJStMTLzNEcxESGvjONp2O5O4N9PClo7TcFu
         4beF6ymkhsh8+wfAWm4UkR+WNqUZfV0HV7UcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803662; x=1795408462;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RTPkBSn8aHOwll0NIb+MH6Rxh2TXo2nlFC6RRntyeU=;
        b=DmNljxgcM0kXyGAQUxzQLMZDU16SJzrswkQL/wKZ7X4E1wD9eCUkh0T+pOJfXESsf+
         +DP7P47N+a+iSpNOXmJtVAsb27m0jZQWCbjrhWkUalWsByVK0gwgk2AB4xPRoMDGeRvP
         VmXjuS5fe7mqMlbHjV+P5uXFvVpFn5h7DdiGQJR1Ow2UyKx9TVg95uA0rdYhAc+Un+Wp
         eSPk2qAcpbrkXp0ta0mEvOVtZw0Js1AW/kZdIk1YLgAhD8jtadiMZDYNPlN+oQkJdRy6
         pVkUzUGIe1mf2psh0hBr7Zua0FsT/LJ7ypx+w+lKYP7JS8f2tNTImOmYoGMXBqA4w49V
         nm9w==
X-Forwarded-Encrypted: i=1; AL+hErF9uvr0Q2QLydMRSk/Xfayxqtabe2Alz6m5ae/EgOqY/mmOD1sC/9Uf0bePDIkr3Xw+e87o3OJNOI2BXWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pGCxlgHMrOkyUEhsI95GdvadUXkADwk/kH0/XF19cNDyuzFAq
	MEx5it9GzYRBAqO0PRXE2fxpj+hLPLmSWWaxptKgzDN/huBrexImIx60EkeI/020MRY=
X-Gm-Gg: AYBFou0PuAO0kI3tKh4G+yK2HragBGfPVstP8UumoRpyncsRqgdzrq/i1BXZJcfZ5Tr
	/qgnR/vMjw3zMVZKMl8HJyuZ68ZoXM/Y2tC52Q9dYQeeBAtaNsIRuhL5l3kZ3QRIBDEaXKqK0LJ
	ECK8o7kgtOwclgRjpfbRR+OQALLFys0yu7J8OwB3yUSg0Ris4JV/39rBdEgVvbkeFOUMgHdVJMw
	0g8Cjth+wdRHLZTw2OY+akWEJgXcWpV0SqT1orG8kH3f31Xm7QHwhi8F72YX3dofoC6oBgNfKjm
	vnYYsK8WTYZaRr40OEUDfF8l3QA4Q2ukr1Ppft0//QtSTN55P9WKlMTJSr2hABLHvgr/oD1DCL0
	mpbjl+KkL5/pf9ltm4q0En6ODIafqZU/CqiXCHxJ5+cLQzn3W/niaelwywAimhf6zy+DsZ4swdj
	ZiVYJM0SoqSjb7rgrNKRo7kvo9DpBgwgyfyRctdk4uIGRbZAA2En4UCmmyFaKP24W617oZGlJ59
	X53z/QByuA/R2h4hM1lu+fOOCIhXdx8wguC8j200OfgQ+XYMo89K+YnEJ04u0nKUWjd3ec799vz
	mTdprqBF2hisnM3jZ474daQzY+1LheKRcXMNfsFV+C3V+MYLU8OLpotWrCV28Ebayl200hgds9I
	5+uMPPXLeX+YPV1Mt4NfofpRgx4enpq3aqHkdl2fWPK6RXfbF+rLgLtHyq6xCM+1Lby8C5PW0JE
	BRGWbdZ+CPsueWw6s9rKXGCUugNlNU0aJowDwDPH7l/opU565zPyDHCv2TZKRhNjzn
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr9813315c88.2.1794803662025;
        Sun, 15 Nov 2026 20:34:22 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm2576204c88.0.2026.11.15.20.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:34:21 -0800 (PST)
Date: Sun, 15 Nov 2026 20:34:13 -0800
From: Chris Down <chris@chrisdown.name>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org,
	will@kernel.org, David Matlack <dmatlack@google.com>,
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com,
	loganodell@google.com, arnd@arndb.de, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>,
	oupton@kernel.org, alex@shazbot.org, gle.com@google.com, pbonzini@redhat.com,
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com,
	joro@8bytes.org, kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, skhawaja@google.com, sagis@google.com,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/19] liveupdate: Add feature header to struct
	luo_flb_ser
In-Reply-To: <20261110050202.529473-15-tarunsahu@google.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
	<20261110050202.529473-15-tarunsahu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261115203413.eaa54fcba43adc22@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Tarun,

Tarun Sahu writes:
>+	for (u64 i = 0; i < fh->header_ser->count;
>+	     i++, fhdr = (void *)fhdr + fhdr->size) {
>+		struct luo_flb_ser *ser;
>+
>+		err = kho_ser_validate(fhdr, luo_flb_ser);
>+		if (err)
>+			return err;

I think there's a problem with returning this error as it is. For an
unknown required feature kho_ser_validate() returns -EOPNOTSUPP, but
callers of liveupdate_flb_get_incoming() already take -EOPNOTSUPP to mean
that live update is disabled. pci_liveupdate_flb_get_incoming() returns
NULL for it, so instead of panicking, PCI carries on as if nothing was
preserved, even though those devices may still be doing DMA.

 From a quick test with an outgoing kernel hacked to set an unknown
required bit on its luo_flb_ser entries, that is what happens after the
kexec, in that the PCI FLB is never retrieved and boot carries on.

Could you validate the entries once in luo_flb_setup_incoming() instead?
They are all written with the same header by luo_flb_serialize(), so
there's no need to check them on every lookup. Going by the code, a
failure there would panic through luo_restore_fail(), like a bad
luo_flb_header_ser already does. If the per-entry headers end up going
away as David suggested, then this check goes away with them, of course.

Thanks!

Chris
