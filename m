Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657063;
	b=tBh9pS6X+Dac5s0zvz277WN3rHMfkkt3SoQ3y49vauT2lT0OadGlU7CoiZqLsD5L6gqB
	 IRRQTOGLIOGomAok2yQCA2BESacNCBA3XHwVoatjuvfVOQKN0YNaj+ZSNItfaaDJdGd2u
	 nXGghj1zuYUI6lwhb8pwo3iprP9JhOCii8oPSU9LIkSAuYjSqeSGNZl8sB3dbG1072eyz
	 QP8LELqcNNZAgyHqM1ZJqBFPSksE9ttYcY17HEMqRBynG5gy7t2joQOCuauynuCLmOAVg
	 hicdYEGXJjdKZg3GKsIGg46l+WPCAacKqHRG7buRmRttx9txMvCBEPiP4Z3KcQbse3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657063;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=V5VztfzJrWDxjlD/VFABloyHPIk581E899r6l20/kAo=;
	b=rPEJ3ply6/UxU6lxMuLfWj+Uf9ZlHoGdk7coslAUva0sQBau70NcwfBiSv4S2bxN77Ud
	 jy7m9TZ5XHhPZd8xfadmDzqYD96BD2VxGEDoob8ls1EGeJ5E2i5/+IU8gQpaXUlrFY6QD
	 gj9VPPiELTDOkiD46f6Cq9GNl93RngJk4vJdzq9R2mFYazTwS86yLlpEMCKDKyyRcZ2Q9
	 OszOwCc9cQiZHv4rU4YkueIstjMzlwJiRnJ1lSUNUVZWcEiL24GKf+5bGU6y0NXB35yG4
	 1F6yqN5UMhVLSQo6AwAFFYfwtRHHpOR0xuf4drvAO/oQ2bX6gEqC4MEDYPmUkLc9xww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MWGKaBJE;
	arc=none smtp.remote-ip=185.70.43.25
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74C606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF74C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MWGKaBJE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793657060; x=1793916260;
	bh=V5VztfzJrWDxjlD/VFABloyHPIk581E899r6l20/kAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MWGKaBJEFvPmWGYUpZggxT7q03suZ12NVuuZPEsnl9Hh5kznqfQtzNzNhhdlHsQ9l
	 iuFrGvp3GUh3ZndirXO5wbV/gmmK7IV6UigP0zEBNfKDL/OwXfRQYz0FO4A5dd/MMK
	 8F/2fl7GbPCLYBelKYwynE8mjSwa6RDT0uTsndZ+VJMBV5qlM21EzwettyloWMgcBn
	 YNQ7iw47Zpt5K7czYqvKKDGpF1VOy+NxSohG8zOXa8YKmh8XmnIHGeDRpjF1bKUB52
	 Refd6pTPoeLnKB3SKQxwHpsFpTXNhBDHTqWEp7U34VInJeL5Lh9Sy09ZrUYlGNz13b
	 vYPF6YSWCHjnQ==
Date: Mon, 02 Nov 2026 22:04:15 +0000
To: armandas.kvietkus@proton.me
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Input: Add Awinic AW8697 haptics driver
Message-ID: <7UzsL30ZdbikdQ_AC2lKWodTDlSLbGkXX54JDLjJzrOYSH3B5uKQ225Tr0K_UoGAupzycVlvsV8SEbcgNe8JOX22SBwfU5qyzhAGrd0Qofk=@proton.me>
In-Reply-To: <20261013-mainlining-v3-0-fca981f62b57@proton.me>
References: <20261013-mainlining-v3-0-fca981f62b57@proton.me>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 9fd370d796cd0d90404080b3dff9fc6d0aa2330f
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

Hi Dmitry,

Gentle ping on this series now that v7.4-rc1 is out.

The binding has Krzysztof's ack. v3 has the two fixes Uwe asked for
on v2. Is there anything else you want changed in the driver?

Thanks,
Armandas

