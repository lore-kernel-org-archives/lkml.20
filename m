Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891809;
	b=qiQ0mx9KwlqUodKmCRy3Kyj2GxmgoOT1tAmyIWXar5+x4RYkYJqoLgrFVa39JXVQbJoB
	 1asjd2mGrJGc0hCmQK4maMcvsQmzUbVAhl7vaMinCBrhst9lWHFLnkft8lUP42Uk1Iglz
	 BLXbPGVmn3f8MROTSOrTz8fzWBr/jToZrzlWQhAIBuYep4ZvxkcDyfCq/oxLgorAtlSMG
	 ltXoudkOwXQDnpETEF8C4Ia4Kg49uu+f1popKpUKShKNv3GikGays5oucOXrXgeXlftw7
	 tMpcdaBF0JDJNY7jjN7GfvOea5CGKMnX/jDgQemUX44VYSg0iIlxMNgcC+7agN/6m2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=A1+EzI2C4rR2P4U3wS3ZQXdm1AB4fWdiKiG6izgArRA=;
	b=a6slON6KqJKnwr6Msaq9XO0xvEZ2vJxhwVZqDaf3O+Xz8/Qd71LjBj37y4QIiuqNWPfQ
	 OugnzAd6s7b2rbfA+baTnionDtmwdU65St2D86+jzGtqyfblo5Fb4SLKR0XfVnIRkgh6t
	 wB5wHsYXVb9NNEHWBUV/GPf+jSNFZWyHjrjCV7I6gW8iYdPsRnmAynRyhN5ptnp203BlO
	 /BPIXviSKa9mARiRAeAnHWR0Z1OfRfgmJR5tncH89yLrO+3oFBehLaG9QfOOJ0tkO/NXf
	 3MPUwa6nwScot4p8kPAyuHT9D9zHy3ZEird2JJKDn/cPotTfJtprQmhTnuoxZ0+qEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NxVm8+jp;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F256606D833
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F256606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NxVm8+jp
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53fdd2fb171so21086671cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891807; x=1794496607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1+EzI2C4rR2P4U3wS3ZQXdm1AB4fWdiKiG6izgArRA=;
        b=NxVm8+jprjQ3eZAwrmRvkKI8KS9OU4vNds4h06Yv7rMVrb7+EOemFbTznPXDsqhPXP
         bdO2A1VzWEiQzirKvFsPq1Lv6FXDl8+c/z3u4nVLcBGj3YWI53jUN0iqKSknDuW26UJF
         RnjbiE2V1zSLICH7I0DiqKaidCpQYE7VS7UCVtZyJHD/WshduQLaD/WTIAixouqfZHR5
         LFEVkqSg6gFZjbwFEaRVi5ne+DU6yzM3Nrcdx3+8AxgKrW6CJDIH6AdGwNhjPykIwWdm
         ICkM99YszXC7hdxb3MfU+cYUG2rd+HH0rDETJsNHmhdNqmfmkkmKb0pVdUE7v+Wbd7WZ
         nzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891807; x=1794496607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1+EzI2C4rR2P4U3wS3ZQXdm1AB4fWdiKiG6izgArRA=;
        b=HVtyuzJ5VWtnaRc3jKB47pOCTuzwmonLDZ9L2fJzI8/ExFPwPLJYjNT+rRadvyT+Eh
         DTc1vLA6QQ7zATCxCsQLYqDWy1Dqc9ne128GJ2Jgg418lUYAnDtQJT1gu/8nsfIMugBE
         IIaIA4y6Le3iRYsgsrKP9aRXpn1ua+34SDzh3LxDXkFaj2xqArkpZWIEkPyuxnAgLasK
         xv4MRGFRzjJt1HUV4p1+eaNd9mvbevn7iBd574oyjSg+ncGITAUBo9hLtMk+0vKXFIXv
         x2XHKFJC7EZFhpgG6ZI0lld37WZ3n0TezuRPsBCRaolJhpp8wmlVQTyV1ORFm9usFi63
         K1JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfP0X/l3oLo0MJaqf4efJTWR88Z0oI5kJmC00+cFUXlDi7JU3ywwW8BS+NgVjVdVJQ4yp3J1VgGFWt8Gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XeNMGzU5w1rWlpGAUq4wym4IHDLZ+QQnVlrqvZs7THhuQl3uP
	gIwriCP4w7lr216njZIsDdAmJ7TePq1n7WT/4hHu8k4BPTkLitq7D82yMSQqCryb2ok=
