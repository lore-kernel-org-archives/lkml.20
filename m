Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329853;
	b=dgM43Arax9tDMDUHhFL0Jzdt/foYmCQx/ExnxEzG/2uS4q3hPhNUWLsMseN63KWo6Ami
	 aXS2HOdCmZaKbQvcGgGn3vGARAdjkOYI+sjvXhnxezeRLufg+WwMcEPS0/nz5g5fCLTr8
	 FpfH3MdfSJnwlJ6SY/DYrhplh14OPy1AM8F6SX0KKp6/PuGxmiSMaImNy2OzV4p4vEIga
	 LM6V181tyBwdNx0GXWA+/F+4UaEtZZBzIe8WWigzDCfD23VuDAnekuEmud1ub81JOz/fd
	 BM2Og+LuePq6ninFfoHK7IbhQE5llrJkl1wcKBdpQ5CRILtCR5cIP5eLfI9W3AZynoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329853;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FSVjfbOy+6Li8/mrEmgfTAZk9pjE0e6I6pX2kMrymD0=;
	b=Wj4bvuRnQpd2ampr57YKQVf+TbOemsno/9Iwa9lLgBqhYUK1AzJMOJ738Hn8UlDKQmWT
	 8K/nOxWuOShXoTBiUEWoHar8IWCTXW6T7O3qGerDaz8GkSxPX8nvXlEuAacSl6qQchN1w
	 EU7S3eJag4zwLWrbSaThkds3ALY/noe5pTih/2w480i6Rp/chH0ulmTqmiJqfhIU0qXjE
	 kqF9IlaXVgIdb0I5fv2dkLQQAY5L3+VG+Wyp6UpdaLmHcFzBvenUNgdkqr25Xd6b1HbD2
	 OaRGWuOd2pFlT3PYxHbpUCrp8D9go4uk/0u/OP99AlZz92RAIwJ0fTGIp0LXkwLrhbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=igskeO0d;
	arc=none smtp.remote-ip=74.125.82.231
Received: from mail-dy1-f231.google.com (mail-dy1-f231.google.com [74.125.82.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA2606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EA2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=igskeO0d
Received: by mail-dy1-f231.google.com with SMTP id 5a478bee46e88-36f6295304dso3005874eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329851; x=1794934651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FSVjfbOy+6Li8/mrEmgfTAZk9pjE0e6I6pX2kMrymD0=;
        b=vcx8ufqm6jL1kSASqh48lTdAyFlQmPd3GwCx3gT1pMs5DRk5YVUdEoaI/CdOuIwbKV
         1YhTq725ihB1+xkjVbQLXXkBh4fA2BsDy3BMELUcWibBFzxZsQggUVU/Cyb2rvfzsLq+
         bwBF4TpnYTfnXatprdMk8VcZtqKBrHWkt9y8ktCbwUDRAl9oG9ElC9z3AjR/ou/rJcRx
         P6k49vdGXalbq7z5P4zNmalhWlygz291eshMe2TrRonEpEv9Iyd9ppvgreCJ6Q5dgogK
         Z+ppHUaoYVeX+6ofbydzfg4C1ljxsqwif9CTxtzc1u8b7q6GB7kZRYhyQIIX/S2W+6Yw
         5uEg==
X-Forwarded-Encrypted: i=1; AL+hErHKIrSpY5seI214avYijcC6sJyxJa55I2n5il8D5HDKntpKmaHKPdIQquv6wjSa1i03y1Qtv6tLCLQ/Gzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6IH7IvOaS+HJ2wmOqB9ADOGVN9bxyGx/SeTslCcrutvhtXgmJ
	0VlLe9ubVI/hrjDAHxh9hfXln5iAOD6Dm2HU8nAQiRKgzuEOwfiLHEW6Ynkjpr7eJT7rSb9CDKx
	cS1n3HejYA4h2UFatbp+VsVL0tt2GEadxH2RtLp8=
X-Gm-Gg: AYBFou2DWIn4Jezab7bNmEF/Ml6/N0/kJGK1XXIX3kTlnsGGD1dWottX4xsp+lS99oe
	448cL3DuYaeO31/MyGYFLtr+xLI/bmTW0GKsnhNNCNTvaKcXzFT2Gakgj6gShFcTwXdSyr/QpFZ
	DtMzuB7TN+vPWJra4on2YHWKsTJF5qCVu7atLT9dgG9hHD7KdEVzIVhaj4ukMv0uS05uDvWGxZ2
	U3KRziP4WsYWdO7ZhtKT+2lHETOQqS+nlu5JvTlFXe2r3GyR2kvjzvfqtN75/HNzgmOUabwaFsI
	3tfPMUXkTKhxHOY96DMggnZfJg9MDjX5sDnFz4eKSJrIoRZJDsNdRPtzeIb/mtH5Krds53MDWmF
	8CA==
X-Received: by 2002:a05:693c:8357:b0:36e:c07a:426f with SMTP id 5a478bee46e88-37520218a2dmr3752045eec.39.1794329851138;
        Tue, 10 Nov 2026 08:57:31 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3751fc3a433sm26539eec.9.2026.11.10.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:57:31 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1794329848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSVjfbOy+6Li8/mrEmgfTAZk9pjE0e6I6pX2kMrymD0=;
	b=igskeO0dU3czlXFLU3ba5Ctyixi/3mpmhqAyoR0afH1i5cZtn9wxirqKTypweqxdarSCf0
	nm+3JYM7Npe+xc+vRZSGXIqiuK/nnDRDiONzihYmVdv+yteq6kdi3HIfWWkoB2UwyhP5tR
	ek4m/meE/BlTy3JjB9lznpSNB9RYcpU=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 919b48b2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Nov 2026 16:57:28 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:57:25 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Ildiyarov <alex@badcode.im>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net 1/2] wireguard: account peer and allowedips
 allocations to memcg
Message-ID: <avNM9dfdW1uULJUf@zx2c4.com>
References: <20261105141006.95083-1-alex@badcode.im>
 <20261105141006.95083-2-alex@badcode.im>
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
Content-Disposition: inline
In-Reply-To: <20261105141006.95083-2-alex@badcode.im>

On Thu, Nov 05, 2026 at 05:10:05PM +0300, Alexander Ildiyarov wrote:
> Peers, allowed IP trie nodes, the per-peer dst_cache and the per-device
> hashtables are all allocated in the context of the process that
> configures the device over netlink, but none of these allocations are
> charged to that process's memory cgroup: the wg_peer and allowedips_node
> caches are created without SLAB_ACCOUNT, and the hashtables and
> dst_cache use plain GFP_KERNEL.
> 
> The amount of memory is bounded only by MAX_PEERS_PER_DEVICE (2^20) per
> device, with no limit on the number of devices or on the number of
> allowed IPs per peer. Since WG_CMD_SET_DEVICE uses GENL_UNS_ADMIN_PERM,
> any user who can create a user and network namespace can do this, and
> thereby escape the memory limits of the cgroup it runs in.
> 
> For example, a process in a cgroup with memory.max=64M that adds 100000
> peers with 20 /128 allowed IPs each grows Slab by ~790 MiB, yet the
> cgroup's memory.current stays below 1 MiB and its memory limit is never
> hit.
> 
> Fix this by creating the two caches with SLAB_ACCOUNT and using
> GFP_KERNEL_ACCOUNT for the hashtables and the dst_cache. The keypair
> allocations are left alone, as they happen from the handshake worker and
> are bounded to three per peer.
 
I wasn't aware of this trick, I think mostly because most drivers don't
use this. Does any other part of the networking stack do this? Is this a
normal thing?
