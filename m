Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323766;
	b=NErp/DwEYlU7qJml28GuKhciU2FlLUkzy7Ke5UKBK/Qh3QlqvnHydt9E+IaaCYM2kcPw
	 6hM5940g/RqKSMdartykcbXYL8BbhGO6BrYl8lxPCPJZM41FQ33C0UhliWr978xUGVybi
	 36Hj8UMDF3XfZzpxFgk0Il3lDV6lhqXVx93icuhIyGX9RY5hAQLREWd6owUENlQ8D9Csp
	 Oq9OmpOKtRB3hTtMfVR0JNfgPnMtw9z4XOefoLgmLd5cX2IqDUe7n0aMbkr0M0sh2D2C5
	 0o9SoRZ7VCE+aRxPFEZdjvppEelwIjWzJcYZH+BjXdrU/o0zzi6XyoNuYnsC35kKRpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323766;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4fJnUETMpqbsY8C/libV4lplZBPSHZVwnBnVZzL/9aw=;
	b=0NNXhYEmGaGpXK2Zru2QnBrd9oOFwhKHpS65f470bZL7q2ZgEHAu2ksD8uiEhA8VVLNp
	 bS0J/OnMfZobLds1AqUiceT2fK5X0rJtgXI+nmellQCBsTMUQYsXRRze9foHKkRHshstg
	 qibOCoDSlR2oyXZV2+fzPRnRWsmS1wzH+JLueAjAUmQLtQXVgPdfxiHLm+4oJM24Ywts1
	 4hTi2wptBRJYwhmrGyJiiHQadRYKCpVbDDJplMZ3Z1UfyyFw6R6FsXXlEge/8/X6n+i2+
	 PUYvf7mv8nYRBUo4DRD2rIrO1ZUDYEUL6QkEYXR6ic4P2wORV+AoW/O2fSzlk9CgnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP066uO9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DA0606A31A;
	Fri, 30 Oct 2026 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP066uO9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0981F000C1;
	Fri, 30 Oct 2026 01:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323765;
	bh=4fJnUETMpqbsY8C/libV4lplZBPSHZVwnBnVZzL/9aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TP066uO9J9qysREH3m7rGEB3uEH6nAC5R5SDdk7oZ3CZaEDX5rpD8ryZizXdXzbMD
	 Py1m8h9x+fDsf5f5Q8GWrmGb2f1vJS5TvGVEzw6kp0m0umLdvolut0gqy+/29gMR1A
	 KR6skYDlcspZcv7iShbuhE2DiTpDoLdMwersx+KVCE4j96akac4VggA1RkB8lHS8E0
	 PuI8yqMusM9kZZGLu28dpA0aplF1B+Muq3kkG5zg4eEWvduRF+GYe0mlFBJmQDWaws
	 ZuYN8jceb2TxY62ubgymGw7sAB963VuHBKEcEeNq/QXmwkO+va0lTYohqPmau0Da1D
	 kPc9Fg/KfrtKg==
Date: Thu, 29 Oct 2026 18:29:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: dts: thead: th1520: Cleanup with
 dt-check-style
Message-ID: <auPy9Hwg5nXDb9fR@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-2-9a8810091d47@axis.com>
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
In-Reply-To: <20261002-fix-dts-th1520-v1-2-9a8810091d47@axis.com>

On Fri, Oct 02, 2026 at 03:43:34PM +0200, Kanak Shilledar wrote:
> Fix warnings related to "property-order" and "required-blank-lines"
> reported from krzk's recent updates to dt-check-style tool. Leave
> out reordering of the nodes as it creates a very bit diff. After this

I will change this to "very big diff" when applying.

> patch only the following warnings remain which can be fixed in future
> work:
> 
> 	thead/th1520.dtsi:221: [child-name-order] child node 'oscillator' out of name order
> 	thead/th1520.dtsi:227: [child-name-order] child node '32k-oscillator' out of name order
> 	thead/th1520.dtsi:248: [property-name] property name "snps,wr_osr_lmt" is using discouraged style
> 	thead/th1520.dtsi:249: [property-name] property name "snps,rd_osr_lmt" is using discouraged style
> 	thead/th1520.dtsi:253: [child-name-order] child node 'aon' out of name order
> 
> Fix these warnings to make the file more readable and maintainable
> along with that to make it more compliant with the devicetree
> specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>
