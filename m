Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2622A80D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221257; cv=none; b=onXBoM6o6dOqU86j0kbYdBmnVw4wm6Ekk4lcQuhiakn4NWFr5m5tRQfT3epy4FTY9mwcz73TY0sS5s7lG4YrdwJUTs+1LV93CoopzHgvUQ6mFFKyInGhjkRCyaHzx6kNhm2niQl3gangdwosOo+TTwYsliV7P+vN85a+M96obNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221257; c=relaxed/simple;
	bh=Ay8INYvsU0bSbcMMTTZT5WdCmBRX5P6jvM2EkZI7hZk=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=Vwk1Nilznwuiu/dX6ry2TVh6FV4VtubXebrlgxwAeVB7S8hG7talR0Yd47ze99RVY4jmhLrlb+8gTfkKLyclxNPNvoQi+3iH/kIqu+madRKQcxsNiLEJv7tZMWmveGGtf+sC4XKbKHMCir95FBDJKYd3Z8DtqV4vEwPRLRYAFjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hr03n4DKpz8XrrJ;
	Thu, 24 Sep 2026 11:40:53 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68O3ekJR063160;
	Thu, 24 Sep 2026 11:40:46 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 24 Sep 2026 11:40:48 +0800 (CST)
X-Zmail-TransId: 2afb6ab49bc0afc-d0621
X-Mailer: Zmail v1.0
Message-ID: <202609241140480776ICmMIKoP7Sa8CiYKlmUF@zte.com.cn>
In-Reply-To: <fd88104a-982a-4c73-9a5f-8c67ded3d5ca@huawei.com>
References: 20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn,a19a0c1d-d2bf-4c40-9308-e815f925f87a@huawei.com,fd88104a-982a-4c73-9a5f-8c67ded3d5ca@huawei.com
Date: Thu, 24 Sep 2026 11:40:48 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <tujinjiang@huawei.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
        <surenb@google.com>, <rppt@kernel.org>, <ziy@nvidia.com>,
        <baolin.wang@linux.alibaba.com>, <nico.pache@linux.dev>,
        <dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
        <chengming.zhou@linux.dev>, <usama.arif@linux.dev>,
        <gourry@gourry.net>, <harry@kernel.org>, <vbabka@kernel.org>,
        <peterz@infradead.org>, <borntraeger@linux.ibm.com>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAwLzRdIG1tL2tzbTogdXNlIHBlci1WTUEgbG9ja2luZyBmb3IgZmluZF9tZXJnZWFibGVfdm1hKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68O3ekJR063160
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 24 Sep 2026 11:40:53 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB49BC5.000/4hr03n4DKpz8XrrJ

>>> A possible approach to restore the necessary guarantee is to pin 
>>> mm_users while
>>> ksmd is walking the page tables:
>>>
>>> Before scanning a given mm, try to take a reference with 
>>> mmget_not_zero(mm).
>>> If it fails, the mm is exiting, so we skip it.
>>>
>>> Hold that reference for the entire duration of scanning that mm (not 
>>> per-VMA),
>>> and drop it with mmput() when done.
>>>
>>> On the fallback path where we need to acquire mmap_read_lock(), drop 
>>> the mm_users
>>> reference before waiting, to avoid delaying an exiting mm.
>>
>> We should avoid holding mm_users ref too long. Otherwise, when the 
>> task being scanned
>> by ksmd is OOM-skilled, even though the victim task has responsed 
>> SIGKILL signal and
>> exited, the mmaps aren't released due to mm_user > 0.
>
>In this case, we have to relying on OOM reaper to work. But it need to wait OOM_REAPER_DELAY
>(2s) to response.

It shouldn't be too long if holding mm_users only during ksmd accesses mm's pagetable.
Essentially, the delayed time of releasing mmap has no difference to the original approach by
mmap_write_lock.

Or If we want to keep the code simpler, we can consider the other way to keep serialization
and synchronization between __ksm_exit() and ksmd thread, that is: Adding vma_start_write()
for each vma? like:

diff --git a/mm/ksm.c b/mm/ksm.c
index 624f37975e12..1f11646bb00d 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3129,6 +3129,10 @@ void __ksm_exit(struct mm_struct *mm)
                mmdrop(mm);
        } else if (mm_slot) {
                mmap_write_lock(mm);
+               VMA_ITERATOR(vmi, mm, 0);
+               for_each_vma(vmi, vma)
+                       vma_start_write(vma);
+
                mmap_write_unlock(mm);
        }
