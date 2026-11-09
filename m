Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249132;
	b=T2M4XgwVjG+xLTcQXY1RUGk2nK2Ubr7x2vhcIcGjHmhLIotNoYH+Lis+uGPk1MMHtgRX
	 yDebsGbiDoo3mjOSCfQrn1g5KStxOIXhWZqTxoWntaYYQDMhJjzzQf3wFtZ66K43Nv3jH
	 HjJPZlz9spEbfSxBtw0UFLtevsY/rrd3RzSH53HlOyDHg1FzYg4Su3I2ZlpFPpBQobQx/
	 C261K7jJZohH8PzNbn4FTCuWYzSmggQdV4WXUoCZ9ZU/13eK9SfH90ZTmf4I0Xpj0nuKe
	 GB747xJRfA8C+CIPXwYqpjXs+cxy4KID3vxAXQtEfP8YR6zS3YnuaxXwU6e7m2qjpCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249132;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=h/Bd473+Uax1ERBjRspXIJTjnfLx1UaFniL2HymVmOY=;
	b=hhNCfnSGBPwRtpMoub+GhWJSpV/PgtRDJ9zZZ4XbOdwaxDpcQNqU4e3loMNuL6X0exLd
	 DfrUDOyg3Ljpv0vBoRQixatqmOccdQt8wyzcHEQTzXm+HeyIkj/5Gqe2oQ7VKCyNr5fI9
	 uILApvISYOMHszBzW60OfB02b8SmWPL9x7keBX6taXpILCMJrTCtiVwliZ9h3f3CJX98w
	 0+B95Dy8KwZUdFYk1xQqobqtnN21ZLXC3zUuiuuRcSM0o8v/hc8feiLTW168LB8tEeZEc
	 yNH/LJqqLy+KsTQGgV0s1XJ8Ffyhn0J6CeDK2mWu+v1uoSbSYOH4tfiun8WmChGBaQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfsy3Ze4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147D606B58A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfsy3Ze4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039A81F008A1;
	Mon,  9 Nov 2026 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794249131;
	bh=h/Bd473+Uax1ERBjRspXIJTjnfLx1UaFniL2HymVmOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lfsy3Ze4pC4fQ8Wju5XXWmBxzswRHlIyyZTxmTosI0btdYkO5uwTmDxGrDBiKgkNc
	 m0HM+iuLsIzOA7K06pAX/SSKIPGqUPhWmZEStxE8e3fnArtQNJAz3zmx2tDHbt5Pv4
	 5JaBlOhpsEXkkhk1nljU703ZLIsgbEiXPhKspk6NRySRH0CVzd1MO1PGGgSqcajd6h
	 Mm/o1hsP9RwCNSu0P9adK4qBtsoTHct1oxVfxrxBuHwhmixPZXXZeExhdkpoZpNiyB
	 inxb5/TzV25jAKbp1ug13oQkov+FcZWVSIubeDtyzYnbvvf8/Y4XB7+Zd75la76Zy1
	 sugxpdzZjYqKA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 09 Nov 2026 19:31:54 +0100
Subject: [PATCH 2/2] MAINTAINERS: remove myself from MEMORY MANAGEMENT -
 RECLAIM
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
In-Reply-To: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=david@kernel.org;
 h=from:subject:message-id; bh=oEU8IfcwSlE8hn8tOxT+a/rYJs7VL5OhvNpKJq1C9ZE=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLI+Cc725Lr5Xz84ZM6iFU9VFxU0m6gtYp2cE3KVZdvR+
 r8BG2oOdZSyMIhxMMiKKbIEBd83ePlyXW21Gx8zzBxWJpAhDFycAjCR2MMM/wuDDi4sfzBzURjn
 co/qvnC3uwLHNCS1T3/x9b56SDL09jKGfypeTQ0XOouXizF/ET/seiZjt1RHbuVCIc7j+hW5C2d
 1sAAA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

I don't really get to look at most reclaim related stuff. For things
that are actually relevant for me, I'm sure people will CC me.

So remove myself from the MEMORY MANAGEMENT - RECLAIM section for now
to have a bit less noise in my inbox.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7ac319a570c..7dc8548236b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17808,7 +17808,6 @@ F:	tools/mm/page_owner_sort.c
 MEMORY MANAGEMENT - RECLAIM
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Johannes Weiner <hannes@cmpxchg.org>
-R:	David Hildenbrand <david@kernel.org>
 R:	Michal Hocko <mhocko@kernel.org>
 R:	Qi Zheng <qi.zheng@linux.dev>
 R:	Shakeel Butt <shakeel.butt@linux.dev>

-- 
2.43.0

