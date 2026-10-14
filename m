Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75995315D49;
	Wed, 14 Oct 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975117; cv=none; b=put7oVK7W83RaM/fSnnVsHKuE1bgCcYZ2LNuivtAbUAum9EDQKGUNs+THjWEvJn1N+Iq/bV+TrDE44LFyOv7EMCi9TS7Iaz6QlLWeEv3fPgcDMKXtIlmjtpLCfwrzdN+zTfjz7R0o8jfVzUNaRrWNCMsFj6c59CP3ozPK8z4ccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975117; c=relaxed/simple;
	bh=E2pBFJu9upB+AGUIXN1TNe1+ofka0jkeR1cHFI4cuC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eFeyx4N6QN87aIkohGluzPkvER6M3gvdAZ/LfhsWdBsVH/YlRajWDuwGlyk8gRLiOFPhDuiqPrjPzJNwA3A3DG1b2Y6W6jufzTpw2xfNB7QIg8kvRgIcJ7fyLCvSBSijO/UkiOt3y69iwDvs9+mezY9hN/dAR6ys2gc5RQKCt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czV73gi2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czV73gi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFEA1F000FF;
	Wed, 14 Oct 2026 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791975116;
	bh=VVkP5d4Qa6oNLt6zJyWmIR0Pd0tEkXtIttDsP06TJNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=czV73gi2m0kSWmGQwk03C9FYRkc2YiTZnG7OsK2tWgDqRQonRB8xpeFFiLS0lMvNd
	 /SspZ/kFB3+rxmKioEccbe/Ni/uPeEBVBTdsPbwd8Z6vLEjjtxMSzvXZn+dM1Jt6O6
	 JSahy8UfT9Et2E8HfbtiHtU/LPZqGTfIsjTg6UDk+84OegarKi5sKDZ65PS7w+CcWl
	 9lEURi7MYDeojfsLaBbodCmiulb18zhNLC+xAgU3WwQ3v3p2WaTFAWCEs7gWkoDeeF
	 r4Kjbut8Ov+vGAxzT9d0kD85mjtDtCt4rpbHp5qhPDSZEzq400gy0NOiJfbAXyQXvC
	 QPAeD9a9kEXEA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Alexey Charkov <alchark@flipper.net>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
References: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: ti,bq25703a: Expand to
 include BQ25798
Message-Id: <179197511371.446299.12707694917415033080.b4-ty@b4>
Date: Wed, 14 Oct 2026 11:51:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 17 Sep 2026 16:44:39 +0400, Alexey Charkov wrote:
> TI has unpublished the BQ25792 charger variant and pulled its docs from
> their website.
> 
> BQ25798 is a pin and register compatible replacement, which also adds MPPT
> tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
> backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
> BQ25798 - all of them reserved on BQ25792).
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
      commit: c3746b35b0503a90d744347bee22c9a9c04b7fd4

--
Lee Jones [李琼斯]

