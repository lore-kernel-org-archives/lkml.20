Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444393806D7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 03:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791343081; cv=none; b=FSVYepfNw9XAeLF0WtISvtOC8WcURNL4ddtHucrZgRsYx2ZUPFPwhkPmqSFACFHUx21jtADeoJeGH/Vj5qn/6nonDurXi8dnOuItiMFjC7gqZzrTXJNErJomcOwu/47LnT/238zdfn8mgN6/E8wlV5aKBH2VHYsUoUxwvQx39KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791343081; c=relaxed/simple;
	bh=8L9AMwgw9QqRi5hDNZ+LhrvvUXJjrxerO0IBNK3glXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lm1jjUgR4BOR2zCXOcVXyokXewZWqzhSdFKRazDmAwiLewk5+tJ8AYkjPXeer7rziV4ULeIeAMQqFwOc5uswkiHwzIMLCiv+iAmI485OGkK0Bwx1667EVX+Cfg6QESIUBxFtuScyJ1d+5D/8p6cuWpgPLRZEKlkz4YwUdKR12Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=eAExJeM2; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="eAExJeM2"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4a7eb86a4so1093742a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791343079; x=1791947879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3nUOoyD/0fhR41WYyphW7g8WBCossckUJ9W2mK+9QEE=;
        b=eAExJeM2p6C/H1B2mFlswDRN14GTdKynraTieSoOWu+mqka8dcEChLhXvyq3r83ewI
         D3WjHQEHxnVMo2YyYHi6Fb0ixoLCD04nUP0jhqh94klh4fLs3d7CHAI2A/tYtOd2ppdO
         p88zC2DySvZs3+PyvcGizkjI8OdjuSw7DS6m1jr8XVOEn/hlOG+4bMQnFyYTnAw4tQIU
         ExcIVWG+b/8yP/hMjj/UYnCVzAxVwMH5jgrHV5j+YtXYqV5hAtMfGlGAOYFSR4WNgaiM
         0EShirfH6VmawBQIG9f6gaWL6f8KTre4BeekcQQNrWqrp47hbulQ8Jn13VZAxo/l3EIO
         d4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791343079; x=1791947879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3nUOoyD/0fhR41WYyphW7g8WBCossckUJ9W2mK+9QEE=;
        b=j5Ve3Pow0+lru7AVXjlrqmPro4SIcGz9QQ/ZhHaisXCPE5d4BAinlg7ct2vpI4RHvI
         m8u6R7jV5p8xcSZwqRijnqPL99SIFmHhIsLklGpkd9HJe4vU4hbU4LhaYvdCNol+nfCm
         gCUOMEWySZWlbs4RAhvg8YP5JTmjURoqVuAXyArqBmEnQSflN3QUA5aZUSiksncfdR4f
         a2cj10bXD+qP03XU+/bEIGpU9vgeTQRxtc847ll5A0N731U34B/bh7rn9rogM6bl9DBb
         GOhFfKzgGtJqHQDyyzdJpo75lofOPus06i1gWgePT3hQISZw1cpUXRfJcFOc89SH8Qx0
         CXKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVWiKulKc3f1Pu986SV44XJtGMzTNhOktJ8k8PHBDR3UWCMvv6t7nsiexpHRxwqLl2ukyL2FnFzTVifVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrMnDdQ5QbgUywX4BX3NdTke85Y4Toyk2WqBVRmFbVKC2tcyG8
	SzmeV4Gj7vcHKHEX5ct6+IUGZKc6ybxS0j7kDthpxHEHHvXVZ1F1ZGbCCMwtRhlSvLA=
X-Gm-Gg: AYBFou3rfUkVHdwTjP8qt+kXnWxtCrjULN+GXD/hBOrfNCVPOv5D3m1BsbgAtqskKZF
	2CgryQf0CzSAy2eCVRG/tQ/Vo3htkMUEMsNjJ/jwQ15pE0v3TjKZ5Y1+eDdDd7Rhg+j0uEUkTYP
	/nuXf2rgnkO7l5zCcrDd/M+ivH0xl7s/shuLWMYu0zkUfxeWWg3MBJOqb/jlWg+h7OTj0Resaov
	pXu5Znqkghn+lOcBQlQou5PIHAa2nSP1g4o41W6eddtxqUn6mRRI+H0R4OtLvgnFG5UFyPXFbE8
	wZv00nQt+6zdv6gHdLW3JAwcqtPe2PupFLVVuHkP1Pu72NCN4JFIxhqejF8QOy4T4YIsAAQA0OC
	iaZzSBOEjlcxGlzoXsZsUo9GWj6vF4ke6pm/TRX45aHHtdDnrx+b0GFN6bEEKtL0BWq6yWb43QD
	/ePwyDpyv8QmOWwrVivWyc8lticxJTjfUo1fBS627cPBJBkvQ7uaZg5xE1Xmm1B+4Q6MiPH9OLW
	dqkpA==
X-Received: by 2002:a17:90b:52d0:b0:3a0:c0f0:9a97 with SMTP id 98e67ed59e1d1-3a8a04db3a8mr846970a91.9.1791343078978;
        Tue, 06 Oct 2026 20:17:58 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b17bc5esm2363382a91.7.2026.10.06.20.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:17:58 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 3/3] scsi: libiscsi: validate the task named by a management response
Date: Wed,  7 Oct 2026 12:17:37 +0900
Message-ID: <20261007031737.639431-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007015842.634893-4-yhlee@isslab.korea.ac.kr>
References: <20261007015842.634893-1-yhlee@isslab.korea.ac.kr> <20261007015842.634893-4-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for looking at this.

The management-response ITT is resolved with iscsi_itt_to_task(),
which returns a fixed slot in the static command pool
(session->cmds[i]) and is non-NULL for any in-range index. The
previous check was "if (!task)", so a valid-range ITT was never
rejected: before this change a management response could already
drive any pool slot to completion, in any state. This patch rejects
slots that are free or carry an active SCSI command, which strictly
reduces that set.

On the two paths you raise:

- The allocation window -- a slot briefly ISCSI_TASK_PENDING with
  task->sc not yet assigned in iscsi_alloc_task() (freed slots are
  cleared to sc == NULL), allocation under frwd_lock and this check
  under back_lock -- is unchanged by this patch; it pre-exists and
  sits outside the NULL task->conn dereference and the
  ISCSI_TASK_FREE refcount underflow fixed here.
- Completing a still-queued PENDING task was likewise already
  reachable under the old "if (!task)"; this patch does not widen it.

Fully closing the allocation window is a separate change -- e.g.
assigning task->state last in iscsi_alloc_task(), after task->sc, so a
findable slot is never PENDING with a NULL sc. Happy to send that as a
follow-up.
