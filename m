Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70792331A4C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736209; cv=none; b=XOcRgxj2HMfVcMH3GtZdpBMw15Vl7tRESNxhrrRSNuw3jp7z4ZXFUG5VP1YYDk9dUzJdjvqpopeAe6oklBoEPWOELL+qY40/7Fu2WB38BoxrNI9mtqqVH3v5UTDEmZDh7+PtNDuGuMFAH/azkUcltQqAK9SALj9LzQAXEuu9nBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736209; c=relaxed/simple;
	bh=gySf8tkZ428le/U20u/o3aiJzjkbegB76EnbNa6P9wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwuDDzXeCvfoX72eZYatsmRkbE/Q+Bq/oeNABql7JhfdhOoDNeAOyQCt33sgggSIAPiY9ecYu4m0vJm63yGidodpmmsuHoCARSdJd113751s4hkd+kkcPj13+Hyh42tE83cIWbqlpLpbomy3Yr65y+oW6HZYYER0kWfQQ+j1ELk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=JSweP+ED; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="JSweP+ED"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afe0081a6so771207f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791736203; x=1792341003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdYE9zpvqOI/pBDY8tVSICunrB86zu9zwPxNrA/jEzM=;
        b=JSweP+EDdEAE/RiCrhIKV8bFEjoBeR74IMDd+Ugrq/8Tr5ZdhdHn1003RSbN6RtnDe
         IyTU5hGzofjuFkd9/meVOgrI1o7YpEJJS4Enh3iN72gAipq2G/INjm0fz/1QsUbrpyji
         6bhsB8WjH3dh5TXaGdJE/Mj3i5Hk1Ri97jx4dD9A8jPlewAmPgKJwyG3FpKmBc+lE7it
         +OuBLAdiZpXUH1G/KwuoF0lLySZFjwXE+TkVUvZShQMdC4cnHqUxUkLXbTcmdl+d/SuC
         0KuxX+LFSLMTD4al0asnaKxHw4pPXFbJWW3iyx6ahTzelFZIinj1RBwAKhTYZj/Yx16T
         nA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736203; x=1792341003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdYE9zpvqOI/pBDY8tVSICunrB86zu9zwPxNrA/jEzM=;
        b=mbzjP16h6d2GwNegoWGBWEHHImUp1JrHFk9LxMDRwi66YxQrIuH4J1VEjuRn0+6wEI
         j+gRjN9YbEFmNZosj31doyWJgrrPl3SVWESXZlSKZZgx1KETyqb58lQv63i2ak2SaurD
         yj21O0/WAa/ECIlwVG21RKQEf/I1MsCTbE2ISN9WaizlYkHzqnZnQAG5lyyiVaShzOJP
         xk6VwLIlod2xFRQi18CzTEPqO+TeiF1tedpYnQiouh5SwSN152uCt1z0KHwUw5uWeXQm
         42IsaWoYAB8Qaaa0Oe9taFGwANj5x557XmEcaxInxKyqwjL+v9kpuCukod8QUFJeNoXf
         AO2w==
X-Forwarded-Encrypted: i=1; AKwUvBy8TCMwHV9cDLgCX7ynWz7Tn3ThXtExVf5XJq118aoIkFu+D2WLXSW9CRWa0QgQ/cpmbkrM9R/fbFrMvrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+gLoAEYd8wZlpxkjwlUt0P6USzk8Woxp5kevKp0wvyOxRtTUv
	Lm6hMf+f/8OWNmcbJXOK3LSURwdtlEgwUbH/T7se1qRseHq6XUbTuy2+qwOWHQYrqA==
X-Gm-Gg: AYBFou30NDHgTsq9MiirtcDheLydQCT4VLxzuTHu4Xk7wFrY19Ykc/n5PfspRR1seRB
	uH8YpGE/UYKEvxyQlUp9eugvdcoIDoewSHfdwy3nUpcjOjqPUGQesicDlAx+LqGmMiX5mUtSeAB
	jK3ovf1FzKSt8CG24VbxZSDnAQyWBeazB7+Ze4RucOxIlVuK94K+x7TydZcPAAOs1758Tyif2cU
	UGQApT2VQwrPVJ4dm31ZybnGB9q0szjdZ66UXtMiUmZ2Df2HGvbJ20QOvbLWup1sG9nvttkDLYx
	XA6w/W/MA2+Gq7TvnNKDcEy/d1klSvKDRvMApBKNWXKcK8NA7lQISGMZAQ5xtVIDgNTrDscup3n
	xReQCCmRwRYRVGYUgH0pjwHrCz8NABpcAwQNQl28affzJ/SQA7kdFCSQSVvl3G1WzZF+WLzZayh
	BykI5bgXD9D/jnkm9OIIBCkfWRJqpwqrchXetDRgNCHvXWrQs7PoxTGmeGPYfFyKiIJ8+lPdtnG
	LFHgRXkzhPGcg6GvwiHoCodJgT5KrZ2LqbAV++6q5UwzPvVrNAzvnjNsFyM6rYmx4+CeK8QkZh7
	wLpJGxTJK5VByk4XG+q882xZexUi0uqdqayEivJLO/UQIwWtOudUUygUAhzgwCFe9VKX2tT/mD5
	60PXQbZFSy5dR/zn8f70Zd3+PSQxS9BQUMsmg26/XVkT5QX3QZQLhD0DzTiSSO8dVl/OX4jUIEa
	ed3oaUMIyHd8A2uKWvSUvm0WJo6LK3G4Qc3QOYVZkzdjxJMJ353HUPWF8Z7jo=
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-48dbaae9e03mr11164653f8f.28.1791736202395;
        Sun, 11 Oct 2026 09:30:02 -0700 (PDT)
Received: from Desktop.vpn.uni-hamburg.de (dhcp-40-52.vpn.uni-hamburg.de. [134.100.40.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acc936sm14657920f8f.44.2026.10.11.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:30:02 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/3] net: make room for the tunnel header in skb_segment_list()
Date: Sun, 11 Oct 2026 18:29:55 +0200
Message-ID: <20261011162957.1328474-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011162957.1328474-1-julius@bairaktaris.de>
References: <20261011162957.1328474-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

skb_segment_list() pushes each frag_list member back to the outer MAC
header and copies the tunnel headers in front of it, but never checks
that the member has the headroom. A fraglist GRO packet forwarded into
an IPIP tunnel and segmented in software hits skb_under_panic() when
the members were received with less headroom than the tunnel headers
need.

Call skb_cow_head() on each member before pushing it.

Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/skbuff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 41beaf625421a..3f358c0fc0483 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4729,6 +4729,10 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 			}
 		}
 
+		if (!err)
+			err = skb_cow_head(nskb, offset + tnl_hlen -
+					   skb_network_offset(nskb));
+
 		if (!tail)
 			skb->next = nskb;
 		else
-- 
2.53.0

