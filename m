Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2C6486415;
	Fri,  9 Oct 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531112; cv=none; b=lByD/PsG1m0s2rMn4TELJ8ifgTtbQcNeP1MpchMlao4/2zQNd46v0OtKcUtpneZw6tK1qk+N16el9PWvSU+4Rk0teiSd/mU8jayCHTA8eiMuCJqNp75Fmukihz+pCSOLTChlyPf/lsU6EZ7+ASm2jI2DOImQZKT3QiLE5/RAeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531112; c=relaxed/simple;
	bh=2Jfv+8rzZVlB0hFevSDAFoTJvRycIsa+qMKfwU6p3Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaU5KImUdVfdfPnwZCsYgdw0aUERL73Qkvne1vW73m+qdbUBZxXXOuAgPzkIv6po5n3D8KO+jx4kQrDM7XsAS6lhHdK7zPuNhJmvrBaI8w1peDJR8CuDce6+pErk7sEFJbEFUjHwOxOuweTJNdaaBCY1RBm/W7Ujvf/jt/pvPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ivrp3+sI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ivrp3+sI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC421F000FF;
	Fri,  9 Oct 2026 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531111;
	bh=YHy5Qdd4cgHMlDZ5zJjisbdghCpc7FCrqgKqil513d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ivrp3+sIo3zCm6ZN7eQkO8mm1YBw8Xdu3KIGgqbgz3yXG2asUX6B5KSkW3Y8rrzN0
	 qJTkEkIPiZ1+GZaxvgck1uCXxVqFpGcpPeyo48NY7s64jzqvJSBtywf4o8ZDmSBjzR
	 ex+dm+K5CjCQpRd+cq1Sxjl1b8Q1I7ZmkfI41fPSEq0gsd50rHOmTuamh7KUv4rly9
	 kdAZNVPkt9yb8YTQ/tNKLhrwXJxKQoWccqFvLfxY6efGJ7QL3N9QvyP6iEJLvtQki5
	 nKT/81odtfSP6L5fZOrNVwk0JbDXXA6PArmaT9F14uXLmO9XtBnPWkiKaeWcNY/cwX
	 V1b7grk9a3M1w==
Date: Fri, 9 Oct 2026 09:31:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Yongxing Mou <yongxing.mou@oss.qualcomm.com>, 
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add
 Kaanapali
Message-ID: <20261009-subtle-tricky-locust-b09108@quoll>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>

On Mon, Oct 05, 2026 at 12:54:26PM +0530, Balaji Kalkonda wrote:
> Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
> fully compatible with earlier SM8650 variant.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Dropping, unanswered comments.

Best regards,
Krzysztof

