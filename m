Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A242E41E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066719; cv=none; b=ug8090MZn5jFtcmMoK4mnE+4WQrq8yS66magUvXgwJGM3qucPyceVO2XkjyUIO2Qx4P/yCGw2y9GqqiGZPSFaCY6t9b5WEpFRKv7In521Q24mrvtCPKe+vfXH6jngGdc6mtXDMe730GCONGzNHNd/DLZVynqM7GVriHleZbJqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066719; c=relaxed/simple;
	bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzHs0Oj0FJQcByVGOHrKRFqtI3BfopdAt1bEJzBLfyZvE5tXet7FoHxXrNqCX5huOCY/KpDPh3qMVmRHW37xRarhaZLvKql0442/yyfrQwZPYx37ww2QnwDpW7zwaploxPFNKRAKwbCij4rR6jt6hBXREG3mdxpT8297pJEJQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDiHSjJw; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDiHSjJw"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so14445835ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066717; x=1790671517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
        b=JDiHSjJwHZTGuhFG4Yb7PLcjNAdg2cPNH07nQl7euJYOZgF37nMxsEDqb4Pk+uFQMw
         fYZ6LwDyaJqqiVvkB6+WGwLq+bF6PYBNPQXuMfFZ16FcoA0HUmvBEDlWdE1jr//aK6b3
         g7xiScS9qW5E06jUIiwo8yvb7ITLPRobdIyyyCN4x9Jp4G0lKz3vbAaNSyjHC7KneFkd
         YgGwTz61AaWyGB+3fhvmdRVlcu9TWub1iZHiy+mmLovF0CVgTPRNJh3mhzBQrXQYAVDF
         aWDIK1yV2GOnovj1HQsC6SMATNU2e9BFj4tTRJeUMKXF1I/DdOgByd0ayAEblP51k1B7
         Z59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066717; x=1790671517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
        b=uit6Ycvoy08jwlFTldBDm0+hDtwVCjbb6cTwerTMXkaVG0BRwRNzWdDCdqDkbQcw4T
         2dyPkT1OFE9YW5BGfgpe3Oy3rC3l5MeENOyfxMSNgKgbRsmlHsqK61UYgf448WC3pij5
         yHoTm5t2Wa4GHdfNa3XFlAKs2ZZlDkSD2PAbOrbvKOFhywBCiPFJX3wCzoHVu6W8xsVc
         ZCm0De6AUkuiCh2mAw8bnI450l+K5c96ZXXr7qlCiLaEBGfIsWrxQHdqAm62og+g3zZJ
         aAmsO8sY/z4WRboxnTHdhUEFcXOd7L/1k5fpweBCFbqq8W6vQWEGN22W4OReKpE9kaoo
         2MxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYdwuJpz71t1MWzKBcltHRClkh4g+z5IvbF/Z150ENjiQnj0ArQYQI5JtDJHiA8oN9B349505V8imqgZM=@vger.kernel.org
X-Gm-Message-State: AFuF++lbyvxqIeM1t/iCsRlh0H6WGiyelUPjWI2pi1KcD+jKVC1ikwMV
	Yf69sEaXtNrDoTrJHalAbNjPjNgvPpazyZV/doKauo+p9rrQ4Lg3NDtu
X-Gm-Gg: AYBFou3fsZRzdGmhx9JqVZOcBYekUiF9EnFZJ7jX+6hHp22jkPRrKor6dCTPgtAFknR
	DZKR7n+Yx4fEaUSJA2jA+bMhXuX2HzZXQ65XvgzvPuQjQSuP7/y+Pf9jAIvXs8+d860PlEpK/EL
	9h5clxvNi/T7m2/yoX0xK+Hywx/a0xc9RP5K46dCEzS9lqtT3Clu7Dy2Nohm4xpiGQnr+HLjGep
	MOrA0E01Wt5AKS/M8TZd8N+GaHtqmfiYmB9TRcPbAEjhxgwGUKvP62nM1cJlomr+Lz+cjdL3jK/
	CG0kJgusYEAqglNRUKv0K4e7H/MzIZNnbq45AtwXf3sce2kDHQIDMr/2hMjd55YgwPfs+NJFuob
	rn8lEdM1Vsuu4kurQ+/Vz5dVZkVLVhLb3eveqCp4kiY9cQPmjCGegBFTEh1WqWY4NiY+0zRo+5j
	NI8gRnT4Wt1kliX6OQ70wJVYZRVUz3OzSNMtCDhqv82lUH9fwuJamKOIsnCEkmr+p7iqjmjVlTt
	jUY9s3VVCeFOH36Hubjc2UKOkE4vZ0RK1iFsdI1
X-Received: by 2002:a17:902:e952:b0:2dd:c100:251d with SMTP id d9443c01a7336-2df60f2fd27mr3267025ad.38.1790066717422;
        Tue, 22 Sep 2026 01:45:17 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0588e9sm6100495ad.76.2026.09.22.01.44.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:45:16 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: Re: [RFC/WIP PATCH 1/4] hazptr: add shared-scan kthread
Date: Tue, 22 Sep 2026 16:44:37 +0800
Message-ID: <20260922084447.58084-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arI8KNUjYNFBwKf8@MacBook-0RXW5>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com> <20260922070950.4173245-2-kunwu.chan@gmail.com> <arI8KNUjYNFBwKf8@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Boqun,

Thanks for the suggestion. Kunwu and I will work together on the next
iteration of the shared-scan design, including your idea of avoiding
per-synchronize allocations with a Bloom filter. We will also run the
rcuscale comparisons and collect IPI counts for the lockdep workloads
you suggested, then share the results with the thread.

Thanks,
Lian

On Tue, 22 Sep 2026 10:28:24 +0200 Boqun Feng <boqun@kernel.org> wrote:

> This would requires allocation during hazptr_synchronize() and I would
> like to avoid that (it's going to introduce a "allocating memory to free
> memory" case).
>
> Mathieu brought up a useful data structure for the scan: A Bloom filter:
>
> Willing to give it a try?
