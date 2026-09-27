Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5018D62A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790539854; cv=none; b=W7ZIslFB3k6R06W6U7hczm1z3tU+1IYX/tmD+aeUWAC5QF3BbgjwrBI0Oi/TF48OrJAyiqPnZQrXjxWMxyNkgAmqljoDjZEVXrgb0JGqs9vEY+C4eLoAKNbKGbGxc2RWegqA5AUnTPYD3Rf4ZMTyGvWojoCT/qXKiqLckJ/UQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790539854; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6AWtCE9eeNX7zvSlOtcgtevLARk0vZGt5PHD3bZwCIsPnihCdV2zsqWzdmo02rfCKq0iA5E3MmCldrlxIwapgKgz11/fkdZyzfKkUXUEFwPbeLvyGc3lLgM51Ea8cnj0OMj2FnBF7YVPJLkNJCZtoKR5Yg96XSXRGF/bwyIB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gii5ibXB; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gii5ibXB"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so1053442a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790539852; x=1791144652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=gii5ibXBpyZBJ2bcqly6aeiJ2et/6M7GESKSIvioii8WTM/pHZugMGgsNbsWegbX+o
         N+/Q7WhZbKokZCjUBdVbc7G0PbWnJEtOzz9sf4E3ESfGhUy2ELqebyKZpoBbutcT9Dfn
         a0Z88btcv3I5sU22Dzvvk0PVmfI9rrtPtbO8HF7UqXv0x50mR4TI6izsFebzDdBe2+SX
         9mJrx2iM418l4DOqVTUqbSscyzVDXo87Zi5bxh8ebNCOufQPKND+aWhuwqrpweiEWXka
         xnjAhSa8WraUMZfaakAi1nk5wIii39Rxz+RF3OI79LUxqM+K14Ap1R5xa74kLTqYU5WJ
         zy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790539852; x=1791144652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=Y5f8slEO4L7l/sxu/CetSDD7muCg3qnogI0TO46BrBD9w3XlY5ejALEAHXtXjq22Ca
         8r0hEjkXecfycaq8sJhCcNlJL8+hzJ8Pc7oW1XIbtgRuJy8LnAYCsUomhUzdJFhalIfP
         vtPnywE3eaFwux8tpavJUmnDCl9ufzmXbVE0Sp/eI57PoVvsTPEV9NcT9qAz9ULsvz+M
         PXZ9h+uHkS0r7t5//vK8fJEOiSTgBkLrBOVf0NbKmCmut4S2hV44WhCJi9KitVfA9fnM
         y0lJz2NoG6oYObeKa2m/2JCGjWUOwfYbtrpR/4cbEZbGublWqkrPUgCXh/XJ7r2nziZw
         Q5Hw==
X-Forwarded-Encrypted: i=1; AKwUvBzNQQa6AMnJWIA3eOun+zTzyHEpfMpYCjr1hfs1xZEYCxfdBXC4Lt5tKer9yIiQTESNeuMglq/DYdeipsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0AJ7jQ74Lso7xW7o6c8LhnIPD4HECI71i6BnUtzc4bO+0zIaR
	T7pFURu62y+sQ8POQVgt4GUVrsAHfwejiLJIUtWwwxGMhSsTzl5I+COP
X-Gm-Gg: AYBFou1c1Cg3wvoD+VDKj5kjxsk3uvjaijZlDsfigFVEqg7iX+jtDYzA9QWYLrp0gSZ
	w2GJIdetOX1uxYk9/ecp19CKfWGVj2ipCjBbGL2rStMJpH85Q1iGIH8tXDf42gN1Id5MiC0OARz
	CoHWqVHS2LiokPYGHpquly9lON/5p+qYZ+pzCceJ0A8KLFwX0kbmfIM8uj9f53YqoQG8GvGsgHW
	yYdWWs19t8obI2ianh2hx8uN4fMG+mHMKd5tVWX1pp1vTIYiwMkxW1EdngYYLKYPH4QQFreo80j
	us4IKbApPYnF9k0WODArUa0a4N+EyyCYv+GQOBdkMIvCCyE/tTUECxzOJIxJ0peAb0m2dcTdCMB
	MIaMv7RBVM5s+HuievhoTnOhVziuMjpIvJX9z13hpcBEbtZDkhNn/TfvS651nm8oiHkMlR9KevC
	uMA5kjFbxeBo4mgJHluvbVZ9/hHO1DHLKXHl0NMTtmeoHO1VQGc1dubTx78BCtXNk=
X-Received: by 2002:a17:90a:d883:b0:3a0:2900:f577 with SMTP id 98e67ed59e1d1-3a098dff5b4mr8692462a91.51.1790539852500;
        Sun, 27 Sep 2026 13:10:52 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b498fb12sm6710494a91.0.2026.09.27.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:10:51 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: davem@davemloft.net
Cc: edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nicoyip.dev@gmail.com,
	willemb@google.com,
	alice.kernel@fastmail.im,
	rdunlap@infradead.org,
	marsy12010123@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH net-next v2] net: pktgen: return bool from __pktgen_NN_threads()
Date: Sun, 27 Sep 2026 14:10:45 -0600
Message-ID: <20260927201045.241108-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927135406.3969970-1-nicoyip.dev@gmail.com>
References: <20260927135406.3969970-1-nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

