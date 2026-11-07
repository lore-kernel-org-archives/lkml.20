Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044230;
	b=BEgywKzl+BAvKdhMpTDgruUxlh7OVSpxank55MDNy1WFZFWPJHOeetEcZlyC2RXXxk6J
	 l70gGKax1E7z2ozMrl9UfHuADzteD1cATYIA47a4169SjkDwP7X1V6Lu2cW46ot+ezids
	 I8A6fydvFtNMJZOm8KtkUNCaXNu52yl/u8QGmT8PbOieQUUM05XIoeF8uOiOPZHHhrYXt
	 /vLDLswTflVXUlp9M9b9HQJPf3AjFK5poqzyqWipBMUqbgQcKGDAETjqxP+vXIAeLmdaV
	 //nGrVD9EUqi2WCou8yUQP2Anv3OZK5CWenMJ4V3gnYXWyqBlIlFMEMvAA2G3TsJY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fVHsi8lCg0/0ZtNtH1yf3pI+VoYjlz3HfqQLVjaryGY=;
	b=x1k3fF7vwBzM/NvBcPdT8KdoGS6Xa1z3bq4wKRYeZMBEyllSaAL8erfBj/AhH/P9cuOH
	 SyNFQdxUfvVD6w04RTkmIw5iFPByXE8/i/thqFSkQdxQVj5eDShx7e+0zRHaVmFVgLrVa
	 DlepCMfc2bkkWSto7VPR/6qeCy9OVfPkuKfGk6gptG1NIwWnMt8jBgznWP30y1J3O95OQ
	 Yj4PmZBERzP9CWkYa4w0r1pV5gtDm+7nXtw9nVWn14dA65QH+yyIWK40OZPwMmLMaqHyU
	 hoZqdNONwWKiBo+4bRTnEjH3Vi4f/5xgxylh4wCzVsOV+mtzROq2Dg9BNsobiCMuB9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MC0D26tM;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A189606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A189606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MC0D26tM
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1882297eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044229; x=1794649029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVHsi8lCg0/0ZtNtH1yf3pI+VoYjlz3HfqQLVjaryGY=;
        b=MC0D26tMo1dF6oiY087rsv8RHCWINI1ymMusPZfJN6QdytA9fir6u3p1eW/eQuJjIm
         Osl1RmCXzMVy4ywq7Yeqr15rZAUOq7WBKwQjKR/8bYQ7+4taak71sO6+EVaB47kXDutd
         0i2iHGxilHcN/tZZHdZxmZA2EfmPLLj02y5MwKvSzgve89gXBWpkYfyOUrVTXWo/kH5P
         hbrevLXeAowCQmd7spCYgiCnqrSLAsBHFrFgxkmtdTX+H7RhRJTS1HaeXRvW6CYTaAV4
         X5Ps11jBWrPOgrUlTVNxdr6wAuIEER4M4ZBPvsO94hmvWfekFoK0SJZew8xuFeD+OdPv
         FTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044229; x=1794649029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVHsi8lCg0/0ZtNtH1yf3pI+VoYjlz3HfqQLVjaryGY=;
        b=vhLtJnkFey/Qizh5Yx350lFGyOtfJ+ls1UNxaLeuFw4oDtdRfZ7dFLmOaHarLMLvDm
         1hYq3IwlrYq1fkDumVGRL+xgpxSH7HbvG/S54wdXh53T7qp53bxEcVM/kPP7bmnx6gMU
         hN54FnKPT2UMDUeQp5GO+LW83dFWaRUEbLK6gvbUWp0WK7/S3QeQCq7Q1+XWXRaUIGLk
         i73QYNBK8+MdH2CpTphJh4q3CMnRXqjxpL2gG5sD5QNejUcaD81p8fwZ3bjPH2TcHT+1
         DNj7elpRN/r9Y80ruJAujACUu24Cd0wd280FAzH9asixOsxxFI8CwFSOq9/H8J/ZuCDw
         vPFg==
X-Forwarded-Encrypted: i=1; AL+hErG78+x/6SIbGdgjJaJ/PzW0rj67zve0rLbWuprhAe3qGaGwCMj5hd0YRJGa85aCeBKpfZ25R3g0ZUDvKeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YLSq9v2wB566GGYDqt5MOX1/3AQDJGveujt1GrJeIUXC5GnrZ
	C9oKo/k8C1SdIumwJLsX6f6La0qBPwuFFbQlB534FQL/uFxQi4IWwflB
