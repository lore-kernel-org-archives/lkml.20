Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E57B2D7DD8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917140; cv=none; b=a8FGE2mVvnabKHFIARAZvAiZjvgkiO+1Q2YpQ/7ZrknNIi3xFmqi7YxewnFdZnTfP/NVXXfoXLD6uZJE+Hkd98szog9JQG3EPwiMgTk6ZYBgfcQ0MVE3/AAx9+Xf+cEkWqOukSgQDWf51xMRPEosVZVpqfsv0Pkw3TxjwMNRyLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917140; c=relaxed/simple;
	bh=CEuxeF3lk2YJ0h7X1bLy5+0xJGtPSrxFy+aXoHrL3w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCDbaSopnpjW26yw4r8m6XjcnqEkgRqJANeDg+1Lzu3BZE55pRTQkCHHgKgIU6FJ7EHVIeOYzfzxvMUruL22DwC9hgR9hPDnHM1jb/xgF7lq6vBI2wxJ0NCpghqC8LouqSZiU854HpCxF/hqXjFvgF5v8cYFbKsNyHRo7Cb8oec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF6VcTPj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF6VcTPj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so30174075e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917137; x=1792521937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEuxeF3lk2YJ0h7X1bLy5+0xJGtPSrxFy+aXoHrL3w4=;
        b=eF6VcTPjTn3DGUoKUhRamb9ceKQgFVqN3kUItdklO9gW6G7MkPjBzdf21cT6RvHDF5
         JAOw6fS0bd0zCuh45sYvBwVXgZ7YHX4P9LwVBNRl5T8hEtQDUmbD4POdsMB3o4rr14jE
         PPhYeux0Ve59EibMqlUziEQWDeuFsAWGdtNHpsCt4/VPQViXxifX14hRht6RjNqhNtGl
         z/MSB1ljtmU4CfCI48beWd1GYDkjd1+5VUz1mqvmog/S/MlmoAfLyXcMW8PqS6x+KPMW
         kkgQsmHzqeJ5xrY/637yqzr8yqGcjxK+rAwWLHInPv1fe8d3QKQc0nx5e89z2Hce3Kp6
         klsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917137; x=1792521937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEuxeF3lk2YJ0h7X1bLy5+0xJGtPSrxFy+aXoHrL3w4=;
        b=Ny+EpyWzNrgaG8kaG86zi+7UKBO8wPjtizMBgyERbqwX1YL66PpNfD+hrRjZKJ04h5
         DgIygmPPluGDszRwfF9OcwBFfsPLyXVsZ0UFCY9nYSNUjRQj9rrqtPgEYyDlHEUFudSC
         0//TL9y1/+BP+47W5msuRPKbsuKytIZNpuhQgktZRu32wqbAbFRX5/Onig901wyQiX3d
         RGfoVj3rqVhHKYclxNKbgor8ab94td9QuV+UcEXrlqjwug4ev0xkZm9KE+WcwzY+MAhr
         N0ztpYM9cZAAXwNEN32GmhjRLlELgLacrm0MXAMHbs31UCfqNXrkPgLWofAOsbeQPxQl
         AV3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMFOWyNp6vQV28vMzceR3qtgZCKih5HQGEKNFpJXmJj2QjSYXloLugkJa910Wd/uQzPg8Gyoc9giWXUvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLMY+aN/9Zeo/WCnzYobPTAXUqajZPNVb3ejW6dbxAqPFFcsTn
	v5VMtbTsGwWwUtsLOznRzl2Jx8Hz3bUOnEf9WTocUvWycIqrrDzuyTCz
X-Gm-Gg: AYBFou1sSqiW0LXrcbV1Y7UNB0pMz5WjaZ3UUzuoY92PuPZKMF+J8zhAiV+oTt9xvZf
	/4f4vxiqcx2mFoV2sx5Sn8IEfcUR3AhSOHKL2QHn5H3wjIY5c3iB/+XaoNQpfUvSE6w5oAw3VQy
	WBjqoyz/yr50ZOgwfbVVCCFVLJJK+rMvTwGIMz8rwTdAS6B+JXROjpeT4ZeeFm4Jg/3gP2zvKgy
	3vUV6KwRJ/bsymfxi2O48fcns1nXfuVsLiW0UAaVuGQLFpgpXFMU2ll1sygrcxM7QSH0sxXXFQT
	hvqkYjvDZbXYRAieN0oN2p1nB/2mjR5ID99mSADDGSW1pLxIXiW3ovvi6IMvClRGY6L5Bs/DTei
	6f5d81my34mUuj5c2j36dvkRmHWpr28Jalnh6sDb+02u5uKAZgCIBeVEsDwfCqIhRoPoPUXx+j+
	Ug1F9MveFNBKqPp5fqs/ZkPxhHvqcFCSsRK1gMEypZz5P45koghQIM1j8vqiZBfXZbmGj1aAVRW
	j3NV/0lgN0oJQfkim2rO/cIC/wYSck9BROtfScFQlPks6rFEN6vcEa/n5GEuZ5NNuMCO8jh9ULo
	cXPxJKNXOjf5EwnOfC51P3+rSnVP
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr192085875e9.15.1791917137521;
        Tue, 13 Oct 2026 11:45:37 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4edfsm7386322f8f.26.2026.10.13.11.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:45:36 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Tue, 13 Oct 2026 18:45:35 +0000
Message-ID: <20261013184535.555535-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87ld82zsc2.fsf@bootlin.com>
References: <87ld82zsc2.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miquel,

Sorry about that. I resent it as v2, as a new thread this time instead of
under the v3 mail of the first patch (which is already in your tree):

https://lore.kernel.org/all/20261013182327.549640-1-orgads@gmail.com/

It applies cleanly here to mtd/next at 2f7fa8d90694; the file has not
changed since cfc5ebc9540e. If it still fails for you, which tree and
commit are you applying it to?

Thanks,
Orgad
