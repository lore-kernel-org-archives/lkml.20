Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747814A3F32;
	Tue,  8 Sep 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858182; cv=none; b=UzuhtaapVcqeGJVcPZnhMtEHeUuMjK2iHM34+6SZZsgJ8kX7Ja0v/XpZKhpUqKSEZ00JIgMz1MvVaoklzwAOsnPrRzB7V6YGhyTNuIyJAbXds4aCgph6gndYVUGNGq3ZdKeWmlcNM8lHJB3m3Jan8QMik+IvmEnruA8igXI8o7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858182; c=relaxed/simple;
	bh=AKE5mjhCd9nUMpHpZEmNqG5u633GWBPeeGUbPmNW3tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OG4PG8XZDNJSlioWJnUHwVICQ0V32ZcpU8jHgL6rzgEc/+T/YHaVk3odo+9VDqh0y+8AwD5IBF6edjdrU62j8zpQDTPeVP/9jk345R4cuIPCoaI9D9wws9sMCi8HSj6R9jCfgPcDVNvK98m/AGYffgu+5tVwW+cn38PiCpQt7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntRi44KE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntRi44KE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695241F00A3D;
	Tue,  8 Sep 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858175;
	bh=8i9CZx/yhCJm7u81OJsPRkQjoNLxQbStufTXkZ3232Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ntRi44KE/RVjtpsKGcit5+h8f6Pjzpj3cK3JGgRMgGleWEKCK7DMOwzG8IMDGM3F0
	 GNiTXs+YWpPlZ4ZbxlbeR7e/ZlaL1KRBnn9BfdWg4LfBA5v82qVaoM4DgxtGFZHAZg
	 gauB6xshwYMiEAipNZEZvVtCLVw5yZT8sxpmqfUwD/ejSz/h74mnnckXbihhromvBf
	 +kwvwcJyhJMpGVmQZ6kIVOmbk6Q25MDoxZu4HFwSth2shQRAFYVa97dFDNJfDxKVZE
	 4kuHP+AAVgIlhUzhxSIydwXC0NhlE6xfoKD02+NDqqdcs3WtsW9hzBl5kQmn7MJacE
	 cUBCkKs0GnMHg==
Date: Tue, 8 Sep 2026 11:02:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD
 controller
Message-ID: <20260908-economic-sturgeon-of-authority-b6d3ef@quoll>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>

On Wed, Sep 02, 2026 at 12:59:37PM +0800, Shawn Guo wrote:
> The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
> controller. It runs the Type-C state machine and the Power Delivery
> policy engine on an integrated microcontroller, and exposes only a
> status and command interface over I2C, so it is not a TCPC.
> 
> Describe the two ports as addressed connector child nodes, so that a
> board which wires up only one of them can describe just that one.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

