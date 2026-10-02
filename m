Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3656370D79
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976329; cv=none; b=Z0ygH5KAMGMMrlLyVV3f0r9Yoryg7gvoVO7uA1BMOWMze/SiYt1ZgrHeFi2Iz/8H8UK8ZoTcKr2n1mjOSTcDXI4lELLtoqUGgkB4i6cHEqF7ctggEpR3P/LkR6utnJv6lb1l91s6u8aEO2SnJCdOohUOPIlsAEG3w1giQIYKgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976329; c=relaxed/simple;
	bh=9aWfK60Ckds4L/biCInfmc5Y+mPQ3yBYOZ7PLGxJJso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3u6eFoA7OmxQs9JZmJRiXFruGRyClkJXV3G7rD11Ev79iliUoubE1FL9CKiXUUR9z7DS7d0a6IId7BU4pp8Vk800JNRiViYZOau8Ru6TYG0w7ne8Px3cVpTmti4JgwH+ZzPj7IPnQkgkqiz1oWCSnaxBf1uGbfslIf5CM5lvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Isa/r3hK; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Isa/r3hK"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-48afbc2b18bso125236f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790976326; x=1791581126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwz5V5DznazyEKiv4IPRIgKMZcVLA06YApkEuH5pcPQ=;
        b=Isa/r3hKxdf+jbnew8xlY8wzTq4bpyJoy0lAGFL2byOsYtHoFVznWAbfpmfweCTD9O
         +MGjMpzvFevkmghNTD8mlea4Bf69No7s/HOpwpQcTkcWXQlS7EJJhhAxpPwDppsk9tHF
         gYW0jWwCZRr9BM6zcUY677hcLoDd5ytoK07SBpb/0MskHEkr8n+WB/91paiFf8hffFaW
         Wid6tofro2snMaBm1Er09oaPji/lMgDRtQNaxgDlshVee3520wwFp260qAiSvbOdqqSf
         RiFE4GxQKf0CYNLK37lXDfItF9wZQVPA0TvpVOGcE41lkg/VQK7aF5nDnHbOe6G4eYbV
         XN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976326; x=1791581126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwz5V5DznazyEKiv4IPRIgKMZcVLA06YApkEuH5pcPQ=;
        b=ymjpRPb2tGBzcRg/BI9z1GM42dCQ2ZkMdNdtsJW+aHmuE5FtFUjwcKOGWFuXChBkQ8
         1lVQ+j2/JaqMAfi6L7iGLcxoLa1rXaH7XlYh+MObmqYDDCJRtwGiy51D8c8pAPV6omGp
         /Rc6Rgk8HXQZSFKuDBPnVDPwyW6CXxLEPXA3h2uUw8BQY7XhJjI7tAaK5Wh34MAL7Akr
         enu2w5/HJozvcK0yo74Va+BOUplIdZe3G1ACsmxV3IztJInX8OpCHIBz+eF7X7KWyKPo
         mnRwvJLFS+Ul2Iy5rTmQ4H5t5tJQqSV9vW0nsRE3zJfwzLms1nEUIKUs7j5O3GOUmpzJ
         M31w==
X-Forwarded-Encrypted: i=1; AKwUvBz2V/BafCsu4RsRTZc5rKQOrDQDPaTHI/xIqLJ9Lu4NjsgWq9InqKB4dU+MuEnE+s8EhrM5B0Uk0OgkV1A=@vger.kernel.org
X-Gm-Message-State: AFuF++n0lvQZ38V4LVWFidIwGvJLzK++zaGTK5dkoIrY6mAz/8WfJHQd
	S6AfEj6U7JGTVQvDr+1G+eBP9hCUrdGkIPyvDLK1dolrFCRn2ypmUskVrDyC4r4wGQc=
X-Gm-Gg: AYBFou0wGzsXEUw7EP3npKPweyrUgKxjPCTgTdbK7zHfdfZfbPUxwoJfh1zqw/yDPne
	zemyp908V88UN95tHK01/Ady6uEHtosvTLMcTzxXNn1KCARw3NG7+rPVkTRgB1s7oVIs28fsgJC
	FFebxRtsAqhkZepKaqVTDKwZKDzgsqBZR3sKuo1f2uGM6PEYlz4eevj5CMrzF6gaOOrjfeBJkcq
	7hX9gvAKlno/PR8WMJmRA76iyfbAnkMELw2M7PfgjOOw/ZTGK1PrNV0UuSZ0a4WGkYSg9spJKuZ
	dTN5XX7sv6m5hI4qUJtXu8tNW2bTQq0c/bieiFr6sIlRjGt0cmbQ+K2U24iNYbDDqgmyMBN2tSZ
	bWf6eergEw1iVy+VckzjLSynqr81A/NI6igGZtJ0FbJVVaJsuvpZjZ1111ElowF44vZu7eCRhYy
	JK74LehmpphqmHTFf45MoXeO2UAcnS1uF4b3Tfw2kixOmrwsALJ5bJTtqs45SEo9wslS9vhtNju
	n88J4XPECaAuVarskmzE5pQPt4uJY2HqzYgNIUaqYUvD+2OArQcbFt4PRF0YLuWgKEvh6GBF5Pb
	Cg==
X-Received: by 2002:a05:600c:4f93:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a027eb058cmr61869705e9.30.1790976326117;
        Fri, 02 Oct 2026 14:25:26 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm7183149f8f.2.2026.10.02.14.25.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 14:25:25 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] amt: mark relay data as a UDP tunnel packet, with a selftest
Date: Sat,  3 Oct 2026 00:24:56 +0300
Message-ID: <20261002212458.34247-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() never calls udp_tunnel_handle_offloads(),
unlike other UDP tunnels. With tx checksum offload on the amt device (off
by default), a UDP_SEGMENT burst through the relay is dropped before
patch 1 and delivered after it. Patch 2 adds the selftest.

This follows Eric Dumazet's suggestion on my withdrawn [PATCH net] "amt:
do not offer software GSO on the amt device":
https://lore.kernel.org/all/20260928181554.85766-1-omar@blockcast.net/

Not touched: amt advertises NETIF_F_GSO_FRAGLIST and skb_copy_expand()
refuses such skbs with a WARN_ON_ONCE(). I have not reproduced it, and
it would be a separate fix.

v2:
 - shorten the changelogs, add Suggested-by, and move the testing notes
   below the "---" (Eric); patch 1's code is unchanged, one comment is
   corrected
 - patch 2: fix the shellcheck and 80-column checkpatch findings reported
   by the netdev CI, skip when AF_PACKET is not available (v1 reported no
   result and exit 0), add CONFIG_PACKET to the config, drop dead options
   and code
v1: https://lore.kernel.org/all/20261001171016.88208-1-omar@blockcast.net/

Omar Ramadan (2):
  amt: mark relay data as a UDP tunnel packet before sending it
  selftests: net: add an amt test for UDP_SEGMENT through the relay

 drivers/net/amt.c                      |  10 +
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   2 +
 tools/testing/selftests/net/amt_gso.c  | 457 +++++++++++++++++++++++++
 tools/testing/selftests/net/amt_gso.sh | 269 +++++++++++++++
 tools/testing/selftests/net/config     |   1 +
 6 files changed, 740 insertions(+)
 create mode 100644 tools/testing/selftests/net/amt_gso.c
 create mode 100755 tools/testing/selftests/net/amt_gso.sh

-- 
2.50.1 (Apple Git-155)

