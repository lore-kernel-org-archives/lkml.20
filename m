Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F0519E10
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065437; cv=none; b=YtK+m1sbV+ppGY+Z8R+3uSKLpI3MM2wGblrih/L+nPnd5XXriS2fDRPEGRj0vySmsW7YFdOUEd/aD4c3FY9U+dofWuXBu2PEd/k0lchUC9eVed3o5cPMYb70rmX60pDq69LiP8ZapvNo0fB/SxOEuVhGlS+Hh3rTq/sQqBM3wo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065437; c=relaxed/simple;
	bh=3XCuBw38kpgO4xOaIKCKr5QjgzDN5P/inh/IbOiOiyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gvFqehWS9cyr6D0YUqZhUdAety3pf7ilN6foY72ZwgZ8+sVAOMeLjGB71CQX63Tem0EZGesAnOls6DvQJOnZGIL6PhsT2/hYCDnmL+299h0OkiwZYDFMv33/8ElOmXKvgodlt9XvaWmDFmrYjgf26sGFTkdBafK3Ja5DgL7Ncf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+HUaCs7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+HUaCs7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1317340a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065435; x=1792670235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=906FzucSaczRxmafxCH5c+olZhTAIC+89/t5khd2vjw=;
        b=M+HUaCs72f6tElHxCdWNVdWBOhVndCI5gils0aPtGoK/9wquhSRIqrhtE85g46GMDA
         /QuZGBvpfRLOrH7t3LVel5jkdlrupxkwiBcDzJMU4utT/m09USo+bYq4ZIjnrZyLTmkz
         oUtPWxhDxOT/X/9LNTo2T+Wb2R1IxwCuKlUGVaP5+TiXRorgvhnySUPyoQiFmKOAu0dn
         FHmPd9BHtxCtEG5dbhQ1KrOau9jSVfnWbr7PcJ8WZvNlpLT1xN1h15nBZ5QtIQh7z905
         +tkWpFfdAEKKgyCqPLZDPNkmIulDmqgMQNqiA/b8pEQdfYsjGkM5zXWre7p7237hdB5D
         UfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065435; x=1792670235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=906FzucSaczRxmafxCH5c+olZhTAIC+89/t5khd2vjw=;
        b=sHnXFyElkvTF6z7yhymCxG8t3TxZ+niHgzgCDf8PZ2l91bXR7zDrNqnuve91CZcrCy
         vcTVQDmfsQdHrCO2aUTgLjZ4WbnXc/PwMUxItAGQ6nCVLy8vSvmhpRGQ0uJRmqUeudXH
         lHIF0sg7GGwonE97fweVYg4QnSdYt0KfzOg2ku/vt++K7mvnJcV0OtkiSehkvcyDtg9t
         9AD6YvadyilozeXigESkxa8Azx5mdnvJEOcUl1JFySxqg3SMJtBfAhI6BmWxJK6CYvXt
         5Z/hI4jMoSiGwCPfgnrS1RfgQFVCj3H7YZJYZLTXGYFHSHqfBeOpDTWYB67i3GexuMb0
         2OOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoN4iHQIufBRlNx+pjzjgLYhaNozFTSJRTO8zuaFAmOHsmOTQiWU4pW0NrM99mQL+kLSmcpM0h+FOM5u0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQmvFQ6811YU5+9I5QXznSz60jWD5uv7CGt5qVcdfZSok6d5ly
	KqYN9K7k5r3N8koPZBJATnjUhnDJq23h2EYWaYCc+mfL1sKBfAaM6chx
X-Gm-Gg: AYBFou3mNcFYuTB1kM18U/F6TAxxJSdwqnjLjjOyUR/CLyWwBlhgl+Y3uARt1l4VstP
	Al8l7QKkJtUHHT7E511BPm5xBmNY6zM+G0d6Cw1VywosNa1yixSeKv9N23q9EtoHoTlrl8ikbAk
	0YvMD8T1XFuRIjj35WOJB3+1bVQrqKH8lTy4qm/QAQlOdNEYyOLEOci1yRJdP+UlS1z9tfksn64
	KssdRxcom4JMJ5JTzR8AvEu/Qmrsm/CuM7AMvkKkc2M+D6k1V+0oPK/N+ZejyrPukxDd6jQyp7O
	59Hg086qwlcYhEyJFvyVZDXMEJE3FJn91BTtYKOhFYiiVa2UG+7OmdaTwZcbbdXCSGFjO9kGjmc
	ZAGQkZ4GrIDwFVQEW5C6HqvO0bwKmv3hNtCit1HLZPDs9Y3xQEH0D1GqXtI+UrcWkCqw0+Oc2AE
	cqNlzgg9FacNJVtdfcY3Nqm7bU+3JKMRaKiQAsEH36clZrn8GI4hS5mRIXE3suxMWvdcnGnfAog
	RDHSp86MAZj6zi1sMqM+8gkMeQ=
X-Received: by 2002:a17:90b:2ec4:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3ab3a39ee2fmr16098050a91.7.1792065434854;
        Thu, 15 Oct 2026 04:57:14 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm4236919a91.3.2026.10.15.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:57:14 -0700 (PDT)
From: Ye Linfei <yelinfei66@gmail.com>
X-Google-Original-From: Ye Linfei <yelinfei@ruijie.com.cn>
To: chengzhihao1@huawei.com
Cc: linux-mtd@lists.infradead.org,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: ubi: use GFP_NOIO for lock tree entry allocation
Date: Thu, 15 Oct 2026 19:56:53 +0800
Message-Id: <reply-zhihao-patch2.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f89c80cb-d879-ede2-9459-1778ff2f71c2@huawei.com>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn> <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn> <f89c80cb-d879-ede2-9459-1778ff2f71c2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2026-10-15 at 19:03 +0800, Zhihao Cheng wrote:
> The ltree_add_entry() has many callers that not need GFP_NOIO, I think
> 'mtd: ubi: block: forbid direct reclaim I/O during synchronous read'
> is enough.

Agreed, and thanks for catching this.

With memalloc_noio_save() in place, the ltree allocation inside
ubiblock_read() already drops __GFP_IO implicitly, so the explicit
GFP_NOIO there adds nothing.  The remaining ltree_add_entry() callers
(ubi_eba_write_leb() and friends from cdev/update/wear-leveling paths)
run in process or kthread context rather than a blk-mq synchronous
dispatch loop, where swap I/O triggered by direct reclaim can complete
normally; forcing GFP_NOIO on them is unnecessary.

I will drop this patch and send a v2 with the block driver change only.

Ye Linfei
