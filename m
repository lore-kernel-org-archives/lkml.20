Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D30239068
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791343078; cv=none; b=nhcxBVTw6n+HEgdyAKT37Bk1rcriBMpM/NHSuqONMNNb7c8dVB5EPHfqyAJ5cYLySi31r+21Ro3lRZZcIr1bkk9zT59yWjnSpZgRmlXc3TXbEE1Efo9oUMZTZtmR5bk3V75PCivmzpSBvoCyN0wOcx4xQdI0z3cWqMfgOxGZ/UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791343078; c=relaxed/simple;
	bh=ds1XhdHLj5dnLNInfOd7LIrtEsMtnzYuVcsSLS+ymB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYu0W8gG0yvtiBmFKweDu55djmDkW0LbG4kcRB6+RIiod3PhzmxC2woBFci2GlrT4cOc/m2P8/Q+N6u9nF5mbEtjbMO0ESUAZL7miKoUIV7bplHeReTczKSSICpPIBLt7VN5T59djTqlhK2cGb7KsUCopMDrnnvmwUCvYNdW044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=mQWdPPHK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="mQWdPPHK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a813079a55so725617a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791343075; x=1791947875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ds1XhdHLj5dnLNInfOd7LIrtEsMtnzYuVcsSLS+ymB8=;
        b=mQWdPPHK3yuPtBL37IWIVF1Z7zMDzmWaPYFk7XMo7GYdKVQw9pxkF2opwSqc/03JzC
         tZo7kWKv1ATlsEnTXxlR523X4s9F4PRFUGnCGlWiZYszNj5Xi5y2E4d7ngF2sNMfYFt+
         zzkwCKrZE4Le9R9h2OAomG57NNZQGRlT6CnXJLLf3B1uVgOWxvpKsQUskkBesAsWtHc1
         bRzodWEUo6oEiZl5feK2NImhT3S1SclNGpV/NfRwjjB3JnT4lwhi5Pwe8WUdilAjdUjY
         0ugamQ+EwDh5ZI32OUZTDY7kpSxJ/5JbNL0uXVgCRJ3obASKxX6y1iHWcTJbZOVwCWGB
         Ll5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791343075; x=1791947875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ds1XhdHLj5dnLNInfOd7LIrtEsMtnzYuVcsSLS+ymB8=;
        b=ZvrkCNYMbIjx26tBGWK7ibm4T2xqp6ACqQppF4sI2z3HH3CCHoyA0lfFuDB7zCInwL
         PQw/5hL8LVKcXRQ+k3201q/gOFZj971g89gIIQ2+YviTIq8KZxE9EYbNYKU8WkvR3Sq8
         lzWR718aofDREyf6dZyl5fbzn68sgYPoamQ1DvVbGeEtm6zqLprIoMOytuGk6cf4F+YF
         e22kAJWh5fAtj6IPs1lkGW+VmiZQn5cKqN4qlwBeR035aQSYTDX+UHHvl0srAd5kbsQc
         8vnFoNmltIN6KLj4syzNSJymW2BQnMLQZarzCs/tOuGgMfjo0jJhSeTsddb0cD++uM0O
         cccQ==
X-Forwarded-Encrypted: i=1; AKwUvBza7QVZ55LAwxBHTLdmfopIMdJ8kcvGqYjV+wAnBmna1H0BoySj3544ulUX85TFsXaSDFd3SQbn+y8wyIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkE8YokJ+ZCA1MZB6mLKKJvGtrx1XaV++WnfSYbHJLVr/dY2sR
	y/ZnF1D0FY59zTYSNNgO3TEAEJq8P0sQjv8SNwVE0AuQYwtPAPERlTEXW/xpP3Ttzkn+yD7ory5
	dLw9RrgQ=
X-Gm-Gg: AYBFou0VuT+ExTpaTJ9tZWqSBmpwi/MOzD3iztp8vcl0xIM8Wh7L4EKk9UgEnQBlxoz
	E182bLGQ4+pSuEchj5lY56glEyv2dxfDF7G0KucNwHkpwthq9PISfC/pk18bXB3eUpQw1HZ+cOd
	nAVeHu7roIbQNNCybfdWPeNIPKCWfhZaYs4dmYdab8kQ8fmqPlvKB8Fpqax/sa5U77uEJS6XY1B
	efD2ceDLquvKQznwbZ+FT0yVH2JED1/gjD005CKs+EQToxQcRA3E51/nzGNTd0pb6xS9trOStH3
	ao0CCpIV7mIGWZVXpAK627zcyI5Fwmcw8OrJmcN04Gb9Z7c1jUvZdveUXIi8fmmFw5H4STwrXLd
	UUhR5r8j+J+lTtmRyZB82a9sVgK4lBW8G1qQNT//YbSNXqRT5xPowc54Xr5+wRvo8LUW4u2aVWO
	U39jXvxs3Nb4JyuSXI6D+Hu9ajC7TlTXvitW/KoGOPEPx4zjqIb76II6dj67AE3VegC+by3yMIg
	cI18Q==
X-Received: by 2002:a17:90b:4a47:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a8a1592234mr637442a91.41.1791343075512;
        Tue, 06 Oct 2026 20:17:55 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b17bc5esm2363382a91.7.2026.10.06.20.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:17:54 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 2/3] scsi: libiscsi: validate the ITT reflected in a Reject PDU
Date: Wed,  7 Oct 2026 12:17:36 +0900
Message-ID: <20261007031737.639431-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007015842.634893-3-yhlee@isslab.korea.ac.kr>
References: <20261007015842.634893-1-yhlee@isslab.korea.ac.kr> <20261007015842.634893-3-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for looking at this.

The reflected ITT here is resolved with iscsi_itt_to_task(), which
returns a fixed slot in the static command pool (session->cmds[i])
and is non-NULL for any in-range index. The previous check was
"if (!task)", so a valid-range ITT was never rejected: before this
change a Reject PDU could already drive any pool slot to completion,
in any state, including a fully set-up in-flight SCSI command. This
patch rejects slots that are free or carry an active SCSI command,
which strictly reduces that set rather than widening it.

The window you point at is real but predates this change: in
iscsi_alloc_task() a slot is briefly ISCSI_TASK_PENDING with task->sc
not yet assigned (freed slots are cleared to sc == NULL), and the
allocation runs under frwd_lock while this check runs under back_lock.
That window is unchanged by this patch and is independent of the NULL
task->conn dereference fixed here.

Closing it is a separate change -- e.g. assigning task->state last in
iscsi_alloc_task(), after task->sc, so a findable slot is never
PENDING with a NULL sc. Happy to send that as a follow-up.
