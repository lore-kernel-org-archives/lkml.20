Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CBE339364
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312155; cv=pass; b=eP2qURIBV4+y1OkfYDbmQXHVW67sZiJPrGmPPQEjTdJV8p2m+zpxQpZLCuxKvkv2NbrHMZfcmqWun2qNorpghc13HWwUY2a/1k3IKtxKvL3uzxqDCI8j6zHK8CagMbmMZp63RjYBaYU0aFsUgfAHO9xDTl7WnxtoRl4H5FW3ip4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312155; c=relaxed/simple;
	bh=lqvNoiYS5Y69wvqY92SOyBc105nfusymGn5er7L23A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qieCnCb0e/q53n1tzv4udL1O4sCXOpfgYYo1bo7QQfNtSgEA+26ljt6yJL8jkhO8KiNah06x5CqhBNDPIQ1+zeIP7flMw0i2P8R3RHbcGWUUNIoI/PEMG+CzQT95j/zuCuiM7Hgub6cUoXPJKivdBtmoGqCxPHKvaJW9NaVmJiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qRuhekSJ; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qRuhekSJ"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-143941c2aebso1236c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791312150; cv=none;
        d=google.com; s=arc-20260327;
        b=Y2TQ7B2axArWSl+vJvc+2fbPahck5Xvr3s9jUJ9CO9ixBim5KxPfRp7+jzWYeMy+2c
         w2PqFoO2RcU4f6ll1AJnnk7EAhq+C14WmLp2ttma1sd/vcevWfrhXMkBxSYfn9ngPcsF
         PSU6zTaQMs+TaM5DOZKx5cA8EOUU2MJXEMcWXCaJknCprZ/+3rc5nGrOQVilOE/kyhxX
         SkzofNoqXCdRJ58dHuyRk178heNERxMz1I4M7dJ4sSzVlVoRj/noH9dQDSTftljTnUTy
         7c8Cxoq7g3REbyPEp+CPRVO0TZ4+BTzT9DzIX6tVDvX3M+EXZCgyHvF+aZle9H0PcLFL
         zqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lqvNoiYS5Y69wvqY92SOyBc105nfusymGn5er7L23A4=;
        fh=vSlWBCZ/Meqb47JYqzdfy1rVSOGIsugsD7KBpI1qB/o=;
        b=ogbTk1Wz1bndIFjzYvR7LywYPTjGuGtOQh9cA69pBML+58Y5SX8+HmhbMt1D/H0sZt
         rIt/+U0kojGQBRTaKtI5i66pX6cgcAhgPrQAGxQYTmFq9DM2jQiOxAisNGbg4S3Xr3K4
         vHtdsFudK1zkS2ZBBijtOHBXVy1Mquj/DrbwbY4f7XuF610vJG9sJfGN2+vtOFjzu2Y2
         9OPmmJzd1vqD+5Py5Oqqxt6jsHlyl/0LtA9Kpzk52EAuev4ZXACdcseqEMcXh9BRj3uI
         aqMF9ALAOoDHR0zK91Rd5V8LKJ2KqSIdxrxUYbRb4kF7uoBx1AG88NI4m3SGZfTkh5tx
         JdCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791312150; x=1791916950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqvNoiYS5Y69wvqY92SOyBc105nfusymGn5er7L23A4=;
        b=qRuhekSJzdk8i+DAJXACJem5G3rR0qUhP89PkDKWJHgX/bjYseCW4NnsYaO2PqXJ7x
         Dw+DFfO4QxlsV5WnfGSWIFKlOmxJ2h/z4rb75merTJtFFF9nkYAOW3S9rprOsOzzR1TB
         uNCQ++6SHFcQDZ6o/zzqPS724Ia+x6F6PNK1cq8socjV/T9zTxFqzjI56UBIj5aInwS2
         MsiGXBi7FhIApDWuN5ajoadp5vG+lkOxtduprNLFVYzPB9DaJ9vWZYQOzs2WWgRo03ML
         N+4UGeQHmQ+2RbC+/G1uhXJHN8zFufwgwzMYrFdG9r+dqoUBizU/IhLyf0CWCLqu3yht
         NPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312150; x=1791916950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lqvNoiYS5Y69wvqY92SOyBc105nfusymGn5er7L23A4=;
        b=Qdr56Yzl5oUKTYLtmBgk8nOAfaRUMRTulkADVxoVe32+FJZVHALZH63Go8J2Zul+bt
         4Z6QAwtJ1MgP1heFAE7l7eiEsWg88IuqGOoc2KXV9gNr0YRDPZAStmz85kh4dpgCpjXC
         ylMxZn+xx5jbdsY/+ITxSiK7Q8iOL5iiHwViONFFYiG5kmOf3CRJIXh9UM1GObP958yo
         Srg1v9WDZSCMx3aue+WMwlkWvW9fdVAkr6VFor/Nud8lU0Auc07STaSnGRcJtulF4/cI
         8miX0ZiWrhzxu54f2/LGbl86UPyUuyE5LPteTFjNU5L6j6TMGfRCyxCGVEpZkLaII0jv
         pM1w==
