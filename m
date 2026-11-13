Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530282;
	b=NxKoW2rLQHQtVU434LfTRGPiDaAIbkLvvggFWIfDn10dfrHYnml5I/2LqtA9ELOvGyZZ
	 M221BB84jxWZ/IjCfPEIvQ5vuXKD0QvTYHVCpR8dgwTy5MaZoSVB/2wp6jWN0wscnJ73K
	 wpWfH2egw+t8T8VDzvV5ydNVG7x4v5/5RE3051ibI1aLigg2WYUnY5Tuyr999l4fgzHzw
	 4Xmx9d9mtRYtGWL2oTbghk+QuXynFn7lJHIKJSfi5cixjJXXlHyJxyBv316aUTUTX1Tm2
	 7hIAxzUgT2wcnpRTMiKNR/NZYP/orMbEp5JN4R4Cc9ut0OSBIFiEwvvnszwX2EikxbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zGnrGgV51ZfRMc1cSUcC07752LjxuuaOfMYKT2Lu9s8=;
	b=dnpQ4zbegwoj+8xhYNpER4LIXSEjIr/MrotggL17xIW/rrzDnqjJEMSGaHmk5do2w/zB
	 gIzX3lxwvGQcP7ie9xKHsvUz6vRxwBxnYkZNPch5wOadd6EQT4xViXbeMEnx2E/Z01jO5
	 4Bq7rvraaB7R+cE433boZdjm6PY1i7wAXjkTfYBQZt8SpAcsG59ztsBUM+vzLOZEIg/rk
	 LFMMIfEwd66orHJzcQm5vNJ2vi1fsVWB6sdS0KeERpKuI30wmhRTM7IyrjAnNH4no2/Cu
	 yCUAlR169zI8/VBjqrKFVeYhzyvEFIfXGojr4DF8Wv4j0Wn+toD9jV7m6j8zxT9pL6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qt7xbgCD;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A28606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A28606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qt7xbgCD
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be7b9abc8so324692d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794530281; x=1795135081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zGnrGgV51ZfRMc1cSUcC07752LjxuuaOfMYKT2Lu9s8=;
        b=Qt7xbgCDk5woTD8moFfnVvQd9sauI3GkWJN2k2jEW5l/VflCusDJZVhOTjuK2q+rz9
         7DQa10YnplDxPU1v9zOsbvXfA6MCxHOLGYRW6+7xNy7lqVhk+1AhNa870T/BuRXxuEH3
         AmxpO1FsnfCgv3H/zsn3WUyc+hKomwTsesF2zwbp25vFP8HdiZN8L7qakQ0O3/aYAZb9
         shj7JedViV3ddSQBGhsJ8e8D90JayGu43JjL+DafbhbU2AGiSpj6gIWlnFDgWlE7cL/H
         7cObd++RV2ZFogp3t1kfPMjug1WJKOypnFgoyiWnYkp1zsvwRFMD0tmC2copeDSmv9kb
         AKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530281; x=1795135081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGnrGgV51ZfRMc1cSUcC07752LjxuuaOfMYKT2Lu9s8=;
        b=JZ7l6T4ySB8vCY4FZ+cDrJmGxiC5wfiruxyS+v1+M5OaIFlDUJIv0bSrHI0KI36Rdn
         byy5Dk6r2KQdXOgxdGTUTSbqA2OHkprHS0CEyeacibvFiJM9uf+rLSeb0fGqZhGVXidW
         ZUHYMNQQFdaC5Sl6l1hE0XKTbK95JIjDP1YoaExxn7wIWgc3pnK9x+Y5hWGXnhMbVFaC
         RNQPf3WZCh4EXXVbBnuinQkmRCUTJVw2psV9EPHbkHEpku/ko6BCdGDaGpT0C+3xNS8i
         pW49hAW3SMfZ+pnlrAxHVEejIkGnDnmNYuleRPQQrlzbZmJLP+v2AoR1DtLnv22PETPC
         Zqqw==
