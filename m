Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323815;
	b=NRmGMgWS8IskqbEu+2P/DbL1WDslXm+pWjX0MZL3hYXKmeqg+hCFqZuBu9Trr9mp2An+
	 JJf0YUZ+rr93IRO5/mb4M3Lsk6ywqbVsgEUj78PBKzbgIzyxlfvpUEAmcHpllotpBAOHk
	 N+EpuQ6Hu7r+00jlbPR5HQP6SJUAD+P3ztC4sPo+l42n2A2PnGX79MUfWMDCZm44bHW3i
	 6mTYJpf4qKiwNTM1NGNUYJ/7SpVqk5jZilzIopDFoVKu8aA+8uCgTGAULha/vn8jUn5MR
	 EGNG2FKRIxQ3EGd4PtYuYEibJdYIbyWeEHu8+5/xD1SvxT0JSjMT1Aeniop2xAClgMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323815;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EAlyTbjKYN2lw0612XbkOL/VuxaOgj87HW/JEa06j9Q=;
	b=V3rd47vSWEwb0Cp+EKqhQWgtcI/p0eK6OJxxCVbL2ReD5H0npadrgNxs3/icPCNGb7lI
	 +AzsuMHQPSlXAPOQuVBu802KeIDJJtXrPiIL6h5EL8t6mROadSj1tiq0S9qV3CWvgqWTv
	 dEl88zZQCS/5jPGtw+jQ+yyhgIfHQ/EaHREBzy/sPIreiP//9qaulfEp/CZSe7TKF7OYS
	 dECTVKw5dYLdFRccPIB+sj/MoeKzNpi+piHBEYFvrdS4BK39kIkSVMb8D2E0Fjwg5nCXV
	 rrfc+QL1f/UKzY2KYMfvzdme9WR/VhHiIJMsure4WVSeBI12JEX4TnVEHqAJa89hgDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBeqOsCC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA16606A31D;
	Fri, 30 Oct 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBeqOsCC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA2A1F0093A;
	Fri, 30 Oct 2026 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323814;
	bh=EAlyTbjKYN2lw0612XbkOL/VuxaOgj87HW/JEa06j9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBeqOsCCAZ2dNxnclRIQidPIJfBlUVRfEjA/+v/gjvVRZQuuQJ6V8Ff1brZkl1Rdf
	 7BWy4kBb2TjCRnwKHad9uk7zNH2NbExcNN7imZOYrzagp3EHoimlWBvCi8ZRnbjh+m
	 C0Ii0ndWjm9yyVpL0L06uj1z+8kHXYhrzuBq3UpmiYe8kqE+2HwRB4sEDIQokI4VpA
	 5TPIU8ueZKhQVH4NwGx1Nw6pZ4JD5NjIj4iuad/N27+lkl8LEz6c8N7ehFZyenwmQ/
	 Gi6ODRrdA/MRXRWYx9vASGyxWje0N6DCVrwWEkg7Qa1p/rOHd2KOfL5UMqj8tItDUl
	 NEVjEQdPxxOJw==
Date: Thu, 29 Oct 2026 18:30:13 -0700
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
Subject: Re: [PATCH 3/4] riscv: dts: th1520-lichee-module-4a: Cleanup with
 dt-check-style
Message-ID: <auPzJUkIQMLT7MOU@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-3-9a8810091d47@axis.com>
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
In-Reply-To: <20261002-fix-dts-th1520-v1-3-9a8810091d47@axis.com>

On Fri, Oct 02, 2026 at 03:43:35PM +0200, Kanak Shilledar wrote:
> Fix warnings thrown by krzk's recent updates to the dt-check-style
> tool when run with strict mode. Fix the following warnings:
> 
> 	thead/th1520-lichee-module-4a.dtsi:62: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
> 	thead/th1520-lichee-module-4a.dtsi:66: [required-blank-lines] "status" must be preceded by a blank line
> 	thead/th1520-lichee-module-4a.dtsi:129: [child-name-order] child node 'rx-pins' out of name order
> 
> After this patch, there are no more warnings left. Fix these warnings
> to make the file more readable and maintainable along with that to
> make it more compliant with the devicetree specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 56 ++++++++++++----------
>  1 file changed, 30 insertions(+), 26 deletions(-)

The subject is missing the "thead:" prefix. I'll add that when applying.

Reviewed-by: Drew Fustini <fustini@kernel.org>
