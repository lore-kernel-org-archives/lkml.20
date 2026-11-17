Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924323;
	b=stIhHuSjX2jxQP7SfwIlGQ00RRMtBxqMF0q9Hu06ZOwYEPZ4Qb82vBPm0X+2CaqHIO4f
	 IK1gNbbaJdJmcMoodSUe6AxJFl19vdILNSaDyV6nCgkw6151SDegDxtzIxnrSvh529iyL
	 cJ7dij6zyr1XvEBy8XAjVj1heY536TpPbzRPQNdk1zFlZ/xt/n1S8r0bPSKC9Oc7xKSGI
	 rPYN4UQ/QKW+NJtcJR/HwB0t0jrmgbni0KYP859EKmgsx/g8stCZl0brPobW98EKiBXgE
	 2JZy9qqmlVK+YdWBDzQknXtxA7LzupKx+IMv+bXt1JQv6/z5MtXRZtgTKKfaBmRsE4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IzbGVjgREwr9IrIK+xSlw1aYmIcPEF/XveJxpgUjaVI=;
	b=HRCAQmq0Ux4GJZwl6C64Xm678jlW/U6793/ZgtE9My7wjRYS+Ti0hQGFkMlz90AzJXAF
	 2QWHpJT/kCOW0fDtf1DuQA92Vic7QtB08f7P0x5C6o3rKpoo4AkEkUSLV/fnmKtHZHiO0
	 b0pH/LHPDOn8w2AOv1fvxI0qQCFR+OCXFUWpGrF0qbmKPwuRWB+MOQEecgrYmQ/pn+MIx
	 chAV/m7bTP+FHqmMQHzD34Ff9XX6hPwgnLPOU74EXfwY1EUugABAtGo0pfTfppEXyHoxy
	 dhoSlwPQldRFm6mI7W8StbICzGgI8eY0cZWOTckdGyud4xXUfgrOpW6psKKUcgotCfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BBlemqxn;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D54606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D54606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BBlemqxn
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso1567297a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794924322; x=1795529122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IzbGVjgREwr9IrIK+xSlw1aYmIcPEF/XveJxpgUjaVI=;
        b=BBlemqxndtn1LGN4lASfmZWK53JwgEvRUfKb0TF8DXG+BE9AgftjnNwXyXDetVobUA
         btHwhojvdic0e+IEoGQvrSYgHcC857Al0GuA4DYTnUilPkWyDm6IsD96VjqgWW+4J71a
         rKnc1ouqTmSMqFsUOeyxJ33ziK8iDRaLNSy6F6xnj/OrG6RI0cHD8c6s0cR82b0QCLQC
         XPhVH0TfQYHt9xIwfEe7UM/8xUI/LUIxNpplpDn5o7MSSKpIBkdx0bs9kxHAaRAsC9NU
         0vWweGxk5GyF79U9zM3LAKoy2ma1vvZvOA85n0fcq6hdnm8pgMBzb3Sgnq+wYpm3d6jX
         mmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924322; x=1795529122;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzbGVjgREwr9IrIK+xSlw1aYmIcPEF/XveJxpgUjaVI=;
        b=yLs31idSrjK3TA4glKWNc6BNfnCNIw3ggypNbOgB5njyMeUMGTJ63qm5LfTbS72yeo
         IuQdbPpuSlTtlD7dqSdV8zCb/abDZBfQ6InEBMLhsr2ZVqDVgS2O/1DBOjCr32z/Xjfx
         0LnkiAbca4NQ+CBCoiDDd0d64bUFhG1zPs4jKCkUJ0Hx2x7JmncMKYhgG6eVMqdSikke
         nGPKgceY6fnxyBl7fgU/bSDMnsZZ85IbL7ejJn/d9x2hpm3iQCZieZcFxi9K9c8Z8yMy
         PqppLM1CY2dJZmT9EpvaI1gZtA+Yt47zhLl2EU9f9ZzFTTH6maCAc9YpThRWtMPlB2NB
         Nijg==
X-Forwarded-Encrypted: i=1; AL+hErHr2bkWKsWOzymc0RJWedudoz8hv82ZJmmcHnCbUsa3vT26wHHEcxDmPDt4aPs55dXhZX0VOiOjlsjlWZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NTjKp7CXs8oapEU3+aL2rP4JxJX7ZubiQHHbH3OjZ4HqCOApA
	pT/SHWGe5y2CA22NDd/u2EHjnmDu2YfX1BFLjyioLh7eiqgnKWmjvY70vHxqOwU/DjiqSYvcT22
	HCDjr
X-Gm-Gg: AZFdTZcm9nAwjm0PexYVYszvtb3xtTHk1IkBu8qYiVS/1jkG5udYhRcZMoQpVSi17HW
	jQ/gS8/nO39KKcWsi6UdPMZ2cfnAA+LFlb3/Vgy7TLlAEXcCNX0MO483jC3bFuykUhl6ZRVOT57
	bUWUhF4eyh0573LhgD6gwoGk09cz1tIMMpcsrc/vsJhUcNCzN/fjryaodUAcZb6gbHDcJJyYy9i
	KWtNg3B4fCr4KMchoBZujbSJkbER8Sj3c6bZ1G0RyNXNqqSf00kS9OmZ2IM+3LmidQp3gxptr0e
	qK182NBSQ9itony/nF0iBpskdI6GvVd6aZzogCJ5ySdherIyWrFA22Hq+VeY/5qsajm7biIxfhh
	8dYx30mfZ16CxWytbTxgrtVkPyGWKGlC+SV6bGADJnQaZ/2KdDE/pQZQJatAV90vGWFRV27QAG9
	ZJbY6mavy6PXBy5mqLWEtfoqQi4WlUhciZ3CcPDM33USJU1uTs1rjrkR34tKQn2LBD78iWpxYCY
	SqL0BSCx4BkdmUGjaWLJO2LkhAymk66v5xqlxMUcJvu0MxktE6aQkhg89GGjM7BEZzviLty5qX2
	vxu77RVdDKixu5eKzl59e6yNCl3cdlKJLL5dN8J50czlRHzsglvm2k3ic2KLk8UQwJzXXaDN8LA
	pX2EEPbnZw63w5W8g00GmWOP8jSdexTDX1CM49/Ux4/RqoqS+/2PbmasCRqY=
X-Received: by 2002:a17:90b:4d8f:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3b1b0a1ef17mr12600696a91.29.1794924322403;
        Tue, 17 Nov 2026 06:05:22 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm4292931a91.14.2026.11.17.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:21 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH v3 3/3] scsi: mvumi: flush the event work before the host is freed
Date: Tue, 17 Nov 2026 23:05:07 +0900
Message-ID: <20261117140507.2098571-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-218911@kernel.org>
References: <20261117134227.2077013-4-yhlee@isslab.korea.ac.kr> <sashiko-outbox-218911@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The wait is real.  An event work that is still queued or running once
the interrupt is gone can only finish by timing out, so
mvumi_detach_one() and the mvumi_io_attach() failure path can take up
to 45 seconds when an event is outstanding.  The work items run
concurrently on the per-CPU queue, so that is one timeout, not one per
event.  Without this patch the same work runs on the freed host instead.

The APICDB0_EVENT after CDB_CORE_SHUTDOWN is not new: without this patch
the event work can submit it at any point during or after
mvumi_detach_one().

Both go away if removal first stops the work from issuing commands and
drains it before disable_intr(), so that a command in flight still gets
its interrupt.  I will send that as a separate patch on top of this
series rather than respin it.

Best regards,
Yehyeong Lee
