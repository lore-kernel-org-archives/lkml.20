Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A69B42EEC4;
	Fri, 11 Sep 2026 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112132; cv=none; b=Acy6rhxXkMNPi9iDyoVcy2HLhLVrbBd1U9DiwjRYYJBeY196C3f1OiC02qCnGbrSugOd2fiRj77ehh3NwgaD06zUTIn7HpXtjtuD/S2AIj7AnOJE5yK72wt7pNXVJrktsc4KjoMt/zjPcjwmvuaNcXk34LowRdlkuGeGO2m7vGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112132; c=relaxed/simple;
	bh=LDPgHezUKru+hc6p/pRy8Zkqyd38emwQE40GgamjxhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qw5m8hebVG/6rVWQf9llgYvhH8aU2mQBrbEoLkDhbcwh1GuTYDeGQjW/u+Vys04Pd4xBwTbJ59fH36vEmquLmhlregP/1oRf8gBKQh/9OKnErc17RzkxA/IzDcAFgRBvaEU2g3ieNC3YlIbfq7rq9+YMbajHBl9UHD8SJLQsq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7TFI1iw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7TFI1iw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51411F00893;
	Fri, 11 Sep 2026 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112129;
	bh=zP5HrblllLlWe8cVlmwhGXCR7u+PWvAQcN7HsIpbDeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7TFI1iwaqKe1xfhgKsZ78ZLjIGMnIuY4KZQH8UFiMDcf+boCQGGVMj0fqS00ekhE
	 NJpBd03h4dVcNxjcYGF+6BciehBnhlCJ/KhfLHorFcGcJzIjJqHdPV5cXmNGOtwfgg
	 7HWA4xrwrj5vwKiR8I8NTlBQccfLZJTTdzJJLMIF2mAHouDZxneW+5KdR6Quiwq0mK
	 Da9VGKZ9HINTGFCu8hIKQa+nyqif/NGlz2sRLYSG7G4Nmu+8NtZNh7Lenn3AGtsCsA
	 110nXGZiOeDw2rDmJ6KJK2Xs8l2w8YszSl4UGmUyLepKlqoJEQZOqobh8fTCXShAF9
	 C1h25cuDFdAkw==
Date: Fri, 11 Sep 2026 09:35:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: German <germanpapulindez@gmail.com>
Cc: lsa.uz@pm.me, andre.gilerson@gmail.com, conor+dt@kernel.org, 
	dan.scally@ideasonboard.com, devicetree@vger.kernel.org, hansg@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org, 
	sakari.ailus@linux.intel.com
Subject: Re: Test on another machine and userspace for [PATCH v3 0/3] media:
 Add support for the Sony IMX681
Message-ID: <20260911-affable-certain-terrier-cbc93e@quoll>
References: <20260910112210.44432-1-lsa.uz@pm.me>
 <20260910115332.7171-1-germanpapulindez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910115332.7171-1-germanpapulindez@gmail.com>

On Thu, Sep 10, 2026 at 01:53:32PM +0200, German wrote:
>  Thanks for clarifying the origin of the errors
>  I am more than happy to provide the tag
>  Tested-by: German <germanpapulindez@gmail.com>

Please use full name for known identities. In general we do not deal
with anonynymous folks.

Best regards,
Krzysztof

