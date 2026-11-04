Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769627;
	b=ccUKpYyvotXyUO/2oX7E8qB5t4GdJaReVKJTgabxCD0+ZNwsi2p5VgynDRxdCqe/6cga
	 knJvVmsCJbVi07k64NvmwnXzhjflZ1LOLbrzdTGYc2Zjh2qbb52s7q+TPAtSKGGIaGnOC
	 IhfOvWH3ToSZUfB+i6dUnANDxJoAiLOqQkL4dugT3BH9r5nSTLi9u+LNa47Z+Jd/qk1DS
	 TGJU45OBiTOpRxsa2j4nmylyhysWJRkdyeZpG+H9i6wmBUXUiqqy29SXdPQq0jLRa7fGT
	 ipjbs68Bc2CpX7SKGw0TgJTv1rBs7rQ2RT5jwgZPTxby4o9fm4R7NgI9KWZYLcWggCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID;
	bh=dkzEiqiH403slnnUf98tQB2VoCJa6NmQ1s1XzpZruY4=;
	b=kTSjSe6Dcr8w7YsydOx3Y0b/LtH4wL+5kAU6ANK7sL4Ud8LX38pta0733ZOBZk7masqt
	 zTdpLwoYjrD8myQwirpgQabTg1SrrGN/rWmJa7Q6qrjz3ntIo6ua+X4P/nhDOd4B/OeA7
	 6gabpKZc+butY8FpzGYXrsIfsD5I3ZA2oacFPzi2lOahjeq2PrM6btrJKImDB1Vv0YNCK
	 oldn3+60ZZ1eCVgOvW1ur0LRysGnK2BFCjCriCAp7sn6h13p3OMFh/JtQpuxVPp2y/Lc3
	 GSAI+QRTtRUBjK27hvWyTzr8/gvDpfixgIWQ7cMxwMnwQJoEL+bLCZPHLndgbU2hZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LBKHqbi;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22B606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB22B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LBKHqbi
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cad25b8b0so420350eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793769626; x=1794374426; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dkzEiqiH403slnnUf98tQB2VoCJa6NmQ1s1XzpZruY4=;
        b=0LBKHqbim1r29ndS41rtycCoCW1+57UXE85O8UDvVq2hXd/JMyS25+4j/Cab88X+NU
         ek+aKMW4U5C6TXOBd+vWvjyWo4bem4Uf21TsxAbvzQBxWAWGcx5N/57nGhwhbLz+tKcQ
         ZhIBgOAqaTtCvbL4yfhopKCOH0XN7A+P2ksp2W+rfpEyOm2G0qbal/jDhLJJWQJIFmyF
         GNwTXk4y/uoXwZOqSNFZZuSVGEJ2no6zI5hOgKI21mv1rohKu1UrRUc1Zp85//pQU8tC
         ol15KXJDpPjuogPIOATT8Wnobgp8baMobYLRMbKVExtA3iqsVLiVtKOeycXemOPFQ3AO
         fbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769626; x=1794374426;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkzEiqiH403slnnUf98tQB2VoCJa6NmQ1s1XzpZruY4=;
        b=TSFCVmf4eM9L2xHuBR8KZFxZFVt9mDhvu43LMkgn4ivbaM+F9fbKhhcDRLAArFUpnq
         PLEG9mbR6nUvMn5N5jgB/Sa/YsrFIUvxTOUqXrtWHBMPLBuoScxHhJUmp1rTahQp3k65
         BeDwB+tJ6B/0cGPAjaoxY0usu0Fv75N/pWdh5v2GTUUL49c1TB3l5jEYlOH7JeKUGaCM
         2KrUsx2FSsjAGy46/hWofhzhW+///l3cR95IjC4s/l3pgnsVO7YQE/T2rLXUApP/O1Is
         wEkLXZzErFI1i/gvHM6F0i1WCJfi4h+KxHbvJUGsCQEHF3D41fa9DyiUP2bcWiNkd6xQ
         EggA==
X-Forwarded-Encrypted: i=1; AKwUvBw/BDEQF4pZayh2HV/8UqO02Md8ZZUsNTRfmVO26hb/TSXO0xnXpu642T0zvTuCNzBasuix8vox7NvMEf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zIRYOmFxUTG+VMFPkuqGQAzTAvO6HFDJbphEvVVkGVsdvMvDb
	Cx+xyCEqmzNnHpYS/hGE34Ed4jwWyHWJHTSHSpztFKEvtbED9rQio/k5
