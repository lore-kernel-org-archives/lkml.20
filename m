Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127185;
	b=1I5seLqLOjsGOqH20i9zHn7JSTn3u2FfOo0iFJEoM0JoVOL9xCxUndnDXx2NSbmZ6Jon
	 RHGIxMVycQbNhYxqTF7O2tadw+nbteq7UtgaE9IwP3y8t2I5iX4FPJU7AvAzXD+UEvcdP
	 gr9QlF9O+5FYsZtoZXiy3wK1sE7lL6591iQy727u7/YNMOjYg161JiLsX6ZHJLK879Xx1
	 6/m+yT3LQhmkHuDlrrEus3StcCe7oxcFXqfW9RdqjN689gagYtF+Ad3dZNxT6gX4vdjTQ
	 k3FwcOV/if1zKP3iaaNiqLYzg6bQ0RW4zQ/8zkh5Q/LKGS639gOwdGiXPtirkGC831A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127185;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=TR0Ic8FdfhFovFBSqoBf8epOfPvHW3egKQVfisx1qZI=;
	b=gvGhUYVNKBk2AnYT4Y3qDvAET7ZNIkpVvrhMTzTM8fa12vujwf0xInT8AeP/9tmQVOLp
	 rJmLzc1SMg5ptMs9v4NLgozCRZXc/hpmCa78h69AOtNvTKzFQGG6YhgvwHJVSsWLD9Jjk
	 Fm/7deVp1mNmO+BoYWc6WkbEI06898g5vX/wWL+pabPWhZQvJCyl2y0oN8q09uc97Lh8z
	 T09g0uR5GukriDI3aUUhnSufK3OMH7QcJeyxqjweKsI6sYArWONRgYCzj7MZor5kPLUNW
	 2EfQqkmrvSvqEQgsfLNi2aMDH1fH8wSdagL8qdxQ8R6ld0LFOJ8oxFMtgbJYwx7aBUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExyqdcVP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C3606A31C;
	Sun,  8 Nov 2026 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExyqdcVP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CE61F0089F;
	Sun,  8 Nov 2026 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127185;
	bh=TR0Ic8FdfhFovFBSqoBf8epOfPvHW3egKQVfisx1qZI=;
	h=From:Date:Subject:To:Cc;
	b=ExyqdcVPjh/2tevdniSNuiMYeTaU1jdf+KXmz4NWmnv1u1FvnNxPacb1VWuNtLldG
	 jUYtZEkWffGX9O3mVo/NrJ3yDR6Pgn9x8xdCu/I3Nsr3Jt8/UkA907JSd9J+X3y3Rh
	 rzEDZIcqYch3ay055aAfAlwRrV6mWZ3K4Ef4oTPq+GD0oFVzKbpLDko2jkSOwbOGRX
	 yOv17sn8QGCcbtZ1I1oUmtqbeVt9zpW1cDtwfaPaWFyHyhTmA5zMOYwUKzvM1FLq57
	 0kX0Ew1swRTg7rgTzQ46REGMolIscrme9qLS67sTtTGW2Awf2Tgjh9ZpCYFObVK7HS
	 lQMalzg7vr/vw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 08 Nov 2026 10:39:34 +0200
Subject: [PATCH v2] USB: usbfs: replace __get_free_page() with kmalloc()
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
Message-Id: <20261108-usb-v2-1-c9209d527559@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OzQ6CMBCEX4X0bLUUJOLJ9zActmWB9aeYXSAaw
 rtL0eM3MzuzsxJkQlHnZFaMEwn1YQW7S5TvILSoqV5ZWWMLc7KlHsVpqM3RIqRNA7Vaky/Ght5
 by7X6sYzuhn6IpzHhQFA7huC7KPVMLYXDE2RAjn5HMvT82d6Y0tjzX8zMtjil2miALC99ZqzNi
 8sdOeBj33OrqmVZvtw9FNXJAAAA
X-Change-ID: 20260829-usb-ad052ea1ffad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, linux-usb@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

do_proc_control() allocates a temporary buffer for the data stage of a
control transfer issued from userspace.

This buffer can be allocated with kmalloc() as there's nothing special
about it to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_page() with kmalloc() and free_page() with
kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
This is essentially a resend of the "USB: usbfs: replace __get_free_page()
with kmalloc()" patch that fell between the cracks.

Alan and Vlastimil agreed on v1 that the kmalloc() overhead does not matter
for usbfs memory accounting:

https://lore.kernel.org/all/8cbe558e-7f53-4ce4-be8e-52fdba9105d4@rowland.harvard.edu
---
v2 changes:
* drop already merged patches

v1: https://patch.msgid.link/20260830-usb-v1-0-aa349c302246@kernel.org
---
 drivers/usb/core/devio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb94254809..9a7cc7cdf00be 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1190,7 +1190,7 @@ static int do_proc_control(struct usb_dev_state *ps,
 		return ret;
 
 	ret = -ENOMEM;
-	tbuf = (unsigned char *)__get_free_page(GFP_KERNEL);
+	tbuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!tbuf)
 		goto done;
 	urb = usb_alloc_urb(0, GFP_NOIO);
@@ -1265,7 +1265,7 @@ static int do_proc_control(struct usb_dev_state *ps,
  done:
 	kfree(dr);
 	usb_free_urb(urb);
-	free_page((unsigned long) tbuf);
+	kfree(tbuf);
 	usbfs_decrease_memory_usage(PAGE_SIZE + sizeof(struct urb) +
 			sizeof(struct usb_ctrlrequest));
 	return ret;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260829-usb-ad052ea1ffad

--
Sincerely yours,
Mike.

