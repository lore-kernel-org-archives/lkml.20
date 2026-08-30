Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3F1F5821;
	Sun, 30 Aug 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788119951; cv=none; b=OoYZVk3yGxYjdfco955ITcip8o6mZePqpUpy6tMX3WwIAOzcnTJEWuEdkMaDosXtzyg4Jzh0ITekCitjA6Q+KKo+DNtK4zKYdsaYbHJNakiHkV37pD+maDea9ZCoRo47MZn+WoOupaX7uKWgA8Hn9L1w3l1NfZs4YlGvZlw/BCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788119951; c=relaxed/simple;
	bh=PygCYNHbPB7G7RQaY85P1aC+jsaSv+VfacPaFO0yfM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqnneJ0xo9XzXxXN5GOKLEUmrm7KFOzYqXogirCBkSkdGiJjhqz5QZf5KN/SrYCZ8h1VYSBKoJJYejulPnf3fD3wc+lzbhArOXIQ7mK44xdzTW5tDEM9lS0mYsV8YrZjpAAOho21+vywM0OXKQo2j01k+ovZQ/EbTH80Ov5p/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6w2Pwsc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6w2Pwsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8941F000E9;
	Sun, 30 Aug 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788119949;
	bh=S11SuWwDx7+Jzwa7DGIwxKCgvwlYSixM4/+w+taxdZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W6w2PwscrtYaORiBfn/xnDQE1No14BJp+0LwLUGYxyiQ1Ra5feRRv0rYuwvfs5sZi
	 I2gnc+CFUFWrMFuOYOT8WDGaZuhN3BOkbaBwDw44cKeqfxLvPY2W6yQZK6f56KbnZL
	 c4WsnBozV26nZSVCm3xrQWTBkFW+/pJ/EWqBQOir9U6soSOe95cm94On+GwKeWZxvN
	 19zpZn7STl/VcYPbzxNnTPwpOGGCusn1fPhxsAAMFkyNMvrs6xNWnE8BXQoY5iLK2u
	 iuvlq56nlTAJmfQnR2XHPzoB/rHg9G4RxUYkLRQZvFZRQLv5731HtKWPEOuAq6Hi44
	 nEs91Nq/uEYAg==
Date: Sun, 30 Aug 2026 14:59:09 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dtc: dt-check-style: Add test for node and property
 name styles
Message-ID: <20260830195909.GA151984-robh@kernel.org>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
 <20260829-dts-style-checker-sort-v1-4-6693a37d7ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829-dts-style-checker-sort-v1-4-6693a37d7ae1@oss.qualcomm.com>

On Sat, Aug 29, 2026 at 09:53:20PM +0200, Krzysztof Kozlowski wrote:
> Common style violation is usage of underscores in node or property
> names, so add rules for following recommended names.  There is plenty of
> legacy approach, so add the rules only for 'strict' mode of checking.

We already have this in dtc, do we need it here too?

Rob
