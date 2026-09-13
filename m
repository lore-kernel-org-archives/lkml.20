Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C13427F85;
	Mon, 14 Sep 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377852; cv=none; b=EOi09NjEMlHvmDya54hNG9pdLXqnqfPWEQyRKwu00wBAxS/r9argm6rSX28BLjZwDzrkvfPg0wbJq+uS1kKx6sqipRsJ7xbjphaI73FxX7uPKEKaWmocWEi58gEx9TD1IALOdQpLfpMQMhuQTvrHZ33Tx4AuPpHT74ygx66qXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377852; c=relaxed/simple;
	bh=Yk5Q/bYA/6cID9EgtmiSFYx9/ovYne5/e3SkuBlPoBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ms5kLwZ72vicBvEPtsmB8+C34Zbs48pTqLWrfxLKiOkxZaQbMYflWBkKB6WWBpbgtOrHLbahy93ETPII+fgJYjxWaebtMPLHt2fN5xFWR+12vHHBoShclNSipE9awQtkPoTuFwRyjUHOevx2mkGmtncPUZa7jPISXdXS7Nc9D2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k12sInqw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k12sInqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A65A1F00893;
	Mon, 14 Sep 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377851;
	bh=YrdWWwQUG3SsodlqBZSPibvJpFetR98ZO0yc7T5ekyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k12sInqw//QK9CH6m966bqvVChhDwiqaEKNyubbPYqoOE0174j4HJk7IKcJ1O6ebe
	 tA9yj7M6FNBS95PETB8WFugr+Fmmu06X+0ofrcEqv1efEUBOyucn+pIQh6zURpPY51
	 s3cEycummftpLwCWE1PBQzvoOrsBPwvUBI8n32cmYbcuR8E9rXyTSpku7HwFLrEcoG
	 ENYQfiv8nB7eOv7K8BFfaHNShLqWY1COR0f89yxxCU3U9qGkocHvudJD0hlsNdE9nv
	 /QOnpbUudKnxcYwsQODjVr2ErthexpC5+4tkTIbHAEv9BgV/e69+nQMCa1hZhovLQJ
	 XkXTwjpufRKDw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260912000606.34614-1-kmehltretter@gmail.com>
References: <20260912000606.34614-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix the return value in
 rpmh_regulator_vrm_get_optimum_mode() kernel-doc
Message-Id: <178934257805.1239410.12118428099167170260.b4-ty@b4>
Date: Mon, 14 Sep 2026 00:36:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Yk5Q/bYA/6cID9EgtmiSFYx9/ovYne5/e3SkuBlPoBw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqp7032ZUryO3shj1GF+HkhTdpsbtICDXMs0jdi
 WmJKC7+nkWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqe9NwAKCRAk1otyXVSH
 0ImqB/4ndWGnJyU+h5vr0n3b78MA8yOOkkL+wptzAVQ72jBToNkcmBbFjkXm5eFhe9XdKFF/6pD
 pW8Q0UyXHzt9ZGc9vn0VpNT+Z/2VtfrrjkS6jWIT5xrTLV2QtqLWS+/CbPn3/DR7Xaplls9oksk
 QnApr8RZkvXYWt23jEn/ZqYIRuL5dnDgwId2VXY5D8W6sMfWc6QsKIvOhlqB90OSAtCOXrXgzov
 edre6y3ffQw7vgPaTyp4OhTFivoYL9fajWHSOsVtLRZgR9KNCjgwORJJU2/T/OTz23mVocSuae+
 SQ3yC4+1r7mpACfHCuCLCXVHGWOjNQrcWJ1l5TDFGo0d70aO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 12 Sep 2026 02:06:06 +0200, Karl Mehltretter wrote:
> regulator: qcom-rpmh: Fix the return value in rpmh_regulator_vrm_get_optimum_mode() kernel-doc

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: qcom-rpmh: Fix the return value in rpmh_regulator_vrm_get_optimum_mode() kernel-doc
      https://git.kernel.org/broonie/regulator/c/51d6888b51e0

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

