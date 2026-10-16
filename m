Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848D157F72B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173790; cv=none; b=V28dVuuDLyjeEZ3lNU8AZVKugimwgz4EPLpO0VM8psuzkUHPkTAXmVqqSIjtacJ3cyJyRKBQzvOGGlFIV19vKp4cuMK3os2F4k7rsQtkw2i1mSbA59uu4hd9Mfbe1ocACipSNC4LJQI/W5s21+XNIU6uW8RTiB3tdiBBTWeCbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173790; c=relaxed/simple;
	bh=pTk9CQUhhcRb0FpSpb2UUz4euVW/T1p/m9rxv8ABrpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOOG+vBMaVsOJ2KkMBZPJkw8q+pFzmsp8KrW1b0MxaGMcoDCivhqFpYOJTzelWnQt6GfsKvaPUHqqet0S8foY6375YcTYIunsLAqDxGlY/ooNKyfyMRw6WTPl7BGvMUrlsAgwbGgD2Op0Kzcz2rdYGbjWkJpKN7NcXYyrkghSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GuzlP3Ds; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GuzlP3Ds"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53391022dc0so1729691cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792173787; x=1792778587; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCOssGC3fJ3o3ujxU/0UoaTklTa5OtsoPRrPROKWjDk=;
        b=GuzlP3Dszj8fOaIpiKJELviDnfMWGghiaf5nNIid9Tx3lOctWUerO4GbrDrzVC8qGb
         asvylD1UE3Z8G0m3YpLRABnlslpHigxLRzjJ4md574n7wZ5z+FWzmoJOiHH2TwFcAgCp
         BnMHNwWSLhFnlmdQ9DtRpRJ8h+UVr+MVi5xYUbXC9Fg+nQs6O/PBlluTNJKtuCbz4RcS
         dNORCqMYeNgfJqkg6fShbIs5cM7Km0DZJ4EN7GlBUBFdzM0pcXeaEuig0L93Dq+2BY4t
         C/aFjC23DhtlLqJNCLxuaPYU9ojIYOuFoRFMSRQrrYgTFq/FyRKjI5HmlFt06pi6J3pD
         WSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173787; x=1792778587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oCOssGC3fJ3o3ujxU/0UoaTklTa5OtsoPRrPROKWjDk=;
        b=IZCFCJ9oU/n+U8xjzrTwjE4UuVwemW+mn5ziEtAr+8Qi0VWcjE70WE/ZTl7B7xuT8l
         Sx3ce35bfe9r8BwcCvjC95BeoRqb2I/RZq7nOznJ60nhJ9n2RZCwnblMDmXOsRIcIqlh
         y0ll30Y7v4K89jp+BHs9/CPkSxCsesE2buwxkVcTbUC+Tvy4SYmJ1O6I1gmkLbwKeXXK
         FKty3Li94vaRFbvPO8X2iecAJXCjWUawYgquubIya7U6jaVZ19TYXwgxGcRGOEv8+jrN
         RSIzPl2qUWYynVVQyWyM2jlupneB133QBHgTtlchQ8QviGrxKnPkdicrNnTcbI1D43U/
         7wbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9nzw8xvnte13EKY+/6RfKtDfat0K8qRpOnZZinl6xY/CQiCeVYLYnNqHPzng3WUJSJ1FhisNs28MKNGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1TxSl4IZMgzmtqseGRowhA6DJ9WnpszGEGmjrM5XWOyeNpjIX
	ST7GRDdcfOkaA/k/tf8GhboMErl4vOj4F/9W94TIVZ/YvrizZDUryaxvf/8a60GCXjU=
X-Gm-Gg: AYBFou3fHMAButwqxlB3pJPjWc4iaByUv2RDom1YrmBFNI2GnpPevraMuPIzqEqWbqH
	cPD2r+cpptaFlM535x6OPDSuCybddhrJdYDQSpGOR+6bD+Gw3mh+gKe+IRvV4AJnYudil9wPUEc
	0Z+QvG2OyyF7i/Y+ol5euXK4cqVGTF4ta4safUgQyPGdFeHpVx6Q5TUqB/jnqhnL8vSqyH+HefW
	1UGuy0ksfls9w1SQe7HwqtXd8qvrp3JMcJCQncr4YmJ/nWAvdB+ejwQGCTZ/EXFjcENOfO5BuIf
	DuVtnXA40W6VeIZv/OCdC0Zs/F58suvhr3OZv3hMFd3U0pkYmEkR+EALCThEmTqs9w0vwCq2PM5
	OB82bNBu5cg5yeiQKSgEseQIsS5BJSqNnC6OokLQwjTPTxODfM/eXiUokYSWo3ChjCSdmln6cHz
	4S+vho3GuhXGWTIPPZVQ6s7PeEyEusgbonUqujxAbIhbe0Faq42XN6P7ba4YRcOA78PrJK+b+VQ
	SVFnjyl2H5Kq/ytQ6Db0bQvSveUXT0qA2M5pL7+BMUUeJnvJMoHlmCx
X-Received: by 2002:a05:620a:1a1d:b0:93f:1cd7:7341 with SMTP id af79cd13be357-93f29d388f8mr119685685a.35.1792173787295;
        Fri, 16 Oct 2026 11:03:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a19ce5asm271055585a.32.2026.10.16.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:03:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHmGk-00000002F39-2Fc1;
	Fri, 16 Oct 2026 15:03:02 -0300
Date: Fri, 16 Oct 2026 15:03:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	will@kernel.org, joro@8bytes.org, nicolinc@nvidia.com,
	smostafa@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dawei.li@linux.dev, praan@google.com
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
Message-ID: <20261016180302.GI14213@ziepe.ca>
References: <20261004195027.227748-1-danielmentz@google.com>
 <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
 <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>

On Mon, Oct 05, 2026 at 02:26:08PM -0700, Daniel Mentz wrote:
> On Mon, Oct 5, 2026 at 9:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > This still isn't answering the question of "why?" though. Yes the
> > architecture says some things, but if we were strict about avoiding
> > mismatched attributes then Linux couldn't ever support non-coherent DMA
> > at all! Similarly while the architecture does permit SMMU
> > implementations to be picky about their output attributes, does any such
> > implementation actually exist at all, let alone in a system capable of
> > running mainline Linux?
> 
> Fair point that existing implementations have been forgiving in
> practice. My thinking here is simply that a small, self-contained
> cleanup that brings the driver into line with the architecture spec is
> worthwhile on its own merits, even without a known implementation where
> this currently causes problems.

I think we should fix this. At least we have HW that respects these
attributes and they have a performance impact depending on how they
are set. Fortunately at least our HW does not have a functional
"mismatched attribute" issue.

If the FW has selected to run the SMMU in non-coherent mode then all
of the bits should be set to ask the SMMU to run non-coherent. Ditto
for coherent.

No sense in giving up performance due to mis set bits.

These IP integrations are complicated, the FW may be saying to use
non-coherent because some small slice of the system needs that. It
doesn't mean that every access on every bus the SMMU has is forced
non-coherent.

Jason
