Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815E2472B8;
	Thu, 10 Sep 2026 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031909; cv=none; b=oPGk4RzfKdcOQ1uBQIwiMm1E/mtMObZMqneB7FYtcIg4GuYhRMi6ijO1hSao79iNwNGLJReH5JOR2FxHf74S4f9JewHgREugMmNpx57uiRpqu5GRWga/pVmKGgqYcpY5dpmw7d88DExUQQsFiZ+4iUzATp9FIXbpTLGljLyv3es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031909; c=relaxed/simple;
	bh=ih/0eGwjP3pa1Zvf36/JO8P/s6JLnhXll9CcTEzBzoI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=naR59mKrtnnuF5l0G2sQZkYtoDeiZ6QgSEoGDa2G0kRdnzCrCzmqVpkS8MoreWs1MK065AV7rkVWFgXu7irxjhR1gtul6pbND5Fe0Rw/xZ699xsBgT38snXgG8bXbPkyLum+mAdsc89K641m3hg0YxLqNjglmC0ViJ5JxkpMFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QvOPFH/e; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QvOPFH/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789031813;
	bh=ih/0eGwjP3pa1Zvf36/JO8P/s6JLnhXll9CcTEzBzoI=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=QvOPFH/eoXFBg5wpEP5xkuYBA1QfVsRLAkP0bIyUCaaAFS/ha69lNEQ5dmAly+on6
	 13EwR+x0E/EpYyNgEcPZke3djZL9g48bun4CL9V14i62HWxRzbFL0IOyNbv3ATyCM7
	 knkpUXpXp6s7Dlx4WNzzZPskKTKKQBV/0muUooGE=
X-QQ-mid: esmtpsz17t1789031811t85cc57cb
X-QQ-Originating-IP: 5xsPgH5p3GdZzHV9+PFDaz/dFOGWwdmzJSnDK63Zh+M=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 17:16:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17548016533415801729
Message-ID: <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
Date: Thu, 10 Sep 2026 17:16:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mayuresh.chitale@oss.qualcomm.com
Cc: adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup.patel@oss.qualcomm.com, anup@brainfault.org, atish.patra@linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 irogers@google.com, jolsa@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mark.rutland@arm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a
 component path
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MDqtQ4jGWXAGRFweJ4+KIaJ2wkHaHO5sHVZyAYiQfHh2TB3aeqHjsFZI
	O0aL3k+XuiGcPbSHiJ5aBHDTpk55vwjQdHPewm12j+vJW6WPTZK3kcKjsKC77rOnjVEpzBa
	uYz045zZPr8CWj7tAumWktfGOUTk9c88Cvx9t105M/P1mA40HjCV7DDFLpjxGUGR41sojmI
	J6rBxjqVMxiI7j088VtEXbgCaaydkov+9zXmtv0jzGns2IKLijG1TNBR/RCvI92lYhLrkbq
	5+llhdKm2dZPRV+xG370ZJLUXV3GZwHWB8JaUkgXNP2AUQEzeB0N1H9MJubkFUmmH9rnOVy
	Qk9G+K/VpLDIB6/UL14yTSCnyDGbUdHqY4EIxhRM/EZKQDOdNkmvxp+8sPQjcDmaJ2PeNMy
	Er2IRdAA6+4O0z+0hCDwAOtiascGeMMqWeqYPHKmljn2LgKSmDWyfarf2CBBWYaHN9dUfcJ
	idyVrTg1nLA4qilQOyUEZ5pkvdqZC36hI7h1tVruwpHtxFtrnA0hOEZJJSoacbzIzLvQqNE
	qFk81YL7pjfBdv2Uo7dr6VGO8AOyReBcmqK/uYVyM/tEPYguk0tjJk1esaaaSi6FoqjYdkE
	pe2HV/63FxgXaZ3300Kfaey8xtFo9Gu/uukSuiQCVPrEWkBI6Le8Nc4axoQe45EaDw/Zy0D
	IG290z+TAOwZVzKqwQ309dTzoskv6oOc80mv09Fpt0cqdHq4IBQlg4G8TnAy8HtJASEdoCd
	05fGMpVlrnp5oyykv8BRcKyi4yTTs+mGdxN1kuWJ9yQiPns5z/MInpJcmJB5+jQSFg1Ps0R
	7FngTg+BN2ifrUym+gCYz10ls9q/8emlC7h+KqT7g86TD3Qe5uxZSCzhSp1ObeleAyWVMMg
	CAzaWl2GBsoPhYA6Rvk0xKtXXVBanV+k4MjZye5Rfm5iYrX+87ldidGF/3Jk6qFbSAhw4Wl
	HY0HJjT2eqGeQ+k7X99mVmjruKtNignpsInUpCdEYtcgC0jo6hpuLG0t3MkBEzgqrKfM=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi,

It seems that the scenario where multiple paths currently using the same component

has not been taken into account here.

Regards,

Zane


