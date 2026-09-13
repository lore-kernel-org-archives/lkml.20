Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644742E401;
	Mon, 14 Sep 2026 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377824; cv=none; b=mboBOtIaGyQbPw9J5eKl/gIt8PeHW0pc56C6EaXIIVDDsxIIgTrSGuNizokjIdw/IYIs0RmsqhV4Rp820pqTIdsAAWMmy0LECpDwHTW5IB+KChO5QNnF94/ybXXnhpOm0H12X3lqvW6XBH59VchChUet9R4oDP5QN5UgyCDleqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377824; c=relaxed/simple;
	bh=ee8dahDJ9hEGj0OepJiXD2XPmZ2PEfSyIduNA7O1ZUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mtPt5j0L5Qwcu9buclJh1Zrb2+knuwPaH6bpvJI3Bm+JSiPANnlzBILva67grjjR0HVDmVU5CTac/3Niwlrqn2GWWofBiN10c2rIIoWx1lcw+0qQLxjTu3cbEv105OckBY8yPZfXm+IyLVteiKsN6KnCEzKV5rCgH7CNhpK33jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ov4N3caw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ov4N3caw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196531F000FF;
	Mon, 14 Sep 2026 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377819;
	bh=ipXYc0FwIZTWEWsx5UvxCcgri5Y/7MwkZSrdnly2V7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ov4N3cawHywW0LJq/j9Iov8tJVBklq8InI//IcVFsDMuGYXlAznrsDh3YF6H6khdQ
	 CTEGQzvjj3ng2foR76LZpGUzVHmyNvNsl6Dwi3rSzQ5plbY20/U+FlJmGCRKbDFLNA
	 xVvtnZly9rpaU53STLmhDwOc2Oye1lYMwqVY0gaNj/ft9Cg5A2i03CebkRXxVg6Oq0
	 bhRc2IvPymGT8lN1T+bC4NoU4rMN8dvFoKXWDUR+cHjTWigVEDXIJ499kUGFjLMZNz
	 3JmXj77/NrJXV1P2qrW9itRmzbqYRFAyplPBj3I0SHLYVTiCxoWOz7fuE9FotgqER3
	 DNU3+ubShddyw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260910121047.1592541-1-rf@opensource.cirrus.com>
References: <20260910121047.1592541-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Firmware search progress log should not
 look like an error
Message-Id: <178934211063.1239410.2884150749674926121.b4-ty@b4>
Date: Mon, 14 Sep 2026 00:28:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ee8dahDJ9hEGj0OepJiXD2XPmZ2PEfSyIduNA7O1ZUA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqp70W87XF97CyUoXZcUgEey2UlXTl9pxj7AyNP
 vskYQT8BUSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqe9FgAKCRAk1otyXVSH
 0MsHB/0U+tIKlNy6xt8ofBfBsvOqWe+Vq7zPmE+UW/W7hCmnwfF+OJjOrXUYZR19iyoqDa1LpQu
 1kM8HVQhNUklRV8xN16IgrdPs+idRo4SXMhuQ3QtBY+447LtKPTD7SgplINQ9J0noUS0Tq/9dNA
 p7GTuVA3yDv++PH70g1jcP6Dxc/Y8fOxWEaoU6BBLGvdh6PFtWBpdSJhMEK4CvKiNUXyDenlKgH
 ataTIIzhGFzVQCpPc39U8ZsXVOv2ck8TvlnPrhzp9tGhgCdJnec0iyYoJZvZnUAq/JbqfEVbiw4
 AXU/fjjQUH9iLouxSjauszxjyWgCCTcXuloPo7DIweFozLUR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 10 Sep 2026 13:10:46 +0100, Richard Fitzgerald wrote:
> ASoC: wm_adsp: Firmware search progress log should not look like an error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: wm_adsp: Firmware search progress log should not look like an error
      https://git.kernel.org/broonie/sound/c/88c4aff39452

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

