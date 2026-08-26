Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF8548664C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781897; cv=none; b=G83Odhu9ZTvvmqlPMkVLrCgFAW4i/sS0+h4XYR77xa1esCor+10p6mMhStv5MhHFi6EKLQtkhoK091YL0krMXOgF9VY+e423XqsTqQ7YtrNje19PAUQ9HiSVjaq5BkGwILvvFbQJhgWcAWlTSDz2uKigWFDBqcQi3n43ZYJXWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781897; c=relaxed/simple;
	bh=avWavNZj+ROQsclS9fDyynsASSegrDqu/qCZGFh8iYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lz64NrC4b1ZIDY2tbJ+KLIFpuajzlGO835Wed6dG/8MFsnLKBaTjcBZN44w8NofNvPmGbgGCgBSMx3VBevBfMvixxcKN4DE4AFHrERF/oIzZ3DndSRtd1IIyeppg+O+1Fn1LSrEgotq8XcsnqEJysF3QzeNG863Ugb0VLov9pic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-47fde295992so300043f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781894; x=1788386694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OIG0D3qhm2TUglRdX6PNbg8gac3xIElAw7x8uuU1sI=;
        b=Oo3VBcNy2MCTduP6Xqo1C7iVn+XNgej01zz8CBRqDl6Ndz1d3AvF5U55AdLvS+2wLo
         36Vz4YPCa1oQXKUJbXm1SWIrUxx52K+bggMRyNDeUCIg4JeZToWZwwZMrZvhF6xOxIYZ
         +6pHN1aiEqWPkHi1Lp3t5rt50FHhpgopQJ6hvSthNjdSWsneo0SduglNw0uL/le/AL4+
         aJ7Ef7F7U3zki5HD/TLhDedzKetKzQ3/1t1R2iJSouW81L6z36Rg3NQeZ7Kofrp3iXPR
         9gjKwB8V6nEsLHsuOQFEC73w9qekMAUTBh8kNn0EQTKVXJDzeGi1vykl1H5mdNPCZDaU
         DXOg==
X-Forwarded-Encrypted: i=1; AHgh+RpPMjvQQQEbQ+xSIA7/fKCIbyn6OKN+KdMNqpYInnKpPwbK+ScTs+Y9Y7g/l7ef5WRmhb/L/B9dA9Fo9og=@vger.kernel.org
X-Gm-Message-State: AFuF++nCjJUJq9mw/fc18qX+ZUksK7C9KDLf6XR15sZehKPlzekjmTCw
	DzZkM0izkyyU1w90J5N+YzxDBI/spo7VbbFEtBVly6QrceEdInDlT2FK
X-Gm-Gg: AR+sD13En5Y7Egz+mTuxeV5CbXFpI+j/SScdTpQs9EUzSvmyRdlO/h09C//wpmD+P46
	KNS6VCzn7imcId2IbxnL0kHfZ7zMthFCQxijk5qc5umxQjGUejIQHL1+3XBJgYOm2lbGiYSpZWN
	OKmVefUrIIjrRpiBgFL/qRHkuIChsMIBdGgvkmyjD4lR6rbuSivL/OBkv0kMcuIIGgvD4APM9dY
	jwXeA/wUogUXiu7/Lg3U9cJ3tGwLAIP0aWTkpKwuvzVmPFJUAu+zWeqynTBLK+6jH37fu0ctUOi
	mqr7tWkdVUIU7hglm6G0YIUIz5N7ygflWKVjaK4DY7PBQZKgaldXOZN2AHuaaukmhdlNnsTco/k
	W8vv3BFCAIWgCKd3cAqj8h3w8RzgtfYoAfMO0VSMtGoavGjCoFgGEgi7vU78KjeCKjQYSBNfUIb
	+RL5d7ZWtMuPaWx1uLV/V7w2wmKUnAzGpDCqgqCs8TyTZF6aJbjUC9q3giBjm06ipd/6vDARuqu
	+NHQO51bPsgVg1MyQ==
X-Received: by 2002:a5d:5847:0:b0:482:dd86:348 with SMTP id ffacd0b85a97d-482eab6a866mr2110147f8f.4.1787781893856;
        Wed, 26 Aug 2026 15:04:53 -0700 (PDT)
Received: from im-t490s.redhat.com (37-48-53-4.nat.epc.tmcz.cz. [37.48.53.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm4446370f8f.10.2026.08.26.15.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:04:53 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 0/2] netlink: specs: fixes for conntrack dump filtering
Date: Thu, 27 Aug 2026 00:01:10 +0200
Message-ID: <20260826220444.4054714-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Version 2:
 - Also added missing tuple attributes for the dump request.
 - Converted into a set by adding the patch 2.

Version 1:
 - https://lore.kernel.org/r/20260825155832.3685714-1-i.maximets@ovn.org

Ilya Maximets (2):
  netlink: specs: fix the conntrack filter type
  netlink: specs: add missing mask attributes for conntrack dump

 Documentation/netlink/specs/conntrack.yaml | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

-- 
2.55.0

