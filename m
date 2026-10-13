Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09C3EFFAF;
	Tue, 13 Oct 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900490; cv=none; b=k3Grye+/vmgqJjqSX3hIVFkTskY/c6FB3A4ryPA7kjCqOf7FpRlwSpYJkC2Gg2SxctV+hpI6nEbPKhHFiajiyBWVSp/uz61JbZigaEXyHrIBeskPk+yDvPQII58fmbqvy17vx6DlF9/xoknnvEruWI9lnAxja+nemE5sOKiA0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900490; c=relaxed/simple;
	bh=ofF+xAv1HUwEzJtyxlkVeGbz3J3xNSCbNgxFLjDsHxA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XJ9K02MSQ8nAk6Tttizv2ed5qO36xg8DrWCzIcOhYJOe5y3BQHP5Rcfae5u5wpfxvJ5PC/VwBnzTWbUdBBcXmVTPW5eigrbOQbHigQalYd4NBw1Xrv9Xg5BlQ+k2M9aSx3371c0SyEBUwQ4E68wxlOzafc4RFnC+I/goMJDY7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbdU7hhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbdU7hhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559671F00893;
	Tue, 13 Oct 2026 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900488;
	bh=2HVKqoOB1X7GP/aZfzXLhT5w/2aArkSIVTL6S5zxtZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BbdU7hhVb2m0vf4h/kUmfhG/IcB+v5tX83qb+/F7HVjDxoOBjgF4kchTqcPDo0EJK
	 WeHml9CCKvXP4vjO67BSqNyFFWcz16ogOBLPxFH9rbfOMGX5jvF3FwFu0D/uNKKeYn
	 ZHSXyBWAGhdqBClGTS/gL3DXoOskIHqQ/7Ct1xS/p7v6SM719A4ajHvHO+W2gmVXHT
	 1HHWJfd4kpRoOn68l8aWHGUUje6RICpXqAXArNRQPixR7Ho3LJ8ycSx2ZfPAD079ub
	 mcUu20JaHxC7WfCH+i9yFiaCLwU9FQAsjuDNlgTnOrr9OntkZNm3w6WWdL2p7KXz5d
	 AftwrNYC9pFNQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260921232632.3131680-1-robh@kernel.org>
References: <20260921232632.3131680-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: mediatek: Allow MT6357 ADC
Message-Id: <179190048608.3947243.2010641297800575324.b4-ty@b4>
Date: Tue, 13 Oct 2026 15:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 21 Sep 2026 18:26:31 -0500, Rob Herring (Arm) wrote:
> MT6357 PMIC nodes can contain an adc child using the MT6359 AUXADC
> binding. Add the child node reference so the ADC subnode is evaluated
> instead of rejected.

Applied, thanks!

[1/1] dt-bindings: mfd: mediatek: Allow MT6357 ADC
      commit: 89089e041cd522b5e64c3f0c5782361db13322d7

--
Lee Jones [李琼斯]

