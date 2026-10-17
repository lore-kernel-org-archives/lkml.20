Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617049159C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792241484; cv=none; b=tIyOdcomdx6buukdCsiyFGtPfDSKs/xEmgJz7SSaD3U5EI7PC2GpeD1TRif5K4ZYLM/EAg6/ko9soT8EphW5WKy6QBPRT5T8xi+9v1p0j5JhE/MwhRxBwvAzoM6Za2do9RhUbJjXt36Lfoic/EzrG130eGlODsbGUOSwVCRI+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792241484; c=relaxed/simple;
	bh=ejhKqmQASVCjBpB6Zzm6onKZzFwjxIZTAb/mq8y168c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TExkBwfTv5Eialh1WKryZ16Aygs/y3MOS9qgruSjPAzzEH3WDqt+mTdq+/d6lTrJTp1X9jLs66xOe9UILy4R3OTNIF4CvlfU9WkvVBVHOUdCvLRsSQHNgoBiaDKcaB6xlDyx43MTlf8LIto6L+uYXEwBaH6DcCqLJqxDEkXBOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLtecz7k; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLtecz7k"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e915887d9dso3330045ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792241482; x=1792846282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejhKqmQASVCjBpB6Zzm6onKZzFwjxIZTAb/mq8y168c=;
        b=HLtecz7klVYY7tyn/NXtELa5lanybttTeR2gU+zEnB6ZccZtUf448HmuCIbEz9qJPu
         tTGK1T4RuqzOkHG1JWoxNvzYhuhBVdg0m+vPBNy7YeHLrWKMc9kmjCCxdZRbSq/z2F6I
         E4tKPVPxp5bzsEkfYE0ZdNhOR6iOsry860Fc4H7qCxbyYnwX5rYAvXJN9854eBHaCQ0j
         fI50l312PVIYDVYv2uk27Eo1ASlcOg5OdEWMH48iaZWmY5sUtyVzzpTq8S3qKWqIHMjr
         jTpMq0s2nTKWOX3x9oqxLjLILbaPPX7DZvVBZzKoy7CQqAw1Tyrce/i3vFxS+c7DuND8
         Du0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792241482; x=1792846282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejhKqmQASVCjBpB6Zzm6onKZzFwjxIZTAb/mq8y168c=;
        b=Ri8x+7o9kVYh8nGR7GZtPCSs3knZl5UCKUQ2+7xwgMY0u81Pe4epTvMBEp78bwhzGw
         fZ0h4NDSW8Jbh+7ZIRRaIaOL9ksVeft7jQ1+PHGu6qmo34Q+EztB9ldNxPkm+HGf37wf
         +G3AUMLIhCckdrUB1uIiOcDdzc3OV5cZmtesFzN06flbwvgZhcZCJsyvjm2Jz1KJDehy
         cdB1xHBlC812DQBBjz+Lt7HVI/Dt4xZVuvbOB/ozNeEN2vEjam56z3GfSpRf4TeLQoHB
         99XQ2E6nl1XQWFFL01E2HVPu2Srbk3SQ4G2wDtGgN4f0hSabKKQGVgLxmI3nXmGmxLeZ
         HW2w==
X-Forwarded-Encrypted: i=1; AKwUvBxjCAmIpZ/gkhlQE46R0KU++DhBp/A4mIZOCZh/kjzH2AOLez5Yvo/3T6pgMbkfo5taEYfbOULTV7xYPIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3YVskmvMRilfeeBzdCsHholPwTgtQs1qua2ub8GPjHCmrs6cW
	da2A7hzi08FJQ0j/q4BS/PWvhT/hMiryKXyjQjH7kvlhKLHQgQCMTFtmTM+rgxHq
X-Gm-Gg: AYBFou25tCRAjtDIHuefxWJgBTdL9ZuF3lobNui31wZCzLgQGBsvy2bubke1Qx21Uzm
	85VItC6Ww0qWXvFHJ7KgNcAvFVZsLesT6YlHrUheW/sGyGNeU6OaB/5XfTQpZqrXQbgI2lyO2yW
	R+DJNoxtTHx4v4OEhPaJ2VlZoXF+jI1epCb8LNFdGcGtyRkK3d4jRMUipQFKJoqZBgztiOQ9DnW
	7iR47emPI9s2TgLOLxP/pIX6h2v64HrHml0aIxngHDEUgRPwkOKehd5cw4OtMDEMDeawJzkLVpZ
	P0IyjnOKOV2d3q3ab4gdAU6QgGO4dcIAe3gTUlxBJpgNqg3gkSEAS18zT7usqJ2fJ04yKXrs+oG
	DrOfZsUavpy3Kb2MKWpn4lDqyyTXuXVNRqj6d2eoXY8upeNiM9uTyMnUO18ZRMV4ntWLtTVtv7+
	QF9oyVnWfAJa/0kPUfL0vy1mVRd852gjU4avI0UQDQ2tMigH22MHDxcBED4hKOuwjCJw9WRdBDf
	tBETYBcXmjC7XGCffW63cit1O7Tur9fGdinTcF6Duc9CuY0hDdMJ+v1R/XWUbgnsJP8eoZVwIBj
	De5zEyOlLGXRn08=
X-Received: by 2002:a17:903:acd:b0:2e9:6788:9373 with SMTP id d9443c01a7336-2e9a68d9118mr21964585ad.17.1792241482151;
        Sat, 17 Oct 2026 05:51:22 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm22014615ad.74.2026.10.17.05.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 05:51:20 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ALSA: virtio: fix staged capture ACK ordering and period scheduling
Date: Sat, 17 Oct 2026 21:51:14 +0900
Message-ID: <virtio-snd-capture-reproducer.e56fe77fd0dc4571@gmail.com>
In-Reply-To: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
References: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I've prepared the reproducer and build instructions for this series:

https://github.com/whatisyourname0/virtio-snd-reproducer/tree/88913cb432c3771d179a274e3b622a22b03bb9f1/capture-followups

DEPENDENCIES.md lists the exact base and prerequisite patches. The
preparation script reconstructs the pre-ACK, ACK-only and ACK plus
scheduling trees from those patches. Each tree matches the source used
for the original tests. The two kernel patches in this series are
unchanged.

For patch 1, ack/ extracts the baseline and candidate routines and tests
ACK ordering and refill failure with two kernel threads. I rebuilt the
ACK-only kernel and fixture module with KASAN and lockdep. All four
cases passed, followed by module unload and a clean guest shutdown. The
fixture supplies test queue hooks; full virtqueue coverage is a separate
part of the test setup.

I also rebuilt QEMU and the kernel with both patches for the capture
regression checks. All 24 captures across four/eight channels and
one/two vCPUs matched the expected file length and SHA-256. A deliberate
reader stall produced XRUN, and a fresh capture after it matched the
oracle. An eight-channel, one-vCPU run completed 70 seconds under guest
CPU load and a subsequent ten-second capture without XRUN or a data
mismatch. The kernel logs were clean.

These QEMU tests use a deterministic synthetic source. They cover
capture correctness and recovery; the VZ comparison in the original
cover letter remains the evidence for patch 2's scheduling benefit. The
ACK fixture uses the ACK-only tree because patch 2 changes a shared
helper. Both build paths are documented separately.

FRESH-BUILD-VALIDATION.md records the source and artifact hashes,
results and remaining test limits. The package also includes the QEMU
fixture patch, the guest build recipe and the channel/frame oracle.

I'd appreciate guidance on which parts would be most useful to keep in
the kernel test suite and which should stay with the QEMU test backend.

Thanks,
Joonho
