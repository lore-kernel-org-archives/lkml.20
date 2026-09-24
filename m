Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4E37F8DC;
	Thu, 24 Sep 2026 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259393; cv=none; b=Fl7v9S2AoGFgtWk4lnBqKn2nnLtzUf6gfbnth1bgScWDGC/8NIY4GD4J7INPt6+vgMG7Y1PulCpT98mCHQ3pbgZrO46y3WZB+/txufg2cYvq6NyXRkam7sibyuGzso8BGJD474GKdPwMW7J0Ix4FxrwQ8CL1X/3QA/6vs0PeEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259393; c=relaxed/simple;
	bh=mZZ6qpu7H8MObiOXtAL8mvcjirC/qntGFwdz5Y346Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g8rq7nTUlRTHUgWvbbg4uTM2ujR62XDvUXu6yiyyPD9g7l/hFmHDErEBM0bqukkMROfZVhijoT6DgzfOCqDYIoLEAOu9YR7xSAFnS+tQF482dhMRvKkXFVsHvpJhObrVIQltAGcDdtmMQIMRqDTlsQqn5rHKeczOAacAWWA3Jhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuS25CDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuS25CDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C35B1F000FF;
	Thu, 24 Sep 2026 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259392;
	bh=4I2Uczjs36quEFEOlB6alCHCdbRcfKOEZRzz1zHWB8U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XuS25CDTKlPqvb/NishbYJphykh/SL0ITs7qOY2DBLB36kENOFqqSRMziMKCxNLMr
	 ciRIocUfSoZv2yf+xEeSmApwXDmB1ysp4CWnTjDCP+gbe492QkffxMKNsNr4ILFwVr
	 h1w+fXI3Ly6UGIEm4Et5rdBUDShZP50drB8xv+qiWN6ngvnDwtvYZ/7DhKbENcT4pj
	 Pg4bBS5hn33BJL4zRxDQqmoJAOG98iaCf/p9n4imrHffSTGXyxfMa2f75DiAhwWCiv
	 3MKeHJh4jBtkvANtoZ3fkPg5jWgIro7OfiMgz+ncGY3XxK6gI/rhTMl+R+DDUH1s0w
	 yrr9B1SWomKmA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Myeonghun Pak <mhun512@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260923021936.957065-1-mhun512@gmail.com>
References: <20260923021936.957065-1-mhun512@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: da9150: Balance IRQ wake on teardown
Message-Id: <179025939080.628281.10940598071478534866.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:16:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 22 Sep 2026 22:19:36 -0400, Myeonghun Pak wrote:
> DA9150 enables IRQ wake after registering its regmap IRQ chip, but does not
> disable it on a later probe failure or driver removal. This leaves the wake
> depth elevated after the handler is removed, and repeated bind attempts can
> accumulate the imbalance.
> 
> Remember whether enabling IRQ wake succeeded and balance only a successful
> call. Remove MFD children first so their nested IRQ users are gone, then
> disable wake before removing the regmap IRQ chip. Preserve the existing
> non-fatal behavior when IRQ wake cannot be enabled.
> 
> [...]

Applied, thanks!

[1/1] mfd: da9150: Balance IRQ wake on teardown
      commit: ef464f82f3aecad4071af71074b2ceb77ffbb609

--
Lee Jones [李琼斯]

