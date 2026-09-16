Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722B137F304;
	Wed, 16 Sep 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564926; cv=none; b=r4+UnPgExlSf/wliNec0blwTB04xoanA/eeWC2g9s5P5NcyzXeMyd1ZKh1MAemq+tg2LtflX7rZ2E6xqtL9V9Z2KQqaolQEfrU9oYnHlmGsUGw40RgeGrqk8NXxgEZsWyv5kUl2StciDBVFQHaPa/7BC34ewaY16/DpMRN/cLHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564926; c=relaxed/simple;
	bh=w5vSeBn2UKDwavhh0XOtt/681k0oS++9Dv9PClYyuh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W5lvmwfS88v6/nn0lhw7xYcmemiBJy4nhUQV3kyCSahYIUqq2bfEuPeYixq994acC8LMm7jx+bYap/IOcd5Z2ZJMwDH8/9buVWy5jACIy3k+T+8tLHDc2XhiuH2YEdqqebtK4U3Fu3mXHb7bS5OtU02pSxGtt5ONsnQd3br9Y3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfoVsNzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfoVsNzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366A81F000FF;
	Wed, 16 Sep 2026 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564923;
	bh=YFiTkxY4NnahRWADkTjvK32t/QFawfHXHLOvPkMD0aQ=;
	h=From:Date:Subject:To:Cc;
	b=LfoVsNzttzZqw9jnVkyiKm1jz+gqn9MVzP6upZW+Cvpfvd4RJMlUv/W2EVBdpN0m2
	 P3IcsjsLZkLuPbbV1Po9K1gKylmprm58C01Y6VUd4HfGIvZUQ1aIMc6/QMX45+Yiug
	 67hZhEMDg5EDO5cSZQN1Sjh9DvQ2vEer22SvLAYt4+ougxk1Gf8cxREmBiwnm+1+oo
	 s1wyueL5y+UtLChAJcCAuTmJxca04manCul/6PI8joa9F8k7or12RIyQHchxNQxdwd
	 sigzQkzEyKLH9Vz2yV+suHMRGb6MY12IVj+DdC4BHEUGYZLBexHNDh3uL1/69jMw/T
	 fdiz1E6L9WFkg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 16 Sep 2026 16:21:58 +0300
Subject: [PATCH] MAINTAINERS: DMA BUFFER SHARING FRAMEWORK: tighten F:
 matches
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-maint-dma-buf-v1-1-0f8d6c5bf1cd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBBFryKz7tBEQbBXKV1MkolOIbFMtBTEu
 zdpl+/z3zugsAoXuHUHKL+lyJor2EsHfqE8M0qoDL3pRzPZERNJ3jAkQrdHHAZrycXgJ8NQnZd
 ylM+vd3/8uezuyX5rkfZwVBidUvZLm1aVWfI1UdlY4Ty/DQzjNJEAAAA=
X-Change-ID: 20260916-maint-dma-buf-3311abfdc90e
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=83=C2=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
X-Mailer: b4 0.17-dev

F:	include/linux/*fence.h

in "DMA BUFFER SHARING FRAMEWORK" entry matches include/linux/kfence.h
although that header has nothing to do with dma-buf.

Replace it with explicit 'include/linux/dma-fence.h'.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c2..656bc5ed8d2ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7688,7 +7688,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/driver-api/dma-buf.rst
 F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
 F:	drivers/dma-buf/
-F:	include/linux/*fence.h
+F:	include/linux/dma-fence.h
 F:	include/linux/dma-buf.h
 F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260916-maint-dma-buf-3311abfdc90e

--
Sincerely yours,
Mike.

