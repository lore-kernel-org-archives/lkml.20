Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127366;
	b=jm22AZkAaKsCKBv63cEza3vJNq/ATuyl760B4Sa3fKLCTXS6o+PNk3TgyN0fLsmVdg3z
	 uukLnVjAFx/4aaa/y2y9IjX+7blf+4FMq+ITUBKhhbccOvUxx7hRHv8Y/2PX1DE4CzGBA
	 qWIo7HjzCj5wnw3YYDUAP+KR+YXcbMaVl16MQQAqLrEGC56Ik0aR1nzIMohFOA84PCun8
	 LdSS4+8JwmMWlS+vAxEQyQhAQ0pWl/OW1mkjb1qGE6GHmdrXEBu7BUZgrA5BDZfHIwfaG
	 b9omgDNKrJ3BDKoj61NAu97fe09rHK8imLKGmvKArxDavfoP4ua1IK0jrAY3L4/Rtpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127366;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=OvMwR2q246pcD5TId5yUQvPErCrIqP4Yqwl75kEJdv4=;
	b=FCXhnWZOs568AhP4y+H5f0KyTvF/0rVOXdQP4N5yOYnjlB3w6UA0yJqeSrR1EOR8ZpNw
	 cbnGKoGXwbg+/mAnieo9/kF2uYhkKYrKnb8bE+IA+QEdNJkEbuYuN6K4dxm1lloyZw8Ny
	 CJiuzUNmnxrdabz4aCnDlP/q0dcOAjyA3Sm5pOmnFHVwv5cz+oUodcrNTgLnkq9PW9eyr
	 DougfOODJ7zbRxLtSyIO5HRqvA0YpZrkgJU3LZ0qKY9JPdY6Ysg1/pws1ipNHT7eEAA6i
	 JaZpJJar1N6Hs8yCRK7Z87ivi13RMNXhT+mmcwwyn3YGahkO8FO+6A6cHprGXQoGq3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+SlQOYJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+SlQOYJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7861F0089F;
	Sun,  8 Nov 2026 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127365;
	bh=OvMwR2q246pcD5TId5yUQvPErCrIqP4Yqwl75kEJdv4=;
	h=From:Date:Subject:To:Cc;
	b=R+SlQOYJPlqMQtkVfLLLVQdln/NbRUqFxW6q8kybGmJI1Ss8JrmkDqLK/CPMlI6as
	 bIXH2ERjSanKhItHNzpQp2YWjyNIbJLQKMRBKCdsaiTxa+iQRwJ0iv2IK5Lmeqt4hM
	 ln8SZIfloQ24RJTpkL7MMm8AkApe/fkzdJGLQ7fuN1nzuSK9MMQHP/XQObI2TnFjkz
	 CHMCXy2uwEqTAXbWzPX0orhE1GqNVNEsTOapZD60AsVPV0SLpQvHGH7aILXYgo9SVh
	 jJhXEO65lpzewbkcFZBljrIEo2uiIRgtJO+HutILFfIQJnCcX5OWF8pnNCN8C/3Blo
	 9TazDZceW7c6A==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 08 Nov 2026 10:42:40 +0200
Subject: [PATCH] xen/events: replace __get_free_pages() with kmalloc()
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
Message-Id: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMAxFf0XyvDItpeB+ZewhrVEzWByJDkH89
 7Xb47mccw8wUiaDW3OA0oeNFynQXRrIM8pEjofC4Fsf2+iDS8HtJA67PETfZ+rHAEV+K428/47
 ujz/blp6U11pXI6GRS4qS5zotyhPL9YW2ksJ5fgHuiZ8TigAAAA==
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
number software lookup table.

This buffer can be allocated with kmalloc() as there's nothing special
about it to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_pages() with kmalloc() and free_pages() with
kfree().

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
 drivers/xen/events/events_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index fd16d652c81f2..8c377493429b7 100644
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

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260624-b4-xen-a1cd629ce9f4

--
Sincerely yours,
Mike.

