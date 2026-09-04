Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF148F837
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788609587; cv=none; b=RxQV8hvv93fnggTza0JNHw56rZoTR4I9Ko02zPxl1EdKBnxqUxRp8EgXU6y/9fhCgEbnfm1ZZsEgPtx7AWiWPpf0Fdoa7fGm8tkSTK/v5HUuhWaW9DNwnz4uhoLNhVzgabsKa8rcoUTJ7jKeg+tfLYqyFA67tgHENpL/mXtYOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788609587; c=relaxed/simple;
	bh=XT7E//dTLWPBfUSpVfM30s9mfDxwFESeXlfvPteTca4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qpFuJlHas0d2+1KyR1UX5V9khTeeiEBykH9SybJpojhvGAL7FHOT6YVkT5VedogRJvIw0hjaGv1wwYjIX1bOuSHta1XSEMVDOMlOFZ5V9iTjJKnUkzh0TIqXJJPH5+L+NfL+ALGliI1zx3/uFbKzyn5JJFNcoDO+h9Wu5ueg5LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqSnL1pb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqSnL1pb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EAD1F00A3D;
	Sat,  5 Sep 2026 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788609586;
	bh=fMibZs/CJAn8/eoW0tEt2cJ2aJyQg52G54B7zgWTpeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aqSnL1pb6d3NgTSEmmjkAkeEqjhpN0EVio5WeYGkHhPesAsmJ6lD4jfVfys2NRdYc
	 F7zYXV310hfq+HScrfgpZb1ish7PJP3X9mwCsTWQtz/gU3G5gS4pn38wDZLYx8p8zK
	 TdPaCp19XwUwWQ6s2yQzyDBDRKljlonZmXrdUI+x1xdu5pSV8ufr8mIb86gJqzwZTU
	 DmQOxD2aq835bcmJsuyzNYvcCio7wyMq3+NNdi9zXq8V4hz4zCdnYUeJZQ9tkumifX
	 QQFCJxPpZZ5UM32+OoCKLddJRk/xT1gCBdusLSUp5Ij9OerbTZj+gsHbPkP2KmjQ1P
	 3hAKCYy+0YcNg==
From: Mark Brown <broonie@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260904110203.10113-1-hemanth.selam@gmail.com>
References: <20260904110203.10113-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH 0/2] regulator: fix typos and repeated words in
 comments
Message-Id: <178856110318.692981.3748064215905054432.b4-ty@b4>
Date: Fri, 04 Sep 2026 23:31:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XT7E//dTLWPBfUSpVfM30s9mfDxwFESeXlfvPteTca4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnAQuGZjq7xNCeB9Ty+Fs9+TT4UOo9FS9TS71U
 tLXEW0VGt2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapwELgAKCRAk1otyXVSH
 0MfgB/9YqGNcSbN6FTU/mUIgnt8o7XqDqO+TgnqoEgwCm6uoSfsb4etULBlYCTjduVR54ReTCQS
 zJoIGW9/rG4vQwFoJN2yF6fS2flOWo0k/m4bhVng8wCmC49thxg98LDt2Wu5sXpVx4ZoTAVXawm
 wZ3sgJrXLJT55auMZWxCx/rqjBhj/ETYXI3Qkp6o7KAIo8IOT0UwX3OZe2h9tbH8KgZ1faQM414
 0I533HFrPfO3V0zuDECrrSsXCUr348gG5s8g6ziKQYteHVRImaVj4cLsQz7KJe6tR+mMKrXO66c
 w93vVjfbRnQWl9NlQZaFSo69faVR9+2B/vBk2fibz6Bvi96n
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 16:31:59 +0530, Hemanth Selam wrote:
> regulator: fix typos and repeated words in comments
> 
> This corrects 2 misspellings and repeated words in comments.  Each is a
> separate patch so that any one of them can be dropped without touching
> the rest.
> 
> Nothing outside comments changes.  Every touched C file was checked by
> dropping its comments, replacing each string literal with a placeholder
> and collapsing whitespace; what remained was identical before and after,
> so the compiled code cannot differ.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: fix typos in comments
      https://git.kernel.org/broonie/regulator/c/f267ad84f59c
[2/2] regulator: fix repeated word in log message
      https://git.kernel.org/broonie/regulator/c/63ab1abd01a1

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

