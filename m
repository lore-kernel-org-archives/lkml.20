Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832841;
	b=FIRi3Z/Ah8BvapC57nATQWJZpicCDoDofqIB2fFNSwB7Pmei8jgh3s7XwqBZZLNXCHce
	 AF7szmoueG2TlmkhaRaKEWxqFuL+iVxxjd5z+c+XxrmDIw5q/9mt0kj7R3jD6h93x/JpF
	 mwlJ4G8RS9cQCbTvHFnPBChq7rR+/Rif0kw1T4ZFlWCmpnb6XfyEaNvhEP/8awY9PYXg5
	 Lv9FRscq36yO6Q1zzHvIk30p3A0RrtIvPl771TkW8F6MELuxD3UXgmJDYF2wFj2ZkJhB3
	 bOQ869EP7P6x57cIE5LN/Ib+lxn6CNQNuWCzYEV3hDCXnuK1cJ/khMBW/cjmyv+lL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ofU1FQthecJu2OVRI80kc6txKndxQX32EBE9heySnKk=;
	b=gQzR2hKC7Un6YYMb22sk3VubiSI1WjDrWoa0vjgh8IS1n5w/I/8cQRZVy9pR5g2+y/1r
	 R+6pmbI+AQjqFX5WD8lcO1zHelZhWPaINxjXQN/X7/2UDqvnd/qBoUWQjbxgX2yYLiZyD
	 fbpPjHCDtMXnBaRRaCNfY1b73FHaWRTI5YjDsQk9KZPlXfYAi/58sunf08RW5f/lcm/v7
	 ZXQdCphwOW0A1XAjXbwymAT8SRECWMjfxHsi0FBfe5ME5tCP2AVxAkWF8No62Ob+YkGmY
	 7koRg0XaYSIc+lsEdfGxelPu5komjxK35b7V6zllfPWLLGjMwBVhBvhhaUCR+tpeZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZlH4qsy;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C947A606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C947A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZlH4qsy
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843cf077f10so5604019a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832840; x=1795437640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ofU1FQthecJu2OVRI80kc6txKndxQX32EBE9heySnKk=;
        b=tZlH4qsyeVyp85D/7jfuml2Bo9iSsV9/vvMVPvLbOjuqa9ZzlFCuWOOMPLFa4lcyhz
         +XgH3VuEcWu/sJbcLqS1Aebt7m3+vqAToTw8VySUA/AnsTzsqb7Uh27tE9K4RImxd4ri
         uHf2EdZKQlA70FqigwldTyC+ox1IImIoUe83gInR24PllyxytHuJ0D1zETZDRBvAH/Pe
         xTs6BNuHqVyh/utWQjtSdoZ3jVFi2KXCQFuu6SQiAE+jEwfSdjAZH5SZrHIUwPuDAqsW
         zne0aXtsjD1G7Eq0/thFuqndNXzCIOkCav79MIoClzJnr2b2a5MzAvMb51XiApQTxdj2
         u8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832840; x=1795437640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofU1FQthecJu2OVRI80kc6txKndxQX32EBE9heySnKk=;
        b=N+QZwBbGsUHxXSIML6KXJlOWwpRF5pG4c96XhCSgxaDA+THNuVaxFhncXu5dwAVBrb
         G1j0On4fc70HUpUsENRsOXX7KvrCdsoT2W1+abTUCaEY4JarPwIXchvbZoLKTR1oNhlW
         MdkEi//Ee5Q3HExAfXw1xgsubQsjS5NqAdZtBjeMJISAcdZ5NQRBd8EpcqxvLBHkgWVL
         DzGduZrsQVwrSl1qD79FoufEIBsUzbdS0wuLNHhozk0n9Tb016LdSIHeVO0ustI7TrYF
         kOrG1aoP344SJJJ4lvrXQ53MjkMofb8Qw8iPM9D3OgpBJmgaJ41eHtmk5ao4g1l8DW4Y
         dUSQ==
X-Forwarded-Encrypted: i=1; AL+hErFaORfs1qZ9eV+Xlu24Z0eL5CiEkoQX9wZQvHvFH3X9P1K0mnCtsu4VuWpig71u6u0EWtHFAO0mLxiux5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xn7j9QoCcEsFm06FEtl4Yvsf1GUpDj+IynH8xz1Yn9FcVPbS1
	I6gXaDz4l8OEZR9uNDsfLQByDGTHWY7Llpdz1wnvezkREaOSdY9nd9Hx
X-Gm-Gg: AYBFou2T2EkQNsg2t2W7XjZ0I6WuahxTe9dWtzJokBWACwAr0CtbuR4BhyGBpOAvF65
	6bXNL35SUdyN2m1Xo4saPtULBScFm7RwiS/YDIf7Ph2ELuJu9HOJkI7jWN/YEEumNaWmXx1KUCr
	z7u9txiK8t8MW7gCISQewc7qNOMV54JW102xSHr06b1CizewRKKZ1hu4kzTe+y/6cM6cUTLnA6v
	bFEZycmMQVZS8EGa0Q26jm3on+3zbXTqwO68pHy12lnwPEE/9Xt60mfqxNz23Zyry0cYA0DnEbw
	rkQ2kPc8YNrMFGQPSoyioovxJLfCXcJPRR+/fOyFXOtgr6NAXd8NqJTSxE6yNmG5GClg+NPB6RY
	Urv4xsCdvAYN0ovIFoLF80W1WJIm1007xzAGKCRXJ0F+4n3+mYgTNHus56rwQIImMpvmFpbkfJN
	sibwe7o3HVovZ2+oiklhCevQzYObS238nLJLAeTWRMKaZ7F2xFcRAFwODTEJue/uJdJOXA1TD6G
	JYAC7lHn3LCg8zPmYYMFjUeXN2KEQFbQnswaLHTIUf9y1VS6OMJzkOGmeiDNzlUytYWv0prSRr0
	/h1jouf43yO2VWFkOFvQlAzrvAjHeb/2tXLA+xvGdVdyuXQlkSBreaMYcxJ1D7+v3xeblkvBQWg
	yOUV/P+BTsB3/nKKqOKS5U1EYmSznGv6KVxXKGBlACDLZEql8AnHSy3X0+h1EeFPYcV6NsgqTzg
	==
X-Received: by 2002:a05:6830:4113:b0:862:cae6:db3d with SMTP id 46e09a7af769-862cae6e439mr1975678a34.11.1794832839406;
        Mon, 16 Nov 2026 04:40:39 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c4dd9abesm2830937a34.20.2026.11.16.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:40:38 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v7 0/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 16 Nov 2026 12:40:28 +0000
Message-Id: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v7:
- Add a selftest as patch 2, as Nicolas asked.
- Say in the comments on the static IDs, and on NET_DM_GRP_ALERT, that
  they can be joined only after the family is registered (Sashiko).
- Say in the commit message that the unregister window was already
  there for the capability check.

v6: https://lore.kernel.org/netdev/20261112094205.1120090-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 109 +++++++++++++++++++
 6 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 070411c1590c8172eb4d86f045d99c372f22fe23
-- 
2.25.1

