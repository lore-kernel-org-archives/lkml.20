Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB338F938;
	Wed,  7 Oct 2026 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389384; cv=none; b=MVQi8Rwa2bjFzIxWs/wT9B4qJBOQAAs+CX6WMybR7lyJ1FKBleSdjKc20mgFIHdp9wcKgXxFzsbkSNHlIUWoh3pUZP5CXj5eGAozQkLfiZD/uXDV+GwMBKxMJ8DkJAHbRgBlLbBCvgVPlWns4j1HpMWO+BPTngWlJ/cm8jv3NK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389384; c=relaxed/simple;
	bh=Q3tYMAdojfYSX4QuTrNrFur5+xwekYOtR+jCoAFDaCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgWu33ky174FQffvYQHLpwfnO/4lpWserMwiGIZBuw6DFsMHDZeAB/LGeJefgPXWDSAhtFuhqURDYSnPuUmviKkKcJJ4u9UEE6Uy9Aw6ydpTtO0RY77kwSZ/dFzkhFwgo54MT66p6k2CVEugZZBpLmV6vW+DG4Fq0GOSxwjw0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+e/ynsb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+e/ynsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202F11F000FF;
	Wed,  7 Oct 2026 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791389383;
	bh=Ac/hlUUWup9BqKdyumpZNGhcUNu/jTUPnbnM69QQABs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+e/ynsbXy9VOXTj38ym2D7PwIHoOjW7pzc/a9Jk9nqPUqquyvKI3kFct9lRo28/r
	 a1E5zBMm3LuucfcyeZ8qSomAEtSTdIquFI0qVmZ9oGpvrVb9eEEWjAv/osrMWZgw+J
	 QFZeB/HimdSIcXWOPLZb0HPZAzhOBIGGYZsp9DOXSNKEraIJttZkGyi3JUsuidZ7yA
	 ssVypJGSQ7MPXBWgr+oQJzSkA5QWHm/4DwOimsCXon2GwltAqhQ240S1CZrMSkgpOO
	 gGmNArAjhOatzCyVNsRsZzlzfEUJDXZo9ks6goQ6kT1vmqMFbAQ85TylvQcAupdkoO
	 bX2PTCwk/p/nQ==
Date: Wed, 7 Oct 2026 18:09:36 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vincent Shih <vincent.sunplus@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: sunplus: fix two issues in update_disc_vol()
Message-ID: <wrbzofpr4ltircjafq6powmmohfykhschulxalzeab2sg3g7jv@op25l3du4qr5>
References: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>

On Fri, Aug 07, 2026 at 09:16:58PM +0800, Felix Gu wrote:

You should really add description to the cover letter describing what the series
does.

> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

For the patches,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
