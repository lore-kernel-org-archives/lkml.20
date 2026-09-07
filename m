Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8044C65C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779666; cv=none; b=pWGzl8Ri2/PrwQiADuY4ZEV62arKlTuzPhrbeJgNXvEBD8iVT5ixb9Zp5GtR1FrZbmO5L/IYW6n5uzAOn5YLUxoJl/ezxLabB1DFwrPD9UdqG8PvZTAg0JiTnaec+Rlq1VdC2MHt8V1xHU3z93yEfdHUEvjnXktg8N5KoATJcVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779666; c=relaxed/simple;
	bh=8W6Bv7KpERuwJUntqKnAFvzQpKJjMvVzAdtpot6zh1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fx2yQgA6+8yBLCJf2ZfyAqMxVMDov0Dd4dF+iS7nX2j4lcALxt72e6zdMy0v00IyQQ6BL2n0eV490aXSzuccESahWbqGRjwJBWDk+h8O7v/bf/Jopt4kKuQLl8rPM9CqyMyClCX0Fz9nNOS0W9prFIanoVItw7/3zaDCcxXzcus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+O1lNHx; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+O1lNHx"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so1371662a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788779664; x=1789384464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8W6Bv7KpERuwJUntqKnAFvzQpKJjMvVzAdtpot6zh1I=;
        b=S+O1lNHxLaXXPxX33C8hQ9ZrXhTMpw+O8zqV6Y4e4Ng147z2O9lmf28iXGj5EiWpc2
         etoDj/FbcrAbmtT0GeVPMn1ZtCwI/nD/aE6Z5TTxvXLvySr+La7bgcsrFHa2A5AvbQ+o
         //KUDo7VsrFY9cTmX2prNe2MAe1UglK3E6A99sYk/YXqsmWVlVxZAbKjE/fLIa+VL+hg
         6XR/zBZ6XA7YJyo9ZxxB6LWfo8c+xCnvkncCq2AkanBbbqvSQRkaGYQbxccVjHeLDVAD
         L+eVrMnfDEYGMzHHVZt7VzqmjJppQ4qOvpKNw5AA/FLttwzocTcfld7b46v1822yfmH+
         zorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779664; x=1789384464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8W6Bv7KpERuwJUntqKnAFvzQpKJjMvVzAdtpot6zh1I=;
        b=DbUopFEcBaGpWBjmmgxdxnOxq9U8pz8CNqr2/j1WqdlW17u4Z3IZqHs4xh6uw4XyZh
         xzDx5cfTHoV6xYuk41v7eNutssjsN+ykwM0kP+c/tvtC1tpUSkYD5D76n3k8+BrzDOTD
         Wmsq0bzsgGOCD8ODRI537z15Jl5dluj3T7z+fkaQcxHU29HDK5B4YvrHfLhOQ9c6VOxz
         46iiyxfdNa6ciDlKE8IT+D/dAc0RsTo/UG+Jt9JXMkUGSTfJ3TM3K60jWFaYwGXlcvfA
         8Vxgp1sJ3FH3rcaXHM1znCGWOAj3Kv7gBqUcTszfhtxYNH4llGnh2zQ1Sm+ORv3tT4kN
         iuSw==
X-Forwarded-Encrypted: i=1; AKwUvBxf8h+RNMg2WW6Y5IiVnrqEEegFvJbwoeKJs9rvM4m2gvL3oHRG2I0pdM06fh+0krFWF6zZbTHVvMHZa4A=@vger.kernel.org
X-Gm-Message-State: AFuF++nMX6K5+DbOIxOyEjzHty52vaIFxvEShDF59nvNifaxWF9jxDxX
	j7R/0UK4FTANAnmPYkVsoEw262zeyoV5C1d1Df4i7IA0lZOkvC2cf6JY
X-Gm-Gg: AYBFou0n75wxxqTd5dfXgOnNO8xzR0EQeMdj+gJA8faNZ8t+HbsDsP+3X7ObB4z5uWN
	KJrlyIsYM1EpMFV7W/t93WJQg3WDTpb0isNWUPysXVqqboZLF3EXw8hB8dF8PE3pZ8HG0EkxDKe
	f9n6aWMuD4brOfOClb5rqpctlv8NdwuREIgdjoB/D0wYIUyPXhlkzzrDcF1jrpJgFVUcf3uTu+z
	Svrv6xeg7sZMIWwNGUyYCl+s0uZyQswG9MLmuQlSrAhn2q5JQqb61Gg0+d8Om32TiX4H8YOzaOD
	wMS5Z9C5eX6Un/S5nWvonfRQrGvouhRBRT2+goF+kShKDzlSoYCyAwsu9CHT5K9r4aE8s/QU/rg
	ikx5rAfBD0xxSblhWCbyylKpLogg5Z0Wf4SwgQwnbO+buZIZBaoI5YZK8OEBad0mTDV9CzDETWp
	QjU8rjqOAjjYPmI+BG76u6iub7UE68y2pjWXb+uMm93WdKqk4e7LcJ402aVI4iefJL2eN1qBOxL
	XjKvnfx9mgSzc1wJ0vGEWHGlQ==
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr33887224a91.11.1788779663921;
        Mon, 07 Sep 2026 04:14:23 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm20388323a91.9.2026.09.07.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:14:23 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 13/14] f2fs: allow large folio support to writeable files
Date: Mon,  7 Sep 2026 19:14:16 +0800
Message-ID: <20260907111416.2522216-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6f138a9d-1428-4813-b102-caeab9591da4@kernel.org>
References: <6f138a9d-1428-4813-b102-caeab9591da4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 16:31:36 +0800, Chao Yu wrote:
> We start to use blk-crypto rather than fs-layer file contents en/decryption
> code, I think we update f2fs_mapping_set_large_folio() to allow encrypted
> file to work w/ large folio.

Oh, I missed that information. I'll remove the encrypted gate in
f2fs_mapping_set_large_folio() in the next version.

Thanks,
Nanzhe
