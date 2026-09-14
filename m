Received: from mta0.migadu.com (out-242.mta0.migadu.com [91.218.175.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6293F7ABC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373456; cv=none; b=cmGBnz3f8f1fDNfeQ/CH2Te/oLdlfWua3Zz9u7l1oADYRnFBlLmrC4EgpUahf61JJbfGsQj/3sD6scJxffsGuk6QzglQl4NNH6KzUi0z6j5UY0qspO6jdP0f5F7mCTFuVUy9wmbhU3KUiDWX5QMuwdkRT474vP0t2nosQYsdbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373456; c=relaxed/simple;
	bh=EL2qahOVs7kqmkuolw57KcCn+w2OQJ2wG5ZeSucQNgc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Di7WNUHu3Rzdza3Hm5HpPXNqfHy2b1NE9Vnwo3zMz+CZzNrb8qXFOhqvhu6Y4bc9mZGg1RhnAcCtbGKMfBLkbbfIjd/xdG7c2afdVEUhE2dQgt5yLtGR3zD/lzDD+lHXp2QLWN2r/9+T0HzmRaG/2eH38fcaINGNFmpkZpdW/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tPMIuf5d; arc=none smtp.client-ip=91.218.175.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tPMIuf5d"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EL2qahOVs7kqmkuolw57KcCn+w2OQJ2wG5ZeSucQNgc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789373452; v=1; x=1789978252;
 b=tPMIuf5ddQ4bI1YHqUaevVrR2ioofLPaT0FRmcOVWWNeWHkne0wilCeInoAs7hqkkcOR7GiS
 e+wMxXRyjZgozstexfNzuxGw5f06mJzgCnkFmodAdfdCLbCC5J3qXKAsgzVY6k0zVdL5e+SUEta
 3apOrUedxvnm5SbbDuq3bNbc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24b3c16a06c37a0f;
	Mon, 14 Sep 2026 08:10:52 +0000
X-Mizu-Trace-ID: 24b3c16a06c37a0f
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:10:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
Message-ID: <9af33e1222c6836df1039eb42b6c0f0514e6f0f4@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v6 0/3] mm: improve folio refcount scalability
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: andrew+netdev@lunn.ch, apopple@nvidia.com, artem.kuzin@huawei.com,
 baolin.wang@linux.alibaba.com, david@kernel.org, Liam.Howlett@oracle.com,
 edumazet@google.com, harry.yoo@oracle.com, hramamurthy@google.com,
 ivgorbunov@me.com, joshwash@google.com, kirill@shutemov.name,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com,
 torvalds@linuxfoundation.org, vbabka@suse.cz, willy@infradead.org,
 yuzhao@google.com, ziy@nvidia.com, ilya.gladyshev@linux.dev
In-Reply-To: <20260913170615.cd43348e579d8dde5d556fb8@linux-foundation.org>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <20260913170615.cd43348e579d8dde5d556fb8@linux-foundation.org>

On 9/14/26 03:06, Andrew Morton wrote:
> On Sat, 12 Sep 2026 22:50:07 +0300 Ilya Gladyshev <ilya.gladyshev@linux=
.dev> wrote:
> >> From: Gladyshev Ilya <ilya.gladyshev@linux.dev>
>>
>> Recap
>> -----
>>
>> This patchset addresses a scalability issue of a folio's add_unless() =
operation,
>> noticeable during contended IO reads from the same page [folio_try_get=
()]. The
>> main idea is to replace CAS loop with optimistic increment (and deal w=
ith
>> failure later). This requires splitting refcount into counter and sepa=
rate
>> "dead/frozen" bit.
>>
>> To allow for such modification, this patchset also slightly refactors =
page_ref
>> API, consolidating all implementation logic inside mm headers. For mor=
e
>> information, check individual commit messages. The original performanc=
e issue
>> and previous attempts by other people can be found in [1][2].
>>
>> Performance
>> -----------
>>
>> To my regret, I don't have any access to high-core CPUs that I can
>> benchmark on, and a 12 vcpu laptop isn't really a scalability test. So=
,
>> here I can only paste my previous measurements on Linux 6.15. To be fa=
ir,
>> none of the related code paths really changed, so I don't expect any c=
hanges in the
>> numbers here.
>
> From a quick eyeballing, this patchset seems to provide performance
> gains which are similar to Kiryl's ill-fated "mm/filemap: Implement
> fast short reads" [2].  Is that accurate?

Yes, since both patches aim to optimize the same refcount CAS contention,=
 just in
different ways. This patch is probably less scalable than Kiryl's seqlock=
 because
there is still refcount cache-line bouncing. That said, I haven't analyze=
d the code
deeply, and the benchmark numbers are very simular.

>> [1]: https://lore.kernel.org/linux-mm/CAHk-=3Dwj00-nGmXEkxY=3D-=3DZ_qP=
6kiGUziSFvxHJ9N-cLWry5zpA@mail.gmail.com/
>> [2]: https://lore.kernel.org/linux-mm/20251017141536.577466-1-kirill@s=
hutemov.name/
>> [3]: https://lore.kernel.org/all/aqAIFV4nOGPbWiDS@thinkstation/
>
