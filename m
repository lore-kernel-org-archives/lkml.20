Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720159;
	b=ers0q5Ib1giRs8qhLxV1HNxinbXhsJ4Rgz06TdxDOVfmzUjIlcSsZZJUoBFhVDpX/l+8
	 P2i4uXGqfwiVrhrftt5TRJMJtVgaxJ27Nys7K9dGQ+DUlQKRlNzYVGT2nxx9LUG58YSMY
	 SJIH3H6DKbkwnWg/fp6vh5flD7Kzw14JT6RW72erPruWLwRrWiPy6WIq0I2Y7/fhA1eT1
	 dFen9tb5kn1srHSqWdFVBufdYnCEYJ0tgI2N/5MxmFeW8FxbN/YqRowAH73yKLyVX9L7y
	 0MuKb0tZd8xpISEa3D1kGyeJ8iRS9XPergNfYl7u9y3JUyo/SnUL1i2kTqbb/vQDTDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720159;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yCIVDU95bsgdkbTt99AMpbnlnJFmTgXw72B81ZuUDoo=;
	b=e81UnFtTrXHRR8V4k0j18UgAR/4roNiKyfxpa+XP0BT6eVnGpPG8RChAGkrT/mQUAoH9
	 sFiM8vDCQVP32hx+2WnN7VfvstmflCOnk1yKK8AONviVcWmYIvCFND2zFzFNBapEjjiFC
	 nvQtz8YQ05zBqrJHw73SfYI4xdXYELD7Kg0AC7Ijs9kNk+H8hRdpF/EmAcx2BDMPIE/4Y
	 Uag3v+N5Gti+qGunIBCm27oC6fe+IvznRIf8ZD2s054SPMoImLguA/5wl+AInSiaKV6bB
	 jEH+Gd0zj3U0QiWoVpZVzTj7rcBSLQthnETkzas7V4b/tOKZ345ZAOBNj0dlYgPgbKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kETAuEbn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D027606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kETAuEbn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8601F000C1;
	Tue,  3 Nov 2026 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720159;
	bh=yCIVDU95bsgdkbTt99AMpbnlnJFmTgXw72B81ZuUDoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kETAuEbnZ/BruujLHSuvhDmanYeoe0fWnDbfCPoQ594J1hK6YTs0gPBie3Cb8K3gS
	 91P0clCFW7kOsrgLQKJys1s7NkWR8w0PHhWTDnfsLbsqQ7FfzM6ncr/CD6UvepSmUU
	 uKyyUaLEBBI9If/2GxDIXZhK9A4/fHWp2yh6nGIcyi9ySPl28dg668s1HlmQzSX1ZF
	 72LkUFMCxLhsEFIfQLPBf3fSSUZazMlh7P5R7B+zgrDwHZiZuWVXXAJXQvw/bNBxdN
	 pu1W0EJS2tA4Lje2354jAQkJsEoEkpay4UoSVDf3SFnP2QvGcgBVL2CTTEjVAvjag4
	 Pef/LBN4J2yxg==
Date: Tue, 3 Nov 2026 08:35:57 -0700
From: Keith Busch <kbusch@kernel.org>
To: James Fantin-Hardesty <james.fantin-hardesty@seagate.com>
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: fix arbitration burst field mask
Message-ID: <aun_XQSOMjlbweKD@kbusch-mbp>
References: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>
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
In-Reply-To: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>

On Fri, Oct 30, 2026 at 01:18:53PM -0600, James Fantin-Hardesty wrote:
> The Arbitration Burst (AB) field of the Arbitration feature is
> CDW11 bits 2:0 (NVMe Base Specification 2.1, Feature 01h), but
> nvmet incorrectly masks it with 0x3. Use 0x7 for both set and get.

Thanks, applied to nvme-7.4.
