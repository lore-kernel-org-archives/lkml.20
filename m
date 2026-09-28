Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C724EBAC2;
	Mon, 28 Sep 2026 19:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623311; cv=none; b=dlyFSckCBvfXs36rjuglX7Pknf90WhF0T+yL3ky2WrWWHH3Gplv7GrOrs5CVOkKVrsNcc12ie6x2i1KkH+OiK82DMEAXvrPhbr/CNsoBxLEd5grloWPEzwDNBV6DhgitI/jHcRLqwZi3ZjBxkCwM8u/+Oa8dY4jeWSAhnOcE3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623311; c=relaxed/simple;
	bh=gdJwN3ugomlG/vbHF3/xaYFzfTKI4g7CZ7mEE51Tb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSqLlLUJIl3ftqm3zCov8fqntFbLESDH65kUDlqMwTuPKRwclqDOPwUVP91y+R5fhBbw3NzjvgnC6XdqJ/UuvjJsvhaRMQGh96LzPwb6nLm4eLMPREGfw+1zWhT7w3jfnc3sBzweUlfZ4ZKR2W5wyYxE2bSu0cbnZIL7CufsK/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzSc4QQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzSc4QQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67EC1F00893;
	Mon, 28 Sep 2026 19:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623309;
	bh=fjcekGnd47FHnM0zUa8NPyES403NPCF91VpdoouTvIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SzSc4QQ01vDuexkd3iRDcdFWRL2VUrdA9Ybg8zvEuD6SoyW7WABl9ZmfoKlY7SpCo
	 zeYO5lfOvZnYiCIQOrMbMPwF5jFZvYeyGeOeTeRvLr8UwSw6Y4kg3rQDJ94Ybe+CNp
	 LJHQeda1hh/LFURCMMVwBupHu6bOfhpRdx9gRnfZH02lUI7J2nDyEJ9vawD/bo4wkb
	 z12KjWnPQjx+/hrwghqHPyePIqiq9MOsE+CM3m5LRXnHzfBQVhM8qfcsipVN6lB9lf
	 Vj7WN0YBotnT+0gXUrYhLJiHH4UzudqGUOb2jxMlgAoAZvbCcDqtkJs4r5MF/GVHUr
	 54clH6RI04XKA==
Date: Mon, 28 Sep 2026 14:21:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hermes Wu <Hermes.wu@ite.com.tw>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org, Hermes Wu <Hermes.Wu@ite.com.tw>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 01/21] media: dt-bindings: ite,it6625: document the
 default CSI-2 bus type
Message-ID: <179062317904.371923.11121287863996358643.robh@kernel.org>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-1-78d72d7886a5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-1-78d72d7886a5@ite.com.tw>


On Fri, 18 Sep 2026 16:57:16 +0800, Hermes Wu wrote:
> bus-type is optional under port@0 and port@1's endpoint for ite,it6625
> (the allOf/if/then clause only requires it for ite,it6626, which
> supports both C-PHY and D-PHY and needs disambiguation). With bus-type
> omitted, the actual runtime default is D-PHY:
> v4l2_fwnode_endpoint_parse_csi2_bus() falls back to
> V4L2_MBUS_CSI2_DPHY whenever data-lanes is present, which this binding
> already requires. Document that default explicitly instead of leaving
> it unstated.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

