Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660541;
	b=y/Pf7dToOSz4OszldtNFSPpHAMlrAZZ9QN7BH0aPY824N5g2eIdweRUV2wkcUcGTqSQt
	 lgwDinA1w3NlP6oZCakjyqrGbEksPoDcfMQEai4hKC6mzhBbRcR5TWFCbML2o98DTDD6Y
	 oNNnBFeh1hNJcEf1uoluJuv+Nx8nKwdc0ILw7wpCNNvzdSY67LfmvElW9hjetSNaUf/mC
	 whA8UKPCMmNQqzn6H+6DibqG8gXQu/CD/b80WLYX9tdZkQMDWtlNZXrc7F9OZbEH2IspG
	 vunCGhozQGcjsAhwlP28zFIU12NIOqKDxYtwQLo5F9IN++pE3iX200J9HcXrF/hRldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cE1oRv74Uai/JOHCCDXA2NxiKeZ88D+LuOVAazAETn0=;
	b=gZkA4e112kms0OAu2O0Vycop9HUPTSk0PPtcfPw0RQhXVjPqgrR0l9YxNqkHlNQ/wfti
	 DrDcHnsnDPzO6EB4uBuJEpE6cL2I4mR+vvKaqFsMP53eXTbw8B1zQ7AdnMuv2kU+6WqWH
	 7y7hplBjppC3M+t7DsxmPDXKPRPWyWS5QiqkeDZY0pEKREFpyUoVmXSnEvjM1EpcJ8ZPi
	 yJ4c5UZvXbMgEVc+HuoiIhUK++sAIco+ARdJdbusI+stf6/ntziCwB3yjZTZ1lhZHekc/
	 CTrqKJkeOrUDI6mbsNvCoG3hqMZXNhqmNQMe54XHPdSsTTm9k3+RugZm7MVBhVaNmrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ctoFSPwT;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D7606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112D7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ctoFSPwT
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so2344328c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660540; x=1793265340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cE1oRv74Uai/JOHCCDXA2NxiKeZ88D+LuOVAazAETn0=;
        b=ctoFSPwTjH0ky2ufMCJVPj+xC7/Sn80GpTiwP8zYpEz1pj0aU2Erbm2DXYb8go1oqt
         qYo4U6smceLyUQOH8vd18IkxK0l1gqyQkUyODOpZ7IUmxC/4BHAP5j5fzqxzEAZ+g0vo
         Mr45+LZdY+iSjt3EXKdpFKZxrJtePP4KmIp43xB33nkhasUFln5D0ibn7qdRYm/4IeFC
         DwECnZyBzquvxGWJjT7NjeqgNIRqE7yWAzPmIeDRNyWaOT5PDbnwSuGrc5kFS/KK9RJg
         l5mw3XH+iJ2uAAFSzuMMT8d/43+I7sp88MlqcoZiK5EStFdNxJPtW2TXioEv03RGEipf
         8iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660540; x=1793265340;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cE1oRv74Uai/JOHCCDXA2NxiKeZ88D+LuOVAazAETn0=;
        b=QJ4s8/LMNDpb9+q9owm5TcF50Zrqjt98NASBaoIwifRg1ZRPlXVrcX5zv2983kgw92
         6XTXP2bdoVsmTbDG5NG3T4TNI50qzLFRGBoYiy7tbfwdFw4pBI2f+BMfJBg+cKG7nmg/
         MAKEI2Rsb9hiu7PrHGzWSpMkMfiWZrZUWhCrZCyS7QhTjTeU8rd6WGQzAwHDtncYT1qi
         WfifO0PTgzQ6eMXgq4UNMyLQaOy8N0YHRnQZmRLe4mtkIcPs9IUVivUWkAcsRnuZAL+S
         Gh5FNAPsEcUCYqhER58kbadzAEY+ExdYs4wexqn6i6pIxKqO11nkkritnThQG2T7bKwL
         hqvg==
