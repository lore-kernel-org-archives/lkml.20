Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479EB43F08F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279250; cv=none; b=RMlR2c8o4HRlYIa+qTQoQiS9uzfZ2hGTmImOV6xtXw9eSEHYIQ5oEg98I9CeaeBJRu6B6mQimsusUc09FQmVT+U+heUJPLbFb7h+pJuCopvQ4y2+UZVXkT6DRvolK/b/PnBwA88dxEB/4/eFxy8jAt9sVTrjVL7BwqUy/2Wm/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279250; c=relaxed/simple;
	bh=5Wo1a55sT+68wdR502/wwzqp4Mj8TenlLNpZ6RFsgBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XhPmqSV/PF5vNSAzMl1jyyeTlrymzWx/0PT2+NjbK0mEj/C4nUV5HUiKqpiZJlz6EqL1DQ8gY3FqHflhEUWDYSdmJbT1DdOTZA1q+V+8gj+KSpdcA5ddx4HaySM5Ss/OUpXHNYrz3tvewA2D5YJJkhNARY3eU17r8XtrW4RK0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UskqcZsA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UskqcZsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E718A1F000E9;
	Tue,  1 Sep 2026 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279248;
	bh=I3XdJCa1055P4w9491qAcB+9c9dhLCsVWqFbJHdefiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UskqcZsAEF5otWRIlmyF9yZnTfQRebJ0i1sh73PEPDPfpr3E8bF5/BOGEQyd8C2y/
	 wMfWg7lRS0YtdPcebOhIbKYF4fLGOVm5K3cUbcyN2mVmORmefklpk8hhDQNrcDU8Yz
	 EeVXMr/eql1ZArJ9hlMoGnbW8e6nFdy5J2ey996r8bIRZHjCLkZH126cL3ZytUCqxv
	 eGUWz2eyjktYMEm9+lvPMPyv14pRb6x1L7KFsoit6R+9x2yvn4ZivmBmFumIztFpg2
	 LAE9kY1fTGjuJly+HPCkEiER9O3LX2nbhbYCOIUTtqScdkE7rrP3FZusTAvG2HCJnd
	 Hb7mToatrc4KA==
From: Mark Brown <broonie@kernel.org>
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: lgirdwood@gmail.com, rppt@kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+bfc9e55cf4f98183c636@syzkaller.appspotmail.com
In-Reply-To: <20260822065519.112441-1-chandradhar.2003@gmail.com>
References: <20260822065519.112441-1-chandradhar.2003@gmail.com>
Subject: Re: [PATCH] regulator: fixed: reject incompatible platform devices
Message-Id: <178812972973.13461.8357014959182024338.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5Wo1a55sT+68wdR502/wwzqp4Mj8TenlLNpZ6RFsgBw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlvnN8ii2lhsIbZbOqqzxaFQ5HIXaliLGaibgi
 gk8Tgx3FkGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapb5zQAKCRAk1otyXVSH
 0OJsB/97gCb2rDOv+xFV/l5/IPZJ/Ww+swRsfpNWkGRMnyjLlAJiMKupDr89IS23Xc8BhEdhFo8
 psmztQLs6j2IJML3gERlW/TMU6TQdjLvNu7I+Rl2H7j8cNrerqjDHDiFSgzl0TSQEgVd3gyYqf7
 +/e+OnbNFVIthuEpjh0h3tSFIsCeN1ISyzISykGbmAe38qHVsOVxxWRD/p+nYrWVGt3j2ZhCTga
 caflnxN298O1clGbUvORCENcYp5VFCJ96vKuQD3sv2yMssIcrPhqJ7h8DH0D+FymDTgDdDZFM/J
 ubx/GOrv/K4g0H8jr9851H+l6ncZquRBEmgILf5Eovz2fVR9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 22 Aug 2026 12:25:19 +0530, Chandradhar Kumar wrote:
> regulator: fixed: reject incompatible platform devices

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: fixed: reject incompatible platform devices
      https://git.kernel.org/broonie/regulator/c/f7396c2dbbc1

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

