Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803668;
	b=E76pe8mkKgFBcqjyPUSrG0fFxToLEwrvA1Hk3yIJtGXT0M3YRyDxIoj7O38lTd0ejfXi
	 0yau4BCdkzko5DwF1XGzEzw36gS8tRRWxV/Fubrs76S51FTIsMjdQKByoZVdS4uuBqOPw
	 YWBln4VxMhuY3K183EpZOe57MhP7t/kN8LbUhhoq41AHlyysvXo22nBVPhzTPXuPyP1a1
	 D1i+iJdXehdslldndnVSd8gz5U4NklW60YGhLzAHL1SqtUCrZUv+5auTWnEjuOeRIBM7U
	 N4aq9yjiDMrvCpONzcU/5srto6V9DmPKQW4LFWKAEFrej5Qqdz5a3KzPxfYomIE0OvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yb0ouDgf9S/OdWev3vcVfqdIAaKZrYAoDUUyKNG3AEU=;
	b=oVBreR8GWRC+Aj5ElZC7XB4NDv4r68yQNYzD01vjHj7JkFZDwiGkgG3Gwd7Uheqe9C9w
	 9TYFOV95Fwp6bpY3rBB9hG6/sbKblduPkFIzsZPW0TKVkImf1s7XBt5rf5SkyvXtdhW4u
	 vblF94p6+VxP5B25+ASAUSrJht2e+JlRpzgnMBX/Ja15JFjE3ZiLyFcPABq0Hvxq5UbpU
	 vZVgUYOUugl7hY331KOoTjeDMEcsyHkNtAaXqqCyFbmRmfSzeh7oqtDdvKPiiyKCe+4uR
	 sPjTDMP3lcZZ6+nHknREjD6mactAIoFZUPDz7khVUB3BkVBCGdDUgwX0adviO77oQow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Hf3+VtbD;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD17B606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD17B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Hf3+VtbD
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2245494c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794803667; x=1795408467; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yb0ouDgf9S/OdWev3vcVfqdIAaKZrYAoDUUyKNG3AEU=;
        b=Hf3+VtbDTfzgXLI/sO1VMbmiG3HjPWLPXQC9K/x0cUqbiQ8byVDXCgJVkDqWGH94aR
         b30c7OGKR5Ve2w8uFEu7hCMIH5aAu5hXb4FYyBCKKc8AKtr3mECcpxs948DTD0bMi/BB
         Zn5fcARDQKEQQ52hBvf9q416lDQQd52msqG+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803667; x=1795408467;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yb0ouDgf9S/OdWev3vcVfqdIAaKZrYAoDUUyKNG3AEU=;
        b=LjUqSYl8goj8pqGM75Tn83I6XY8VOLpwe/aQ3yN9X9EXGy/70Ua0uOI64Kj0QPRPfF
         0neBhgNEqT9FmF4BwWYxrxqXvhoRBmBuiShpB7myLofBcWlPaAuKTGNdkt6YNIWojaAd
         wwDaNkosI9uVyo84XgKxA5PtbChXSp4JSDYYj9OWhKxrDInKgRxQFWghn+TPYAdnmiEL
         ZA+461987YRnHGueqiRsd6stmDZDDjENasHEf+i2YQ51BZA9VQ1VaXWmcE7mj/IWJReY
         jfN2HHigx0Dx/Jkif3k+aeb1ASlSU5qgX8f1Az1XcZJPf5wacLVLtv1/f36bJv0cpuJR
         0Wfg==
X-Forwarded-Encrypted: i=1; AL+hErEdGVmspXIXo1prLFejWesHrKnGFzfpmcyhcBKl4bZkRUp6KgJ+DA+0jMAIqx3Ol2GlN+gV36EKcWIi3yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZklAqDo2ERJfbVKoF+vw3U9VtE2SNYG7KGnwTIFopFK0u9KvV
	gdhgZTuyHyZx/j/7qrS13EQXuKasM/DgQioH3DXJnjl5a9OSTchu0TnktDlIs9+KglU=
X-Gm-Gg: AYBFou3QjLkPSfNplXpUjc+zLd4HiBhhU47IwBU26m5Gp9t8Fv9T8Hv+u1FvsVcL4n2
	DMJlNTqPphLB33FVZEdKSAV5cBKowaKhT6UQnwB4qeexOyCDg/Fa8Rj5fIib8bvYWeOb8WgrwXN
	TtXyrOr50bIPJ7Dn4LrW6D+bMb+ffGrKx7NKquX3fq/JHi2I6QWrB3YLQ7jXm8PEhOrw6SgkvWX
	4nQvqK1SfW5mEJ60hxI4pKM1oLu+EIShg66D8WjKX0shXd9yJmb0ApQktAM9DYhOzb4wJVI/ubn
	pU/GUN7Epl/Wj9hZqBtve2mYMsWF0tiCm+eiEN5BoluH4s84SlUjfJ//6m/NSNocldo9PcAxWDE
	EbbcbrzlTXo3qy+9Dc3cWHhgxUZHUti6htkU+K1nlRvc5IeXL8xvG0FEYoYmhXr7i5PaSwSsuIe
	ui0OZlt3JPBtsgG55mm0qem82UK0PuE7NYDcMBcsS5XrqcwoytdbSnoMzuQeN62lUsNWq3cKZIx
	WZQDxhhPwbVorcrJD1B3h1VLygWNMH9d0H6okfXZ7kI1P8gJhXjUWGhs0NlmW7JmBpxygTeOSy5
	2GeajRX1B1ASOzK8m+PZKYvBiLK+hJ2MDUZZKMgtKoECCH8/JEXVjhE6wFVCdHAz2hqG9KgesDn
	IKM2dbRMALEf0QhLr6FzuKsgD5v1YWBnAv2xmqdN3l6FPfFBJ+VyLFUGaX+u5sqTzgd/QvBcDD2
	qoIP2xP//7Zvr6DbSiN7p0bfjC7PDkjA0c/f6mDOCKu35L+nZSgG68TNlNe5mcfuTU
X-Received: by 2002:a05:7022:b0c5:b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b4f5f3475fmr11110443c88.10.1794803667022;
        Sun, 15 Nov 2026 20:34:27 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm38362148c88.9.2026.11.15.20.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:34:26 -0800 (PST)
Date: Sun, 15 Nov 2026 20:34:21 -0800
From: Chris Down <chris@chrisdown.name>
To: tarunsahu@google.com
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
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI
	compatibility
In-Reply-To: <9huz5wy4tufo.fsf@tarunix.c.googlers.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
	<20261110050202.529473-6-tarunsahu@google.com>
	<DMRMLZSZ0LAZ.D4P70QWX0IHB@soleen.com>
	<9huz5wy4tufo.fsf@tarunix.c.googlers.com>
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
Message-ID: <20261115203421.38c206b35f5b12e6@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Tarun,

tarunsahu@google.com writes:
>Techinically this is just for readability.
>
>WDYT?

It doesn't help readability in the generated docs, though. kernel-doc
splits the parameter list on the comma inside the macro, so
kho_preserve_vmalloc() comes out as

     int kho_preserve_vmalloc (void *ptr, DECLARE_KHO_SER_HDR(kho_vmalloc# *fhdr))

and the struct memfd_luo_ser and struct luo_session_ser definitions in the
ABI docs end up with a member like

     DECLARE_KHO_SER_HDR(kho_vmalloc folios_fhdr;

I'd go with Pasha's suggestion and use struct kho_ser_hdr directly. The
pointer can then say which payload follows it with a comment.

Chris
