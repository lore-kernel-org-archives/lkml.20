Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227019;
	b=XTWaKHMKxQHoYey1jrTp/86UZ57xpLsSb36kqcfTnQynFiCC4cUi1xj2tUKRqHRS5Pwl
	 10+kfwM5PUZ/dLhz31glRQzEPRca2WX8uFFj8g/7BnWJuhyopCFKjWI/2iw/JLw+zxfcm
	 Kd5NpIgO0Mo8Emwz2UQj8ION1PkdREvuOw0GgBd1RS0ED73uvHKic+onFno4rDNHXFH6H
	 9ZP1ZXf/nU4mlUF6cmgAsh2Ue9iT8Txa+PDAlnv8deoRf7MwD0uzVbQbELectdZr2O+b1
	 xdbyGFVUquRZR2UqVAF9Mh3EZdukbRqqLJ+BgjPZGfEteQmBfojIPNDGxJQS+nkWsUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MdOqoOEupQFbfi4QuNxY8pxCO+41UFytiQ7mtp1SJ10=;
	b=NZ0D7QUQgv6qZrpZTc2sQpc139iWPa8vNBzHgp8M//fQLRMPTnBq2xxFi4zkQ2izKD0+
	 s1VObUYlA0R3wmRtiTO3vX1nvKelMkPbdzYNwjCwkSAeh1XP+7vTqm0iFy8tspLws6Zvm
	 zgTqCK66XvJBO9xD5Zrfa8pgV9Lbag/3MjnvtVIn2EXvbt44r/hlkHWpVs2Bxd0ySolZI
	 g4JpcgKEVeD2ywOStVRvHb/FzU1owTPka2xtgjK/uIl0fwqnC/1TwLub/xsP1heHfwYRs
	 1OOYzVhVxJ6WNJLh6u/ZvFVw/NrGNIzZ+w7tgqEr3znAFly1s5aSnVIdTmqjuW5pwvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=STY0ySgF;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5896082BC7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5896082BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=STY0ySgF
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so389547a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794227019; x=1794831819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdOqoOEupQFbfi4QuNxY8pxCO+41UFytiQ7mtp1SJ10=;
        b=STY0ySgFQct71N6fSXFw7gPHNK9fh1uk/HKydCqbkruXIWcuy3S4z/jNdEXBQ4XwfU
         C9aFa47b4YtQtk9chb0ztOYkd4nntbwk2ATEiP33A9H2UR8HKwyg3OSWZfewrhyjS/qB
         QNHHUgkANKW4G+nH+kPJEBG661VnKBnrCLo9oM9MpCsh01oV+V20luewPyAnc/buVSVA
         5GXrWnbP01TX1Z2vxaMlYC6vOY38ICJKs+vELMCLG+G1+PsGj8ru8tVz6ND3gF3f1G9o
         irgKd7nQxwHW8Uqy5uc+ihnMPuQHOS7e/9e9VYBrWiha4meZv/hlmxXlyXiIDBcxVufS
         2JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227019; x=1794831819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdOqoOEupQFbfi4QuNxY8pxCO+41UFytiQ7mtp1SJ10=;
        b=VWCSAZ4dGp1rTnGKhiDmzc84FBMxd1te8rzosUQZVDIOysfchIPdj2cpTV/p1CpDCZ
         RNgsF0jUxeN1w97u7RemEuE/I6Iq9yEdRKh7596bJCjQ/S2il5qq8kq0GyqhZ8PBcNw6
         lij5jYoNqacMqQu119S7jWIHgjqSn7WHc8dCjsEYy8MH8yqLPENurm60WS1CkduEK0rQ
         cVq1k3vWSgY4GSXnvY6R5XbmSzzSiLYWQ77+Vf/so5sUW3+0/cC7OxLTAsGxv+hNblSe
         lqfDOnkTpE6VfTTYrVRWkY8T3VFViHvldAioaKW9+w79PjsfoWJrStgJNJ0YTr4YJOMx
         pZag==
