Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353927;
	b=J9jZcfyCbplqu44wdUlx14ygrNwvQHc+XuamZp662iJ0cYph4CrY7EweNhRwcXg/sPjI
	 108qLcSrnFv/7xaMIEMpJh/ARxJTVntetGFY1n7whaapGa+nvVbZXNEA1x7LvOFB1fuRM
	 Gm2S7N0ZOgbDHmEcg5hYyhfmTMAODK0NWUsPYlaQVmTvHW8BtIhUnbf4j/P8iATJ7rGKU
	 bY9FWoctzUt4NoVt+Re1ZWAQXUePny05aJNH8EeP/U+C9yafLVaLM9uoKgTVQSWxVeczV
	 NJb3bFHk7jU4/0FWDgnNl+vBs/w/urqVqPpQtP+hZ+MLoCuIhvCBchFhEfJ0yeBxtNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8OvR1ocNYoxVGdiSd9mbXYYz9NdCfD4eLGs6i6y4wxw=;
	b=Qijc20PCAPyLBzn3poXp9tU7Y0pOkIjxzjXxQBLkjexazKwa891ly5oLYFxKqJED/kpU
	 2fcdki9pAM7JffileccMdPqwm5XWPqTjiyum5+rvbFs4/v+TGZlASTu9e769j3o7inbaY
	 AxghnHnWjhA0nXelJEytBujNeZVj47k7jaSXa0ZOIl39krUk7RLd0a3XHlyA+h+1C/oZo
	 NV4ScwUIWk7tZ4/aezHKW3c8MkH/ti1d1tA8/ZRfuzo4yT5vqMN8hiByFNKk2QPK/oz1E
	 82zK+WolVFlO3qOI4FbybmUjREYmjQWxn4ahtxMu/Xm432W+9bdoOPO5AT5P5UZvHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhiuHwyD;
	arc=none smtp.remote-ip=74.125.230.74
