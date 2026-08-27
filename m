Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACE46F495
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837021; cv=none; b=XxKznXQITbT0zmUcjrD/atTp4KJHOb4H4uccZShsp5oioQUkU3ZBedKFL5yHOk5++nWPzFpMjc7Nf6h4z/6+998IYbdp3V/Pe9Dh/D8ar0CMZywBD9pY6juoPCfy4oQ7RTLz7KSfwfvEHQYy9m1sXquyUe6KBFoPWctnO3Mhz3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837021; c=relaxed/simple;
	bh=Z4V9L4f2EvO+rQiFAjfvuaH1AwCSb2Sgoy7toF63Lfc=;
	h=Message-ID:From:To:Cc:Subject:Date; b=Ecaq8M+geD03/rJnRPjp/fQIvUHCE/b1CkkmK09bF5Z7YXcBqdHl+Svgh74IKU2aAQYfjzsoovKPR6VYxm5Zk9pI+J4QREx+4eXhnAA4esZdr8QAC6OBQdDfRMXiT5+DgWlaK7WUqRq2T/T9E/FcP8qQmwlEb2ZU6vBlgNL5FrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVJ284L4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVJ284L4"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 990CF1F000E9;
	Thu, 27 Aug 2026 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837009;
	bh=W7hRIVWkg+7WULsBW/mDSAk2ouIQ+FxYJORh7pmdna4=;
	h=From:To:Cc:Subject:Date;
	b=UVJ284L4sI+EOSH6ffXeff6QXfFUqiVy+Pr3PTgqtOvbv1+IuVxw/JUHOqUUFhIcj
	 jeeigNA4YIkas1tsY28QB0xbNSJLQyOsAKWQiiLy0boft7h73KXLf9NZaPF5IAcmC3
	 /TZh/35Hb7rHo2aGpywvVzTuJ6xkuZPEYXSDrh5yVxLyE7Hh884OKypu4+rUBmqNhL
	 uJZHwngoJwXsBN5CCpfHOGcB96QLLPZ9J2eEJ89JC6DmIPO+7KyANFO1z+fbWnFCOp
	 uywtzifN8sLjwSFrBGb+07Hv/tgowgEBws5pCqi9MsFO9PSzfk+wcLEeNkYlewEXp0
	 YjkHmzZMZ++3g==
Message-ID: <3b632d103057ea6801fc357dda0384fa@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.3-merge-window
Date: Thu, 27 Aug 2026 14:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit e739acbe05b06de78ef7089470f122432f651faa:

  regulator: fan53555: Add support for FAN53555BUC23X type (2026-08-12 17:48:37 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-merge-window

for you to fetch changes up to 44f7b876b7c6c7b3a219b7a810d3d9548df21540:

  regulator: tps65185: wait for the IC to wake before the first I2C access (2026-08-17 17:58:29 +0100)

----------------------------------------------------------------
regulator: Fix for v7.3

One fix here, for a race condition on startup in the tps65185 driver
which is seen on actual boards - we need a delay after waking the chip
before it is ready to talk to the host.

----------------------------------------------------------------
Mario Rugiero (1):
      regulator: tps65185: wait for the IC to wake before the first I2C access

 drivers/regulator/tps65185.c | 6 ++++++
 1 file changed, 6 insertions(+)
