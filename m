Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111987;
	b=S7hLp0n++rrpX+II/peeKVZmJ1bQLydlCL9GrBglB5Lm3W/GXjHSpR0o4IqZMYZ4q/xR
	 wYJzz8OkCrxyCVs7zm0mEw0Obc9l/xNZr4HgqRpOlz+gNqgYTGYwntTFlmo5CpkqzNBIW
	 TjpnsVYfrfma+uBdzXlKPvagAiWOFs3w/w6zmkyauhQDndAVlx14f9Eu/oewowEeawsv7
	 ZLL/9J9kbTaihvk5XZP464HN1WU7Pr3dc80dKpjaJMokyuEXR6OfJBWZtx1fch9/B1hjb
	 Xb+OzFMuRuYb8gaBTcf0LRJBMXIXOjxo+ax2o4BkR/vukTw7ODBRDLb+KwCflCyWd5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111987;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8VwTVjzVBE3sZdY/bqGZDMPlbD8bcC2MNX+1REQD2iM=;
	b=5nw0gn/oMe+0fLOvX2CnyTgYmTza661J7IjM4xo63ZJNjETQdfPzcjEZSw6Hu3iVsZkt
	 n6UQ3ETe0WG6PZ+tOiec7rBoO1Og+G4RZig/b6WtWV1NK00NljqHm0fNYDkPFKbfagi3g
	 cFqFNAYkOmDUtdqA45PLHEIlAWY8H7vcx6y9c54XwHFKeNDT1p0Fg0ArOpsTqKKF3gDlW
	 av//Xi6SDuuJhBSYVJnROffTAGCPjvRcD83eG74sqPQ91j0bgWNfzKtiALfQ4UHihMj7g
	 uMVFPmWUOP+PAYhLqvsVZfTLJvNdpdYZy8ELyp7LjsYUMjZxHBYM8j2sOjM+cPWvVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="j/fPd0cp";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893D606A31A;
	Sun,  8 Nov 2026 04:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B893D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=j/fPd0cp
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6707940E03E4;
	Sun,  8 Nov 2026 04:26:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iJlV_KB44njB; Sun,  8 Nov 2026 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794111980; bh=8VwTVjzVBE3sZdY/bqGZDMPlbD8bcC2MNX+1REQD2iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/fPd0cpOp75azdi04OqBwaDYMDz42+uOx7jGukqaYL6hEkmvaSknKfH/L/NnHVAS
	 zg2MSzp/1D7mtAUommgMgudvBaV93xQl2op+Z3GWaPmqH789VF6YoSYKO3IrjXU94W
	 XuykEaIKKW6CFpzhAL5ZI53K4XtAASiSRPG9xyQEx2rcNE5aVy3mUx/uNc/N+8Pzkr
	 malm2kWVu0RxSI6QZLFdViOkRSnInwWu3nS/VOV8htzR2gIuAkl0Wzvi73Nh22im5e
	 hrs7ipatT+6HaExvVM1AvnuuKwjC529EKZDESXbcGWuZxa6Wf0MsI498ibURbkQStA
	 yrTzb6OqY1IRGxLaynj87/34z9RHY8zCRiG9p9R9Nkf6+2De4VzGRdQZtuHQrvbDMT
	 MRlS00NaOpXBYNRY916hk2RpChIMJUzm3m3ZO9lBhg2fXBNHykXJBZmOCIA8yhzkdy
	 hzBd7K5TU6peqS7lfRctFM4u9yeRCnHKBad2wK9Vx5RuXZKcWXnfx+rs1wdcXZLc9c
	 IXBSG0WU0m6qbxknguYzFejbsfKcvtozANdRr0/7ntAdt0LMI7IzbLo73RC5iG3KWd
	 mQOtv8jZU+dkUhXfrgc1z5TrQUtygVXCtVfoIW9TIS2a0T84uUQV2kyxuXRj5N7/aw
	 zpz/lOvcIgb/ADvrBhNC9yOg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A28EB40E01E1;
	Sun,  8 Nov 2026 04:26:05 +0000 (UTC)
Date: Sat, 7 Nov 2026 20:26:02 -0800
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v5 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Message-ID: <20261108042602.GDau_52vqJcQSrUAf0@fat_crate.local>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
 <20261105045635.GBauwMg0oqd2tVPH-4@fat_crate.local>
 <TYZPR06MB7920FD1C150DCB201DB88367F2742@TYZPR06MB7920.apcprd06.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYZPR06MB7920FD1C150DCB201DB88367F2742@TYZPR06MB7920.apcprd06.prod.outlook.com>

On Sun, Nov 08, 2026 at 02:01:45AM +0000, Ryan Chen wrote:
...

> Patches 7/9 and 8/9 follow the same changes.

Ok, pls use

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=edac-drivers-aspeed

to put your changes ontop.

> Thanks your help.

Same here.

Thx!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