Received: from mail-lr2-f10.google.com (mail-lr2-f10.google.com [74.125.230.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C4606A339
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94C4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhiuHwyD
Received: by mail-lr2-f10.google.com with SMTP id 38308e7fff4ca-3a88780168dso4413711fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353917; x=1793958717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OvR1ocNYoxVGdiSd9mbXYYz9NdCfD4eLGs6i6y4wxw=;
        b=NhiuHwyDait8PMOIBmp97KzB8xYjOg3eOUWVWN+6UsNvLwwsHUlO3ocgjOlBd/fhDz
         4EbnVIby0oaDb0HEIPA3+bR71wb////7vF2oa/HwX6DWbpQo7VDcjtPCgXXWOJQRJE/A
         cCCMY8sGoEplXDqM1C8C4q+NdJkuwXCKdVCdVIOZX2a+hfGfR8JU6355+1/Aat17p46s
         wh7PzYHoAyQj0VPxQCqDR+Wq07oDwxfezkcXR60dvEnDlQf6tto3M32UgyySY9bQ4SyW
         qNDeRrUgIidVsUuoVKcN+kknXR7Ggj4tz1MgrN75X87wuxAtHTDlmVRaof9GDv9nt+EZ
         ndyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353917; x=1793958717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OvR1ocNYoxVGdiSd9mbXYYz9NdCfD4eLGs6i6y4wxw=;
        b=jRU67c8Q5AiFPI8m7xcnDMwr5bThDDqaTFrR83Cq/bNMcW9LrRYnK8sowiQRrw8lhc
         MPhjuH5M1T3iGfFbuVceI/obme4PQ96KKOCUIbQbQvzYHSTtoQ/6D68SAHez6tSij9PI
         tyLTusmaxIij2RXT1LKRneM+G7m9RLDv9L4oO3mXnqqooY9yB0sI8l/cGLih+ALXU8vg
         4crlVUil39+Xjpx//zpgbYUZh1tFQRISKst/utJ7vF6JS4Mc2GxAzSlwpnJEEDgtKiGR
         L1krjpQZvSpp6dC5m/yEw5znf583rV4nZIoqwA6EhyvJvufD+ai4+s1D98pB6dMERcK0
         FX7A==
X-Forwarded-Encrypted: i=1; AKwUvBxDdUZchhYl5K49Ax/9uFARHZVVI2r12ez/ChkyASnRb7/frJ+6pDlPZeJB26lXj64DxC3MW15lh77OsDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL42y5rT1NxSiVvTkOcEPgGorIkKiNDajYJSRIJIUrzZsWsUxAb
	KABN1tTRf5hjEXM2Q2cP++Lxyp3iDM6cMu4pK74PcChBdSqcydLgfgSE
X-Gm-Gg: AYBFou3aB8MD6Pm+NQ4REU5kLurRTlAoOA3QO/dhoV/HGbB+sx3x7m4+zeQGsV2gviI
	bbAoWoYXdfCCGL8fejajMviJQTZ7FyEDRVYgXrqzpd9SJk87uI97iDPcXd23AIJTXq93JYcB+dW
	hKQCWJuSi2wqGaZL1pwfPMW18QmuTh9sKACxeF/nM1VHSADI7chXyEGpEk5YYfkpBknD1ELCLct
	o7HxuDwF9/nJhMcrK5r0hd78BKXZxjC/RD/A94m1Z8cG4d/3+kwUt/Vm3zFm6RxvScuJHkyZO+v
	d/0RM7wK6iU8oeh9i3Ra2gWgDXomDXX6Rcl1rTTX3OyTpyOw6Ent+E4N5YLPmQ6OH7azmWPP7/J
	0WyTtCJz+Nem5fIXCjj5O36fZdCwYW2ZK9j8IGJfjeNpmgvl/jBwOwxM8sXLvQWYyH+s0NEaA/U
	GN/NhHm2AHLy6XcTZeooTKs8Uoi1h4SZejjUTrB2cmhBNiDpjoja9VBkZxDyMRnRfRtJoBOE07r
	EHCJVh42gCjSPpqo8HFHzfyXsEEce6hQPcey3htTJ8TqMDxQj3yaJ8VO+tuoxRI9Uk9Isz5RoFB
	vyeXiOcYOpmFexOz1bUwMLuWcTOqq+ZxRiM4c8yAhXrYsQ==
X-Received: by 2002:a05:6512:b18:b0:5bf:dcd7:8644 with SMTP id 2adb3069b0e04-5bfdcd78799mr373966e87.53.1793353916631;
        Fri, 30 Oct 2026 02:51:56 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd9c3e9c2sm270580e87.46.2026.10.30.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:51:56 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Frank van der Linden <fllinden@amazon.com>,
	Jessica Yu <jeyu@kernel.org>,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] module: fix [e_shstrndx].sh_size=0 OOB access
Date: Fri, 30 Oct 2026 12:51:36 +0300
Message-ID: <20261030095137.81695-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Alexey Dobriyan <adobriyan@gmail.com>

commit 391e982bfa632b8315235d8be9c0a81374c6a19c upstream.

It is trivial to craft a module to trigger OOB access in this line:

        if (info->secstrings[strhdr->sh_size - 1] != '\0') {

BUG: unable to handle page fault for address: ffffc90000aa0fff
PGD 100000067 P4D 100000067 PUD 100066067 PMD 10436f067 PTE 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 7 PID: 1215 Comm: insmod Not tainted 5.18.0-rc5-00007-g9bf578647087-dirty #10
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-4.fc34 04/01/2014
RIP: 0010:load_module+0x19b/0x2391

Fixes: ec2a29593c83 ("module: harden ELF info handling")
Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
[rebased patch onto modules-next]
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2022-49444

 kernel/module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/module.c b/kernel/module.c
index 7f3ba597af6c..48be28a3af2e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3035,6 +3035,10 @@ static int elf_validity_check(struct load_info *info)
 	 * strings in the section safe.
 	 */
 	info->secstrings = (void *)info->hdr + strhdr->sh_offset;
+	if (strhdr->sh_size == 0) {
+		pr_err("empty section name table\n");
+		return -ENOEXEC;
+	}
 	if (info->secstrings[strhdr->sh_size - 1] != '\0')
 		return -ENOEXEC;
 
-- 
2.53.0

