Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450833;
	b=IwVNIheccldNvuGjH/3twBuqTlh14P28gFnMrWZhGt2w7CH8//hIf2GLrP0t1MTOHtQB
	 F5wih+8chJYpqK2P57AJpbqvgt7y26zExJyC1TZ+trkNkA/QWTo0uk893R6kmfHtkQecM
	 m19KM3Y7qWSMLvB1hEgxE8/4JTtKKK2s3lnLkQT7jCMgCpvqo0op2+6oF+ghluEduo3rS
	 ylbDytWsndBZGrCiC8FyKamaG1RjbJ69kvukQpn9pi22Yp7C6qNRaMl3pPfuxpjZAR05K
	 +2wCCN5y0NrLVKsWG1c3fxX8t7oq7jgp9mDOHIIH5J00ScxHD3xAslIgb5hFut9Va9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450833;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LYKihU0pHL2+b602qOoekQ9OcZw08O4XsCNRkmiBQCw=;
	b=gAhQGOfrvSbHsvoMouuQSl2CaWI+MfJvdTku4lvscKlZWV3d8rfEx4FDXewh+UhfI3da
	 XnydTF32/MJEA1OxmVPJi9gBq/k6tn8p8r0VXluBoZBTdI9Dh7I37M4BhptiTA5B0qEGw
	 AIGGUugc5OngmmrZIHmhFRkRJGkFoK7NxEzl9ckah61gegwZGdkNaBkBNYZoOdss3D8bt
	 EbBXqdQP4F1cn6q+eFqI9B+34+tulvgWSFz6JSaIq8GJ8kDF3vyQMRc7NgelLeayeaxda
	 u4drBY+QtN6ndMfrQBfeYzfD1HP0m4gYjsNQPZDlfLHIwp9UTYdpbQ8dYus/ADOcaeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=o8IXSB74;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD5D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=o8IXSB74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=o8IXSB74wmd+uc8pmDKp0Au1EuB6498W7FTB1CVqxoUxpCvwQzgDx480XrVHgoxUba8nIfdpSSwwo
	 eyxOHkeqx+HSCuZvD3sQjncuMFx0JE0ejB3HOdF00XSnPNBLAA2z1exn9dgJBjtWBMz/D3yHF81QyS
	 gQHnQTaxt5dNv4Mg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af5258f696-7c65c;
	Thu, 12 Nov 2026 10:33:51 +0800 (CST)
X-RM-TRANSID:2ee46af5258f696-7c65c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af5258da4f-eeee5;
	Thu, 12 Nov 2026 10:33:50 +0800 (CST)
X-RM-TRANSID:2eea6af5258da4f-eeee5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: Re: [PATCH] shmem: Serialize fallocate progress with writeout
Date: Thu, 12 Nov 2026 10:33:49 +0800
Message-ID: <20261112023349.118385-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <1291b635-6dd1-4887-bfb7-075eee45b7f6@linux.alibaba.com>
References: <1291b635-6dd1-4887-bfb7-075eee45b7f6@linux.alibaba.com>
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

Hi Baolin,

The KCSAN report I referred to is:
https://syzbot.org/bug?extid=aae8bd56cc1c38d50ec4

Full report:
https://syzbot.org/text?tag=CrashReport&x=16888bf5580000

At the reported revision, the conflicting accesses are the store to
shmem_falloc.next in shmem_fallocate() and the load of that field in
shmem_writeout().

I have not demonstrated a user-visible failure beyond the KCSAN warning,
and I have not reproduced this race locally. The VM tests I ran had no
swap, so they do not validate concurrent swap writeout.

I used i_lock to serialize the accesses, but I have not established that
the algorithm requires a consistent snapshot of the progress counters.
The report alone does not justify adding those locks. I will revisit
READ_ONCE()/WRITE_ONCE() for the shared accesses, while retaining the
existing writeout-side locking for i_private and counter updates.

Thanks for the review,
Zhu Jun


