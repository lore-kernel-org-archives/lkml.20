Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606933;
	b=WGrg3SypcdD8z3AXV5VRoBIqpqrAETBwryTm/FJB02vCFVqx5S33kbDvOgFNhgELTloH
	 3QmV6rB8OSygo4t0la04xLFHpyscsCTTzbA441Gw+jV1Sfp4e6JDizZjNnUVnQqMG56tL
	 kxYHv/yWujgWJkH3xot5J8VoyEXj3y5aKaLrBBfxo78Yx0kU3ZBxeSlUh2nqx28foOi6d
	 XSwh5xFWtV2LlEfBXt6vN1F+mEGOj8s+0C4bwHV/tQnVI8u/A+83eTdVyifBT8jp9Lmcf
	 dCCbT7CthLGyf2ixvET/gHyNembIurRvEX678MNlqig/dopAQU2k0V3aHoGTYIi/oQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZP6s6OklCse3eR+K7bjref4ek+TXJ4xDNtPTRq25Yqs=;
	b=fVu7qbcLbb+Dt2dBAWoz1lCCVYLtVw20ZlBSXIdLV0x9l07VcjVsZPfgObWaumYbpOOS
	 w/Mdqgue23uSvXoIvMLFomXQ/Q6PkDqExWqmWTU0G5D0kUDSIoK/N4fc2520c9sExnWJN
	 Xh/Xf9vs/YRCMK2UZfw+OpLsNk16690kBBZJ3tjtMi/MukrH4ak/EIg62YQ2N57g3kKTz
	 sYE7duiRSrJE6O01SGD6xBs/f5F+ZD7XUG65xNvpuiZ0eN9trn8Phap+Ig7t2GK18ZCDC
	 +1kdrfZSDtJy/ZI0GD8fupbdjevhmryfqBKkhDVsb8fQ6phLB2ZHXAtTLRMxQNMk09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="dsrEps/x";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D2606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67D2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=dsrEps/x
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so2514775eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792606932; x=1793211732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZP6s6OklCse3eR+K7bjref4ek+TXJ4xDNtPTRq25Yqs=;
        b=dsrEps/xEOfJ1QY7b2uiCj8QW0fLNE5r3+4fr7RjSSDDI3p2gILfXV95rPBnx3jj9x
         78F34zMuGmMnFjiJWvsndgLXPczylkaTBzobr1QaL6gSwWcX5c89PDmw1jEy/MWtlh2i
         JgK2dZpji1lRhghPwxbBI9KL6NKTaI5AdNeGUpKUlBeecvVOHlxgVBl84UrXRCKh6J7S
         WziTj3l/5A9a1a/EyqUmKFLtp/ABfk5IbVM6FmdMHvEfncCuiLnxnjCIwiHyqLtAZEaB
         YyKIgxYvqG47ZG18ddL/EUI7IkFbnPwJDn7pf4CONtqKmwGe9+DC0jBQCIQ1f4WPz0yW
         zR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606932; x=1793211732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP6s6OklCse3eR+K7bjref4ek+TXJ4xDNtPTRq25Yqs=;
        b=gAm9UpRDlTuwALdrJwGSF093VaaFTVbg4s0/BDdujesYQbZNZdz86EMIZjqTlHOKeY
         ++66jUapeXCe6PMJJzvdNDQlvxcKMsu2z3HFa0+WZLa4VVceJXJVE6GxB3hc8gOgOZ0i
         O8zFESEOS4+IrxLYiFZI4Tt9mOLxotHvz2b5VRtXtHR95TepsxYptQG911h8MN4ktMSQ
         rpkXIdKmVR7V84fqMVeWpcRTYN0TvrDfY41XFsSUT0M05P7+sOvjm9mJuWHaYAjwCmQR
         lCCXFW+uhDcPhDcKM5AYSRBLsfK2Q2Ie46KMcmrOXHQR1uP3qHL9o+RvRiHcfpc0WyH3
         9HsQ==
