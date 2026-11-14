Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652136;
	b=ZGnWHNP3B1Y8VE2li70G35pd65kchbjGEQSvrXKX1t/W+Ze1xju5MoCRFO+1k4ww7kfY
	 6fXKIjSOIVAmyv5PVFiZStMatMuMuRcBHsq2O/uKKkw7Q6VHrpPXT/AFjnvhyCIe3mljs
	 1cDhzZxHGwBXIoFBBkXV1/L3go/0bxCzjU0uofXnuc3Ae/tP7NY255nPDReKfYYbrc/Qz
	 k7cY6oNU064O9ctUvjfka7/jy2ZVpAGwkB8MV9IKJxGjtU/XXO8FX85MyPH+hfIQUxNsY
	 v9JWABiZOwFiVV0Loplbmo+WBht8WIwEfdFdpQck5qx3Ka3VY5/rp0GFi+96y797f0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FXrtt5AcPJ3oF0h2d9fXFeKPAxGtake0pU13yHQcboM=;
	b=LFjzLCnf2DzFwi9suYkirFY5PeyfS/KKypyAeW7wNYHIk+q6vro7ZsbfJC7XUlebVj+O
	 jvntFbFFQBqx2FVGrxtA3CQJh0HSkyhuyXMvvE8resG3seotaBQVYLCUyl5me0Yn85EpQ
	 JWupef7KwL0QVtBKyvkApwSNSyQM91qW396gGPvwjPUpgpgnZDBcVYZju7SJGOtICYdbU
	 xQICluBtPJKGdVKoWCHj4RMDBNFIazXv2w3c0kJWqWGzxifULMsmuykw5NSgCALIRsY8J
	 Sa5YazOw3pkfgMl1SbHw6i2Uo1gGWhx+e1EdF/7szqKRePYvDNlUH6QCwcyNeDm8xYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3fxnZ4u;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAB606A89C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCAB606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3fxnZ4u
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5067a2411bso315767066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794652129; x=1795256929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXrtt5AcPJ3oF0h2d9fXFeKPAxGtake0pU13yHQcboM=;
        b=S3fxnZ4urHbGQaknWbzhn575EndlJWklEqh9m0aizdD+yBSSyzmqENhXFHF5GHw2be
         wjAAspR3DOykarz5SOL+xZOAGjW9WqyFhKD3OZvGMrfsp4MCu4fOY4ENVgqq78+te6t1
         D5wKyvuu331UiNBDnwDBPWK1eUcsvluVM4BAhGKpe/uhlh3pSBJDXGw52qiluoP+/J9x
         k9kDclhHKUTYj3Uqfj2MGWNuRfmlXnDZ3I6b1i9T57YbafLtpTP2ehTSRuTNFXthNVdB
         BWg8Fjl8bOo48DYuPkDkjD6h0FXjpL4c9WsxSPAYRwoFVVxOiX0mj99dZCtRrEVT4eSs
         KNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652129; x=1795256929;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXrtt5AcPJ3oF0h2d9fXFeKPAxGtake0pU13yHQcboM=;
        b=139pQUjE7ehiIbOt6lpR92hpSuZFqmUs/sMjehS3LBGZbNiiVXJ1Tg5SkMt+n2Uyd6
         Y4Y7t120tLSQvJYjjoM3axRnFukP3DuCfCFL1AkulmdnhWEQQUgCphlekx59lHODx10P
         Xxi1Ly4tWP2wSbHHFHAXsxdvfkEepXaj6v5JbPAgg8++IxYobc7VMGN3vAhtRfVBP9cS
         qexCBVzVVw7JnxHLJihVgQLvfxCOMsZN96MNXiEKhrGxNMwLiWUPF4y8H/59ZTUDl6DV
         HkspNAnZdi489KsOPwcut8rmS3gL2Y9ZkTFk3azcG7NDuZakLoPiKtB7x/OHWEHYllZY
         uJJA==
X-Forwarded-Encrypted: i=1; AL+hErHTceMco5HA3c9pmS0cspfLp6PLBpJDHoBFfRC/G68YTQFT8zmwQhZ2kmXykTdfhTX5SqhnJqNSqkWRHho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fdTBGmVZTtl9c3Hq28FIhPsjdi9bus7+LlN1X3Zn8hNqdnn5q
	0E0UY9BdB9kwfE2yej3mrZsGLBeZxqbEwqzVh33V4rD+RLyxo/NWuGLM
