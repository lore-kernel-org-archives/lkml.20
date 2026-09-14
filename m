Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CB489FA4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408325; cv=none; b=EkUsITk5ZuqgfGuVEDzhfSfhO1X0fOlZT+i7/CzmIfBNYDQ35VCh5HokWQaTwikijgVoE+sxrCnqLWFfnimkCFdOyl2grKRPPEtR1EdFoFiTE+e1kBN4iEu3HhigpIZvKQmwCrrB8ianU0OVnTLJiaq/E0tDgD1noO0zVEpbjGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408325; c=relaxed/simple;
	bh=hTM5uHoZGmLuqNP2Jl687M3jiQRxJw0VPJAxKjDVRvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgqG0XS/H58WhgkIO7jEp1vneoZc2jV+4jL4xhuM67u+343yM4Go0RpXiZa67U0VSzWdHitJry0iyIzV0KyVCkZPJ6uItSQJl/DknPcHGO6kvj4umQYyRwrXdmBIPGjP6JQ7kNhSz8ZEiQQSNmumWRETARyk68ril0AWYB9Pal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYxa8Avt; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYxa8Avt"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so1289366f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789408321; x=1790013121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTM5uHoZGmLuqNP2Jl687M3jiQRxJw0VPJAxKjDVRvQ=;
        b=HYxa8Avt6xK4Da6XnPkPY+quHwlp6tH7ubuAl/RzJ2enGdeK1LS10HDxNQBFcvcx4j
         yTuE8HePQm2zQml0eb/T0d9/a9ZORRkMjCcR/tGmVevffMqzUr2aTJ/Ni37kzrFMK6Ak
         AqnyNoZTZG75OqitkpTny1fSpo5J02wDi2i7N57B+pLm8rSTTcLzsMOMg8mgt6EY/uor
         49wsdFV5+CzOl15ZBfgthZGURUtLyAqNZBQFTk3VkU0sW/z4ewojPqlBDg5mRC2gYhvt
         8xCPgcCvqtA1St3tipJYdhDwLEKVAWA7B7HjRw9lxAav2VTjZ+p/QSdvPuSSVkgxvab3
         oBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408321; x=1790013121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTM5uHoZGmLuqNP2Jl687M3jiQRxJw0VPJAxKjDVRvQ=;
        b=cSJ3xCQuRrGZcz6rTBtVybfEpjynT+cdWTo5t3ydR1+djIfQC/7hMXF3d8mCTREbrQ
         Nt84EeKgEAdw6HZzCRabexU3M5X4NCVhRJHdxMMbJCr5nZVmDdyujwhzU/xxuZzOQKY2
         fORL9MUun8f7YilHKjLXRikbQ79Qm9h5dLenn/GicMYqpZuURIC29M0HyY5k+OKy0+jB
         0cuA+yb0NGh3bqpqpZycJ66y7SH9+tQB2PXHvboQPqXZjc+l3aiufg9OLmacfWsJXayW
         /MouJPTNkYj1AmGiT6FHt689Op45llr6hB4ya0soZlJHv7aRBHvyWsoMbu7BdkdJfo9p
         yR/w==
X-Forwarded-Encrypted: i=1; AKwUvBwTUAV4Lhscl+dB2pBtsiRkFUojNGzkPXCnnwqWuGNTBrL4cffIiOx/80SxHfU760x/It+N99/xmcLKXjU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBRcpJmHNurXr6Cq54MDRwHFS7/tho8oUcKSXGIx1XpmUfHz5p
	FWeaq5gCyITa+wq5+o8nD+yBaIEMpS4h7hfjnNHf4yEid2bxeqe0LVAN