X-Forwarded-Encrypted: i=1; AL+hErERxRTxvcMeVkW4SpeHwgZCba/BO2dDsU/kN+TVmKMB3MnHQl/Ot9GYVikb5xL6BE84lSK8OUF4go1NFp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rhwOanbdWP55acsw6+HRKKl1d6xgPFeciS2JgekfF5iHx3lqo
	KjL73iet4zvpZJdiUV0zV7nYYKcsKBZDpDxp+9zAgxDsKK7RRCnVXr5SePkXkYhm4Aw=
X-Gm-Gg: AYBFou2EMxPc/hSx0AhyGKxYQ2TGfrK4/T/ZciBCYK69VefLYgoJZL204qdxLN98+Mc
	fuxbAYn+WgIVEG8BXzbx1rHsmidhVGpIbEYzf9cOutqpH5HsKRCfaFyYvRduleEHu2/js1DByym
	7Lvm88SRRRzl5MC+mvWh19Nn/f2aMKOA3ahlPXgMMFrqMKqQNxsMjpj4LY1jxdf+7wet3QY2ujW
	3dBj0rcVk265pD+6GiHpWYiolKOaB4sIpvB80TS6nNE5pUBNb3WLSACj0H+dOltC3kfbcLJgSkY
	rxhYDCGb4AniVNQJvFpXKRBa0HClcbDF2cbRiOzeYp9Wx0MvqjT/TTT/PV6/lC62WBfJlidcNWn
	TnGXRhGR99nhAULEuNjwrpUFgmJQihwcIuyK6Xv68/g7T/WXeXlj9t3Orl4h54aRWhgH9HVVeVQ
	YK9kjISfaNJNlH+/6iIQnkiOcmooavGoyGp+cjVSoUTgA+z9E76uBSfApRAgDf6rTZSj/vn6Hps
	FiwWZjqsLVSQMuXDDDjFCji3TyTJ9hX2Y7es4XlYCqvig1wnO/dtam4+J7x+k01zS8tj9KrPHhy
	5jkzYmcVX3GYixl5fluMs6Pmr4gCzmhLOiIW4z3LdpWhLIEXK1ntlBGMPzsbG/WQ60FDo2F0+Me
	qpS3amufC5A7Fa1GoAdOehWA4jcGkTizxNTFkFQ==
X-Received: by 2002:a17:90b:2547:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b12d4204e3mr3448890a91.10.1794227018821;
        Mon, 09 Nov 2026 04:23:38 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:3d70:1891:1a66:b169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127912d62sm6836905a91.11.2026.11.09.04.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:38 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] xen/pvcalls: destroy the per-socket workqueue on release
Date: Mon,  9 Nov 2026 21:23:24 +0900
Message-ID: <20261109122324.30134-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
References: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pvcalls_new_active_socket() gives every active socket its own ordered
workqueue:

	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);

and nothing ever destroys it.  pvcalls_back_release_active() flushes
map->ioworker.register_work and frees map, but the workqueue and its
pool_workqueues stay allocated, so a frontend leaks a workqueue per socket
it connects and releases - a loop a guest can run as long as it likes.

Destroy it after the IRQ is unbound, so no new work can be queued, and
before map is freed.  pvcalls_back_ioworker() takes no locks, in
particular not fedata->socket_lock, which the backend_disconnect() caller
holds here, so draining it from this point is safe; the flush_work() just
above already has the same requirement.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/xen/pvcalls-back.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index dcefa91a40cd05..27aa06289a7b92 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -456,6 +456,7 @@ static int pvcalls_back_release_active(struct xenbus_device *dev,
 	xenbus_unmap_ring_vfree(dev, map->bytes);
 	xenbus_unmap_ring_vfree(dev, (void *)map->ring);
 	unbind_from_irqhandler(map->irq, map);
+	destroy_workqueue(map->ioworker.wq);
 
 	sock_release(map->sock);
 	kfree(map);
-- 
2.43.0

