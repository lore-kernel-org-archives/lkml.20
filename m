Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC654D09F3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063463; cv=pass; b=VzEfOpKNuWwlsFLxYN7+AEzlGYxickv3PTSxNVzxD1jbScuNma2bhfwi0ZCDuV6Vff6e0hhEs+4l4y5r27pMuConQfdHLfwphWbrX6C3Rlq2NKTVTxu3ONU893rbJqYo+52muLvCd1jxkNSAw+uKu2qYj1tXrBmDk49nthNHOfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063463; c=relaxed/simple;
	bh=XVMTbGI24hbajbBIxXy0Jvn5BAj5rjBFBQOCI/BpQ+U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fyjO67jRAa0ruUUaVMXtktpx5/K1z0qjhWmFyGh0FjSPAbFbzVIYuVBqRFJw7IiSeeVZFBRRvDI3BYf0nLGko6RwvV7mG+zvYAcZ+/9HKLm3bj2qUMl3VpbKJSSxkPE5qLGWoxodJ0hkxUx7cE2MroV5Dm6k1xX/iVxNxaO1TGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXjb1y8q; arc=pass smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXjb1y8q"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4f6b95ba1f6so746429b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792063461; cv=none;
        d=google.com; s=arc-20260327;
        b=fQUVdmkpHfE8X+a5wi2nWCiozn9GiYuG32qoiz1eVYIMT5qDxj4s3QpyMO90dC8Npt
         fCIWOXJTOKUtG52QhzePMXNqbinZHAlz6sk6iy0nuYKlDECXCoUJVVW5kAIAVp4vqZAB
         zGXCKTw7luXVp70aAAIJFVRpRaNtC9IedECdP1u44XDcq2tCD1OinYXWg645mIHuO97c
         iqIkFJ8C2TFyW4p/dzisOEGr5ddDeKdDFfFvUkLHAqIdPVDOWIqslGdInniUG8465ak7
         5rVW1iWL916rKlG4XD95QdTjCYfvlyWzeJ0jNEoJWRwS4e4EsVazeDZHaCXfkztNsmcz
         A/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=toN6NfvRkfvzS3ZSAY9pfVPprxB1LDrTzbA57aszDio=;
        fh=OapzuDVUWebG4rfDJsUH/IkYIpf41wV3TWedRCD2jKM=;
        b=cRGKtmp5J0iTT6UgguM5DcEddDy4L9PAJ4zIrcEhxO4/h4+ZrbAaYW1qq1lKRqP1aP
         bXLxxOL0AMSxiGjP4RL1B2ZUlpUCf1PrJnI/+J8nRyu8ZfTZCho47IxNBkPnamUQaRV0
         Y4vqA1kFY9Dv+3XlKDaQ4+vKeGSn32xMOj3MPg6eYTAIRgrWNGM/S4ZoGtIxeFDQXVtK
         rTGSL4r+U/Q8KaE43WWAh/4AHpl4SYHCES6RweHi3b+33IvE1ewr4XSOdPbwhqOAuSHy
         xuEFCV9m9I36DdtareWBVtDhkwp7fCxanV0L2QGRknIqTRt+SoS9EEm6d+u1MlaJSBvz
         9a9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792063461; x=1792668261; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toN6NfvRkfvzS3ZSAY9pfVPprxB1LDrTzbA57aszDio=;
        b=KXjb1y8qcS5WdYQZSh0Xn75AC2EyhvwERae3F+V0AmOirX2SR3P7jOnYERo9dpvyWi
         j7F2n/lG2qbyfImN3HiB9U0vJI3ROmccrZ/CchE+WHnVlhZ25Ni7yOPunKrFQfHetApa
         g5qs3EVI4jz/Hcr0cN19RvFH8W8M8PU+rDBd3is/Cx1GevflRrhbv6Oomjk+9blY0MOx
         Ff9vEZ/5KisGCqe5UyqZ30CeNE0GTpBhsj+2xFanZvGFoVdybL2iMmYLvvj/s0VV6Kv4
         GUDHShLDqKaFbg3EsNgPnDPPbKsD8AfDn2lsOwaqzhOSpGdf1lu5HDbRj4k0ovzIn1qe
         XjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792063461; x=1792668261;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=toN6NfvRkfvzS3ZSAY9pfVPprxB1LDrTzbA57aszDio=;
        b=BBLBbGDeRyL7AAQgHa4rf6Y5mQ3+aeijl86lVLZa20EWF+5tUAmdwW5JUKzLWFGhOi
         eqgZeIqqnnkRZOPgjhe0o7kQ3d1ZsDGixwObRSulJjNs8phU0SS7HD/ucglvb7rs4eo7
         CrR26Bde0sD6giIm7aj5fCY5Dzbb3iU7h/JfqA1Eo/Ri0OxLsmpP9Xu9CHIYUIeWVcTl
         ZzcDGn6arJgMewh8uQ1GCIHvMMnNlC8UGpw/6tEM8Tmd9CZhUjDlIJppe3FvsfRgoXQ5
         UZvtxrG+oe/GA9da3QD53+kqLkr4nQsOjvowcBXby0vTCR8bbKD2b0qpjT65rCS32POL
         Po5Q==
