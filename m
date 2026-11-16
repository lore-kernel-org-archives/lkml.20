Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796043;
	b=NZTSIZjnuvmR8fZX7TnG3bR30EjVvo4aEeh/NBCpt8Y2qkG0gwQrZJ0DYjSlCnd7t+od
	 XoZD+LtbHC4Sn704gMC1p5y9ZTaTESQC4Mm1cjK3TM+J7jnjETW3vu1b77u8Jd8bguuia
	 YKqrorm9BFkGV/4as0IohBXjoQZYvAVktzoZzRFwDOXiwNUTvu6gWU5Lw/YdAafOgdEco
	 mAmPOMbj/5aY2Yvk6dODPANxr1yAk23Rg0GKv0Re6JXPAN3Lp93d9EV3BaPSQK+u2tH4D
	 ku2516A5Dzb+P6+FrZMkAGI5jDXI1cF4jdavtaJ/RW6vVijWMXdFkt6sb4l2qzQ4RAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796043;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Xa+s8rck0hvVYXsD+lL/I9md5BKO0hs1gcPH9kuiMFs=;
	b=aRqQgt+E7dgN0cGU+zRUVORnBDROs/W3eQBInSQN/v0tZ182NB3Qc1nef0q3jqntBE2x
	 vrOfiNM12iJZP/RHkyIDbBMPyJ82WfdbQXJjtpwbX+RRv95mwQTPNZQ9cqs8ZXQjyzGh/
	 +acxLtJ/mFTTVTuQyEoXug+HeVwNyH8I0THn9xcfUBtvBMYx2bDIwt/Q+VzTC7HYHGqNH
	 IkTCTK+spaVV5O++DKdcLpVNh8Am6sfpp6Pgts4o0TXNUqrQwYXcFDj30S/rigvC8Ginj
	 AHjeGCn9c8LGeh2/9F0f2/o3GceGY/HNhocM8sHuUjmoiXV+QjKuw6TsVRJD+SuxJNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tliFr88t;
	arc=none smtp.remote-ip=95.215.58.72
Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC82606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tliFr88t
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xa+s8rck0hvVYXsD+lL/I9md5BKO0hs1gcPH9kuiMFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794796035; v=1; x=1795400835;
 b=tliFr88tkGzfG0yLqb7kDYZly2YmYl8MdwxWzXX53WsrZRQT8OJH9TVbgwLHGreMouhiaYJs
 LC0VfAAgRIozU6xdZpjQoJyl/oqZPw06SQ7lneqDdQEjMD1udTjSKpegaES3kef7mqI2Sw9IJKS
 BLTfDbOeuYHp75iXnoHOKCzo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf9aec3d1c6270c4;
	Mon, 16 Nov 2026 02:27:15 +0000
X-Mizu-Trace-ID: bf9aec3d1c6270c4
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 02:27:10 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Theodore Ts'o <tytso@mit.edu>, Zhang Yi <yi.zhang@huawei.com>
Cc: Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, guolingxing <guolingxing@tju.edu.cn>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] ext4: silent data loss when a split at I/O completion
 gets ENOSPC
Message-ID: <d400205a-0d3d-4ec3-a916-6c0a085841b4@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ojaswin's cover letter [1] explains how, since commit ea96cb5c4ae3
("ext4: don't split extent before submitting I/O"), the split of an
unwritten extent at I/O completion can get ENOSPC. [1] stops the zeroout
from hitting other writes in flight, and [2] reports the failed
conversion to fsync(). Neither gives the split its block, so data is
still lost.

LLM agents working with me found that it happens with default options
on a filesystem that is not full, and ran the tests. write() and fsync()
return success, and after the pages are evicted part of the file reads
back as zeros.

Under a load built to run the allocator dry (QEMU without KVM), 42 of
72 files lost data at ea96cb5c4ae3, none of 72 at its parent and none
of 48 on v6.18.63. On mainline at 23c62304dde2 32 of 72 did. With [1]
rebased on it 42 of 72 still did, now as failed conversions in dmesg.
With [1] and [2] fsync() failed with ENOSPC on 47 of 72, and the other
25 read back intact.

Nothing our agents have tried fixes it fully. I'm reporting this so you
are aware of the regression since v7.0. A reproducer is available to the
maintainers off-list.

[1] https://lore.kernel.org/linux-ext4/20261102-ext4-endio-zero-bug-v1-0-266d2bb9e6dc@linux.ibm.com/
[2] https://lore.kernel.org/linux-ext4/20261101102145.647496-1-guolingxing@tju.edu.cn/

#regzbot introduced: ea96cb5c4ae3
