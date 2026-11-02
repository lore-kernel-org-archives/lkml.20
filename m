Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641053;
	b=WLqJlQoIJOKJyHpczYc+Z2emttbopklPVgUhSh9QshOMi1WW6HZksAoN328gn/cpQlPJ
	 ZkgMOjbVaOdourcfbUby4X1da91087rUyzlw+2CcGy5FtmMcRKMokbnc0vhjoJcjpKqaB
	 og3wEPp8TrnFVnlbQZZLfAgqUzFpYP4OJcxCjAOszLkk6ISxg6fltPyPZe/ybYlIvkvjD
	 iWSLvM1r0tt0aip4mmiNz5597oXfIEfbQouosgAVWc5NUnwFHNu0GxuJmsKrq0z2CnF45
	 x2LoEJHhoN4kBcJ0m8ct/dSImZyZ8uSGei44i70QNS7zprXsXkiNc9kaAQ0YW+xSjdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gPugNcmP49mQSZZGbdfraCdWpP8WlOkdDnudq9ocJd8=;
	b=DbFOtDlpvEgm5jcwbBzGn69eYRfV3ixqLQY5PHgT3cbqk4HLMr1gb+RYvdGi5aZqoQhZ
	 gu5AaD5TjbeqWJvgxHrCw+eCWmm6gj10/eAA65QGXIrwQrk6B1Ug+ZEWirb9DlZ22oG+Z
	 0IiHui0gLo6fEUubUIpoQWDYEoGMM9VUWyjHLA30VNiH9I3EczrNp/GVoVS+Gv0lCpbZj
	 9MTpqCGYZZ+q+10JTSOWK9pz+0nVC+yYmKaPMVDk1zGg7CHJ/tDphNjaVsLTJQBWIfVjM
	 RxgHU0nyuFtl2LSuYvjxIapmYbFBHx/F2likrQzGyNb5u/6CMtykkrpxNvxjr1ZLqDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJ8n+ZTD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.69
Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337FE606AB94
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 337FE606AB94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJ8n+ZTD
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3ab2ac79b69so25123501fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793641051; cv=none;
        d=google.com; s=arc-20260327;
        b=J4PtTUWYs6yi9NryodSmFj3XWjmihRRF0hDzFVYxO5aTVFhlMkUX0D6g4f/8PpkTGP
         E9iDogUFJRlKbkgCXq4F05nTle8OclIbtFO8QtW2tXbzUw6t03hS05v9Fdwj+ZEGiFxS
         2lE1679h3e5nV+cGIEZmvjNmh/C0e4iLktVU+XT4uoCFJ87oxDWX3jbm6anvGc8g4RxF
         UfpNqpGYqK0GueQ4ZTN4aLHsltEtJbzT3v8iplfs3Gsb3FouYoXh3kvRyS9wWMLp97P7
         7kNTcn5n19Ns3kcoBpxeLYtLKycLGdkCmEpDo+cJZR13MRsPJZQhSmG85Df88aeHcs8f
         vI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gPugNcmP49mQSZZGbdfraCdWpP8WlOkdDnudq9ocJd8=;
        fh=qkOFi2RuqRrwGK6XD3oSpk3TeZpYIpXjoFsYP5eq/KM=;
        b=VwLmKvtzorbe3eODRl5xMG5tZfZ35VOVPccyrBBXiNh1bliOAiIvvEsk1+fy6lbN+C
         DH4knVwjei3M3BXblBn/tIRL6UYJkgx+SNFHP4hI5pPjnKNz88jD3RKboeJmwOJs9U/9
         qqn7oul9D3l4IMKTYY259EHMnXsceAppZueDRudjU7Eg3BnxlnzRPp+GS7zUU2fOveDw
         rQAD6Vpdsp+KCWbjBTTQRaaVYL0gYwz3UyYuQo8PeHf63Y6LLD/QfWUmIvPv3tsQ0I/W
         gZngSb7xvyzbW7KgjvrOc5ObsHNMeHYWQIKpzPwlJZWAJE/YaLEj2bqgY4qCPnqveHB6
         2KgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641051; x=1794245851; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPugNcmP49mQSZZGbdfraCdWpP8WlOkdDnudq9ocJd8=;
        b=DJ8n+ZTDiKHQYQRkmB3Z65u8ghSkw9esMOABCYibHf0RhLKfDbhByE9XuUtTSisYl4
         VptH9p7Btoasf4Q/+82y3cGB0DLOrH12Ro40kyE6Ygp9Ua0RN+iZw9e1U/THV4B//6Re
         2qnO3t/v/bVu4LaLvsjuLvuBX7Qe0OCc7Ag0H+b6zlSr6Hy3h0mPbLixg5wlSYpqxj9K
         vyG2LgGcgxmggnfiJYjCGfhWqfWhZxc64gx70xpQ8ByStsKAroQg9LELKBvqc0kVheU9
         vxo4gjPxV1HL39RlDNQ2Q1Jfw9eLfHrlkVNsnQSpHhhv/nlVED+Hr6cjCjAeMo1NMx+B
         1Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641051; x=1794245851;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPugNcmP49mQSZZGbdfraCdWpP8WlOkdDnudq9ocJd8=;
        b=ps+m62U0WmvO4wymG7AmsIq+IoDt/uOHo8ubr8m0JTLR+ZUC5ZEWyMkypr+b12GOmd
         HxAeUnb+JopdBPbibuZBJaiSCmG+dQa4S9eM5acO9jzOcsVKr5qIuz6qnjDUXXZUCtYH
         0T8jwyIkST/wfkDs5sdy9kJj3cZk7/jhG276HGLZbK/ovvajYDpWeuvcDJTV9YdW4SZH
         xJZtpRouj/uebHR2XTKzGJeloq+VaWoThQkObjOiqZSwOl5naOt0H6ls5v/7qZ7TI+VH
         Y0yx+u0cjI8smo6WunNOqfeSVzV32Xg6ly5pq5bCOLXYm5YssEEhm+ht7XidFSMKRUHp
         VGHg==
