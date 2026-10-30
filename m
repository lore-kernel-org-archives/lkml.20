Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323676;
	b=euca9Ycbh3pLn/twaRcdaU83Ehg+nJu8KkyLlFpZngsT3qUjXakW4pr+m9+U2LFK912O
	 0Qjwyuhff3J1k3koOjlKxZUY+4/bkTsu0QoIhfhsAg5pjWGGIAJIL3+RhNWOUItXjPVgC
	 fNQztR5wBEt8iJrU5Lt8/VJUxUNiy0DhZLgxE1n6WGnePT9D3exYJKYuKTpWQGnQm0d7L
	 xKx+00Ij1n9ioHELao004VsQ1oYqoiQlSia6PQv8HiKObXqJhaJLlFwtD/naiX4EByqR+
	 4sDpMWzaewwemU9kJHZMVPlcEIf2CP4zz0FecPDoUhzUWvOxTEZUPvx3cMqMj1e8B5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323676;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FUuEMEp4Sq4+y9YNfcK1/A/G/PTtLzDOc0DPIC0ZA9Q=;
	b=cWlH8UQDvzENeutu1eWtHK/remOJXZcQJW2F9fTUJLleCl9mGCJr5DMU14HTTpp4l7+J
	 jT6tFG8DRC1CJi7FLhyX72yARhbvkEpsYLoexYP+UPD+6kOGpHdQWhR+ecxX6BGd9slaH
	 jsTLZhN6J7klouGjfC7GFEIdiR8eHL1kFOKz88WTd3URyAznPatOlsRuQX3/8Bj0KObbN
	 Npsp5x+FuLZyn9wbM0N1a79NazJTeFLy/oPppYx90MjwKrZdYYwVW4yH+MCCJKvKUQLeZ
	 Tne+Pvz1XypfF7/LX1Mf4WMk0E9XbkBO6WLDZaZS1f0MrxIpXe1uQY1Y5rpuPRxVmvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lafy3Bx/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C307C606A31A;
	Fri, 30 Oct 2026 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lafy3Bx/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111FD1F000C1;
	Fri, 30 Oct 2026 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323675;
	bh=FUuEMEp4Sq4+y9YNfcK1/A/G/PTtLzDOc0DPIC0ZA9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lafy3Bx/zY7kgVvrbo4ZtiaAI4XfHukxMcompVEw2fX6IOYTpGmmd3NKbK2POBab1
	 XjO7VLTzkiQOMJQWc/L0Qe9NwhGrBVjHUIAEl3Nwd2EquWVQ0FKcvUz0CqO7GRH0We
	 z6aNmIHHqWzTIl0WSBD1BeKmXKXV1umK0iiVPEA7Dzh5jvJn6Q4PVtwNCBYHMs3Tw/
	 y4PD/qlqZrRWcVtqDe1Nky7ZA6vsVEo2LFajwDrIetgPH3mGblMNIqKr2lDXop0bpE
	 aUq7PN1FDVsu3XQzp3QW0m+g9zV1vRyZiZSPlofbPV0kmY8ywmUQWrEGCJYLaGTkNX
	 R1qt3B05a2Oaw==
Date: Thu, 29 Oct 2026 18:27:53 -0700
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
Subject: Re: [PATCH 1/4] riscv: dts: thead: beaglev-ahead: Cleanup with
 dt-check-style
Message-ID: <auPymWTegG8Gj1bt@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-1-9a8810091d47@axis.com>
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
In-Reply-To: <20261002-fix-dts-th1520-v1-1-9a8810091d47@axis.com>

On Fri, Oct 02, 2026 at 03:43:33PM +0200, Kanak Shilledar wrote:
> A lot of warnings were thrown via krzk's updates to the dt-check-style
> tool. These were observed when running the tool in strict mode. Most
> of the issues were related to missing blank lines and out of order
> properties and nodes such as:
> 
> 	thead/th1520-beaglev-ahead.dts:43: [child-name-order] child node 'leds' out of name order
> 	thead/th1520-beaglev-ahead.dts:46: [property-order] property 'compatible' out of canonical order (should sort before 'pinctrl-0')
> 	thead/th1520-beaglev-ahead.dts:79: [child-name-order] child node 'hdmi-connector' out of name order
> 	thead/th1520-beaglev-ahead.dts:115: [required-blank-lines] "status" must be preceded by a blank line
> 	[...]
> 
> Fix these warnings to make the file more readable and maintainable
> along with that to make it more compliant with the devicetree
> specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 119 +++++++++++----------
>  1 file changed, 62 insertions(+), 57 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>
