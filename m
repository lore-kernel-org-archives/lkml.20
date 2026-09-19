Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7707E35E1BC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836210; cv=none; b=E3NEF7LqITP/Ro2qxeAqQoXjciOqZldkaAOQb/X/Gia7a4lG/ZYDLdKOz9G/ac0Zd2q+bG/Gd6azRKWGE6dEBEjGuVxtY5zxw9FKmKd9Wejwv6HMyoajDSeK3xaU3T4sAIa8sSGWstqtOLRFEQFgfihW1TGtLdhYrm4TV0jLnXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836210; c=relaxed/simple;
	bh=bxhwykztEEFpcvXKWtp0prTBuctKYCz9JRSH6Cz1Uuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4I/qgCo6rL6x48bPVovSSSG6JQuAEanQ+4kdWS9C6ozvKpB/asNbFLB7jwyHcm5ZxfHPZPiHfto/Hv1aad45FYov+8W17OjaMp7mvSoNHk5OkVik5a72uoCGvsON2eSomicweVhVg43vgDD0PYfwpOlQxurqJ/H/529r6Z6E/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD9rd9fP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD9rd9fP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so1473420f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789836208; x=1790441008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6GhpCA04E6QTSI5LAm+dZeokUjWkWd+Hrusbi/KL2E=;
        b=QD9rd9fP3e3dqauG/lgUsvRbKsTNDkCz6Tb3xIjS2fkQwHOKISruaXxBLUXEvbtmWQ
         N0sSAsZHKA4Emrq8VfUj78SMt9LVGWq3DDtCyMgWp0bJtb2PfIfUAk2o+seAbr5HZm9I
         Lp7YYBI/e/u9LAoLQWfEzwhZJcd+93a5ynutRY5DNcJx1qV7q3IKau6GZYNDLTN6QoyO
         U+xvVpD3GP2uTV4Namgm/7yL2psPqvqB38WFPmeoVofu7czTJ/OgzvJMFMYA1LUJ8Wdq
         zusQSUFhJRbIAq64E4zevGhm5kf45RRosd5yshs31ejr6IjxP5ALxvgqGp8urqc+Hmtz
         tyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836208; x=1790441008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6GhpCA04E6QTSI5LAm+dZeokUjWkWd+Hrusbi/KL2E=;
        b=1duhUhiiw0PEWxOEluAyB4tGDRnd1mUIJZ7tzVTX1ycwK25+yFHzNR0umIfum8muEQ
         sqwPsHT0dFlw8FBKwzcJIuCGH3KYefa1Cym7S4V+USbXdF/PzS6Prw77Vs4UxG4SKOG+
         DaKdts8cXJgC2dmIft9W4Aki3ByqlDZh0rZpkvIVeb2bKCvqg1annp8bQyzc681TtS/i
         xGYiqSrG+WHl3TDq28KU+RRYR+DtfYU3xC+gysgQDnle+B6UnormUoYeiSrgD87EraV5
         86Mj2pCSVlIaknIktNCQLuGfEB2vue+V3UVTMPQ1vSx5RfrXUenhmaBl2MsIDBCq11Z4
         kWTw==
X-Forwarded-Encrypted: i=1; AKwUvBwC05OvG8sWS/vOUx4kVdhU0LjCCs3kmKa1r0lylNHK9koo3MAZ060OnT4bHoouH0EzI1tj7oDzO27ZQhE=@vger.kernel.org
X-Gm-Message-State: AFuF++nep4Zk9eLZofx7m2PlLD0isfsFdpccXIeCZ4A423EjflHD4Jc2
	in0izH29C2rRLSXuzuAzU2mFadrrTB72A4nLURNlya2c1gXzvwlW6Elv
X-Gm-Gg: AYBFou3axtTgHyvhSIUAjAUazhiLbvAzuE7VaKCSStH0y68Eey1S5PLXV08+8UsSVL4
	4I1RzOP6Z6WZ3xQ6BhHgzM28izMsVk2fyRnvMPJrybLZNZU1ufPgTMyodzBWNmAkMRsWzN2KdQv
	2PEzMHlQrcBfsGsxoSX4P8Jj/UvYcpdqoTP9QR/MtPkaBICIWCtgwvo9pFDnfR34SM0za/KPnTP
	wl2PXLCBi6cF+9Mm5RgreOH5scGdh855v5/9gMNKT/O2mVJIchlZSRwOosUg7jjoNOf4nOaPWBX
	JYqBgfViokEaRc5ukHgticjsO6OrRt8348ImNUw2wBz/90RWy0LkfkrOm0WQAQlvg2gCT5as1yz
	FZpCWzjzJJHndyDCFNbgxgGJd1uLWvqJkX2O08pFjfQGhQyWSh67asLJfHfmP8YJCfwYwOOKLuL
	0KPotj5Rr6bvOQ7nrN5EzfcSaUjreXVoAa84u6/U+1U/Q3gMDnPkDZnYY/nSEypjc6ydqZAKQcQ
	2rJsvzPEU9fk8IBxrhdsyHisJYrDhBguSpQoh/W1ipG1mYToHnr4W5X8+v+ovWXEm4RTiWz1Inr
	g9zW8dq/fOwTyMd5JQRBrNzy3UC6M2ziuj3qkLR26SGL0qxn1L3+pVH93QEoywkSc3HgnZpJEMj
	Z/7NTMUhzS3wIzU4PA3qbUqoMAA==
X-Received: by 2002:a5d:5f4c:0:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-4871e2665f5mr8262903f8f.34.1789836207559;
        Sat, 19 Sep 2026 09:43:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm7990040f8f.11.2026.09.19.09.43.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 09:43:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 02/14] arm64: ptrace: Rework audit_syscall_entry()
Date: Sat, 19 Sep 2026 18:43:19 +0200
Message-Id: <20260919164319.90193-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260902095537.602517-3-ruanjinjie@huawei.com>
References: <20260902095537.602517-1-ruanjinjie@huawei.com> <20260902095537.602517-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> +	if (unlikely(audit_context()))
> +		syscall_enter_audit(regs);

With arm64 defconfig and CONFIG_AUDIT=n on v7.3-rc1, building
arch/arm64/kernel/ptrace.o after this patch fails with GCC 15.2.0:

arch/arm64/kernel/ptrace.c: In function ‘syscall_trace_enter’:
arch/arm64/kernel/ptrace.c:2491:17: error: implicit declaration of function ‘syscall_enter_audit’ [-Wimplicit-function-declaration]
 2491 |                 syscall_enter_audit(regs);
      |                 ^~~~~~~~~~~~~~~~~~~

The helper is defined only under CONFIG_AUDITSYSCALL, but this call
remains when auditing is disabled. The audit_context() check does not
avoid the missing declaration.

Could the helper get an audit-disabled stub, or could this call be
guarded as well?

The same object builds after patches 1 and 13. Patch 12 still fails
with the missing declaration. Patch 13 removes the affected code, but
the intermediate commits should remain buildable.

Thanks,
Karl