X-Gm-Gg: AYBFou1hk5Dq//SqRyvuLinPxEvytMN408yXgM7/BpmggHCJQCVigWx7r2Ke1Fp3gtI
	790I7MHv1NCYv1ynu2XBgSSn7s8xIS9YM7murQUDoqM7k8iiMJ8swFvEAMFmneBXrvkIttgsya+
	7qnT7D/4qlEdsuPUVKhry9+Syixr9WvCOaclFIg1ylXDqh4Zn1r5BPGBnJEzzcoikgCpI6mKCGO
	IYCXTw2eaNOpSfCTy24O2yWeLkBhwIqrGYhZjufpD+XeJUuhCCCvIXxTT91u+REyfX7vtR9KtPB
	ya7CXsmgiz/NurAHwWLMC3fBerOZjjxWrwfNbZMCXM31uIa9Y9UdkLbwMYC9AH3D4pWGpQ4aTFg
	k8zyacSUhM2Ac3LRy/vU0PX4kH7Dbb/giKsP3aSawfaH31378azDxkrXj92BP/GvDC8sGoaUPLL
	Z3urjh6vZT9ERONa9tvl/3VnTyn6HTAQtiq6ZoPxqvjyPK+mL2X5zFsiS+qDbQqh4fGUBedcsOD
	wyyuokHcUirPPoz1vdt33dIQDMVKZ1phc8Iq0FGeAi0MTo2iiRRNY1Qcw6tvwd8XeCvvEQ7+ihU
	BIvf548yjOUm7QD2iI3Uf88bfE1jlXxrVdQ6o6hVRjHDvHO8miUAauoda25PxkUqiB4uJ7Qx9SF
	Ywe1WW6MuAZyBwTjAQ+OqzQzwM2HcnxSNvBHh8IgkYdBF9B12IryFo8QyXMw=
X-Received: by 2002:a05:693c:68c3:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-36f75440686mr8039142eec.7.1794044229528;
        Sat, 07 Nov 2026 01:37:09 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm14045613eec.26.2026.11.07.01.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:37:08 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com
Cc: x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	tglx@kernel.org,
	fenghua.yu@intel.com,
	josef@toxicpanda.com,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] fs/resctrl: Use open-time credentials for task move permission checks
Date: Sat,  7 Nov 2026 09:32:53 +0000
Message-ID: <20261107093253.62518-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Writing a PID to a resctrl group's "tasks" file moves that task into the
group. Whether the move is allowed depends on the PID written, so
rdtgroup_task_write_permission() checks it at write time, making the
same comparisons as __cgroup1_procs_write().

It checks current's credentials. That may allow a less privileged
process to trick a more privileged one into writing into a fd that it
opened. Commit 1756d7994ad8 ("cgroup: Use open-time credentials for
process migraton perm checks") closed the same hole in cgroup by using
the credentials saved at open time. rdtgroup_task_write_permission()
still uses current_cred().

Use of->file->f_cred instead, as cgroup1 does.

Fixes: e02737d5b826 ("x86/intel_rdt: Add tasks files")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Compile tested only, x86_64 and arm64 with W=1. I don't have hardware
with RDT, PQoS or MPAM to run it on.

By default only root can open the "tasks" file for writing, so this
only matters when write access to a resource group has been handed to
a less privileged user.

This changes the comment that Josef Bacik's "fs/resctrl: use
cred_ids_allow_move()" uses as context. A plain git apply of that patch
on top of this one fails; git am -3 merges the two cleanly.

 fs/resctrl/rdtgroup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..ddaf34548205 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -725,12 +725,14 @@ static int rdtgroup_task_write_permission(struct task_struct *task,
 					  struct kernfs_open_file *of)
 {
 	const struct cred *tcred = get_task_cred(task);
-	const struct cred *cred = current_cred();
+	const struct cred *cred = of->file->f_cred;
 	int ret = 0;

 	/*
 	 * Even if we're attaching all tasks in the thread group, we only
-	 * need to check permissions on one of them.
+	 * need to check permissions on one of them. Check permissions using
+	 * the credentials from file open to protect against inherited fd
+	 * attacks.
 	 */
 	if (!uid_eq(cred->euid, GLOBAL_ROOT_UID) &&
 	    !uid_eq(cred->euid, tcred->uid) &&
--
2.43.0
