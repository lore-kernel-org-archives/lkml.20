Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666435650E7;
	Tue, 22 Sep 2026 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093164; cv=none; b=Iu2IfD/hozBN8uEj0gRmkC3DCPR3Md9JLl6xHied8ck+dmOYejEN8stZjA4dS7ahAzVQ/4sKufpP/sBz4SAiB285x8JhGGckjW1WJi1hqkONAwwISTLA5pxkkhS1Zp8kkf8y15Eg+ayDqB6qjMqtRlfhagcaOJ6M2W/b62yQj3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093164; c=relaxed/simple;
	bh=Xw9V//Z6n/T4585kugfibKFjOB9L9inq7uRLSjG0b6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3g++2KulMLxnv2tiznILkprOovfeTTQ9dekWpKxP4UhRlkkb9K/YaGyPCWR0rTz4+ZBKvSDk5vI2oknzH1jJaPejkD8wvizTNcbpkAI/kv9ZyLuD5gBvKpocrr31kpTbiRrKMrnFRiApOT0JcBRDwIbAo5wWmzwmctUscoSYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnXG0Zo2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnXG0Zo2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D261F000FF;
	Tue, 22 Sep 2026 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093163;
	bh=JgzbjDEBetEmPW4WJB9+7Tl5maoVhb0P8rs90oyuL+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OnXG0Zo2MnoX5zcrAup4TjC23T/TixRMSzjtJvJXuh3NJOkngrUfDFm84OdQsf/6P
	 VkpfF/Khwqi/RrzJzW+4pS4KLRLoqmB6p4TC0wXNdtsxaLmVGsfOIt5jWKV5NxoTJV
	 8hRtEiDjSEYOOmmQY73NlYZGMLdyFfruEGKgsqf5Q9/7vyt1hO4GWevuH0fhzVKzrH
	 qPauEQmwHWzchGsqfPhFWdWS7056CcKCmMaZIRt+FKHNup04qoHtcYp2Sp1qDwhXlM
	 6M7kg+i4y1WK1nF50Gk9SJI6xLjF2jURBYLzJasWwKSB/X7G6aE81fa60wYAfFg2vr
	 5lixRlIsur+Iw==
Date: Tue, 22 Sep 2026 11:06:02 -0500
From: Rob Herring <robh@kernel.org>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?iso-8859-1?Q?H=FCseyin?= BIYIK <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and
 thermal properties
Message-ID: <20260922160602.GA3529337-robh@kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-7-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922080114.44662-7-royalnet026@gmail.com>

On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
> The three NPU cores on the RK3588 are fed by a single clock and a single
> supply, and the firmware accepts a fixed set of rates for that clock.
> Describing those rates as an operating-points-v2 table is what lets a
> driver scale the NPU instead of leaving it at whatever rate the bootloader
> set, so allow the property on the core node.
> 
> Throttling the NPU from a thermal zone needs a core node to be usable as
> a cooling device, so allow #cooling-cells too.
> 
> The OPP table belongs on every core, with opp-shared: the cores have no
> clock of their own, and one shared table for one shared clock is the same
> shape a CPU cluster uses. #cooling-cells goes on one core only, the one a
> thermal zone's cooling map names, because the cores cannot be throttled
> independently. Naming one representative node for a shared frequency
> domain is the established shape, as in "Cpufreq cooling device on CPU0"
> in Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
> 
> The schema cannot enforce which core carries #cooling-cells, because all
> three cores share a compatible string and a node name pattern, so that
> stays a devicetree convention. That is the same situation as for CPU
> cooling, where cpus.yaml does not restrict #cooling-cells to cpu@0
> either.
> 
> The example gains #cooling-cells; the operating-points-v2 property is
> exercised by the RK3588 devicetree later in this series.
> 
> Assisted-by: LLM checkpatch dt_binding_check

Drop 'dt_binding_check'. That's expected/assumed.

> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
