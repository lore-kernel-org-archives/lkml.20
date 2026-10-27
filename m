Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136662;
	b=ErHBXJV9Bh+UgQBnsJAcKxfWq60I6gUPlzthYQoaelhItw/wcOXJor1Xy8+t2Xjwf3ZF
	 yh2GV83f0GgYLaa40oj4y55ZnwODdrJ+Z3ji3v63jkd/1FPuXtmajXEdu4ubuG/x+YcEz
	 pl1h2ENC+1hs4LR+5H/5Cg/cduTj2ihMgeg3Zd/O9lAWQeDnEJJlbJZU0KbPlt6cZTHV/
	 hQnOOQ58Idr0PTh9lJzd+b27tTROvBJJkRaf5j/jk6gabR2QYhnDK+aPHPJuzBNk4DrHN
	 SM0l49QV8+4EjBP5/MjqNcBvdXxe0+7/qP1q2kKOJYVrF59ij7Qg89m0DQDJyDU7JUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136662;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GoE0iVIoi+uRyPZc/06lle3SKlY2JN8H5v3aA9c3gcw=;
	b=NhdpYksgjIwudeoFi3THJN1D8ovugjuSK1WpimuvQ+xooYTHFU1jqYqnWHXKjpq3u2jF
	 916qWfQc5icsamsoXWKp3C54rv6e8v31ui8K1N3ZZjiXOD6/XgAD1KE3kdBgN0qTFUQEs
	 vqAiq6P3wlcgKmhJrdooZ2X8/LaCbd7fRLsKBPXt5HhLKgdmwKxvzzDivkATesoLq2GyY
	 OX6ORQ6gwsGnDe9Hb6sw1eKfj7pLwQgOwxwjldILEqm5sHPY5HDgaZ34+B5fKIatXjaqS
	 iFmjGei/JUUtcvcBBACJSgL6JzC6+pxWzS4sJXfowA1QltP+Ypt+fJuABhNjLdDcDVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqE7GTbX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F8606A31A;
	Tue, 27 Oct 2026 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqE7GTbX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6521F01828;
	Tue, 27 Oct 2026 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136662;
	bh=GoE0iVIoi+uRyPZc/06lle3SKlY2JN8H5v3aA9c3gcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MqE7GTbXTfq1LEe+yj/456Sc7hcIiIgzwXwcYeHpFmza9CbweMQvP5HhA4ao+zNo8
	 EupsUJhlWj026bItJRT+DAsl1pyghx5c3ZZyjsRlhXLrZpZO27cXKJF1Rl5H/0PKcp
	 vvbGvRPpGGKtiw/0grucIeWMpWH7+9OL21//3VoBssLLI2YqfD8kZYkYjm5wj79Xp+
	 j+e1LZD0E5c+/fzmrwO/hZ4wGSJF6N28Ka6Xk7jJccHlVtA5n54MbpeF+Q7tkaszZt
	 pLWKbKdYy9EOaQ+ErS9jMFhYm2anQyhuIxBX+D1PJErKYpDN5Mub+roqL3+enJJs40
	 R4JkrJItM0C2Q==
Date: Tue, 27 Oct 2026 16:30:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, stefandoesinger@gmail.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, arnd@arndb.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk@kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 02/24] dt-bindings: arm: Add ZTE ZX279128S platform
 descriptions
Message-ID: <179313665810.1186359.4184404774737293772.robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-3-ghahramani.navid@gmail.com>
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
In-Reply-To: <20261014072109.1759502-3-ghahramani.navid@gmail.com>


On Wed, 14 Oct 2026 08:20:42 +0100, Navid Ghahremani wrote:
> Describe the SoC board compatibility, SRAM used by the parked second CPU
> and the SMP enable method.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml  | 1 +
>  Documentation/devicetree/bindings/arm/zte.yaml   | 8 +++++++-
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

