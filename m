Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4760368D70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084142; cv=none; b=ZEHVvJtI553eoN5VxLJUARGod6TeiJRbBaVzvGeTNsw+Rqy9UkdirhK14QmDWgUaJQ7dAYmoudK1m6A/hyNts4QIAGw79QX0D4HIpzAHRawe/lIuX/gtDzh7/pgJF4AV8U4JoUMYNYrDEZbhpA99g0Q3AUywKQsoQdfBuT8l6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084142; c=relaxed/simple;
	bh=Ry0KjPtcQlbrnEYtOUzb0KXaQhoS1BQLV2LCGslULi4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfwXqlciMkuhuajfltuGf//rGLcy3BzBHSzpUBEP50E7L8M/TV0Uuqmtg8oX99L1goWPgyaWTECcNlae2jvmuKPaa1C5g3oRn/A37rz4Hr1ZEU6lyKQPZYhp+7pOmZ6hCI1bAhKbFf7emGaLvZ7chrSNCu6f1v9Y9rgQS7D9Vz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jl68gXeq; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jl68gXeq"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c5so243919b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789084139; x=1789688939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHDaUplNmiJGB1HcZdUPq45OE3q8nGrruBBv2ttrFg4=;
        b=jl68gXeqj9eNSYSLaJJd9Vf7U4xeMcbnfqRHzHhFB3tQM04CMl0VUK++EaHvObFU1N
         cUslE4XSiomOTgMIfDqvB6V6Jv7reoaf3qkoSlmjE4l5O15re1Q39pLskb3IkWMJjQus
         +MB+bXhNBzYTTABB9YQ9xNhxPYeG0EQ+iEu41wgW0GSFtRODuwvC8upQrrUgBCtYL4s7
         sx97EWxKOkt7kh/fOe11rhviUO9jzUFeh3RSb5XqsJZLqTcM8wiyFYnFr6BjVXw+gRho
         z1rDXyBE/AlArCGMGhgAik8ZK2NyvCyIdR3eL7NwBsuhnoX/0Vy5UQK/upgI+7JmKDiX
         vmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789084139; x=1789688939;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHDaUplNmiJGB1HcZdUPq45OE3q8nGrruBBv2ttrFg4=;
        b=dsWEHFWDtYi38UJ/yoVH/salQN4xShUKQRgeQjULt8D6aSAqQaPf3o5kL7SaeIppKU
         B3MUKWvnCYgdI/G+rsK1mr49BHiug5Ri/VwoKdPhvBq3E7XUUhzmaPNK6HnXfG/M0K+R
         Y6JoI0JGxE6m+gD4B/f/FX634ROj7+Yi3j5Dw86ZOdRvHxCMSDPT0cSnr3e+2dMSrCZY
         fvbQKWWeB6eZzSBAtRoSq9p2tZwiqRGL+eTWl+ir4lzYHNwYkZxkQ8soqfJw2wQmAga3
         d0vErbaZvgWv+3K4fM3v23FBRIx3Thg8mem8EBQqpLGvE7kn6hJEUak4oWzFxojJAChD
         f6kA==
X-Forwarded-Encrypted: i=1; AKwUvByGL/6Uu4bW8AZfxodwYyY8y1qe71qMX8XJdhfbUWXkC0c8/aWTnEKMnsYBvoTyuCypEW+LK236BWbtvaY=@vger.kernel.org
X-Gm-Message-State: AFuF++murrZMdU2aeSZ3s7owQrJu/d4Zr7ym+mcpapBNZY0Ku06yMcbh
	krdttxlOa/rXakpCUIV+mP3r3fKnVit7Oi74/BT2/G5eLouSmL2GCOLe
X-Gm-Gg: AYBFou1ssWWcwMAzGXXBtTsUv5qJPYJzxn4hYKpMxQEVrYAJhygl5GsR6I7Y7MQ7WpC
	CNKHNXRuvcwVC+xc5N1+SOwKXbirENyNiNXfyYkesev2P7h4u1fOtfHVBSZozealwo+oAux3dYq
	+xRfsBcAuhnxPCxo8k89swOlxfw4AME56E5uwr8SsiagfnpjdCs6HICaYRyfD5uEKNkUEjfANaQ
	/w3u5pXptEl+EwPQHc13vdvU003SdgS4gDfPCcQaPBwNkXuBn3MaV5+qr3coyuwbiLem6o3wc4K
	EZYPl2iMFFj4q99timG1Dy3TNLPI2yTyftv41XjYLOhuu0P5W3w66gyf96thttNqxaGqkQxYwJE
	Bul+4QLmMPYqH7jQJNB3ObzEk4fethfTGSemwKl5fipYPKS7+8deBmZFYykHtlk+2/5ErIMyIMc
	pUgNF5RWQT7Qgx0CMwm/vvyY8UfVvedTzgmgqmomACIKsZi4XKsoWzhmJeVKi4x5jSlmtrCcf2S
	z9trGUodB04Mt0LA//m9MvdRLeg9+2pQQ3Lw3qrMR1+UTRlajZIl6+1yRtePGQQ+5M=