X-Forwarded-Encrypted: i=1; AL+hErFQGfU3B0j9nRNtGDZeAvHwIMlm+476uL4vfpF7JtuCuoKYZMKwGJW6RpX36p0NScijngcMRtdQ0rbQrPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z84NcS7kNAjdGZ7UxDpDUkBvOGOoZn/2cWio9wfZB1lRFiorrU9
	FBch91BLxkhmArzjZLuCMrt39D96GbfhilCnIyEezmBS5SjxJ5mxRq7SFM4qSLVJngE=
X-Gm-Gg: AYBFou0AXpMqer4N6K6UEn/lvsknWuF8/joJoyyXvNbSXRvzy79fo9yDCQ+LBl2TBR0
	cimrXsIF2docNGW0S+RaXwMhwgi8cfDli3RwyxkiT+JUWoAX2tlDJfk48+AFJwAOeqIXFKjtrD7
	+SJ1zpt3neEkpQ5AFSTS6660T+qtjrFHfyU2H2WlHB/JyCxgw72rnjX17RLNhSqXn+Or2hcVKZp
	DX4tONXrvLXMxAABIaC2Ndg1usu+PY1GMGIYkCrlLz6og6lApacxDao6t7Jlt5HK7bIgg+NFiQm
	fdoR3+ZRGeDuTzW+7Fu4IKC91RGxHUzMLK9S2idrLCQw3su/mZKGnfW3AKfyHyUDhp9u3aRbpil
	3Zj1za/bIQ0ftVYIGbGrg6TiEuSYPeZzXnef0JkZWaCSjDddkNzGrRfOyC/rWgEaeJcu35UcHpc
	9wtKMSAklDzgZEaUilBgK8BkIYcKtvVYycg0yaRQ4Bqs9r7oD7IYPf1l/Vf0vTZC/EVY9bbUVvZ
	GubiX3pZafL9+j0GW0KsrZM/L9Pt7gDHUq6zMHg0ZQSlA2g4Bxx2RFKmKEVYnhbwYGdYu6MQZkk
	jT9uQcxCe2gMyMxh9NOFDAjxyNuPDl/fFkA//AmmZwi14mWtGyIpkBXqr7qAwXEndEqbkSM1xsQ
	6aCv57vHaAhCl9nLliKuCkdQW8fF7lepbE4kg2M2yjtF/Voo6nyOlhk1mPa6L04XWZN2lA/c=
X-Received: by 2002:a05:690e:47c8:10b0:67c:1c81:fe46 with SMTP id 956f58d0204a3-67d898314c5mr465618d50.91.1794530281004;
        Thu, 12 Nov 2026 16:38:01 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:3a31:6c95:5610:70f6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm706463d50.10.2026.11.12.16.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:00 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 0/2] hfs/hfsplus: don't take inode_lock in ->fsync()
Date: Thu, 12 Nov 2026 16:37:54 -0800
Message-ID: <20261113003756.1066989-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
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

Both hfs_file_fsync() and hfsplus_file_fsync() take inode_lock()
around the metadata part of fsync. For both file systems
it is not needed: the inode's metadata is written by
the same ->write_inode() path that the flusher threads use
without inode_lock, the b-tree records are updated under the b-tree
locks, and the b-tree, bitmap and MDB/volume header flushes are
per-superblock and serialized by their own locks (mdb_lock in HFS,
vh_mutex/alloc_mutex in HFS+). The lock only holds off writers of the
file for the whole duration of the metadata and device cache flushes.

Drop inode_lock()/inode_unlock() from both ->fsync()
handlers. Patch 1 is for HFS+, patch 2 does the same for HFS.

Viacheslav Dubeyko (2):
  hfsplus: don't take inode_lock in hfsplus_file_fsync()
  hfs: don't take inode_lock in hfs_file_fsync()

 fs/hfs/inode.c     | 2 --
 fs/hfsplus/inode.c | 3 ---
 2 files changed, 5 deletions(-)

-- 
2.53.0

