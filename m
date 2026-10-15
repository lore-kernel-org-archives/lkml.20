Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215CE3DA5BA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031732; cv=none; b=XjGLzHS+PIY28jbVPBWl+0Ih9/UTdHIxKM7feVB/FFIwLUKy//vGHHC8iDp8SpVrukjaN2SXnZlBDyv4eRupu3bqpphrso69LTbd6Dvw3Lg5DQAhAZ/7u5tvoSq5fM2EMejUEsgTXw6DpbWWqLsPiiXnfIS/rhVIp0maTRivIXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031732; c=relaxed/simple;
	bh=HuGeJoAQEA7iwbIiLxJv53njPzZ3n0LkR9Yw7d+krrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kSP92FoCQFRPSNZbBJXc5EEWDIUpeCSFD5QhXak+G63mJI9uAFsncglC/qMXczO0MFRlqPUUgphfWupbYc+ybqWvphpa1RkS0DdQMdH6HyPXlgwxkK5CsN4mRLiExr04VHS0yz+AnLbsMCAE/HGCBtpl1iMNV2Dh+kH8tTehoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFO3X0IK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFO3X0IK"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3254582a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031730; x=1792636530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuGeJoAQEA7iwbIiLxJv53njPzZ3n0LkR9Yw7d+krrI=;
        b=DFO3X0IKNgTSyoBkih4W9uj9sRv8v+MhgvfHjvQzJNayEqXQy4gKrHyjOjIPusKzgA
         hYrvLT7TZY2Rbl8m+sT6+8Svhqwi+ZS/dqeuW0GhThqGjYkVvEb74eZWh0gYYhXdUnQK
         /ba3qCIHaNPEN6VcsAnVTxbIp77nCAFe06twS+E8HqVJsIrHmcQS872h/D7qroffARqx
         dTI3tTFvB8D+XqMR0dilPvvF+MPlzQ1LSaGChNMlxzDciW752vL47JU60UdhAeM/CC9u
         Npas3LQ5C/UDFawFjH+pZMdA7LP+EOp7vGTZ0JunPtOhF7N4W0rVhkl8Q+Nd54sXvzNa
         o2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031730; x=1792636530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuGeJoAQEA7iwbIiLxJv53njPzZ3n0LkR9Yw7d+krrI=;
        b=sA8uhnpNgZFJPpIQDgbV0bH8wXK9ah9cvcZrjY51DP0HM9Uuhqefs7j5DbWxSoDFkA
         KsL2UdnZmadolpep7wn/kWb3C3VjH45uKVXAbiy9h9JhY/YtGPb18bGhbqPn28gYuu8G
         qELoTpr7RbuTbUZIGKdJ9OSZxzXzePQipB0UGTNVO/fZnWPNQuMuB4isB+xwJ3NTbgtj
         8iGqVLiyiTwT0TcyzXHNdAb6otlM01btHD59AZ6CRYEnCMxtsfUWgWr+14+SaueytKZr
         Hmv7+qUm2I/HJSOHVozi1o1E37ss8LY7Ex9xwMM951B+DH0JA22vO8ch/aHiVVbN9cns
         Xm3w==
X-Forwarded-Encrypted: i=1; AKwUvBzHE2LHg1YqboDYPutsb67A7292UR2C1CFIq2fisdOvvO+7Yug0xQdWmYLjRUCz+aAL6J3Wo7nCzRgR1PM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4vUpX3Nd1+SM+EOhjrdJp0YepCUDGQeUKcosy7t1umYMbQOeD
	5jxHUj+y9inusSzw0q/xYkd3mJU3+M8AfIS9U8X9da12oiH6UIz3OuZe
X-Gm-Gg: AYBFou0/XvlQmnuRyb9G0p1bVtdroXz7UCVx6rK/GAU/Z69lnLJOMr69LUJNNXxER9D
	dnZdWCnEoDJv5/JpOq+u1sud+kLsQMv/aq+xN9lsh+8lup71cqwlelcQwtB2h9TtZt5ggyDwu4u
	A2lJCPGEih8J6sTQryyprtQ/kNfXTtWiWutsOgvfIoU8KEwwjFxD3vGzWiFcqxTwfaGUBy5E0NO
	z9EhHiSVQI1YnUo7iageOvS5tb5GS12JI1uwIlA8o1SklFMwTz9OO9ymK7HvJI/E+zYF2nbl7qq
	8zxIsEiy8R9yjd6LV5ltCCeilMZHmHyAzdTFtNMEDWJpqtQAegnMLzWuMMhO/HXHkjJKPNaREOs
	XlMQ8JS2JELEJO6xCuIDST2nul1f/Dhe2X1e5yKdCRiv9R28a5kv0j3gA4ZCjVTQ0sexXZ9Hbdp
	vX1vDpssFibvP9W45a7IT5cb2ComK34FgUVshR45LLHhUL0YpN6mBipLawuW0aXlo=
X-Received: by 2002:a17:90b:1844:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3ab3a9a8da3mr10311790a91.19.1792031730350;
        Wed, 14 Oct 2026 19:35:30 -0700 (PDT)
Received: from ubuntu.. ([138.199.21.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e821csm1940875a91.8.2026.10.14.19.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:35:29 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Jan Kara <jack@suse.com>
Cc: Qiliang Yuan <odys.yuan@gmail.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v5] jbd2: fix shrinker scan budget accounting in jbd2_journal_shrink_scan()
Date: Thu, 15 Oct 2026 10:35:23 +0800
Message-ID: <20261015023342.ping-jbd2-v5@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001-fix-jbd2-shrink-scan-nr-scanned-v5-1-5348b51efce2@gmail.com>
References: <20261001-fix-jbd2-shrink-scan-nr-scanned-v5-1-5348b51efce2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ted, Jan,

Friendly ping on this -- it's been about two weeks since v5 with no
review feedback yet. This reverts jbd2_journal_shrink_scan() to the
sc->nr_scanned-based SHRINK_STOP check from v1, which Jan had
reviewed, after v3/v4's nr_shrunk-based attempt turned out to
conflate "this batch was unproductive" with "nothing left to
reclaim."

Let me know if anything's still needed on my end.

Thanks,
Qiliang
