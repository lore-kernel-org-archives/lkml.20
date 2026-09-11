Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64F93B47E0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789091984; cv=none; b=V3lo/A9qIC/3YMbgSb83loR95Cjgo6qYscxv+YmbN7SHUMUSI0FFWiVkMZmPednSCe1xvzKSDwbP/L/sSmOFZdMRGVUUMBovHO5hSnw1AbobgU0ISStbmTBEMc0hfsnA8gVv6kvx/VDdGiHONSGtd0cLb+0r8ZU22B/OQ9jXD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789091984; c=relaxed/simple;
	bh=pJC3xc0p6+EBlCgz5Bo+NeJ54zH02pxqTnP/Q9umVmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGgHFSczHbzCQLl0yHpbCPZ6/TDNTplf+YxHhTlqiud2jWZ3Ss7TbHFgmh7AofYQTHOFiY1pkTc8QhVt1kmqo5/YglV0Q5ZMNwpH+3oJi3HJ/M+8d4XKmTLbD2wWjnzS1em90jjPzzDfFzR8ruuOPwlu0OChVT7WBLdvcphMEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUkJnVnH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUkJnVnH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso381840a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789091982; x=1789696782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWwhsyhtDrdmnn0DmmaTBqIJjC9gQOjB5CQ4+dpEieY=;
        b=iUkJnVnHauJRQsP6a6lLVNaVnVgeGEvzeFM3m/OP8f2aBzKB2I2ok1qL8bisPSawUi
         jn32+XoddMIqLL1/uD/7aVfJ7xVRD64as21lrq6Rrl8WFD+1SxTAzLBNv+0jZcKSJ/xX
         LyAtRmWPRR/tVGLAVIRh84LJfuCMtssxRdcWyaNsTLunovaarDNEIOMJVy/zv2Efs2PX
         V2jra1yU45MWkKgHp6QgSHNDreWir//n1itH8lZZuny1AbZdTGd54wTvsZ3jnTnhe6AH
         SS2gOjmJWZMqypSsLktdeKZz+jHYmDn44ZpZcPr0NTO6g6RHnbLgShcKsR2eF/wvtbR1
         mLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789091982; x=1789696782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWwhsyhtDrdmnn0DmmaTBqIJjC9gQOjB5CQ4+dpEieY=;
        b=gER4e2rvyHr/yobxpwCFjs9LrnT858peUA1ifYHezkz/LmwVtLPDyNwuH/ZfFd00lX
         I368/jBDQEIphv92J6oY3zBZ2S/Dsswj1f6gd8TWGy86OUOydJry+xWL1kZ6nmapUqkT
         9Kdqndg+sNwG5oqM4pPRzbYfn7/6RvJdYno2zUdcjiXX841alKZUs5bSkhtXb339nnWx
         NxuYeVlKdICtQJKeXHlS5Iv5Sa0P+2ji2Yh4ruq0kiaTRDjrtjvWAOUNtb3W4c7t/gxv
         uJjzHZB+UnoFTwHpEXOO+JqRcxM8rEjRWE6ZnTpudhTmzoTGLGQ2AlUqcDc+Eht7Ib40
         9NeA==
X-Forwarded-Encrypted: i=1; AKwUvBy6mWEmBsG90fxsbu3GCk++UA8g4X0tl/5z0QQyeeI5efLf0MxNXOeCbucmXAkl/gn5xPbk5vtAMXzlS6M=@vger.kernel.org
X-Gm-Message-State: AFuF++ncVgns+NCHEe5sHYp4ADp7KDUuhyH/HsnVp/OS+aIF5d22ubUX
	OEgYhPNBjzACj37zebcHxCn3/cfOH+ChJwAjFtFqGbCwhbzz2LeOOfkt
X-Gm-Gg: AYBFou0Z9h5tjgxnBFpsbnfwNB2bVMZoQpNeaIzXM50cnVyIkYcxlEDPSYR3a+fL4hx
	4bjlXOGOvLP3E8sMLANqzTtQoeR2Vkc81zjR9xXHuropnLuwVw12YAbrc66YQ4sE2/xYDaLi0mR
	IUbY9sQJd1KamBqeOf3FHBISjPiMwzH42heedGbf0+1r3OperZj9SkAEqUIR5BqYI+5YrtRlNnm
	HBxi29WVsBO/JT8j+tnGUjgyzxb01I67UxVcbHmQE0cGe3oTbjuBuy36zUVwW2zhl1ck5T0B1te
	uB426IleBH80b2nhjpb7mbFtrn5p9HyDyBoQoRANmWhs1Ga9zfKuuUb1ndi1FnmdmjcERTsdVDx
	mr+oCopXvvmcJOOIuIa/KfDz2B9NazgmJqZuf4z4Se8zPE24+LwsZJMLqqzCz+1Mp4GotaBCERM
	Ak8MQnOiAQg1cRYlqffJ98Howo5umdBQuL6zdApoSLFdmwtUASuc6R50w8Af1KzQ6cZZcV7HgYy
	y5wFim/A9rXZk37kh5X7MTQymsYsX86L3NqCHSUGmKyXHPunYo=
X-Received: by 2002:a17:90b:4486:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39d9c2346b9mr2602488a91.16.1789091981922;
        Thu, 10 Sep 2026 18:59:41 -0700 (PDT)
Received: from localhost.localdomain (vmi2317697.contaboserver.net. [85.239.239.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm1777738a91.8.2026.09.10.18.59.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 18:59:41 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH REPOST 1/5] mm/damon/vaddr: support prep_probes
Date: Fri, 11 Sep 2026 09:59:20 +0800
Message-ID: <20260911015927.37424-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909140408.104699-2-sj@kernel.org>
References: <20260909140408.104699-1-sj@kernel.org> <20260909140408.104699-2-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026 07:04:03 -0700, SJ Park wrote:
> DAMON virtual address space operation set (vaddr) is not supporting
> prep_probes.  Add the support.

This looks good to me.  Reusing the region's sampling address and the
existing damon_va_mkold() path keeps probe preparation consistent with
vaddr access monitoring.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Thanks,
Lian
