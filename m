Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567741930F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134185; cv=none; b=LpNpOAj0COFn9SsPvpcTpg1KipETmMWVUatbMKzqmKb3WE+v6S8TOGAQHFH9Vcjgp6qm5ldfPJZeBGy0TUbunkTxeFcmbnEMF0144P2FmuWsYSKLMv/aumiy/HbrQBe0iVc8gvt0E7KvbZF4CeBXX0E8ijGc9jV+ETpKCuZQ/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134185; c=relaxed/simple;
	bh=l7ixmSx2DBQFSzy/TM6rDTUYrvkCKYbQUoHkCMBcAJM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hmRi5ywUzlDDUTp8b6F3DIEquhhby1w5i9epQZUDFdJI+W8lA8uD4FSvjtD3mDUhDa4/iB/2FKAtaejOGmt1irES8KyR4bd/wAojOSbNejXaOS6xbnHrPD14oirsoe8htw6GbTgvmfHxbR59Bv3KDl2xfsXAnmgqk6hX4qTH+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjr38vO/; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjr38vO/"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35943f55c06so919220eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134183; x=1792738983; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DITAd8sokIpEZqxKzLD6oRYcPlhY2SkHYx/2OjgX5aU=;
        b=bjr38vO/hfCFeKCaB0HilSjQUjLx3fUihkrN4DdPNBq8Gw4hIM8F1wG39Yg1SzKOMi
         aN16XQeqS2GsnaylwTcnStHH+CQrEEpa+r84XYMu2LGH6q5KHjb4Ol7vnIIpEL7OpX6+
         HxiClF6U6nas80bMUrKPi9VpdVpQ8TjtdAZk0pfA8fRYAPEuIrwQFqjWQ04Sf2eI5Um8
         Z9CeiLzuRgIcDz2GU1avjfityJ2ZZ0lipKD/4J1ll8p2qCs0mBtsT7jcwR+6HgqZDObu
         sNPU67n9XK273hmRQGy4NHYikGxxgoWz6HLRpGCV9Zok2la/oe5V4ssqhy3Ct08BJ2VX
         +3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134183; x=1792738983;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DITAd8sokIpEZqxKzLD6oRYcPlhY2SkHYx/2OjgX5aU=;
        b=pFynSo6+/4vERvwwcymhxGNfZ0f4gsJtNPTifTjpaDrVCFNMrG9q32ZRvb7TfYDKW4
         2We5WyGz+RPtyxyKkl9j16AyAP0B5rqPi/7yfxcWmDbHNDJav2nIJ3unT6VIUhqj5pDn
         aTggGAAZuGqL4pJwMM0NDI3ntPdH3L68XKYPms9ODx0y9Q3HwsoShwOdw32rosdUfoyS
         eRMaA88SIkj+9hhuC4x0GYLlHAsKCln0MfIU6icJcRPUezuKc7zvbVgl2UOfABqqVEp7
         pCpo+tmDB0NmB8SCFcoz7dhtIqUvAl5uM04zvIm2PQvFixuUvYkqK60ZotR0kYgMzDzN
         itJw==
X-Forwarded-Encrypted: i=1; AKwUvBz4rFbUgAA+iVE7PxkUUgYEXDitsmbCiNCfMlxSFHuQv0uNj2KVVNGkEb8Hcm36IJL9ik49ZDiHLf5yOZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRbYJ06hTHWSEGcpssnYkH7MmimcaZNQoeg/RWNPAIu1fHzle7
	DuWPEETRT4VJBReUOzL6z366dDH9bbvW1fitpGlhfbZD4U06pi55869Q
X-Gm-Gg: AYBFou0BZiJCDpTt0VtcjhqHFSRwvi6lPPFVwI0hCoK4bbSZnWtYBo6QqAeBsCwe5Wt
	GgEigUsfot20A3LLJiGE4ViQZe/cyMVxSzgR/3rzoEfM/PFnp8lcQSUP5LsNcvu5VG9A/P1g/Dh
	2SuNwhEJBnNSCts4u6enGg/NX+OD9Jba1iRETkPrAZjIbFs2OFhBDR7VUZj+DWE4UPGZtz14DEI
	b96QQ9OrIr5dvHU/TgNfy0P4kZGa66VQDg/dSvz+bpaJxtEG0hnclU0Ln7CNnm1nTLipL1ry/m+
	vZbfzbcxhIwcgK/iec/AF+kSVeeAZZWeti68xTPJ6S4KbmPzDPraje7aY6rjJ/iHaymz8lLQVzu
	Q4lSrnjhz82vSMIhpQGVgR4U7seUJUP0ieHw3JiwbONpAmseq+KOBiu0+wTB45wbIJd/N4Ib1PE
	Hrkpr6WfiCn0VTIxzBwehzWKZMkcLwsgWYnCCS7ZBl407mPFrVmf5Xvza1+nFX0lm7Dbw6AiQgD
	VfR+Vyxno7OsuzIFnkdcVv46Pl4AsQxTtG8IL03U3Y8DYo=
X-Received: by 2002:a05:7300:fb17:b0:341:c383:9afb with SMTP id 5a478bee46e88-3602ef82f4emr3051628eec.20.1792134182616;
        Fri, 16 Oct 2026 00:03:02 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm4668641eec.6.2026.10.16.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] riscv: traps_misaligned: Avoid redundant unaligned
 access speed probe
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <aa5755142537d462a9e3d2074d82ad4eef6774ba.1780002199.git.namcao@linutronix.de>
References: <cover.1780002199.git.namcao@linutronix.de>
 <aa5755142537d462a9e3d2074d82ad4eef6774ba.1780002199.git.namcao@linutronix.de>
Date: Fri, 16 Oct 2026 00:02:57 -0700
Message-Id: <179213417713.1857356.17322425034198785818.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792134179; l=614;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=l7ixmSx2DBQFSzy/TM6rDTUYrvkCKYbQUoHkCMBcAJM=;
 b=cQTyZ7Ys4LFHfVIZ6SP4v+tT90fnia8py/XU77akat7vRmrGMf2vevh5WFJNvWKEWTuEss4A7
 7SmfXUvRg8bAhVwhLrHj7w68dMvCfg2ieECT+0UndKI7Y64rs6qjwfu
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Thu, 28 May 2026 23:12:31 +0200, Nam Cao <namcao@linutronix.de> wrote:
> When a CPU is taken offline and then is brought back online, unaligned
> access speed probe always runs even though the unaligned access speed is
> already known, wasting CPU cycles.
> 
> This is because when a CPU becomes online, the following happen:
> 
>   1. check_unaligned_access_emulated() is called, which clears
>      misaligned_access_speed if there is no emulation.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

