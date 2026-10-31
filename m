Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793425600;
	b=LQYvwsCkRfwTQwc0TSwgpBGUXFnZHCyP+bCA63g4te9lQ3UzwMfXlbYbr44THGNyWa5E
	 EYrNVUmPvj34u9iIOvk8FiKELzxePJlt4gAAH8u/l1o8UdLLeLZJzSdyKlsvD88Heh3Sx
	 JplYZ5FZmrmnEqpf9Vu/uJbGS9+VrfiqNGrYwecEG9KTmuBmhWuiDKpL6Mt7hlFCthWJj
	 g1tMWBjNejfhnzo5XQhswLr3wTeb/M9xvpkicLH8MIXHihnxneQmc4ZBePZDudjH24SGP
	 ndf2fMbSSOFmp4kU2MaUAO1KvHibC9Sw5OaAHZwwIjT0peEGV0CUa2CEUsTROShqkbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=597SVjqFkP14STDOk7S4HpjKdXVmvh6EV5etFFqcGZ8=;
	b=OC/Hb6INWPem/n5LxqdENZ1EXpLwRGzPy40cpSMQb0jnluuj2FrLlwg2k6jfQa+Sr3Sh
	 z21z8l5XILqTJy0EA5JOFIUPH/B1z9+maHB7udymm6ss6CoBFqwiQf9rbC21I+28rExL5
	 oqr0WzxGebCLL7xk8CcdeQScJotYR+F8H9snZFuLE+h8O5kuxx3E4hJpZdYfEo2Gp2GIT
	 Ky/sn9Zg5nmXbjjoS92CjF8HK6QMnZ8qmiOUYZadXfF1lepAlJbnAKE1k3z18gZjM3KSk
	 OrunnSQN5etrUGLuk8Yey8ZpNnL6j2ZzqUZU/FA88r06WV6m4hO1Uy0njpu17bT6JDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZUva/FSv";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E74F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUva/FSv
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so841708eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793425599; x=1794030399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=597SVjqFkP14STDOk7S4HpjKdXVmvh6EV5etFFqcGZ8=;
        b=ZUva/FSvcdQ7XFNlXANdr8aIblbb/KkHwYHR0ob47Nqip05qx5UMuj634PMBdXmGDg
         VvNhT3GT+TPs9EqkHHIGh8TPTMdTkHv95G+7OEcx8eLom7RPmHzBnm7IF4G+3rwR0L29
         atW0lHww1byrkwPqMyHf9N1NFr/HLyqKNaGpU81C6h/Dobsmjy01f2FKEY4sy0O44hjv
         HWm8iGLcp84O0SrKBVpSmyEt7VNyVNysUbo2+GSFNNpUX6dfyrFWRrbgpk9onF08cFKx
         2idQlIM/mgOGTatN19cnx1PvwUJA4tMUEvbFh95UL+6O3TtjmCGVaEbeFVbIjTVUCjkk
         bsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793425599; x=1794030399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=597SVjqFkP14STDOk7S4HpjKdXVmvh6EV5etFFqcGZ8=;
        b=b9lPMlkfGkUdcBzjChmwcjjUuwkJ0JBfP3A0AlV1HGTlHJVsNCFL0KJRF82fKCr/B5
         Jlk29brUtkaQpwYxnbYxQSkjXDkd3nRtz9nabjbiKBYBRZcRwR69oGie1HowaSRT9CAj
         dI2+qCikv6ysh5zYL67dOfL6GuzwGIfZstOr7ShrIxUajl8xrzTiRgTVG5OD2S+K3g1v
         zM21d7dtPHVd9C2D9/o9x6TmkdDsn+A2fiVHnhkj57rF9qxNmxwOfyCwnARS7x7UzTlc
         +UA+gksdXVviuq6ybA4qu9RNq7DbtKcQ1IF6vPT7gckSNIH4EQETmjZDpvdjLmnYtVHs
         q5Iw==
