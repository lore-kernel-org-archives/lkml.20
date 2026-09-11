Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F1047DD56
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131442; cv=none; b=Xs8oWON8+C4oYGIPVKFPtyTxj3ulBJLJ6vMf0W+bZ4fKKZNOxfVumCsohYFCPctj5ImWdyeJTh3Rf/oG7MIHcMIxnVKkUHhDh51RiCffzFPwQ2grXJ0t4sgtsqbvF3U1stQkCiOSdKeoMZg2YTLQ4/hFecoERTLGLudMlgdzT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131442; c=relaxed/simple;
	bh=e3H047kzZPUPF30kyCAWQHM10KFTgYtPCq5VJwN9Kug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmmgutjNK/IqKX7Fpe98fX0peaRtxXhLDPcOEKaUDwYJXKMO4hAOx/ZrigcWZpYnWsPxaKtvVCvBWJpz4gJf2TFY2amP5slRoPTKBU1fzJXpnW/Xx8fuBzwytSpnRK57UNDJ14b1ePk+epkmqK48ZNkB583mZ6sjrDjHqPnyDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qrv2kN5i; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qrv2kN5i"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6cso68795ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789131428; x=1789736228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sosg5uQD+znETrHmJcgaZWMkG/+x7W8shGk8HBCGWmk=;
        b=Qrv2kN5iQb/H4GJLXohxWSq/Y8IVw41su4WaVm/U5ZeYP6tQ8KmZUjelZ8z40vQEnK
         0+0NxNEINL2+kPrpmuOwE4RJCuqIM3XpsT47GtfNtHPpQFPtvo1dVwBTQrxX7RYbTt55
         jn/hLRJLxbtC6vafjhiZQQ3sdJSrgRo2yN6KW7MLygc6Dc/xQK++c+lB73wcxdmV3xae
         W8GDekai++p4jjeOL5aqWo2QHjIqvTpm01nyMQwSsY/FpM6UCH78lQUuh8UKTwHSrafI
         4mWDC7iPErfSp/CeNNlEwdmKKwI7jihTsmyuE1Xpo0c5H3VJlbr0zalTn/Xw0cBHiEpY
         tH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131428; x=1789736228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sosg5uQD+znETrHmJcgaZWMkG/+x7W8shGk8HBCGWmk=;
        b=ESItJQcfi0JXeEo7jbpJODVjhyc0vSIneHOCmPQ6ZDjpd1R68g4wtQakZZqMz0L0/H
         Kqr5QRORq3u0cTDmTL5O2okKRwatYTtCVf6ynRv9NhxrhY9DIIAolQ3bRfYDqZRXn56C
         7JNjDcink3PsWsh2aOkWe3kW6n2xkw7N1xdWbWEjjfvpivbEYTGy4IQBS9e3raULFc0G
         rWWmFrJhaXNMWvj527CH/PQIusL435tq53bA8hIFlHJBbYoKeBJ0F4NSkBe2qy6wh3JR
         RpJ1494t1IwMtcFmY3oFT1tTFJOf3STS2hka+GkDW0aG24NMOe+0w2lI8G/ahA38Hf0U
         leFw==
X-Forwarded-Encrypted: i=1; AKwUvBw0QkhhMa6ZaKsA63L9PRQZszWq9AnfCP4T/EvRkeh2prIDeAtH8phULhfeFZIELGfwzTnNXNNQ0X7RhsM=@vger.kernel.org
X-Gm-Message-State: AFuF++lKpuEaf0QkeEvgyx10KcpiOlhjBOkooSpkCLQ3YwAstRcHFhH2
	YA7cpV40dMIVk8qdMT01jlwzKDU5opEYWYDPd3Yh5EtXwUQ0ElBl7jlbWMieCSQMPg==
X-Gm-Gg: AYBFou0O/sscF3OXNb3eTFYFfgNgRKPaJzCvXk10AinIn1/89fKemoM4soBd9l7fauj
	/OzDyc4hTujmhRqn2XjXZ23+PAjXScoJa4XbL4+bJYiX1xo/FfLoHkEZUr2zGPskoKoEDkzCA2s
	GkzrP/NGSPjVZZ4lxMp2XkPI+WzA/kC1fQufNwQ+nCi8ZGb/jKHKGAtHejY5jXD3EvbF4JN90nc
	/xyiAELAnfvlSdLLkq4HY2GqKm8JxHTVnGNPBt9dBYOpLhJHMMnFwJhqMpwfrB9s2h7Pkz5cgJt
	kSlVdH8BJjITFNscvSuAVRTOBzSbaJdHAfbEDoQGnRSQ0PgVNRVdSbbmA888aJzy7LC62CwBn84
	tjrmhzrGwhIRCVq/0OmY4TpoGPOR5dvpc9hIRvH9Yu3qF0lMjvFYdLSoDFQlo+4gsj3rhwiTyjj
	+2p7EYUayzyhMIPv+ogBGEWHYAsgDr1zewgmmXlPwGiM76FIKkVDdTHW/a3uH5Jto6iIi3yVEOl
	x8kWWf5XX1MUriO1xwmDoNMt4zS0Lp5kSlK
X-Received: by 2002:a17:902:ce02:b0:2c9:bd54:cf with SMTP id d9443c01a7336-2dd2c93436amr7077235ad.4.1789131428042;
        Fri, 11 Sep 2026 05:57:08 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cf9a6sm4819382a91.10.2026.09.11.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:57:07 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:57:00 +0000
From: Pranjal Shrivastava <praan@google.com>
To: linux-nfs@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org, Shivaji Kant <shivajikant@google.com>
Subject: Re: [PATCH v6 0/5] nfs: modernize direct I/O path
Message-ID: <aqP6nM7OSX087UCs@google.com>
References: <20260814143255.861084-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814143255.861084-1-praan@google.com>

On Fri, Aug 14, 2026 at 02:32:50PM +0000, Pranjal Shrivastava wrote:
> Modernize the NFS Direct I/O path as a preparatory step to enable PCI
> Peer-to-Peer DMA (P2PDMA) support. Following feedback on the initial
> RFC [1], the modernization and architectural changes are split into
> different series. Additionally, based on the discussion in the v2 [2]
> of this series, the migration of NFS Direct I/O to folios would be
> handled in a separate follow-up series.
> 
> Currently, NFS O_DIRECT relies on the legacy iov_iter_get_pages_alloc2()
> API which does not support the pinning requirements for P2P memory.
> The implementation moves NFS to the modern iov_iter_extract_pages() API.
> 

Gentle ping on this series. 
(I realized that I sent it close to the merge window, Apologies).

Please let me know if anything else needs to be done for this..

[...]

> 
> [v6]
>  - Fixed double unpin bugs pointed out by Sashiko:
>    https://sashiko.dev/#/patchset/20260810195040.2877784-1-praan%40google.com
>  - Added R-bs from Christoph (due since v4)
> 
> [v5]
>  - https://lore.kernel.org/all/20260810195040.2877784-1-praan@google.com/
>  - Fixed an iov_iter_revert oops in nfs_direct_extract_pages().
>  - Fixed a refcount underflow in nfs_direct_release_pages() during
>    swap-over-NFS by ensuring we do not call put_page() on unpinned memory.
>  - Rebased on fs-next
> 

[...]

Thanks,
Praan
