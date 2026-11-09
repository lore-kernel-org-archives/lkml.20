Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249126;
	b=r8RelPj2HZfjjrnzBPq+eE7qOgvt5Iw7CXQTb3Wr26bmLLAN3J3raCrAS6/gSHqlQCv6
	 HCxUlmO4RJrCkPeCIt7i5S+ckP0FepjaDOny/mTRRcjW8kNCHBwoZ1fptmE5IelgJ8Vme
	 a+Xx4qlfYJHjUMqjteUvKhpQl6vjfBll71511Kgq/q8m2HIFeMuBJ9BF6Y3dIK5gBsOXs
	 ykWhH3rBlSnIUIJky3Cq2tQKn+8uKjVxJKIqfXH067PB632RzuXm3MywE2/4mVTIGUHSK
	 +2vi5VHLTUgZVthcBbXjGTsjxAVLCgD3vzbRHU6Nk6yhTczIBYnAvbnVQwNVIXIjN1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249126;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=A1bx3cQBNrnl/+bVhczOhkj1gBe4lxwMh5p/lPOBHw8=;
	b=y1STiEvWljYQ5XvEdbLcxedrxKtgaxBYNdVMt5xbXjWc11NwjvwPLUcYjG7KCxsD63FU
	 kubKGz3v7OamCF0LbBHyUWLZA/FD08rCSJr9qmS+FHg2rtKTJl5l4sthh/j/qxIIYt7Ud
	 ob8/jRN8+cF8GRvyIMrbeGXhNa+z3k60/8XMcc5uYrMFxkCJ1ysoNPKn7S+//8z15JHgg
	 cMFgKth2Ur62bP09kwgLxcgShb/zP73EvVJCHP3k/hSCEC/AjtQa3E3h85HcgI9Cs43oV
	 fxmXJV8Q/WkUIOUAnTDURCpePd6w31c71+gJoXYY664v+yRxGDJlg0EhMJJ5hrkRBog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJkEU9Rz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0A606AFDE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJkEU9Rz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CF11F0089F;
	Mon,  9 Nov 2026 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794249125;
	bh=A1bx3cQBNrnl/+bVhczOhkj1gBe4lxwMh5p/lPOBHw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DJkEU9RzMtvmKZEhK4grAJp69GoJfavwGia2y6elsvv3/QPwjrXNjprT+YRhg8e0Z
	 WIvRQ5xlH2bDM01VN69+0ONW/Ielh37ZoYyzhlrXcvm/XbBPTyvhj2eLbQ5Vx2t+NO
	 4f/eMQYdSQP8Opmu22YX+SD8pGdb+mBm7+UpniW+T/ReDZiFoN52WuJuBTiLfzrLjF
	 l+yXgKSB12SWZrHdKPWG7zEBztfWvYeviTlMekgkuDCLwHCeXMTty4oGixEZOTGReg
	 bZT+5iJ/EvrUTplu/UnmcWxl0DkQ6LDGZgLT5GDz2cR8MAwK3/nXLJ+ESfUaPg8rGj
	 XgO9PSnKSLf9g==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 09 Nov 2026 19:31:53 +0100
Subject: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
 update
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
Message-Id: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310; i=david@kernel.org;
 h=from:subject:message-id; bh=C4p8LDMbx+ZkjajJ+iKnXRHO7ncfgEapbAI+tnp46XM=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLI+Cc7uWpa3WqFBat19o2T2C0prXJpXPrbllXrKFZDxR
 H9O0i3djlIWBjEOBlkxRZag4PsGL1+uq61242OGmcPKBDKEgYtTACaSo83wP3uBXMe9Xd5ht632
 xJksnWS89tbt3s+7OtYqeG3a1VX3O5mRYdGkizLl536nPVxbMtkh03v1mtd2HfxRl1nPJv389Wr
 SK0YA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

MGLRU is currently the only MM component without a dedicated component
maintainer. Fortunately, Kairui and Barry have been actively
contributing to MGLRU and have volunteered to take on more responsibility
by officially taking care of it.

Given that Kairui is already an established MM component maintainer in
a related MM component (SWAP), add him as an MGLRU maintainer right away.

For Barry, the idea is to transition him towards a component maintainer
role over the coming months, starting by moving him to the top of the
reviewer list.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..e7ac319a570c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17635,10 +17635,10 @@ K:	(?i:vmemmap)
 
 MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
 M:	Andrew Morton <akpm@linux-foundation.org>
-R:	Kairui Song <kasong@tencent.com>
+M:	Kairui Song <kasong@tencent.com>
+R:	Barry Song <baohua@kernel.org>
 R:	Qi Zheng <qi.zheng@linux.dev>
 R:	Shakeel Butt <shakeel.butt@linux.dev>
-R:	Barry Song <baohua@kernel.org>
 R:	Axel Rasmussen <axelrasmussen@google.com>
 R:	Yuanchu Xie <yuanchu@google.com>
 R:	Wei Xu <weixugc@google.com>

-- 
2.43.0

