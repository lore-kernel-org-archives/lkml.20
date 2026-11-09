Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201385;
	b=IUVOPfjAXCCieWs6rqYn9xxRs5oW4aXVg6spZAAiqH+UELimnAMv/LmcUjAHQj4ho8tq
	 6DZ9kt83VCv6L0P7ND/Yayk6Vdr4FPDRNIdRTCj1H6KPZgmEuYbnYkbWESYH76F46CDfy
	 zxIj7uh+Wuo0z4dAg8wD4z90/oDsCcde4IoUfzWUIcLAf4cLU9qZFg9XjG5jLYcldX4yI
	 UvYM+pPQRG83bOPJ1eP3Fakxgk0mqPaEGe6IqPKajfz6YdGYP2obTaFDAsnCYhF1nHvsv
	 uSOgbIaQvkzxwGiYXH6c36SRluEqu5ELYiyDmlOkrvz5UBkNRt6XngVjIMRxbLY5vPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
	b=RjK5mdgW52do3hObBYC57Lc7CwJLtq2OJqF4OJeqhOMuz5eeXP79uDxnUqlHYGdgv4ok
	 O5AqTNCkUjWunOPE3WT3d3Cv7NdDqkUsmmm4u9WyrMyVMWkxNg1X278ARoewIzDZgPT+C
	 J5LSlg0GueKmgk590rKwYPfEn20CPQDvflxKNYn4YKNoEQ8661OKcMcP7/kVCED+aK0L8
	 0nmKxYIJr+O/tWJrF/keM8in0EOVtuMiAkkKN2YvO1zDyVXEvIS/+pFl/IXcUBwPk0HPg
	 TyYNQWfcvm+Gx2RcP835Bk5r5v7458X12426mgddD3EdeSToqGMAxC5Nd8H9Fm8j36g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYXvoIId;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56A606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA56A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYXvoIId
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so161611c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201384; x=1794806184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
        b=yYXvoIIdM5xFxQUGoLsAq32Y/XeeSUHJ8SoLEgdxZpswbiSUdGMaPpgsaMzEMzKHzo
         8tKee/tcbD/5uTM/XuXWnA9TitmfBCX+hrNYqn+zk60YBQVXnUcf9osk5FrFfFSBeUTZ
         JwPyRln1W3CvY+808BXMx5RJJH9DiFmJzwrWh8LiHh9k2uzn+AQfi2kUWbkG0fUAv+ah
         IrwEEb9VYkk9HA4+mzAVHbuqn/6NN/BJL3Jnz3oFNola/rduWqpyFtVevnus1TNGwMQ+
         uvzmEgMydgPaO8EqE5LXHoQhVhRbQTu/JVzHY3b4c+tWlXrIZB3jgz7wm+8UoZiXA4su
         chDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201384; x=1794806184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
        b=jwQyHyNA1urdHO6F5QJJkY+E9RQx/kjZuzXeQGdUgnrR2/KRaN8bfOj1Y7ukOQqLCq
         /kwu+A3eLSj4YIXEsrqHXNwu7fttyW1s5yZLsGz+hOrv0Egst0JX2C84QTNP3GELUQOi
         6KYqp9OkLU3reeofHrg0y9yDfmRxcyQvcbAnJmTF0R4f+Fb+AqyY50uZhfJDADARtzgp
         C/oSDAVGF/m87G6Yei4Ekdg3AF10ssTMbwhWWF8DjLBlQvF/nNYjd0uni4KNwO9UoKmz
         Q7jJ6UWU1EDSHEkTcFuIuxDJeKg7V77IFH3NxUhyQbupNVRpjDMCL4p8pOEvkFL8h8uz
         4PfA==
X-Forwarded-Encrypted: i=1; AL+hErHA74HZhsfhm7QhRmZ+6R3f7cqI/nQ+InTJMVyBw668l7FM5h9ltQIizZu1+3gwJaFNmn2HWtIvSBbAf+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UjzuYRXe07G2YKaLpueWOrWP5djRmlIPqn6bAQP8Lc/VVAMTc
	RmU5xHe6IXZYUCuPMFGjrzYYH3wN+5J8osORoeZsaz8gK8YGTlkH4ts8
