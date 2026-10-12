Received: from a3i436.smtp2go.com (a3i436.smtp2go.com [203.31.37.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF8392822
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.31.37.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816820; cv=none; b=ZRfKMYlbtHhHvXLZcuNkJX7chvJK9dtpYxWiZ8faz2uchHP6uo3fTAUTfL18HL0WBCXGafAYyXu4/UQCCyg5AgIRNjMECvhZYuur+Yt93TZBWyR0sxGKZdZ0PhPi6adSgV5nh/8JKsyZrqruBYnt6fgT4rRfa3mUS0HumFRPyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816820; c=relaxed/simple;
	bh=FKU4UThzTxxjR26EL+IhLJ5in54K0kxZMsLQN7UToYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J7+aS6uuP3hgwP0UxpTqUUBa+X4ul/JYkHEe/JgPeHX0/NQLmZD9E7OnUEXHJpD+osAeHDusMVYnQ3Y5QmPCZTtThvOtQWUy9JjcJY1qpP6oeSWCzEeZxck94/hn5hQut3RGTXr1o7Pky3G5Y7lsIjkbcveSVlRVgcJiMU6hv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dilluti0n.com; spf=pass smtp.mailfrom=em840244.dilluti0n.com; dkim=pass (2048-bit key) header.d=dilluti0n.com header.i=@dilluti0n.com header.b=GRdx6zsf; arc=none smtp.client-ip=203.31.37.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dilluti0n.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em840244.dilluti0n.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dilluti0n.com header.i=@dilluti0n.com header.b="GRdx6zsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dilluti0n.com;
 i=@dilluti0n.com; q=dns/txt; s=s840244; t=1791816817; h=from : subject
 : to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=FKU4UThzTxxjR26EL+IhLJ5in54K0kxZMsLQN7UToYc=;
 b=GRdx6zsf5K2RX9FK1qZHfFBMpBkstk/RHTL24KuYlf+QhySkEZyBbzCJznqSOdj7BEp9X
 Y/ItZ48PadGwKI1LvO21OvwGoAUDoKb9dn5pAyFP0VFC8D9M4TqY9rZ/8CnNsT73QxMCiUp
 dRJsq1vwDfttzA6XSr5MUL5BGyfjaiMH7sjiNeD/wuOj9sYv5mW11XX3CegUfr/uYb/9NZz
 er5KEqV4wf84Em4tyVb4pjHxYiVSpnptkaXMv3fEnD7CWxSJJKZ3KoeNOAvDGFkI4FwJqgx
 v1PsVKNF/zhxpEwX2AS000/hUlGTnqzmhPeZPw8dkGlUDfPKIN7z9THIMAOw==
Received: from [10.40.244.132] (helo=dilluti0n.com)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <hskim@dilluti0n.com>)
	id 1xGHP4-AIkwcC8oQGV-X8Dv;
	Mon, 12 Oct 2026 14:53:27 +0000
Received: from localhost (<unknown> [10.42.0.2])
	by dilluti0n.com (OpenSMTPD) with ESMTP id 5f66ac95;
	Mon, 12 Oct 2026 14:53:12 +0000 (UTC)
From: Hee-Suk Kim <hskim@dilluti0n.com>
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, javen
 <javen_xu@realsil.com.cn>, nic_swsd@realtek.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] r8169: allow Giga Lite fallback on RTL8168EP
In-Reply-To: <aszgerrI8yoLTaX0@makrotopia.org>
References: <20261010135356.85454-1-hskim@dilluti0n.com>
 <dbdd5abd-f1b1-443c-adc3-6ecdc95f4854@gmail.com>
 <4435b286-1638-464a-821c-f486b647c9f7@lunn.ch>
 <aszgerrI8yoLTaX0@makrotopia.org>
Date: Mon, 12 Oct 2026 23:53:12 +0900
Message-ID: <874ierc6nb.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 840244m:840244atORciv:840244sMJrnW1qeB
X-smtpcorp-track: oKU8esuZ9qCC.DmJml2_s9AVm.STgQxA6PYpT

Daniel Golle <daniel@makrotopia.org> writes:

> On Mon, Oct 12, 2026 at 02:46:27PM +0200, Andrew Lunn wrote:
>> Please add ETHTOOL_LINK_MODE_500baseT2_Full. Make the PHY report this
>> link mode in it features, add the speed, allow it to be negotiated,
>> reported in ethtool etc.

Will do in v2.

> While at it also consider ETHTOOL_LINK_MODE_1000baseT2_Full which is
> supported as "2.5G Lite" by the RTL8221/RTL8226 2.5G PHY family.

Happy to add it as well, but I'd need to know what PHYSR reports for a
2.5G Lite link on those PHYs, as I can't test it myself. Do you happen
to know?

Thanks,
hsk

