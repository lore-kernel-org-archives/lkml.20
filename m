Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294873;
	b=36HKM7N1CaaKFQ28/ZGJSXkuCz/5sfwcbDfSuo3nAMVile2c49y9rmq5pSUOMKbb8aHg
	 gnkjIoOEAoA2XwoAzOD+c0jl0JKhEtf/SS2eXLjDSTHU4oeOFyUdgvFlwpK3bzQKDE7mf
	 NKws5FuLNIP/cJt/hHJb+fHRHv9EAWd/WIGC0d7CdX9IQukCvTHVawNjORjgUMcfPDa28
	 nnsQVssNR6ipLtubQQAQM7AdhmP7e6EQ4Y2Bu3df3uOyo6sBgDuzuvZIiM84hpag0D/6x
	 Kuwh41SA/wZ2cuFagnZHKUyijGYtzMDD2fnjV4AZacU6fsh/jmivYkI2U+hGGHejbRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294873;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=JeBczRWUIYEnZGuPHhbnKleDwqSoORE3VajfVV+2ChI=;
	b=Prfn3uViOcP+D9c+gjhh4RVx5vuOhzp9vwTzqbISXctAgnLJpS5ChWmF8sWc8Csk0/Hy
	 bpGSNPohjAZpnDDp10LrnZrefMMvAZezSNInGAcXYmJpUbzsP+/sXuW/lOelBHDViIXFh
	 5VTkOL+81mvNT3WHsLPLcb0zgt5zeF6grwssyUqkieL1etyyvgrmR+hgco4NnQH+dNXu9
	 +zPkCpdqck/q1hSSQgrvg44t0+KvQ3bPfnDPA0exB85b1EiGK3+xNXscbeLBrdjIWPxl0
	 HXPhduPod9BcIGtYis0lcvpaoxd1zb+jvnza2RU7Rp9oVNlU67XeIVSTey6aOgmDmbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKPLbiiv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A750E606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKPLbiiv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DFA1F0089F;
	Tue, 10 Nov 2026 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294872;
	bh=JeBczRWUIYEnZGuPHhbnKleDwqSoORE3VajfVV+2ChI=;
	h=From:Date:Subject:To:Cc;
	b=fKPLbiivanrEzD0lDTSnLnW+s/csuy7zmF/rQB69ecBnZGkkMcGW82NV5pFLA16bh
	 84z8u8ZKsezk0gYvkBpaWKmkB/ti1yMKn+uXWxAze4muXfT6Q9+ylkElk9VeSLKbd3
	 3URD86VRiixps3P+Z8PM+90U+NYNcy2eMdKeOMdHhJ++2/mcCNMufVBbVJJMfzG/p2
	 mc28TlVdjw+vnhpCmNyhtsqkpeGz5K5ogqQGT0HmG2L8a3nUHWOjuOA6DL49rUoXRX
	 vkQgdAghDuSKqy1+cSnm7w8cRkNFX/e5T8W6ZAVKr5foh+Vkwbr1ayP8ewc73Vd0Fp
	 DzSaXhkrVZFZg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 10 Nov 2026 09:14:27 +0200
Subject: [PATCH v2] xen/events: replace page allocator calls with
 k[mz]alloc()
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
Message-Id: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOzQ6CMBCEX4X0bJU2pYon38NwaMsW1p/WbJFgC
 O8uxXj8ZmZndmYJCCGxczEzghETxrCC3BXM9SZ0wLFdmclS6lJLxa3iEwRuhGu1rB3UXrE1/CL
 wOG1F1+bH6W1v4IZ8nRPWJOCWTHB9liJhh+HwNGkAyn6PaYj02T4ZRe7ZRoUoT//RUXDBj7qsK
 y8rZ7263IECPPaROtYsy/IFeJUJSc8AAAA=
X-Change-ID: 20260624-b4-xen-a1cd629ce9f4
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

set_evtchn_to_irq() allocates a page for the event channel to IRQ
number software lookup table and xen_init_IRQ() allocates the PIRQ EOI
bitmap that is registered with the hypervisor in PV domains.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator. The PIRQ EOI bitmap is
passed to the hypervisor by its frame number and must occupy a whole
page, which is guaranteed for a PAGE_SIZE kmalloc() allocation as it is
naturally aligned.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_pages() with kmalloc(), __get_free_page() with
__GFP_ZERO with kzalloc() and free_page[s]() with kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
This is a (small) part of larger work of replacing page allocator calls
with kmalloc.

Largely, anything that doesn't need struct page (or a memdesc in the
future) should just use kmalloc() or kvmalloc() to allocate memory.
Removing needless calls to page allocator helps with memdesc (aka project
folio) conversion and gives a nicer API without casts.
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261108-b4-xen-v1-1-76095f25cbf4@kernel.org
---
 drivers/xen/events/events_base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index fd16d652c81f2..9828ed41d7a7f 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -230,7 +230,7 @@ static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 		if (irq == -1)
 			return 0;
 
-		evtchn_row = (int *) __get_free_pages(GFP_KERNEL, 0);
+		evtchn_row = kmalloc(PAGE_SIZE, GFP_KERNEL);
 		if (evtchn_row == NULL)
 			return -ENOMEM;
 
@@ -241,7 +241,7 @@ static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 		 * thread was faster inserting it, we can drop ours.
 		 */
 		if (cmpxchg(&evtchn_to_irq[row], NULL, evtchn_row) != NULL)
-			free_page((unsigned long) evtchn_row);
+			kfree(evtchn_row);
 	}
 
 	WRITE_ONCE(evtchn_to_irq[row][col], irq);
@@ -2314,11 +2314,11 @@ void __init xen_init_IRQ(void)
 		int rc;
 		struct physdev_pirq_eoi_gmfn eoi_gmfn;
 
-		pirq_eoi_map = (void *)__get_free_page(GFP_KERNEL|__GFP_ZERO);
+		pirq_eoi_map = kzalloc(PAGE_SIZE, GFP_KERNEL);
 		eoi_gmfn.gmfn = virt_to_gfn(pirq_eoi_map);
 		rc = HYPERVISOR_physdev_op(PHYSDEVOP_pirq_eoi_gmfn_v2, &eoi_gmfn);
 		if (rc != 0) {
-			free_page((unsigned long) pirq_eoi_map);
+			kfree(pirq_eoi_map);
 			pirq_eoi_map = NULL;
 		} else
 			pirq_needs_eoi = pirq_check_eoi_map;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260624-b4-xen-a1cd629ce9f4

--
Sincerely yours,
Mike.