X-Gm-Gg: AYBFou39HjIA5IPy+TSyg6PDPBagjvAXo+FKEvPn3KcgWvhROYSt2jTJUazDHw8xCjw
	z4li4ywoVUxjtsPG2BttdfIsLxFK/ccf0wgj2UjUS57Sg0hKQAMriqutRpjECC6xNFb/SNhgPpG
	6jzgsxm5Pr2EbmerW7hbuFHlq/TloQxSDMOks1ffCWPoAj/Owxo8fVUcXcEP1G7u0t8BySNJr5z
	i9EOsOGHUpBmfgUU7uVpLile1qGgeXIyE63F0ic4JqcLI5WFFUINxgcNN0DAMclRQlA7M3Y5g6i
	W6baGNI6VcAGP0eF2JJZjMhnA1kcGyGRT29q1m7oP4eNwMMeAfhsVGo5taVSvHcVTxKNtqpDE/g
	ovBfDDlLstuRFZM7+b+dPDZZrPOr/hA/che15O3j7WqmtlYbApEX05wPnw8TH7PtyE8ao0hirBh
	C7kVJQSVB8i+DaVS89jGrWjfZMOaKj6YuHRyOpLhixCXZGwrqjCtNlBtyV5GFBDH3eBtm7IU94e
	Y2WnG0ZHbgxOcDps7CyY4hpi0ftpRBzAtWFQk83LePfqaGgsHM7bOD5+ibQItaUQvxDyAwT89LR
	ROGO600GGmOuHcgItDpQ+aIfbSXA0Q5MgTYxv4izQg7CZtSZRSQ8VRk04AZjwePCWqWTI/cIUXs
	LjmQ9L4hllLxvM9R76JTr5BzUFEuAboqvNNyli3foifoTKrk=
X-Received: by 2002:a05:701b:420f:10b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b39ff1d2famr4693747c88.45.1794201383745;
        Sun, 08 Nov 2026 21:16:23 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:23 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v22 00/13] ALSA: virtio: validate PCM ACK and prepare completion
Date: Mon,  9 Nov 2026 14:16:05 +0900
Message-ID: <20261109051618.22506-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This cumulative v22 update adds an optional linked-prepare completion
hook and validates playback ACK accounting before indirect transfer.

The core hook runs after all linked prepare actions and post-actions
succeed. If an action fails, callbacks cover only the attempted prefix;
the core moves opted-in members in that prefix to SETUP before calling
back. Pre-action failures and standalone RESET do not invoke the hook.
Drivers that leave it unset retain existing prepare-failure behavior.

Virtio uses the hook to keep ACK admission closed through the core
pointer reset. Patch 5 also returns -EBADFD for an ACK on an already
XRUN member, avoiding a second linked-group XRUN request.

Playback ACK validates normalized boundary deltas, frame-to-byte
geometry, ring indices, signed ready counters, and total queued bytes
before the indirect transfer helper mutates its cursor. An invalid
paused ACK returns -EBADFD without starting a linked XRUN.

Validation: The exact-source ARM64 W=1/KASAN/LOCKDEP build passed;
final-r4 snd-pcm and virtio_snd modules match the previous build, and
Image executable sections and System.map match. The W=1 stage 04–13
build chain passed without warnings or errors. The v22-only checkpatch
delta reported zero errors, warnings, or checks. The bounded playback
ACK helper passed 23 candidate-only cases. The prepare-completion QEMU
probe passed six lifecycle cases, including a later member's OPEN
pre-action abort. Normal playback passed in QEMU with RW and MMAP,
including prepare, fill, START, supported pause/resume, drain, drop, and
reopen. Four ordinary/staged capture paths (RW/MMAP) passed with 14
oracle captures, including post-reset capture checks.

The prepare-ordering diagnosis comes from static source inspection; no
baseline runtime test was run. KCSAN and physical-device testing remain
pending.
