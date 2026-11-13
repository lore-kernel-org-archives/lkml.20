Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557939;
	b=qozQbDoIhlTEYaGLRFnwV4uN6FwnFXcBu9F384J5VySaHR4fJwplOUyKSQ+dbGe28DBb
	 gjStKwjgec3E0qF5TDOYkGEzyRQI7KJfHonF74L4x/IPo/Dc0oQI7jGK0mIPEss8fdJdX
	 4ABuMFnp2Qy3OyBWs2JQLurchec9pljWuqa7AfqrY4Fmqrt2HvXoF1QVWTHRF35Ek4PXP
	 YvMSHdXmF7Hs2rq1AZf32wXGiWfPuKdRVT8HcFcFoJ8/owVnrKGgDpZs6BMsSiQwSFFPv
	 03Hi4Z/Exzl8A9w/bUU3gKx3ffLlKwf8VpUJfc38gpIub4YfQyCR8KkMgMudB5e9CUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557939;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g2eIv4vAGjTn2Gl7+UoxXVPr/zETiPzhOPyD0guJDVw=;
	b=YrUKTZ5484Q/cQ+cswJHCksJDlhy6iQoDmzefqLgI8OhdKEr/Ps8ss70JQSn1stByv+0
	 ohL1pXfmpq3GtICC+6agrclyNe6AfhcWX42psvFl6WV/MfodiSE2Zz0N5+CZ4iTTtAqBg
	 +yexrZlSVIK3eJ4FJ+G9eXlTGBqr79JX/uNK+9hB1cCJbG/kS8qa8XGUgc5EhMpgP5wMK
	 /QbITpcWWtoWqWRoaPUWvImL/xFQcNiPL1GlUifz3I+y4EAOqfSgWfa+MLhnMDiuYHJTJ
	 TroVx0wB/TGK+GZ5rJgvzVTrbKsqAVT0QNaUemCzWqh+K8hgd731jm+QJcwhYz4UHkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VA8juVpW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA66606A321;
	Fri, 13 Nov 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VA8juVpW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64501F000C4;
	Fri, 13 Nov 2026 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794557938;
	bh=g2eIv4vAGjTn2Gl7+UoxXVPr/zETiPzhOPyD0guJDVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VA8juVpWtFCP0vL5Qz7xRmHPRnW0ptZohSK9Va+yKKNH+0WCEQra5MJRebGWYlYvD
	 85Go/ctB6kRxY1dijXOgt6vAku268eCwTJ24M68vHSPAMsG+N60cDk9Sf2bjYoxlHn
	 UTX18mSsB/TPgMnSBhaiH7UWTbnUXZN24053UedCeAlJ5Phz7xhAMoBY9cQ32rJt+N
	 lK05HSfaBUS3Vyl7ipklyJnTECJpX3f+YRJmtWEHUsMJ6qaNZlKuzhYPpkFDIguXtn
	 hLaNjaGK8Vy50Q4rF3GRmSU6Bv86VAg1soGghCzKRtRdljlzod6TZTTAffT4eFVQ2A
	 64c8uxvzp0v9A==
Date: Fri, 13 Nov 2026 09:18:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com, 
	niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv3 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Message-ID: <20261113-laughing-crouching-hawk-5bccca@quoll>
References: <20261112215342.2476801-1-dinguyen@kernel.org>
 <20261112215342.2476801-2-dinguyen@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112215342.2476801-2-dinguyen@kernel.org>

On Thu, Nov 12, 2026 at 03:53:40PM -0600, Dinh Nguyen wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-agilex5-ecc-manager
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 7

Why is this flexible? Wasn't before and changelog explains nothing.

> +        interrupt-names:
> +          minItems: 1
> +          maxItems: 7

Best regards,
Krzysztof

