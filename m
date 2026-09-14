Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0735A18C008
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789363950; cv=none; b=ebPginZxXq4h3FUvD7TJY9mhvGljsaqwnjXewT3Mqsb51kb2s36n8fFmnvV3nnCta8RgM9VrdBzqIO2MpjvkVgj7nCjXQHuSqPKQmxD+cuNGA5HK+5vpUQzrOmpWe3+diF7dXniNDYM3VoPPZOXGarLYN/P0TyZuo4Xfih5Fu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789363950; c=relaxed/simple;
	bh=JLDyb1EJ9pEsBiZ5e7lfY4A4KF9zkpRjkgHJql1+FZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=utJXzW0uvFA1etEqnFq+ST0bCJFPRGARJlYx1A8m2bfTuov3DqoZISGxPw4PEV7FRRdYTuhquaLe0aRLANC3s0QNz79/C5duFVfvmVQw4YlcUYS+Xpoz4hJoWaWdPvgyHMaAbm2Qio5Osg96lnsKcSCww1Xkzk5szeYsvnEk0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=w85p4Pr3; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="w85p4Pr3"
DKIM-Signature: a=rsa-sha256; b=w85p4Pr3vyldw4Fn6aC2IMeeVGCMdPXlbQ6qMWqjfg6UUbAvjK5maYPauleA5x1QkmRZ1OmJFg50vk7V0D002rY1wM9KHAhXiAaMS5me4FCO5QfpWFQ6H+JHQVyWI286svJga8ljF4VlVmuJ8EVxxMsgY58eRmSzVnQCSJMeeimFGFyxKcQ++EIWLV6Hxzc8ggK2I3jbGyKcptpt5iImW9beQJbsXYB0TiV3aTcG75JAje/jIDK6hRpOQRWV1jImxy9FJ/T9rgaQeqVUarYccw9VuKiuWmMm/7JPYHkEzflOJVjMN4QYzbvDisg7UqBMUYgbopnIFB7+V71ePrVp0g==; s=purelymail1; d=purelymail.com; v=1; bh=JLDyb1EJ9pEsBiZ5e7lfY4A4KF9zkpRjkgHJql1+FZ4=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1229845082;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 14 Sep 2026 05:32:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1x5zIT-0000000Fmcu-3VsK;
	Mon, 14 Sep 2026 07:32:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Michal
 Simek <michal.simek@amd.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
In-Reply-To: <00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com> (Marek
	Vasut's message of "Mon, 14 Sep 2026 03:55:28 +0200")
References: <20260909182641.165383-1-marex@nabladev.com>
	<20260909182641.165383-2-marex@nabladev.com>
	<874ifwjff2.fsf@dell.be.48ers.dk>
	<fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
	<87wlspb50g.fsf@dell.be.48ers.dk>
	<00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com>
Date: Mon, 14 Sep 2026 07:32:05 +0200
Message-ID: <87y0d4v1nu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:

Hi,

 >> OK, but why not add all the referenced GPIOs if you fill out
 >> gpio-line-names anyway?

 > Because the userspace depends only on this one line name. But since
 > eeprom node contains wp-gpios DT property now and the kernel controls
 > the nWP GPIO, I can also turn this around and drop the gpio-line-names
 > entirely. What do you think ?

Up to you. I personally find it helpful for debugging (E.G. the debugfs
output), but if it isn't used at all...

-- 
Bye, Peter Korsgaard
