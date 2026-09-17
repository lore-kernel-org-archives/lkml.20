Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455E547060;
	Thu, 17 Sep 2026 18:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669944; cv=none; b=CXI01J3yM6emEGDIjmZoaLQbUc/WJ193RDOF9hM0XRKpUTUalnhQZgX5pBnQlVbT+KiVoGNs7GXb0X3Mx4xEsyrgmLLsbsQscjlDpXSEr903k6S5lvQihgY79eSw6xP1phFpAMIMo9hBluHV0EQVQIfsUt90SU+C7cWMmLXR+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669944; c=relaxed/simple;
	bh=av6oHiB07u0dOlAezwyQn+RDfiK4cwX5FOidD5R1lqE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=AUGnUoqApumEit5d7nNA8vFJuQnwlUOZCNHwLiVXN5QGOAAm4SYQ06egTT3twR/9qd7AZIJkL4VU5EqToUrIWyaggfRI3u5QjVf2QhAIswNwnAvaVLmXs8UevLKzIOTb16L6Nf/51HyqjvTzrEKolPBi12oPBHtvAjX9pDVp8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkBxTOKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkBxTOKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F611F000FF;
	Thu, 17 Sep 2026 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789669941;
	bh=UXi2A6Qf4iA+ROMJgAhj6M9jt0iPI0x8ofBuQaz4SiE=;
	h=Date:From:Subject:To;
	b=kkBxTOKS0D330BZlemrn2H6iGY3HWXOSaJmgimaqPlnTKl3KZj2pwU3bYn78jIhTS
	 hWHNrMKvIgeuYe9F5bAwqZwPARTBFWmwF5zxwQ1Bk8cPbSeIk+/+2SLX8hyJyTXoWi
	 MJ43bMm+r/MPbbepFg54/yjeqVE4wKC9MX6xsaftJsR1YuxY4qaNfiIKNo9ZIMXZuy
	 zb+e28kj38Umj41M/kSZ+8YKftELjp/dh+LRa1M0P02BKkcAUYoI4VslOdm+7Wgl6+
	 fIxBjhBxVkq2ALPuuzPfPsNTzu+/SMZh3lWW8KiIvsKvSgQ+U5u9mSMYWZwjprxUkM
	 2NaEqcq0GAWNw==
Message-ID: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
Date: Thu, 17 Sep 2026 20:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@kernel.org>
Content-Language: en-US
Subject: 2026 LF Technical Advisory Board election - call for candidates
To: tab-elections@lists.linux.dev, tech-board-discuss@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 ksummit@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The 2026 election for membership on the Linux Foundation Technical
Advisory Board (TAB) will be held electronically after the 2026 Linux
Plumbers Conference, from October 8 to 15.  This announcement covers
both the call for candidates and the details of voting in this election.

The TAB exists to provide advice from the kernel community to the Linux
Foundation and holds a seat on the LF's board of directors; it also serves
to facilitate interactions both within the community and with outside
entities.  Over the last year, the TAB has overseen the organization of the
Linux Plumbers Conference, helped develop the Linux kernel's project
continuity process, advised on GPL enforcement developments and the use of
AI, worked behind the scenes to help resolve a number of contentious
community discussions, worked with the Linux Foundation on community
conference planning, and more.

The public minutes from TAB meetings can be found in this repository:

    https://git.kernel.org/pub/scm/docs/tab/tab.git/

Note that there will be an "ask us anything" session with the current TAB
at the Linux Plumbers Conference; it is currently scheduled for 09:00 AM on
Friday, October 7:

    https://lpc.events/event/20/contributions/2406/

CALL FOR NOMINATIONS

The TAB has ten members serving two-year terms; half of the board is
elected each year.  The members whose terms are expiring this year are:

  - Kees Cook
  - Dave Hansen
  - Shuah Khan
  - Miguel Ojeda

Further, the term of Dan Williams would have expired this year as well.

The members whose terms expire next year are:

  - David Hildenbrand
  - Greg Kroah-Hartman
  - Julia Lawall
  - Steve Rostedt
  - Ted Ts'o

Anybody who meets the voting criteria (described below) may
self-nominate to run in this election.  To nominate yourself, please
send an email to:

    tech-board-discuss@lists.linux.dev

Please include a short (<= 200 words) statement describing why you are
running and what you would like to accomplish on the TAB; these
statements will be collected and made publicly available.

The nomination deadline is 17:00 JST (GMT + 9) on October 8.

VOTING IN THE TAB ELECTION

The criteria for voting in this year's TAB election are unchanged from last
year.  To be eligible to vote, you must have at least three commits in a
released mainline or stable kernel that:

  - Have a commit date in 2025 or later
  - List your email in a Signed-off-by, Tested-by, Reported-by,
    Reviewed-by, or Acked-by tag.

Everybody with at least 50 commits meeting this description will receive
a ballot automatically; they will receive an email confirming this
status shortly.  Eligible voters with less than 50 commits can receive a
ballot by sending a request to tab-elections@lists.linux.dev.

We will, once again, be using the Condorcet Internet Voting Service
(CIVS) https://civs1.civs.us .  This is a voting service focused on
security and privacy.  There are sample polls on the website if you would
like to see what a ballot will look like.

Please contact tab-elections@lists.linux.dev if you have any questions.

--
Cheers,
The LF TAB elections team
