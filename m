Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614151;
	b=OyhehYO31ZHbb8bdVLkfCNas3Qyu2x4Pqq3I1pCPbSVSlzpvPuqOX93UR83qMKKaZXQL
	 nJX4UwSf/uWr6r0+lxTh+I+BV9uCbHASAlmF0ezU9kxCE7e9siVOJgKGAYecd0LsfPw5W
	 y/szEY6KKgW0BIOKuPYSokGj1h392VpFgldfIq9iactE5oqF9aXkb3Ni2BaALtZHdIOvS
	 bR+AUhlKIbildgV/59dEpo55ymjSqmiiSZCiQYG4WSnJ0Jtny6AiBAy4wNzB1vOjgnOui
	 gL+vwaXfVHdy0CfEgUi9qWkiR2WGdMuFG1j1zXlIvG21hfv6k+af1xAc77kJw0ar67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614151;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=AhmVF6xP7L02ZOn/A5X4vZcbE692f/yDQ/fpvt5dPIw=;
	b=vyDAuRVjmIkwAfXHw0dz2qS7/aeMLY63PKTy+Q6X1TRn7xmxxDsDhxS5iOkA1cntShaQ
	 8/BgyDBaMHxBWidJWsxmKap47iRiX5zETkp6W8yxkQ1rDTy4EdtAcSmOm596Yh7FrYf6l
	 JnidUIWtL+jwxlu0F/Y1bF70b79DXnpl0Q02bmJ9u27l6HxW/xCoFa6mnq13MYjAicWKM
	 G7ulSxzTbCyeQYhvBbLihGH37qQKq3LXIdlMhckHnmSEsWK46y/z6v35K2QOoczzdUpKA
	 rvwobiazdhD9T4Uqy0NkE3F+ykOJk0urQ54u+11pKsJ7q0olNS/6CxbxaZ7TzKsdCfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUGtCKR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC486606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUGtCKR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0805E1F000C1;
	Wed, 21 Oct 2026 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792614150;
	bh=AhmVF6xP7L02ZOn/A5X4vZcbE692f/yDQ/fpvt5dPIw=;
	h=Date:From:To:Cc:Subject;
	b=XUGtCKR5VWDDjSs/f0yXdVEXPoE+BfHFp+l/9K6AEGFYxZk2x3lq1sh8nde5hxcIr
	 7ZKiWKV3qHIxTtJikv0YfJNstXIpufQ8TdA+/hLEOBkkdjvmBLhhs5OP+lCM2hXhQ+
	 HKGh2PlBgsf9ZXYfSU77cgE89LMj26KnwGUfgPOVdP1pI3lw+I9/Bu2dUQGbUF2abt
	 2buWXw0EDiXMCjltkbsVC21FAtzfqK8DfNXejAfJq/AiM1B+qvE02wyPsHvAXCdwL7
	 KM6QznSXTt6xD8ZmDuMVh5tiGjo1cMSewAt++RIV4uLQh5kmj/mZ2GneMWNJexX98w
	 3bFkq8/KnMf+Q==
Message-ID: <d7086f73-9398-448a-834c-69e2ffca8563@kernel.org>
Date: Wed, 21 Oct 2026 14:22:14 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Shuah <shuah@kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: "conduct@kernel.org" <conduct@kernel.org>,
 tech-board <tech-board@lists.linux-foundation.org>, shuah <shuah@kernel.org>
Subject: Code of Conduct Committee report for April 2026 - September 2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Linux Kernel Code of Conduct Committee: September 30th, 2026

In the period of April 1st, 2026 through September 30th, 2026, the Code
of Conduct Committee received the following reports:

Reports received: 3

Code of Conduct scope and enforcement related reports: 3

    -- Publicly coached and educated an individual who wasn't part of
       the kernel community about the CoC, advising them to follow
       the code of conduct when they interact with the community. The
       issue was resolved without considering other enforcement options.

    -- A public report to the CoC about technical discussion was resolved
       on the mailing list without any response or action by the CoC.

    -- A dispute about copying code had been resolved by the maintainer
       asking the developers to resolve the issue between them before their
       patches get reviewed and accepted.

We would like to thank the Linux kernel community members who have
supported the adoption of the Code of Conduct and who continue to
uphold the professional standards of our community. If you have
questions about this report, please write to <conduct@kernel.org>.

Please visit the following Code of Conduct link below for information
about the Code of Conduct Committee and previous reports:

- https://www.kernel.org/code-of-conduct.html

thanks,
-- Shuah (On behalf of the Code of Conduct Committee)
