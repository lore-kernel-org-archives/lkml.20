Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249121;
	b=AfLRI4z0jF4LuCnFc9qzSRUOrBrvFsG9a9cRW6VTf5lHDA7Wl9YRFAiXJtUlzZIMaAkh
	 bMgRo2rvAajfGu4XAGF8xew3u5fOKaIaNAZsjJoh2DzG0F93ZY+hBk0tj0vK2IEjMv60X
	 mr0zrm8AujrYOLxwYj04MUC4+g4E2nzCYVaS6MF31saRTJdKBgPt0PezN+hke20nvwMc6
	 1oYIHxMihpEdVrRdna9vC4kfYCZuELDjM2b7589RpXc9UnEKu5r1jczoTVkx+XCynpQlh
	 C/n3RO7R8bdjdXuHJCF8qsyUZkkhYMWkxiado0w/9b4DwbSG2QKYrNra5PdIPOcUY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249121;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NKgS5iWK781d2x9G+ZsCNT2Jy4yL/3koV2y9hvD9NWg=;
	b=rAdOSPw8+CI2QXeJLKebJs22IL4ipDZ1DTeBoT7/uCKahqdGrXQ5iGahEFHPW+gbkupO
	 wgLEV7tg/Dorjd8pTAqp+uh1/QgQGPzc6xDgJCXnfkYNmsEu0F3l5oFeGU0GWfM7SZ08C
	 DQQozZwKhiKuKtCIoHuQcA06PxzEW53H731xgf/AimC+gRHneW/FHzQzc4kZXCNQtrgQN
	 nULYdbC29Lyd97jNZZ1oo6fekAF/c/nQOeWq4aeYhXG1EGqDk7ocGdyqEjU2HKY0HmjGT
	 33sxCU99NyK88iS7DPokZYWA/NvOtvslVkX2kJbGg6g9DOSqLR2GJMujxwZD1DWRarQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+iQ6baS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3545606AFCB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+iQ6baS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E3E1F00AD6;
	Mon,  9 Nov 2026 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794249120;
	bh=NKgS5iWK781d2x9G+ZsCNT2Jy4yL/3koV2y9hvD9NWg=;
	h=From:Subject:Date:To:Cc;
	b=m+iQ6baS4CBAxViP/BrHNtR2dFhzNE0HIbhvI7/gSUly9zOHwt9iVwEJs6O4h7nvx
	 C2GerR6x//d30wyd648/gYw9HP/TPpYoCmB/T2GOsiwffGHlqft7Yx4BL5znBokLA5
	 ntyYnKbeR+8lOqgGc2IBBCRzdioQyNRybSfZuJjgyleQajFc7P39sir5v77GQB4SrY
	 lkWtlj6KkfsSCSrO0dN6ThSx4Dff4QiHI0wPiRtySlzKyFLIqyLOhBPM0ewQlORKd3
	 oa8hTWbAEY1uPxmNBBk/19G9lY6DFclaLMJWAFaCHsu7Bh75DGmz6+qqgIO3TlwH77
	 mDbhmmy8/j+MA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH 0/2] MAINTAINERS: MM updates (2)
Date: Mon, 09 Nov 2026 19:31:52 +0100
Message-Id: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAJgR8moC/yXMQQqDMBCF4avIrA1MsojiVUQk6lRHNC0zKoJ4d
 9N28Rbf4v0XKAmTQpVdIHSw8jsm2DyDfgpxJMNDMjh03loszBo4bmkk2q7jIruxhMGVgy/RI6T
 fR+jF569ZN3/r3s3Ub98Q3PcDQD7LHXUAAAA=
X-Change-ID: 20261107-maintainers_mglru-1e0a28d68060
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=536; i=david@kernel.org;
 h=from:subject:message-id; bh=TA1+wI8uMEcNe/abtsKifPKm/0Cjd9+34i3ZWYsn7tY=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLI+Cc7aLHf4btC1Gxe3PXYISWMvaJ7D0dJe3OYhqHbix
 J8lmrusOkpZGMQ4GGTFFFmCgu8bvHy5rrbajY8ZZg4rE8gQBi5OAZiI0ANGhmePc5cLfrr9QCre
 d4G1Q5aDVmaOS0/PtJoyjXJ18ZzpVQw/Gef2FRRO2+tpU7Vo9bTbj+0177CxSXnrPhE+YnVa7Ck
 fHwA=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Hi,

some more MAINTAINERS updates with a focus on MGLRU and reclaim this
time.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
David Hildenbrand (Arm) (2):
      MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU) update
      MAINTAINERS: remove myself from MEMORY MANAGEMENT - RECLAIM

 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

---

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

change-id: 20261107-maintainers_mglru-1e0a28d68060

--

Cheers,

David

