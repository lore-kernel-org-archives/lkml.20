Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5839357CE0;
	Tue, 13 Oct 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900554; cv=none; b=HZ9V5VsJuN9x7spibzqGbO0an87lXzkZIpgmU3wfMhGatz/6d+Xr3VcfKcbPSRyjxdtakt0gS31jeH1sz5lKhiF6r6AtNDjqtVFGdRX9bbBDrpizwjAs7e4ZB+6f4GIGx9QGR5flgRjHkoCDbXOpJcJQpjlPud/+jHL/rXrZe3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900554; c=relaxed/simple;
	bh=YOUX+/n7QcfFhOvaQ8KOrueg9U+bRq1ouMNQbRiOHQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JPZOqRnga+JzPn1+zMJtjoFInH6L4KI3trth5bofddzzEwiJug/q8udvMrqWhKN3wQ06c8S0W4PpubXdOUH+kd2uoUwFL7iU6e3T7mWiMZiynY9nQE9gjX9aTnQPnv245Q9ja6IEFuubrAHRZT24LYM9jMCn3LpJ0rWnh+otONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og5cDjPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og5cDjPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713251F000FF;
	Tue, 13 Oct 2026 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900553;
	bh=FBLRaGHH3amBrp1ker/5Wm3P1tvMuI98VZU57fGqM6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=og5cDjPdB/txlT5QRXFShUR51U6MJsvUPagqbrdWP9858xoL+DyCk0bLf+WGce8EI
	 MG6u3fTXg/yp78n0RBvdLuOS6iB8g1+eUD5pBrLCjE+B9Hq14FcoUDdbh9DN8zkg8S
	 RNzSMUBzPaUQJhyGTDiYN3cQfybyW64ITlz8ALE8Ov/sILPDzMIeUwWLjME7FYR0++
	 atWHGjlnu+lLLmgDc3WWMMzcmwW7LrzwTvBBaUGo1nUx0vKXz4PeMrQF4FrZtzPZ08
	 zCzKZq2XcT8iD/Basr81k95xnHx+BOueMWvuAnIqHg9u4+zIGRs2zX7a2OoYYMshg+
	 6QajJ9qCZTiYQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260921232701.3133291-1-robh@kernel.org>
References: <20260921232701.3133291-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Allow MT6360 interrupt
 flags
Message-Id: <179190055118.3948780.1611547752673476334.b4-ty@b4>
Date: Tue, 13 Oct 2026 15:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 21 Sep 2026 18:27:00 -0500, Rob Herring (Arm) wrote:
> MT6360 interrupt controllers use either one interrupt cell or two
> cells, with the optional second cell carrying trigger flags. Allow both
> forms.

Applied, thanks!

[1/1] dt-bindings: mfd: Allow MT6360 interrupt flags
      commit: ee76e520857352ec34aaa5786db41610a4a25de7

--
Lee Jones [李琼斯]

