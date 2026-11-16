Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829529;
	b=KRa2YsjnCJ0i+RZDe1ICUHj7sWUsNoQ0/XeepBKJiUc16iQ22dXArAJpgP7fM2U/D7bf
	 nRoJ2yScB2NAvRQ9ZA9vm+kYwhS46H9EBn3eDAZAjH8GUYciXIcDcXTv6XO3LSgzizsjV
	 3yyq6vSDUGMlDfVQ9AIAVBfjzwD8M/BB1NRRyNzADNwpIfiU9g5VSyuxZ8cDNasArNdqz
	 SMUx+rFVIIVPn6NdtYju4xrW78sfFobs2coD745fMSMRNFFj7mKiXVuY0fAAFu68lXvqK
	 JKB9oKwsJIC2wu1y/GGeFcf1oU7okhwD4KPp4vqPQOpkri0KPjcASI6pZSFw0lzEVIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829529;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8pJ21vYqp33KQ386Jw6sjQmQ0sS9YuCVLuMCupEqCwM=;
	b=4kI9qmzmLKMcmphtxtIZFwclhaWWQtEG/Rch85Fhxskw17gN3DupSgdj/X0CRzN7sZ4Q
	 Wfpyj8GRVZQHIqaSSy0U4/nQDZ2eVnKQl2dOlzirlT9Iwa+qOeVNMY6CwSE8ThFs59gyc
	 SmoS6ztZ67akXAJgEa0+ZGxk82W/LSezSSMmQGWL2KX4nfHu+YiVGOwiw2PpI0kchBUFX
	 uaot4eQ7n8RRx+0WXNIi3O/C+v/V2iskewBHRa4fXOpRdDFxr+A031KiDKt3/fh23awGF
	 sCFPdRBIppCoX4edHQV/m02IKymucdYaPFwtuBo96gfexsZt5qzaKU/1HFKnWmp34+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nburch.org;
	spf=pass smtp.mailfrom=nburch.org;
	dkim=pass header.d=nburch.org header.i=@nburch.org header.a=rsa-sha256 header.s=protonmail header.b=GWEHWLEp;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C55606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C55606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nburch.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nburch.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nburch.org header.i=@nburch.org header.a=rsa-sha256 header.s=protonmail header.b=GWEHWLEp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nburch.org;
	s=protonmail; t=1794829525; x=1795088725;
	bh=8pJ21vYqp33KQ386Jw6sjQmQ0sS9YuCVLuMCupEqCwM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GWEHWLEpiBtUZm4Q9EoJAj2rYscnCkSpARBBaA0ee0wtee9uwcUlJs2jUzz+TIHcn
	 Q6ja2zUTiwPOAvqfUH9GXLZSx/1p4P0yNwvOJB5sM6IECfP9/l6O38cWp/sdtRIbEh
	 RtU/m5S4HhE/T9ZllOApdTNYNMSrBzQaKzYPwIa/0qqZXwUlFQJVlAdoQLGYAMLPes
	 Y+HMAhn/Zvz4U70iOrUI5PdQ7E2bkL1QrnixR0k1F7KJrLOJnEFcy/pf8npjAMtT6F
	 n6tphoyaACEtvV6FPtvVpoGBrWTYvTqKQDtK8iJA8Qi6a4H5yOXEILx0QRi4yoUnll
	 daLcMi6OQfkLA==
Date: Mon, 16 Nov 2026 11:45:17 +0000
To: noah@nburch.org
From: Noah Burchell <noah@nburch.org>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] x86/reboot: Remove dead code after machine_real_restart()
Message-ID: <20261116114411.3419-1-noah@nburch.org>
In-Reply-To: <20261102062417.56725-1-noah@nburch.org>
References: <20261102062417.56725-1-noah@nburch.org>
Feedback-ID: 224137974:user:proton
X-Pm-Message-ID: 8781c8bed7cd3e3d5e3c6d5dc2687daa44dd44c5
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
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 06:24:48AM +0000, Noah Burchell wrote:
> machine_real_restart() is __noreturn and ends in unreachable(), so the
> reboot_type assignment and the break after it in the BOOT_BIOS case can
> never execute.

Gentle ping.

Thanks,
Noah

