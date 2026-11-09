Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266648;
	b=Oe+Xsnnb4j8HswPDRguVRC68IwbPJJHQArD5cD6C6M7Uz96GbWKOmASn7FhC5UweDA6C
	 8CX5mtB7+h0moj2Kk8Z8MUJcGdr0gDd55go72TU3/n9kpmtyWbGDwJ77SDXiAFJmywdUL
	 UB+904fkBqXJBL7ZRT76laOPuqBYvpE6k6xBAPd3z/81o+dLrFBCsUx8D5xHcl7nHg4E5
	 Mhk/1q5QzcL9INiElFAbWL0ddughc5PmOZPWTwoXlTp+c9p1XqnakrR47C0sZBQdeVurZ
	 YxuvNa5S4+f6BqTsdGSeTM0kO6hWksLg73fqHdFHGjJBQJSnU5j6sC6r60R743/oFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266648;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FlQwZADxkgsZ+6yG6zdUGVD7DrFOdd+t7+o2GEVr9BY=;
	b=A0LxDXK24IfFpzqeFiAgWp/YM18WCz52ve2X4sKub4AfrvqdvDDFrjJ/hCTYA/wmVA6E
	 KASGny1bBUEU/XeFqMLPwUK75fG7k9m/yUj10gKc4UlcIvSvQTgtvsOWjKmC8fmsLjIpt
	 91t16wx5KwQVa+QBJZu0lTmCxSxL0SLsJYqkiQrqZ/GaLJlSoUAD7g/QfgMejo7hurEB4
	 6XZK2/o7qIPoDUgwR2T673B3+0Mev/U53ADY/MYjN0v6WsVtzdTiVLS2PoJMlZzSq+8M4
	 QauwPUAb0VQWCkH6TOiDgjsh4F4rgaV/0LCBoDRS7JMqJTNTIjGLImRHZE1aWV/rgfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=rBi3Z3ty;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED523606A325;
	Mon,  9 Nov 2026 23:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED523606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=rBi3Z3ty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794266644; x=1794525844;
	bh=FlQwZADxkgsZ+6yG6zdUGVD7DrFOdd+t7+o2GEVr9BY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rBi3Z3tysxtpx0Uhs1bQ7RCzT418SATPMbuJbxG4YSQhaWaGPJh03scrYSDqzhuGi
	 ZKHEmCm1cdIAoeD1bEOrYv7pnnsM37YMnZv5g5Addpy6tAnMn8wTuxDKqD2o1KZq6i
	 19yI4GjhDKp9Hof4XxfvdmUjQkXRssWioTojdj0O1g2++wSOukc2O/tLwFSb3PPFK4
	 8YptSxqAme8oK7G32G7TieNo16q0oZ5W7U7f/yEsMlMRIqxa3DJGYE3s2tvcSE2s/M
	 UwRvT/H7+OJNuTeC/hZnT9e8r3CuuMoA3Jnh98RRiyu8z1IGvQ2s6Zgr7fSWj1Fu6j
	 2JULTv5XZII8A==
Date: Mon, 09 Nov 2026 23:24:02 +0000
To: netdev-bot+sashiko@kernel.org
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH] wifi: mac80211: use frame link_id when adjusting link_sta on reorder release
Message-ID: <k5KBkmEPGxYqGJKtnstMm9tHt80YetkJrEn6ohegQq2IIk5PsVKeViQEAJsphTAhDNYEZBEkT-O8S418SGV_HxZY-Ayi-FtE7Ny30jaQcXU=@proton.me>
In-Reply-To: <179426409490.994134.13077118770469155374@kernel.org>
References: <Sq80dyNRnQWE5H_yZYIwxaQiwgvIrIlET6kND66_K0UpnKQZruHroWDq6hlYKDM0y9e2vXW2UBlBmnjw3bCLKk1Acrp7F49_jk883tbCqxk=@proton.me> <179426409490.994134.13077118770469155374@kernel.org>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: f7db0cdcea3a214dc08966c7fb757b7efc1679e2
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

Thanks for the review. The remote-crash trigger stated in my original repor=
t has not been established, so that claim should not be relied on. The prop=
osed change selects the released frame's own link ID, which the review cons=
iders sensible, but that does not establish the claimed remote-crash scenar=
io.

Noah
