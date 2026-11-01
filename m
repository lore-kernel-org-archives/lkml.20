Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494585;
	b=BckrkRjV4Y36vKW9bXYKKPbepYbGbEEiJn8F4caK4iG4MIYTCmp/qOHVCm4hr89oBygW
	 xrOmzr99S1fvCu21+H/sWmP0zPTpnrBPobLYqRYOY0ypE5NLya7wSG8nuHPn7ccQpJ2Q4
	 J3lZK6AneSyPiDasyebSzbcK4hVwYBf4y/oQB8Oy7qoNUFvJoQ/9q0if8l1SQBy6Q5cqk
	 LirowffBYp78U45YjLJSNwCZ2WWOyC7rfKLEG80+FGQUumLQaeLxtQCNCGgCDa5ECdg/C
	 7ktgs3OUGE7POM9HeHokY5R36SaSA3d03/z+sOeHsvjJMn7k9qxrJz7UDPcYjgjKjxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494585;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZiRpPj0MaBPe2vdH1czzEzNYv/ENF3/wS/UWOhDJscM=;
	b=ZeaMXyoqPWlzISmW11xTUI4TOI8SLvTHZH9Cqb4PN2KX7XUC5bUFNtuPGUNqWyWnWIrM
	 2Py4AXQDbc8fN2RYr+rhMOujDC9b00elv1jrlErFNv+7JJl6iZq5sY6/rpWB7VfQ8rMhR
	 RYEDN2sReGnM5DeL+KCXIhhojVNFmo/IkZAlNhtG7xW5mvKCOcjmWnxZoAWJNE5w64Tyl
	 DpmMzx62728TiSJKOpTkGdVMr+ikrfdEpQRZCHBpxyGptToe/xfiQY3LJo50eAPxHhZKl
	 kf0q+69GW1Z5CQqObKVJddlG0RO4ni8JYZg8u/GmZPXNmW9C8tiethDP+w5zxnl9nmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="DPGwite/";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=PFki5LJQ;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD086606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD086606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=DPGwite/;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=PFki5LJQ
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494577; bh=ZiRpPj0MaBPe2vdH1czzEzN
	Yv/ENF3/wS/UWOhDJscM=; b=DPGwite/Q0lEg9peHwvhN7wdHZEKVDnNRWK4OXQpJE9VPGaakC
	2iUOI25qXMEqjbo+B1WTdFXYCbhWkrVp8hMGaEqkkLjFkwdcyKG2CMa2BWOqw0R7TJfoXmNSVKZ
	i5K6ZSNvbPhMwrqKkvJsbw/aI+FRlL1U8cbk+qLiL2wwut4EXcpfpM6IjwGAhWIOVadTxE9rsnJ
	un/hDYe5VDQhSQkBOssjC5O1h9nTK+i1qpXJ+J0dwgy8oTbKJX0DlI+EDiilpOHEfxscLZAVSsM
	S6UgDgNgh30vY6eHXQxHS4jx8LRv09cBZKcYQV49cF2KBkx2MRnxa9ILplk0LVe20kw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494577; bh=ZiRpPj0MaBPe2vdH1czzEzN
	Yv/ENF3/wS/UWOhDJscM=; b=PFki5LJQRCh8iVR6+NAAaRXiiu0Y9WKJu2UzjWJQf0Vfvad2G0
	vzsE7pUtQv0aFJMH9dK5+iVTWTLKiT1kwJDQ==;
From: Bradley Morgan <brads@mainlining.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Bradley Morgan <brads@mainlining.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] taskstats: four more tidy-ups in the genl path
Date: Sun,  1 Nov 2026 00:56:12 +0000
Message-ID: <20261101005616.3022705-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four small cleanups from reading kernel/taskstats.c again.  No functional
change in any of them.

Patch 1 uses nla_put_u32() in mk_reply() instead of open coding the u32
attribute with nla_put() and a sizeof/& pair.

Patch 2 grabs the inode once with file_inode() in exe_add_tsk(), which
walks exe_file->f_inode twice today, once for the device and once for the
number.

Patch 3 reads the cgroupstats fd out of na, which the function already
fetched, instead of indexing info->attrs[] again for the same attribute.

Patch 4 converts the elapsed time with div_u64() in
tgid_stats_add_task(), like the utime and stime lines four below it do,
instead of do_div().

Balbir Singh has moved to balbirs@nvidia.com, MAINTAINERS still lists the
old gmail address.

Bradley Morgan (4):
  taskstats: use nla_put_u32() in mk_reply()
  taskstats: take the inode once in exe_add_tsk()
  taskstats: reuse na in cgroupstats_user_cmd()
  taskstats: use div_u64() for the elapsed time in tgid_stats_add_task()

 kernel/taskstats.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.53.0
