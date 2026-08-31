Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6852433BD9;
	Mon, 31 Aug 2026 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198502; cv=none; b=pDhA1FYl2i+17bAUO9PepsYbrRjUEkoHOv0gIVDTunezM+PE3fE0hWWpG0Q62MovWZ6OhQJm4ixX150dMa/pdSDbXK5T+Z588PmizPyZSmYgytgm2myJtK3RO95U4CQa9J9Xp4hJFIPtRq/5958wcB8sOpdlRkJC9ymPUPVy3YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198502; c=relaxed/simple;
	bh=tbYfjaL1NQ4fdIOMntQQZIfqJ6Gjx4knuk46SZeQU1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0AADaoo4znFoeLuCJyroKWd28RSSfcouHMSJoFjbqKhz9y2yWkeO/zE7C9NzqhQdLsQTvZcxYs24lIY5FfoYo5rLSnFZ8nbe3EhMY4xPyUI40r4JeqUkF+R5rUUnLeNO40IDtoGbY5d++dCLCY6w0n7h1Fvu+YVe+N0BPW7Law=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI4lnLlw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI4lnLlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E62C1F000E9;
	Mon, 31 Aug 2026 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198501;
	bh=biX+2hLF30/MCvJvLobvPJqDysvlg6zJ3nAUtE+LPDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mI4lnLlwQoYu2gyGscBflbVWISkvkINUat9Zthn1rev3wKNSHKS8Pg8UCg7Vd4UNP
	 643hrz5VVsVOW0i4l7Eto8hD35l+efT71k7+NoQ+/pb3q9kedH/0QIGop2AY9wtgWB
	 u0eJWSd5SwkLwB00tKHWoFdPcNpaDqRICtmjNhVddQRGJYYko+/xzRDEvIbG85yB2x
	 4RZiWO0lUotb1EsU9wPFA4DbFAgQu5Xm4vcGIM+MasjP0PffPqfG6egKnpjxKXGuGW
	 EikoUupusPy7D9+H1rZHKGwcmjgluuhO1N+lJPhIDg8ckEbgjWiE7yfYxrYauLA7bo
	 JxKZS8wltYq9g==
Date: Mon, 31 Aug 2026 12:48:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/1] media: dt-bindings: tc358743: Convert to YAML
Message-ID: <178819849954.849049.16512865284536369536.robh@kernel.org>
References: <20260827160312.4113159-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827160312.4113159-1-Frank.Li@oss.nxp.com>


On Thu, 27 Aug 2026 12:03:07 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert the Toshiba TC358743 HDMI-RX to MIPI CSI2-TX bridge device
> tree binding from txt to YAML format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/i2c/toshiba,tc358743.txt   | 48 ----------
>  .../bindings/media/i2c/toshiba,tc358743.yaml  | 93 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 94 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

