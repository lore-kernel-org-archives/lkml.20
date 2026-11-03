Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727464;
	b=skkyvM6RpNvu0BvIt3tZrwjY9ujswGKCOpVaoktZyF5N/3qtyd3zHsIG4ULgB1olOsbc
	 egAElZ/Li54f32yyhr3piE/8jUSBsobgXA4+O/11EfV4yBcyjKXtPhbFEetb4DYtu61jZ
	 wrx0NkxDf6h5O2rMzgzDvXniWo5/fAivN2fkP4i7vBcFfJdBk7ZluCeg4RB98q3VGMNtA
	 leCC6mdpyO7K91kscIEQv+EnNFGUD65JtPRIxGcgpfbMTflJKU//HCTNs4aVn+1qg6buz
	 t+C7bUTB4j7/jmwpM2bGLPABNcveWiH/dap2Wmp4aYJ09oLUN2SBWGRLtPbBUbztUIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727464;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qFjhgIGgPZUYlvL+RYcSfUXPWGvrnI6FenzKH94jOMM=;
	b=DO81q76VtVsiISVzxyqH7hDSmPogzaj2XQNlQrnEtV/vvKKiB/37kHqD47jX947mjW3f
	 KBgr96YMEdvVvg5Ay1dcqRUoIHSR11Nt3FRVMxxGcN5NSIrsqZI1HuaJ7nqRArPEz2o0Y
	 mfX/IfwlgBoZkcdqeEslUl9VgM/96bXDjRJQdYxD9vFWwSnxK0vrHEZpKvnk7/4ZUtlpy
	 rTSlGzWDW19sNJEoFRmvraJj+kNfyvMgwxfgNatBYqezBDLUAM+Qk9BBt6hwPGrv2q9r2
	 wu3tL4uWzxyrSY3BPBv4CJCBI1//rsm9W4Db0t3SVeGgwfSHvauBzUjI2qPmPkBE22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=karaolidis.com;
	spf=pass smtp.mailfrom=karaolidis.com;
	dkim=pass header.d=karaolidis.com header.i=@karaolidis.com header.a=rsa-sha256 header.s=protonmail3 header.b=wRvZOb3s;
	arc=none smtp.remote-ip=109.224.244.117
Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49199606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49199606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=karaolidis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=karaolidis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=karaolidis.com header.i=@karaolidis.com header.a=rsa-sha256 header.s=protonmail3 header.b=wRvZOb3s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karaolidis.com;
	s=protonmail3; t=1793727460; x=1793986660;
	bh=qFjhgIGgPZUYlvL+RYcSfUXPWGvrnI6FenzKH94jOMM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wRvZOb3sE3o59vmGwvbkJ49QorWYcdSvzlj8XXAZic+nqaL8DGQ2lwfyGveYMZn2+
	 uP7JMbZVJ35G7ju606zIJ5GiIZSqJSqXFJYsGPGBUvclWtIjwt4ZdMY0X/IoAHZbxU
	 8RjdHhuX3k8ycoj+Pz9FBK5a2cAcWa4Z9ClukeMD1E2MWkBcqXGTrcppA0GesLHMSu
	 D72mvXFvpKGF4eGLnNH5F62MiL+ctCnUL+nl8ryPaLXa6AMapR+KGcWco3+SorPH9i
	 +1v+mhfGSZvbhybpL2OCZ40+zmJIv3BBkLF6hcRdQUDakvY2l4ZCgZ7WqTdrGp0J84
	 k2uSOebhIKFGg==
Date: Tue, 03 Nov 2026 17:37:32 +0000
To: "David Hildenbrand (Arm)" <david@kernel.org>
From: Nick Karaolidis <nick@karaolidis.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Oscar Salvador <osalvador@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?utf-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Hui Zhu <teawater@gmail.com>, Georgi Djakov <georgi.djakov@oss.qualcomm.com>, virtualization@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] virtio-mem: support memmap_on_memory
Message-ID: <TOhF_b9SkdekrK9Ee-ti1ZwiT3wqERe1fpF8nA8WgHb-MX26lmQTex3l_NDfWzFKR7gcmLfjxB2YWixGw3LpR1mvgmPWR7uy1bkqbGREMpQ=@karaolidis.com>
In-Reply-To: <fd6094d5-50d3-4e73-8c09-91b0769476ab@kernel.org>
References: <20261103-virtio-mem-memmap-v1-0-308ae1da6240@karaolidis.com> <fd6094d5-50d3-4e73-8c09-91b0769476ab@kernel.org>
Feedback-ID: 101209095:user:proton
X-Pm-Message-ID: 08ccacc36e0bd2d68f132c0bd7bb29272cb682f1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 3rd, 2026 at 4:29 PM, David Hildenbrand (Arm) <david@k=
ernel.org> wrote:
> Care to pitch the use case to me?

Sure! The point of my project is better control over guest memory.

Each VM boots as small as possible. An agent in the guest throttles the
workload with memory.high before it OOMs and asks a daemon on the host
for more, the daemon grants it (or not) by resizing the virtio-mem
device, and the guest gives it back once it no longer needs it.

From there, one can set up VM priorities, revocation policies, etc etc.

> Is this something that your use case would actually benefit from,
> or was that project already discarded?

It is live, though on my own server for now, and nowhere near
datacenter scale. It's a 32 GiB box running two VMs, a CI runner and a
game server node.

Each used to have a static 32 GiB with a balloon because both workloads
could potentially use up to that much memory.

At the ceiling, the memmap for 30 GiB is about 480 MiB in the kernel
zones of a 2 GiB VM, on top of up to about 360 MiB of other unmovable
memory.

> Why so much MOVABLE memory,

Have you seen RAM prices lately? :)

In more seriousness, giving memory back only works if unplugging
reliably succeeds, so hotplugged memory is onlined movable.

Onlining some of it to the kernel zones, as auto-movable would, makes
that part hard to unplug again.

> and how do other kernel allocations (page tables etc) cope with
> that?

On said VMs, page tables peaked at 75 MiB, and page tables,
unreclaimable slab, kernel stacks, and percpu memory together at about
360 MiB. They scale with the workload, while memmap scales with the=20
plugged size, which is why I started with it.

The other problem I hit was inodes. Their page cache ends up in
ZONE_MOVABLE, which reclaim for kernel allocations does not scan, so
they pile up in the kernel zones. In testing with 1 GiB of boot memory,
that meant OOM kills and usually a panic. Working on it turned up two
inode LRU bugs, which are now in 7.4-rc1:

  8dc4116041e2 ("fs: don't lose inodes that another LRU walker is isolating=
")
  8ee09f597763 ("fs: rotate inodes whose page cache could not be dropped")

I have a series for the pinning itself that I'll post separately.

My VMs have been running with all mentioned patches (with some minor
tweaks) applied for some 5 weeks.

Thanks!
Nikolaos