X-Forwarded-Encrypted: i=1; AKwUvBw+0fTfsno7rxdojBejpFFz9D2i6B5GW9P1gKhgqjJwrtoi5VuF7OpxtlJyKoNQS11hcYMhVxKhAM2gPGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB7jphLJVNL+UEsh/4Y0m45C55TmOwgNAYzpXDkg5v63yuHJgA
	RqWj2NZidRc0VdP5iru1ggl0wgWFVa8e5KIL8g/OggUfUE0Sr3CtwQni
X-Gm-Gg: AYBFou2I5syDFoUnUOtSikNFDmzg8qbi2Gy1YnRDKzlw7cyVdQY6dNHGkkxGQfSbGw3
	tpu1EbsGAg0vPgu+HD8xeZgEMEXTYxCGKxDd1s/eLWWG0B+OmtZ3WQEXR0dHXcjRcxDC2iBlfnK
	f0HT5jSj7GY4jbESe16rrpcKZ5Pzd7SUe1S0SL0X6/+AI8Na/YGKMjMfEGoKEE4pzM2QaEZQvuF
	7MPm6TMtPjyRdP93AvZ/Lx9iBoYs9Yn0rlDgeuOFtIdF6T/rWJAMYq1WFE1Erox5kCJpEbR/2pk
	qo47CXPgpsuToZG+t//3NDCwoaw7DzkVHRpZDK6+qL+tZPSdrBkaMbN0Lep5c0uECWV8sCPAN7s
	PEyQrPKesCH9uxPLALPu4LsVt7e9y7XSsqHCkjLDOAyQDvcPv/rHYLxGrYWGRiFBuEm0KcktyUf
	1RYAejl5wfBEv6617CMcxmUP3G0xeetz+eFTG2WX1NOlvmS4BxzBaNv4EIGQ/jpeU6WODkXBmqb
	whN+FpKLyyhgwvnG6R1/al72ItS0iOc5fISnkEmx8v4GF/Vbd+qZqOIZPWx0pxKQ2w4UOaaaImv
	RUnvMvTFJz60oL/oEx0=
X-Received: by 2002:a05:7023:c018:b0:144:fa57:c617 with SMTP id a92af1059eb24-190a756bfcdmr5268242c88.34.1792660539942;
        Thu, 22 Oct 2026 02:15:39 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm13415991c88.14.2026.10.22.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:15:39 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: received STP timer fields need range validation
Date: Thu, 22 Oct 2026 02:15:33 -0700
Message-Id: <20261022091533.3651250-1-teel4res@gmail.com>
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

br_stp_rcv() copies peer-controlled max_age, hello_time and
forward_delay after checking only message_age <= max_age.  It does not
apply the ranges enforced by br_set_max_age(), br_set_hello_time() and
br_set_forward_delay().

Zero and oversized values have several externally visible consequences:

  max_age=0: br_transmit_config() cannot emit configuration BPDUs while
             non-root, while a zero-delay message-age timer forces rapid
             root/designated-port recomputation

  forward_delay=0: a later BLOCKING-port transition uses the zero
                   shortcut and skips LISTENING/LEARNING

  hello_time=0: once the non-root retained value becomes active, the
                hello timer repeatedly re-arms at the rounded minimum
                interval

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  A superior-BPDU flood with
max_age=0 and message_age=0 produced:

  max_age=0 in 904/1000 sampled intervals
  attacker root_id in 897/1000 intervals
  68 non-root-to-root restorations
  122 message-age timer expiries

The bridge returned to its configured 600 jiffy max_age and own root ID
after the flood; the impact is rapid flapping and transient suppression
of valid configuration BPDUs, not a permanent takeover.

Received timer fields should be range-checked before they become bridge
or port state.  Candidate BR-035 is canonical; BR-036, BR-037 and
BR-041 are different consequences of the same missing validation.

I found no matching upstream validation patch or CVE.

The BPDU reproducer, verifier, and complete serial log are available on
request.

This was found with a multi-agent workflow; the full
state transition pattern was reproduced in QEMU.

Thanks,
Cheng Yongkang
