Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CF3A4520
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522092; cv=none; b=XkQRTdwEgmtgc16oCYpC6t7qzPxDjkKLqBlTgnlAYGvdx4zh0MVLHVOWczrA+ACDLmgL+RLFElRx8qYagRQ4ZRlR0tpWwpEFv1AK3IhtW6ykbKfU4RKyTPryEnpgOFaa3KW6s8CAyrhtAX4arbfWgTH+bQjm8tkrZXZqMHon0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522092; c=relaxed/simple;
	bh=w06dbejtkEH04LcmMoPjg3zXXYBbOO8qP0cKSsXeiwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbf4TEbTFDIngk5Fc7iFcaZvTx8vRr1DFQIA+hD1sExD4P7tQd5zu5AcBRzbjKc11BuN6dauDiMk7O6wlN5YofhjlEc5u7/nBy54zgStaGan/XXwhQUV0BmIulMdfStxZn0js+YQplpe2qmsUhJzwreREMExoQl37NIsKoq/wsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=RwQn8+MP; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="RwQn8+MP"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ed6d69bdfaso3310457b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791522089; x=1792126889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qBLA0HGkiEWJ8GXA3riQcw6NGek+JArcvuviGDYRsc=;
        b=RwQn8+MPqQDTQsRgEN/dePQgq5OZk+xmPJ+3n0XmcDCkBi8kNb8xvGOjo70z/PFUEo
         MrDKA9DTBLCNOaPa8Gtgz7KvPLS3rdb4noIqcjUo4+GKIxcKaB2DqyovmpT+AEWjW+UP
         sad7+25sfkWv1mRelRk5ZTNA4ykQEjWryG3Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522089; x=1792126889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qBLA0HGkiEWJ8GXA3riQcw6NGek+JArcvuviGDYRsc=;
        b=yLzeGVEe+HJpNsqUOso5JOfk/CKAa22kaD7vItxKUMAvYZvEs0/JOUCnIaF0UBW2Kq
         bIYLqaYGZICFckVjxRnDuQzvMLVrZ774WX+WKGbFdfv76v3n99v+BKPfRfObhknb8o2e
         hcQAedb/7mPinal32zv/r1qmlSV/NdhmjdrOnoaRJoE/+vQXPk99rtVbk4OiUiiupc10
         BwUQ+dGdKm6FoJSjXIWvk7YIGeOcrUg1jvPkOP0KmOBk0eWqEZHqaBDC79tVtxtn2HN1
         0QobbRGwXEtX5Pp2afXonAHNg24rbgERcKgmPwSjuD/DAaQbKC2ZG3pWTdm6My0IFX1u
         SB5A==
X-Forwarded-Encrypted: i=1; AKwUvBwsxhVOQTFnyA8dr3NVW3wZWGN+pXaG0DPrgFeXjgZ5evORLntyHXOn660YM/FZo8c5iysPsWCS3sTuTYk=@vger.kernel.org
X-Gm-Message-State: AFuF++mX4sj+Z5inm1yVKtcrDf12ZvsxBlr6Se3WsbDo4FGpCEXaDXdB
	PmBlioefsh/neysRtg0pUIwjP9jW94u39VWk4u+DHhj7dggHsyD/L1VZ8UPLwEdDyz4eihc8WnJ
	XoOJEi4FXZA==
X-Gm-Gg: AYBFou1b56CD0pnTjb7d/oqg5hzffk559FOixSYOF5MTaYoXmZaKwptkd2I7kNGd3Cd
	yRigJGYleG96/4s+8YSrYnCpSBI+HK9UcQrgzuxreHoo8/v5AGjMIw72mo3WY+x8R57cIJ88dp9
	eOkzEFnZbxWQMLWaUWi5UV3ZY1Uo0RSbRjbO0eoTpdJZXtqHd7iYCPZn02RVatyPKLfUlZWYJzN
	FJQOm0VbtqMdm84SY8h2zDTO2sRXR7tvC2fdbtkdVCM2xrEZlY3cFC6s53F7rSlZB14akXL/cI7
	cwxCuiietTMK/Ms/epfcymFmPEM8iZXV8MqOVVXo1hH6BT/jXO9N1SLkpgugnivKHy9/I9QDz+N
	wQoHEcG78PEkaairu2yOhzn8M8JtyUA/GPOEpbOUCX1QlNEu4N3Rv+zO/rRBS2WNA0WCiJMGlKJ
	EYoGggR4OD3Zdf82YEcvieWECFa0RAW6EMXpfCXUFFSgC774YxI9hQPpRkGbph1N2Y2/48PWLdD
	KD97Nz5qXB32xkLeG9qJitLMCClZAyQTM3jHF/IweQAGI2Gqc0ZnKKfVdD/HoXuv/ObIXES/1Zi
	LOe0
X-Received: by 2002:a05:6808:15a7:b0:4b9:e5fa:8903 with SMTP id 5614622812f47-50c4e685311mr857092b6e.22.1791522088665;
        Thu, 08 Oct 2026 22:01:28 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c1246cbsm944574b6e.18.2026.10.08.22.01.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 22:01:27 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Neal Cardwell <ncardwell.sw@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/3] tcp: preserve RACK tracking across partial undo
Date: Thu,  8 Oct 2026 22:00:31 -0700
Message-ID: <cover.1791506907.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Partial undo can clear the TCPCB_LOST flag on segments already removed
from RACK's list, which prevents subsequent RACK loss detection, leading
to segments only being retransmitted after the RTO.

My investigation started from seeing repeated TCP stalls in prod and the
mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
96 KiB. It also seems like others have seen similar symptoms before [1].

These changes use the implementation provided by Neal Cardwell to restore
elements to the RACK list that were lost but not yet retransmitted.
Segments that are lost but already retransmitted are explicitly left to be
handled by the RTO. Since I've used your implementation Neal, I'd love a
Co-developed-by and Signed-off-by if it still looks good.

Patch 2 tests that these changes allow RACK to (re-)track a segment marked
as TCPCB_LOST but not TCPCB_EVER_RETRANS. Patch 3 tests that a segment
marked as TCPCB_LOST and TCPCB_EVER_RETRANS is transmitted by an RTO.

Changes in v3:
- Replaced sorting with Neal's implementation [2]
- Clarified the relink helper's complexity comment
- Clarified the original packetdrill test's comments
- Added a new packetdrill test for the intended RTO fallback

v2:
https://lore.kernel.org/netdev/cover.1791248202.git.nramaswamy@openai.com/

v1:
https://lore.kernel.org/netdev/20260926002520.42955-4-nramaswamy@openai.com/

[1]
https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/
[2]
https://lore.kernel.org/netdev/20261006141300.1722466-1-ncardwell.sw@gmail.com/

Neil Ramaswamy (3):
  tcp: restore RACK list membership when undoing loss
  selftests: net: packetdrill: test RACK after partial undo
  selftests: net: packetdrill: test RTO fallback after partial undo

 net/ipv4/tcp_input.c                          | 50 +++++++++++++-
 ...tcp_partial_undo-restores-to-rack-list.pkt | 54 +++++++++++++++
 .../tcp_partial_undo-rto-fallback.pkt         | 65 +++++++++++++++++++
 3 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-rto-fallback.pkt


base-commit: 11536ee3d3e0b1bd35b6f3f8df55a6053eb0c71d
-- 
2.55.0

