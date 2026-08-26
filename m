Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739C48CD67
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781903; cv=none; b=HU6zy1a4o4X7jhno03WqMrMjL3wHJ13B4/F+YiUVZvCVwEwOMI+gnO3bzBcmsR3IOT7KeqDpuuQZBP1vbWp1jYZdZnnmd24KhAg12hQ0RcT8u6FE3iZelS6DehWlK1DHwA3sVk47W1lZtS1PCTprIfG2WCWBa0z1iCZHzlPfvs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781903; c=relaxed/simple;
	bh=mUOu4prFbH3IaF5Zx3eYa4vcy/qKSL+mXorCQl1XPlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6uAibezkhykKulws+u/XowLGyTskllqrcd0fF3P1ntjaHSXmTKAgB2GRjenu+GAXMnJwTj5uSQHV1fgby2NzzPqE0zdoMWcVMsbKQCxxLnwTdD8mO9cqgln8p0Temsu0m5CgO0VIfQuXGd95q5S7lojNt0h37ByRvZFPuSIjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-482e61db882so165755f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781899; x=1788386699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YabbSQ2ZCljuR5SzDy1HfG5T6nOzAXlSelOf65B5pQ4=;
        b=e6BMjE9EJuosCP8WaINpSByiwDO/JocxrX34drK48ddRVeDUCA1vGwPI/hHah7XUFR
         I33FpxCFvsYHV/Evx5VKW23gc9kX3yOSodPOuIGiVQ623XVKZF8Cfm+F8DjZP6kmYnCI
         yEXWsQcpVeMFhGZTG2C57pXns1T+VdSV2VWAgwCRzAj0kBoMwKUKDOYDkVaQf4Fa0zx8
         fWdz/LxEIgT2y3wV8bYmRX1RWhyMn9a8qE/1X0s5RztzqmXHKdZYrtZ+YATxiU1TCx3R
         XkTKFJatfieDuFTvx34ibBZrhZG+QtK3Bf43U2uki1SvLbl72YaqlCn30cDgzK0xkmLY
         B+SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4TTgMZCNS9HHuXdGYnUCAKYWRO0E0e5h1YbLPJAbxt5KuAMWl5CsjB8kg2JkFIBHKItKBLspKGqf2CjM=@vger.kernel.org
X-Gm-Message-State: AFuF++mUKpodEPku5Jta+etFXi2IUE1ch7oKRwX5kCCdP6OLdrXA25rS
	HYBNGwBVt5yJKOpi7u6JDXhqtOlXud2XKOkwReykRE7ToJ+3H7cn4IoZ
X-Gm-Gg: AR+sD12S9u71YiBrkcjaslhX7qYYAweC4iEOBabM+q+lFaLDmQYn73f2thJfWqLz6vz
	q3oXLU1XhdEx/PrRzjR9y1ik+9ZoSQ/R+j/PAUUtt24NFp1/Cqli5/adkbCiZPv7p6mOrXYuT9h
	ZiY0UsUprmId2GzKmZ9DrhpaFWW/cZMqrPmNMnZsAptP+dn3QeY8o3f8IvFhFQgAWeq7lW4U0AY
	k5ngpfQatQFM45+8SsjQ3lbAkkYXQMlVburwjs+eNqqP0rJc+oa7MCkDwvNeh88tKn4ggfCp2/T
	wRAtH64vYTJ6wTzx3/PD7E31n674Cvy3TrQkH2iZjHgzXxqSOA1zKwfPzjsA8tXkb4nUyE5yea6
	unQIQpYIny+gYUVHL6/gX1ORY4QaAIUmqFwLv0JvP9T0z/E42piVw1+9qweWT6JArAlBhqyqpXS
	/Hjn/2HPudCLTa9NJhkmrje/+a4nYT6owttkltPCj/PxDN+2fN7IkR47dTOyhzGkyCL9FoXjrcw
	yGDOWq61pRd/AXVeQ==
X-Received: by 2002:a05:6000:40e0:b0:482:ee81:f0ca with SMTP id ffacd0b85a97d-482ee81f321mr819706f8f.12.1787781898817;
        Wed, 26 Aug 2026 15:04:58 -0700 (PDT)
Received: from im-t490s.redhat.com (37-48-53-4.nat.epc.tmcz.cz. [37.48.53.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm4446370f8f.10.2026.08.26.15.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:04:58 -0700 (PDT)
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
	Ilya Maximets <i.maximets@ovn.org>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] netlink: specs: add missing mask attributes for conntrack dump
Date: Thu, 27 Aug 2026 00:01:12 +0200
Message-ID: <20260826220444.4054714-3-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826220444.4054714-1-i.maximets@ovn.org>
References: <20260826220444.4054714-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'mark-mask' and 'status-mask' are defined and supported by the
conntrack dump, but missing from the list of arguments.

While at it, the order of the arguments should follow the order of
their definition in the enum ctattr_type.  That appears to be a common
convention for other spec files.

Fixes: 23fc9311a526 ("netlink: specs: add conntrack dump and stats dump support")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 Documentation/netlink/specs/conntrack.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/conntrack.yaml b/Documentation/netlink/specs/conntrack.yaml
index 6ba28cb1c2ab..b1eb102ab843 100644
--- a/Documentation/netlink/specs/conntrack.yaml
+++ b/Documentation/netlink/specs/conntrack.yaml
@@ -604,10 +604,12 @@ operations:
           attributes:
             - tuple-orig
             - tuple-reply
-            - mark
-            - filter
             - status
+            - mark
             - zone
+            - mark-mask
+            - filter
+            - status-mask
         reply:
           value: 0x100
           attributes:
-- 
2.55.0