X-Received: by 2002:a05:6a00:c4c4:b0:869:427:9b0b with SMTP id d2e1a72fcca58-86b30e0c7f7mr1589254b3a.1.1789084139238;
        Thu, 10 Sep 2026 16:48:59 -0700 (PDT)
Received: from localhost (ec2-35-80-130-216.us-west-2.compute.amazonaws.com. [35.80.130.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b288bd504sm246237b3a.14.2026.09.10.16.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:48:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 23:47:44 +0000
Message-ID: <3ebd03824f0df04947ffca7f25c96c30.perf.patrick.lu@gmail.com>
From: "Patrick Lu (Anthropic)" <perf.patrick.lu@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tejun Heo <tj@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dennis Zhou <dennis@kernel.org>,
 linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] writeback: bound cleanup_offline_cgwb() rescans by rotating b_attached
In-Reply-To: <vciagp74qvys2zdbsfcr2brhbv4uyabvm67czm255ascytesjz@n6q775zxxwvb>
References: <20260909-wb-cgwb-rotate-v1-1-f2eb994d2a46@gmail.com> <vciagp74qvys2zdbsfcr2brhbv4uyabvm67czm255ascytesjz@n6q775zxxwvb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, Sep 10, 2026 at 01:24:52PM +0200, Jan Kara wrote:
> On Wed 09-09-26 18:50:27, Patrick Lu (Anthropic) wrote:
> > Move every scanned inode to the tail of b_attached, so the next pass
> > starts where the previous one stopped and the drain becomes linear.
> > b_attached is unordered and isw_prepare_wbs_switch() is its only
> > walker, so nobody else sees the reorder. b_dirty_time is ordered by
> > expiry for move_expired_inodes() and keeps its current scan.
>
> OK, but isn't there the very same quadratic behavior problem with
> b_dirty_time scan which you don't touch (and where your trick cannot work)?

Yes, the same thing happens there. We never saw it because none of our
filesystems are mounted with lazytime, so b_dirty_time was always empty
on the hosts we looked at.

We realized the rotation works for b_dirty_time too if the walk starts
from the oldest end instead of the newest. sync takes the whole list no
matter the order, and move_expired_inodes() picks from the oldest end,
so walking with list_for_each_entry_safe_reverse() and moving scanned
inodes to the newest end keeps the oldest unscanned inode right where
the expiry looks. Prepared inodes leave the list as soon as the switch
work runs and get a new dirtied_time_when on the new wb anyway
(9a6ebbdbd412), so the only inodes left out of order are the ones that
can never switch (DAX), and only on the dying wb.

I tried it in qemu with 100k lazytime inodes on a dying cgwb. With v1
the b_dirty_time scan under list_lock still grows from 11 to 115 ms per
pass across the drain, same as unpatched. Walking both lists from the
oldest end keeps b_attached and b_dirty_time flat at ~0.6 ms per pass,
with one loop and no flag. Does that make sense? Something like this,
which I can send as v2:

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index e744f9f9d43f..ea3eb40bf828 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -727,19 +727,34 @@ static bool isw_prepare_wbs_switch(struct bdi_writeback *new_wb,
 				   struct inode_switch_wbs_context *isw,
 				   struct list_head *list, int *nr)
 {
-	struct inode *inode;
+	struct inode *inode, *tmp;
+	LIST_HEAD(scanned);
+	bool full = false;
+
+	/*
+	 * Walk from the oldest end and move scanned inodes to the newest
+	 * end, so the next scan resumes at unscanned inodes instead of
+	 * re-walking an ever-growing run of prepared and skipped ones.
+	 * For b_dirty_time this keeps the oldest unscanned inode at the
+	 * end move_expired_inodes() picks from; b_attached is unordered.
+	 */
+	list_for_each_entry_safe_reverse(inode, tmp, list, i_io_list) {
+		list_move(&inode->i_io_list, &scanned);
 
-	list_for_each_entry(inode, list, i_io_list) {
 		if (!inode_prepare_wbs_switch(inode, new_wb))
 			continue;
 
 		isw->inodes[*nr] = inode;
 		(*nr)++;
 
-		if (*nr >= WB_MAX_INODES_PER_ISW - 1)
-			return true;
+		if (*nr >= WB_MAX_INODES_PER_ISW - 1) {
+			full = true;
+			break;
+		}
 	}
-	return false;
+	list_splice(&scanned, list);
+
+	return full;
 }
 
 /**

Thanks,
Patrick
