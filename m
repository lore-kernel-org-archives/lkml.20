Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859076;
	b=JR836kwVXL0t7ieugxZB1bc61U3RWjsympCuj9lUUiNWF2/ePcr1NV8Llo9Wk28WtL5e
	 Mq+rs7DNiIhkiEmpRRLlFPaxRK+SWLA4FC2zXc5erjIe5TPwId7hWdTp4Ul0LItGK56vz
	 EMaX5EwRQTBtZj4KJK3nuMQmJRSKvazNY+w5JxbDviKBAK7bhuaW7xkAWbdc6SmbOFkCB
	 jex2ZC0zndjC+DvH5WXYFEEZ+HfWgwfKY/xs4ANgTE3k6OmRuX7MYA7umHQw22sEPgjQU
	 dp1s5GbmEyQ6S1l+weMN3h5RnOmrMWtz84XOmlRPg4oyi6K+57HL/2jCHFRweniroUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859076;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=deh36ndH2LWv8MWjoqfg4JqfEZB6aoJgD00vfPvqJWI=;
	b=OgGgM0e7gMW5J9Be+EwAbx8ZPt+AZE5xkK2ThT/WAVlFTh9Yph+Jx6A3uXo1Y4X2GEoZ
	 SBZ3pTGfsvrBYdFkitXk41ZNmQ7QDTA3kQ7lkn1aud/5W6EZb7ZJNgxFzv/5k13dbqF5+
	 HJNhVLTXEbr1IdRv1dwDIGcs4PNPLuU+cIjqXgFy8cxXbZYzt8QtA2+ZajFSb/xScBFmB
	 zEzP78PSy3XGTUKD6siHyCjRBbvX1Qmvevs98Ajj0A+MKrbvQucKRmXSs0FsW+ZMNhlLN
	 U4sj/8hCsLUpmWg9HeGu/sp9GPQLJVa6/15fTzM2mfjoHumUdGDlCUWRS+ZpOIoWqwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ls9U5wkA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD9606A329;
	Mon, 16 Nov 2026 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ls9U5wkA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1452E1F000C4;
	Mon, 16 Nov 2026 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794859076;
	bh=deh36ndH2LWv8MWjoqfg4JqfEZB6aoJgD00vfPvqJWI=;
	h=Date:From:To:Cc:Subject;
	b=ls9U5wkAqOjh75j88Yyq4dKrj0t1mXRGIcU3Zmtd9NmhCyGxKK9j1VBe6Tx7VGXPq
	 6hiG+GYD32edPpNF45DvkcK4XRIOkXzgnFpZ0dWiOGf2i9c0gkiwksguNnsJaucsaV
	 yg0h734vHtyFKMGDRou3tC+dj6FiD2JoGWfVV0+mY7RE4XvbyBc4zFqPklSeQCMokD
	 35PMjXzEvZq8KpAElUANTjlto8tWKvCfKRW9VXiQsxnJl0QbhPGAHws4dtpYLwp1g3
	 SIkW0kQ8Xq/15B6ohKm8h3vh/Dm0sDxiRyiD8jESq5jYhb9h0Dvne9uQL+lr2J/4Hg
	 tziz7hTf9/NuA==
Date: Mon, 16 Nov 2026 19:57:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Xu Rao <raoxu@uniontech.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the battery tree
Message-ID: <avtgQAXsxM_J0ScH@sirena.org.uk>
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

Hi all,

After merging the battery tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/power/supply/gpio-charger.c:26:35: error: variable 'gpio_charger_properties' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
   26 | static enum power_supply_property gpio_charger_properties[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Caused by commit

   fad4655224f60 (power: supply: gpio-charger: Keep properties per device)

I have used the tree from next-20261113 instead.
