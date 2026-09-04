Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E451477A;
	Fri,  4 Sep 2026 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552761; cv=none; b=AlQSI1Kx6ohcqsnra6jhI0qDns+qFn8BwBDEqne9vu/QkeqUG7bH1/MC7Ldxx7U+1MpJAiFicjYr4d5bV/YWErRfdLp1w2RB8sShpAK79QbGm1g9bn/0RlsL16gDwlqVKwFMY36GkBltKkwk6gsdiHXd810Z86pHe8DQ9JRn1jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552761; c=relaxed/simple;
	bh=E5w9UEW57C8hYqBnm6XIji7VhzFePyEk6NsxbMUc8CM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cUjVCzoWeQt90/t1LDqArUKxcu8TGctx3FPv4yKs8QtQJmZ0q+vWx485WwxxLFX8pH8RpMKsuAC/qVOhsWbGZ8eca8o42PymHLEiSIjdQxkkbio37Wt61/GgTCSH7FPQohfk6uUD/aoHHB+DwYKfMt3+ZkIEGUgNai1ZhnQ6YSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvZQwrY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvZQwrY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891171F00A3D;
	Fri,  4 Sep 2026 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552749;
	bh=VPFVtsS9bhAV0NjDdWE1nJzo3uo/rZGTewpqJkAlxUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lvZQwrY2OY1Go/nymVI0zDApCxW0fKqCUb0ngThhM71OvPzqFm2WdybOMvCXd1Vl5
	 lRBHtDVDoIsCOu24CQDHGtW+BN8IV9OdKFqwsdsShg+jOsBMdqBlHb2EtlcL4umnuR
	 6CWuq/9R6UVTHgF8LoNRL7rs7vqrmA0W/kBedCDYAe1TsHCSiVe+w75jMp6KZezzUO
	 Ty4FCcrFEPVIRtWGFdaMTUOpAc2iz6JyFpc/6J/+NfQENz1h1jYkdFKnnHSEcl8XqP
	 NNQ8mHg2dI+8qMxm0EbE0GVHWmJPfjq+q3S5/ENbbSri547FeeL1B3XXPIbMHSzvBa
	 7zxsR4vkNFXPg==
From: Mark Brown <broonie@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901043123.5401-1-jszhang@kernel.org>
References: <20260901043123.5401-1-jszhang@kernel.org>
Subject: Re: [PATCH 0/3] regulator: mp886x: add MP8864 support
Message-Id: <178854560202.632048.8823255088829631603.b4-ty@b4>
Date: Fri, 04 Sep 2026 19:13:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578; i=broonie@kernel.org;
 h=from:subject:message-id; bh=E5w9UEW57C8hYqBnm6XIji7VhzFePyEk6NsxbMUc8CM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmyYo7xRQoZ88UTQwGGDmcP0cTUbYX3FkvuRc6
 0MSqPsLKISJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapsmKAAKCRAk1otyXVSH
 0DzIB/4pV0PTnMIA7Zq8454He1Sp5VOvcI5E6BVhvWRkyT6GSMb6TLv0bad7kVTPwAliiHuxnS9
 US7d6RkuSJWpv0nbRNWUPn1q0CkzHL/Nte17gFYz/AuwBqaXX9iNsr1MijT+LfsXrmNV7SLE3br
 UEe+7Rc7bUUQhwDd/Us4FJP8oMQs0/eOskcdrUaDTJVRBYgADng+/9YbW/GmAPC+cpHJ3v+4AlA
 zmRTI+/jGLvtwy1zeUOCAlBYFg1xQTJwtn1e3zvZAFtf4sCC0/eU81QBeD9HPp2OgG9yxTgscPa
 OL7k+kk0tzmfKEMMF+UVPYdOVB8zn1kmnmbABZT+AxeonprJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 12:31:20 +0800, Jisheng Zhang wrote:
> regulator: mp886x: add MP8864 support
> 
> The MP8864 is a 4 A, 21 V synchronous step-down converter.  Its
> register layout and voltage transition handling are compatible with the
> MP8867, but its selectable switching frequencies are 600 kHz, 850 kHz,
> 1.1 MHz and 1.6 MHz.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/3] regulator: mp886x: fix vsel_mask
      https://git.kernel.org/broonie/regulator/c/24fa0eadc2e3
[2/3] regulator: dt-bindings: mp886x: support mp8864
      https://git.kernel.org/broonie/regulator/c/c75d4f104f81
[3/3] regulator: mp886x: add MP8864 support
      https://git.kernel.org/broonie/regulator/c/6c45fd3e1854

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

