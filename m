Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F51539762
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075295; cv=none; b=PSUkPjUQZGCm3znthGe5MNBshN4L+7QKphIZW/HIUrwc2cXbHzmZAZv4R6evt4IBOrJR+duETin/Ii/5vQmdvNqCgrESUl0raeNkFjRERq6q9reYhIMFuEPlwFRHZDJirRtMKXAGvrCPfEg5R6klLGEdCXEPTPuyG5ury6VRMcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075295; c=relaxed/simple;
	bh=1RWl0PR05GJY94GTZEo2wCPawRYp5T88Nd+pKPOM9W8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dEKHWtQqfzdONYXnDcsLmydOkw4EU0USzHqR5PI5qdzyqXxHKbfC92GNlQbOYbMqm52WnNnrktPlAFZpBgdU8piON5kiFalOGtEZP7snovBfdvLi8cH5X2fvxOZxLk9xJ37vtOIAlZJgGTmtU6MdtV7O1faDF+Vg+doiq03AMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=JYeJjj+Q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="JYeJjj+Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso19536905e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790075291; x=1790680091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7KS/ZpH17dTPDD8GscfCjkQWEGGxCfVsoh2ihMqdpY=;
        b=JYeJjj+Q+pbezXy7UoVLP8gHW2LnFrCvKi3/nfur+3R+GIZTQm3sBbJlDTMSRjR9rP
         GTc/C/mkda+fs9YMTq5tPDlKo7oV4pKkE13cMsGeFbKBEG4F75LxAPTXFm4Gh+kpYz8w
         88J5eDT+jhXaXXWuE3tsYE8iLSysjW9o40N35Ajyk1ydiIhZtjseU00MYArKD56SDKln
         e7rY++PHhHUhBlQQxOSTzmFsBhplO9rUmq2M/kaGQPg/wzpgm20JXmGUwk8zqwoX6/mF
         vQupCWZqQgkGz48+jxD9/AzupI78so8CQXAVquYhCNcLbZtIKfVqbUDppAsciQM89sh1
         5nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075291; x=1790680091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7KS/ZpH17dTPDD8GscfCjkQWEGGxCfVsoh2ihMqdpY=;
        b=VXdfAd/xwSQv7OT9iQyN0oIq+WSL75oSuTAfIhM0pKa5iyIOzzzHZS9wL9zvucVYg2
         vIGeGdzEnSt5tm2MINjQwXsJ4iMBDbfpMqaW5mlNmQMX7QAxVNGGNxPAANdU8J1R2bx/
         KodCNuF1a3FULXEkcg1WF1IRV/w7FY8mAFBpYzYFz1tKEXm+TwYGAN8vdN6wTSfPxYuL
         XZNw+0885Eg1VGJ3jI0I69UkTlSTBhJP0Q5fioD8yB33fCZTL8GI4qnIhF4uPvqt6FJG
         XXM2bSrenNXLoJHPTYuJ6M0l9460X3xZEnhDHwtGdMi+sfXJzI5OHiM9H365j/6Dc3w4
         n1qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqZpWtWNj9FbqOy2BicgSQEReXm1N++zG+jBEI+psJdaSYx7cNU3wC4CXJu9QASNcM4ey3mZrmzAwXLZU=@vger.kernel.org
X-Gm-Message-State: AFuF++kejqdsBsJavV3v3Gwf2H8qOIubKrMjNXoWO4ZEXVR8NWAZF9Lw
	aRCh/D2xF8ZkXD0/hJMCTlnenx3weLTrwfdBM+v7wln4rIZ1tGDdLdGqqmCN4UPRdKM=
X-Gm-Gg: AYBFou30nYvlanCVPTyZhe1GE6RcJ7IYXAIklbg+w3HENqCitTYPqpPpfieTsVJPlpJ
	QNzwFDHQniXY2D0vy5q4i5hae5E26+4GDczn7sdnWQ5fps3zZSNoOWdU1vOWh6zqlWxq5Yt2mkA
	d76WhQLtMC65Opw9iKMKoyQ+NhrsEFrzxvqdgMg/0KX4t3oISRaE+bZo4ejfYDsFTzQnf1aHooG
	m1V1n8USi03jtxSLtS2U/c0Qv70Mn4hhSOaSn5kkTpG7l9WesJvHmskrqs25ROod6vrYDE4Zo8A
	JJlodSSuzM1V93d3s7LsIYopomV3Ge6OWEow+q3oFtFPHM7EY5ecwhB4ei7OWFU+2kYcbKfPTpc
	4KspZF1Y/63ESerbPCEXz/GNG6j7Jel7o3VXBVv6FfFpHlXY/wRd/j64/xixpQmCSN2CKGSoOq6
	RSMeyUdm0ZrhK14oLM2pXxoi+j/wfvncpsomswwtdj01tmZC9JjHlXz2EkY6tfnsrbSU7j13ZSm
	U4UnJA=
X-Received: by 2002:a05:600c:3486:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49fce73084emr122080755e9.35.1790075291456;
        Tue, 22 Sep 2026 04:08:11 -0700 (PDT)
Received: from localhost ([2a02:168:9d56:1:e1c4:67b1:23e:28ed])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fdad2a3e0sm59275215e9.5.2026.09.22.04.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:08:10 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Kyle Zeng <kylebot@openai.com>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	syzbot+f1521383cec5f7baaa94@syzkaller.appspotmail.com,
	Bruno Produit <bruno.produit@trailofbits.com>
Subject: [PATCH] jfs: pin metapage during synchronous writeback
Date: Tue, 22 Sep 2026 13:07:54 +0200
Message-ID: <20260922110754.1804555-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

release_metapage() decrements mp->count to zero before it starts a
synchronous write. metapage_write_one() drops the folio lock while it
waits for writeback, but release_metapage() retains mp and dereferences
it after taking the folio lock again.

Once writeback clears META_dirty and ends, reclaim can lock the folio
first. metapage_release_folio() then observes a zero count and frees mp,
leaving release_metapage() with a dangling pointer.

Increment mp->count across the unlocked interval. This makes
metapage_release_folio() reject the folio until release_metapage()
holds the folio lock again and can safely drop the temporary reference.

Fixes: 7fab479bebb9 ("[PATCH] JFS: Support page sizes greater than 4K")
Reported-by: syzbot+f1521383cec5f7baaa94@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f1521383cec5f7baaa94
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---
The syzkaller issue seems to be the same, although the syzbot repro
does not trigger KASAN on my side. Trail of Bits has another reproducer
for this bug that triggers a KASAN use-after-free and can it share if needed

 fs/jfs/jfs_metapage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 41fe12e..d1962a4 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -882,9 +882,12 @@ void release_metapage(struct metapage * mp)
 		folio_mark_dirty(folio);
 		if (test_bit(META_sync, &mp->flag)) {
 			clear_bit(META_sync, &mp->flag);
+			/* Pin mp while metapage_write_one() drops the folio lock. */
+			mp->count++;
 			if (metapage_write_one(folio))
 				jfs_error(mp->sb, "metapage_write_one() failed\n");
 			folio_lock(folio);
+			mp->count--;
 		}
 	} else if (mp->lsn)	/* discard_metapage doesn't remove it */
 		remove_from_logsync(mp);
-- 
2.53.0
