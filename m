Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090174;
	b=DJcUNjI53g0FtsrWxg9kinps0Nfm/d9YVxxG349au0JCXZzh/tZ10UKA/mEQ+4hTe47F
	 HW4GBDFuQPF5HxAMty7thP1qYWZktA4Gqpv44HJK4K7rCrzpoTDsngYpxOqLOxFnta+aw
	 xJel0sdY6cSl3q4Ub6s29zArAy16SPvSh0+1OiAmi6VV00Mw0SNmlsq2wffECk9IRft/8
	 /YjZupAuulcpY+hFIt1DWi0eq9xe5AzfhxevQZTYGtObNRHDAO26F7EiHDjyZVVqnhvdn
	 bBDYhzJPITA+sgrjeHHtu3oqMoldaSIDmT60YXdlwKHX8HL1g6dvKRUzdcXSbBzp7EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=533OwAPWq4vOQ8kxsIt4qtc5nCMy/Yh65N5bfM5agWA=;
	b=IAw8QYHtLusy2Jjhl7QjyzvSzAY4JvN7w/xw4R8n8EepqxeniFyV0gqbjhtu9P1RIqwL
	 RZNJobb0zmoEi3zJqsPTXeXXJ0WXdvnoVqhASof890WU8oNYN0laFEqBAwUaU+zPgQF43
	 3/ijjmvYNfCFd6NGoc9+GSm9fkJxQzYdrzckiYlKjTFBuO12DCQk5iPHFuj2dnBzR0+l1
	 SeJfIrZkjNYOqLIhgjPJ4aYV/9/BvgkaEnG9EpBJQGo4akdrMpN3If2RCiBQzfvkxJz8k
	 Uvq+A7i3IPVmPwH6AIdQ14eSV6Nl50w5pCuPBLpn4lAk0EOixjdIFsUrt6oAetTISIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aa0vsv5I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF46606A333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF46606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aa0vsv5I
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so8766621eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793090173; cv=none;
        d=google.com; s=arc-20260327;
        b=N0mR6bT+Wkkf9K3lgNPKXUmPovoIB6Gl/7ASlYs2LXXmpgm/T5uEmqWdFblZ3QxOQZ
         xWTuyaQhACDEmAiJIeva7E8NHx3eSnlQx/B57nyZF/L3S2sQMykWyG03BvYEpMYIl7d8
         CnciYj8255L0a8tUV24MO0IBjhP931SL9Q/36VCILeOQl50l0sWcx9jhkqofX0xojlwH
         2PrGS/7CBnpt/SThA/Z15FuyXZ5dDi84siBP8zX0cHMONTWjWqPXRccjpF9YXrOGWk5g
         D99w6VOghonFpBUpwhal43fyBNpvrodNSu05SCdu9SVp96sKNdfME2+zQ+ha7cekMHvS
         AMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=533OwAPWq4vOQ8kxsIt4qtc5nCMy/Yh65N5bfM5agWA=;
        fh=3jt99IGe19M4Jyz2bCHkWUkjs+oJxP3+qmwGX+VS1Pc=;
        b=UcUwkXP1O7orsgEXMyVOk5mwBhPg0d5mc8AYlIqtKOXpORe2mDaYOom979nQcGwTnK
         ZzDSwwmQ7axgUah5Y/8KUqRLY8FmfBwv9jzvRmeDfcTUCC0PGBzn3IQaTPe/ATsB8kju
         yhqsYAT82uFCGGPTEr9Ud4sMhfC+THNhVq9ZAqmhdRhg8vsBSyvW/KTXR8B5V5jzP0PD
         FW8UZ9u0JGQ9wJUZDr959fof+/QkrZ18kCp4i5UKpMqnRwK72wnpZHuvnrJuAJ6ND+If
         Kct3Z5VdFmXuHo3cfMKY1h6IIsJpJ52qTWiLDbejWXP+kHqMsnC6IOfYqi5zP+55843C
         NKeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090173; x=1793694973; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=533OwAPWq4vOQ8kxsIt4qtc5nCMy/Yh65N5bfM5agWA=;
        b=aa0vsv5Io/41U+ggVEM6mQUORlawKEdfZph+jyb++6f3ALT4dKeK9+jtwFYylo06+X
         KTMEVjqhut8tSbeYQ06lAApNxcGUYt2oeHDuEzngSJUmbe98qL1ynJGUckPvL02WQC71
         UHMj2Zwu4fT0b76KsGiKlLV/IMNBlteGg4P9oHSDHqUdc/KXKmVIgqES8Jr7Az8aVAbw
         ZdKUIuU5niw+ypLOSEHjLjkXLF/xeDNOQrkCwcxT1eUv4MJsECN8sXbzBIp5xBHyljco
         /ze3oDzJyffnkxS9YhrDTdYhrTn8nJyTAbjd3j7EnUQofw4u67K8MOaznqDZCXM/2srH
         R4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090173; x=1793694973;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=533OwAPWq4vOQ8kxsIt4qtc5nCMy/Yh65N5bfM5agWA=;
        b=nHhR0LoZuHv3k8w5WqaJ7Z4CXmwpnJfJ73og0b41jzCpyybcAHjAyel/CEPWK2taeo
         aSwz+2KykYL1y31TuIIiqPPEpOyxREagRP8MXDO1hPAvMdGFXmkuc5N0Mv1IVF4pk0uC
         /+SZqNrNAW9IRpxr1WP8xp1j52Pl9G3E/Lx5HaBuQErAPz+Y3BCaNJGRhZLCJ4PYShqm
         oC+fNHZX2QnRsqVmzGyE3aTEf5upsZLkFjL3Z9S7vxhpEqMvscVi4rDyiN7BdvoxP2bd
         NXEWybXEQWefe6CRFXCMquqen7HXTenWYi1FQirhIkx9t7SlUn8uzf0bo56X9iMH+I91
         5JTw==
