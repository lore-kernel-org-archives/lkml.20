Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E0305E3B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433865; cv=none; b=ryyi2BBcxmhkbo5aMHaNgxWUgs5HT7mjhxpNrYJuQZPqh+kA++xAIAhhRwjZrUswcnXIZDAC5s49HKUtpZGX8t9bqxZjOM+23WWnW5CUOXFT9NaRMxJvMRh4LL4WE0jJUeqQYMDMsXvpYBdYxnZBms/PsChxgxRQEIR8jt1x1w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433865; c=relaxed/simple;
	bh=/UEMaY7twJnmiCXA74bC5h5NpK4IyD/Ab3YfZF0J3mM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cang7F5CAP5HLQKW3WW5wIqCMkh//k/fozdD733xsYGSE+4uA1f2ttpJzZ3MWpbHuqQ0hPrlGdc5i1AsFbCiB8II/0ns8DrmBGC0IGY7Ras2b0qQxBkuOKebLNOu6g4rww2Q7IoGvv7Bk5KSoMIVk7XQIs2dwiRfihBbih8NGZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIJEb/xq; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIJEb/xq"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90e92b99ab9so33732106d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789433862; x=1790038662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6lvqoIibEREzr49NvqIocAukK1oV7HubreMb9a0XXw=;
        b=PIJEb/xqaZu/v6YSDP1v/1VgtwKHoMJhuVRNWxpl1zMh7PP+yeSrCNWq8113jPPa2s
         YxO2WGJEipgi8+TGxko5rbtyhtVbqrsU2/BudqznR55fg2H2+4iVp0vPzQa4+8V7oK6q
         ny8kPAn2LZdRpixgO5oYpNSNK3mXnEZSLZgWl5wZhgNzmRAc01zd8Sayc1ekKU1/Mm0P
         Se5O72RZm2CB+nK+sQCDTpf6zibUD/V9tEgRSI3naJg81xnFDSed3nqZmK2x7ag1YQgY
         hH83zuJ0Ymt/RdQ0pjI+Kbkb/+eWbc3zvgslElD1VrA3kOfQsarstBeoYS+meH3OD2Lr
         iTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789433862; x=1790038662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6lvqoIibEREzr49NvqIocAukK1oV7HubreMb9a0XXw=;
        b=OptHW2S7xrTiEApCR3eQQR7tQnBos01dQkFLZdYd0pD/rNyPRp/ZVurJJCN+Qy/ECN
         joanorBabASR4dJbCTeLIs4QKfiTmCETKUlSkDdQ5j2VVvcNWMNb+Oq5tUZmSeV39E4t
         AHSc5bMcpv5Npm7OxjClQvnqBdTG/mE1TIONcPPr+26Pw6TRLhgRw126C3dewvHmB50q
         W1QH7+4NlfWYN1WowwJLpnKTUuMk0r3ZfCl+44OzX9KeGFMnOT+PsZEaGC8kpA5bj/61
         YPvCjr9bWlftZrLP7egaI5REfyL59kZYplXULq+NvU9hbrz+mk/G7ncwgQcH/7IRuNn0
         qoKw==
X-Forwarded-Encrypted: i=1; AKwUvBw80qbKwUXp3+u+9lnSw/L/vxMBDxDw2ZFg1YNZDpx2rxPDsKogAPgqiWGc0FiXW5NToFqXMiKxQIgWbmA=@vger.kernel.org
X-Gm-Message-State: AFuF++ml58mfDIqAgTqYqFrnYIsrn169XUlVDMu/7rdQxzU9WrynbWZe
	MsmS7NbJ+4o8FOoVZm7H9e4rcHeGk1l6FGIO29wf8liRitJzB5tdl8ovRDc/nD0=
X-Gm-Gg: AYBFou26YSh24VrnDAHEuT/moXeivSCK9Ya+l7fXptZr97DeoZyK4kkRq3aT9Rsv69/
	l3hmK1joEzUN7aaYT1ykL70T6GwXrGmdJyKFTPuSd8fNAvY0XQUxgOJZ+qCpOFBRLsSEK9sg/k3
	I9pVFYGrymj8NqYoY4GSK15IKfIZlo/Zpyqqn3ji9qD+kzKxOlm+8bsgf8x754Gs7d3hJJSLA3x
	YxEyxO2ruqbCRq33+nSDBphrT+DBRr4JHDU3mIsfiXyOYXDzQO+r9Hxb7T/vbF3xO5mcOXdTPr7
	+xbtnGphxanWFnbis5J8ancuwexBlKzDcKPDwygy+w8C3Ek3Aix2uYTnOwn5OaeNeW2Jl5qKO9o
	ZEMUKaETcerKPJPewbfEjJkPyFku4DFafUYW6gXji85roIzmt2aZXmEMvhJpK/NV9aMgnSFAecM
	1HMozyEWiqOO+kBweBycQuZjB8FW+xyI4aQlCaTg6ybzNeaa1NGc1AJVglBK2zhVmBzHRDMl4iX
	S0XjEP2RhkBKPEEZCbKogXXizFS/my+yVVFs67IywF5XMHEJwOMM9nBN22cVlB9okg1+z2EWLc3
	DJtlmxcwZQqvcZn23hMUwiOaikX+RFP0XUNM6gtZI6Ur238Gkvz3zjpN2oLTv/AKcpKpOQ==
X-Received: by 2002:a05:622a:991:b0:530:42f7:4ffc with SMTP id d75a77b69052e-5310d027297mr84536941cf.45.1789433862242;
        Mon, 14 Sep 2026 17:57:42 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm115972951cf.16.2026.09.14.17.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 17:57:41 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] scsi: a100u2w: Disable the PCI device on removal
Date: Mon, 14 Sep 2026 20:57:32 -0400
Message-ID: <20260915005732.52332-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inia100_probe_one() enables the PCI device, but the remove callback
never drops that enable reference. Disable the device after releasing
the host and its resources.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/scsi/a100u2w.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/a100u2w.c b/drivers/scsi/a100u2w.c
--- a/drivers/scsi/a100u2w.c
+++ b/drivers/scsi/a100u2w.c
@@ -1204,6 +1204,7 @@ static void inia100_remove_one(struct pci_dev *pdev)
         release_region(shost->io_port, 256);
 
 	scsi_host_put(shost);
+	pci_disable_device(pdev);
 } 
 
 static const struct pci_device_id inia100_pci_tbl[] = {
