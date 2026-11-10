Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349122;
	b=XkvMBlfNCRnvdKU6cXjAcPIeofS7OfCp5ySMFR9hKCxTtoiLyTq3r3nE2WfeXn8ag+o6
	 cuDcYMQZEUe61FoCQC+7Ebq1yMPKbTpN8p/McK2R50YZ4x5AIKR9wCADW5c/I7xW2CdRp
	 5+JP/YHzSqZ6m3O1UOe5QyNe5hOWEta59G8069x6RE13cfFoIdtHjFhYz9hSlSViUJnzW
	 6Weh6AMeWtkHn1OdobIJoWxUQVn1YwHoqkD7npV1+FOdBKnp8sEewoBOz/t0kVj/H678z
	 Z/MngKA2WeBCpaK93VXPZeOWL3cEuZI8+rAzeJORV5/hJcwm4B1h7NUtsPgSAzU33zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349122;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mMAZKQAFME8P3yklgR9smhNvOT7whcwIN/YXkT24B7k=;
	b=kcJmas8ILaUPrvT170jYkNIB3w2dAK9vX3+eOBuFn1m3AtIOG1Qz4+sxNXLR2cIZj3nT
	 ktj7/NaJi7qMxscPhTMTTbSO0hPXD44PxkHSv/9i58q0OEDztgwWTEwl8BoStz3Ruu/oh
	 IK0qIqaszdUFhABZkgacjuTQT4kqCXlD+bi3LPB0cnsj+ZLPa2qkpeOIezTS/ZCXSdlt+
	 ZL2M1mUSvJ5Rg+/kFfUgZhDwpCVafV/W/SOSo0MKo7cKQDMi6Qi7oq4NWkjAb+V2vva8T
	 DuuVtYfmEpJO+Yfjcib9aIgBa082JvqEzzMjxG1pOTbxH70Eibwr+NOd246n0tDxSgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=La40Nucr;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EE6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=La40Nucr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fJko3etiBFrEh3/Db7V6Hp/x1IoP6O70SfBSmJFkESg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794349118; v=1; x=1794953918;
 b=La40Nucr2UDJ8QIyB5cj2B3za8riJvJPVAzIUIW6jpX8Ls2zCFuHM5aDhjBhHzLIS+/c7xQh
 MUBC1MQkD2XFRMejo6wX3sBMK0gVaXRqv6Xs5Mdn7F8EfFdIGyy8EGqY8IlbA3EBjBe4pWUvvhR
 OAwWyHgsRJXxX15eSs0PclVQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id bd0672650117ca00;
	Tue, 10 Nov 2026 22:18:38 +0000
X-Mizu-Trace-ID: bd0672650117ca00
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bradley.morgan@linux.dev
Subject: [PATCH 0/2] arm64: signal: Fix ZT restore without ZA and clean up bounds check
Date: Tue, 10 Nov 2026 22:18:34 +0000
Message-ID: <20261110221836.3265929-1-bradley.morgan@linux.dev>
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

This series addresses two separate issues in the arm64 signal frame
parsing and restoration code:

Patch 1 fixes a bug where ZT state could be restored without ZA state.
If user.za was omitted from the signal frame, restore_za_context() was
never invoked. When a signal handler touched SME before calling
rt_sigreturn(), thread_za_enabled(&current->thread) evaluated to true,
causing restore_zt_context() to overwrite ZT without restoring ZA.
We now mandate that user->za is present before restoring ZT context.

Patch 2 drops a duplicate limit - offset < size bounds check in
parse_user_sigframe() that was left over after the switch block from the
2017 frame layout rework.

Bradley Morgan (2):
  arm64/fpsimd: signal: Require ZA context when restoring ZT context
  arm64: signal: drop redundant bounds check in parse_user_sigframe()

 arch/arm64/kernel/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.53.0

