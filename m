Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605783;
	b=l6pNvQ/UjOss25u632nr/CR1dpJ5IOis53V7ia9I7kkgHuLuQ4dk8RM1vS8yMb+QyMU2
	 LA88Ux9l/T3/OimH2u/1MN0OYN93TUD48GDzuMohpWzRL2K43qc8gNm2gV6lGUuVPfHxK
	 VIIIX3cCRgXfiAnPHLv0aXiRrkB+4fw8kJEefdIuljG7H78UFL8OcRPbfUsjMScFwLn6/
	 8PJjIxpVGeX7Z7Q6Kl+/QB4Hwo4IAhz0mLrbiGJFRjZf7xjLYgkudz6JoakvDlHuplbQH
	 +4lkRr1lRA/QmTL8+0rj5f0VxiNcUekCq8ZwQoWdxLtGdMszbK4hklPM+pbgi04BWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605783;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qoTt+MDRkeoVNwu26WSyXJZ+2Whw1KHsinqhf7xKN0w=;
	b=N5vfgfqOwiSJgn4YrByCSvvmblyWLe8X05TmYqZVG3Mx8uMI0ngoESG82SsNU9GAOvaQ
	 EpEXWSVwmdEJUFijsYlfiv8UVtVLfliQ1cG5IxXMyPuRnGOVn1NcvKzpijpAGyjpsvzxp
	 9obKNKvjzEHrbCaKUGIaViXPSLjoRe355ghj0RzcD57NF4U6TQIFcHDJGL0ly2nzZBOdf
	 OsbfSqq6zfcHvYDNJ1EHv2lw7AxE80lSpbTKPpqpGQ71xcbKHecD1Gcyv1Lqi0Sd1zRnx
	 THotzj4ch7FsnT7ILmVtYTgLFMmdQx3qY1+dDHIULXCg7+3EuCtcAuk60MvJqNerRSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lEbwHmkR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6A8606A889;
	Fri, 13 Nov 2026 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lEbwHmkR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF551F000CB;
	Fri, 13 Nov 2026 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794605782;
	bh=qoTt+MDRkeoVNwu26WSyXJZ+2Whw1KHsinqhf7xKN0w=;
	h=From:Subject:Date:To:Cc;
	b=lEbwHmkR7JeWSvaOgQa55K2iwpCMKNMvqhMle+H/PulltxLT70zxLeQJl7VoTOnaU
	 Zk2ydRTQh9FE6Bwev5F08wAb1FjrbryE3cnR4qIqzOMxgDULOgqLCI2R1lwibdgs9a
	 Wxpge7J77BbReVu4Mj8rixE2121QLGWe5iRD4NWVTeDow/YV0H2xKCnvQvV//6xj5Z
	 8eb07+dpLj1trGumYqUmMnJidRa/okjm/55n0WVz+/9iV0o+SrllijWL1ZwchgJCl7
	 u3R84o2Eu7TeOfi6t8jF78BRFe4hG6RzbujpsBifWVx8u5v9aNo+KF7pZFwzUiypv1
	 5kwH0u/SRWzJA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH 0/2] mm/mempolicy: shared policy limits for
 tmpfs/shmem/guest_memfd
Date: Fri, 13 Nov 2026 22:36:11 +0100
Message-Id: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAMuC92oC/yXM0QpAMBSA4VfRubbaEPIqktgOjgxtiJZ3N1x+F
 //vwKIhtFAEDgweZGmZPUQYgByauUdGyhsiHqVCiJhp1OsykbzqiTRtLO14EucZVzxpwVerwY7
 O71hWv+3ejii3dwP3/QAK0AcEcwAAAA==
X-Change-ID: 20261113-mempolicy_limit-6f043870d04b
To: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=david@kernel.org;
 h=from:subject:message-id; bh=swg4p31TendTFxqtz+LrPRXfqomDbwEqx/NII4CvOWU=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLK+N53bqxhq8HeBCSfrhp89N01PaXx71f038bNWQ9Ecd
 svXq5xiOkpZGMQ4GGTFFFmCgu8bvHy5rrbajY8ZZg4rE8gQBi5OAZjIqgBGhqsiTx95aLYfy83/
 GvtYJ2iOzZSi/FM8V5Wf1Ka38Ce6PmX4K/Y38sa3108OF/w6ILcuKHn1zclTu556bv8pulA75Mi
 F4wwA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

For some reason we thought it would be a good idea to let users create
as many shared policy ranges for shmem/tmpfs as they want. And
guest_memfd inherited that handling.

Fortunately, at least for guest_memfd we know that we shouldn't really
have more than one shared policy right now in practice.

While we now at least charge these allocations to the memcg, users can
still allocate possibly many, and cause trouble, for example, by having
long list walks under spinlocks.

Instead of trying to improve things, let's just stop the user from doing
stupid things.

Essentially: limit the number of shared policy ranges per inode to 1024
as default. Let the admin increase that limit. 1024 is likely still
plenty: who maps a shmem/tmpfs/guest_memfd file and configures that many
mempolicies on it through separate VMAs?

Maybe we should set the limit even lower ... but 1024 feels at least like a
start where no user case should be impacted.

Patch #2 can be considered a fix, but I am not tagging it like that.
It's been that way forever ... should we? The impact is primarily just
wasting kernel memory and doing a lot of expensive operation under
locks.

Patch #1 prepares for that by merging adjacent policies if they are equal,
to reduce the number of policies further if some user space actually does
something questionable on sub-ranges.

This is not super urgent but something that should be addressed.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
David Hildenbrand (Arm) (2):
      mm/mempolicy: merge adjacent shared policy ranges
      mm/mempolicy: limit shared policy ranges per inode

 Documentation/admin-guide/sysctl/vm.rst | 18 ++++++++
 include/linux/mempolicy.h               |  1 +
 mm/mempolicy.c                          | 74 +++++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+)

---

base-commit: c6e0cad6c9b4180bb229db06e5b062c5ce0723bd

change-id: 20261113-mempolicy_limit-6f043870d04b

--

Cheers,

David