X-Gm-Gg: AYBFou3A/qTWum7QiQUXyh/HBfuLo2iGhtExU4SuO651FBmdrhC9OgW7WeEnE465+ZK
	qCh/dB2v38rr54k0iMzAFVu1eZNO4TP4xlO6smARDy5O14x3T/FgSzXyLolaMALv2706qAVy2c/
	FEAXUevrpdp1qtXB6fgiKBqZYeWF7AjTZWdtP1mYGDqwgu353KFdpbcS8Kn2n8fJvcuvWHmDCdH
	pI7Pc+aEfmEz/14hmTzBROpjCHJWqyhQy6pxMQgUGcpRZpTlNFPjL9ehk7uaKEeQwdXg81wiOaD
	63gpzK9W0jfoNa7VUVbM7MYI3vBNPvlJJ+er/fltR0qMBFo6+xUVp/bjb3CIcvfEsPieH/dyI6g
	V5ki3UD1Bx8qLNiruaJQV3qM/WCRc7r0R2QYRROdzjr29MEcYTTZqZ+sAxSlp1cezXeSXxF4N5l
	UG+lkXgqNTpMxfRXoCk6R/YH3E1+AboBd/T2ztbZ4AtyJtrG74OiRg1M7j71GADHOdSpyHiljgo
	/1ML27KqKwV5PCeOHd9SYoW09WzmUOvY3laF58FdMG+2h/UsB3Jb2Q40teaLd9u5+CN/JD3GIUx
	L9zAWmY/YXmPVLK27q8Uwn8NoqsVTZa0M4PhWnCX5iAtGpOelTOGkySungNsvgoiRPozednC66d
	9AhinjTrf0YpZ
X-Received: by 2002:a17:906:99c9:b0:c50:95bd:e491 with SMTP id a640c23a62f3a-c50964377d8mr492804366b.28.1794652127818;
        Sat, 14 Nov 2026 02:28:47 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79146sm198656966b.68.2026.11.14.02.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:28:47 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Giuseppe Scrivano <giuseppe@scrivano.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org
Subject: [GIT PULL] overlayfs fixes for 7.4-rc3
Date: Sat, 14 Nov 2026 11:28:46 +0100
Message-ID: <20261114102846.574470-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull overlayfs fixes for 7.4-rc3.

- Was in linux-next overnight

- Gone through the usual overlayfs test routines

- Merges cleanly with master branch of the moment

Thanks,
Amir.

----------------------------------------------------------------
The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs.git ovl-fixes-7.4-rc3

for you to fetch changes up to 748739f3171ed1c44a30a98b0e0341b1a8d62d31:

  selftests: overlayfs: reject different lower idmaps on same fs (2026-11-12 13:38:59 +0100)

----------------------------------------------------------------
overlayfs fixes for 7.4-rc3

- Fixes for data-only layers (composefs), some for regressions from
  v6.16, which relaxed the requirements for redirects to data-only layers

- Fix a use-after-free in lookup of a hardlink with a FUSE upper,
  reported by Sashiko

- Fix a mount failure right after unmount of an overlay with the same
  upperdir

- Reject lower layers on the same fs with different idmaps, which could
  decode file handles through the wrong layer

- Minor fixes for a memory leak, an error message and readdir d_ino

----------------------------------------------------------------
Amir Goldstein (5):
      ovl: do not read the flags of a put upper dentry in lookup
      ovl: fix leak of lowerdata redirect on ovl_get_inode() failure
      ovl: do not check the deferred lowerdata redirect on index lookup
      ovl: do not allow nfs_export with data-only layers
      ovl: report the requested redirect_dir mode in conflicting options

Daejun Park (1):
      ovl: bump the impure dir version when linking a file with origin

Denis V. Lunev (1):
      ovl: release the upperdir/workdir in-use locks before the umount sync

Giuseppe Scrivano (3):
      ovl: do not always clear absolute_redirect
      ovl: follow lower to lowerdata redirects from any lower layer
      ovl: return EIO if the lowerdata is missing

Jérémy Jean (2):
      ovl: reject different lower idmaps on the same fs
      selftests: overlayfs: reject different lower idmaps on same fs

 Documentation/filesystems/overlayfs.rst            | 24 +++---
 fs/overlayfs/dir.c                                 | 20 ++---
 fs/overlayfs/namei.c                               | 61 ++++++++++++---
 fs/overlayfs/overlayfs.h                           | 22 +++++-
 fs/overlayfs/ovl_entry.h                           |  2 +
 fs/overlayfs/params.c                              | 91 +++++++++++++++++-----
 fs/overlayfs/params.h                              |  2 +
 fs/overlayfs/super.c                               | 52 +++++++++++--
 fs/overlayfs/util.c                                | 12 +++
 .../filesystems/overlayfs/idmapped_mounts.c        | 45 +++++++++++
 10 files changed, 270 insertions(+), 61 deletions(-)
