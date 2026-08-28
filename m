Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6B3AC0EC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889058; cv=none; b=IPWPyZGs1kHJ44T6r/XIUrvKonS0709U2LfJJh78wjKUbzmpX8T2gCWPrahZS8HxyNZ0DTxhRJebkpodskx5+7O/8kGhNxuAv9ZmMy5ezRH8QcJoaOr/Ky9+copRWBjFzwkJiYuzmji2JkZ5aJl/fGjHJ8Px0yZq0y3BemKxuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889058; c=relaxed/simple;
	bh=qxXuDSETb1QGvICRb6JF6QpQpSR+Hex0aJPS9wGqpCo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fM8PKyQpdOQcnDCQGZjnibeE6n9JHfVhDIVQwPBzKkOgwjE+kJbzfhG4GKVpmr1G6Lu8CCUfESdJjli2hvNuxXXYx7tSdv7p8fUHvqjEySZXkkSMt9o5JU2Z5jgrta+qHuvWH6/guNotW3yfw6qZNK17tRGtH6M2n7a9eFy+0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iu0MssnI; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iu0MssnI"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso638468a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787889053; x=1788493853; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x4Wo3AFVWJoN6NjZ+CjXyOXScjwk81QQP/wB9zVSLpE=;
        b=Iu0MssnIdYs5oBK61RGMgLHv6pbQmm0G6nj+OX53oQc2QIqBIWgKGMStsPhVAIZXCZ
         6KIXJtU1ggJmTlrObkqAuCwZn5yEFW5irkp2NNYE2E3fib97Y+lIbq35w47CbNm9LQNH
         1Pplh4AsO8hmM6kJsbIPymf1lYDt+de/jqC+BFGVjCAnzWzped3LlncDTU27kLDQSRqT
         6189Df9kTOUSqqMjLd3TU9N7vd8l5YdhqVTr/qJQ5EPDza1KH1h/GBp++7QTeUrcSBhS
         TVgjBixy9VNwEKh5VZ/5DOayOPA26D8vPLHLIBqZoH4yolHFkjNhhuuJqAk2P7qJumAo
         zfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889053; x=1788493853;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4Wo3AFVWJoN6NjZ+CjXyOXScjwk81QQP/wB9zVSLpE=;
        b=df7+jFgnYy9q318cE8Si5vLKqghKpCRsoz2Yi57Cw28/9sphVGVZedgKsX6mt8inG6
         VjTdakpQAdCtSdagXp1WDyC1DLbPVCaeFsLc320BRhE+IWOD860xRxlb5rVZxBzM6Jkh
         X4Y7Ex/80vx+yFyCI2cgWTZkKnrvEtpm/xtecXkE7fJ9Ej/yn2eQCLjybC3JQ+1LgQzU
         XKmnCDf2iK39cfQ8DarZ84oG7GFZarg4Eyu3mTQ1KaMgmHcVtt7kOJKD3OiYMRTCvaih
         x2Lp1Uu3EeS7eT3K2j6yvTFwkvLkrkvSjz5YIvccTj/KdMZf3nhZ1Mc0J/hsz7sZO8TG
         L/aA==
X-Forwarded-Encrypted: i=1; AHgh+RqWQPhv1QCYYKZ0x4ginOm8qbXHv+06LLPeMCWvcltDtU9/+l5qQGPW/Q7TCCNELarB7MoxDKuri+aDfrc=@vger.kernel.org
X-Gm-Message-State: AFuF++k2tn7tvg/7tDtBrOP5Jo7QtNwuRwKSuIGoNw/lCzWMx+sT9ndi
	sOPzrJH45ptorbl99QL9mG0W0NpUO/C6DvqH2YbOoNb+8p2ASHUz175BQ7xOt7NV
X-Gm-Gg: AR+sD11thso4fyL4QxZq+4KcMwGC1A1aYTuXr1mqqNk2RYgROIyuHilzZB2vpZNwblN
	ATLITh6faojK/1WRtJwEcu+K6Uwj1L7/ZyBKgpMaPMJ3pA/MEHnVrg+XVatWVsWXd1vRaQqEKrx
	Tl3jocCuBDMsuev5CTuK/nh1w+WCn52aX5LRugkJLREC8SUsS4nPfWhsjFbnbQAm3R2z1Kmlj5+
	HGSN+xF6VR9uNkhi0jbfonqHT28+ZZNKEMz5JO9B2YlbOvOejSnOVafdK5tbaExFkKv/EeQtmML
	roQXoWwHgKePwMVubEeQD0kiLbF8SVy1Ih3zcwn2fE6PV6UfVJm+Sd+XJbRKmyGbVXr0MO8AvLl
	GfLxfhlVGUOrSslJ6XkSEOjDvyXjij+VapfBhAn76u41b6WoU3dxDGo7qGNQsuBzrJJefFRFC4r
	lQNANmE5HGcz+NRjRlbBHpVtzLV5/tUSrZ3ou+kCU7pfLZwbxbjCqqG6M6+Zkg9Z0Wdw==
X-Received: by 2002:a17:90b:5484:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-3969bc0223emr15330087a91.10.1787889053319;
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm1659184c88.15.2026.08.27.20.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] binfmt_misc: only let punctuation delimit a
 register string
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, Farid Zakaria <farid.m.zakaria@gmail.com>
In-Reply-To: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
References: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
Date: Thu, 27 Aug 2026 20:50:28 -0700
Message-Id: <178788902858.3236768.15019506644956689303.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 26 Aug 2026 17:55:45 +0200, Christian Brauner <brauner@kernel.org> wrote:
> [...]
>  tools/testing/selftests/exec/Makefile            |   4 +
>  tools/testing/selftests/exec/binfmt_misc_delim.c | 127 +++++++++++++++++++++++
>  4 files changed, 143 insertions(+), 3 deletions(-)
> ---
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> change-id: 20260810-work-binfmt_misc-delim-83f62cbcfe23

Makes sense.
I think it's still pretty accepting when you consider all the
punctuation characeters even allowed :)

-- 
Farid Zakaria <farid.m.zakaria@gmail.com>
