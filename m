Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834186;
	b=N9H/R9JClNnSoR0Bn31yCA+v2rJE2uTY7Uzjwp0ID/CU7Q4vWnMUfa/hb/Z8wv7zgSww
	 EdGUej0gkLAHGp0wi+bS6xkDceK9/4/wIdzI0+Zk9bSI930Je6rEYNAW1Ht2KN+f65vUB
	 H4RZ9CkbPPXZeDbP743/mEqpv5OAa5/Kfw2zbwTVGJ7afKtveO3zOl5qE7RvTod0k5WHp
	 wgoBVHgBWwMF0EAQKZObkwhMfDAkRBtODMt9K6ufRLL4fwvY+odzU9bBcW51RhGaPysP0
	 UpcU9MS1l1FhouXpWJ7WsG7q99JzmeyNw5Fw/Y5yR4/0PG6zuPQIIUWBDhLSt3e1mtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ue6ML+1SvncZBAJ+sN2E+IJ82CpxtcWqGNhb7YHpnH8=;
	b=234J8YCpqBvrVmJP9CyDOW9HfBFed5pdC6/We2p/kVKrUOrnIrtnYgyNA03C4iynRnam
	 CeNMBd6uuc0CTepD3vF6iyfLQNznQqe6eCGtpn9cfx7namgjjrxbxqFopgrs3JZrEJwmp
	 hB/Q8WwuEY0ZrFXxXtKnO5TOXjmfFcY6S79GCTxwy1IRXF7JEYVoDLlEdukyBF4Y9auGC
	 VvtmkgugYE2iK1qAib5EHO0clpvnGjoH/YQ/ngg2rA5PxbpbqZS3n9rr8zP0ZVPW16Lmy
	 fM+7dUagFAkksdri+uXUjoQfBg8XkmZ53nVnpfAPhT8GlQ8WqDiGzQQ7mqLDEOC3WVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=r16oclpY;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F5606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090F5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=r16oclpY
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-19305bcb72cso1189858c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793834185; x=1794438985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ue6ML+1SvncZBAJ+sN2E+IJ82CpxtcWqGNhb7YHpnH8=;
        b=r16oclpYEo6XTfbnRu7h/BXhJwPzxPpPQO3jSOGl+p5eik8iE5oyAaaA7QfvUO9rNP
         Rjauqa+gpyyzC4Nf9ys1iBfYNr2WDF+aJS4rO3jUy373VBCcKL13RFLY7Dj8P7nrdDL6
         S5xdY3f+evirG1owUtJfUYuPms+Hc5hUsdF+EDG1VqCCWo4ILhWkrGQumGE/FA/2RB8O
         EC0BHOIyAsjRQ+/mM7ei3iNmapc1Macoq8ZfIg5j17KlezcldjuPSdo5tbm3q+EjE1mI
         iP47D1jYAUp5oMd8/l8kUz6z/vmdBHUSt7fLvs0kAQaLTrWmqJTJr5e2OMbZBlIsPLMQ
         B5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834185; x=1794438985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ue6ML+1SvncZBAJ+sN2E+IJ82CpxtcWqGNhb7YHpnH8=;
        b=ID7pC/fteMZnC6VH1uuA+dv2OKXC4epo+JJqQCc5VGmCZEi3qHgL0qKESjRvElrL8b
         YY8ElOvrP/nFh7OiXRp7Ztg9dPnvAab6yERlqVh3T7UHq9d1TeWp4nGWWYWPhBjNIngr
         9aVwn31AiUUcpBBszkQu50+EMUnwNTlPfFhEwDoqy85ZHjzA3CFpL3aYSWQwK0eOtUeT
         c4N85buudz44/Mlx3h7OR+P85Sn1Zgk1Jm/UNMTlpGgO6kblPTRT2A6scLrtxgWwnqD0
         YViIio0JeQlPvIjctmKzUUkau5t9hAr2/tUvQnlmL4yhYrHKnz9lJJcW1BwbVV8R62cN
         nHQA==
X-Forwarded-Encrypted: i=1; AKwUvBz8FTulX9OBzFqcfhdSn/z5aWCa8qqXljgvfe2EeKWeEI77m55Lj+ag7hAZTRuvOFo/PYVRLrojHIlgs+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2rkD/48s8DSWXs3oGN3pHDCTZDTkpQUyUs1A0ydlwQ3dsBf4Y
	vuTl9Y55VI+8IIRkRiBQ0aaP/X0HUU2WAXedASI2rUqqxs+VnfnKsm9lePGRnCz2mg==
X-Gm-Gg: AYBFou33hUA04Nw00QtileOLSHUxIfWJZXbPdrMehCNOe/arKmWue5jWNU5DJXwOSSe
	jsUdeYti13Hw78fvYsREumAaiLyNViZrCIjPL0aZ/JrDRnJ5NrbscZQgrCuoEZCLge+sYnI0rMd
	WxygNt6AOdGFA0wnUqVTbEoMVn28RSVn7h3xH24mWMueZLuh+PBczR8cbuPxo30C4Gxaz1hawIQ
	xgwvmq/73w9o7sgG/keY/VnIDHd7emIv6ps2W69QMgv0T3urxRC2kDuZEL8EsqgaPqCSsI5QInC
	8MXZFebZTG6iWozXaahfuIkHqusP5T+bJFju4yosHLrnAatnGf60uYvXAtrxH6VgxsjCsRj96wT
	nQkaLbg7R4CdZF0XBzi6TUlFGKTBT22OeQAQY9Y5UmJ98Ca1tIwbW1A+yzNSevBOYM4MjglraPh
	TduRAQgOyfxUKIP9KL4IHD16IfBFRlQaWx2b2EkCKcTY6ijHXOZK9r7pR5Hy2wjO+jS5lGpNU3T
	fD1KAFgPSp//Lbcnji7j6kdaxusa4YJv5n8NAg+KmZKylDNNqL+HvPlgIbJE7w4JZl6beHZngjs
	I3Y5vK1p1Zl6mBi0suAoHOTW6zl72Zc7YVv1
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr26010887c88.8.1793834184834;
        Wed, 04 Nov 2026 15:16:24 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm9667826eec.17.2026.11.04.15.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:16:24 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: dsterba@suse.com,
	wqu@suse.com,
	boris@bur.io,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] btrfs: owner refs and tree blocks
Date: Wed,  4 Nov 2026 16:16:22 -0700
Message-ID: <20261104231622.3492838-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9de049c9-429b-46f8-90e7-02b30d2e91ee@gmx.com>
References: <20261104102323.4090290-1-smish149@asu.edu> <9de049c9-429b-46f8-90e7-02b30d2e91ee@gmx.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 09:20:51AM +1030, Qu Wenruo wrote:
> > Siddharth Mishra (5):
> >    btrfs: skip tree blocks in btrfs_get_extent_owner_root()
> >    btrfs: tree-checker: reject inline refs not matching the extent type
> >    btrfs: tree-checker: reject keyed refs not matching the extent type
> >    btrfs-progs: check: count non-skinny tree blocks in simple quotas
> >    btrfs-progs: tune: do not remove owner refs from tree blocks
>
> Please, never mixed progs and kernel patches in one series.
>
> Send them out separately.

Noted, I will send kernel and btrfs-progs patches in separate series
from next time.

Should I resend the two btrfs-progs patches as a separate series now?