X-Gm-Gg: AYBFou2fvH9O/6Ics1Sr8i7LOKB+7HDr/GB9sib3g1PK48IfXOmO8yWSYWqDykl90Pk
	rRHOhKrVwxgXisa4yIKzDcrtwpbfaUrUcnWHaFt8baKEAZJBjqVElk/d0drZI1bkdly5leVHE9u
	rEXkToer4GL2gBRR/InLfbuSPZh9woH4CnAGjKFUrw8MSLa3QXt29EAqyb5cej6stAnnoM5uqig
	V2m60tLHkePCvc7vfZ085BHQE9Z/YdLI6I1qJ2n1OgklkQIuR6uqE8+DixJKVVvxhpNPK/BPb1w
	RDVWZuFvJfbWmJ/n8XNOdloqGUbPcbe7tBxhFk5MtzrgM9ORAM+VAk4F1wbfHCljBcagrOKRaIc
	9D3oZ10d/ze1NFnEFxNwtaKsIfY1jpwmq6eT//9ffoP4u8McFb87L8NLdCrEHqQdnBdy9L3vSp4
	y0ENd+zqDCiVhaHmm/VToCTiNOTTYdhKCBBuAvrwTsH5XaBDmOMO/1nvvBLyGRGNAbg0GNBANYW
	qEiU0XFmXaEVAO+pEQ19XhNPwpJk/mueUv7aCXGvzm1/q8Aj4NIX8A9ON2+ONtzqgrFdlBowNJf
	NGIDHI0=
X-Received: by 2002:a05:6000:4603:b0:486:f199:187b with SMTP id ffacd0b85a97d-48704931bbdmr2343965f8f.34.1789408320841;
        Mon, 14 Sep 2026 10:52:00 -0700 (PDT)
Received: from mskvarla-mac.redhat.corp (adsl-dyn98.78-98-3.t-com.sk. [78.98.3.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm28114280f8f.24.2026.09.14.10.51.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 10:52:00 -0700 (PDT)
From: skvarlamatus@gmail.com
To: asmadeus@codewreck.org,
	skvarlamatus@gmail.com
Cc: ericvh@kernel.org,
	lucho@ionkov.net,
	linux_oss@crudebyte.com,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stefanha@redhat.com,
	sgarzare@redhat.com
Subject: Re: [PATCH v3] net/9p: add vsock transport
Date: Mon, 14 Sep 2026 19:51:56 +0200
Message-ID: <20260914175156.75298-1-skvarlamatus@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aqautUJPkTMvmIGU@codewreck.org>
References: <aqautUJPkTMvmIGU@codewreck.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 13, 2026 at 14:09 +0000, asmadeus@codewreck.org wrote:
> I've looked at v1/v2 threads and I don't actually see any rationale
> explained: what's the benefit of this over e.g. virito or xen
> transports?

> Do you have/use an hypervisor that cannot do virito 9p (or virtfs) but
> has vsock or something like that?

virtio-9p is only supported by Qemu/KVM. Vsock transport works on any hypervisor
with vsock support and allows using userspace 9P servers.
The motivation behind this patch is primarily driven by podman machine's
use-case, which is file sharing on Windows [1] [2].
The hypervisor there is Hyper-V/WSL, which supports vsock for host-guest
data transfers [3], but not virtio-9p or virtfs. Having vsock transport in the
driver would simplify the codebase and make the use-case more flexible.

> On a similar topic, do you have an actual server that works with vsock?

Podman implements its own 9P server in Go using the p9 library [4] with
vsock support via virtsock [5], but it runs as part of podman machine.
For standalone 9p servers, I only know of diod and example implementations
of various 9p server libraries (i.e. [6]), but none of them support vsock.

As far as I know, there is one 9p FUSE client with native vsock support
(my contribution) [7].

[1] https://github.com/podman-container-tools/podman/blob/main/cmd/podman/machine/server9p.go
[2] https://github.com/podman-container-tools/podman/blob/main/cmd/podman/machine/client9p.go
[3] https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/make-integration-service
[4] https://github.com/hugelgupf/p9
[5] https://github.com/linuxkit/virtsock
[6] https://github.com/hugelgupf/p9/blob/main/cmd/p9ufs/p9ufs.go
[7] https://github.com/ftrvxmtrx/9pfs

--
Matus