X-Forwarded-Encrypted: i=1; AKwUvBynwm9Q1IGo9fPGdW8ZzsXJr6Cf7CX1PsGl5xNRL/n/El6plJ0IlQRcYQxl5yWi00FzKT4pZ+1n9HyKQ/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRoCk0r2MvxVvrGCnP/au0RVAwd8t8ge6MIm0HHjYAD9+OUlqF
	nvWoTvnbomxk7U/RKmhBqqa5w5ws4KDZKTiYD1X3y0EE/Peq06ml0FCR4T/g6Ny/ZwFxKEL0/T2
	x94s7066sKeHirEYbfTuSnzmEel6kyHw=
X-Gm-Gg: AYBFou3z0g76l5Ee8mtopZQ1M3nzo86cyPwZieagzIuyLAuMrENeF19ecZBu2xv+uQi
	LNAh3phk1aXDKPSOnwZc78cl/LfssAlPitAv0VUSxK/XNv++OlnUlk16JB3z2TDjyyIsZGu+My3
	Ns16WspXeo7k4cOFCExpvkPLI2AHiIeY80vNIXYvRI45ar9ykDisBxT0dKJFfSwCb6uGnjwLnyj
	5wEJQSxfSdbueJ0e86BLONdv78NlYzh/T49cn3s3CuifQjztJeQjTEkHL+R3cy64NTsOvgdU62t
	gmmgPLEiDL7hF+whHEJNlymuLdI4atttbBsUFds924ZUbOCmTdjyanrWVja5EXp1nnkPPxT5fqF
	Ihxpehctk2g==
X-Received: by 2002:a05:6808:4fde:b0:4fb:a7f3:420d with SMTP id
 5614622812f47-50c57696145mr17825753b6e.48.1792063461122; Thu, 15 Oct 2026
 04:24:21 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 04:24:19 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 06:06:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 15 Oct 2026 04:24:19 -0700
X-Gm-Features: AclHuK-608mCEKwpz-MUlsDmIU9QQ8jGf8QLRe02ypGSFraehbwNM8aN2ipTdn4
Message-ID: <CANOyQmFPJt=-=hJh9Gt-FPG6YiyeidyfUbnW0mF5bSmJ0m7P0w@mail.gmail.com>
Subject: [BUG] DAMON_STAT: 32-bit overflow reports wrong estimated bandwidth
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On an unmodified i386 QEMU kernel at mm-new commit ad9f2d463666,
DAMON_STAT reported an incorrect estimated_memory_bandwidth value.
CONFIG_DAMON_STAT=y and CONFIG_DAMON_STAT_ENABLED_DEFAULT=y were set.
The guest continuously wrote one byte per page across a 32 MiB mapping.
I used QEMU's GDB stub and the matching vmlinux to stop just after
damon_stat_set_estimated_memory_bandwidth() stored its result.  At each
stop, I traversed the same target's regions separately and recomputed
access_bytes with full-width integers.

Three nonzero callbacks, all with aggr_interval=100000 us, showed:

  access_bytes   independent sum   stored B/s   full-width B/s
      33357824          33357824        31079        333578240
      65200128          65200128        25244        652001280
      41152512          41152512        24303        411525120

The final sysfs read was estimated_memory_bandwidth=24303, matching the
last stored value.  The independent region sum matched the kernel's
access_bytes in every callback, so the sum had not overflowed.  Each
full-width result fits a 32-bit unsigned long.

In mm/damon/stat.c, the expression multiplies the unsigned long
access_bytes by 1000000 before dividing by the aggregation interval.
On i386 the product wraps.  In the first row it becomes 3107979264;
dividing by 100000 gives the stored value, 31079.  Full-width arithmetic
gives 333578240 B/s from the same inputs.  The other two rows show the
same problem at the callback site.

The workload is synthetic; the test checks DAMON_STAT's arithmetic, not
the accuracy of its traffic estimate.  The i386 config, guest init,
disassembly, GDB probe, logs, and build/run steps are here:

  https://github.com/jm5905938/kernel-mail/tree/195d7017352a3d0f4a0475b98f3b03650f5c14ea/cases/2026/damon/2026-10-15-bug-reports/04-stat-bandwidth-32bit-overflow

Thanks,
Aveline Noir
