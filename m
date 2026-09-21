Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36954A6CD6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002639; cv=none; b=VGV4prPwXaCo151wMCZT0oAgxj2bMuCnJKVSDYNNAPsjMUaCLIkQLQHgATdcPmYrGBo/z5xrsPnkAZsxuuzSlJ3K/tKiElTUNFysKXrcCqAF3MNJ6ONjw8tQLdahx2TXu2joRwq+kRS8eyT9qnM2ImfgD50lbtmknXdYC3C0OCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002639; c=relaxed/simple;
	bh=bOu2j+h1JsGrW/73PwD/ne4SKy+cAAoi4+vaYnS3JPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RnuxShonrApo7AOdlMxiTOox8hXck9AGYHzpn+3BFWUkVUOO1WK+OdfkW2UIisjLxMkf+prBVLuCdbmC3rcm9vHo+c2GkhvZkJv7/X+Our7SCaFOcpltKoS1C8HOI28ecSpMT8Yu71PacAxvX07IzCGIfUxGhqnbnjQ9K4wg6AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49e8361492fso12426505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002631; x=1790607431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ezyNqdfklEHB2imnyaqpGNvPz3WXjxpC3pksDJMQYU=;
        b=To3AbpsFm4xuwBXZmPL1uH2oIJRLPQHoghhGamfvgCWYaupwpcp2BcF7OW1OI3wsFa
         /zhvLMEzwlv7lcmRKLDg1tN+S9CNmsKFc9i4yUHgrHLzIn66JtR1t929+z8WTbEBoGs/
         SrKhoMG++ti+KFyFSbGg4zAhkoXITpoXREwPv49jfditsZJ98lYLpQnbuwsr5B1Tq4V4
         juRNVLuzJqWw9gsk7gg9LbLbGjMjLKH1Ao9j4B5aPvpmgGW4Ys5anUd3yOcj6L4Oxy44
         m0A5qtqVK3udZs7e9eHfncSKpOD9CHefQs25TAS/x/u6tAWE0oN+qe3nLZFwKpbuYbOC
         uVMA==
X-Forwarded-Encrypted: i=1; AKwUvBwvuk6A0bGx9dcQmnNwVVf2gPbj08cJ7HAhb3C6cucuz0vMNwS3OQyGqk0WxM3NqWA5uyjZEhNpRQMkSeY=@vger.kernel.org
X-Gm-Message-State: AFuF++mX+qZ/hLlWH4w+PmNb/RBzT5zmdHqdmlhtycitgYTo0gkoyL2D
	e7e51FKG/pBWfOV7dVLSqFg/60NCQHa/28U8InMzrIRR5WhRYMa5+xyr
X-Gm-Gg: AYBFou0Gnl74Zmqt41C3i1S/M1SG2C4VgKMy7+e5otIxYVbEBpXtqVaWw8Ww+DmQdXb
	fydpFD+aL25w7vP7/6BZuWMMfBcNPEMpkYsnInlNFVcTObFr39p6xAhqPVNypy8hi7hI7M5To6J
	e4UkCmPHAWtYMC/yGuFi3aW62jhoYCyEui7j8u7gYrEzyBwJa1gBMe09fUMyJyeu0xB8OCUZEQy
	aQ2O7GyYZVpCFlmZOfjvTpnndkFbadR3MNIxcINDol4s9boxcTxy0c1In1RPw2CTsutfLZdQS5o
	UbFgilSLPqqpumc67GTnnWelsgpRvJOIR7SkkeP8Q0wna/Vc4qGONJGQDjUUWtJvTPnUvWcyXCi
	/S1TGlVThyhi9SjXbfXMu3Jb6weAVUp/aMlOHmPE7s8wrsrZqGUnccNQLazz3iHiunzzoumlANq
	LGF3qe0YcnY7xvsOhIC5BwmNTVtpfGsEXDVTExkaNWtU3tqed4zectLbtXP7tMQQofRdLSGgcDM
	wtNqD3fYgor6bp3EF0+11nHhBUrHiEFiGkkSUA2YrBeEyicpTAO
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id 5b1f17b1804b1-49fc573b55emr150845005e9.28.1790002630316;
        Mon, 21 Sep 2026 07:57:10 -0700 (PDT)
Received: from im-t490s.redhat.corp (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm243153905e9.3.2026.09.21.07.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:57:09 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	dev@openvswitch.org,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net 0/6] ovs, net/sched: fixes for UAF after conntrack extension realloc
Date: Mon, 21 Sep 2026 16:55:42 +0200
Message-ID: <20260921145655.3167436-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One clean up change plus two fixes for the UAF on helper extension
realloc x 2.  First half for OVS and the second half for the similar
code in act_ct.  This should cover all the known cases of this problem
in these two modules.


Ilya Maximets (6):
  net: openvswitch: conntrack: avoid modifying shared unconfirmed ct
    entry
  net: openvswitch: conntrack: remove 'add_helper' dead code
  net: openvswitch: conntrack: fix helper UAF due to extensions realloc
  net/sched: act_ct: avoid modifying shared unconfirmed ct entry
  net/sched: act_ct: remove 'add_helper' dead code
  net/sched: act_ct: fix helper UAF due to extensions realloc

 include/net/netfilter/nf_conntrack.h |  5 ++++
 net/openvswitch/conntrack.c          | 37 +++++++++++++++++++-------
 net/sched/act_ct.c                   | 39 +++++++++++++++++++++-------
 3 files changed, 61 insertions(+), 20 deletions(-)

-- 
2.55.0

