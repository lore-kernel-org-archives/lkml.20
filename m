Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CB4A091C;
	Thu, 10 Sep 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048013; cv=none; b=q00WxFhf8BGeVZ4cT/amjfJ7WF11VfQTg3Ct0fmZxFiu1gSYoMcbIinyNX7jAQQqerAeS28yzAUGNnhNDeEjkUtRE4OmZkXgnhXTGU+alyLF68oLblSb6rKt7jp7nczXYL9AcIq+8k/loMdko0DOHacpu9S2O5Tq+xgUg9oIP3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048013; c=relaxed/simple;
	bh=A87AP8swPUEyRPXf5fTrugZ+4Xu256dM1QotXCg6QkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jXvbIhXVJEr6zOkjnyisr9BLcyQPASdXmKtj3zpHTRYTe5E5QepIZJFQZQ16LKWWFt4o/ChDBEegZ+IpRJMEYK8Z8fXtGFToq23nMI+SCvVX7BO4rNvMOxj2MA2/BQ7imTJIQH9jI2HyeMqnTeIndKXnY5HF1tb/mMgL4r1PpCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuNir4xT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuNir4xT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CF21F000FF;
	Thu, 10 Sep 2026 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048011;
	bh=4e6XdjaIeRNw7H6TwHj8Ecb4Bol9gy4u9326L2f0CWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QuNir4xTdgw90vwrAKvrnqoTbuTNaLBcRq+Q8B4s/OmwK034J3gmljJCatemfCgdp
	 onMQbsnxvtBtzu7txu9a9nYTOjb9uV1+RyDNYEwuzn+H02pZp4AFj1XJKUiHE96RnK
	 ZT+wzaSXAD+1jYb8I7tUUHH5hF5Bv4FHWhCPR0RhqUNQLvaKcrVPtdb/N8WaqzD8FM
	 qk1HAf7UO4tJEIF3bn++YPhWlaoW/r6LNssJccmdE26uF784ZMA5lUzKvhtB+789po
	 /S53fIsLgOVf2G8EEIA/gkIWVc6EvGlZGP8yvYtUCpncJhJkMbHXqEpKaVufj4CEDJ
	 9Vu93QceL+x3w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
References: <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44
 variant
Message-Id: <178904800886.1156720.17152085541295265336.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:46:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 08 Jul 2026 15:00:39 +0100, Charles Keepax wrote:
> The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> for this new device.

Applied, thanks!

[3/3] mfd: cs42l43: Add support for new cs42l44 variant
      commit: c34a67075946407d6dc6400a26f6c87a3ff9ed52

--
Lee Jones [李琼斯]

