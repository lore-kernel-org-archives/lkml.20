Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725212F8EBB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351985; cv=none; b=M7OsAfC5zvgnWsTmxNDp+YFR6+G8DYh378ipAU8hh+wL80Bl8GD3ruVvBJT7chTsIdC41rRxCA7kRDI+Ek88c2C3NdC9hM8Qwt/Uda/5jgSfGoAThHRS5ixtsqLtijQV0wpxFmjDHQHGj48Gx6E/4FkqLp6MF6qzJEA1JrE96Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351985; c=relaxed/simple;
	bh=sdeYl8h25y043VDoiD5U1hUo6wVwRXOrX4A5k54W6Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNTa4qwSfAQDKXnm7jMMx8ipb4u9ZgGOLeTF+pjUnMSh757Gv1oVjq4lWS4NmVVVbkfjUMD9FiXfrg/4EpTfyDAj9t6lSlF01UkmJitdzABxSj1eCY0L4Ylz5BI26GSbrkCvWiXfyY9i+S3QSW8sFpMsd9MIE5niYRvq/l64bRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U7JzSLSU; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U7JzSLSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sd
	eYl8h25y043VDoiD5U1hUo6wVwRXOrX4A5k54W6Ec=; b=U7JzSLSUVAR6Ib/xOM
	k8/ua1exxaDxhbalFvh312C0n8AZ/OvtFAFBS50f3OMIj1ECawsqF8StD6tcrbNs
	Pl8q0X40oOtnTj7XiqHWyA1d2QzGox2MFwsiSK2RzOuqlRxgBIZzMRgkCfWIbfvd
	RTh6M9pys4DYwZ2W1wNcsTDh8=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3H5P+V6dqrpMqPA--.35395S2;
	Mon, 14 Sep 2026 10:12:15 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: xu.xin16@zte.com.cn
Cc: Longlong Xia <xialonglong2025@163.com>,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	vbabka@kernel.org,
	baohua@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	xialonglong@kylinos.cn
Subject: Re: [PATCH 4/4] mm/ksm: add find_mergeable_vma_locked() to use per-VMA locking
Date: Mon, 14 Sep 2026 10:09:42 +0800
Message-ID: <20260914020944.664339-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911161333316ISAQaj9yJhmglKT5A9OnK@zte.com.cn>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn> <20260911161333316ISAQaj9yJhmglKT5A9OnK@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgC3H5P+V6dqrpMqPA--.35395S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1xKr1fJFWDJFWUAF4Dtwb_yoW3urXEkr
	ykCrn7G348AF4jkFsagr13uwn2ga4vy3W8J3yUtr1a934IvFy7uFs3ta45uFnxWayvvrZx
	KwnIqr4q9rn7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbiiSDUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC2wCak2qnWAA6egAA3H

Hi Xin,

Thanks for working on this.

Patch 4 addresses the mmap_lock contention problem in
get_mergeable_page() that I reported in [1]. In that thread, David
suggested switching to per-VMA locking [2].

Could you please consider adding the following tags to the commit
message of patch 4/4 in the next revision?

Reported-by: Longlong Xia <xialonglong@kylinos.cn>
Suggested-by: David Hildenbrand <david@kernel.org>

It would also be helpful to reference the original discussion in the
commit message.

[1] https://lore.kernel.org/all/20260909023507.1408925-1-xialonglong2025@163.com/
[2] https://lore.kernel.org/all/91cf8129-d705-4ebd-b420-129bab7ed261@kernel.org/

If you think these tags are not appropriate, please feel free to
ignore this suggestion.

Thanks,
Longlong

