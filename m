Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101477;
	b=SRC3HQY1KkYSUyl2N0tFoTjNeDn4Sk2BLlO0N/wSIoRBa4qzrhXtP40uShAy0k6AZ+W1
	 3PmrwGYeGQwejSMo5bjF+2V9D0ODlFHrOf88RLtuaXjNWcprhnrvHfr1LPfSSl06waD7W
	 1nnHiI0SmJ8Q1r3Y/LOA8EXIU4oxTka4yhVkXCqYWsOFuwrEgAml12qlM5n5l3TvV0dO2
	 aLEVDiIwL1Z3lSVuAwS6lwW1zkF3NuEXcmxh7ILhw2LOikJkd7tGw8FRe8pAsBwh4Mncj
	 eogoROYHEyRpOEmWoCZA7R00uDLxEFr+KJ9G3HVPAjWzlQFz1c4dF4dq0TI5HLbH0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101477;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bhgy9b9iaQksIHXVfJkvHqhyyRhJ2TXmbdJFqO41xng=;
	b=3Kdl7dprD2qe3Mmvx6ihbskVxsOn5Ympo55jw0pdYBgNqH+NvkHqt+i8iJY/Ah25nDmv
	 h8mvB/0Fbedw0ZDPVur89IASOSZsMU6lYiJd1G0YySMhkUv3NE6J+u8xNbRsFY6DqUee6
	 eBJP7CR/kn4o2W25bvs8eqN33u9ijmYFxff2z31lJln94tccSY8zvyn2nB7JAtFxSW0BG
	 poqg6K5uxu8m60AMw9McH+qgaZNLA/QPHogJOGzLJJsrZCXW1fsyVqSVp/oeHbELvSdMb
	 tRFQnstfyS9SuzK29bPikGvvVppk8DRd4Qb3zbt6rXftxgPOpbrE9FLxsmjaQscdEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XU/kFEJ3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F153606A33F;
	Tue, 27 Oct 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XU/kFEJ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A91F01825;
	Tue, 27 Oct 2026 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101476;
	bh=bhgy9b9iaQksIHXVfJkvHqhyyRhJ2TXmbdJFqO41xng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XU/kFEJ342txowxywqlXflWa5Vf6gup36NZpWayGn17JG/31EX/NDYf/7NXiqNrgN
	 Dh9Y32pX5BXzBnPCUPmIpcCXmegyEYqbUdOREYAo7Imrw9n+6el68m6P2mNypzmOIC
	 TD2H9uGUolMxozpAgz4zN9oHcCgRWiU0AKrd6je3Kku/jS3meR8WEpQ0QG89kae5uE
	 K4mS57M2uBNJ7YC5FRCS+ODpSWEFsdhqVsuSWdGLnvrYoieUbUesZdpBESSCZJ0b5r
	 JYAKR0licLqgyfRpavIayZcl6VYG5k95XxYUrhUiS+ZsEooDgejuW/a8xcG7G8SoEb
	 ED2fKpo/1uvuw==
Date: Tue, 27 Oct 2026 06:44:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
Message-ID: <179310147273.1064174.16346013384937637335.robh@kernel.org>
References: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
 <20261010-tcpm-sender-response-time-v2-1-67ea364a21d7@google.com>
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
In-Reply-To: <20261010-tcpm-sender-response-time-v2-1-67ea364a21d7@google.com>


On Sat, 10 Oct 2026 01:37:37 +0000, Amit Sunil Dhamne wrote:
> Add the sender-response-time-ms property to allow platforms to specify
> the tSenderResponse timer value, i.e. the max time a port waits for the
> port partner to respond to a message that requires a response.
> 
> As per the PD specifications, the tSenderResponse values are:
> 
> +--------+----------+----------+
> | Spec   | Min (ms) | Max (ms) |
> +--------+----------+----------+
> | PD 2.0 | 24       | 30       |
> | PD 3.2 | 27       | 33       |
> +--------+----------+----------+
> 
> Set the minimum value to 24 ms (the lowest minimum across the PD
> specifications). Both the default and maximum values are intentionally
> relaxed to 60 ms to maintain interoperability with slower port partners,
> while allowing platforms to configure stricter spec-compliant timeouts.
> 
> Also update the max33359 example to showcase the new property.
> 
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml         | 12 ++++++++++++
>  Documentation/devicetree/bindings/usb/maxim,max33359.yaml    |  1 +
>  2 files changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

