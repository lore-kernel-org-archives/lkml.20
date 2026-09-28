Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5215636D9E7;
	Mon, 28 Sep 2026 18:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618596; cv=none; b=mJW8SixfjEq1SOdgURtwckDVAg4eFhr1+WBGBhql6zpeKL3SZpTS6QY8p8cvXCBrJEG+LT4XchLRcMlav45xhAw3P9kV/Gr801Jxajk4pO+lHm3GNDsOqi6sq6cSDTWjyCxhWKOclpv1sYCMZmEdE2RUE/3uHEiXLShIztVUYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618596; c=relaxed/simple;
	bh=Iq17ZHSa0ber6uELTegqmqNPqZCMNtUa8u0uGUAm8R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clLV+Sc3y8nmrrq9ne45h2grMopiMQrYqveOFckwEDbGdmRZ9aaTNDHukqg+X4FTjCjtVtb9En7iAXcbX/NkMHnDs9uwl0v9ukgEH5vDKy1GS3yGtRqTJQQ1NpVE+ch+CnsEaYEH9KMe6LbyWoDizJOn9WeK+rEZqEkZl9pLSNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlCegE3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlCegE3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80D91F000FF;
	Mon, 28 Sep 2026 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790618594;
	bh=DO7o4JAF+6Q8Jr+W2hSDTGMsm586qLnk695cJOnqtK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TlCegE3WItry3JOr3+uA5bnqD05RkKoEYikp2K1svBBSDzXiIR5lB69OEH3zS4Geh
	 Nr/tdmF5b9gsXBqQev1qvEwzsQDub/A2k77VuZR2YAxyq9W4wdEcAqXyoV7YCKxEUm
	 Sa9UrnG/UZbc6wxRhgs1u7B7S3Y8kInCL8dLsMp5svLOrdryu0kjEP5zaCWAjnNqyg
	 58h+SPa+jOpVtabGFKGhsN5HN6Ii1fK7coXAYATn1U9yGDuVWTkrkz8qwaCtwwSRr2
	 /KR6M303zUYsjQk3l1XRr6YW5DoB7p0VmG2M0Ony4Eb8WrRo4Rfbxqzi9qFuZpEtZO
	 vwPxUx/xIRNow==
Date: Mon, 28 Sep 2026 13:03:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Heidelberg <david@ixit.cz>, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	phone-devel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD
 Technology Co., Ltd.
Message-ID: <179061859113.120376.10442541499029119870.robh@kernel.org>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
 <20260917-nt36672a-panels-v2-1-f8de8be5b86f@minlexx.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-nt36672a-panels-v2-1-f8de8be5b86f@minlexx.ru>


On Thu, 17 Sep 2026 19:43:03 +0300, Alexey Minnekhanov wrote:
> Add prefix for Shenzhen TXD Technology Co., Ltd., manufacturer of
> medium sized LCD and camera modules for mobile phones, tablets and
> automotive.
> 
> [1] https://en.txdkj.com/
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> ---
> v2: prefix changed from "txd" to "txdkj"
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

