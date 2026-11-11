Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419772;
	b=AbGuCb8AeWniXHwckPPkVBd13ErRKoGMFVOve6G0NvwhGYAuoIePcm4aEWLWcBq+pNLU
	 hM5lGF7mtA+0WqnmOteUfCLdXrNW5UxusrKzDBU28neAS+1EJyg//jUSXle3dkJGMfoQD
	 WmJ9pRr2WsGeijI7FsFRb5d8CRSWYrbVAcX4y0HHjN9malfVD6T6dxtsh8K+ulcTeSkCs
	 V9gu1T2zqN0uP0E4DGeQcEI3ftvweWpIVVFaBEjhcV2p7oGbDvr4s+2zM2BzqANpHTN/0
	 JK5KWwi88zd/+AEVRFuZULHzmKdE1oJaYNCf2lpTocxIRhHWO3oNX+If0IJ2rYlYEXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zQXiGUDfX4nhGSBE/hoqgNBZ3AZrbYE3C3VVsm2sLEk=;
	b=121q0DqAHJ+sFmuOwOj5o/IPMQh1jfudAIAkfvnhHpeU9cnzy+MCKJpaaXkMn34fbIGR
	 +A/NcyPj3wB9ckKQ0OqtwGFjXKAuauDz2CpYUEgvNDK0kEa4wWjjnBRFC/P75t9U8YFKc
	 CRNv3qhfoK9i8MR6A+TwGBhxW2KEv2juiWlxykryuQcJ8wPO3HHWblZZei3UtSnxxh8OC
	 o/cgqZsv9Q99LNN3GDWBHfxLiwfMctNS5NBLhjqZzcUxSKQU2kvaMmQW2lvgXGqwwGERl
	 8cVPgXcUxj7lWnZJZndhOJOz77F6iXecPKLrhYC1QRMZ1+Qd4YERNp1jM2J395nHwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="V/ZwGOro";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QEyFBYDH;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1782606A883
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1782606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=V/ZwGOro;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QEyFBYDH
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYU5t257093
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=zQXi
	GUDfX4nhGSBE/hoqgNBZ3AZrbYE3C3VVsm2sLEk=; b=V/ZwGOroO1zo48pZ66bT
	L/ZvfSo66O62PCEkxH/hfRJgDsDlkZGZfJRgbYbCmi1+dtxRgQrXBp2H4NRmmwdp
	bupXC1WKqxHvCYocksf2dKhoqDOAGhPpDArKxAyoTLC6JyeewK89IEMXB5zRH4pf
	0Pb50jIoIV/sL7YHOXogwszUeqq0LBS9FavtCT6taGOh7vIcEvKR+lqrh4KqVkU/
	LMURGMKc6WKV0JmJNYE0thUhmAc9f9qR1S3+A8hN4defBp9qzKNuVrahAnqRl9js
	3bff7yJo2jxt9NF8vBhFxqqr6TmnnMPUnmC3slxmbWTBzgR4H2DeOemaHvgead3I
	Yg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvdfs5604-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:10 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533928ef33aso50712201cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419770; x=1795024570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQXiGUDfX4nhGSBE/hoqgNBZ3AZrbYE3C3VVsm2sLEk=;
        b=QEyFBYDHdLxLP0NG8l134bbUAbyoyjgg4vRaA1BZsmntj2XrEiuz6oRHDnRTj4hF1C
         hs4Pv+R864u8bQnD+F7fCgKwIpOakZnWHC1QMbYiwp0XceujeegaQSBbThp3Lxh1g684
         BXrUI5lzir29IaDooAHyCFdAJMlOhiZ3EOjINtFcpAGz31h79ooJsaHGkiWopOZffl8a
         L1Z+SQRLrB8gdKJL8sFxVWrdunsY+pA3XbaApUqUsOJqgDeKkpMK1tn9ZTjbkMXmUPUj
         +UW59z9th/vSXIS9ObZ6wx5TVqojQTFJ8FckaMOiGuQ4cbIoPEd1Om/lYi1vzmFKJwAC
         ABVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419770; x=1795024570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQXiGUDfX4nhGSBE/hoqgNBZ3AZrbYE3C3VVsm2sLEk=;
        b=n9N5U/udzsm5nQEKphqNFnRVSNfntmROENTggj8U3PiTbHxOvrYQI/JVuqUlwbg2LZ
         wlFUjXZe4jQ7jO4k2qMFruoRUfgbFBYZ0nufupCE6Mj5G3mtWWiYobAlTQ/uQ6Sg0ZTj
         Y4jYv3+LC/vkTpjF/HUJJTavMi8gHlZCwo7GkdNVGau3Uzz7uxQVKjJMYH28RWvDU/Gn
         Paa+lYqfrlYmix7a6ZEOUk2YTy3376sCkttP8M4vUEl/fAbks5cY9mgetBJ+cFMsSfbw
         XtHimA5dXPUcxHCItjKZ0MnNggraJQw0gv5X7qM9uYMLQFAXg/54j6c85QznHzUgQFs3
         Nt5A==