X-Forwarded-Encrypted: i=1; AKwUvByEK/JWm3lpdvjBIkktfGlC5BTnHTiPhM+Qc7SHQ5R9K3ZFFaW0Uk031qsov8GIdAmgLnEO+vHRFuqbX1I=@vger.kernel.org
X-Gm-Message-State: AFuF++mLfM45SkrVFP6rIdif/rPiQpPaRBbGstQ6uUu4vYLANRW0QG93
	qimuxfYqiPc6zMlGdIXQpf3cGhLLJEcWYFhVvEsNpZizJd1mMyBgpwiZ5v+ecWo4zye3MrFPG2U
	ydsRYPYC6KH51dC+UMut8o1dRU0MTc4mretX/GPk=
X-Gm-Gg: AYBFou3ycIJaTBQxfBiusxylXRLULz3uN3YyNH6REm5qdeQvpcbyorRRv2LHSOvBb7X
	+LWGLumYEX7Av3rBl0QFP2Jifm1rJrOSNzrqzuH25C/Q9uwphpsUWX5nFT9YiDj30oXkMt/qwFr
	AUtzjWFtUBeuLmafkOICGnrGY5RblRi3/yFbzXddWD4nmoBS74h7ZYaHwZ1rLyuuOYeYUOZN3PI
	LpGlJ9RKchH0hGYK+u82Vn+P4eR3/rnBAfkbzuH899rKx4l9jDJwscciWFD41GzrXEjEX7lmCxv
	OEGFev7FJDoaPiZGvZ3uNby9Ejm7IMG0+N3D7BsnezWgcohQIL16oRc/M72mAnJ6eqQPX4bMrwo
	hPJDyJgYwfLGbubXHTQJVX1RVsh1lhchjWhrD
X-Received: by 2002:a05:7022:ea86:b0:149:8916:defc with SMTP id
 a92af1059eb24-15d6b02a69amr459793c88.0.1791312149393; Tue, 06 Oct 2026
 11:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com> <20260924173501.856380-15-dmatlack@google.com>
In-Reply-To: <20260924173501.856380-15-dmatlack@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 6 Oct 2026 11:42:17 -0700
X-Gm-Features: AclHuK8FvAbBzT1AuW5uRxJ-kZYYZwS_oOXm66BR8cKM-gGDFIVe-GGMjbHDU-s
Message-ID: <CAAdrzjsQ1v1LRCcikErDSy67=SNDiP5qvNTr8W=qjzXy_wUWag@mail.gmail.com>
Subject: Re: [PATCH 14/15] PCI: Save reserved capability registers in a single pass
To: David Matlack <dmatlack@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 10:35 AM David Matlack <dmatlack@google.com> wrote:
>
> The PCIe capability is the one place where this is not a pure refactor.

Please add L1SS on Downstream Ports to this sentence because it isn't a pure
refactor either: before this patch, only the child wrote a Downstream
Port's L1SS slots, in pci_save_aspm_l1ss_state(). Now pci_save_caps()
also writes them whenever the port itself is saved.

- Josh Hilke