X-Forwarded-Encrypted: i=1; AKwUvBynoRT7GBCVWdG2Vw//G2/KITCVcZGzpi3/8Wax0ZcBmGspceDz2D9Ql4A+C0FW4Q7tm/40W0XsioaSW0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCvfthqBWnCYuAh9A3inDmq9ezk8v/5c57Hq4W0WXZpYMd23hi
	mF4hKW+5H5ghh6yXx2Y8NpK7cISsuKeiTOEbX6QcmFVixm39KZs8ar8XBjJs9AEVZJk=
X-Gm-Gg: AYBFou3g3SU7SiDm3Bmle35j/4heAiWEra8h4oRLks/4m/5d90yrHSncWSOH3hEn//N
	nBisqQ1QPWMbziBYBaW+BasE2ylVqSCj4WK8SAYj7rkSrZT5rsit2a6g+o8MRRjwii/7xfGzcCf
	Yiy3QPFO7p1t/I6fVXqgMD5sSto/ACA2r3LYQmjBYt5Ir3ha0hhCeylaY6uqVNf9xYmeUr+blbc
	b/bQ3d981uGX1OmXzgNDTjx1ZZvs0EWElpNsOrGOWQBwEZP8B9VOzDYH0DM9LwMGiAu6htiq/y5
	OCjHiFdzVIZHpql44uaq1nItbA9FdU78uwXO6ZWRmfCNqUl0V6ApbFxugCHZANyh9UDYCmaf7cZ
	ZXt6uKFtTjDTp8adCq/AnqN2wQSJPGLOkZa4JSnuT6k3erM9H/dCFkC+DnIo1mVodWmn4v7z/ME
	grHQ7CD4xgRp43MAneaCRBejIZKsbE4ZURRarsdFS9JA3L426TEYrf99ERgjN64S0kq6aL+ZB4L
	p67Ne0sBiBWuGftp4Zqbx/hOqDPTyupQWyzec3FSzsWBlmP+EbYsCqFl4SsfnRTucdGCdJcs1hN
X-Received: by 2002:a05:7300:72d0:b0:353:5cf0:df09 with SMTP id 5a478bee46e88-3674c93add6mr5779594eec.8.1792606929814;
        Wed, 21 Oct 2026 11:22:09 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-367411b4145sm10549688eec.15.2026.10.21.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:22:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:22:08 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/18] nvme: Implement cross-controller reset recovery
Message-ID: <20261021182208.GW2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-9-mkhalfella@purestorage.com>
 <6e0b4de0-b030-47cc-84ce-3f021a5c75b0@flourine.local>
 <20261020235624.GQ2931-mkhalfella@purestorage.com>
 <5f52d97f-dd27-48b5-8502-1a3b5ccf4d92@flourine.local>
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
In-Reply-To: <5f52d97f-dd27-48b5-8502-1a3b5ccf4d92@flourine.local>

On Wed 2026-10-21 10:29:52 +0200, Daniel Wagner wrote:
> On Tue, Oct 20, 2026 at 04:56:24PM -0700, Mohamed Khalfella wrote:
> > > This part could be made a bit simpler and there is no need for the local
> > > completed variable:
> > > 
> > > [...]
> > >         if (!wait_for_completion_timeout(&ccr.complete, tmo))
> > >                 ret = -ETIMEDOUT;
> > > 
> > > out:
> > >         spin_lock_irqsave(&sctrl->lock, flags);
> > >         list_del(&ccr.list);
> > >         spin_unlock_irqrestore(&sctrl->lock, flags);
> > > 
> > >         if (ret || !completion_done(&ccr.complete))
> > >                 return ret;
> > >         if (ccr.ccrs == NVME_CCR_STATUS_SUCCESS)
> > >                 return 0;
> > >         return -EREMOTEIO;
> > > }
> > 
> > You are right, this is deleting "completed" local variable at the
> > expense of checking the ccr.complete again. I find the current code
> > easier to read and reason about. I prefer to keep it as it is.
> 
> The point is that with the local variable, the reader has to track back
> and work out where it is set. I had to do exactly that while reviewing.
> Putting !completion_done() in the condition makes it self-documenting
> and ties it directly to the wait_for_completion_timeout() above.

I think this is a subjective point. For me seeing completion_done()
after wait_for_completion_timeout() raises the question "Do we not
already know if CCR completed or not? Why are we checking again?"
