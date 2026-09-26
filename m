Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218C363090
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438538; cv=none; b=MU5mZMBCsUlEgTyZSDt3RfcyvZ5XQFSf6RK0YT+krjuM9tKfihqLrq1X6ibBdZhqU23EGmtBSs8Kbd1cdAqjwZPH0QXWNKgb+m3j2PQAUWb2m9Xp4Eeq1gwi5Ns3ptF+M5HvtAOV/GnI5QL8uGYmPTDA4+EqzT48+WnXJYsngJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438538; c=relaxed/simple;
	bh=39XEBq1MI6OnsD9yc+4TxU/OT9omjbn58qrqcxRX0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbaiN12a/dSmqbXyLsBmmBgvuqJ9FXoKE1y7uUQXFH9nR24D7CiQaT6Aj6h1wgeh7gESoBwPH/wJ7EVPS91mpEoxoQEm6NT3KZyrwLRDVSNUsEpVmPnoh/OEiwMB4fE57FE7o1AY6vHbwFwheIKYbQKHkKt7aoDnsVpM3TOg/Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=uTvmV2jA; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="uTvmV2jA"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so719657a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790438537; x=1791043337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+37thVuHZ/gLtuhuUGe6FLXA7wHfSbWyBu28cwLiRZE=;
        b=uTvmV2jA6qxYji/GJOLPDUoGBnNY6O8G55vynG4Y+LvaWeBE87kp//aOf7PfoTNPR9
         VuwQpDWhMH4sKcE4iCmKfoPyHXHRR/U48ZxH9ExkwQpF+Qy7OKRxxOl51UHsmcno5BXG
         QrjxbkWl9BfCHOsfm0qw0COlZ/Iq62AKjVIUVMR/mUgcO0wTZPZYAa1ftvYw+UauFVsx
         WwjsP/FtlpV0aWz71/znpH2kLGGqXWanFE/77i464KHYR6/wYXXyJ7RXPy18Rq6ir5WJ
         iNl5JaksLY3kUonCV7t106Xr6mH0eLhQCvVGjrBg75erP53SXPFlSYi82C7oDh7Q+MFI
         xf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438537; x=1791043337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+37thVuHZ/gLtuhuUGe6FLXA7wHfSbWyBu28cwLiRZE=;
        b=VRuIYfqQDaQcXbLeUH0p0NOPRDgF2VWsEc8GKu0pqVMia1noWsJWXxTush0xwOS0Wy
         rQnDt+XnIb/13BJaDyFGrNVOkCcsmXpBf/ydXfIYho0oW5nGuf6pIRFICXTua2KulDw9
         hiOGuwwIiufHZow0cbawTkmXzjzPeK9VfjgodvjkbVT1mxBEnwZ/Cd7mAfCleyQaweRg
         ZcCseZMRI7/GIDDypAvL/IQ/fs5mJDQtQ5+Ksyo+FsFuSKf+y+3UMmKpOJWLtTECODys
         WJoPl022gZ+HpNGO0Xfwq6F1Z6fSpf0swAkMk/89p7zZQsUsOcxpEKbFzYepmHCuEKxB
         /Eqg==
X-Forwarded-Encrypted: i=1; AKwUvBwPBxyDxgBg1DjmnCfZC42QqeBC5cCDZuiGswpqoAzqX4Z6loDzQiVhFOhcHpw1PGE1i9MVcnR+5WTriTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaWxnoPZLFS7EJtOmZYNNMJHPyOaqsJW1EBO58uNhJeT0wbRAc
	UjXqrXep1O1hJE4cVVOcGsjYd6QlvITmEqDosE4K3lyfycnMX3qbqtVu1zjxR5JxF+iq
X-Gm-Gg: AYBFou0+Ykz76VMcNv4fBOnWwzydRMi41/S17G0zRh+eNfhJ2gVjjISrD+pU9GDkffx
	77IdIoBI4oFeIq8AmFehUXIm961R96pX+uMQmQ00Ypqy0WcJJ3fc9kxpoDbJYSis5ugfm3DIChp
	1+mKnuEfc/Ku6sXwkOICRqZyBJskt+gfZ++pV24QEWCtRARYOuTI34vve1n6OHEIxmcdk7VFnSw
	oiKQjy/qJXVny8kSSwHeBqZH9E2fhwdevHX7M65fS5oW77vgzpcB8Aksg2NAJ496vBekyD+62fE
	OcTODasPe6VlI2tCgRGrxVd8ICTH935jgQapHwUFVfj/AVDL3qGz3lMWPK3lntsVZ6owoXXzj+w
	RacnB9+JvOSkudGOqzJWOG9Ss5yTp0D0hi49vH/JObrCllqwltJn7yUXyI3uhfm2656+jknZy/I
	6AY2EhUZOEvIWQpABUwp8I1q432BhRLeRIz17gL994wooimy0R7N8nPLyFhlotz6IQ75DUCIwpg
	OGxBHSg14/sOhI8scK4n8qYFJ6TJQ==
X-Received: by 2002:a17:90b:4ad2:b0:3a0:b312:1fb8 with SMTP id 98e67ed59e1d1-3a0b3122489mr4434989a91.6.1790438536817;
        Sat, 26 Sep 2026 09:02:16 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm10449199a91.6.2026.09.26.09.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:02:15 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Zihan Xi <zihanx@nebusec.ai>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v7 0/1] rxrpc: fix encap_rcv skb accounting exhaustion
Date: Sat, 26 Sep 2026 16:02:05 +0000
Message-ID: <cover.1790427022.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v6 fix is not yet present in net/main. This reroll rebases the
UDP receive-buffer accounting change onto net/main at a7bfaba4823e.

v6 Link: https://lore.kernel.org/all/cover.1789608557.git.zihanx@nebusec.ai/

Zihan Xi (1):
  rxrpc: fix encap_rcv skb accounting exhaustion

 net/rxrpc/ar-internal.h  |  1 +
 net/rxrpc/io_thread.c    | 77 ++++++++++++++++++++++++++++++++++++++--
 net/rxrpc/local_object.c | 24 +++++++++++--
 3 files changed, 98 insertions(+), 4 deletions(-)

-- 
2.43.0

