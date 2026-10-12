Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19582309EEB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790116; cv=none; b=PgxZXfkoIS47+Uj6DBUc462D3hZLL2hfZ3yzhEncSRZvj7+WelJAEp8wE9MSz3uhHgfvK/eFGdxEh1XSCUHWo7RHRQPyCToRr2DOGdTHGxoegmXxWXidtNN18Q96rZsJING7G1H9eXmoaKLEaO689naL0LPXNF7Vz1XrikbYRA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790116; c=relaxed/simple;
	bh=Tc/sacdyWHL8SkuhfcMIQ1fz8hopbKPvIyPkcnmDMmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE58jElcUQfyPfC7b3zvAtZ+/5Jd8Z9HcQeFHAJvLJvax1QLp4E7pAjzoW0bDt9uNVho/O/FAkLbEfH6TgdIqaU7NhkpghR2dug+RR974uhg4KZy9MTw4eox6CsPjQ2PeRmzKwinkuW4FcC4v4p7XPCmPa39b4Omg7m49Pj3j9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=At+gV2up; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="At+gV2up"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c411d6615so945888f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791790113; x=1792394913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DlkU4W9laIcoZeaq9AIilXLK67G0zj9voBK3DqRejbM=;
        b=At+gV2up7rBancdA0c9Au/OJcfyyePnpgRbsqHlr5x+s+lXsYGUZ4wYmup7Fs/pfdV
         vnlHxLQMg4jlSiyjLEMd7RQiBV9U+mKH8X84pUmawhWIfZ6q1w+fbIbU18eNc0/jp/e8
         njX/WDd2Voi1VFIIswSZjrANlMr5pqHKFf5PVlijap651mgiggDdef486wCQZQyW7u0W
         9Kgzs3/lBB03Rs74rgDNGwDafjIlcZZWUbc+c1iRA3rQisWfM5MDJ1e92WZvIrKepS2y
         +bfzqtE9cJXZKV6y/JpxgrHA0ubBVH/7hJD2ppIOtR3wPrhWXc0FZ0HEKGnjTAStVfvY
         Atlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790113; x=1792394913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlkU4W9laIcoZeaq9AIilXLK67G0zj9voBK3DqRejbM=;
        b=QYELHBOZBT+k5LUXoRVmkzAi6Zce7eOy91xg8GcB7swz6QcY5JCx19/niejKOx6rlw
         nbZltnncWlXHXLj0sEjMoDhDY1C/yTji4sUtYv1f412xIxn7TIcLS+aTEW3wjGqj6ekh
         5vxeWJsjnxA7+qIRvCbs64yEdI6DUChAdGzdEIzaslhRmBYCsM5DF2Ayb8agQR67SFe0
         sxxTWO4gdaaxM+czzQTTEJBQTVa0E6HOsu/b/E/w3A9yKxFK/j/h4Q3Lv9UW3Qg4EtSH
         iGczg75kQ1Kdf+/8ygZQUE0jKisfPGN/GdZk8m9nBPrxitHlFBGwih0vuJi9lQILBuSb
         w/ng==
X-Forwarded-Encrypted: i=1; AKwUvByn8y9puJYyAwAqqkFbPgEiarpkFdlE0MFEKymdaO2yy31hYW2z+RBQoOJc/Ts/9xNWr0gDWKi3e2dOhBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLswSf+F3lD3rIXMwLG5yPDlyab29IoFpAjycMQ3X0n8aGzwgnu
	tAT2ac8+b6pHeovt6YOewTHAPiRqz5eXy+qE+YrAChCssMiWLNUOuxJalcvjHfUin5ZH1deGkHj
	dK/usb0k=
X-Gm-Gg: AYBFou03KPB4uQN9DjXxQIvlH4PhR8fghNRsz+tE349dLr3ZCBRI3mXMrTYOda6vlv9
	8a+D80hcg/X4jqxOJC5twYMX4v+gyiRLX35TTmsuetJxGKTt2Gk/uH3IwgMOMixjQq6iFL2kbF+
	s6edfN9ShunRFpKiQxTo+/3j+zEWZG9F2qpUjfBPWXiTKORNrySARnV0T4BlkC3pnVvp/Mopj52
	vXgwc3URVNxFnFluIX3puaZED4KdtKkLjkpLLj1e3VUIWCpAHF8/4kSqIVifSNssBbtjBPNIpyp
	nWRSuQbl1xI6G+vo/6nPB0B3YK5i3+qvViZRJZ6uv9JZTznZ9PH5L2U7C5JjTBWR+AJ2dzcySes
	bZPlWGcgN89TGz5kjko5OJTTY6Pi9LflIfwuAxRzKEZtxGzV+AheyznA2tZ7oYrsVnOYJ4b32Q0
	bg7iiJ9M2xE2jjeaNWC1EPO7MeJhe9qInzYDVxw0TO2P2SNcSWmTvrZlrqpE8Y5EhjAbxVoqReb
	8eQNvbThLc=
X-Received: by 2002:a05:6000:184e:b0:48b:174:eab1 with SMTP id ffacd0b85a97d-48dbaceb3f2mr13605725f8f.36.1791790113226;
        Mon, 12 Oct 2026 00:28:33 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm18153423f8f.57.2026.10.12.00.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:28:32 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:28:30 +0200
From: Petr Mladek <pmladek@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Subject: Re: [PATCH] livepatch: Add Joe and Song as maintainers
Message-ID: <asyMHlXrYVUKJyxc@pathway.suse.cz>
References: <55b68f507686cadfcb1fa4f8524ae042c7657be8.1791664234.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55b68f507686cadfcb1fa4f8524ae042c7657be8.1791664234.git.jpoimboe@kernel.org>

On Sat 2026-10-10 13:31:49, Josh Poimboeuf wrote:
> Joe and Song have both been key contributors to livepatch for several
> years.  They have graciously agreed to become maintainers; add them.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