X-Forwarded-Encrypted: i=1; AKwUvByrMSP4HYvB9fGK6a30SRJH1MZDdQFam2J6NQ+s7OojiCsyjO/lSzXz2rTeUCqky6LMyvrwLqx9FnhBPJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIACjaCiEwegikWBReqTgluYLx5u5NZUhpbLUFqsvjsq1PmdVAG
	m27RmJJ/SDLU0OUGzwgfhiOH3N82V2MWSkdY6+0zB4iJsQzmxoBfDcvf
X-Gm-Gg: AYBFou1SdqRMBswzBi24+knZ01X4JvWBa251/0mXqQAh4B3IUGxnFaNV0Y+wPmNGor4
	uTVUklKwxqfpBXnvE/5YHz6zdaRnstlHzCqJEMrEHsZ7qm3F6W9LKQobkLEJPRtJv3L6caH0nAQ
	0rwY/uiq1CB6k9Eo7+SGRCE5uoHoyfjtGZe5LGVbD5k7wwSB9vvV5qD5rl18G4t2J12/MmJBIQe
	MXSLASYpn6sPoom1Uf7dYWl4/GNb4RMsJWuZIzFQAWVAp7PUeoVdsux9YaH5t09Ynh7xwnkzPip
	qjdFa3KCsb9N8zLBMEmB0WN2eXyy9CTkVp8z9eGtrHaK2njbpo0bhMj8IhYGAABBFSFlgpX4lYr
	FL4KQyJUzs4yWDX0knwqXlSHpD/57crMQMf/AHMXJM8pjvnRMz5fBvn4mS5qGiuZsI4x0ssqbgY
	Ro7ni87efCsGrDsborYRG/pV2M2Bf+mX//ZTkcaE6sI1tFNKf+uxuBrs09s02bX65cxfI2Y1yyi
	op2wGFWMAzLd6RWFa6wq+77kGbPDN4L/x+Gym199YR5TDm0tQmEwp2RHLwrEiKe/6gA2obyOaoI
	UggtsLK6skDVaJ3pj55+wK01ETnaMirHq2xn5KwR+AmTl7IfDW6fXNMyQM6ptgQioihiiwZl4Yb
	L/Vrrhcq20FE3KpEcC88OvKnlYEbPZzCSZZXygEo2UtTcYqSzM3AMv1JtF8rTLbr92tb9rHpFbw
	==
X-Received: by 2002:a05:693c:8392:10b0:361:39c0:c393 with SMTP id 5a478bee46e88-36a42340afemr7113890eec.13.1793425599269;
        Fri, 30 Oct 2026 22:46:39 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm11668877eec.14.2026.10.30.22.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:46:38 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] genetlink: fix joining multicast groups no family owns
Date: Sat, 31 Oct 2026 05:46:30 +0000
Message-Id: <20261031054632.3697295-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. A socket can join a free group ID and stay a member when
a family with those flags gets the ID later.

Patch 1 rejects joins to group IDs that no family owns. Patch 2 clears
the members of the group IDs when a family is given them. This covers
the race Sashiko found on v1, where the family is unregistered between
genl_bind() and the point where the membership bit is set.

One case is left. If the family is unregistered and a family with
GENL_MCAST_CAP_* flags gets the ID, both inside that window, the bit is
set after the clear. Closing it needs the check and the update under one
lock in af_netlink.c. I will send that separately.

Tested as an unprivileged user, with an msleep() added after the bind
callback in netlink_setsockopt() and a test family that registers again
with GENL_MCAST_CAP_NET_ADMIN:

                                         v1      v2
  unregister in the window,
  register later                         member  not member
  unregister and register in the window  member  member

The test from v1 (join all free IDs, then load gtp and drop_monitor)
gives the same result as before, and patch 2 alone also fixes it.

Changes in v2:
- New patch 2 (Sashiko).
- Patch 1: no change, added Reviewed-by tags.

v1: https://lore.kernel.org/netdev/20261029062214.3407223-1-anilkaushikwireless@gmail.com/

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  genetlink: Clear stale members when assigning multicast group IDs

 net/netlink/genetlink.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

-- 
2.25.1

