Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB84749E1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348104; cv=none; b=YF1PSWaYwPI953L07H/FzSE3EcXOj6sq8q41TRe/dPsrwJRedq0V8X94Syow1nD9rY4V+Q5s7RwCF9zyZ7JLd6FXVkXpKayUZyWPJzdLtnHq3c3dlQdp+Tq7VI+OyH+YY1UnyuapPxCUjMaD27x0F9rrgfWc1SxxuoB93NpPsj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348104; c=relaxed/simple;
	bh=bRdCGbnizjuVKjmvNvddqWfhi7G4RTlCQSM9IHdwBag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frfCYt+8d9umr3ZmQVZwIy+pNULcB9mvb2CcrmMYAUull/N34ZNhVcQDybYbWwdWZ/W0zZdix40rUpadOQsvPdl55TAlzofLVQ452d/d18WijTztmpdNZaOceN7wa249Zqg6QrTE8kZtjJiWUuUl5HPEr9FB8cvbDNNBLSFeOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im61GmAQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im61GmAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405DE1F00A3D;
	Wed,  2 Sep 2026 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788348102;
	bh=4kI1wmnnF5oqLVnltLhXSkeA7u4mRHNTAGtGe797Stg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=im61GmAQDfjkB77Z6l8V6E/M63Nl/r8dAagURI0YvHTJuxnp+No0+5FpA6mpgboQo
	 z9SOmDDWmDqN25ALQzrkHHfa0M1dVefhRAWhCO/8/WKAFggsltPnP1eWKTDYk4Mh6h
	 vhsluydisMGF0IFL9g1JtAhUmXT4cqLkLw/5KkZma1RHwaL2kyFY2uhf+AZTD5z2oY
	 FDPfqBXOMtNKLlu53vf3oUEZT8GZSS4C5/ul9MEkVN+Nh12R/YFDoNaGRr7IB4oZAR
	 9F8uOKJqNRisxEajrSaifcNHtvnham6o1TM99dYUalj01H9EpOIy4OZMBWdNLQcoEz
	 8vtKTjyzioS2g==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.ams.internal (Postfix) with ESMTP id EBEFF198003A;
	Wed,  2 Sep 2026 07:21:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 02 Sep 2026 07:21:40 -0400
X-ME-Sender: <xms:wgaYaoENrzvK0fUpsyrKZr655ah6dYh_GQHcD7NMcfCvaTc2Tyvi_Q>
    <xme:wgaYasy33_-b6q48ptAZMBR_hxBay2GTljFmP0N5BLiXYP_0Jdyic6eoDUdGeKcza
    bxUCBbbmQRrrIRXOHmHNkP5yGY_ncqSVcK_KodLa1CNJGs8VVrm8CE3>
X-ME-Received: <xmr:wgaYag2wY5kfEXySGcj9-qoEpXYn7HryuBgZeoBAmhlRefnY01bsQ84CeXs>
X-ME-Proxy-Cause: dmFkZTFF6v4bnWNqxQRAVg85E4OXSGQ8j0xl3q78hLZbvYKQIRmURWLxI3iuzyFtS3E+b0
    c+Z5Vu8D8ED+p6PjTdmt54z5hc2e2zuLGfI+aRwspvwJWwfGvgTeeI027t/aHmDnWyEaaq
    un2uv8eirX7FJAyIrRLxGTmfNJdXRdqpAaQ3PgEIvYinCBG1ZXZy17LyKNa5/710N6A8Kq
    5cB1kwKO71TpQt8IUo63ADiTEdDbXBkhbocpc+tdaMrs8+LZ1EZpCjPkSLJWWqwMcVqyuV
    wQr/kGk6b2rPEbdTEzXnk2lCr0F2fmAY1Oit9esuvYAMav2JTR0uhhsHq7vjGMe4760PZY
    RA1mRhtUuOlfhvk0HKZVH691HecmGgLfEm1hqy9w8eTJ8CChJL4fYDtVrffIoOG7tpPpe1
    nbUZBRZI/WClzP4YVfq8lK7oyU++skK3E6Xah8teE/WkdnMjePaxO+Z1KSAWCuZutegq/9
    WAINMHrmscpIs/ws4NYA8pg1fyYFwRp3NgcYQkW0x90D9Hq42MB1p+s3hSuayJglAd3rOB
    P7vRCeiryIxf0zKoqQCGKkPPbJ+o736o5egecMvUqm+3tsdQwU62XTido3HwDsjOAG+0DA
    WOw9kSZOsxC4hSqaORCCuKbQokVRMvMCSZZYMTaJZ6bBSCVblwqis4ACVo4Q
X-ME-Proxy: <xmx:wgaYanPSO8qI1v2wkkMCFeqj8eLM6GGgw_U_vkdlnqJlb3QU1rSHmA>
    <xmx:wgaYaks52r7Q65Q59F3OlRJo2DRzcEiWZE-pqUqh5Lf0jfuFCsJIjg>
    <xmx:wgaYajJi5MCje3xJVOkwTrtqZBxSOgC9nWo0Zb7fmLoRud8I7p_ZUA>
    <xmx:wgaYajNsjTAeRzpB7bWblBIZdnBEXHLzs3EWnMVYc_xT5LEFGxOe3g>
    <xmx:wgaYanDZ3w2dDYKdZMosdwvDa_B1G-Sn90jGvVxp1nof7IsbsOd2Gkze>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 07:21:37 -0400 (EDT)
Date: Wed, 2 Sep 2026 12:21:36 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
	praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jamien@nvidia.com
Subject: Re: [PATCH v10 03/13] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for
 the event queue
Message-ID: <apgGoQYMoNSAXEP0@thinkstation>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <b6493aeece86f44195e8afb6fb8b3497cc237dc2.1788130528.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6493aeece86f44195e8afb6fb8b3497cc237dc2.1788130528.git.nicolinc@nvidia.com>

On Sun, Aug 30, 2026 at 04:18:04PM -0700, Nicolin Chen wrote:
> The driver programs and enables the event queue unconditionally, while the
> PRI queue has an ARM_SMMU_FEAT_PRI gating each of its touch points. Yet a
> kdump kernel wants to leave both of the queues alone, which would take an
> is_kdump_kernel() test at every one of those places.
> 
> Add an ARM_SMMU_FEAT_EVTQ that the probe always sets, as the event queue is
> architecturally mandatory, and gate the queue's allocation, its interrupt
> and its CR0 and IRQ_CTRL enables on it, so that a later change can turn the
> queue off in a single place.
> 
> No functional change intended.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
