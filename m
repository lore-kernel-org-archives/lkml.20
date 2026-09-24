Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22447FAF3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245393; cv=none; b=dc0l8dNXdCMbPw13yEi2dO4wMuPWgcah6TaDZrJtaaN+TZUWmrlau3656iaJ9f7NcLtqUu0X/hxbxYwQlxaMllV23Rp6tEVi/Fid+rpb7hSm9eL0Bqbv8a/0cVtSqP58lgx+b5+gTRXlOgUZqVAGIAIJ8d4PJ4E9ejJFYbebIog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245393; c=relaxed/simple;
	bh=ubDIQFEO1MIByltj3HjP+uhGcS5vNqWz5d++LjyFrRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bj1CqZg+Mfkcm2QS/RUEODki3Q0X/jaweAt/GYjVKQh++uVwufJlI4M6DTCMXhpLXEQrgreqw8hYm41atLGbmUKmCpccmb97HiAkJHGXuFCpsAGoZbjaWJy8ytdXUNHb3LN/b/ekSssHK/KQJSzMgDGT00gWUw078C/Ly5UcLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgjNqS/V; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgjNqS/V"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso840715a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790245390; x=1790850190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYegx9gEg7NXACHA1V/J0HHo6A6tOLA2/UcguWdtiq0=;
        b=WgjNqS/V+MEVF3oj8o7eohfNXBLvsm9SIWgIUAFwGtISCeh+vAu5YOlHcpt0uO8Gt1
         UGUiz2hw74rIT4dQ1rCfTyu9zI7EvbNWf8R9mQSfysOJlcxoHD4aJ55zj3w/lLWLNwbg
         GD7R2+FZH2NFrr9cvtnRhkIS22i0q/co6tO8mdPyPcoJ4OTklhKLx0Bgu0O0dXFP0mCd
         BRWwYrDb5l7WIwfi97aMUaiGO5gA/+GBNOr3JxaXkdyhcG26G2O1sHBSkLHlosFb0Usw
         fXszAtFF4RIHq3ugoQkKDnT1eTY0Uj0tblUm87fV5uSBEhgBk2h651mWWGF4t33Sd3Up
         1+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245390; x=1790850190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYegx9gEg7NXACHA1V/J0HHo6A6tOLA2/UcguWdtiq0=;
        b=1YVtd6usLdb7A+IXcCKJ1NHivnFS1cfiXm89tgAWXNTStVOUovjySPJhrXN01Z08bl
         wtOfNutU+DI1lX1qa0lxng2FvXguEPzxLYeJ2XgI+teyB0AuC26zroXxuWtBhVvxV+BQ
         BB4lVN0Fq3RafJ6Sdp6JdfaL4F+j+cmEIDy/2tYtJ6a4iwFOJ7OqfUFtDeH2eAK98GD2
         XOoiT0zIoz0WCNj0w+RnsHtHFIqnQrWQGLXaNsZ2dvX8zBLhOFr36S78qFTSgz8GSvEo
         d6OeF4sIzh/BfhnDLXGWbFfAFHd8mYxOjcrtybg52RMXMDaujnZ+9aKSwMd4LOyzRMeP
         W5QA==
X-Forwarded-Encrypted: i=1; AKwUvBzM8h6oi79xsamcPcsV/dt/YvYfdHwdm8WXPUVpnPS2EGqnBw+VT2ghAKClC3LjhpIygvneLHDy50YUd7E=@vger.kernel.org
X-Gm-Message-State: AFuF++m6mVXlnIX8cV1TCLEjI6Uj2334s75R8eZ1mP2nLXf0mFwZ0GAa
	fPtJQy/xAYK/S5LJQLW3ZaPxJpuuL0eDpSKfcIuYoiNYJix2TGyPCks=
X-Gm-Gg: AYBFou3G/Cp+8IwDMcBtT+VOLLIB4rZqHGhW+WHTefw1AlCD0+cBhO395uu+oaJaGmX
	hZJ4A2hG2ps6Uo9voD1K/2SZQi+wNeBjN6kmqbdmAdn6egDBNutwZSePNCZizw1QNRD9mMs/pk0
	lGzx2vyQ6slwVZh3UaTNIAzrTlBQXe4ejgJynBBLNLGhM5ZbTinQnWyBZTJ9J0MoHekF5vEX9Cu
	meVaSrUK8186birfeju/NBZVI0vO4ZMRplczrWodXsBb7wF2PsYZjG7QTPFeDTnhq1RLc/YKay/
	ZJFogY6HNw0Pdedwt4yn1CfTLaa66aqLTWUZku1T4zkomvke9qGb3FKPUF77o02DaAxC/q0wl79
	2Q8y3HhsFsqFt2M4gkiBsdJy6sPQd48E4ZqwX16QcM2+IOPol3odcIlrvjgSqSrUqRSeZ56E44F
	tSApGLgJxW70xGr1Cj14E1KkzIMMahBA/fTKEXWAxiuFOYsjgp0D/w7IQT0O69GOcZe7/eVwBsM
	NInZZqxDUTuI79vngPOyVDJ
X-Received: by 2002:a05:6a21:9192:b0:3dd:85a8:cb82 with SMTP id adf61e73a8af0-3de0e89f90cmr2113174637.37.1790245389761;
        Thu, 24 Sep 2026 03:23:09 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2668096b3a.38.2026.09.24.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:23:09 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bot+bpf-ci@kernel.org,
	bpf@vger.kernel.org
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	leon.hwang@linux.dev,
	martin.lau@kernel.org,
	mason@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash element
Date: Thu, 24 Sep 2026 19:23:02 +0900
Message-ID: <20260924102302.2120375-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6f3525ba15027c3ab18ea5ad0b081dc086e758aaa9cf8854f8a61021f135fbb8@mail.kernel.org>
References: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com> <20260923000801.1764758-2-donggeunyoo.kernel@gmail.com> <6f3525ba15027c3ab18ea5ad0b081dc086e758aaa9cf8854f8a61021f135fbb8@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Sep 2026 00:56:22 +0000 (UTC), bot+bpf-ci@kernel.org wrote:
> This isn't a bug, but could the sentence starting with "Since BPF_F_CPU
> was added..." be split or re-flowed?  The construction mixes two
> sentence frames ("Since ... was added that writes ... so on the create
> path ..."), which makes it harder to parse on a first read.

Yes, reworded in v3.

Thanks,
Donggeun
