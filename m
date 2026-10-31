Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465628;
	b=yA1OcQ8zJmPCsZzUOP383v9zkhe7pvcatfW5wS+LN3f/SepAwXViOZV1MndJKkOZusxg
	 qtNRfFSieaBi/hOKxMr4fp7jjW6n1abbK971R8g6Vy5KfcLZ68lmud5ibdS3bD9QP/nH0
	 b+H6SQ7XDgbLZGP4fjGXUgOW1SaldyXnHRonTUKNxVrITFawxKAI78PNQkzKqTaVoLbE9
	 sauSSDah76EIWifAYjyFqAn0U4/e8OljPaDfsiz9lAo34avax1sbMM8Qz1Tx/j6zfu4Al
	 +o6fJv7At/DFKTEr17c7Pc/mczSmLCpnv2WYO8qmTeTOhubIjpyo/hbkfmqMsD5xWRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465628;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WXG/VuGgA2nLHyyo2HBxCIFByTCjqyBPDh3lixMNfY4=;
	b=esC+qd5sfp1SxKzm4OCXjThnhmJdx70ig1g04cav1k9HBjet77og4Fed8Xrk0ZLbyX9I
	 eLTCHZw2as1PO5S7zSZmjlbqMvmE+E+6xImCnGvYVP/B2gxxJ/OZ4WL2kLuKT5OESW82L
	 2bp+lTmeLGPl4zmUSRcGXOSUZaeMZnUb22whN0VWrt3OjtA5MInq7EeaDqiEAkjBKAGL+
	 a2yqcr1pfdBxGXJJ3cbA8uRvUT6Lm7wyH0T/uPmRqoyQcGx+BiWaS91npgRFzJhYhzQJ0
	 Artja8V8C3kNkbO/sYZOdbIp55CG6tcFxAXq87qrUFbrOwA+kzz5IkqfpD1FQFPKhiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w0+M577m;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8D6606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D8D6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w0+M577m
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jade3sx8Nnul+MHi6aqoKxBIknYtcAapdEpzanu8AQo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793465624; v=1; x=1794070424;
 b=w0+M577mVaWzqtdSUI3kEqiAiA64yOA9tnImxrrKnPp7n5JJoXbPlfWGM7FwWuWM5y06ESp5
 MUs5SfJhO0QzMIWJKGHpN+UTN31dxavlleBVkc1FZp9bbfIK9kTN81+qB4EclE5K4IcYPCdnAGV
 6PrUwCvKHgOS1w4QSUcd0Co4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a73ddf1f7291a74a;
	Sat, 31 Oct 2026 16:53:43 +0000
X-Mizu-Trace-ID: a73ddf1f7291a74a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 31 Oct 2026 09:53:38 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, kasong@tencent.com, 
	qi.zheng@linux.dev, baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, hannes@cmpxchg.org, mhocko@kernel.org, 
	ljs@kernel.org, roman.gushchin@linux.dev, dave@stgolabs.net, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmscan: don't count per-node proactive reclaim as
 memory pressure
Message-ID: <auYc-G488bbhy9QY@linux.dev>
References: <20261012022917.1102467-1-vernon2gm@gmail.com>
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
In-Reply-To: <20261012022917.1102467-1-vernon2gm@gmail.com>

On Mon, Oct 12, 2026 at 10:29:17AM +0800, Vernon Yang wrote:
> From: Vernon Yang <yanglincheng@kylinos.cn>
> 
> When the cgroup has no memory pressure at all, writing to
> /sys/devices/system/nodeX/reclaim triggers proactive reclaim on
> NUMA node, causing increase in the writer cgroup's memory PSI.
> 
> Due to this reclaim is performed in the context of the write(),
> accounted as memory pressure on the writer, like
> commit e22c6ed90aa9 ("mm: memcontrol: don't count limit-setting reclaim
> as memory pressure"). This is unexpected, the similar scenarios (e.g.
> senpai) will continue to occur, only this time it is for the
> /sys/devices/system/nodeX/reclaim knob.
> 
> The Documentation/ABI/stable/sysfs-devices-node documentation also
> notes that "This interface is equivalent to the memcg variant."
> 
> This patch unifies the semantics of the memcg and node interfaces:
> per-node proactive reclaim is no longer counted as memory pressure,
> and the per-node proactive reclaim interface no longer produces
> phantom pressure.
> 
> I ran demo[1] that performs per-node proactive reclaim 10000 times
> in qemu, writer cgroup memory.pressure as follows:
> 
> without patch:
> 
> some avg10=31.53 avg60=13.42 avg300=3.31 total=10602985
> full avg10=31.53 avg60=13.42 avg300=3.31 total=10602985
> 
> with patch:
> 
> some avg10=9.59 avg60=3.41 avg300=0.81 total=2686221
> full avg10=9.59 avg60=3.41 avg300=0.81 total=2686221
> 
> [1] https://github.com/vernon2gh/app_and_module/tree/main/reclaim_node_psi
> 
> Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