X-Forwarded-Encrypted: i=1; AL+hErGY0f1ivMi8YrZdf5+G67gwX2vp3ArsnNmD3xi8PrC32T9PMmonKuyGnXHUtaDWM/JuvsgKcDU3xfvC2p4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HChO4/lecunb+HkgVFO6+kKcs+A+EnrI6GC7yrpPw7F/mMqmK
	UuzwQXVHg3UiC8337nlBiFw6csPPbj1Q3mnYOqPeUZVbdWNFIB+q1W3SiVKHEBcOPNJeOmiwI5a
	ToDv7hLP6sm2PFB39j+xpKFauDwSr+oKhYBMPUHUmnODafjsT7Tc5AwrxcUbVgQ==
X-Gm-Gg: AYBFou3GYdoCpBoK9C73NaaxeNSEeQ+/lTm0NcPrsozEtT2uQtWriiuDRy2wmbtsHi1
	OMl0WTUUbnUmy6FW3R3pTwPczegHORUY/w6YZezHKf4HhynzFZUNGczY9VCL4GfGe8iUzL/ap8N
	cyxhWtF7p6DRbbHzCVBwpAUSqoCIcnv61Ux9bcCoREGrWj/SOoMuosxgIXA9YD2pW3J2O1AI6n1
	0dvvkqbRMyHSG0QHm0A2Job+B0lq1bDQUUnTOlj1IJcRZpDTU5qYA8wKD7cpGwrOSNg+GTKqFCs
	WiuLD/fG4XGop+cvLx1iswRYfn7OwPbbYcu+YmKFK6mIuTkJjlRPHJOBmL1wEIfO9vXqz0PF0vh
	jCs/bNNgQEig3+USB6VusPlPE8J8HSOxEUZaarrbEkH0ekWF5MQV4Z21b1DhgIj0YwZWb7LCPZm
	Pg+HamdDQqVvmHAshdOg==
X-Received: by 2002:a05:622a:514c:b0:533:3af3:43b9 with SMTP id d75a77b69052e-556c0cb83a1mr49123941cf.44.1794419769632;
        Wed, 11 Nov 2026 09:56:09 -0800 (PST)
X-Received: by 2002:a05:622a:514c:b0:533:3af3:43b9 with SMTP id d75a77b69052e-556c0cb83a1mr49123161cf.44.1794419768938;
        Wed, 11 Nov 2026 09:56:08 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:56:08 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:19 -0500
Subject: [PATCH 11/12] mm/madvise: send UFFD_EVENT_REMOVE when installing
 guard regions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-uffd-state-fixes-v1-11-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
In-Reply-To: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=2548;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=kEdcltU5qeZ7eK7b5dl+oNbbR7olPAATUNygSBtDqx0=;
 b=GjNOWnuSdk/55WU96LIrcc2S9e1J9GWjLD+AXNsWkcA9q1s0rpxpdn5CaqoIq5RA1eqiRV6v4
 +w/Sz2zM37YDGSHG9tKMkiXliEld8eZF962ZxuFjv4RugUrUbbLap7+
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: lwTiV86Jyp179fuTqaQoIVNF1OXa3w2x
X-Authority-Analysis: v=2.4 cv=AaokjHXG c=1 sm=1 tr=0 ts=6af4ac3a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=H9KHOoA6oAAipju2C2wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX76iUbeWVYMc2
 x04arEZ9k8qXYzThuF0hGuJQEifAeDP72SGLNe9scI0YxY9O5r6fnJX4oDqHBb7aje9fVjThqgz
 A/DJnc9TSvm3Hu2F1FYHT5B0O3ELgZnHFYGepkuApcV3/WouoFhS
