Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73302372691;
	Mon, 12 Oct 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829249; cv=none; b=gagz2GaOAIZPgqmXcRiL9SDupELPgEas5aFjmMpCeAVNBZmj+k4oI8CxzsLNSWR7ZzD3+REsdDENM3J2uQIC0P74Dv/EYDZHtEvOWFyyGkANPvkJuOA9w9XOJNZB2EV0bpy628FdtXwvsu+mAyN+UFqnl3F4SOAHVhCCjPzEA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829249; c=relaxed/simple;
	bh=ZCSA7FP5X4lYXssWjzxfjBiKlylaiIQbja0D9gW4gDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TgsECR6+o6fT9zYDuWdEJWIBZFQhegdGqexMw3F+8rUyCP9l+VyLh3TJ8JBaD1qvxoa01+9FXeZTFnhK0gzyUr88T58IBw1AknvRQa7Kv860eS5Nj57rb0xifv3hB7vqU6sE4p1YCtV+2bQjOmVkN9YzZUQ5NmU1c4xHvD6MMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uZXAgcdp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uZXAgcdp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B18514E411FE;
	Mon, 12 Oct 2026 18:20:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 127A8601A6;
	Mon, 12 Oct 2026 18:20:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B248311D70C57;
	Mon, 12 Oct 2026 20:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Z5DuxO6Z8vvHDjdd8tEVoNo+qa86SWpq1PAL6xxnfQ=;
	b=uZXAgcdpzrR93SwNFj2cnbE4HQMrhsn0ImHwCFCSE6RSLC7UxEYNrIbOOyZumMAUFd3r9g
	7TqSyU/BzViNZqOxPuc71e5ngpR+LF4CtfELUztKC/8VwHB3hNcfNSCKfKWomhjoXw7ud9
	XGDAgzFRo+6quQg+ybdXrF74aMkvT+OX3zTkb45fsKZOkud+SdM1Y7WeayIjr6Vr5XYh8Y
	k/1gCwQMptpKqm9UJgN7f3T0s4JsTkQTqJS5rvv12K2uTOfffMR/hv+wFP3DN8YSzKS9CH
	UK3KIHK8GnkuZ5hts6Y3vIh8mrJxHMtVqDTUpXsGfhm/PNaS3y6NIC7DEr0uhA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925163045.1920345-1-robh@kernel.org>
References: <20260925163045.1920345-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: arasan: Add "power-domains" for
 ZynqMP
Message-Id: <179182923638.590599.15684130186236498870.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 25 Sep 2026 11:30:44 -0500, Rob Herring (Arm) wrote:
> ZynqMP NAND controller nodes use "power-domains" property already, so add
> it to the schema. As ZynqMP is the only supported platform currently, no
> need for a conditional schema.
> 
> 

Applied to nand/next, thanks!

[1/1] dt-bindings: mtd: arasan: Add "power-domains" for ZynqMP
      commit: 8e301fd598806b9480b00a2c16314140de7c4db6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

