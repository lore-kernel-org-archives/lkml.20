Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E43B3DCDA4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697563; cv=none; b=QMpllbsnDtAyXqYyVYKTgtQePvDSsT8ok7Gi5iJ2voqnUzT0gghJ/ODNIJrNrV0GE520mBJg9BvwWobzlSR7/nltbGWUhjvnmDZk7afgB/RGPX16AKFVbZFhQ3v4pKKaP1sj7ZzDQ+Ybk3hVX53mp64TYIwH1AI2nJ1tag/ejDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697563; c=relaxed/simple;
	bh=bwnWYK80nFfKr3iwUcfFe3FiEOIbobSQBQGXAMlfsws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3e35uke09yOpWxubCtyGZJtmr1Wn5ogXnvohmNuxKkZxD3TiUvPJlnvJtozFEshDWKhKPBI5uYihbNKc831wYZbEplsNzgT4uZ0cEloVZVWDg754BKj9slk5PNUijOapSQvtDCaJjFUPFYlBehdvZsU4H47HBRL0OCaRFA8MeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nYBYdIxr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nYBYdIxr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so20297075e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697560; x=1791302360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=nYBYdIxrDawbXfSaFe7w3OFYOIJlQrI7qz59yDzNoP/mpoddTQw11jDpz8fIdtFR8U
         Znr8Mf9igyXtWKyhX9oMfdAJDqgBGoGjvHJ6igkkprc58F97zd5CcoCsAlzLvRI3ylim
         m1hLqtLjxW1ZBq19GMmUHaYSFSOffW8bLP3K3qMkDov5FsMy3S3x/irgsjS1eOVIRxq+
         mTxoNRrvS3DP/l/GGQcl6eQRSamNLt1PpjT8Td4ULW0LxMOaLDCJ+NvWfW4h18DY5Ss0
         azhkGRaDxXPuY2FEehlaV3VB2aS/wbvlM5l1jOZ2enaChDZdM1x+J0h36wzrNkROlZrg
         6rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697560; x=1791302360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=OX/pYe674c5+OEE6/bIGYwY8WVU/ydJMV3RIPd7vPLH4y3aiaXcprK8EYsPIl1tD/w
         yG7NqBEyiQVWPDY/wIxVfbhhlBxGhNfmAPLOM1lkZFwiCJ59DTNp+oC601IwB3L8LeU+
         0oXU1JZX17MTNpt1nQipkLA1rin8fWCTs/c30A6Tf4gUUYrbVNqqpzileiYWUquxzfGz
         1aIEzUTvhFNegFhnHe1YZXfDQqaKLhwRTcF4gZsGqqApMI2VLq/XDiaW+1yJYMDfBCkz
         AG3Vim1L7y9CPWNnDjxBEJpcJ/cj9F6H5eyPe5OFsAJWGmlAdnxI9ldo3p0JHCcF991s
         BKzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoW6Xg3ILw4OJyG6LsrlRBQX+IFww+542s+y77Vg2M8oSE/U/N3BqW1n7JDFlJaVAW2a7BwQNWRrn27Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++nHnpGCLx41IdcV4FIo0AQCQUF6xvtwGhqkTKk2NbmUsEoCBYAl
	r1juhAgdZQQKkLkyneT/r1n3o7Iciz+KEKtVjlhA77B298G14QGHdNuX+t39AX9NZyA=
X-Gm-Gg: AYBFou3d18O7YHCFc4oMYNywOHKnOX6f44NifZbAIT/pcrBrnMSh95XSBEekgip1TRN
	BAW2KfMoZVdMzNpyARa710FBamiIOb425g7j8snxB5FZBIZ6F3itKPVntrmzTfM6uqllbpOmNrH
	yYOYcyqUAh7gj4CpaxOyZrG9YUqfgxj1MutXPJyawthp99K0GTBdYluGwk/2V39bfzZ6dXJ6Ep1
	2jXh26sim0XC3/BE1TOiac+5Axt1dvfq6+x5Y2jPamqpGqALRrf8y/MPSkg2A2S40AI7DSk2j7t
	sbx7c6MBW0jSYhKnuZJ2crbrGixL+1SR+ERL9uVjBdGka4KI9rkJHDORVsfl9KSAiLcZwjPDgZG
	QK8kRhKe4g4e9Q6IdwyaJ8O2v7gjwhK7INSx6iawT9O60sA2EbP/gSY+vO8h32rIN1J9zhjKXht
	XfSqcO9MWCA5yE6Dxx/zynbkL5LLHWI2/sQKX94TU5O2f4biMYUYBTtgvw4eNYVwvWbg==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr227620145e9.33.1790697559827;
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f295sm7062155e9.0.2026.09.29.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:59:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
Message-ID: <arvgNTUgcO0nPh-V@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> MMAP_MAP_KERNEL_PAGES is a mouthful, discard the MAP_ as that's implied by
> MMAP.
> 
> Also while we're here delete useless comments for mmap actions whose names
> clearly indicate what they are for.
> 
> Also update the userland VMA tests to reflect this change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