X-Gm-Gg: AYBFou2tKy9BIQYoXxP1bz8dV+Q1gHCWDJJJ7D4eF7SBHZQL7PfTHEnukFcjUK56TSs
	QUHlwxTPc17tfF53GDAYPZvbWhfPs6VA/qYRp++8eMuFHbuAE5qcmuKxyPRMpl893Ko30HKGtwm
	sjRtyRt+LLw5vWKuOSJ7ifVX4Hc4Q4J9Et1ICxF5YSchwEjgDWgpRpAkk7IH0t+m1xn7LYl8y/j
	13nZms93XbI6gzHz3wdOhaLPdR1TK1oH+OYC3cdP6mli6mtAsToHNgeadPyjbm4dO5CwWan4CIX
	vLorkqgfNXkMwjc0xtyrwaxvaUmiF6VdU+BL7Jyrhfg8h3agaUlEIHCop0gCgAzyhxWv8AM+7mg
	moaLKMpDC48roOWNoNVeBNyc13phfdKH8BUREHP4IMh60nFeL5CwaWHq4c5e2Yo9GSI+Lp7SUen
	A5r6blytJTK3e+5sPyNvsqm9vtJ1OndteXHxfZdSS/xTs7vF6kuvuAjn1kF9RrQ9XQ3emqMMiRg
	tYbgSreLVvjykdBba4dq3HM/AR66ZK7Gxt4oCAUl41GDAWNNnQ9PVNGUQJfv1HNYVlSXaTwONi1
	YmBSpPnO4lUMClLxQSGU+Wz29kH9zJNRmvqKZjw47BWGUmsYDD4jWXVP/nQV+bE2oA==
X-Received: by 2002:a05:7301:dd8c:b0:36c:9959:c37e with SMTP id 5a478bee46e88-36c9959c4acmr4601667eec.10.1793769625768;
        Tue, 03 Nov 2026 21:20:25 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm3617382eec.1.2026.11.03.21.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:20:24 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: nicoyip.dev@gmail.com
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Bluetooth: hci_conn: hold a reference for LE
 connection timeout
In-Reply-To: 20261002174658.3596771-1-nicoyip.dev@gmail.com
References: 20261002174658.3596771-1-nicoyip.dev@gmail.com
Date: Wed, 04 Nov 2026 05:20:03 -0000
Message-ID: <179376960391.50454.8822263457423416137@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello Chengfeng,

We independently reproduced the LE connection timeout use-after-free
and tested your [PATCH v6] ("Bluetooth: hci_conn: hold a reference
for LE connection timeout") on a clean Linux v7.4-rc1 tree
(6628e7d4c6b2).

Test setup:
  - QEMU/KVM, KASAN-enabled kernel, /dev/vhci virtual controller
  - Management SET_ADVERTISING and L2CAP LE connection
  - Kprobe-assisted timing injection at le_conn_timeout() entry,
    50 ms park, with mgmt disconnect at discms=2015

Results:
  - Unpatched v7.4-rc1: 42 slab-use-after-free reports,
    with the first relevant frame in hci_conn_failed()
  - Your v6 patch applied to the clean tree: 0 KASAN reports,
    with 200 confirmed probe hits under the same timing setup
  - Control run without injection: 0 KASAN reports

This is a test of your posted v6 reference-counting patch, not
merely our independently developed fix. The result supports the
lifetime fix under the tested interleaving; it does not establish
coverage of every Bluetooth shutdown path.

I also confirmed your analysis that a naive
cancel_delayed_work_sync() replacement is NOT safe: the mgmt
disconnect path holds hdev->lock while calling hci_conn_del,
which would deadlock against le_conn_timeout's hci_dev_lock
acquisition. Your reference-counting approach is the correct
solution.

Tested-by: Yaohan Li <shunsheng1218@gmail.com>

We can provide the full console logs, build configuration, and
reproducer details privately if useful. The investigation was
AI-assisted, and the patch application and test results were
reviewed by the human tester.

Best regards,
Yaohan Li
