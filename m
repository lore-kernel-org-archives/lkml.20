Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779795;
	b=Fo6aKmz1t6S+/nx0NzFQ7BF1jphL3/bNjA5bYPqKm3NO5dU8E/pmE/2Ng4yWvJvPNQIw
	 XpnAp8U5EhhT0XaC322cLjxWzMKYjMJvSCBAtyQHCKM/qeg1FwhD49FUoqm5kw5bsnkX5
	 Khu5Nx0s+z53fRnLNW+rVM3Xy83oDEwst0kapFWreluY2u9GselkQEKoPZ9M3dYCxecQK
	 2J3la9gVnvBiQaU6IOmoez//zcauJiqYb7jbY5F3dgRyPZd/pQKT/ZBEOAJs5LxuNt2LT
	 iURWEkU/+WdfkPjkPT4dzwge4a1LQaLoV06HkmZCK1GLvjvFX2aE0aU7IDWZ/2SKCJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S8Q9NS04qLtTkf7TWNPkkhniIW2aieZgQ7tV7biAQBg=;
	b=hIsMeM60h98B41VlrebzBpMwm7IJZtFuDiISycFXMSo8oLrdCyYUb83sGuDbTZjDIprc
	 D8gRMpbNnUZGzn+NQq8pXjNJYCqGOCoIfQABuoMYB4RrBZPOi5iw6er0Z17MELFcdncgW
	 rbpLiWeHPS1nUW4IEn8/9FLOVQgGJMS3awNFIP5E3pTbzkLYIJniWjpOydgXxhL2Vlz9L
	 nGi4z6BsR3uJZk+SM+2lo8UuxjbCrX4F/l+8GxYcc5uVR5SQpSQpPn+LQ6SaW0FADQMMu
	 4UMi2OyBFJfZ05fqmJqOn4TzjjHLIrEyUjarg6sPuBGN8uTiUzp0cQidx4rAi/BYqmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oDsXml7g;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A678606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A678606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oDsXml7g
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06454116eso607139b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792779795; x=1793384595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8Q9NS04qLtTkf7TWNPkkhniIW2aieZgQ7tV7biAQBg=;
        b=oDsXml7gRp2+vSS0/21Q5Sw/yLVrE5wzoLLT7o2krA1jGTjYXJlKnRplCcBbBnIOVB
         n0muoR5cMu3ZQcELwYSmLDK6fXLptD6vcKxkJqC5qCqJIv3Y9rfhMHQv4uoGVXaz5b9f
         cEcGPhoUQ4jxdbJEsBYvkUB/9OhKhv4TQextncJ8ZUvpIREQ30BIqu2pgpJt8DO4gqJA
         /FK8Px/jRt7QkqwU6g/cxSJzws2HSNJ8/c0Gq0mpYT7hcw9/rqyFYASBB1pqIhjV2PWX
         b0ell+oUDX//i7T6u/QK7WS3szAMbRO0azw312089U783MT9HuSFE/56ebtqg6pm8KCo
         oQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779795; x=1793384595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8Q9NS04qLtTkf7TWNPkkhniIW2aieZgQ7tV7biAQBg=;
        b=hlG2PGUGRFw45J50KuH2CncQGJdloZOcnibedg8zZFRZ+jMfQg7CIRz3/1KdPZLB3j
         esTVPkO81AOw1+xP82j0dF0kGM82vX6/xM4fcDNjvotqh2szGfps5UQ624XSPvayASx/
         vnJo+FRtMQ1OaFzjPodYn9oobCa+4y4YXANjnyAy+GUhFc08UBRGi9k9XNyc7DVbg1qp
         JhNRd2yezVeXzCYq5Sb3ZtE+X6IAAp25m/G3hQRGZyjiJNd5VvhJiM1vBDpRI35tFVnQ
         hoK5s/b8yJVhCFt9evGGIEHkZ+6GCdZzxXLcLn620LHCTM/cwnkyQuvqo9IR2XNrLXMA
         DoMA==
