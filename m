Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49F8437858
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786496; cv=none; b=Q+tgc/NiZzA9dzbRSPT8skhqMQs4VNAFtnmaWsxslI0sKzcYTS/R0jGMVopQ7NOWLDjieWJOSnhod1yk823gVXfmi6jhUej3OdYDX3teQmuuDSkswq0thegJK8kTao/nlOdJcBohgboFtRXMYvgymx60lik/Xo/CZF3o/duLjPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786496; c=relaxed/simple;
	bh=aNlaJJliE3SM+WfAUu6wE2ZMUr6urGrHTlopOCg7cBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJkd2V7iSnbD35zEUT3dd1i5WZYXf4iu3kGLDNRA7JOVRUsdsTdb6QuO2QdWov8cWe7AMOFt/kElLqYyCEXbexNp72trkNhwsdPO3oFhfzYA8Yig0KuTHzzBUnwQd/OkI7lqLhU9vxuo2DzlSpe27ClhxNgHqDhORCj/KybDRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af085a0015db8e28914752a6.dip0.t-ipconnect.de [IPv6:2003:f6:af08:5a00:15db:8e28:9147:52a6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3DE67209FF5;
	Mon,  7 Sep 2026 15:08:04 +0200 (CEST)
Date: Mon, 7 Sep 2026 15:08:03 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Daasaradhi Mannava <daasaradhimannava@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, will@kernel.org, 
	robin.murphy@arm.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Drop the nonexistent vsi-iommu.h file entry
Message-ID: <ap63JGL5_CZB_T5v@8bytes.org>
References: <20260905154900.1272-1-daasaradhimannava@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905154900.1272-1-daasaradhimannava@gmail.com>

On Sat, Sep 05, 2026 at 03:49:00PM +0000, Daasaradhi Mannava wrote:
> Assisted-by: LLM
> Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>

Queued for -rc, thanks.
