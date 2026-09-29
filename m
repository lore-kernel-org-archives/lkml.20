Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23080443C29
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697503; cv=none; b=DfYQN2co/EEMr8tKeXStCN+tnEg10aot+NYV76q3TS8JZgyUHXXwXwhszx4ld5yEHU+wjStVho2rEXW694acjJ8aWVZOU3s80ZzzhVamZw9uLuvxL9coejXgYnZ8VnvKD3DOJsyAFzfI6gT9hh2XZquCdnxjD65QG9BA+FFhzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697503; c=relaxed/simple;
	bh=nR4yrTOIgVgspvjCPgKKmvkm5cZCrViKQN79fpTorck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5/y+oFj3KA8CJ/R8i9iKwRMNE22uDT7dDHeN9DyKopo3vWjDYy8K3sX142jHw6f54jkEuaPvIWi4qlKMxYxV0aXuq9Cey6T7PJ67R3GwU7yckd/+l4YHpb4wudB8LwujiwoWjfF5Af5xpOP6z26TJl5hL721enIUiZvFJutILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TGjFZgg5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TGjFZgg5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso33281475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=TGjFZgg5lUHeZxukRtGDBpWWXiPuev8gp7o7FIX6qFXoKC2EajqRD+/ExUDCSfZjoC
         i4OrZjFiZGSOtA6mpUM4f/v/zeZAXWCL3g41cedVNWBPRLuxv+9Dd+SWUiKp5re4pZfU
         jJ7hvCUY3S01HlnQisdD/KK+9JhEQayTnTWsXyOQs91JsZXPSkOOZZ2+4l+vktxu61vb
         8w/OE2ayTWQXiV2FZWNafA6HdPrYCAqgm4k0PQXdk1/Vwauf44GR+0YcnVQSOaFVxjpB
         d+/mHzpjlC5QOs1jyDU2SN5c6YrW8WpQYyg2fsMt9DDG51eS4rnjRbgfKV2Dql7KmKt4
         ocqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=Vz9XpZ4IkpIeVmGPxmSy6oxJ6HlnQJlNjj+m+C8SYD1Eurr1Boz5TDeg6BSWQKrhXP
         ovjQfVoZ+3hejpd0e7cuJpQe7Cl7DydEVSyXKavokHo3ThMkmpx14hNPeCJ6ifTLCBFK
         jLarWO+7yXghqFISYxlTvbSBXA6WkTcgvbPYwdrFrlmLpsmNQufAqz64zzsnUX98nS8Y
         n1sjpUVAeis1e7kU5Ca+tJz5Ky1A0bhSxMbR+PrEzXM2YqZwp6AKT9ltjhVguLF+lKei
         TiSXxCSFDY4R/ZkXkMXTDlQcg81zMqEtJL/6vLiMZp6ak6eOpdvTzqamP4uW/EDUekAX
         LT3A==
X-Forwarded-Encrypted: i=1; AKwUvBwNr1OawHo2sZqFx2ylaL2uW9FH9wx6haaX+rpqf+ay4rlvU2ueKWnbYNCdkIgyTvgG/343qJthuRV0Iy4=@vger.kernel.org
X-Gm-Message-State: AFuF++mD9pglGtVn/jKsww3eprO+pm4YmhsMiaO2vn+xSgMzVlPBsWHH
	1KUH0CrziuJf8lddJjGtGHM9zTsqNL55j91QgKcmjDudeEsLIy172mQkrSt8KN1TAlU=
X-Gm-Gg: AYBFou0DYlH51uNaYPhaDMP+jFY/3Kx4M4mbcWwSeSYoL4otocVXKcJWaYVAqtqt3Wo
	LY0RpGo4ANaAFOFQDrhbyln9nrkstFachnxKu+ZAW43fNyLkdjvARy6ugDtgt+sIERLZqYH8LPI
	PiDrSmMhxeDsxGB/QXZwyMEXzX+5xzwUre7wibi8g3wrwHmMXdDeQ2zHPXcztF6blSqsQ7h8sY+
	jAO9psxm0rCmbGmOJuPgK/CO8g+8yT3aUsd1BNwieE+3V4Aa7Wj9R8auiWWMoD6OMuHr6YYpFQ1
	Y2fOYiwf4U3fkorwxehRqfoc9eNJI80nrkAD4luUzGqJNKPsGtxMDYzYGFNwVGDEDeUX1kkvE8W
	5afK5w2CfCEhC/62IIoIWsqKY7qg9CaAqW/kiEDUEN9L9y945mUrrbj4BRboLfQ5NVgMI3JIcb1
	dssagu6GOWKqn29wltNOIBwc3SmwMzXubAzdP3EMRsMFCyYK0Q0VyYHLqLSEqB0k074hf7yHJzE
	2Yx
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

