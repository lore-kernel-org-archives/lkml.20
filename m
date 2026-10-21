Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576864;
	b=wNAH/NdK6obvT5ufRmqM7s5yGJ783gZQQpWScWlq1eR1Ug6muxO6oP+4Ha1adTWzjq+/
	 3OacwGVDHnUqsfZjrTl6IscTBosNVwJKLk90ZKSCXiSVES76i1y3QxibwoUq+NsIQmO+r
	 wHx+py8zFhGN2fDEKrSLqVU7AUbytn7Ungt/2GOcF9Yyo+/FFEJzTRxvegoLKVQ7B+bkT
	 cNfBFlado+d53ETZy/6Fnn4aSg75tTlMz8GsNfUgCGZW8/mTNqEXgf+k/KoyPRRyl+VS7
	 aeiv+7colFCJ8f/OW/MSBvR+BZZgiwT+bEOfryE1VB5JJamynQdBTMZvLOqn601m2IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mxq8kuo1w0yT9pwlujpaWDKFUlFP+9O+MLIpqh9/Bfc=;
	b=dlfV0iZAmLwzzOTW+zQUWDHjq6g3BhI22g4gn3X6UBn7w0iM+4nvP00NL7h8QB4Z7XpC
	 SVaOPjdjeSvGqr8ZTataL8yKJrK/o2KH6G80asG76MvPmUuMi3r139NQK3KjnNXUUKfpd
	 /ZVODb6ZR+n+F6y253ExSk/vyipgoFuNm8/a/NkCYqXmbewdBZs2FyOqZdPd6S8jqZdmK
	 TRg+Q93FpXI7xrE7GD6awJ+FQQa1tOjJWtOryLpJzCzrgcahHWp1souLb4r1WgGCdaKZs
	 l6oMBE83KDdy3tMnV2KfImxTjRbePs3qGlvtYGHhsFiFPzylRKTVa82G4Mml9q3ZcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=Oh1y3eJo;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=Oh1y3eJo
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f1f76ea84so756563eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792576862; x=1793181662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxq8kuo1w0yT9pwlujpaWDKFUlFP+9O+MLIpqh9/Bfc=;
        b=Oh1y3eJoy59ZAgGk/7EXnL0Bk4LLmHOsXP7S8ZzyW5Ic+PEthbsa0Mhh4nvRvqyJpG
         LXEiY9wYdgmsLoVZNZ907gWXcf8h2FNvPGAfoiXMF2/JUtdlcKbPtW83KIaR48Ae7kd0
         vb+cAO8f6AeRWnRf92D0qatDGMl4IdSmIsNvaImt70bskpwAaI02gjKrz64l+rslwdV6
         mx1RCPHlUmpX0u4LY4QDjDCbfhHBcz1+OtcrmhS3E+mDnAmXFgpb/REm7jC7ZCLixcJa
         pBd9bmd4hvB/5ebe7fPy3c7GJ19A3QQSS7SQipG9l4r0ctQBqPGyRgLq+n1lEAdYcFoR
         FuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576862; x=1793181662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxq8kuo1w0yT9pwlujpaWDKFUlFP+9O+MLIpqh9/Bfc=;
        b=dSno6PTSPeeItXKqbo5dpi09ekD3oP/Mby23aP+ROqJQBVF5Lelx0tpno7Nurvaiv1
         L8SslCJw6ZuqvSscuUAwxDT3Uovl4TDkhJUyQaOTRx8r6Z446fHce1M4iGQAKq1eT9nD
         9fN47nTVQiGl4OqUvOiG8UnpwfFVzz6FR4w+usLU8uWsauW/06N1n/YFLCZZKWxRyH4i
         R7/dPKvNHSgoX/Tvr/kc+YjsDDu6XJL5DXpINgU9jceaRc7Kzc/b//IDfR8XIBtCLatO
         Sn/RSMqKvYyMDXHn+dYsI1bT32olwh/JptzviumMxF1ZIsD5xPkKffy70e7k6lb0sFqS
         YX+A==
X-Forwarded-Encrypted: i=1; AKwUvBwkLzglgvgB/BKOj4D0kH44wGSPdL8BtSJa0GWUH2M9oeTdAud6Y+ytBknz37PDNZiVkJ1zlGgXnYT9M9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGSTWax9WMHJCptEbo/HRM2STXUMgTpj+qdS3iUmCIX79wP+ce
	LX3AHz03ZOh6jf4xN92U9HGjQWDrXnZbVxwShqY7PN0hBpEmThyDLLoTsD/TLikLaz4=
