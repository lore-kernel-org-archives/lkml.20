Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476C420468;
	Mon, 14 Sep 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378982; cv=none; b=fx7akEoVdzfwFHqgUgVqIOzW8JioInuPmT0XCG+YjmH2mbWv8GjBjs982QgdLdoIT/BMCKup3Sk9r78ng7r1T/n/HsgZiYbW3hOt2q0hTuo1lY0OmncM1+pTwFXjS7+b2S4t0xeOoRNp4s5VE9isrg3ZkIEh+XD5NPaH9uGrQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378982; c=relaxed/simple;
	bh=yrgp0jevDLSo/M1x6boXH3B0C1S/VLcZWpsdmGCKP3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MT6PYHuAZ2JCRj5ntrVRFQh3TlrQFpkfuKC8V0L7i12nMLR3EAPNfoYw/NV2CQ+VBYPrbdn29xZUKNtdmyUL+/cC+efV6RqM8PQRTms2QuSLDzSpTCQRZ0Vcy0mm4cO9Dextt4l9nA1urFJNDM+6e9zFEjFiLmIIdQbY19pGifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W87sh+Fi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W87sh+Fi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D3D1F000FF;
	Mon, 14 Sep 2026 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789378980;
	bh=AWqe1dG3+xV6CWle+aq0k+0vePZMebxrBThPQaX+iO8=;
	h=Date:From:To:Cc:Subject;
	b=W87sh+FiPZsVZEsT1Dbrj0HHMGxGtvUjQJm9mqFNshhm5SlK/seUbPo82ABbW5Kmb
	 nJt3LqTynmdctxU2BtAYT5N7UrSQaFf/s6IzSkxL8nSjRUsJJqhhcmKKGzuSsKfkWu
	 +2gW+XFK8FHA7ogLyS0tzVt/WQnAgHOv5f7x8EA2HO5m9xEtT/reIjtXQuKo5co4/A
	 29CMTFHp6QYEvoZX0Q4vxwVesE6LdzFn/R5omkuYKmVAskrYpTe6BLWsL66RoEBBd0
	 nukkWy78ZuU5K62RJCVth2GrvKi/AA0zp450mlIv5J1Pmy3qXRjDQF2a8WYadbslf8
	 1fpZMl+v4XjyQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C55E81AC52F1; Mon, 14 Sep 2026 10:42:54 +0100 (BST)
Date: Mon, 14 Sep 2026 10:42:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the vfs-brauner tree
Message-ID: <aqfBnriiMltcIp9c@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  1eff23433e73d ("ufs: use u64 for directory size in ufs_last_byte")

Fixes tag

  Fixes: b71034e5e67d ("[PATCH] ufs: directory and page cache:  from blocks to pages")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'
