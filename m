Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4433540B10D;
	Mon, 31 Aug 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189190; cv=none; b=tdDCk+zVbBHZgXG/nVeEJzH6Vf60zmldeb5Y59NKO0q0lMpIWL01V1fvObzLJTYEsBTheg1hiVJXYXPrhqAiWbxY8NwxibdaSiGXhYK7lI6ww4xsQM652JN0EefbLd2Q6Cy5NM3SzVifYtKm3wZuPiFA7T/AlYeAhPSidoeZclE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189190; c=relaxed/simple;
	bh=NkYUOkiNa9E3uqZuEG+cJ1SbRJMoleg3QzGdXA9yz5s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NW5p+s9cHawkaT61h1LEq6vqJmMv24MDiHg+9WisSt1TSsdZikc84w3WOUYHUIw/Q+isnFEvcq5bcFhE3OEEaevayJM7J/qS5G73HKvexlJ0dgcdxDhC/zhf5jZQVm1Tf+ipOSoWcDAm43JiIFKXKpyRg6vc3J29ms0IRUOijGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfs1qMws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfs1qMws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B2E1F000E9;
	Mon, 31 Aug 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189188;
	bh=T23vz1XT5Dhk0iK4FxPkhvidc2Wl0CtXoyVQvUdnPKA=;
	h=From:Subject:Date:To:Cc;
	b=kfs1qMwsLbtxXIAi1KGhQoNZG33C6c9TWByVTS07fOYis4z7BIKWGXDDDHEh+cUAX
	 YL3aZ0unG5LmqOpsnYberOk42sT3d/YZaz1DgwVs+MHXC1K+LgxIsyUyX+CRfWUk6M
	 XnVnImvs7Ir9K0/y4KJ4FWxrTFQ3zjYAJCRByE52hVdMX9nV2+DR6BvOrzLS4WK6af
	 CCkLx525kbk3WsL2ZyI2n/3YldiU46+eyyxXZxKxGCIGuM3NHj7CA8VMy/1mZ4wAW/
	 QpaVkAzZsVdMnjhhxn+LVgFhOx5xWwh88AbBLkPceaiuBZnzwyRwYnUs8r+5OcnERo
	 LGGAzqzBztAXQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/2] docs/core-api: memory-allocation: add k[mz]alloc_obj()
 and clarify kmalloc
Date: Mon, 31 Aug 2026 18:13:00 +0300
Message-Id: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBBFr0JmbSMgIeJVDIu2M5YxtDUzYEwId
 7fo8v389zZQEiaFW7WB0JuVcyrQnCrwk02BDGNhaOu2r6+XxmD2aiJFO8/Zm7AykkHfoRs6RDv
 0UMyX0IM/v+p9/LOu7kl+OVLHw1kl48QmPx1TFg6cztHqQgL7/gV7A87mlwAAAA==
X-Change-ID: 20260831-docs-memalloc-guide-dc4db94dda96
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Update hte memory-allocation guide to describe k[mz]alloc_obj() and
clarify description of kmalloc() size limitations.

And when I realized that get_maintainers.pl does not list any of mm
people for that patch I added the MAINTAINERS update as well :)

---
Mike Rapoport (Microsoft) (2):
      docs/core-api: memory-allocation: add k[mz]alloc_obj() and clarify kmalloc
      MAINTAINERS: add memory related docs in core-mm/ to MM - MISC section

 Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-------
 MAINTAINERS                                  |  2 ++
 2 files changed, 25 insertions(+), 7 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-docs-memalloc-guide-dc4db94dda96

--
Sincerely yours,
Mike.