X-Forwarded-Encrypted: i=1; AKwUvBw/tU7Tq3bNOoWRm1oEhBMtvgiolH5/qqjsE5b9A8eeA0g4i1hWUIP787YvJMKq+vdbAv5gJdoOn2r3168=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX/n61FMYT68rzZxz86vCnxY7KUqyJbJgivsHuU9mfgwjBneRM
	fyUmm0IO59ffjxBpilVVMNu8k5Kk2UqFTLNYgCecxXC7TJqvEtPRVYGof7HvYg==
X-Gm-Gg: AYBFou3P0P8mjpNqUIetn943PFqyJAdOOOG36Mpt2To36WhbLeUPX5TM2rHPN5DuyQX
	SBQDnreDW8RX8Veoec0qeC5sx225HoGouq8VS7+QbLDZEWwMW3UNpFOW5jc4EL/NSj6cdTMsB8F
	9r163+uMy9O7Hyibh5IsgQdIL1pdTEov+2ZbJAurDNO+5Mz9gCIbJTNKaTpWtCbdMNcv4SUvzrD
	gthFkOqvoOKmX+uWarBmemlBliolxSiBX93iIKV/GbrDeJHG8E8VwIUAyCdH/Rucx0F+1QFb5nu
	NvACdAqdiVo3OrM9/Z4qFidMfH5hUKVzUGkClgakAcjlAruwUBB5jzccvAwbGiOL0ib/HPUFh4t
	hjXy32uzSrlCgW9W+3YZ3c6fn6JA7guVHOqoRhDlTS6nFscl+8bd5y3Wl9d2LvnM4hMrDY57bdx
	gwt9IkJD8Z3u/0YSsX7UObO8IKsPEMUjZf8QdDiXh+ZuLsYs27DkxTHDR8UcL7vSeDqQ08XyvzF
	pv24eSLrN4qDTcA33BHUI4369WiA7sA+t5WHQSsQZXujkZQ+uZejptRPmrsjquAAxnJ6GeawCHl
	5KyQOYZ3XUH6lZgQYsq0AkGh6Z/SobV4FsGXBpKysEenHg7DTkhhzrCsG9cGveTXGbHL4OuQtqI
	W6EHsDgDmzO85y6sKQTDBVhEo6E48cQvw
X-Received: by 2002:a05:6a00:b4c:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8a367a2f8famr67193b3a.52.1792779794464;
        Fri, 23 Oct 2026 11:23:14 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm32030b3a.51.2026.10.23.11.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:23:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:23:12 -0700
From: Mitchell Levy <levymitchell0@gmail.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Drivers: hv: vmbus: Harden the ring buffer
 against a malicious host
Message-ID: <20261023182312.2znaexe6rspsonod@mitchelllevy.localdomain>
References: <20261019230950.1573677-1-kameroncarr@linux.microsoft.com>
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
In-Reply-To: <20261019230950.1573677-1-kameroncarr@linux.microsoft.com>

On Mon, Oct 19, 2026 at 04:09:45PM -0700, Kameron Carr wrote:
> In a CoCo VM the host is untrusted. Since the VMBus ring buffer read and
> write indices live in shared memory, the guest has to treat both as
> potentially malicious and as changing at any time. This patch series
> adds bounds checking and reuses the validated indices instead of
> re-accessing them.
> 
> Patch 1 contains the minimum security fix, and is the only patch in the
> series intended to be backported. hv_ringbuffer_write() copies into the
> ring at the write index, so a malicious host can make the guest write to
> memory outside the ring buffer. This is reachable on any channel a CoCo
> VM accepts.
> 
> Patches 2 and 3 add READ/WRITE_ONCE annotations and refactor the helper
> functions to allow the caller to work with a consistent snapshot of the
> ring buffer indices.
> 
> Patch 4 adds the rest of the bounds checking. The memcopy() in
> hv_pkt_iter_avail() can only result in an out-of-bounds read if
> rbi->pkt_buffer_size exceeds the ring's data size. KVP is the only
> in-tree channel whose max_pkt_size exceeds its ring's data size (16K vs
> 12K on a 4K page guest). CoCo VMs reject the KVP channel, so this bug is
> currently unreachable on CoCo VMs. The other paths patch 4 checks can't
> cause a bad access, only a nonsense byte count or a wrong signaling
> decision.

Thanks for the fix! For the series,

Reviewed-by: Mitchell Levy (Microsoft) <levymitchell0@gmail.com>

