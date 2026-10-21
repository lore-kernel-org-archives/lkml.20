Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553845;
	b=jVY9lT8cg+2KArHZEmTUQyOiOVEe7PHIRLMcygdUMU2I0eFjSW5Y2xSA9NxadvvfvdBx
	 xO/OKPuTined0GWrSSyHboiyla8tklYVu5EAhVnXHaV5PufRTIYMMC3djahj4pxuVl7I+
	 TkBEGVMLtNc4XvU6DCy5KHDF7RDl0ML1GEYcK9/2xxGEYFc+Z83Y3UcDVPYH1/hDVUfPi
	 3ZHgb1SDQd5RL9Q37vQ4lEIGZyWsrCgrA+YVZAzgQlLqkuuEdjybCZLcQW70H4T5eUQ1R
	 xycnYi5ma3s0IKHwsfHMfS6pWtR/1suYNjTyAHlLkhabeJvxc/tlRJ+yU/6Nsf8OTyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553845;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Qr31YWWG46E37l6UZYR2FUMOs+UNFYnsINuMkMnDBXM=;
	b=swI8LBMGKajUanHu/g73N3gTZQcCU0TN8Eh+zrqUl1MDws1GvTBrXwMWH9N0Fim4TSI5
	 IjFJwK24wXdHH/238wBY2t74LKd7gDbnki2s1RGdVxqNHLaqHZhPzGIToU0dBs8XrGz6B
	 X4o62AGWde5BYu0P7GkXB6H4mMBO5eju84KkcbALjXHM4+SH1OW+nWcizjlvxa3aWHttO
	 jXoea9vmYP9bdlAVjlJGSd9+BIac56wBCrX3bH7xGnqTFHpBDNL4cZlVHEj5VAt5+Xl+U
	 8TGZKSxhwWXFJlQqrQEjLeI3lJx307twelT0dRZfFTNaB4JJ8qcl9p5Xdu8UcZF8ZzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKwBcAxE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3C606A319;
	Wed, 21 Oct 2026 03:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKwBcAxE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FC81F000C9;
	Wed, 21 Oct 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553844;
	bh=Qr31YWWG46E37l6UZYR2FUMOs+UNFYnsINuMkMnDBXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CKwBcAxEK0FlqonH9i3F9j186IPNiPyiGjtvctSlnpB47FDU+qUUCvaPlO2QkLq7i
	 e8sCp9tLAegrSMoFbXXPdGxqv8m3dHAb/5evnWulq/mgO/vxha0CamzcM+tl5uAp9t
	 86dZb6M3f8yDSLlN0k31kl3KYh1C/vbwfCT1pLmpwai9YAL8EzC1G56fc0tP2wgLJu
	 9LjifsAi0zpl3yGv/qIJYthlX4g5eQaOg+llstcB2TgOwYSFTYmp5jcYWhBOaEWBTD
	 MyQO6D813GlBaBBKgPm7FfXcalks49GWmrsL7wRz7mMlEw5W0689Dc8dR4oliXPecx
	 cQwSJJoRzylog==
Date: Tue, 20 Oct 2026 22:37:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tero Kristo <kristo@kernel.org>, David Airlie <airlied@gmail.com>,
	LiangCheng Wang <zaq14760@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 03/14] dt-bindings: display: solomon,ssd16xx: Add
 Solomon SSD1677 controller
Message-ID: <179255384325.4089175.11513181876528998928.robh@kernel.org>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-4-devarsht@ti.com>
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
In-Reply-To: <20261019213726.4145532-4-devarsht@ti.com>


On Tue, 20 Oct 2026 03:07:15 +0530, Devarsh Thakkar wrote:
> Add solomon,ssd1677 as a compatible controller string.
> 
> The SSD1677 supports displays up to 960x680 pixels with 10-bit
> pixel-level X/Y RAM addressing. It shares the same command address
> space and GPIO interface as the SSD1683 but differs in addressing
> model, deep sleep behaviour, and initialisation sequence.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> Changes in v3:
> - Only add the solomon,ssd1677 branch, as the previous patch now already
>   uses oneOf for compatible
> ---
>  Documentation/devicetree/bindings/display/solomon,ssd1683.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

