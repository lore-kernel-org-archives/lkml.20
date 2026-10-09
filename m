Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC32393DEE;
	Fri,  9 Oct 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535951; cv=none; b=uQsUJkTTd2vGFoETt1UTtJ+VUCYUwiGCsWIbm7go3LJIsZYVlgfF0iwE5GqrrW61FlXvPWJInXNNhxmCT56zak6NPkWctL4OF+AXe+Ps8GeuSuAOyvp2tpBAu32402K2LTDQw+KljXO4oFPVmqqIuh12lV+El/+BzoQAlEEoDVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535951; c=relaxed/simple;
	bh=9bvrIimgWhp5pYeq94nWisZrIs4cws1jr17dyxylOaQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ws0pS0DsLQ8BV/jkwv8flojdlRrJr2M3RXMapyBVaY3YQ/6LnEPl9dPH69oMOWAithI4yjkexsdi4l/ck+0MEdaH4/aD55h/vTLn6fZfBbUfrut/OrhSaHxCQ1EvAHuBAu3uVio0p73RSHaUVpOVGeyXpXpTAwE31hqNzPgt9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j1LFJ11sSzKHMbd;
	Fri,  9 Oct 2026 16:51:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id F050D40561;
	Fri,  9 Oct 2026 16:52:23 +0800 (CST)
Received: from [10.67.109.234] (unknown [10.67.109.234])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDntypGq8hqsy9VDQ--.41903S2;
	Fri, 09 Oct 2026 16:52:23 +0800 (CST)
Message-ID: <7cbd5c40-55e4-4db3-8175-aec9516f9ba6@huaweicloud.com>
Date: Fri, 9 Oct 2026 16:52:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gregkh@linuxfoundation.org
Cc: cve@kernel.org, gregkh@kernel.org, linux-cve-announce@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <2026092412-CVE-2026-93275-76ec@gregkh>
Subject: Re: CVE-2026-93275: perf/x86/intel/pt: Fix stop/start with no update
Content-Language: en-US
From: huaweicloud <luogengkun@huaweicloud.com>
In-Reply-To: <2026092412-CVE-2026-93275-76ec@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDntypGq8hqsy9VDQ--.41903S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1kGr4DXr4rGF13WF17KFg_yoWDGwb_C3
	W5urs8KryYya13Za1xKr1F9ryrKa4jqr9xZF15Wry3uFykGrWS9ay7XF9xtr1UG3yDtF15
	Aa47X39rZFnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jjVbkUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Dear Linux Kernel CVE Team,

I would like to request an update to the affected version for
CVE-2026-93275.

Although the patch carries a "Fixes:" tag pointing to commit
52ca9ced3f707 ("perf/x86/intel/pt: Add Intel PT PMU driver"), which was
introduced in v4.1, the commit message itself explicitly notes that
this buggy code path is only exposed after commit 9734e25fbf5ae ("perf:
Fix the throttle logic for a group") was merged in v6.16.

Therefore, kernel versions prior to v6.16 that do not include commit
9734e25fbf5ae should be considered safe and unaffected by this CVE.
Please consider updating the CVE record to avoid widespread false
positives in older LTS branches.

Proposed Data Amendment:
• Vulnerability ID: CVE-2026-93275
• Current Affected Range: From v4.1 (commit 52ca9ced3f707) up to fixed version
• Corrected Affected Range: From v6.16 (commit 9734e25fbf5ae) up to fixed version

Thank you for your time and verification.

Best regards,

Gengkun

