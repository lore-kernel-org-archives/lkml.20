Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9224A8A38
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363208; cv=none; b=AH+Ct/LrUvzpOu1Zbvox3q5BzoW1IzPzH2DAw5fZ39QeomMPB0fUtF2VxD9yxiAzy+stp6bq+1tGgniaRUtZpkMHPFwgLmK1U92ZlbRujzDBy6bHZXKvvjmoLfXQ64oht4V+HFi3ICjBIZ9AMqd/9Na2teEhPl61NhXTQOUoWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363208; c=relaxed/simple;
	bh=POGflxzuUbdZBCL00aiKn/u8pD6Al5cKqH8z26/BulA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XWJzhEiDc9FIRCLOftQZX4+71Zu11SdeQGd3gu9vWtgAf7OkZu3lgB++QB6LgZwz5Z9nrlqOXl4HdlZoqBm5o94qFf5nvBGsVup3VLDJgsnnHYg/WdWryAPiEzt9leX1JatIH/5+RX7HtCWMs+5g2joUBys9uxHi7aMot4PQ80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=LV5O/Sfj; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="LV5O/Sfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1788362822;
	bh=NYzal0nBk2uboYjmiBYrDKMFY0tm8Q8fJgnyyHBp/yM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LV5O/SfjkeSnLJi2I/TS8xRs5ZO3HeCsBvpQI5PIgMkZSZDo6rDg4RZ4ghC6jZI9V
	 r4jOrbeqtMopQYrkFuAanA6EcOY701tVeG7/43o4fjYRZ5p8A3s84cvu4J7/epx7JW
	 1APV7ANVL7cYt55oL6w5JUprExv25joqrgAOy6eM=
Received: from [IPv6:2408:824e:301:1821:c427:8c70:2426:3] (unknown [IPv6:2408:824e:301:1821:c427:8c70:2426:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5DBAE65BEA;
	Wed,  2 Sep 2026 11:26:58 -0400 (EDT)
Message-ID: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under
 arm64.nompam
From: Xi Ruoyao <xry111@xry111.site>
To: Ben Horgan <ben.horgan@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>, Marc Zyngier
 <maz@kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 02 Sep 2026 23:26:55 +0800
In-Reply-To: <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com>
References: 
	<CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
	 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
	 <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
	 <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
> > not, could the caveat go the other way round: arm64.nompam is for
> > systems where firmware ignores MPAM, and should only be set on a
> > machine that does not boot without it?
>=20
> Yes, seems fine.

Sorry for the late reply.  This is indeed the original purpose for
arm64.nompam, a dirty hack when we have no other ways to make the system
boot.  If you think it causes an inconsistent state I'd not complain
against adding a loud warning or something.

--=20
Xi Ruoyao <xry111@xry111.site>