X-Forwarded-Encrypted: i=1; AKwUvBzbWfqEMpTkRzE8NGpXN8vbMqzbjnd0bZSHe6nYuqwYjCw6ztZH4ZxSoVlpv5s1mapBYWZLrYhv7w8/FnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuFHB5BpldXaZNsDUmwwp5JgrJVuvU9G/Ly14BRULredOuuFZ/
	3p9ie1lB92RYGE6lXcM/1fE0Be9hSW1IR8I5LkihnHZBq7z7vjFUQWVyJsxT1DXo9doUrJcu+BX
	oy0YO5V30We6LeNBYmngJ096WuqR3Peo=
X-Gm-Gg: AYBFou02J+UubtE3Od+2GWk6A5KEfCoKnng8eK/CAthAISd4gdE8Wn0dG95G7vwASow
	r6mUDFnsbi4Bdtf3D2bvXSQonwwouBzIasaOsWjOYgKmmf12I0aP+3QJXIb1LVtARgwBYzQVwMi
	1/PRQn0PTUaWUjaOFpHGTQBgj26fNdxigGEiQZtePpFmf4SXDGv2CNH5pPNwdqENIhelznkq++f
	QLg4cTe36Q0pW3KIuoTlSa6Dgw3ZzODtcs8EAoYBfhl33iKOnZv+DnHDlPpLhpK5iZq7PRXgu9k
	vdbn0tVlcNxPlnugS0DqU2GMGiudfgHeC57nNq4293FsKSSEgscBJ8TJfZ9Q7VE2lGkMF7s5T0r
	p9pltm/0jWVFNRIXZlxKHEhbftUELNEK9GCHL7Dge+XxK7X5SZE9/79U2URbDsiI/mlHBKPBN+5
	nKkhUvtUl6PMgjWo/bQXs4m7+qFHoiwn0VtNRN7jSURy1KKQ==
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id
 5a478bee46e88-369e845b068mr14555898eec.7.1793090172731; Tue, 27 Oct 2026
 01:36:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Date: Tue, 27 Oct 2026 13:36:01 +0500
