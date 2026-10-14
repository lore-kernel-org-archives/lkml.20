Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE864FDE75
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982801; cv=none; b=p7VLKjmDu3pi0xfUkiDlNoB6TAJcI8MVceIV0Q4RQuCJDdm7rYuk8mm8LVYhZa+HFizQtdrvFhspntj5tNIWYsmp1IxS0Q5sCtHPdZSB9obpsmuCElo6SWH6bwx7gU5kKB2YB+4laBHQ/oXF5euoTWe/Hrx/XtBQMuEGj/bn0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982801; c=relaxed/simple;
	bh=9yk6zMUB9FUlkphNWRIxPU6GBt18cBIBDMGvC3Wc76U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bssljt/BWQ+9xSJ+ditstNyUjeozhBgxjrJoAcA7tdCHJPIpJzLl0h/oCFLf2KePsrHWf9pPUlZ2gh6SFnVYV9AEJ5mRmQX+DdZ1f1OGUEla7aU7brcPX1gWQDKolQzQnf4hQAJIr2SknuhaX3u/8qaOA3IcYPRCLHYdZlaj+Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0xxH7o0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0xxH7o0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so520057f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791982790; x=1792587590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OgXMBMEg+uoBGiGA0DSTy1cFGCRIK3xSJyq5hnxZeo=;
        b=d0xxH7o0MQwjSlJemvZqnBlEknt0U/DvdZ2q2/u4gejhAFp4bQlHDp6BH6dXvzbti0
         tOxC6iKhNyfaHpno6rnYRegfAH9WHq2BGoh4jQdj+4e0wZt8ifGaEVxgv1Rh52RrI69D
         Ug4p07Q3EMCZ+ta7RzzCLDciHi8J/GuiOHtJnnRDH09f+57B5r8z9S8qqnDkNrCtjzFq
         kEP17D3A3P+gFgfGmWfScuKJ2px5oevqWeX6fXmhul2H5sIdqHv5vRgHrHcO4fEpcchj
         6yyQWFr3EOin/qRDQkXbuOmqQi4p8i9Eb1yzsWs+SSFhjmU9KfGebg0ZT87TzPB36Gh8
         PtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982790; x=1792587590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OgXMBMEg+uoBGiGA0DSTy1cFGCRIK3xSJyq5hnxZeo=;
        b=x3PYo6gNyau3ZKuSj6uUuSDTYUb1HvMAk8FEEXDSyHCaFhAQWdo6Wvhe2589FXTucx
         nPgYBwugzU4jq9gJkd9izpkv/+wQ4EeHxtGhZ0jQOhAOlFHrz2B68Gq6Lvdd4QyOEdrc
         GWo+qu3NVwgdpFmXZxN+ZkwBPRMUeWd/kFW4Iwwai1VhxR0sLb2pMeIC/N+/0bulKUm+
         J5WnqjPvspe7aBy3Bj3if6uybgVkwm9JRAo/0kQu+4uTErNjJx2B9OOU+EGg0keJ6Akt
         t6ybqPet9HWGY68lZzLHVyVVU9Z5p+z7Ikv26zAizYIRzS7bhqdG00xhFdFRayxY5c50
         3jMQ==
X-Forwarded-Encrypted: i=1; AKwUvBywBLhhIeXL1Z6WFhnCPu3Hcb8LNBX6WUCdvORQSZ378Vnm2fTKa3eC3kcvE+nL6ZJUmZ/Gc9kmbFsSvxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqWT2vAPQQn8sv3nN07E6uy7pMGskl3na13phupNV98Hv0nocK
	z0W2lo772LkqoMk8cDfWpSbVwxaRPpKM4hKf+Di+/DMpqUG2pJGu8I3I
X-Gm-Gg: AYBFou32xNNhd/km7psiGEJNrDqI+8occqA/3WbwG/VnIwFC60fR6hJ+UEDDBPDgcsr
	ZJFISYjjTYvE28DUvve8s4RdjUlIWlXC8q/F8+lOQgUvxMe7rkqKU41jf+uHGgPz5PU2geL0JYK
	h+B3/bL0mnNN6GCh46QyitksE0Kbvo540u/ohfagoozaP3Q+zXT5VOpywJAO6qcnp0P2qIZD773
	Ph/2Svj594ceIChtRA0yY5KQmc3/dxNMzNA3TVFYqn6Ucb/XSKAkf1uEPgbJ5luvhRvoXq5xGS3
	qLs4houBQZUTENzTV+DeINQcNAL3p7/+5wHu2kJKnY2UexyEcHPfoUFDCep1oElpZpuWwOCxrkG
	kK3qSDJoL0JTIrYNqoRaVRpyMeizfzL35/YxGBy2is8ZjHo7l2E+46fRPffmjK6u1igZTJq9SjO
	YuCjVxp6b1ubCrF0a2CmjiN3932M47I3m+huya0GbL1Hp6S0w+44wnZInk3xv/XD+8X4vzGpDaP
	w==
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr284790065e9.8.1791982790508;
        Wed, 14 Oct 2026 05:59:50 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm53105485e9.3.2026.10.14.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:59:49 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/7] vxlan: vnifilter: bound a single request and account per-VNI memory
Date: Wed, 14 Oct 2026 15:59:34 +0300
Message-ID: <20261014125934.413864-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179198195143.320699.130100546123857623120@kernel.org>
References: <179198195143.320699.130100546123857623120@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/14/26 15:45, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered

Manual source review of the vnifilter netlink path, after noticing that
vxlan_mdb.c range-validates its VNI attributes while vxlan_vnifilter.c
does not. Prepared with LLM assistance, as the Assisted-by: tags say.

> - Whether the issue was actually triggered, or is only theoretical

Triggered and measured in QEMU, from a user namespace holding
CAP_NET_ADMIN only inside it. There is no stack trace to quote: the
symptoms are rtnl hold time and uncharged memory growth, not a crash.
The changelogs carry the numbers.

The cover letter states this is a policy and hardening change rather
than a fix, targeting net-next with no Fixes tag, at Jakub's request:

  https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/
