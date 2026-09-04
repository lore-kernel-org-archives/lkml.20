Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9B4A4835
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529232; cv=none; b=ZkTeS0HH0fvCVA3jMJeH9PCsKW8Mk4JeL9/8/cIfGxPguD/IWWoVVXF1qPlsoY4+HEK2ALgajDv7Y8RdzCqjI5vp1SeSx48sJFkmO8BWkwCdT9ljUPPmpuGQVrkZZ6sPU311Qr7kHZIhmmXTHl1FJls04fglhMn6qXbqFioW5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529232; c=relaxed/simple;
	bh=9hFIUJxGV+ZKX9PluUB1+6UKS8j/7OkiNRPiE8XAaBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jzbC6tyoPBNy9H+JDRix751KswN2ZhTN123Sq/+dRlGNmaHBtID3w9RJti4W/fpDXgAPjHgOEaD2fOxAWkyT81PCFaVwBNyxHAacbFmfeKnwJr1woVeoIfhqozbjOMoJwjWrDrDhUe/caekvHnCXQNxdfFMXbnI7N138SEatxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWcFEbjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWcFEbjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB3D1F00A3F;
	Fri,  4 Sep 2026 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529230;
	bh=qwbmDm5q9Q/yndoU4VFw9AECGyBmUhTXqE1Q9msMsxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PWcFEbjpJ8FELEVxp6EL4RwQPYgCrt6TxldsgH0gvEoWY/fhStlBVu9QzriNg7esA
	 dLe6+d+rqhbxa6nZIVtYK8cX847JV2b1caNRW49iKa1Nwzw0+qlwQRp2TTHl0Y5LcQ
	 swpZwKSe2ecFrC1jvUaIjp0cY4UIn4QI64X67wBIFtgFXYaPlv/lk5bHyN7wi4VSzf
	 WHXsj834OQDf43Z1UUSezqwH6cAXOwXBcH2k+7hll/V5o385FXrVNRnBzR3m6tDBhr
	 fY72JSgBQ6p3qIC2w+aeZ61ib6pHxilgh6fGCnx0rZCvNZkcLDR1aUxGEwO7qAG/Xe
	 +2yifobuLVZwQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20260410091039.389911-1-linchengming884@gmail.com>
References: <20260410091039.389911-1-linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for
 additional flash aliases
Message-Id: <178852922805.3340372.1167723040867621466.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 10 Apr 2026 17:10:39 +0800, Cheng Ming Lin wrote:
> Several Macronix SPI NOR flash devices share the same ID.
> For instance, the MX25L51245G and MX25L51273G share the same ID
> (0xc2201a) with the currently listed MX66L51235F.
> 
> Add these equivalent part numbers to the comments above their
> corresponding flash_info entries.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: macronix: Document support for additional flash aliases
      commit: 85b6110155cab6b67c9072c19f21dcb620c2819d

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

