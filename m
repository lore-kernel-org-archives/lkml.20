Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286084A2A4D;
	Thu, 10 Sep 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047054; cv=none; b=YuzC14FTIf56KukQ2fnvOBofCxXYJvIXVAE8g5zR/5EkVrbL9xQVSH9BTM1E/iH6tWZrwlyYASxYeIiD2/MqPzUBC5/hHnY9Z2UpMMWofrYUR0QeGTU9q+U/pOqQ0A+OLX1RJQgvyS80JWURYrR9kU5Ei0Nan1ws4dCiXaXdopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047054; c=relaxed/simple;
	bh=XYqjkNqHd5uhn4ZcYqbzWs6iQA4AwNROe8bYb7aMBxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=efAsgt3E5IoMEKdUp1jxII/NumDyG2uuDNfRTLnZPvGz0PkBtypHjg9X81NDhfAKsQ0tQ9YL2ngOgDShfn89a7ChBrUzKUcEyGg6szPulpozr+H0yI341N4mMPLtUHZWOrUkGyozzrpI5JFhJnHa/LjtDXZiIzi0Tw8vLkWbLso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExU548di; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExU548di"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEAA1F000FF;
	Thu, 10 Sep 2026 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047052;
	bh=X6Gc2yk+0P2nIQEQfzGmLigu9fNwo4Afn3ET14vPseY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ExU548diQZ+3rqd6tHNRX1M73kZVKE1YNwAZcCNfk4vw84GZAkpgEGnp9yh8D1qw1
	 kVQz6tnE+btVYazQTFlzw2gUfz7/DqIDq7XwXkWcMNn7HqqyZq1pnNRLvvnTpkHB7G
	 Kqmio/oF+bKMaJQbAJZ5QyUAE9f4E07trmnCaTgHr3AO+4WtJLQI/VDwoZcmUua7pR
	 cHG+oKjCt7K5xewVOUvQwg/M1eLtDBV05gobnHQ8VFzCyhblUrsZ2ln8aBcQW173ua
	 qTlyUTolRWkwaGlRNGaIpYFU8YJKGgO9fN6woAlbT9XezSVDkg0ZISLiElDZE4tlo0
	 4PEJXwXZAxjIw==
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260815083145.2145984-1-egbostina@gmail.com>
References: <20260815083145.2145984-1-egbostina@gmail.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Convert TPS61050 to DT
 schema
Message-Id: <178904704990.1147160.17089050449890947184.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 15 Aug 2026 08:31:45 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TPS61050/TPS61052 boost converters bindings
> to DT schema.

Applied, thanks!

[1/1] dt-bindings: mfd: Convert TPS61050 to DT schema
      commit: 5138b125c07860567d5cac78e5f08e0c11b89eb2

--
Lee Jones [李琼斯]