X-Forwarded-Encrypted: i=1; AKwUvByaYR/uQsz0LvwLdpGgAP8Mdgryql5lsOgOAePdRaBQuekjSc4NAreUy0HMbb1wr600CzJlJtQi4uAWy44=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aR82W5dNBe8A3mifARuqtsfGhe+vNhE1O4PS5ugxXgpvNGZwQ
	Z+k1OeEEEWazjxUZB/obOGFElNGuJKbES1VyiVYqduwDM52FTYMjeBFMLlprqSaciZZqMsvxcz6
	cG3DberxRcXddNOZm5yidl22Iz5VqJI8=
X-Gm-Gg: AYBFou0YL+DK10bu9xNvNTvTfy/acd6c38s96pjJaM3XcukXwTTzeT/eZh02zuIWfcj
	c8FNdBJ+8V2yjZH8nQgO3t6hHziX6cBnW/eLCTx5Y5SySOEbtm4owaSreJPbMhhbVCXHXIsxKVj
	S9QuQqOQ4smHqgxUpnVnQE53ooY6bmHfMWtMuOsEK+HPlt2UKvWapb5bOxNTUWs22ODApLtaR5G
	bm+l2/j8I02rDh4gyqoEn2epiELrLLwC0PzAcuZhBBubyWknK2goWiRqtMDVMQh1pSGh9CvdrqZ
	jMpvEtriQsvTIp9V15asuTXKk3fPLfI0ZWXPZmePkj4kSEsp8Mwfes1M7axNUm3HrigVEBOoY9a
	IVociYpun5lsk9IXzicBW60MVURxZP7rdk2ZykTs=
X-Received: by 2002:a2e:bc1d:0:b0:3a7:69bd:80ad with SMTP id
 38308e7fff4ca-3acb7a65e35mr29613041fa.6.1793641051096; Mon, 02 Nov 2026
 09:37:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ2EzuShr1dNEQt+CEjqan8SSyD=-E9g6RW1oocah+chcQ@mail.gmail.com>
 <aud4isATIt0JOOL_@kernel.org> <1c0d3129-e1f7-40b0-81f5-9cf4c481aabb@linux.ibm.com>
In-Reply-To: <1c0d3129-e1f7-40b0-81f5-9cf4c481aabb@linux.ibm.com>
From: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>
Date: Tue, 3 Nov 2026 01:37:18 +0800
X-Gm-Features: AclHuK85iwJWc6Di1ZBloZBYG-JauYSsIyiam9_waOqwD0KPEMX3vawm0p6o8Pc
Message-ID: <CAO-4RZ1zzJBVLSZFcngr+9BUOwOP65Saa6q8dS8xyLo0xQNo9g@mail.gmail.com>
Subject: Re: [BUG] tpm: prolonged stall in vtpm_proxy_fops_release() on Linux 7.3
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, peterhuewe@gmx.de, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-integrity@vger.kernel.org, syzkaller@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

