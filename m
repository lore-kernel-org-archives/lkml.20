Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894133;
	b=JKfCoUMjCZWbXdPlE4u0A9NA7cHmNaqqhGe2JOQG7sNAPOl+gvNOaKATurucpF6mWCs8
	 fIdbvHM2SQmsp0tnZT9U0Vq1U9b7mv5tY4lSRgjaFHq3uZaiiEW2pX7WoVt38oYTeUk1R
	 2Ssws9iGFYaJYWnsl0WgENmNDrVCeKY++ZpcMiuLzJ3M6/afma5YXVsrFK2fft9WJ9TGI
	 Ed5voj3wfpmgG7qBRJ3tH83neC2v8xiVKndXwRCI6ehFdjuCgBNR0kEiZjVhDy2mSVEbe
	 fuLxkU1KkdqOEFXYpQaitEKukov+mnm+8+E7yHfSgF8446Y3MvLN/SLNl4CuPHOVJmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894133;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXX+yyLfhvLwx/H4++TlJSCsQc1ztTB0esKx/piWuYU=;
	b=dqbulLGdFzarcyil1ITGL7agxy3sSCBY6rXJQHVRH9xNfdBKc4TPBTwBUvsWXuoaA846
	 IsztxMk5SVTO7FLMa+HPWfvyTZ3wo6X17tFRZ6dShUa7m04WhYSpNJlRHSbf7PxzR/oE4
	 cvcHKK0lftzcd1TCyZ5DgVzmzeGECdkTaLJ04nJLiCzEL2PI5LgOiCjZkOuC6jYFAPoxK
	 lEaI7+0eX4FI5Z0M7VLMOOabXoFAuw8Y6WQZqucmT8TewIEo+m3KxLNUta79DJfO5LOWV
	 VvEZE0ehFpCodF8BHUrxyHvIb9I+PyQj7KKWxv1HgiYa9iHgIBPdI8NXZyGhxwi2USg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rMEutgLd;
	arc=none smtp.remote-ip=95.215.58.112
Received: from mta1.migadu.com (out-112.mta1.migadu.com [95.215.58.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rMEutgLd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IwpDjeYOrVcNF5/TGijmvXdAi7xLWiQJD951NWDFYP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794894130; v=1; x=1795498930;
 b=rMEutgLdmQ088xlLUEdu2S8bqWS1k4Es4ota8DA2AHnF7HV4F3mZWHgPeD9EWbMS6t/qkkNy
 c/b52t2rk5ZHWTfbvnHthHgtNhd4Dss52jLlTsJAWePGaQ67aRwWwT/B514+pSs32tyHgBUqUNs
 sucFR0eMcbU8GFvzBBnXXFxM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6eef51c466824a1f;
	Tue, 17 Nov 2026 05:42:09 +0000
X-Mizu-Trace-ID: 6eef51c466824a1f
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Qiliang Yuan <odys.yuan@gmail.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Joanne Koong <joannelkoong@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/readahead: look two windows ahead for the hole on a marker hit
Date: Tue, 17 Nov 2026 00:42:02 -0500
Message-ID: <20261117054202.50460-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115203328.f98ce9a068849c2f2fb32a41@linux-foundation.org>
References: <20261022-bug-mm-readahead-async-overtaken-v1-1-c05b8d8bd2da@gmail.com> <20261115203328.f98ce9a068849c2f2fb32a41@linux-foundation.org>
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

On Sun, Nov 15, 2026 at 08:33:28PM -0800, Andrew Morton wrote:
> And you have QEMU in the way, so reads can get served from host
> pagecache (depends on QEMU setup), which also matters.
>
> So I just don't know what to conclude from your numbers.  I *suspect*
> the gains are from reduced CPU & memory-access times which is of course
> good.  But was there any actual physical device access involved?

No, the host page cache was warm in those runs too.

I have now repeated them with the file on a raw disk attached with
cache=none, which sits on a hardware RAID of spinning disks in the
host, so every read in the guest goes to the disks. dd with O_DIRECT
reads the 16 GiB file at 440-490 MB/s. Same 8 MiB memcpy() pieces,
read_ahead_kb 8192, guest cache dropped before each run, v7.4-rc3
(666539eecdf4) with and without the patch, three alternating boots,
median, with the amount read from the disk:

                                 time (s)            read (MB)
  workload                    before  after change  before  after
  1 thread from offset 2 GiB   60.69  28.68   -53%   14340  14340
  8 threads, one range each    36.80  31.22   -15%   16384  16384
  32 threads, one range each   34.67  30.38   -12%   16384  16384
  8 threads, 7 MiB interleaved 27.54  27.20    -1%   16384  16384
  8 threads, pread()           32.06  32.27    +1%   16384  16384

The single reader goes from half the disk's bandwidth to all of it, and
its major faults drop from 1793 to 2. With 8 and 32 threads the disk is
already the limit, so the gain shrinks to 12-15%. None of these reads
more than the copy needs.

> I tested the patch on my LLM-driven test setup, which is similar to
> yours.  The results are...  ambivalent.  The things which you want
> faster are indeed faster, but other things slowed down (wall of words
> appended).

I reproduced both costs on the same disk in the same runs: fault in the
middle of a window at 64 places in the file, so read-around marks a
folio 6 MiB in, cache the next 8 MiB (or 16 MiB) with
POSIX_FADV_WILLNEED, then touch each marker once (median of the
per-run median access times):

  beyond the window      before (us)  after (us)  read before  read after
  8 MiB cached, then gap        16.1        43.1         0 MB      512 MB
  16 MiB cached                  9.3        17.5         0 MB        0 MB

The first row is a real cost of the patch: mainline reads nothing
there, the patch reads one more window (read_ahead_kb) per marker hit.
It is wasted only if the reader stops before that window. A reader that
goes on, like the copies above, would otherwise fault on the hole and
read it synchronously. The second row is the longer lookup when nothing
is read, about 8 us per such marker hit.

v2 is the same change rebased onto v7.4-rc2:
https://lore.kernel.org/r/20261109-bug-mm-readahead-async-overtaken-v2-1-06ead50562a2@linux.dev

Thanks,
Qiliang
