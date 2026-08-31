Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9654CCDC6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209034; cv=none; b=f4gbeDrn0Nx5p1lsmAMx39JiOKghrby5ilL2xZvubNojFL/kVBb9gtPu7uwQplajqp6VzBFKmyaCLAEesr/pvxKBRYkjitGti3BG43K2swup8yC+68ZoR3QHRGKyoAX3VkueQ9uZ5pX1qs5Gp7fMoVOAwRnJRtCL0MwqpqQdkow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209034; c=relaxed/simple;
	bh=LFGwJ4jFGN6jVopgUMc/mgbTNY45MWrFDLh+fMbdJQ8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sb7UUD2yQoybSMKg/zqVOExDqvKmf2CxTHetJ3sURDnUNrOtx1+0MwWQaZx4t/00hZkA8r34DSsv1H6KrNS7aXjauWjVt3rFOwX7KmJ49vN+xueyd29omXBEP2wcEraAolvnMxl+IvaVrm2YpL+iZ6Eh26VFix8eH3B+HLIEtXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWvU9QdM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWvU9QdM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36361F000E9;
	Mon, 31 Aug 2026 20:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788209032;
	bh=yex2EWSH+6oNF0Vry6nwpApdemQxxZESQyYgdvBoO3I=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=DWvU9QdMEuGki1ZMxUYvUTrr98sCMco0wX2A3lnyw0gRFGngtellTSANDiFJIfWUf
	 Sy3PzhXYj5axf9EGjhu9RrnDygjxDnvLRlXHeunkQNnDRIWe/6t+dc3jg6kFL9Mu+S
	 v3bBmrNnvkPfzEEUyULb6+mpystGynbddTPDd2NBcBhj1eFwqlf4BUKV2kQplIYO7P
	 /XUxJdGPZuGI45RzkO2/CqWEniOPBkbPJnZqkzgnKauGj7sB8Iw4fUBw0TFyjbI6le
	 i6R85GuntJ61Dc5OiB5pDi8YAoDmAelnTOiCYh8d2Z5e3m1gYusIrAAAza64xZxQHv
	 ChSwrJOZndkcw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
In-Reply-To: <20260818-regmap-kunit-cache-high-bit-v1-0-7e790676dea3@kernel.org>
References: <20260818-regmap-kunit-cache-high-bit-v1-0-7e790676dea3@kernel.org>
Subject: Re: [PATCH 0/2] regmap: Test caches for regmaps with high bits set
 in register numbers
Message-Id: <178813628153.13461.13580651200298565075.b4-ty@b4>
Date: Mon, 31 Aug 2026 01:31:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LFGwJ4jFGN6jVopgUMc/mgbTNY45MWrFDLh+fMbdJQ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqleeF3rFXTmtGDCkhudGBJM3zBFpSBitOGy5AY
 3zqJj8ROGyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapXnhQAKCRAk1otyXVSH
 0JFLB/wLgdLPolrNDkrejwjOtEZhoEM5BiU0JXRuK974hjN+/aaMgdDT4S0gnFFa6CCs74WKH+K
 za+XdbyYuBnSrARP3UrjKwGa4U1GL9xRUqLQs2tqcE8QopsLXTEHW/6XpsZHtA+Qm1PG7Crs/z+
 sVCF4KEB1yxZi4pmbfVZSCRa+uaXtflaueuqoSaDYGPcuJrWkrlB6rGByr+SrX40gDPhGzu4ijX
 Gg3PSxtCggL/Hsq6+r5c81UjyUMsxn8rVBin5N3JkRxoorFMXscFivLJFFXMzjVd0ZIfgkVAq3W
 S6QvMmUidGKIjL77LPZtm0I8XMGHjLZE2yVKmRQfGZ8WqCsF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 18 Aug 2026 22:50:43 +0100, Mark Brown wrote:
> regmap: Test caches for regmaps with high bits set in register numbers
> 
> We had some bugs in the past with the high bit set, add some coverage
> for this to ensure it doesn't creep in.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks!

[1/2] regmap: Allow a base register to be specified for the RAM regmap
      https://git.kernel.org/broonie/regmap/c/a99aacfb67df
[2/2] regmap: Test rbtree and maple caches for very high register numbers
      https://git.kernel.org/broonie/regmap/c/b26da6db3da9

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