X-Proofpoint-ORIG-GUID: lwTiV86Jyp179fuTqaQoIVNF1OXa3w2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX2NAb5BqvsLyR
 moXxFt5jyWOFr7O5FU+irJJgm4rva4VFrKtoIzVk9NHzCWuHHD2UnMiftFYsUia0XnV+pHY54Ns
 QXAWETyNzcYtzX+l5EwR5Rt1eVZrNpX/M+38QrZqIF1DR5jPPrxEGR40wvuQ0/MhUSA26xeQM8a
 b6SDOM/OC4hPxesIPmkQ+KPlx6dY/gEe6tY0SamJwa7iB8+0tKUHl5nesL//GraBMFlz/EB+mLz
 s63dmUkdblI2z42MOt4Z9MQ+SK2kpwmqGhUUdVKvl0AXjfaigWxjpqX9qaO+n71jManCcPm3WzT
 uHh9qgJkQdCZ7Xl1+ewxbU4/FYH91jx1YsUyKPhHCLrmb1X0bh3I3ixmiIqs1R9iE7UBBbGPqwh
 hobvhCbjhctc7M9TXfaXuOeyLvzKgirU8W4z4YFgpJh9NnHQvaI2EJ53VI2Wrpo2E+R03AdLg/9
 RDXiZfkWjUEcHna48Hg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=10 spamscore=0
 impostorscore=10 bulkscore=10 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

MADV_GUARD_INSTALL zaps whatever is mapped in the range before
installing the guard markers. However, unlike MADV_DONTNEED and
MADV_REMOVE, madvise_guard_install() does not call userfaultfd_remove(),
so the userfaultfd manager is not told that the pages are gone.

On an anonymous VMA, the zap drops uffd-wp and RWP protection along with
the pages. Writes and accesses to the range after the guard is removed
are then not reported, and the manager cannot know that it has to
protect the range again.

To fix it, send UFFD_EVENT_REMOVE before zapping. Guard install on a VMA
registered with userfaultfd already takes the mmap lock instead of the
VMA lock, so we can drop the lock for the event and look the VMA up
again afterwards.

As with MADV_DONTNEED, the call can now return -ENOMEM if the VMA goes
away while the lock is dropped, or -EINVAL if it is replaced by a VMA
that does not support guard regions.

Fixes: 662df3e5c376 ("mm: madvise: implement lightweight guard page mechanism")
Closes: https://lore.kernel.org/linux-mm/3f4b0d1b.bbf84.1a1c55cb666.Coremail.18670333770@163.com/
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/madvise.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index e8b05dc899f1..6413f0e65381 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1166,6 +1166,29 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
 	if (!is_valid_guard_vma(vma, /* allow_locked = */false))
 		return -EINVAL;
 
+	/*
+	 * Installing guards zaps the range, so report it to a userfaultfd
+	 * manager like MADV_DONTNEED does. The VMA can change while the mmap
+	 * lock is dropped for the event, so look it up again.
+	 */
+	if (!userfaultfd_remove(vma, range->start, range->end)) {
+		mark_mmap_lock_dropped(madv_behavior);
+		mmap_read_lock(madv_behavior->mm);
+		madv_behavior->vma = vma = vma_lookup(madv_behavior->mm,
+						      range->start);
+		if (!vma)
+			return -ENOMEM;
+		if (!is_valid_guard_vma(vma, /* allow_locked = */false))
+			return -EINVAL;
+		/*
+		 * The VMA may have been split while the lock was dropped.
+		 * Handle the part in this VMA. The remainder is handled by the
+		 * next iteration of madvise_walk_vmas().
+		 */
+		if (range->end > vma->vm_end)
+			range->end = vma->vm_end;
+	}
+
 	/*
 	 * Set atomically under read lock. All pertinent readers will need to
 	 * acquire an mmap/VMA write lock to read it. All remaining readers may

-- 
2.39.5

