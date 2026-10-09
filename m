Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C88382385
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524463; cv=none; b=VCktgFzWUJSaCHcJgkyOgjNd2D9bGaW6BS6xcPEknpbSrbMmzi1hp2c372lQU4zlpeiNGdNaeYKf3QrtB0SWdA7ku/YpMYQ45DP73UFfllrUrJSfkq1FkG689QKA7RhFha6jLxTm/9tob887SmvXQcauiAU3XRdmiUMbnazOr70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524463; c=relaxed/simple;
	bh=xBQiQgaoUXVgysZwxJNM7zciXxS+od9nQKuTE7CNWLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NEK55vB1n/WBf1Vw2V4vhqbIpsJZuNBmZ+jBhWJIU7leiEhhq8Wg2dgXaq2ZRwLbzoIlkRP6Ij7T1oYvIHE83yhlCGKia7/hmRrAlX9tEHNl1DHOQL96kEPSGaOzVXdolOs36649Q7+XwCTbS4h7bUxXgDKiU5qGsMh8l8fzsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrN4kgGM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrN4kgGM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1958609a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524461; x=1792129261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Q8ZxpR+TOzA3v6duUxSwH3FZJvTsDsZ5FM8mvYvZbc=;
        b=mrN4kgGM2GBj68nW8vs4BfQtDRnaFKzjjHzZ6n0Umlfk8chrDtw5knsPB6n09tMwws
         4o14+7NavX6seGzF1kjOdqubpwAMayAm2LjO9Gln4VNrCgtJQOC+8vbaY8tVMM29zYWp
         WIPUx1C0ld9cm+vMLnzwKh+TMOVAGBBrJllUEHTZHUA7HfF1Nuc0XKcnJqgovVv56Olu
         osNfyqqesAO65bmIp/AHeMQ7hIhj/CCY4RXDNviGLBbcsdgdMnoB/1L9l/pyQM9FngmP
         HjGziyIDrsDxkaE0A5rTQDmKGJvD8pWycj8KIilYfkoASU1dk1YxHFq9Rt8Ah2GF2a6e
         ieug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524461; x=1792129261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Q8ZxpR+TOzA3v6duUxSwH3FZJvTsDsZ5FM8mvYvZbc=;
        b=1e3W69jE2MOyWSC7ja8/0hTU3Fp2UaN4mlc7SF3i3lSBxg8rOo0BSZmGi8BALjLX+i
         V/CHSJnfT42zJBo2kQoK5CwU0UIVIUs6qiCD7BXweaeRKQxlUho3cS1m0QLaysS5XPXI
         wZv+nBPpssxwlOA0I5Cx2oIaLgn9NrHkZl+p/1O5peGi2vEKTMHdFnVSS5XW/AH5hGZz
         XbABzHjVAne6isa3bxVXqoog6rWX2snGYH4FghZkzIzeQu/vqnqxq0+7oZo5EWMo3e5n
         0YP1pNUZCpUmlRkZRwfdrJlmqc286OKVdICvDsnpmGO5lyMz2xSkuhYzJUPnkddgA5gv
         +TBA==
X-Forwarded-Encrypted: i=1; AKwUvBwfW4i7YfgI0AvFMYGSC14S9phXAeYDExr10n+fVWC/gHUbIwWcM/ybOZHnNo7JeIuci93RGT1Npsf5hbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRIVybCaJtobEaNOZ4TVQuY/PHdWFBBFXPnFjNf89wXA5ZVBYt
	sbzoFQ/bs0b5/iQmiFj8ZV96SeZIc/7H8QDhAAdQXCyEBaSRZkI4rbDh
X-Gm-Gg: AYBFou2kFPnl8IXk1jvfwNgWrVSwtUhFEezblkFi9tMhOO616bPUrKwSKdx/GQ/Q70o
	2+OnjUgO6CGA8Krxf0VcI/606cqtsYqd7GqPovIveIfga2zWSmn3l3CXyXl6kKXXS9iw1fxaN13
	aC5KJ0zoWnVKCSIxdPKDAESZQdXw8rm1CMGgo3Upcj+0CT5LO2TiYsU7F/rG3hG4+p+BJtnkHtk
	6DHkkrjWgRAMVbT7UPbstAa03b7scfP8vZKt6fNCW9DUADPYgpvU+zZYm/ZerjfTanREeTPvAn7
	0Ore5YMXNP8nLYZcpBIx9icfPV0WzgvJRPWBLssLH8oBhDn8WQBfDM13ntJMLJhCI6i9JyMKDR4
	EjPfZGvvKkqqZskTTJY7wwCfzfwFRd1WT4d095UKanLwkvRFX64TVY6sreIeLsFPX7fCqWIzmde
	QOUHvKqV7ts6LT+4/v4PYQk+qWtqjdSlWZtSGYbCGk5CN/Sr0cWDzyLATIbMAJty/J+DVp5xwno
	qLUVbXgfmP4
X-Received: by 2002:a17:90b:56c3:b0:3a9:4e51:9853 with SMTP id 98e67ed59e1d1-3ab3a9a0394mr826608a91.36.1791524461080;
        Thu, 08 Oct 2026 22:41:01 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm2028695a91.0.2026.10.08.22.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:41:00 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v3 2/3] ipv6: remove ifaddr from hash during ifdown list cleanup
Date: Fri,  9 Oct 2026 14:40:41 +0900
Message-ID: <20261009054042.272944-3-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009054042.272944-1-4ncienth@gmail.com>
References: <20261009054042.272944-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

addrconf_ifdown() clears the address hash before snapshotting the
per-device address list. When the device is not unregistered, a
concurrent ipv6_add_addr() can publish an address after the hash scan and
before the list snapshot.

The ifdown path then removes the address from the device list and drops
its last reference while it is still linked in the hash. This triggers
the WARN_ON() in inet6_ifa_finish_destroy().

Remove each non-kept address from the hash immediately before removing it
from the per-device list. Keeping it hashed through the delete
notification blocks same-address publication until NETDEV_DOWN has been
delivered. Unhashing before the list put prevents a stale hash entry.
hlist_del_init_rcu() is safe when the earlier hash scan already removed
the address.

Fixes: 73a8bd74e261 ("ipv6: Revert 'administrative down' address handling changes.")
Cc: stable@vger.kernel.org
Reported-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/r/20261004135117.GA206930@shredder
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 77b3b1154d591c..5a7e7129d43466 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -4027,6 +4027,10 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 		}
 
 		if (!keep) {
+			spin_lock_bh(&net->ipv6.addrconf_hash_lock);
+			hlist_del_init_rcu(&ifa->addr_lst);
+			spin_unlock_bh(&net->ipv6.addrconf_hash_lock);
+
 			write_lock_bh(&idev->lock);
 			list_del_rcu(&ifa->if_list);
 			write_unlock_bh(&idev->lock);
-- 
2.55.0