To make the reproduction evidence easier to inspect, the repository
(https://github.com/Zheng-zheng-codes/vtpm-proxy-release-hang-repro)
contains five positive reproductions in total:

- Four replays of the 50-program single-file reproducer (one automated
  and three manual).
- One separate two-step reproduction (a 49-program state-construction
  run, with the hang occurring when its executor exits).

The serial logs show the hung-task reports, with the release path
blocked in flush_work(). The accompanying sysrq-t dumps provide
snapshots of the tpm-vtpm workqueue. The first captures the full
running chip-register work stack, the blocked release, and the
workqueue backlog. The other dumps also show the blocked release and
the in-flight work/backlog state, although the full worker stack is
not available in those captures.

The files are:

Serial logs (5 positive reproductions):

  logs/serial-7.3-auto-repro.log    -- automated replay
  logs/serial-7.3-manual-repro.log  -- manual replay 1
  logs/serial-verify3.log           -- manual replay 2
  logs/serial-verify4.log           -- manual replay 3 (with
                                       syz-execprog stdout in
                                       logs/execprog-verify4.out)
  logs/serial-twostep.log           -- two-step replay (with
                                       syz-execprog stdout in
                                       logs/execprog-twostep-step1.out)

Sysrq-t task dumps (4):

  logs/vtpm-sysrq-t-all-tasks.txt   -- replay 1: full kworker stack,
                                       blocked release, and backlog
  logs/dmesg-sysrq-verify3.txt      -- replay 2: backlog and blocked
                                       release
  logs/dmesg-sysrq-verify4.txt      -- replay 3: backlog and blocked
                                       release
  logs/dmesg-sysrq-twostep.txt      -- two-step replay: in-flight work,
                                       backlog, and blocked release

Campaign instances:

  logs/report-7.3-*.txt
  logs/log-7.3-*.txt

Answering your questions in order:

> Four runs out of four?

Yes. Those four were the negative controls, not the positive
reproductions. The sequence was run four times on four freshly booted
bare VMs, and no hang was recorded in any of them:

  logs/serial-7.3-bare-no-trigger-1..4.log

> Does this mean that the 'scratch/pmem/NUMA layout' is required to
> reproduce the hang?

That was not established by the original comparison. The bare-VM runs
differed from the positive runs in two variables at once: the kernel
command line and the QEMU device layout. Therefore, the original
comparison could not isolate the effect of either factor.

To investigate this, I ran a controlled 2x2 test matrix using the same
50-program sequence, the same kernel, hung_task_panic=0, and a fresh VM
for each run.

The results were:

  Full command line + full layout    4/4 hangs (one automated and
                                     three manual replays)
  Full command line + bare layout    0/2
  Minimal command line + full layout 0/2
  Minimal command line + bare layout 0/4

In this test matrix, the hang was reproduced only when both the full
kernel command line and the full device layout were used together.
Neither one alone was sufficient to reproduce it in the tested runs.

The 4/4 result counts the four 50-program single-file reproductions
and does not include the separate two-step reproduction.

My current hypothesis is that the combination affects guest execution
timing. Possible contributors include page_owner overhead,
initialization of the additional devices, and NUMA-related I/O. This
may increase the likelihood that chip-register work is still running
or queued when the closing task reaches flush_work(). However, the
exact mechanism has not yet been established.

The logs and per-run kernel command lines are available in the
repository under logs/controlled/ and cmdline/.

> What is 'device layout'?

By device layout, I mean the virtual hardware configuration and
topology presented to the guest by QEMU.

The full layout includes, in addition to the root IDE disk:

  - 8 scratch virtio disks (2 x 16 GiB and 6 x 12 GiB, created with
    `qemu-img create -f qcow2 ...` by the QEMU wrapper for each VM;
    the wrapper excerpt, the sizes and a `qemu-img info` output are in
    cmdline/qemu-wrapper-scratch-create.txt);
  - 1 additional virtio disk used as a write log;
  - 2 NVDIMM/pmem devices (1 GiB memory-backend files each);
  - 2 NUMA nodes (2 vCPUs and 3 GiB of memory per node).

The bare layout has only the root IDE disk as a block device, with no
additional virtio disks or NVDIMM/pmem devices, and a single NUMA node.

The repository contains a captured QEMU invocation for the standard
run (cmdline/cmdline-7.3.txt, with hung_task_panic=1), the kernel
command line used for live retesting
(cmdline/cmdline-7.3-retest.txt, with hung_task_panic=0), and
sanitized QEMU argument templates for the full and bare layouts:

  cmdline/qemu-args-full-layout.txt
  cmdline/qemu-args-bare-layout.txt

The controlled retest uses hung_task_panic=0; the per-configuration
command lines are also available in cmdline/.

I hope this clarifies the reproduction conditions and the distinction
between the kernel command line and the QEMU device layout.

Best regards,
Zheng Zheng
