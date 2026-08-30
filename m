Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F912D6E64
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076090; cv=none; b=JLgC0Kpxzw6Fmw7u40bhOb/5esOD4i+sIP9QZc33ZNx54GhI4tTJIb2cL/xLXsnYGgbEAb4JNnFdBUOO36n8e1sF0P/yf3c0muf+41co7gpE5yahCRwJwwUEmcsCzirNE2Ls1Ok1eZfMAJA7s+hPiV2fd8Jkh4P43fzlwSwXsOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076090; c=relaxed/simple;
	bh=gxl10T1a4q7qNQWYriqqtddynigDOr+IYYOIKMq1Gms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7I7Occ1cvY6dC8zsQm5yPdSOR+qihsVnbDWzt/kx/CQDbBO9dLAldGynOjlxePsrfWNrJ4Sdf7CXI6IMvi+eU4wmExcKvSOsqrQdhLh1DjrDyLAj3J6+3R0vf4zQwWHOiT3qFRocDNOt6dl/pw73bbX1lnz1X/wG0Cscwa4u00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5WEFdIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5WEFdIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3281F000E9;
	Sun, 30 Aug 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076089;
	bh=lBV4SRjso+EkgLj4PkYZQJzo+GNlBWOlH+QTKJh25O4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C5WEFdIxnZu7NyCEa0917/q9m8RAavDxTcdqoLLl699TQIsq4EeOhuxI+szK6oUPX
	 BBIzv3+IJ6+fS9FQmBehVilOS0JWGi1UM3ADz5QENEJkQ7B/lCi6MWuSsmh9d24gC/
	 xqZO9ZbJgzAnKUPKUwFxOq36/mp/Mjxngs08R/Q2YejbbFqe90lyuLn5rhvLGud3X2
	 EVKuB+T3cucf4i8ZuJBhzJEXqmfg9dO6oauWM/ZNRbde/XgSesB8Mx+xxgTVU6krb/
	 +wgLp1Rk81AU4bDORSu6mDLNfdNz2kcvtvVoz/m10gaevkyEoeDi6cwxlvkD5TYLbP
	 9ZbWSJno7s5+w==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:47:58 +0300
Subject: [PATCH 1/4] char: xilinx_hwicap: replace page allocator calls with
 k[mz]alloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-1-05e2ce44f291@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
In-Reply-To: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, 
 Eli Billauer <eli.billauer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.17-dev

hwicap_read() and hwicap_write() allocate temporary buffers used to pass
the FPGA configuration data to and from userspace.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_page() and get_zeroed_page() with kmalloc() and
kzalloc() and free_page() with kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 9bb5fa642fd8..bbeb9b6060dc 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -382,7 +382,7 @@ hwicap_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		       4 - bytes_to_read);
 	} else {
 		/* Get new data from the ICAP, and return what was requested. */
-		kbuf = (u32 *) get_zeroed_page(GFP_KERNEL);
+		kbuf = kzalloc(PAGE_SIZE, GFP_KERNEL);
 		if (!kbuf) {
 			status = -ENOMEM;
 			goto error;
@@ -412,13 +412,13 @@ hwicap_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 		/* If we didn't read correctly, then bail out. */
 		if (status) {
-			free_page((unsigned long)kbuf);
+			kfree(kbuf);
 			goto error;
 		}
 
 		/* If we fail to return the data to the user, then bail out. */
 		if (copy_to_user(buf, kbuf, bytes_to_read)) {
-			free_page((unsigned long)kbuf);
+			kfree(kbuf);
 			status = -EFAULT;
 			goto error;
 		}
@@ -426,7 +426,7 @@ hwicap_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		       kbuf,
 		       bytes_remaining);
 		drvdata->read_buffer_in_use = bytes_remaining;
-		free_page((unsigned long)kbuf);
+		kfree(kbuf);
 	}
 	status = bytes_to_read;
  error:
@@ -457,7 +457,7 @@ hwicap_write(struct file *file, const char __user *buf,
 		goto error;
 	}
 
-	kbuf = (u32 *) __get_free_page(GFP_KERNEL);
+	kbuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!kbuf) {
 		status = -ENOMEM;
 		goto error;
@@ -479,13 +479,13 @@ hwicap_write(struct file *file, const char __user *buf,
 			    (((char *)kbuf) + drvdata->write_buffer_in_use),
 			    buf + written,
 			    len - (drvdata->write_buffer_in_use))) {
-				free_page((unsigned long)kbuf);
+				kfree(kbuf);
 				status = -EFAULT;
 				goto error;
 			}
 		} else {
 			if (copy_from_user(kbuf, buf + written, len)) {
-				free_page((unsigned long)kbuf);
+				kfree(kbuf);
 				status = -EFAULT;
 				goto error;
 			}
@@ -495,7 +495,7 @@ hwicap_write(struct file *file, const char __user *buf,
 				kbuf, len >> 2);
 
 		if (status) {
-			free_page((unsigned long)kbuf);
+			kfree(kbuf);
 			status = -EFAULT;
 			goto error;
 		}
@@ -516,7 +516,7 @@ hwicap_write(struct file *file, const char __user *buf,
 		}
 	}
 
-	free_page((unsigned long)kbuf);
+	kfree(kbuf);
 	status = written;
  error:
 	mutex_unlock(&drvdata->sem);

-- 
2.53.0

