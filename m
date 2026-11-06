Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975613;
	b=AeTVxuLf0qLwKHd+IkUm5D7v2jpznp+3fZ/67pICoFmcTJc21xa0qcKAGBKuVYBHxSpr
	 vw4v+/U/fpHVMR/FsNFYyPOuNIa10thNe1UEv4YHVfhFsObEpn0pr7zh+2jZx+84LJrFM
	 jdsseEObkoEyY+bBG5zU+tOM2BGLsP9BeGXV33t+Uv+Ir4Ag9d8yt7/qHucYvFQHyWQFm
	 PPJPMJ05aQbl0Be6xWRFqJY/ETtQXwxbviFGDSPa3TXHhsiuOsZLKi2o5Yj05ot+Cq3Uh
	 04MOP0pZsE9efNAmCaeC+j1zEUhn/AUt5si2AXWOxRXOr71evhWp6o+PlYGpyVq6PWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NLBSWvQdzP4LSJXmaAVuA3LXFwQgtJwF9yGVYnQFGaA=;
	b=UrFqPDi0J9xiHQFFcK6XeFlzbWA2Hgwb8lOPU2Ghw5k+kGC300ORGL3kHAp+1bfQhChx
	 ASyaBn2TN1N3LlluqISjfaYut9nE1TP9uXF33rld96P2IqARMbhda3wn25Zzwq4zyLcxr
	 JDNFjyt4TL0Ne9IyH8b+GqsgMKz+w6mwh5JlBIdLSmwg006i35wKgmEGph5VgStr648Av
	 dTW5Vf2dUw+CKqiKwUUPLE7Yhjbz7z963B2WPAisx0d3KeQ6Wcoxa+vhtoMWkF43eSnM8
	 UR5lZKlmLv1BXcvLM+JNwnIdjSBjLdcR7XQkVTyCUrFRtwPxg4Bumpj8yObPtEJk6Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KpvsFqQy;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4A606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B4A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KpvsFqQy
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4889765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793975611; x=1794580411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLBSWvQdzP4LSJXmaAVuA3LXFwQgtJwF9yGVYnQFGaA=;
        b=KpvsFqQyT+4PvH8vA69l/0yBU492aWoqPZPKV1SgAh4+lquKB5hc+H14GIXq+RbmkF
         OMMW12q5VourcFLQN7J82S001rGQz+0kMZfQ1vA3FtAXfXNxIpX2LhIh4AsXh4+kUjW9
         AQTIpyYzpygXO9ub7MPLKTOa5WJI8ut+kYDtrV2gwtBGRZo92By2t/0RT8qBJqyC8yM9
         jayCAvsAlISbFF3imuY0ocrXoQXM9SsTMQKTNgUgpLjPoppZYgPa4FxdBlLxrl/5Xld3
         JgCgNoB8/BLNLk+uGM3j7wHHC5O8K+AFBtwqgZVYpjGi3vRPmWdK01ApftHinGZkbiFT
         W7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975611; x=1794580411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLBSWvQdzP4LSJXmaAVuA3LXFwQgtJwF9yGVYnQFGaA=;
        b=ZavMmqMLs8rPhppp/K7m/tt8eNUCdXG5yA/FJI1sd7gAgGjR6EgnEtFuIrY+YPPUKl
         El0ZcJh1bKF5SyKmVTRpEhjePTEsGqH5GYjlxB4yIIfoYvXoTmIwqYE2iK4HZBssAtR5
         SGHCk3sLjwRAIEBL93AQ5mqtYK+8RrXxgbPItGZWw05dgIVH5Wa4wdxXtBfE7sLNRe9U
         osZ1JQUO3K0j6GZRhFfxp8foy4yca/8eyNCnDJnz8DJdkmyQNmyDpFvvWQ7fm7KdRrA7
         BRi5ahDcQJEaxpL+bfgkUWfQFc5tcU4HtWt3yimBXvlS5yZ0ppYvOtJehhBrbUR2Lg2X
         Y/lw==
X-Forwarded-Encrypted: i=1; AKwUvBwm4zRcfgCLQgy80oZ3VTJ0CfQ31xh8zQ5YfxM71UHqAO4ydNh2VAnPL9HG/Lo1SOT6/tJLzRjt2VzyjnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mgYEb44PXV1EHf3t3B3FW0sgQpWpSEmRxcrEAD/JYVgH5i8Ad
	CHO4K9iJbCHglN6pBjxjns2L8lppwVTbFzh9n3zVh4+spjwC8yBffD9qmvtE3E1zxA==
X-Gm-Gg: AYBFou1RsWzzl1qWfqbBQK/EX7Maj9+yxyuAf46I98WrXecTu2sKhnqBcanyC+jK5wP
	SRa8qW2B2e+o3R3apnfLcIVcNxzASbwAT7YtMQb+9GuB0z+3LYxVcVm8hlsv8Xxszm9msi+IGbv
	yJEeRKeHMFdYqIJcA2NI1oNXOxvTr8nKdLQSX2GYzOVmYOscNzXebI+kaWr87fLXZZfAi77J3y/
	WApsTBiZX73/vj7T5fNX9LtimhGLqVYH5OwcSt1FxlfgBJKBHYLNSYIypb0tMYIEbGJU9j22Fj4
	8XIJs7Hib4ZfLmC6MvwvlKA5hKSXfjviRSJOj18dTxiQt6wTz/2UtqDgYJtd0IlIXFi66P/Uzsl
	wL1bftBmpI43RNJNuq4wgXfJn6N8qiUrh+xxSZ7oJ5rLDaYko9rmV5t2xlbtklmTcv0sObRNb7/
	pIqFuzi9N7bz0Jx9n/rhE/3EWCJmMPb78WHwics2hhr+3rlHEDFQkRHEnTZB/fPhVcTs4+JheIj
	C9aS8/A07kK/g1vjnKA2au1rSXhiCKrsoNB2wF6766OOKBrWPt7cjSvzaxNM16amb3oQWmS3aaa
	bZP/BWNHIxZ7ktFbsUbqnP7GPkU+Ft7YXq7tin/jeAEJNJX/3vUAU+HutWd7ihro
X-Received: by 2002:a05:600c:46c8:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4b6dd82aa22mr47981875e9.7.1793975610579;
        Fri, 06 Nov 2026 06:33:30 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm137145675e9.9.2026.11.06.06.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:33:29 -0800 (PST)
Date: Fri, 6 Nov 2026 14:33:26 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: xuheng@cs.columbia.edu, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
Message-ID: <au3lNp0vzK94uwap@google.com>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
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
In-Reply-To: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>

On Fri, Nov 06, 2026 at 12:03:29PM +0000, Fuad Tabba wrote:
> Hi Xuheng,
> 
> On Thu, 05 Nov 2026 22:59:50 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> [...]
> > No in-tree caller maps into an existing hyp block mapping today, so this
> > cannot be triggered in mainline.  Fail such a request with -EEXIST
> > instead, so that a future caller gets an error rather than silently
> > losing the rest of the block.
> 
> Could you mention in the message that the WARN_ON() is fatal at EL2,
> so a caller there gets a hyp panic rather than -EEXIST?
> kvm_pgtable_hyp_map() is already documented as rejecting such a
> mapping "with an error and a WARN()", which is a better reason than a
> future caller.
> 
> Also, please don't respin series so fast. Give us time to digest the
> series first :)
> 
> Cheers,
> /fuad
>

Actually, why making it fatal? All callers of kvm_pgtable_hyp_map() are checking
for the returned error.

-- 
Vincent
