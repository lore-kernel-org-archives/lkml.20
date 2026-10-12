Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B073168E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821756; cv=none; b=DmTfcWwBDDfM6S/Dm4/lxVKlQCYGCK0tXjEk4emdgYDUSItW5sZv3keQoi261XQwWxmQF5imHHlSJEkAXbrhBlkP3Bo+fJ25RD2Z3o3m6WKadM8mPcWRdxQVAF+RGTbXMNChxKsQ8dOnpgnuczoJmyZ0Dwc37RWifNqWqC291AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821756; c=relaxed/simple;
	bh=dxbCfZ3sOqtn68hAgQkp+yBaY24Q9txhuqseGd2y10Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPNtJEAcA+DrOR81jIcPZHuGum3jV66P9+oZb5+Nv6+BmPE6FtFZqPpwZayzyjq8bfQPi8BkdrCTnrvayWfu3ajGjDfv43luMhwhEZ93gFQwZ9HPyLc24681XU0uvIup1c7U/hO4aak3v3FGlFJiZYBVkDbZ14JPzNvRM+tEFGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DImWzxjH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DImWzxjH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Vjjtqvujcxcccd87dH26SWhOSFafR80/69JFwDKONJc=; b=DImWzxjHrn9dLRlLsK+Ujd+q5h
	ujG4VmXWxBDEUzpEhduI6kEpcSacsEwqv/V2NtaExrP+UbtcsJIxNVJsgJL0UoFUkaMxlrFmJqT1N
	TfvabU71hZzQyr7ruPQrOyfFpHQANlt7+Ixfhny0VhEGGQVLCax+8HhGr64v/il8vA6wyth+6/Jeo
	A4FNVBdCpDCZSNv2bSl7QSDNwsUGM3m67z55ch+zuozsvXILjb0E0uHtmgJpPFzT8x0odej38HM6n
	pPq6Y0N4NwyR7ffCta7S/whe4geezrrscRLWhZUSr5m3JU3tmgPDvysS0uzgrcAjGPWKkzW287Zg0
	GLz5D3og==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] MAINTAINERS: update my email address
Date: Mon, 12 Oct 2026 18:15:40 +0200
Message-ID: <179182161341.3798543.15754027777678561940.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010134705.2131-1-andyshrk@163.com>
References: <20261010134705.2131-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Andy,

On Sat, 10 Oct 2026 21:46:48 +0800, Andy Yan wrote:
> Switch my contact address to andyshrk@163.com

Applied, thanks!

[1/1] MAINTAINERS: update my email address
      commit: 7afc36c92a2812de36ec2e15a6f281fca081beab


Wishing you all the best on your new adventures and hope to still
see you around :-) .

Thanks a lot for all the work and great input you provided to us.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
