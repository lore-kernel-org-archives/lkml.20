Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632F226D18
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790997196; cv=none; b=bTuRUO+dg19HNvDYb00v1t25pmDMGOVwdORBEhG4DMQGENlvxPoVWStanF2You1rMeyk0YHaVNy3MqQ7JzrGJ1UHcG4moCpfkLC9Qmknvwf+2j/rCz8I6Yds4dxhMpJK6u/m9dYMCHuJpmRqjJcRAXSPBfavawZmFJTlH5QrYKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790997196; c=relaxed/simple;
	bh=a+kpo4RTI73sNREzPUOPFUKRo2xgeedGd8FmVAtqOtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQp5TW+7iyC7vhTp5xNOlCF6X9u3+oIFFDWHSAYgrQ4sw8ApOIhiF9acRM3RjXsEacnEDE4GlXyhM6C12iuzASd7QPk94SGteqMr+vlVNHZREi5BMo5N2/i2+tsOu8wy5Sg3WGOpjiqD83ij097aI/pGc+kTdYL+BI44OEQFK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=utDVhz7H; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="utDVhz7H"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=a+kpo4RTI73sNREzPUOPFUKRo2xgeedGd8FmVAtqOtU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790997190; v=1; x=1791601990;
 b=utDVhz7HQDhR+GCUlEU9lK3hJjqxejdLvkaeyW4kbux4fgluAchXK5pxhndx2M/BsQGLLDYw
 kPQnKodGPlHQ1bGV4MIPQTLM7geixm19D/sVCuNlF8qlRxhz2xMWOBrtXVEeuCwGdeaNRfrYH9q
 a6q84DcnCDm7WLtMbw2QujRQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 60bba976d3c550d3;
	Sat, 03 Oct 2026 03:13:09 +0000
X-Mizu-Trace-ID: 60bba976d3c550d3
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: luizcap@redhat.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev,
	corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com,
	usama.arif@linux.dev
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
Date: Sat,  3 Oct 2026 11:13:01 +0800
Message-ID: <20261003031301.48957-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
References: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 17, 2026 at 09:45:35PM -0400, Luiz Capitulino wrote:
>If PMD-sized pages are not supported on an architecture (ie. the
>arch implements arch_has_pmd_leaves() and it returns false) then the
>current code disables all THP, including mTHP.
>
>This commit fixes this by allowing mTHP to be always enabled for all
>archs. When PMD-sized pages are not supported, its sysfs entry won't be
>created and their mapping will be disallowed at page-fault time.
>
>Similarly, this commit implements the following changes for shmem in
>shmem_allowable_huge_orders():
>
> - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
>   considered
> - Filter out PMD and PUD orders from allowable orders when
>   PMD-sized pages are not supported by the CPU

Nit: "and PUD" can go. 

David mentioned

"
There is no need to disable PUD-orders, as shmem does not support PUD-orders
(unlike DAX). So you can keep it simpler here.
"

in v4

https://lore.kernel.org/all/ff7bcd65-d444-4da1-890e-75504303ec3f@kernel.org/

Cheers, Lance
