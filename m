Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A421343899
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310559; cv=none; b=sNxg0f8CjenNZsLbppXLRog1zVNrdGiV/eLCStF6Yu4OXdONEPg5OIulndqc6xHtCnonSQyPixrs17ogMr8NOujTEBjA32bA4Qpl3kpb6IJIk3xekDcTHHIzbjuVmc1Zj/O3aUGnJh04ys/NKIoKfFn63saDRdCGrte8vJwrnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310559; c=relaxed/simple;
	bh=K1PCFGydr6vhIM+0fLoxih9XImLqTH7iNyf5B48F2r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orNaCe3Z9C8QCvrBFklPLoRyevpXi8IBT3gvwEc2kH1iNHy/L0IPr+MSlCu8Uy669RfYLmWCN+Utx9UFJOYcb7G7b1IlJ8SQNe1m87Og/0b9EjkZnWawTeyXRXQlauEy2AZ9Grmz541MNb2IdfQ5KJF17pnZAVl+Ch5Q7Vsd+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTkGjSRc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTkGjSRc"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so2524075ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790310557; x=1790915357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMzp+2P8aZfHlr8qYMa3jORBlQwD/QB/O+yiPFw4Ks4=;
        b=MTkGjSRcvIbKxOqW2J7jhtZtGplNIapGJtThy67KsE9IgVcWzziEuZMt17gHy6okCe
         2EJcPDkiphYcLUqR8b9DOVHb9S8pFQvhFnozraNNjzo+18RGNwBUbe84dGAgdwCTBNlV
         00XoHD6+yT0+6bbFccBOrTh46+O9BSkMK37jB+6MEm2sr3xbxr6z5mv+NvhXLS8oPtS9
         PAXWrT62mHpTgadGPkwqvut2mrCFn2Splw8s/oiVnaeQte6iPOZZm7GQo85rkLTanM7+
         WGR0LdjLArQVj+YIbpO3BfVdyF1MkLzuOoBo+Bg/reznMCiBApc2+T03T/OlIWJYftjU
         8IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790310557; x=1790915357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMzp+2P8aZfHlr8qYMa3jORBlQwD/QB/O+yiPFw4Ks4=;
        b=Ptb+ITqI28fE4S+q0tle6tI+X3d0f33FM6AWQd+4Dr870CMsTrnpLoMclF+rQVInvG
         fmwZGQl+tlx9kFlwr6o6UjHqFeWiA8DtzZVW6TbavYfHaYwgqp1yZbKHnE5fV088yzQ/
         4LjYikEh2mW4KHSUHhTJ7N9azSnXlz+vOveXkyw61boS7itva4hu+2Pxk/PJtM56wvTh
         XFd423qBUsRR3eCQa8cX0oDPaXhWb9dqAyl5GSyD+mcLru/WSMNgWu3CI7cNjygPocMx
         Ml+9eRWVSfAJxdhNvQNes0MiFkjvgr6DJniTVY0cN6WsHgOHA4tRnjfoIxJs1EkXP/NV
         /4WA==
X-Forwarded-Encrypted: i=1; AKwUvBzL8tTcQDUiAJRx5PZoHnRxrlQFMPh27XauUNsW59IyTpxbTd2I6X0dXJQgmyFBSnRMaY+SRuO5Yy3qMC8=@vger.kernel.org
X-Gm-Message-State: AFuF++l/tH+3zr+k0KRQOoU29FmaiG0MSJEJx4Grcs9WpWwCM59S2mcW
	AUN6hRYGW5qqQlpf03KlDdhznUb76positQGNPOIXBMcQr7hmvF/FOU=
X-Gm-Gg: AYBFou2WHLFXHsq0Z3xgIsnkePLGpsjzPTLf9ON5OtgGbDn3iPXoUnIL5z4/05UDqqv
	iJatbQOCy1U2R2R5QkknoL4GKjn7D/FFB2quU1EsCcN3QNoX0NreD1ahzXTdw8+BqzV9ilFNU4i
	bvduLcyI4FTsGzzh6FWVLFQtfx0O+zM2AHMgNe3rSI82gJW2j+tniUHDxMEptVgklVq9/n1YtDa
	M5ra9CPjaFz4GuWizu2HbNu/+0OVlhkJEOfBoGtY6Mk9vU2uNSE5cq0hYt/m7VAZKggp9XRU1nq
	QbuhScqJf1QswDRIR82M9L9RfTtwMZvAC6Xyu6o9HspIJ0ImERsfcqnyfmZ3xRm840hz+ew60gM
	S5WFTQdkxDJKr+ZpLUlRE3kfQJ/ON4BvuIyKIyeYPuvNlVxjICMQU75gOs7oQpBFUor/J9GuWgp
	e4rbhCWcVbqAXl5JrrL66ATEaAE2XMp3rtnBDx1ifdNha5LSSHyX7Oo26e07NGv0L8US3uPsloM
	ORdp5OLOWrw8PD412T71t1DvQ==
X-Received: by 2002:a17:902:cf03:b0:2d9:54:fc69 with SMTP id d9443c01a7336-2df9490a51amr8031815ad.7.1790310557275;
        Thu, 24 Sep 2026 21:29:17 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9525cd53sm2499125ad.38.2026.09.24.21.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:29:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Fri, 25 Sep 2026 13:29:06 +0900
Message-ID: <20260925042907.2330519-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on the source lands in a
destination VMA that was never registered for write protection.  It
can't be unset there, and THP collapse can't happen either, because a
swap entry with the uffd bit set makes the scan bail.

I don't think it's intentional because for an unswapped page the bit
doesn't come along, and I don't see why being swapped out should change
that.

Clear the uffd bit on the moved swap entry unless the destination is
RWP-registered.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 mm/userfaultfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 74f04c323c50f..f39f109f17989 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1449,6 +1449,7 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
 	if (pgtable_supports_soft_dirty())
 		orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
+	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
 	if (userfaultfd_rwp(dst_vma))
 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
-- 
2.53.0

