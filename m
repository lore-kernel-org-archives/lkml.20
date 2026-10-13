Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F9847D44C;
	Wed, 14 Oct 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973707; cv=none; b=QFhCsikN5t81WtguL1oq7cGCRY12Yn+HYHUbPwKeDZAlNQ9Rki9o6rPbpGAl+3/FduV4yoGxlWKbsLgyaf2mdgsP1siSN8AIgOY/W5fD9G0k6b3MEtWljzLp0y3C/pJ/gSmss7yx90NpPvF7tO5nNQTswoDrzuZ5g8Ev9edHiv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973707; c=relaxed/simple;
	bh=gLXFpV/UlSmNQkqR2Rdz3HkhcsW+kLh1NWeSv2ZMPtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PAeU3YKYBrVwvQGwFqlsVCClIssHeBs8sx+BiQ6bW8sNQAQ8Zk+F2c8Bw/LJHe2UX6j91JtHi6R9tuhYhwq97t5rc2NtepAfXR01UB0k1SHVEgFDYwE8ZtjbXYqQmEHJGCZC9ZRWnyRxJISJYmzXXupCT5HHAjNW2b9hI81l4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P15UsQme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P15UsQme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787F61F000FF;
	Wed, 14 Oct 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973705;
	bh=g4I3kZoi15a0UkSM62MyWrUzqeI7cpQOpRjyqBPRNhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P15UsQme0YnqBoiYrmd+fcc97oId+yeim30d9o63UttqSuu7mzASNXMcdQtU+uBLj
	 eFfWPhIZ/wWk4OO5jHI1kTUUmU+f0LXp9YmUZBIg5QEtnSDPfODpwNakYbG01yo9jo
	 PQDRmCY8ytwfXEQMQsTrs0K5yl6kTdDlaOTW12BW1GvzGxJSZ+IU/wEY29i/Kh+UIn
	 kv957f/NB6AyHSIggC8YrT+EAcJr9JymcZWOlMCP7G0SkxQfOLz0+hkshdt3McI6IY
	 Kb/fTlKASWVuk4gUn1EXpA0ZpXi/3xL+/8YHXOL8VFh+45R+e5Gl2OvOyy2HQldUve
	 R6/8NscskCr/g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zain Aboobacker <zainaboobacker33@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260926162533.25395-1-zainaboobacker33@gmail.com>
References: <20260926162533.25395-1-zainaboobacker33@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: nau8825: fix typos in comments
Message-Id: <179192410550.1606900.6359582118153179405.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:41:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gLXFpV/UlSmNQkqR2Rdz3HkhcsW+kLh1NWeSv2ZMPtw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOR7pN05E7UfjHiF9G9/q7kz82LjB69PXOg4PK/3Pff
 bIpf3P6U0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmMlGBkeFwxV3P4DkHfsnZ
 Wa9umqN5Nvvrq1sRUb+7RF4acW4refyJ4X86x8fvb54fj/D5cCzLx3bjm4ePFNYc9msV1zFb3yd
 TcZMBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 26 Sep 2026 12:25:33 -0400, Zain Aboobacker wrote:
> ASoC: codecs: nau8825: fix typos in comments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: nau8825: fix typos in comments
      https://git.kernel.org/broonie/sound/c/20b2f7f75623

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

