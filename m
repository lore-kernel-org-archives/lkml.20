Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712144;
	b=OFVWhmhD+6TXOUQW9tUYjQqlbKioKcLzZ8I9twoJxCIRUHGDsV/N8wtdECavHhmbUttO
	 SZhlSBD+em76GGKo0UTjlsje3zrITe40aL8WbhwKLpKiEmzopYrEUZThyT8ITZzHae+sj
	 v2ogQHjEu88Uj8FAtPnC4A/MsZ5qBC/0gNKzaZVNPuJAE8KVF3Z2cImHKw6Xs3FHk7ont
	 WV7ExU99ATFo4dVkfDWymd9MfoCHTbayZO4xsLa/2R4aQEFTeeFeevpZi8+lDcjdCFv3E
	 HCfd/Dkhd6EBd3kMI5v1a6p11sSliNOaMTsWfCELb8OGLpcX+5msPpXAV5PPg+gGH2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712144;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3rZsUW/t975keV+PsdM/QVuwN5VmNIdhd9sOD/k3Cj0=;
	b=3D8R4+zvRK0Pl0Ui8N3+ZPAgq0M8WPzzJskYHnhRF9WijGNIyWChDS/rRXTeWL3HNqx0
	 9T8UTTuzZM3vPSe2MRNbQwLptTqQ7Gq3x+syCDuvxGVU2FphX0Q5JzAuIUw8a6tOH3szM
	 q7fn059rdEriD3gy6EWkDrJhb5cSZp3lC7jP7j9/HOe3WTxmZ6QJbYUYkx+Tk4SwDtTNg
	 8vMrLhmIOn2DevlZ+P5mFsKRc2zT2jdEwE4I3aCT/KH8hIzSqFB4pvum/RaSCDPy2T5R0
	 ZVF2cqxrIJWpHKCXjfldxfxKIZJVLWJZyw+Rt+qG1DkXlSgypgGeEDMpR16p2P4Y/Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=XQwVCcDl;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D50606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D50606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=XQwVCcDl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792712137;
	bh=jrV/IxGbHVYF0qqZq6DY+V5oozOvXQzLj5lILV5c1M0=;
	h=From:Date:Subject:To:Cc:From;
	b=XQwVCcDlayyAlX12D34bUwhCL1c4UIM9owFW6qpIPS6aEA5SEkQNQkSCJRTsRklBm
	 PWp0DQ1gA/nqITNhcu3UIjr+Lzoqty64flwOC6PWinFX6mYF7MoRt2bGk+kM7fPVbp
	 MDYiYj4k0cbuOvbuscE4as2KOXJ5chhHjy7Ts8xg=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 1B98C401A2;
	Thu, 22 Oct 2026 16:35:37 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Thu, 22 Oct 2026 16:35:20 -0700
Subject: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
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
Message-Id: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>
X-B4-Tracking: v=1; b=H4sIALed2moC/x3MQQqDMBBG4avIrDugI3HRq0gXIf2jU6IpkxIL4
 t0buvwW751UYIpC9+4kQ9WieW8Ybh2F1e8LWJ/NJL1MQy/CdfMp5cCGF8KHc4XFlA+GGyU4N8U
 xemr12xD1+z/Pj+v6Ae6MR+ppAAAA
X-Change-ID: 20261022-vmalloc-reject-overflow-e532c556f3fa
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792712137; l=1615;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=jrV/IxGbHVYF0qqZq6DY+V5oozOvXQzLj5lILV5c1M0=;
 b=SzBwHj++h+fkwY+1kXehypo54pxgSUEaigbNFY/5izvxXwfy7xCiw3YV+kcCPzHA/7Eb9UNpN
 bJc+xN+7lD/Au/hr0EX0htn+tSU2rNB/LA7E90yob+38UbTliKjJilk
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

vm_map_ram() converts its unsigned int page count to an unsigned long
byte size without checking for overflow.

On 32-bit kernels, a count greater than ULONG_MAX >> PAGE_SHIFT wraps
the byte size.  vm_map_ram() passes that size to both alloc_vmap_area()
and vmap_pages_range(), so it can allocate and map only the wrapped
number of pages while returning success for the original larger request.

For example, with 4 KiB pages, a count of 1048577 produces a
PAGE_SIZE byte size after wrapping, allowing a one-page mapping.

Reject page counts whose byte size cannot be represented.

Fixes: db64fe02258f ("mm: rewrite vmap layer")
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
 mm/vmalloc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e74247d4ce919250c2f02dd5c36483..e98d3aa551fe205ebd9826daad9ad6bd578b91ea 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3083,10 +3083,15 @@ EXPORT_SYMBOL(vm_unmap_ram);
  */
 void *vm_map_ram(struct page **pages, unsigned int count, int node)
 {
-	unsigned long size = (unsigned long)count << PAGE_SHIFT;
+	unsigned long size;
 	unsigned long addr;
 	void *mem;
 
+	if (count > ULONG_MAX >> PAGE_SHIFT)
+		return NULL;
+
+	size = (unsigned long)count << PAGE_SHIFT;
+
 	if (likely(count <= VMAP_MAX_ALLOC)) {
 		mem = vb_alloc(size, GFP_KERNEL);
 		if (IS_ERR(mem))

---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261022-vmalloc-reject-overflow-e532c556f3fa

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

