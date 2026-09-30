Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAC342CB0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762561; cv=none; b=L3NJuUe7KG24s7peLBHsPtKeCIY1cEuwD3jcXpVouRgt6lO1OmyRqo6jX0oxKU/2lGQBE5hS7VFHuzHQ+q776cPWvfdWTr0t5xNPO2TulqWVzOZy4EdKLlq4yvgEs+HH0FGusqX993vUa5uCu5lvG1egrOlbNXQNzMtQf4Z5WRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762561; c=relaxed/simple;
	bh=6qRsSUfuBnTMx2Y9L6KCbkAYKGnB+pDv2tFE4p6k81k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZfIKaqquBAiJm1jbQefoFqWYkHhF2VKN79ELpnfAN3MsRIsWa96sEtufJ5TsWDin8hN59COXCvNlYVMHgI0kwt5dgEol4VVeNMNj2BDQ4NO8gRo/WWbDMLplqtdhR/KJmjCWMTAvasO8n7382vsY2X4l/ZJNkh7xnr8qr+IWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HWh+cF4X; arc=none smtp.client-ip=95.215.58.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HWh+cF4X"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6qRsSUfuBnTMx2Y9L6KCbkAYKGnB+pDv2tFE4p6k81k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790762557; v=1; x=1791367357;
 b=HWh+cF4XUnRtzQm0It3amwBWG8qCSbFI7QAeMYEKlfO+p4LRI6Ea5ZQISrIm5wJxFLBmhFZG
 QwUMz/c1caYinhyh9cELzBCVUpo+DJa6uJxaDMVHSmq0UrGkgozLn1szy6faWgfdcGsuLDeC6wV
 hAuJQdkRpF4wLnBqX71XYd4s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 702ad52dc12a4244;
	Wed, 30 Sep 2026 10:02:36 +0000
X-Mizu-Trace-ID: 702ad52dc12a4244
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 2/6] mm/sparse-vmemmap: support device DAX in common vmemmap path
Date: Wed, 30 Sep 2026 18:02:26 +0800
Message-ID: <20260930100226.23688-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-3-songmuchun@bytedance.com>
References: <20260929053231.66085-3-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:27PM +0800, Muchun Song wrote:
>The common vmemmap population path cannot yet handle optimized Device DAX
>mappings on its own. It uses pfn_to_zone() to find the shared tail page,
>but Device DAX populates its vmemmap at runtime before the ZONE_DEVICE span
>is initialized.
>
>Teach the common path to use device_zone() for runtime optimized vmemmap
>population while retaining pfn_to_zone() for early boot. This allows the
>same path to support both early boot mappings and Device DAX.
>
>The backing PFN supplied by the Device DAX-specific population path is no
>longer used, allowing the redundant lookup and population code to be
>removed later.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
