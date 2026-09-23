Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD54D0CC5;
	Wed, 23 Sep 2026 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170162; cv=none; b=i1yMMnoPUZgXA7HFJYuLgUNeF+atMej/10YlalqvhkNmH+vIqVbi6BjfFRPX+6qw8x5YFmedvpgg24N2HKC3yKqP27z3sejJL7V/GebjRoQ39pFOh1zdVi4jqrNJN66rrSTVwp6aNd3dZ2qn/hwXsSgG3wBhGFZnAFWQK4BMEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170162; c=relaxed/simple;
	bh=gpCZr8u03L/1mMISk72o+fynNoTXxe+xC6jgX+XjSHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tvPQ6nVNJ70UevrpZmjWSmbdkIGWiOTrLb37GBGRPhNO27LQypK8oeqSd59FV01MQTF9LSsAta2VugGj/ZIH+Lsr/C2+hPeOqYLtb2zFHMhQTNFciKnImOvX+GtqS42wu4k7VZ8eay1toN7D+aG3HsuGM3ueNKhbDpc15f/zHbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQLKHnVw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQLKHnVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF3B1F00898;
	Wed, 23 Sep 2026 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170161;
	bh=yygsGnFltgurq/BUs7NOEEkRqO4i/4yT2EM6Ffixt0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PQLKHnVwZUq992EwT9XxYunWy7StzJ8SDWlJuS6BXUx2ML2YcVcWa8deQ5S5+I1qm
	 /f2tkB1o6819IlcnaM5Gl301ugGwLD4ytjK+wD2/7YwAaboC9Mntgpg8zsFuI64UrB
	 cO8Bxns1uZSVecWG91i37F2kclYWFWxlsWBuKgOhC6FplmQXNC5YIG/XI/qT8F/3aj
	 aaL6OLWfwoXSrgiCDQ5gZ6kEI8+cYSSfmsMyyR3O4L1GYZ7MtyD1UipwV9yGuwXpJn
	 nqL9EI+ZzKHi+ue9YNWdd1kcNhgpY1vsLc6Grbl7h8YH0Lu1o9Aly+G37aGPVxbLW3
	 wR56MBWFjAbdg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eugen Hristev <ehristev@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260922183121.289108-1-robh@kernel.org>
References: <20260922183121.289108-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Fix MT7622 clock count
Message-Id: <179015857689.322763.9242441046352881202.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gpCZr8u03L/1mMISk72o+fynNoTXxe+xC6jgX+XjSHc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs9QpI9twB4Gv9+NN/M39J9ZkvXSaphDuMFk1D
 LUDWGKB4Q6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarPUKQAKCRAk1otyXVSH
 0BkHB/0emvTrVyY0TSqs/nlBVFZ1EdFmOq368Cx57Hemx9emyUYCl5jzvH02iZv5hWg1FPvo1hT
 id0Yhv0pXJpOYzoCnIIl+UQiPQ/OrCecp2QV44XCpcrXRvFwb6jHjeaypIILZ5oLkWx2bmo0CDC
 L1+tLjqO0hvP9F7mBevuMNtD2pwRtOhfL+h6tf+3B4tRA8l1XCDMXUXRQgnN3FVgiOQtHjYsmG2
 JXBX3mZyYF6HXNDdkg5yDFZ6peiYPfpDNFqjzrxXOPBTZc2Yc/wLF8FjwLM4W3uAuqk2J1W/4/m
 EofulVVN8f5l4dIRpUqwEVjDynkS0Z/R2qS/gT9QgSEP0SCA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 13:31:20 -0500, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: mediatek: Fix MT7622 clock count

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: mediatek: Fix MT7622 clock count
      https://git.kernel.org/broonie/sound/c/2a2d659b835c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

