Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24F3CC7CA;
	Tue, 15 Sep 2026 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492357; cv=none; b=J0xeuudjIxLe6PhFHKDnS+vAq1EFUW9RZHpINd327WlYLk8PVGVZNSodd64V8PNb/dxFPdPZjfRcsdFojwM0M48fkR1hFiczpCmYAXmiHbwnbSjOgJbwbdMQ35LZx2Cy4t7c8D1NpFh8IxmVic3H4u13bvejqt6BroeXLfeV774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492357; c=relaxed/simple;
	bh=GTqazvYCcPJeD74DZfO8rcND1yC//Bo2ohe8JDKdv4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VD25LUy+b7mwDGgdDuxWgF402uax1zoQej6tjrPwe2XwYOfbpH9mE1IT5PCwC5nNUd0zldb/DmIqFAVm6E5Bp80IH7nzd3WBZfdhElKe4EaWN2qSHUJJ8Ja0Q49qqj6sIZRpFR7qz9NjobswrUHCLAVDjQgUrFkEdwHxkp8gxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LclWOJgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LclWOJgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E101F000FF;
	Tue, 15 Sep 2026 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492355;
	bh=4oNJhN4dtu+O5waoWkTE7D/IWivUyBKL0wFJq/5iKHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LclWOJgWHF/EmBn4ceEDh8W5qYgTCUHPUzIY50SaLlCWpIzwcGnUpgc9UbKpL7FxP
	 UEWc6/mYROJoKSiACqAH3wcoILGp2tmIwGUDhnNxrCTy1xM7sIC0dPrw4GWHXH69bN
	 6yxycrBLsf5KhHfd/LjCFhMqNm4Y3Ko0ATNjAfyj1gNbHgOWnCblC5XG0/wJyo2838
	 9ICJCG+ErcnDjFDA+u6dxqkdoZGIykLPgdJLJx4NIyu+MjHp6RtwasM3/9ObNS0JnD
	 8sqKpzkYJHluSIw4KNBbt2plGR45as4PiKEUk6a5Y/CAZQ/M689PDL/uVIK2MgaajH
	 z76YlDiwBuHrw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260915103121.3306373-1-rf@opensource.cirrus.com>
References: <20260915103121.3306373-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Add KUnit tests for regmap defaults
 table
Message-Id: <178948372708.151760.7628471833380828294.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:48:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GTqazvYCcPJeD74DZfO8rcND1yC//Bo2ohe8JDKdv4g=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGqpfIDIu0p9qR+cmMQfplha6bCmkmyYXceCvBOoeFTZJQLgd
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqqXyAAAoJECTWi3JdVIfQeWAH/3H+
 +o6EVf+zwliQPuglCVOM5olwztsHQIdKfBsMAJA7PqXohWQUt+n6OAtKTKhpz6D0Je5jXDw6No+
 rsuuSPCnzV5NQ9ek5B0uM9VXZLXUBhdDWjNHeBp8j7lg23m65j45DDMP3bucpyITaH7YDoqu8qJ
 LJPrUdX9J/5pxzdfvX5j9Ow5p/+eDpYXdL98WpUe61Djtm+k/fHyfqjueq0zoy9NZFaPeR1Dusa
 V7eUWEnhkUAlW3FZ58UTpqaBO3PTqwAPDRIhMmiCakOYfIYoNL0Rx915G9V2VXqWQ+mPWkx2r24
 H3AQTcyjmTUzKq+ovXUYbiZaNd+Vul5VCETkLa0=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 11:31:21 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Add KUnit tests for regmap defaults table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: cs35l56: Add KUnit tests for regmap defaults table
      https://git.kernel.org/broonie/sound/c/f4c49ebff706

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

