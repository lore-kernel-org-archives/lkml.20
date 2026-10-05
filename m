Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B737204D;
	Mon,  5 Oct 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791188158; cv=none; b=dB+E6N5xD+pbZQF3ZWHd3RSLAEdkBvzIbBwi6OBsq26hKrcTgvCD4si7zeHzSu7NTPBpeKKP3ABZ/C9ra3z0jUG6BQ/TNkRd2qn4hccu+mL48TqFDqkpbbKCBTs2Lc6l1rt87A/50UYeDbJ6tPgI3jX7l1ogT996CwN/+si9I1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791188158; c=relaxed/simple;
	bh=IsQsPCIhnmHZwEcPPAGPCNDk6JjDUOyv5Zxt0Z1sEoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1rbTneGmjECTIyVefSJBAadQbtK9ikQfBxMlJLShitBxTGyu0RA5TlZ4+7F3hIDbgr5K67gn4bJ/ysr0uJJHs4KNVoIX/P6b96UuPYhVTKWaPEOuRJyZHeYBM1tUy9V/dHGVAU8a5MBqvNRw9xEsLcPwnHQEfoNYSpvEN18d9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0CtOLDl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0CtOLDl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245E91F000FF;
	Mon,  5 Oct 2026 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188157;
	bh=IsQsPCIhnmHZwEcPPAGPCNDk6JjDUOyv5Zxt0Z1sEoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F0CtOLDlP1gDTEj9U0b7HA29BDVJ8ZPoBRCGAqOvcF/f/kWKCTyNVUSJ/bj7eZyLW
	 xeplLCe1lbhKEyVOZ6nM7jljnPiu50P+QxhvzJe5AipyH8No1KgZUP2YIg39mvGpUA
	 N3O/tyUPrlsechgGBzLOKJ+FKtEjmZeMNzZUeS0GqMKQirAaGPmZYX2VdS7USWEBZb
	 jKnZ2g6xIl04mFpwJBE0abtLepeaYn9WK4aVwMzVf9menlnBc9mB71QjJWRgNoI1wk
	 QRkNoXkmbaF+ATcupY1PnJwneBJgHgPMFHJO2kaq/wq7sR3RyFvnRZd4yES9PXWo1W
	 OjmgKrKdL2lYw==
Received: from johan by theta with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xDdrP-000000000SI-308E;
	Mon, 05 Oct 2026 10:15:47 +0200
Date: Mon, 5 Oct 2026 10:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and
 updates
Message-ID: <asNcs43KeyEPfyK6@hovoldconsulting.com>
References: <aqKpM7QaTyKzmqSe@hovoldconsulting.com>
 <asM46PTPs_8C3q4v@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asM46PTPs_8C3q4v@moxa-ThinkCentre-M90t>

On Mon, Oct 05, 2026 at 01:43:04PM +0800, Crescent Hsieh wrote:

> Just a gentle follow-up on this series, which was posted nearly two
> months ago. I understand that it is still in your queue. Please let me
> know if there is anything I can do to help with the review.

Yeah, sorry about the delay. Will try to look at it shortly but
probably not before next week due to conferences.

Johan