X-Gm-Gg: AYBFou1xd88B36izQn7xQJdc5XS3q1fK3gP3HqGqedgYigRSnOnn2ZgQ6gLjfVoHlON
	9pCRSeaeuLWYuXzJmbuZd4abOoxNtgxtSXEOX8BqWqdc4rgWANnES8MCu/uFM586j2DBANEv10u
	CQ5kl3wbyEf89rtNh+hw32bCJWKXz+w1NDLrAGD1jTvp1frayYdgCJM4RS3UPOtbOq4HlO0uzl8
	E7rFMxxiKq9suVZLjo33Hg6YGuizwz8ITxo3usiEE56vmfGMshoqoXW7NvTgBOnl1LcTQElT+DC
	IcNHtEjPA7Qsx2cOA7Jpv5Xa4ogL6hypj96pfYt1MjPac+czwuM+Bs7Ze9k/iZR/fYLBuaQX4SN
	UTpRFmcLT2W4b+hl9z+RccYRj6NFTvbpCLyys8I2A1jos6/TBoQd/NBP3FckS6RnBhaoN3CeWEQ
	UtzZtG9epHgn6Ea3H/nfw7Cy/eFELEvTe8J4CnZHwhsz3nKJ6Pa2V3Lz8ToC3WQiGELTkR+NVK0
	1IKJ5L/4ZqPhixnga6RYYsiD57dmGojwc4ODiMVwOaPjRe5os93oZWY/+VbYJpUNCe9kLAkCMGS
	xLAcq+4SuJXbcHIlTJrJY9mNSObCqAi6wt6S5FTh0YWhR16YfQXoNVhbTKTDYS3btik=
X-Received: by 2002:ac8:5d14:0:b0:533:4da1:b5d1 with SMTP id d75a77b69052e-542b659318bmr320363151cf.23.1793891807168;
        Thu, 05 Nov 2026 07:16:47 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c4dcddsm53851701cf.20.2026.11.05.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:45 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:37 +0000
Subject: [PATCH RFC v3 45/90] ptrace: keep everybody off an embryo
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
Message-Id: <20261105-b4-cells-v3-45-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=1292;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FR8qGkDwydJpoGvuCIpFwA9/kCan7AywQK67vdaDdYc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFLjGaUDAQB/Qp822KzeUWwYbUGb/meJVKZg0XfSemj/I5zhF01GSoh6Yo5A/qRnIz9m2EZkAw3
 CG1uFxhf5JQ4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Between its creation and the end of its exec, an embryo is in an
intermediate state. It already has the credentials of the cell, and it
holds files that were placed from the outside. But it has not yet gone
through the exec that turns it into something the cell is meant to see.

Refuse all ptrace access to an embryo. That covers PTRACE_ATTACH and
PTRACE_SEIZE, and the files in /proc that are guarded by a ptrace access
check.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/ptrace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 8024d80f82e3..c30e15d39c41 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/capability.h>
+#include <linux/cell.h>
 #include <linux/export.h>
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
@@ -324,6 +325,9 @@ static int __ptrace_may_access(struct task_struct *task, unsigned int mode)
 	/* Don't let security modules deny introspection */
 	if (same_thread_group(task, current))
 		return 0;
+	/* It is not yet what it will be. Nobody has any business with it. */
+	if (task_is_embryo(task))
+		return -EPERM;
 	rcu_read_lock();
 	if (mode & PTRACE_MODE_FSCREDS) {
 		caller_ids = CRED_IDS_FS;

-- 
2.55.0