X-Gm-Gg: AYBFou3ZEMR5T2CDlliDtb31v3H/1kU1xstVk+9HBmeAAAHWGkv8jqHybeZuOVi0Bi+
	PYy5fHVQ2nwDPxy1c6ypwWVdhfgW8XdO6k8rEyMc8HAXimrlCKrKpVXURVNu7z/Snoru9wvN46k
	k6D2Day1yEWrNZAXh7HTpQBwPs5iRnJyVYSYz9dDJ4a/mFj2UwB9NjtlbiOheTCasPVWpSFhwCG
	mkBXurffOn4RS85He6dpFspNKs/5GU+0IuJZXbvoUj237n2kmHWSWGwM/f69X72yexi6JJvmLm3
	f5TnUtMCc2/cpaL32yk7uvdH65JE4xpXrBqS2nH0JWqFON+FyzL+EJW40ItzWAf1uhVSv3w05kL
	/zPFy5qgjXzQ0q49aLPU5WkSGHP9/Yy6tM5qXJpe/REWykGDsgp328CxZSXntxJKBSPsI+JUJ8T
	PdwgJNvrg6Py4C/Tl3YevQxw99mkYq2PqNi23fZGqJD6e31/YucSxrcmy1/qqtunsczjWv3bcXO
	cYx2tNS1B8sAEgYRN43gUC+I0tYdR36c88P4UsePyv+bS6K5YZ/kMQBKpNXSMaRNLidrhTzAFll
	9eK07sxAi9SIi1xt04vNszC9SbjxI/u+Dg==
X-Received: by 2002:a05:7301:1a83:b0:360:4199:ff11 with SMTP id 5a478bee46e88-3674ce2f9e2mr2465279eec.12.1792576862194;
        Wed, 21 Oct 2026 03:01:02 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4381:36fd:9c31:126:4a90:466f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405edd7bsm5915070eec.6.2026.10.21.03.01.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 03:01:01 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: Daniel Wagner <dwagner@suse.de>
Cc: Saravanan D <saravanand@crusoe.ai>,
	Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	sgogte@purestorage.com,
	hare@kernel.org,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed, 21 Oct 2026 03:00:55 -0700
Message-ID: <20261021100057.85647-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <79b5a23a-5ecf-4e96-85c8-031b5eca2867@flourine.local>
References: <20261018010059.83120-1-saravanand@crusoe.ai> <20261018010059.83120-3-saravanand@crusoe.ai> <0ee4d281-61b4-458e-92c6-7fff3e50c0ec@flourine.local> <72fce5bb-b256-42aa-8844-f970c4480ad3@suse.de> <79b5a23a-5ecf-4e96-85c8-031b5eca2867@flourine.local>
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

On Wed, Oct 21, 2026 at 10:19:37AM +0200, Daniel Wagner wrote:
[...]
> There was a lot of discussion during Linux Plumbers on how to configure
> a system for the isolcpus case at runtime. From what I understand, the
> preferred interface for this is cgroups. Hence, pinning the CPU for this
> work is likely a target for it, though I don't think there is a need to
> figure it out right now. I just wanted to highlight this point.

Thanks for the pointer. I see the two as layers. cgroups decide which
CPUs a tenant owns. io_cpu then places a queue's socket work inside
that set. Today our control plane writes it, and a cgroup aware tool
could write it later. So io_cpu would not need to change if the
isolcpus configuration moves to cgroups.

On your earlier isolcpus point, the store only requires the cpu to be
online, so a queue can be pinned to an isolated cpu at runtime, for
example one that belongs to the VM issuing the I/O, even though blk-mq
leaves isolated cpus out of the hardware context masks.

> However, to make this truly user-friendly, I think nvme-cli should be
> extended so it is aware of this and can configure it directly. I've
> merged Nilay's --nr-io-queues patches, so this is the natural next
> feature nvme-cli should support; see commit:
>
> e170d6985797 ("news: document the use of --nr-io-queues during nvme connect")

Agreed. Once the ABI settles I'll add nvme-cli support to show and set
io_cpu per queue, following the --nr-io-queues work you merged.

> I would also really like to have a blktest for this as well.

I'll write one and post it alongside v6. It will use nvmet tcp over
loopback and check that

  - io_cpu reads and writes work and invalid values are rejected
  - an assignment survives a controller reset
  - the queue directories follow the queue count as it shrinks and grows
  - deleting the controller while io_cpu is written is safe

Thanks,
Saravanan D.
