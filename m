Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747341;
	b=R/Bq6+Y701y7/XjmlwFjeqla4dRK2MYwhRnoFN9mBX37IqJh5PcXXbjluSc/g7F1T+X+
	 tu3WeKTwuf97sFlt2H0H27kX5hei+LdejWBHgN38DpsMIzIJu38ZfW4fLnq2awGGDjyN7
	 gM8EllgApU9WapW4/IjSQ/dpQL9MB/xsNCL5QOSdhe5J5VRqKKvn9/nJeco1oRvxm0wY8
	 iQuCC2HACca96DxuCaOAY/xDnv8qzGwKrOlTnvLrqjNRt8wJI45TYTM7xSCmf+A6+MZ+B
	 kWvh7+nNZ35pugpYgbqt8Uf21TTQNrx7nJhpuXz5d4W7Z2qLE/JVbrcJIpua6mljGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747341;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C72HozOP9ChGHV25Gjbk/dfVnjvNwFuPluzxe73xVgM=;
	b=OZMs7WedN4lFj1siNHew2VmKZEGhybNcIMTQz/s78EFf4mbQpljQNTqjVszF2yEpLqX5
	 6Z7B2sq/0Fe0x+N0Fndw/rsE2W7L+UXsJBSFmZcWpLoNO72LNStH9tfU3NS+H7l53kvSz
	 qqefA21+Qjtc4gpBUaKBmPWz1zhRYHQNxG95TexsYVlfc+XzJCW2XJh9LIhEHcVhUsaiB
	 FDaR4MUXzd6KX39k0Rp68xI79h9sNiBZ26uTFUgR4o0L2CWULikVj5cxrCWpYrrIr8RNW
	 GHa9l2WUztVRpQXc7ppx3J/ZJbKZlL8pP9Vc1g51Ir7nLL6Ax8lJew7NB/al6HwqclA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b="KuN/0ExP";
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664FA606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=KuN/0ExP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1794747338; x=1795006538;
	bh=C72HozOP9ChGHV25Gjbk/dfVnjvNwFuPluzxe73xVgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KuN/0ExP6Y/Jhk8K9JYxhCXg+7z7n4GGni+9Jlcm/J0rLDKY8iU5c8ETPj+RkMDgG
	 pgzZYkMrYDjlamVEQBFrnqGa5u9cx0YsdnYtsYkwgC5M22TXRMn1IiFGceHF50But+
	 RinMIUQWZpUZeoGaT0H/wSAcc97+e3hi9X8DHUQq/WIHzv0jLG4HV6e2Vl4xRGtDbD
	 PoZq4C64z62Jgq9P7Lr/oYGYuS52zdSQdAp/gI8qBGJfXH2rmukUvBFYlt/FWgBEyM
	 zh8jacG99kbb3exeNbBfYwmusZXoZvPcH0h4gLNsB09eM99Oq4frBYSENHI3+B6Mb3
	 v4pBA3OlG9VuA==
X-Pm-Submission-Id: 4jS9vq52xHz2ScQ3
From: Miroslav Cimerman <mc@raidlab.org>
To: song@kernel.org,
	yukuai@fygo.io
Cc: antosha20xx@gmail.com,
	magiclinan@didiglobal.com,
	xiao@kernel.org,
	neil@brown.name,
	tj@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] md/raid5: fix write stalls when a write is queued during a drain
Date: Sun, 15 Nov 2026 13:55:15 +0100
Message-ID: <20261115125515.56112-1-mc@raidlab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114224636.34362-1-mc@raidlab.org>
References: <20261114224636.34362-1-mc@raidlab.org>
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

Anton Gavriliuk tested the patch on the same machine as the raid6
store patch: HPE DL345 Gen11, AMD EPYC 9455, 6x PCIe 5.0 NVMe, RAID-6
4+2, chunk 512K, no bitmap, rmw_level=2, v7.4-rc2 with and without
the patch, fio 4k randwrite, O_DIRECT, io_uring, 60 s, 2 runs per
kernel. Slowest write and IOPS:

  md defaults, 1 job x QD64:
    without  max 59.3 s / 45.1 s    128k / 124k IOPS
    with     max 2.9 ms / 2.9 ms    129k / 126k IOPS

  group_thread_cnt=8, stripe_cache_size=32768, 16 jobs x QD64:
    without  max 56.4 s / 57.5 s    472k / 474k IOPS
    with     max 9.2 ms / 11.2 ms   483k / 479k IOPS

Without the patch the slowest write of every run took 45-59 s of the
60 s. With the patch a few milliseconds. IOPS stayed the same or went
up a bit.

Miroslav
