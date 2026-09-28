Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7402374A14
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576862; cv=none; b=Ue+ZHU3sVW7O2uuoHDpwmThhIh5UQp1Z2oe1eKzkYK2191O5XUbOjKSbtcodZouqVRbnRuYWGqrbchfDWwtyEMrnxc0ztUzCaIxew5x1UcvR2aR7Hjq85sGJpI13ft33x8aChhn+WX24zxK39p0QAEi8yCaGfUy7+CvZh9FhvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576862; c=relaxed/simple;
	bh=H7vUI5mRibD9dC1GWX3NIDs0desuVHCHEezg46LYpv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kOh2lHR9tbwpi17DLUbye7KXxXwjGJsonj937j2M7asd+p+tmKAvshdYRwUeNcwg0oFrCOnxztCK8pay8Xt7nzpRfCgr2rRaIujwrqbN+UrKkIGQWn9UVQbVp7kBLus0VFdFQJgVNG/TmEc1b+mPLo7VaTj+EtPVjawPJoyLuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=ujpokQ81; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="ujpokQ81"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso1695095e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1790576857; x=1791181657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGl5xKQgiRxbz7OyVDlPWje0J4ptC6ADyhIXW/2/+qk=;
        b=ujpokQ81SaZbFfNlMIiktW6EMogNtPKLTQDMCC/Zs+8SHbVkjpSVHXZQHKo9GS9cpz
         zLVuUacaww3miahI0a/C+vpXOwZn814Vg2INGRLPdZPn5jPFRSFL0bBrhHKbxcgQiVan
         Vlo5yTn5JQTUnzAcebsJlF3OVUccMvvU6TPEGxCU0h5r4VarWRiIH7MGklP0en4LGGCS
         uqUtHbYaXxANtwesgjF3dGLw/ecDqzLj41lBDQcGfKpcDpUgP9i8OGi2ju9CJhf5rEUj
         79LfXBhqrF4nu19Auwi4G4mYzzjL6eeZpvt3jY6Yg825GM6PlEjnZAcQueKEX9CLryr6
         PX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576857; x=1791181657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGl5xKQgiRxbz7OyVDlPWje0J4ptC6ADyhIXW/2/+qk=;
        b=tyLKEEuPEv0BnneA5WZ27CGXYrgFbtBr9DUvr3IkoxC/hYsWIwKq72fJWs6GLVN/UV
         L9rx/O6grgza/Rr9nuCE/d7Pl/J3uX0VhRrYoQYy1RferzvAHEe3kVN4IEcwBW5u+O+Y
         Sk1/up5114NjbTmagrpKBVkQHfBN1jp24+i6dKYL4aSTgDsFm7yZs+QleMCLNWvje6s+
         WKd8ICuRQsrX9pVdNXDiGKgoqphuKcDMMa3fB+U1Ds1RWtL6pla+gS5FKUcbHgC+3zn4
         qLC1aArRRxEnPs6mHQDwkC3MjRUeOdfOPL2hQHnNKmXk4hjpaROmU0CWVi6KEJP+kBR+
         m8gg==
X-Forwarded-Encrypted: i=1; AKwUvBxsfmM539fMzTCLIbjKD2JwO3nUUHvHT4Dcq9v7bkK2iQ3mEf55K2ZbQWN4fdNfx2fYS2hX7xiJZyszKcg=@vger.kernel.org
X-Gm-Message-State: AFuF++n34TmZDjlwjJnb1fRVyGVMdqRwXGI+3/d1vdX79oFeM5AEmyQT
	H420o5lYAvkaDu5ErJS2oRIN0V8j/W6qbdl/9DKZEx2I55JctQzoKftIoQc5C8zDnvEJ1f9Eg7M
	HmedKkW4N9Q==
X-Gm-Gg: AYBFou0Xt66vlAiAL9kxFma20IPmAreEd93LTN1MDP4cMtg7ZyeFcrxSGWIFoz6nINC
	2RNjx5G2ohw6lrbsaWXZpPs5y+Ny7PX1L+6wJ0Eful65pl779g4DxXEwMgoeaXR6PMj8yg+++ci
	8wGc8wsd3TVJEkwrIPthKmgX/wBSyMCnsnlCQlHLqK3k9cu2HbdzsGHQaOggIExbolrY0pkzwkB
	7As3Bu5gsDilf8j0ZYVshoyj7WLGKUnzmkID2P1DCYuE+Ka1ysxn3Y9Nvd1WjlVZPpR2TaTjOLQ
	hxqnxWW/lHph5WU5nRUqMbhN4pe7DNQBWhkZSqBeWYvOhwZVNBkyeRPGlXzpVuh2at2q4iL8s4l
	iJ56Pqo57P7YNzpw3VsVPUgXM+8gaABbZDWcy8RUWSa7e1bHC7hgQby0pQrS0K+UGxuEJmFibir
	qM1eKzdj8VKd5Bg0258sORoX2Z04jk83/mzhJYlBJEvM7SG85pGqPcNSpNGcH9ZK4jERSX8ojPN
	Drr6QEKb8/Jm1NyPHhP
X-Received: by 2002:a05:600c:638f:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49fe66d8112mr205843305e9.22.1790576856992;
        Sun, 27 Sep 2026 23:27:36 -0700 (PDT)
Received: from losig.fritz.box ([2a04:9546:1c54:8601:c375:8df8:9c4c:d013])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1847sm25431615e9.1.2026.09.27.23.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:27:36 -0700 (PDT)
From: Lorenz Kofler <lorenz@sigma-star.at>
To: Mikulas Patocka <mpatocka@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	upstream+dm@sigma-star.at,
	Lorenz Kofler <lorenz@sigma-star.at>
Subject: [RFC PATCH 0/1] dm-integrity: support keys in the kernel keyring
Date: Mon, 28 Sep 2026 08:27:33 +0200
Message-ID: <20260928062734.3805458-1-lorenz@sigma-star.at>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dm-integrity currently accepts keys only as hex strings in the table, so
keys that never leave the kernel, such as trusted keys, cannot be used.

This patch adds support for retrieving keys from the kernel keyring
using the same format as dm-crypt:

  :<key_size>:<key_type>:<key_description>

The keyring lookup code is copied from dm-crypt's
crypt_set_keyring_key() and its helpers. I would prefer to share this
code between dm-crypt and dm-integrity rather than duplicate it, but I
am not sure what the best way is. I see only two options:

1. static inline helpers in a drivers/md header, so dm-crypt and
   dm-integrity each compile their own copy
2. a small library module, similar to dm-bufio, so there is one copy
   that follows the value (y/m) of dm-crypt and dm-integrity

Putting the helpers into dm-mod does not work. The helpers use
key_type_encrypted and key_type_trusted, which can be modules. With
e.g., BLK_DEV_DM=y, DM_CRYPT=m and ENCRYPTED_KEYS=m, built-in dm-mod
would reference a module symbol, and vmlinux fails to link.

Please let me know which approach you would prefer, or if there is a
better way to share this code.

Lorenz Kofler (1):
  dm-integrity: support keys in the kernel keyring

 .../device-mapper/dm-integrity.rst            |  25 +++
 drivers/md/Kconfig                            |   2 +
 drivers/md/dm-integrity.c                     | 164 ++++++++++++++++++
 3 files changed, 191 insertions(+)


base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.55.0

