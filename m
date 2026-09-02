Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCDE78F3A;
	Wed,  2 Sep 2026 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336621; cv=none; b=hKy4X04+kkyo9eP0onfbJKERmVog4tdDZGBsJKVq4nTfWRhVwfSNnhkKIzHWGPTHuRSwqFyx7zCy7BdbY9cKZ0mo4DMNrr/CxRkTNtU1N0cdhTBesvUlAY28BkT0f/SZluc+NKXu0WoORiqoc0JVYLgV26ngpNnOf18T+1IxIiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336621; c=relaxed/simple;
	bh=DXWq8zxGd1oUXBpDYZRfBgWyt8SHN5Iotedx30lle0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bNSQO/o4raVaT9TzCo1KzumUGTA7uFJrPnRzG/1POOACHdCDw5E490iNz0Pi9nrF+bhSleGWXBQWqzQYDSOyMP1jxggKTrtZvRtTwQJ90/T1QOGFyo3f6umRMh/4EQTBbSsIa0Kx08CGWeRJ3tZfjtWRAljh5Lff68qV/572ItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnjdeSs/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnjdeSs/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9961F000E9;
	Wed,  2 Sep 2026 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336620;
	bh=KVRjFVx2THf+2ab6VEX/XQsEUUMQI8nKJ9zQDxApLGE=;
	h=From:Subject:Date:To:Cc;
	b=hnjdeSs/p4PWgxfb+1oVsPk4hv29rMGmEMQa1vgOsY7FgAN1zhG7T3q9tZvhSc7yY
	 kSfJHQFL7NDeYDjK1mADjQQF9wO85gLX3iKV4AalgnH7qx830JWnU/4p9ofbD9PjQq
	 n2NAbtjBlNzAo+Td4zTW/raE0/oK3t/YWkyjqitIz7sPHdXXoZOVLyRHPJM7KhVekt
	 DjQ8+RoTMJ0xStk+bA3SAKsUw1634VGU1rLWGNFwIuCkZ+nO4PbtlANHkvvcd/JFBm
	 96ujyMjiLUVPsY+oSq9y/hGY9KRpgVt7iQK51Zf8xeIJ1w2yBkYHPQXdf4Vt3nGLMB
	 OVjFGjhaDMI0g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH v2 0/2] docs/core-api: memory-allocation: add
 k[mz]alloc_obj() and clarify kmalloc
Date: Wed, 02 Sep 2026 11:10:10 +0300
Message-Id: <20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Oyw6CMBBFf8V0bZXWysOV/2FY9DHCKLRmCkRD+
 Hcp7l2ee2dO7swiEEJkl93MCCaMGPwKcr9jttW+AY5uZSYzmWflSXAXbOQ99LrrguXNiA64s8q
 ZSjmnq5ytny+CO743663+cRzNA+yQVOnC6AjckPa2TVEgbNAfex0HoNS3GIdAn23WJJLn/4JJ8
 IyfVVGI0spCWXF9AnnoDoEaVi/L8gW04Dyu6QAAAA==
X-Change-ID: 20260831-docs-memalloc-guide-dc4db94dda96
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 SJ Park <sj@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Update hte memory-allocation guide to describe k[mz]alloc_obj() and
clarify description of kmalloc() size limitations.

And when I realized that get_maintainers.pl does not list any of mm
people for that patch I added the MAINTAINERS update as well :)

---
v2 changes:
* update kmalloc limit phrasing as Vlastimil suggested
* make sure changelog matches the changes for MAINTAINERS update
* fix grammar and spelling
* add tags, thanks everyone!

v1: https://patch.msgid.link/20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org

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

