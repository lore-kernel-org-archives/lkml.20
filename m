Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521374;
	b=zqbJ91yLKCLYfvgiEDCYqu33sDtr/yGCdT11OzjHiqeaS7Oe5vgYUwO/eR5iNebO1Gbh
	 jKYjo7TvssNMUV8HPTS8A70sZJCX5WMbN4BFkDv3CfeE/mVDjBUAX1Ie9btQUOkjOKT/h
	 vpFpVBTzKFXos2HBqpPiXec3qM9rdUZWgbkfVUVfHTnPX/CEiitwHigz7Gi/5fH9I6WyC
	 G4K7GHraVqgN9PP255uxeUyQBb8CYOgYxKnD32pqF/oI/yA6D+SoI4UvjX8amYVUs3mi8
	 rhIJMQqrGR2mCPbR2IG/X9Txvv9OO4bRMyIBJxCbzOWr4BF4710hCBbWg0qcME5JK+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521374;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Viwqy3ITQgBszpOy2nxIavh5Mt0ao4kMQc4DSQeToGo=;
	b=NjxGPniSEy4LE78kAOkIpbkS9m60slIvZmqpasSQCWs0y0gepLaPCEKVB9Y5Jbx+OY/f
	 yMBr8YTdhOoHkJFiQal7w0P4DPFA5ZyKYKOvT25/Xh4YwOeMKby+p8hUYg5La07YoT5n1
	 nsfWv998YliPchbm35Y6GiVRlDmImznrcm4EvvAJoParpAwSsT+rIJvnNjWynODjzWOkV
	 i3sX5dL5oElcORAaixcdwOgxO/D9LHYJPGMt8YLUGlqjSHzCCLNTR/BOfpIiBZ/VHYtXE
	 WgdwdOTSULdMNNQ0KZqw0DHOcGwdxzVbgPw9vVh2T5wq+eehK0lG1NXCNkctARn2jQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HM4HKwBw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909CC606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HM4HKwBw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555C61F000D4;
	Thu, 12 Nov 2026 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794521374;
	bh=Viwqy3ITQgBszpOy2nxIavh5Mt0ao4kMQc4DSQeToGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HM4HKwBwenX5LPu3liCUHEMsEalytKn7ys2DDGNSBAMroq/1dFf/rVUIYBjFEHEpI
	 hE/fY4rJBXGrrTOlj+FZDCzgZ/BtsewXoNR8UtSzaKL3UkvJ1GnU2uIWtxs8CtmBBW
	 0qUUCKuerr+2hwfE4QZ3r9yCnSLDgkteS96rugzAyzmanEYhnXcnUEsXjy0yK3Id9c
	 1d7fVZqky1H5uWLL9Z3pHvNpyENJfo+QwEDcpD3mU4gm8mDkSdZS36INIPyHwx5f4d
	 gwGCNlnn5K6jpoD06i27gE2QSn1Iab7gBi1sgmvAemRpMKmkZuQiuX4NtlNV7WUC/I
	 p0yh9C0dDrLeg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Thu, 12 Nov 2026 23:08:59 +0100
Subject: [PATCH 3/5] drm/i915/selftests: request read access for mmap
 access tests
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
Message-Id: <20261112-access_shite-v1-3-988a5c470db2@kernel.org>
References: <20261112-access_shite-v1-0-988a5c470db2@kernel.org>
In-Reply-To: <20261112-access_shite-v1-0-988a5c470db2@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Willy Tarreau <w@1wt.eu>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Rik van Riel <riel@redhat.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linuxppc-dev@lists.ozlabs.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199; i=david@kernel.org;
 h=from:subject:message-id; bh=UNHRKTPPJVrGYq3JL2OOfSiN8BE6XDeP4WdpR0zw48w=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLK+WfzXfSMdyle0+taS0KYbrY+ZzNvWegtJcp07d9F1o
 8y9imPFHaUsDGIcDLJiiixBwfcNXr5cV1vtxscMM4eVCWQIAxenAExkkzEjw1dWKyPrzb+96jf5
 r53V6B4zxaXk36Gv5ozRBdwzOZ5LsDMyfDYz6l6worxt7dyFeduun10lZLpV2HND/cMu4aMaMY/
 7uAE=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

__igt_mmap_access() reads the buffer with access_process_vm() without
FOLL_FORCE, but creates the mapping with only PROT_WRITE. Request
PROT_READ as well so the test remains valid when we fix the ->access
fallback to properly check VMA access permissions.

Fixes: 9f909e215fea ("drm/i915: Implement vm_ops->access for gdb access into mmaps")
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 303be698891fd..d9c828032a1aa 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1460,7 +1460,8 @@ static int __igt_mmap_access(struct drm_i915_private *i915,
 	if (err)
 		return err;
 
-	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
+	addr = igt_mmap_offset(i915, offset, obj->base.size,
+			       PROT_READ | PROT_WRITE, MAP_SHARED);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 	ptr = (unsigned long __user *)addr;

-- 
2.43.0

