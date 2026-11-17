Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892882;
	b=JE8rf7Rlo2lqKhVwZZGfXGfwhFZmgfacylxBKWZMGOjbdcioAMCuwJWgFFF4+HiRLOlt
	 F0gawKgFL+LxC6WdtYRKwOpx8NzsVVS1PCHF6YVCS2pxm+Z37zVJVl6dRjzmutAZCx4Qp
	 YFBw8Ee/nmfP3y9bv50V/unh8j7l5YD2BtHbDiWx8Lw76LzvkAZUSO5i9T5+YyyDUAIPp
	 ZaxlDh3RyOmKYoYUFB9jEbS4wwSgAL7mB+MxWaUVjd2B0+wFuHpYSQajo1JTnB/pdd6XB
	 Ull1m30Nq4gOKDV6rDHY9IQDeFVPoiRi5wX3m8/DOGCbNTrhdp2bq2hvtf4+qJPh7jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892882;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=quGem6Fj9Tf2qpbAHbxVpLYypIRX0+rgeI8mDoA8ccI=;
	b=Nao1fLs5LD/Lm9riiuPqJfdBq88dgjbJond1PDZ7zGVRY51NZ6VPLMV5J3UUXKlNbfo2
	 9rgd8VGPIVMuMl3JBO8+rTMwOpsO5vM7WZveQVTZJIdz7HrubSb6KmnTrw3QMDwEX9jV5
	 lKhpGUhJHapLAaCgHGs8t9REfRZObVerX1zkDZ4O8OD+xXO5bxbnhpcSUJ2CKTPMZPPwq
	 Xvlq3xaHWSV1M2ajMlNKovHddUZ010JR7oULUSgLmBa0MAawoGFzzuncFrvt365DJJi4m
	 9RyLdtyyh/ji8SLk2ct1XZ8kN7S5ExmmQ/E2Cy/OrJpNPyW3oMM1ENwMEtdY2wL/XCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=f0LHkNmt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E997606A882;
	Tue, 17 Nov 2026 05:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=f0LHkNmt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C521F000CB;
	Tue, 17 Nov 2026 05:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794892882;
	bh=quGem6Fj9Tf2qpbAHbxVpLYypIRX0+rgeI8mDoA8ccI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f0LHkNmtBguwNmbiAfcAI4hXEHw0nVGVyUMeeEo0b2DqqeWNq+/llK+FJPymweb+R
	 nz2fQm+UsZk7u6dO8ONMl0SNITeNZr2lLCdDAwBOA6YQYZXgsbfCyG2jiyCgE3/u2F
	 CpkiKd0QfD7hxZLy7goxN/Z3XNgoxe90GgvA5OA8=
Date: Tue, 17 Nov 2026 06:21:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
Message-ID: <2026111740-florist-conflict-eb96@gregkh>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>

On Mon, Nov 16, 2026 at 04:06:52PM -0800, Elson Serrao wrote:
> Hi Greg,
> 
> When you get a chance, could you please pick up patches 1-7 for the USB tree if everything looks good on your end? 

We do not just pick parts of patch series, our tools don't like that :(

And why top-post?

thanks,

greg k-h
