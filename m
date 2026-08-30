Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABD3AFAE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788112305; cv=none; b=KEAzIG4uC2gMJ+Xh2eieSTevGBM5QECFGrquy/6goLcSo6zGMzSVnF3NkrnuZfc3yU/cF1l2imUkGHztzIpzQ/xfbdLpUAJ1P6C8BPk94A+Z2ZjwGQyaZN9GAC4Xm+glj/UNhcSFPil2pHxNLDM0iTV8K19m5J4SI9sAvQj526Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788112305; c=relaxed/simple;
	bh=6yCNyhnmBUg8bR0oCM+iXyo1UOBNa8u47k6g5GntGRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAqfxeEqC54/9kxf31hrnMt1iZ5UmHSE3wS3OW9mU3Mcf3Q+YWxQjWa5h4+FNgwl6hyDfxzaa6DgXDeOAj4jN1dOAA6/H1zN22u3Y/3hQtNF5ATNAPNNeBXY4SnkMxDmuoFSMR/JYk9shPXGTjMOPL0DiGldqiidZBvojM3H8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0Wx7/SL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0Wx7/SL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7200b2e15so28749675ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788112303; x=1788717103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yCNyhnmBUg8bR0oCM+iXyo1UOBNa8u47k6g5GntGRM=;
        b=U0Wx7/SLuGS7jnsHJYvYjVFehYWG7aW5gZnI0GEelsBxnBPD+aG53s433X9p5/BFJk
         XThFwFTlNhtvNf4EZFMlccdYTJb/vEC2F3CRR/bk0xI9j+ZHF7LoLP4N2Id2r4o/siJ5
         VQzkIn/iYWvlxpu3FzrOLL1Bcm8PAZgnCtWI3WlKGn+QMYhu6hRRYLePV8JBCVnaEQJb
         GXOPnKnPoeTmAoSdRZUrhnThR0k2sLpcEe5hz7c41d5byeDxPKt9H5qR52qIlkkI48C/
         9tWdCiDDdBx2+ORni7We+dkNU6Gm/0w/8CaDwL5HCc8SC/hIJy4lxsOmGMlcRHNGcL3G
         Ceig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788112303; x=1788717103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6yCNyhnmBUg8bR0oCM+iXyo1UOBNa8u47k6g5GntGRM=;
        b=PIbQsabeEqgDEMYeT10oddizl+ZN0UMt6lDOoQ0xY6RpCL47+lDL+o+0ZN9GJPf8tB
         xrYQXSCXyY9q0hzdZMgnzAVwXLEsXaO51V4njgFTQXEybUH5K5oTf+Z41A5srWqU3tPO
         bLVrRjAyBQORv5Da6q+dhhiceVCsNZ3C9+frJecvcsMeeFs7NS6s4gY/gLcCbo2sgJny
         TsSQ9cW6NHyrLDhIym7XRfao5SzxReorRslEV0KoL9jQKPLLE6WVifUvvbe4QecvLZVc
         um5zZu1cpw+pOWa4dIokQpTaEBUBp1nP/LCTgCaaBUpTh4t1s3K/hwq1d3xgyhknWpPt
         U4Pw==
X-Forwarded-Encrypted: i=1; AKwUvByfuTr/5AH+vyaM20t5Hp9GrZhmyPTmC5Z3k9CO7lfuY4WlJMiHtSnqtGxSMrq7ZO5Iz10VDfhL/MKvyT4=@vger.kernel.org
X-Gm-Message-State: AFuF++kiaduUo7cLDUXVxl57AAiR3CCb2seM7swLMoMXkiGNPnxwpN5F
	0bCUCfbIEwAM5/EHRL+m7einApNL2DzYQGHX3j1Q9q4K0EUvDSKjAAE5tTny00Bw
X-Gm-Gg: AYBFou2LVqFFd/aVat3AfOMfCoUXO0qw289+GO8kjl++4A7n5p0YpnVCffSynGr5Q60
	BAe1mgQDUEIvhnMPVk8xZdd60ow19/UqarKgXRLWx02kJEOxcGOGPTaZY2fvfGSYBW1Ih1vXxOf
	27zGrDBm6r3cGbe7T1+rqsGeIeImZKhF32RSLaJvlhwOz8/NHVYsPOnrG4MXqswFhc2mRuorzAc
	/JY1FpNhUDB5Q7cAc+UrqwDm1DplkFH7beQGBzSr69rPAn5KYFxNFthecmSzwETM0z2EFl19/+j
	Y1xAFK22hMsj4iWy+a3FYFq/KtWoR9hCbJdrKL0H05LJSoegt5wGC6NVMl3XOkMvERzZWSfTcnw
	o2MCiKVQWY1xkQcKWmQ3Jrg6pOCutyYbkjgO/WJBGlEPgrjjuJapxjkxH7UNBt4TQc4eRNBu3fw
	Tt0Joc5kVppCws6Q8J2rshOTfSDztgBg2GMVFehNF0HhztrnY0dTLbqEe51azF94UmTJ61ne7UG
	EBbv6vTE7B7xocUDTji
X-Received: by 2002:a17:903:4683:b0:2d6:efc5:c82e with SMTP id d9443c01a7336-2d74dc10522mr293583655ad.1.1788112303561;
        Sun, 30 Aug 2026 10:51:43 -0700 (PDT)
Received: from localhost.localdomain ([2407:4d00:6c05:13e8:a91f:d3ab:5c4:f6ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d90e6e10cdsm8752045ad.14.2026.08.30.10.51.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 10:51:43 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: song@kernel.org
Cc: pmladek@suse.com,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] livepatch: Reject livepatches with aliased old_func
Date: Mon, 31 Aug 2026 01:51:38 +0800
Message-ID: <20260830175138.59014-1-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPhsuW70RpkZ1ciioSjt6qkQePWyeic_L+98d0h-Ao3ze-TmkA@mail.gmail.com>
References: <CAPhsuW70RpkZ1ciioSjt6qkQePWyeic_L+98d0h-Ao3ze-TmkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28, 2026 at 9:17 AM Song Liu <song@kernel.org> wrote:
>
> Acked-by: Song Liu <song@kernel.org>
>
> Can we add a selftest for this case?

Sure, I'll add a selftest for this. I'll send a follow-up patch
within a week that exercises patching two aliased symbols from the
same livepatch object and confirms it's rejected with -EINVAL.

Thanks,
Harry
