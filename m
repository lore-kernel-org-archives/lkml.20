Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB8246E00B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808420; cv=none; b=BiDLuMYh+WAQ2f+GsyWUspm0RvZ6+IUv+v07bxeyYnOTyUfUNbLyQfl+OaP1zhQVQ0z37Yl1bozKTf/f2gAFeqczYVB25RdIpF0aoNdoCt3Kkxg65vjlYR8Z1WbD1aWgDca3BR8os85lsoGnL2t78aF0c1bOms/6UHXtagKAb8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808420; c=relaxed/simple;
	bh=NhF77s9Tus3vgHr5trOZTbXaEtpfzF45KNPVBVsIHNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9JJk9diQpJ/eYPWvnO57RzScB+vIAtIIHuMLqQkQKqPU1ClG2fgdzdMEGPZ4LJadRXZ9xn27PPueCEZuP2jMKkMlb5SEUNTONWoUPiOOOaqpTap5UqIJiP8nNiwFcklmnMhuMbZ1H1H1YfKCpxkYqjDgo80iEcM3V9P5tEs8DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcZX3FIJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcZX3FIJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccc7a6070b4so813189a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791808419; x=1792413219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+RxCsVLexD5GLxTANS9HeBsTLtflT43ejBiqaED07Y=;
        b=EcZX3FIJ1uoehUUQ+H+mQ0h8t40a7v+K5DMpwNZKsldexdaFRUh2nce8/vTTFuLW8r
         SJWI5NvaBP9/UZ1+EFdJGTmedRobekeIODtya5m4/JziRBJJzdhMQP0G1E0VBSPgEqKK
         h5fh2fKttryg8k5kyleRyKEuJVjIisKA9n+SZtMtiVBXIF48hMbgxL4bgPE8dMp+i8Tr
         K6WmNlD99QJMgI/Vdbx++tI0/UocvyOtIfR2OBPHeWasnoHCIylfk5jYrrtPRitZ+qog
         7s8c2ILjnXYa3NFDJ/FBzNexl32/zbR+W7nGiX/cLwI3BLzc4BgupJy76Cwjb/IwhkQy
         8iZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808419; x=1792413219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+RxCsVLexD5GLxTANS9HeBsTLtflT43ejBiqaED07Y=;
        b=w3JD25xwDR8cSGZ2nw3+AvcHqBhQF8gF/JwGVmGqykNo3YQ1XQfTUJmN5y02bmUw33
         Ew7G7cUNbXxBYAPFzm4/fKFR+RAnqAeuESzFM/O0VCIw+s2wWhZASWFgRjzK42xDdbeq
         sDYw1Q7qDAXf4eBv9uEr7g+wk9Yp10DJK5hXU7q6EL6VAjFQlriPKeXi4EFWlaPXZVtv
         c9iMzc8T6cApPw404lmHOuX2XKFPTCyQ1fWZh67lWMsVH6/9D4O58jsHvpcu/k5aTcBX
         KhnGI+urmRPxsWyucecmC9NnaR3tFYNk3HIhZAZDbEVgsGs91i7+U0JfNNmIBbu+eL4c
         ynJw==
X-Forwarded-Encrypted: i=1; AKwUvBwHq27qCBUFKJCj2cU2QUuLe8OwCECpX0fAwwFoNqmzqW+Fj5C8tbXhm3mB5QoUNEP8sQ3jcS3MSLJ0t3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnW8pWcFffAyMLWdAKxlfTdLG5vQ5ttg0ZKovLSwZ1d/2L9tiR
	53uYtzUUgu8RJP+X2mT1lkLsSMt3WjZEgKicuk5nul5C0Ua9P/3/CpRR
X-Gm-Gg: AYBFou3l8PL2N8kUdd0xr70ZPYYL5LcQrQCnuN4Wu6pEVSyKHdUFJfQ8N4W5VEfwweJ
	AGQBQwcdL426EwQMXv0YUeRWj0IFd1qjrx8TDs0FzXpKqG/xYeO34Uwf5HodUMDx2cuhvddBI/X
	2n5EWzDOxiVrYnwMqfpJVgLI3R/Q7syvctvdy6ac64j9qx6KMsAb69a/Zdzlp6YHkw2vx2LuHgw
	ipPastD2FyyKF8vRaI+TQpuLSCNw0DyO4eW6sEZ4fBQhCrzmuBrfEWXAE9j+raeCByYXTt+mVEf
	Jfs2EHgjMbQMTNFE9wycOxTT0EFPSGzbzbyPX7LSoFG/PeNvbUQSrHalyThd28y5fyyn0rB0knn
	FlVA9Uk+5YFWC1X4cLaPz8eoF3KUWkzEPqOL3zHEsznb99spHbP/ItwPk3XbhLav3UiAaWBXxrC
	xXbXr+fAqfk5E2DvUV+5gi8skODCIfxmUdmRqZnm5aZofGMhhZu9OB1k/g8mNKC9kpqvqSHiRSk
	szeSnYXybKj8ZNY
X-Received: by 2002:a17:90b:540e:b0:3a8:1ffc:391b with SMTP id 98e67ed59e1d1-3ab3a9fc979mr6592452a91.43.1791808418593;
        Mon, 12 Oct 2026 05:33:38 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371e2833sm17072745a91.17.2026.10.12.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:33:36 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: senozhatsky@chromium.org
Cc: baohua@kernel.org,
	akpm@linux-foundation.org,
	bigeasy@linutronix.de,
	hdanton@sina.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	minchan@kernel.org,
	ryncsn@gmail.com,
	yosry.ahmed@linux.dev,
	surenb@google.com,
	suleiman@google.com,
	zhangdongdong5@xiaomi.com
Subject: Re: [RFC PATCH] zram: avoid preemption with CPU-based compression backends
Date: Mon, 12 Oct 2026 20:33:28 +0800
Message-Id: <20261012123328.1138059-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <anMPLgbrf7XMC7Qw@google.com>
References: <anMPLgbrf7XMC7Qw@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On (26/08/05 19:25), Sergey Senozhatsky wrote:
> quick and dirty patch.  Just curious if this improves anything on your
> side.

Hi Sergey, Barry,

I ran an A/B of the three approaches on a real Android device
(MemTotal ~7.7GB, zram ~8GB). Same workload for all three: cycle 20
memory-heavy apps through fg/bg to force swap-out/in, 8 rounds (~550s).
The stream mutex is instrumented with a trylock-based counter; the
measurement code is identical across all three builds, so the only
difference is the patch.

                      baseline    preempt-disable   read/write split
  contended count     8,765       150               6,557
  wait_ns total       52.28 s     1.29 s            65.86 s
  wait_ns max         95.6 ms     46.2 ms           130.7 ms
  swap-out volume     ~2.86 GB    ~3.04 GB          ~2.87 GB

For the split build, contention by stream:
  read (decompress): 6,349 (96.8%)
  write (compress):    208 ( 3.2%)

Summary:
- preempt-disable: contention -98% (8765 -> 150), total wait -97.5%
  (52.3s -> 1.29s), worst case halved.
- read/write split: barely helps (-25%), total wait and worst case
  actually got worse.

The split doesn't help because 96.8% of the contention is on the read
stream alone, which is concurrent swap-in decompressions queuing on the
same per-CPU read stream while the holder gets preempted/migrated (big
-> little core), not readers vs writers. Splitting by direction doesn't
address that, and it doubles per-CPU stream memory.

So in our workload the root cause is the holder being preemptible
or migratable, which preempt-disable addresses directly.

Happy to share scripts or re-run any variation.

Thanks,
Bo

