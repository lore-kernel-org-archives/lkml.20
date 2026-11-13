Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530247;
	b=vHcmNEArE62VYAChwdfIYAWJapu+TzhGK317qNISnYntUh2kwsmmu6yBOHE/9KefhWKT
	 KKMuztPK5zlVi2/Z/w2mNnf5ppppU2MzgNCdlLIl5HKsgwZ0l5oBtdQ1iXwLwMSQ5Xrk8
	 ZooJcY9JoEo7ksx2px31FzvObqSbeUXxlVSDDx7yxks3VQrXrGCt35tP1qKDLw2D2VY2p
	 V78tYMas0H9epSs8Wm+/RPcm7mAVjEZuWp2TbGFe2VDju+kG+J0B15+mzKGnWBwDGh4Mg
	 LaHCK92vUCx5aZCE8W+QwARny2Z+bPXYS7vcFP/Qb/nEAiOdZ1P9AByQGznBmwoJCnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
	b=1CdWb/cOphqMUSiyAOKGnTCj5HKjKTvyn+XTHbk8kbZV6dFPDDKp5ST8PoSP+D2gUlTG
	 8KW7Oouy9Uik8lalH3v0hlmjq+FhxoSkFF0nXqjaWzswNp97H1R+U1QDqEabFlubbaVy4
	 7RVM6Fd9sxsJuTZbWvhYN3Fifw0ePELXY+5vpcI7nbuyO5YFDu1aDzhkiUAkR48KgvL2J
	 scXXwF02Bh06IFSESZ1WTUHkgiilIYRWh2sxTmr7/yYWzB8xgUC3TmubaenuFdG7qDJ02
	 wPlIiwITuGOtL/B2wDNh+BsyqJZTc6e7RPPv+NriFf4U05MN5FQRJYbboEEWgf0FGrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTEz5d3W;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9267606B566
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9267606B566
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTEz5d3W
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49412eb1474so151871f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530245; x=1795135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=hTEz5d3WaREJ7ysbOywNEF1KN5ZyBCj5690RiF0asHXetT32w34pPUJoObRiJNSims
         XG/c3EOAZP+oTRD8QqudIefWN1UcSGIaxz6drRr2GgcmjRCBctCIqrvj8wEhOk127D1G
         XsCGs856Lwncv613nP7uDgbfZl5yE3c1C9tbQ0pEhsd4Ef1uDeEfSZXQMMe1xbHbXy5u
         XezoQ5cMs9fN0y7kKRhsOKMoI5jtiPIurMEQJ+eZUxYRX2TCoD9vMxto7Pr/c1JjMoCW
         J1zfOk98xReIr+9782nVk1iwv6lHo23M8tOUY+DS4Sop7VIUchrHUWqtWxctxelkW/Fh
         lApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530245; x=1795135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=fJ8dOXJzTlH1r8uFs5BXhb8phwwYnCkfRKMuf57SmIDYkkz6FRFfVZ8z9MAISycTQJ
         1nQI8NPcACfxh1otHiSVba2Os+moHHi7Oo0gRrSR/B0NW6C25TnFCaTpZd2YeofksJUj
         zHyEo1GSrC8uF5SfsjDYxllO9VVCaF7bxGUzUyeiQfYoHiTd+CN9q6NUIytSplrJiLCr
         aZfsLRvs6zIz5KumQm8zsoDGICm4p7V0p476Msat4jnn/1FuVIB4qMqband2s2Fv80Re
         1WJiQVb1Pur9hVCiIX067uf9V/77Uvj7xe3xBClP2QVkL9Qb6h2lTPrt5ZIitb4sb6nH
         EYew==
X-Forwarded-Encrypted: i=1; AL+hErGhAVxclnB+E92H5gRAGoCo5weSqC83tH533Yf4/k8/kC2AohkRfXWQ0avY09kJgCo7mxEzr1Xy2RZPQkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eH7BqMRSb/mxGoc0QBKJOrJXdeDsAAmqFlcSVdIFhPVjNqWiS
	Aeh89B5k8Bb1lvGYNIDKhQdyCG0MDLWeQtGx6SVuvkvP5kLkKA0KzcN1
X-Gm-Gg: AYBFou3+z4RP3aCfklmPVMRdwrHIqgK7l/i3QDF8OwUxXJUi+r9yazDjOdeaxb2pWpM
	A+wxuNYwZ0lXFPBHHt/cn8bp07DXdL3uqYtiDJG6CdSo7Lda7qqRBQjR30sBu77rFZUeL0c25fT
	owfBysxUmfjz59KpQQsbDNFKUA62VgCwZqARIAZImteM2YteEwN949gpCV/GZ2mw/bK50jswgIf
	hSc9dlJOp1To55hzizkH7IzMB7fqxky04J6y9Wyl/NCUe6QgnluC3JjhxxeLabk3OYkA2/dFNhW
	u8W1baYkiGRRNk0TtzT4QxTa8m7ZcKbMmCwrqRwUcc3ZjnOnLQmVUNxqfPCEE3IJaXhll6p745k
	xqyE8Bg6h5Z4EBJJ3NjpcQUvcXP7c7PEvbcjgwfjl6/xIHmzBNjBeKlX/p48TzsuAZaiemyOb48
	FG6Rb+r3Mr9RVIE4FOUCAbpi90dFoeSyCqcUzNsbU2zoGitWfEEQTBbdh3Dt7wLz1tTEXSIJy3A
	PE1VEOMQUF7oFeKUNFqXu0OHmw/2W8k1d7H8+rsRmSDu0SIgO5rEyHuOCoADhyGJZcwNPSBDli2
	YD/MeGYEgUx98BD9wVl82s2bt1J8grYasj/0e2ad4WbIV5p7LjHXsvlln/BWrHYtr6PhsWPB/3t
	9SNqG1p7dnwHbSPJ1Z92+sXOhVSwOk03WVXZvPQ4m3+f3WgIXMY73JOIgXwAGN4oDu/V10aBhld
	HIA0n6pCgpxEhLFc0Y
X-Received: by 2002:a05:6000:1885:b0:499:d9a9:5158 with SMTP id ffacd0b85a97d-49c727d1e47mr2139782f8f.31.1794530245167;
        Thu, 12 Nov 2026 16:37:25 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2702533f8f.44.2026.11.12.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:24 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:37:22 +0000
Message-ID: <20261113003722.3667081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-misty-lively-galago-693c57@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <20261015-misty-lively-galago-693c57@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This is odd. Device is specific, fixed. It either is or is not
> compatible, not both.

Right, the next version drops the syscon compatible from crm2.

> Do not need '|' unless you need to preserve formatting.

Will fix.

> So the PHY does not need any resources from the parent? It gets its own
> clocks? See explanation of simple-mfd.

The next version has no PHY child nodes. The PHY registers are inside
topcrm, so topcrm itself gets #phy-cells.

> Incomplete example.

The next version turns topcrm into an MFD like Stefan's zx297520v3 CRM,
and I will make sure its example is complete.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word bindings.

Best regards,
Navid
