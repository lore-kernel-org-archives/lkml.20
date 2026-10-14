Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0D4C224A;
	Wed, 14 Oct 2026 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980300; cv=none; b=M0t943ll6VIlJqxVggMQ+0gu60okmthnagvkhaHv2fR85MzfTA0DSsR4Y49RsAYqZBUfEyLFS426/Xqzp+axcwYkdovowvUrWUY81Ps/2w+g0N4/MW8Jal3/ETFtAs7jOPnr0r6/rdUOz8cOCM8ugT3CK4/q+9wbYRbE78xNVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980300; c=relaxed/simple;
	bh=1jNHNq4JEW2AKWn9mbI/518934OAapYG4MY3MY6EJ+I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lgpjneNPmv4GvvD+FO8WJc1UuG8kU7bT0SWPtiYjV0dQ4BUtz4hU8kHsEh3NRqtVmU8dnOeL5AzGkjrstDDZu5a6pDYED2x6flvZCdcS4pPXueJuGQqxa/WH8Yl1k1W8wNbVSl8id2g1U4F3rkaBuyfbQB79RoDeddMBJugCvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH/LcGMA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH/LcGMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181D31F000FF;
	Wed, 14 Oct 2026 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980298;
	bh=imKeuNpcaoqzQJSC/5CaueIe7C+XzwSGGpsNOb+q8/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jH/LcGMA5qyvF9H718nSe10/v/J8kXM2OzkKqn0UPqdbn14JN1YZnNeb3uD8El5Jo
	 m40SxWzp35HZ1oUQnQNfYYvqWAWNj5yWXOJ2VRS1dc99S8EycxQc3ku8EzwuZ8QPmH
	 meD6Z5BabjAgFa0duS7RcJU6TZHy+Ix5Ug1pKsKy6jynkMCkdpovEsS/OgGbexT31l
	 F/izyvRMurxu7CYOZC35Xa6gH6R9dlKLvOyVbXk33Fh9fsy+8ckZtadDwULA7+Cezx
	 fk3y34JhcbZeDYMHtA/WHdk4c0mdH/Hm+2q25TobQ0Ms5JM52DX0iY+EorcHOvZ+F6
	 js2XAX71FdYyg==
From: Lee Jones <lee@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org
In-Reply-To: <20260923191526.2206628-1-robh@kernel.org>
References: <20260923191526.2206628-1-robh@kernel.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421
 SPMI compatible
Message-Id: <179198029682.796475.17855215396698638108.b4-ty@b4>
Date: Wed, 14 Oct 2026 13:18:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 23 Sep 2026 14:15:25 -0500, Rob Herring (Arm) wrote:
> Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> and matched by the Hi6421 SPMI PMIC driver.

Applied, thanks!

[1/1] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
      commit: 1b482faa86591dbd8524d294383281f4adf2f6cf

--
Lee Jones [李琼斯]

