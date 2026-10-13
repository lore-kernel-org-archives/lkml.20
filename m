Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB552FE35
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914925; cv=none; b=kMvPzN0S+RTm7SQv3/cSvoWn+QUW7fjxXzBWZo0logKsa20Esv0Nqwi0rHQxNJx43ECk0kFSk2dFOs1jGLgxl4sVsEuEtEkRe0TIwWvR//J1rn6xYvAT53b7Aa9cYjaBA+xKIe0rkemkevV9PWN1JOvf1Fh+p0ZKbCpGDovN8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914925; c=relaxed/simple;
	bh=KZ7Ikw84/BJY3cQYIRg78sbHTdWFC0jbvTc+oRhuWZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdyeHXoGF3y0K+HNvc/JiVHJYoaigDzNSMnHqyJLZdYaVi4GEzR0fxKqpgBESrJA6xbldbelA+r47YtXhjIOjKViNfZFruy3GjxvfvEvP5mJwIPi/e324pvliJjOCeKc2tRO5kKy1kDM6QEFQsYYePV5fVcEvEOW8lvMZDBm8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=OU6DO7O/; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="OU6DO7O/"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so7561257eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791914922; x=1792519722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ7Ikw84/BJY3cQYIRg78sbHTdWFC0jbvTc+oRhuWZw=;
        b=OU6DO7O/n47QDkP/6ToBGE9uBdfSFxh1qTMQgIUPczVjSDP72WNsLKPTuX9LYtkikB
         p18y3yTeeAryzeZSji5vOM/KmQ/9TFPmlD8P4nG8VJkfNhRikQNkrVyfRvYFYS1O3ZW0
         qTBXkbv3VLzQwTKq8YHdGeKuMCronoX7eqx/GHVEkdtI+CLGTIX5EVCdxo7WLydY1h0d
         QSkmReGcz421PylsasTyX0ESpjzTch4P196B0f61KolydsobT3OZtTOD9cZg+l8PiDfn
         AND4uFS8X6nHYhBKenRPKx5FJiX6zrwSddead/FlKPPvYfsC7cxqeKDGg2NQ9EXDpX61
         NyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914922; x=1792519722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZ7Ikw84/BJY3cQYIRg78sbHTdWFC0jbvTc+oRhuWZw=;
        b=0EkOqshufBmJbq//dNq4ZCQ9SOQkVwnW8HnqnENVtI4go4DyNhlI76PNH79RiOHTwf
         7SfsaT3yeoot/nbJd2q3kc1/MdH9049xTkKZUwuMT6l+8GA4RYs6SXZ4D4G8UQNHBhss
         X6evAgHekIWaU3m+ntONeQ0wQFh2cbOh5TRns5vGw/4gx2VdblKIxqoX/g4LCtwlPZzO
         UkbZ1vyuwdrU/vxm9pOppgC4wVQtcIkbN4DqZgMMJO2255Q+ftsCJlxXB7K8uNDbjdDG
         uSSvIyoVji4IstKrLlnZ6Ba2ppXOsuZci843zp/fPNhZpj08MQM4r/I4389XEG5vAZHU
         sANg==
X-Forwarded-Encrypted: i=1; AKwUvBwa/yLd4G47r5JNXfbRPhwfMdw56tbOBW+y4oOarfVijSv8Beu88AQR7SjI6x1OQeFsGmEJYym5vQ4CKdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHzOPCQwv4EiCD1u+n8LUW//aKuJ9pwpAJ2v4XNg/93yi3Xd73
	Nmn0Y0r17gs88yvK9iBnzmOMe+emXvP+3q9nQWDud89zU/B4JJ8v+6EJy1Y7S0thRVI=
X-Gm-Gg: AYBFou1SmcCaGKLYvrp2g0xaNeyom0iz38DSt/Ly8i/I8AuI+6Fv5ma+4+0tpFzfKNM
	btSiqO+bQWl+hZaDrZTm3WuM/CyeSCT1Oazrm4rVFZMqrS1vol4VnbIxlMUUrfJF1hTATUkGNOw
	kOb5XT3NIug6nxKbk+VF23QHRPOJhkqK72+TnVG8H8eSqU6jbzqt91ouyF+A9KwV3mVF/PqjLuf
	P0j6fKWA1G8AFrj4Bjoek25IOPvDAlEM+bTnzVIzZBGDwDj0Ieg8CC/rq0t1NASxS29Zdud1cdM
	pBqImzRGacMA49nB7wflSChgiD39nv8vdFXusG1lIA2jO2Mw0Pm2NP7zRMo5/mv7bMnpc1EYx4O
	7pFT075sJTjkMdk73lJrTV3QKwjwmoblyCMHCYJ3onSpCJBKh+SS4ZBYQsX6vkBe7l33kvELXKs
	ZIH57Cbzq+WmJB2rRNJEX/GoHmr8qWnmpKbTTlLrvaefumUuq91lTLgFlu605nRHSAjrJN7XlWT
	2kMEGe678D18YWts/JlvRHd/1l5Q0pA8N+ShjMZ5eTdbIMeI2XrTrVLOz2ZPiZ+
X-Received: by 2002:a05:7300:c01b:20b0:354:b5d7:5a8f with SMTP id 5a478bee46e88-354b5e69defmr19403315eec.30.1791914921826;
        Tue, 13 Oct 2026 11:08:41 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm43649502eec.28.2026.10.13.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:08:41 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v3 0/6] amt: relay tunnel lifetime, validation and request-path hardening
Date: Tue, 13 Oct 2026 18:08:36 +0000
Message-ID: <20261013180837.1282896-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125943.558629-1-omar@blockcast.net>
References: <20261012125943.558629-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. These comments are against the v3 series; v4 has
addressed the three issues introduced or exposed at those bisect points.

The Update path now takes tunnel->lock and checks READ_ONCE(tunnel->dead)
before either the IGMP or MLD report handler. Both tunnel freers set dead
before clearing groups, so an Update that acquires the lock after teardown
starts cannot add a group or arm its group_timer. An Update that acquires the
lock first is covered by the same lock ordering: teardown waits for the
handler before clearing the group list.

amt_dev_stop() no longer uses list_splice_init(). It marks all tunnels dead,
then removes one tunnel at a time with list_del_rcu() while holding amt->lock,
and performs cancel_delayed_work_sync(), group clearing, and kfree_rcu()
outside the lock. Every lockless reader therefore keeps the real list head as
its terminator, and the post-stop get_or_create() path also rejects creation
when !netif_running(amt->dev).

The Request-only lifetime issue is removed by v4's final patch. Requests are
stateless and do not allocate tunnel entries; tunnel state is created only
after a Membership Update authenticates. last_seen therefore describes a
valid Update again, and the global and per-source limits cannot be consumed
by unauthenticated Requests.

The pre-existing race involving a group_timer callback that is already
running while amt_clear_groups() calls cancel_delayed_work() remains outside
this series. It needs a separate lifetime fix for the callback and its gnode;
we will follow up on that independently rather than widen this stable fix
series.

pw-bot: cr