X-Gm-Features: AclHuK8LYf_8PYVj_mbhVWX4NzizhrOEbQrV-IlYGk176whN1q7kTKLieg1M1X8
Message-ID: <CAEmTpZGu5x9PS7vFwgc_dFH80rL3cFD4-geuuL_w8i=vFDo8AA@mail.gmail.com>
Subject: [RFC] btrfs: zoned: reset stale zones in unallocated device space
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'd like to propose a feature for zoned btrfs. I'm not planning to
implement it myself, but I'd like to get feedback and, if the idea is
considered reasonable, have it tracked as a TODO / project idea.

Background
----------
I maintain a host-managed zoned block device implemented with ublk,
where each zone is backed by S3 objects. Storage cost is proportional
to the amount of data actually held in zones, so zones that contain
data but are not referenced by the filesystem are a real cost, not
just lost capacity.

Problem
-------
With a long commit interval (e.g. commit=300) and heavy buffered
writes, btrfs may allocate new block groups and write a large amount
of data into their zones before the transaction commits. If the
filesystem then goes down uncleanly before the commit, this is fine
from a consistency point of view: nobody called fsync(), and after
the next mount the filesystem is consistent at the last committed
transaction.

For a virtual device like mine, "goes down uncleanly" is more likely
the ublk server crashing or losing connectivity to S3 than an actual
power loss, but the effect on btrfs is the same: the running
transaction never commits.

The device extents of those new block groups were never persisted, so
after the next mount the corresponding zones belong to unallocated
device space from btrfs' point of view, while on the device they are
still non-empty (write pointer > zone start) and hold data.

As far as I can tell, btrfs currently handles this lazily: such zones
are reset only when the allocator picks that range for a new chunk
(btrfs_ensure_empty_zones()). Until then they hold stale data
indefinitely. On SMR HDDs this does not matter much, but on ZNS SSDs
(where a reset helps the device's internal GC) and especially on
virtual/cloud-backed zoned devices it does.

(Stale data past the committed alloc_offset inside *existing* block
groups is accounted as zone_unusable and can only be reclaimed via
relocation; this proposal does not try to address that case.)

Current workaround
------------------
The only safe way I see today is offline: unmount, walk the dev tree
to collect allocated dev extents, and issue BLKRESETZONE for every
non-empty sequential zone not covered by a dev extent. Doing this on
a mounted filesystem from userspace is unsafe, because it races with
chunk allocation (a dev extent may be allocated in the running
transaction but not yet visible in the committed dev tree).

Proposal
--------
Let the kernel do it, since it can serialize against chunk allocation
(chunk_mutex / device->alloc_state). The operation itself: reset
every sequential zone that is fully contained in unallocated device
space and whose write pointer is not at the zone start.

Possible interfaces, in order of my preference:

 1. Automatic background cleanup, e.g. once after mount (after the
    dev extents are loaded) and/or as part of the existing
    reclaim/discard workers, possibly behind a mount option or sysfs
    knob. This requires no administrator action and covers the
    problem completely.

 2. FITRIM: on zoned filesystems, apply the reset to unallocated
    device space as part of fstrim. Many distributions already run
    fstrim periodically (fstrim.timer), so this would also work
    without extra configuration in most setups, and it fits the
    "release unused space to the device" semantics.

 3. A dedicated trigger: a new ioctl (exposed as a btrfs-progs
    subcommand) or a sysfs knob under /sys/fs/btrfs/<UUID>/ that
    starts the cleanup on demand. Least convenient, but still much
    better than the current offline-only workaround.

Risk
----
With corrupted metadata (a dev extent missing from the dev tree),
this could reset a zone that actually holds live data. But the
allocator already makes exactly the same assumption today when it
resets non-empty zones before reusing them, so this does not add a
new class of risk; it only performs the reset earlier. If automatic
cleanup is considered too aggressive, options 2 and 3 are explicit
and opt-in.

Questions
---------
 - Does this sound like something you would accept upstream?
 - Which interface would you prefer?
 - Am I missing a reason why the reset is intentionally deferred to
   allocation time?

If the idea is acceptable, I'd appreciate it being added to the btrfs
TODO list so that someone interested could pick it up.

Thanks,
Korenberg Mark
