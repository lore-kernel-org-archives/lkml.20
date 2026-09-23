Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43798522F19
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168436; cv=none; b=eC3EN8lyv9O9491BJ702kaSMuUSJcPporLiYTWG7n7UdiisybTQnzLPZPNzJTNi3/aJOnQb78/xf929RCd9wVuog1ibsIvYlKbYUXWaHHwGJ18ulssXZnGxnrEjAZODokXa0rWqA8aZNi8qSXrogAyHEDyb43hfeVE0QufahVw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168436; c=relaxed/simple;
	bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP0x2NYp7GAS1LpBHr4gTJFihMqk6k1LiGIq10AfA+wed238KiAX3kXLwdqe5v6cgWu+fenokyRCc9P7y4ZTx5rTFIeulrCm2VdCSHC07CrgMunsYhbWc6SveK+51TR8RNwEnobYGojwrz4g1pK42PM9ROkH+rdbQCvHIHdIsSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=K0rLcy+D; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="K0rLcy+D"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3381a6a05c9so342726eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168434; x=1790773234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=K0rLcy+DlzzEesXx+1vxOWulNr43O3q6RGFjO8P04UiZI6AlA/8TljTXjqxLrhn19Z
         BDpGfboZLhqfK1E1xzOmHlq8fyZE2xdGZiWQrViB+mFWE1RuP2tbxSp7aiWg3RilhYJX
         8AIlV/5xYx0eU5nZ0Gsng2MmAwJ7orLExwsAIQYXHju22RHmK981rAkEkVHs7wtJs4d6
         O1B0D4+imxEgt0/YUb9+GCPxV6QFXzHknYrurBSsu2Z0DQTgQM76rPYepCkbmgUVtj79
         bYhwrO2CcztKvlcgNNL9WqitImH5C6JD9/PItwJzihcIGK45CTw0ToqigYg6xP4A2bUW
         pZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168434; x=1790773234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=Wo0Rzcz20Zsd3GRpaRwk8rd9njk07c+PvmjMtaO/39DDuvdbbzQQQKLIEdx5NGXnCB
         iWj4TZAM8PytuBOZ5dAIuUyeN1QOHs4TCO/wFYxEttbIgJfIFHWa99ke3RJD+7Vb7mIe
         57QPBNST0sJ6Suj3ZGztZjpR8T5C5PCNIBfC9gEdMxpBHiaGAbKmauwzIYwIJ43r3cmJ
         DO7zb2VO4yv7WtQ+ZvGxPKvz/EmVJcA0RKuDr0bkrrBHSNWLdOZOuMJpw+s1XRnBRxMK
         cMLQGrC2yFxmkIaLhclR667dWPStBiuHWiJ7afOKpJMhdU/bFnFQTjzhbr0TxRUGB8VL
         RiUA==
X-Forwarded-Encrypted: i=1; AKwUvBy5aVjluSgB2O6obZDzMP4WW9VY2vw9nmoHbfWsFiTN3ibb+HsGuSkRCzcy0LA5NjSRfLszt2Gb9w/fHts=@vger.kernel.org
X-Gm-Message-State: AFuF++mR/0+kcbUiHNlvv9LSpx0pJvOOddQEkXpVUCorCM8D1beOn1A5
	ZiZYG1HsQSJPPWfZKp1GPFaYFH3NKgllH2Zuvp0Azhz5pxeAWmBO440sJCH8CX181RQ=
X-Gm-Gg: AYBFou14LoZIH3TJYftrzMI3l7sMC8B7C0lGmzZ96DoIqenLkn3puqi6wzQ6LTwkL6x
	V81Z46exAgKsQl/sw5fGi+gTvK4GLEKj3lcwaQIMlvv8Wf4p/WOaKXL/00MxUxtxva5HqMy/Bo/
	lOLZubhDa1AZWTQFBgGisyuTE3JLeZSb/5OJxbkTPDOoUbbF10MD3rbsBkeOtfmebtTxun2/VE5
	n4D+CJAWv5iaxj2JFCSRnqLbiZgxK1wAinbT7UQGcg+csPYUYGfHpDhLwSegKffP/jlbUKh36F6
	6LEC8a+VYAOYJ+VAmekI43luLriMd+6R9syL5LWn7yQKel4tlALRv19RrsGij/jXdK5p1KE4E2E
	Gez6+6T6AqOerBSw7/+U21yzBQ7rXyzGbVPmHIEUiXaXMKfFSjO80/KaNMriZYR2ENFb8pCCssi
	jMs1U/kXpI5KyhbTr90YPIB2m+GB/jGSMWOAAqGeXXmn4OYenCA/5tVww=
X-Received: by 2002:a05:7300:7949:b0:31e:b832:be with SMTP id 5a478bee46e88-33e8c24a34bmr2627336eec.10.1790168434062;
        Wed, 23 Sep 2026 06:00:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96358e2bsm6859478eec.16.2026.09.23.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:00:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9MaO-0000000DYPQ-01dr;
	Wed, 23 Sep 2026 10:00:32 -0300
Date: Wed, 23 Sep 2026 10:00:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130031.GE1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOfD6syXOgQhZYA@arm.com>

On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:

> On pKVM, we want set_memory_decrypted() to zero the buffer
> before the host can access it (I guess currently relying on __GFP_ZERO
> allocations). Since no cryptographic encryption takes place, there's not
> much point in memset'ing again after the operation as the content was
> already zeroed.

It sounds like this a pkvm unique thing, since RMM always makes the
memory hidden, pkvm flow should do it too. Either inside its guest
set_memory_decrypted() or inside the hypervisor like RMM.

Hypervisor doing it is the right place, hypervisor always needs to
ensure guest memory is cleansed whenever the guest gives it up. Either
via a private to shared, unmap or just exiting.

> I don't think cc_make_shared() has the right information on how to
> safely and efficiently do the zeroing. That's only known to the
> set_memory_* backend. So you'd have to propagate the flag down.

+1

Jason
