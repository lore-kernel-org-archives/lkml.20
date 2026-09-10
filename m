Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B44A0F04;
	Thu, 10 Sep 2026 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048015; cv=none; b=kXxGeGJyuorPG9mtmEU8CO1GMOA+u9rrdWoWJqXXWGF+4r3MecM4QZ5cLmJLnTgmQCRLYSARYqXlsznxxyQJep/YcJfgHMGymzGkVzZkQyzTZLj8uRvE+hQuS3Y7Ye1ST5o5AHTa3bfPTdXE6qLxdvKaUImzQTep5JR5QeqJBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048015; c=relaxed/simple;
	bh=zp0vMm1cAsqku3DHFYjmMwcyBjViFOpb9TZJa5w9lhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QT4axsH38T37n0faqkumXUNJHspAetKRsQVql2lgTd05/bOBJGLqATpHwoXgioMDEdbr6vVtdkk4a+DQ41Yv6baQm2/rxbFA7Ko6UpIklVvUozUh1jOXp0zNr1Tr3ObLetHqMNkIlDNuaYIRIZBVcFsVn5y/pu6OHBE1/PEkqi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vd3L/QxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vd3L/QxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4563F1F00893;
	Thu, 10 Sep 2026 13:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048013;
	bh=z7jcoxFrCKiBj3jOW+wyRbKS7zaXmwUihhbPAfgNpaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Vd3L/QxBv0o1IcQeAU4bCeEJyBHW7Ck4QhccH24M5XmhOkjm8if/ucSD0oYiDiM6n
	 kWg1bAHtSBweKiCmpxB6W+1jUwrtYJe3HXFEZloIPGyThQbGJVTiCv1S8GCgvpYuS2
	 f9tABorNwQs4H9olNKgavjdohu4wJ2LeAXGoRPbh4Nw6dDzimc+j5qs1aus0KhlheY
	 ZseZlvhmfqG4zTHVFcnQdB4Jo2EmawFhU9iWD93LVcq/zygOC0KD1+j7r8+KCbQuRl
	 wlBBus7v/qU+LmZn0F2JeOjEgK3vnTodAqRP1d03aaUGPzNVfG7TsDlCeIzgdlGTNu
	 7BJKAebq3Z2Ew==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260901151417.2546618-1-ckeepax@opensource.cirrus.com>
References: <20260901151417.2546618-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2] mfd: cs42l43: Add support for new cs42l44
 variant
Message-Id: <178904801199.1156720.16600330389184635904.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:46:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 01 Sep 2026 16:14:17 +0100, Charles Keepax wrote:
> The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> for this new device.

Applied, thanks!

[1/1] mfd: cs42l43: Add support for new cs42l44 variant
      commit: c34a67075946407d6dc6400a26f6c87a3ff9ed52

--
Lee Jones [李琼斯]

