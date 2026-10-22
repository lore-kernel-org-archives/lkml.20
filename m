Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660447;
	b=h3tJEotQ6akIaqETv8oHqjTnlewz8BdTGsXtRCR3s7TerskGV1maycLvoVIdgdPYugLY
	 21kK8jg7YwgvbuunR1GEMi8WFtGSZIT8IDKLl9WYGaCCp/vHzTtbGe8IBX9iFjtClsKzM
	 fYTPCoY/sKw/ipnOO2td1iNLr6B7OY+9kqNPwiSIkW8Jpgi09ANgjHsv8ePqGbZ/oJt0L
	 iNRhRcVUgYmMGdZMG95/XVD2wUQbVlJyBEObWEsPWcZKxNK2jjya3/wKeKNZSvLpAaq5G
	 e2valpDzJjdBnEDaQ6ONinm/vRCXdRohq+mpUbLbfWYHkVqQQEI0gaez58tJiD6IhuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+9oT4imqO89h7CVLXvxpremnNC03kOCP6LBQBAbm8aQ=;
	b=NXGHzOnJcH7hrHLkx+CcY1+NHdGx+IfJYwZzw3NVcv4yamjUVsmytFcBh7PNXl8NVksf
	 4proJWBVqLbeiBaGf01w/MhUTVLlDVYT7/QzLXe8ZoGdCFlO7JwCKKW5q6QQveW9oGCKM
	 z7FPHuuhi31MZsL7LdmVrYO5vGvoJ6Uf5rmiH3BwvRba94hbXdHSmZtIGPXo6EFYqaMSI
	 Je+CVlIITGqIijsEoQOq9h1ScN4onjCTFFtflAmfFHZDZlrnoeMDR/e9yY6QQNWqksL0q
	 A4oP24hkVj7J19esjd9ngel+AOwA0q1PY/s05YAGRkBQqfnPUSVxcwKA7DSsjVRjldQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CbS8nk9f;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37682606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37682606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CbS8nk9f
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2797510eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660446; x=1793265246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9oT4imqO89h7CVLXvxpremnNC03kOCP6LBQBAbm8aQ=;
        b=CbS8nk9fkQttCIGca4DgbM3jNHnogueW7r8s22CgeBshvtIgS8J3/0zXYw2a2XRJem
         g2aDx72b/vDDre35lOA1+TwKVoJRtP531DHwhNl/UqNLZKoZJp7L2oR8QMbZZ8RAmecc
         9J0z+0Mk5bgDyK7hm6+Fye2lnOBIYTa20yfUe3yV/vc6yGm6yZvCyFcvh3y1+PBgHFEN
         UmThTWLK96bgkLScd/z2yAJm0EEHv6XyrKZnqFvvOjrE7K0ziDahnV6ijp+cXwl3aJMS
         gYGZwZVHLM5EUQ2YLpI3P6XciI9ktWelTHeUyLYZ2Ty4Xkm28X2mwQKI3YX2QjJ16A8h
         hLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660446; x=1793265246;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9oT4imqO89h7CVLXvxpremnNC03kOCP6LBQBAbm8aQ=;
        b=D9AGw1Z6ww0+nZoTQkFxazN/yHTJsoM26ZFiSGbE5MntMpSOuqsBJmQOaVh2n9HMdc
         4+96YTcTH+81iFPUDd9Qcp33wTT7xeqnamYWgYgddRNkq75b9eUJRLM3Vn+0GesWz7Kw
         82oXzT4W9uybJfeDxd7mu05wqD3ixPHSnxJvF8X1MPMtvP1hms4CluPwxcabo4TkC15n
         9N+tbUK87m6xfaRV7RCay87Z7/pQsuNhOnlwJ03zdQjE30OurIgbAQ4yck2Mrfqdt8vR
         F9wmTALl8yLb4vJRhBFhU9uf3immAZhMEbD0KaMvNvAYypMjXdFVvHlv9PD6oyUROojM
         4Umw==
X-Forwarded-Encrypted: i=1; AKwUvBxY/iuuQ+gERJE4WCSuwryYxT24TK63r6XtRiXQ02ZM2MiFoQGUFxL5NB38hOwNyKYd0VZJuM4dGwpWyXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp4i7XTfHBa3JTRU/J/kr4N5SnzLyYIkuvEd+bXv7E9mxvrKHd
	izhEv7J2zrIqcj57dQWBM+dsxg43PbF61HMj4neudeKLFoKLpTWgUTcr
X-Gm-Gg: AYBFou3TfHrNiLwJAqlK8cGLBO+9pFvUargl93sX+6kGuNilvxE8+3Jyjph5EC3b0JV
	bG6gD2todz+Tk6kci8AaFvwZGzAl0NqOhyfGBy1DX8TbVIZjqEzcyFyljSYxkwwoAoRiw8TqjwM
	RaF22PiGeKwxGQf1fXygZUslU3J7KS9Fp9qX3sZiMW/WkSGg7rcPPA0iYJGnkojvKLvXy9k+TZg
	PyHReO5d9IpGD7dOdyAHmhS/c3rOLF92HtgRv12UujskAeIHNoy2O7NIWJXDlUlyWyD8gOXhtvm
	rlqutW4CD6q/8zME2JuqX9tSupLM/GExIdW8YIwmRTzYuxWH8iL4tcNuvoykVtdbdVZf5OwGH67
	jV4sFvwUZplT9bPa9HOczVLWgji8nr3tnNOZ8Zmljl1fO3djTV4uKNn4dt7yZQgEGlY8nWgdpd/
	GN2H/FqUts15F5Jlka0Z82qXIph8Auq5TV8Q+3yKe/Q+SGg7jB2m6mBaiU9y70fSYTo71Da893N
	uL4/vN16WoX0tDDHNc4nRc57P4Usz4dU5U+Qa8CYmsiVn/8Xryw8vBxiqYM2RDKwz3ygXpJxFPk
	O2rFZSruXh/PdNICGVA=
X-Received: by 2002:a05:7300:6c85:b0:35f:5591:e40c with SMTP id 5a478bee46e88-3674de4ca70mr9773380eec.22.1792660446301;
        Thu, 22 Oct 2026 02:14:06 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm5375478eec.5.2026.10.22.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:14:05 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: tun: flow update can repopulate a purged detached queue
Date: Thu, 22 Oct 2026 02:13:58 -0700
Message-Id: <20261022091358.3649925-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

tun_get_user() checks !tfile->detached before entering its receive RCU
section, but calls tun_flow_update() after leaving that section.  Queue
detach can complete between those points.  Detach's synchronize_net()
does not cover the hash computation made before the RCU section or the
flow insertion made after RCU unlock.

The late write therefore installs a flow entry with the detached
queue's queue_index after detach has already purged flow entries for
that queue.  A matching TX can then steer to a detached or out-of-range
queue.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  A two-stage GDB condition
observed both:

  detach completed its flow purge
  tfile->detached == tun
  tun_flow_update() still ran
  queue_index=2, numqueues=2

The later TX produced:

  tun0 selects TX queue 2, but real number of TX queues is 2

The condition was hit in two independent runs and is distinct from the
purge off-by-one in candidate BR-018/027: even a complete purge can be
followed by this stale insertion.

The detached state and the flow update need to be covered by the same
ordering rule.  One option is to perform the flow lookup/update while
the receive RCU protection still guarantees that detach cannot pass its
synchronize_net(), then avoid using a detached tfile after unlock.

I found no matching upstream fix.

The reproducer, GDB script, and full logs are available on request.

This was found with a multi-agent workflow; the TOCTOU
was observed under QEMU/KVM.

Thanks,
Cheng Yongkang
