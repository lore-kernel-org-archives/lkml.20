Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419769;
	b=t3BCX9QD9T5gU7uDpNAkEBCSJBhNNJoB4+7LA3SZgUip//5lyED/8/MYi4lNWkYzKGVt
	 00E5pA+eCDWybYyV+bJfddvf6a94bHt+TvFco85nJidC9tMvrt0UtEGtpzD8QHT5gxlwa
	 d/nO4MY/nM3hk2EU/rsHNdxk70wEiBh1aCEGQKTHXNJ4wtDMi0zB4l7PareUgA9tRds09
	 5x+CXUS3qnP1daGPshKATXaLkw8GstC03EtNXBpLI/9uFRuM98hagW3phgMuRJN624Vr8
	 WYXcqF+z80tryRuwftRRD9izRAqLJ4389gN6bDkXPmd2gGTh9FETsRDNNnKB7E2RVIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1m96XzjKc63D1pxDC9K5iULQuRZ3Lw0ONUHaz7lxYvw=;
	b=Hc71wRX3wuPpHBBoQjDrmgtr2C2loK45tQNoaccA8AjueW468XwPcDDURat7vMPk3tn2
	 pncBgVIBxXjA3tDGc2lsn4/6uATHgTc1CZ4tW1ZPwpN4mul1cK0EixKYIiOefhDnkso0L
	 GaiSOCG1AIqjhZraKxTLCbBeQdSeEGIcNcWCR/Js3yl+ZKypNwTkXlyQbCYxEkA7ZLR2C
	 ZZAR4boelqMxMqJPG6YBBO7q6N0D1B1V/EP/of2ps2sW18UAk0peHfFzJMgRTM1dGFhuF
	 6Nqcav2H9xSxeFfB/8MPkaP4Mac1HCdtbcKGqOnPt+bSQBfyuTzBrdARO54mcTN8akw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IoXq6FFr;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=BDuWTOUz;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403760A383D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8403760A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IoXq6FFr;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=BDuWTOUz
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHZHIh568681
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1m96
	XzjKc63D1pxDC9K5iULQuRZ3Lw0ONUHaz7lxYvw=; b=IoXq6FFrSN+/unNVsz5+
	2Hs3pEW0KIUhrP0QX5XPG4CTvatRl9NSOyvjksHELdcaza9rY7Y7Nbppy1C3nkz/
	CcA5j7A4Bc1X6pknSbbIQLQ9uxpw0LvpDFzvxWx9+MhniCBhp23HqinWZWjykycU
	pCiIqK0isdwNcj1pCW1HjkUcqrHJZLvgF2yFZcowQX7Tu+G3wCUylS9VvSgyiais
	uDySWBgXKNEHkl+M73KWj9a1/eDKUtQQX7yDE8hcPLFI3FTcGaDVQpRKttvF3EI6
	ULCK0IVlrIkvF0XB91wEG9zJkl5SaY5jA0Ah+xuZ1N9VLk88+iHaSMuguwF+yP1h
	7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvew5mpvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:07 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-532f343a55bso63189571cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419767; x=1795024567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1m96XzjKc63D1pxDC9K5iULQuRZ3Lw0ONUHaz7lxYvw=;
        b=BDuWTOUzuakPhz/weV0Tiki6oDtFMWXmAz1UHtBMjr0J+rkw+uE0eZ7H63gLPwiEZ1
         YNcNcWn7M4f1ya0LapFJDvYtAN4PnfvaVZwlKyD2NsZTIrPqN6DwhQwrAJzx6SYPzdXO
         MMvV6Tz7a6X3QblJ4AQTcvX4L/aIUCXCDa7rpEzGWn/OZ586RfrSM/vvdKUeNeDQd8RB
         c/v8/96RfDxfg8srWxnKhdO2EE7veuhLHBjW/8heNw3cUVIfvTBltU+9RL7jxJiTle0y
         FR1CoRZXWXi8xALaI4KNdswGRQDCuvix0JZsFM7ljaOvlsaHo9rARUN07XYqP6UHZ7dZ
         q20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419767; x=1795024567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1m96XzjKc63D1pxDC9K5iULQuRZ3Lw0ONUHaz7lxYvw=;
        b=v1ENrOV807X++e7UKq0lRniLVQvBOkojrLeJ4yhpCqjd0h01mhA53dXEhL/kXzBM++
         AFHvfvRK0+olnuyRJF7cpx7nkk7YSGYK1iPDvT8AUddNRUqwNMezofWUOX0TNF4r46kP
         DzIEI2Ag7/ENusQcZt0ClGSKgX2RUUtka8/L2hiBndbykV7ozLCF8OB5fwCt3TGK4yXL
         22Q+FfdE9FJs9Y7rjuuWdtQhvG9a/GPjkpROzpV+m83v2kc3ANrbR7ubXJ0lw0qXgoNg
         OROdUzXuHhc1xELBaGM/MnBJSwIQg4BshpcDewH7xpzd+3QvO7Xr4LW8N8Kz6FKZdAaI
         bQ1w==
X-Forwarded-Encrypted: i=1; AL+hErG4BkNlzlEC1TeCYpxWDwJkj5AcgnTyw+qz2odvN7CRKKgbx8nPuDNSFz7eD1HvjrAkJCm/tvTds9BmKhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WXrU9rvcFiMbqt8XUw2QagLmaS0usl2mo/X1j+uQIuU91EErk
	n2n2DaovXSuNWS40dBj7awErqBvBU9yPEl6aBsZqJA7NumeNSvg2kNj6NkM0lPH98SziPsGkOZt
	CO3qYQU/N5YSBnX2kiG17Ou6MgAegJN7UoYS3C2j3iNe402ubbbw1fqF8qxY5fA==
X-Gm-Gg: AYBFou1l8Dhs2QyaEmmTo6gpPy7yYXD5ekb5WJR1rlKy4BFIwvxg3Zc4XSupHnf/bXp
	lHuMVXl8kwaTtSgIH/D4WNlLz+z6bRstaBA2PLKvfS96X0v7mdyS/V6c3sDG+BeCDfaZcTIZd86
	2VXSHPNzwvy4vfEHux2lFwzafUUIqTC7BiNmpoaQb0VrSH/hu6lYsjAp0V46T6FjNbcfTb0IeA0
	VkdSW0yENplvPxBONy6AsbvFjyaFrIO1sZTrlqI3tsphBU1GVDZw1K2mY6F5sqCPpvYzfBV7JJN
	ULKw+4z5XJuN1rgPWNFre+rzaLa93PpwsmoUCwOtaG+yysdm1CnYZo83QCkyMy0soIvXvIml18o
	HZbAw8g2xf+SROa2BYI0vP+K7GtGlgA5yAgXjS7AxhGeeNcusPp73RDRfOTTMXYYSCLozXoEHOS
	v0w1IYE7uVSL9dwsnQEQ==
X-Received: by 2002:a05:622a:1f88:b0:535:2794:851c with SMTP id d75a77b69052e-556c0bc230emr39978661cf.39.1794419766510;
        Wed, 11 Nov 2026 09:56:06 -0800 (PST)
X-Received: by 2002:a05:622a:1f88:b0:535:2794:851c with SMTP id d75a77b69052e-556c0bc230emr39978111cf.39.1794419765960;
        Wed, 11 Nov 2026 09:56:05 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:56:05 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:17 -0500
Subject: [PATCH 09/12] mm/madvise: let a guard marker carry the uffd-wp bit
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
Message-Id: <20261111-uffd-state-fixes-v1-9-00713d368976@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=5358;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yTu2S1wVIskSQmMr6++Ol3X1oAvYN0En5MUMkhISqr4=;
 b=tF6bHpiOSjDbkZSVUdJQfZcIPbwo3OAGDdUQX3vCXlP6lp7hhoSIAVpEWFKwdmHTKwsJttJYB
 xqu6iE/QaX0ApuabdUF7rkfy9FinxabHI5pcGslbVjJvQWJcG1etnN5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX56lr/SR1NuZ2
 UjuBdBl4ZOo5A6wpiFMvfmYHCmA31u9sUCb5dG/Bmg3spY1ghI7s6aJ3vgiDjtniqQ2en83yrnk
 DetJ1zaBlrI3hdGwwY5jHsaySbeAyjENgNl33pkFA8GBAoJLknWqy595PDS2UFWqwNBKRPuDXsm
 V1LC2dRUmviPE9nQUr6rniIiRZEaaNBlcadlIKURA0lc9MwBFHTc5aNZLy6lRVAN9GKWP/Vd80u
 ZEgUbA7mU3azT2/7y4zEMWmpSCc0AJ3lZgbdOSFmBJ+b4PjH92xe+N45qA70XlYt1Bys2zDXPe+
 ovKwxvwj9UU6BDE1yTQzb3EPfwmaV+JbVYgXUDiEDv3nH/H8hY2jkAr6ZLbvrpkhWDmeTl4g/8E
 H1OhJr0byPeMm9aO6aW6kKXWWaktnhTW+0yKNsuhpXnrgSQL2FQAuy86d5xMoJaiiNYcW2aSnrQ
 1mNwzMz1JNY7ahlw5MQ==
X-Proofpoint-ORIG-GUID: KJunm9A-L_fSzad97EKd-xMOB5sHPZnx
X-Authority-Analysis: v=2.4 cv=etVKXYpX c=1 sm=1 tr=0 ts=6af4ac37 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=TbFgO4Jl7eDgA8pY8pUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfXyOOSL1SB2eAn
 eXaNi34t9QrKxCkeg7JF0bsrJGWOKQzulAj3+HdJpSY7IhYObLkvQJsjfvzzWB388UDgBJSKu8T
 ma40YXMchky3fsMLEI2kiy5hiaCBwBBLXLlSmae1wBybybZh5RG8
X-Proofpoint-GUID: KJunm9A-L_fSzad97EKd-xMOB5sHPZnx
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=10 suspectscore=0 clxscore=1015 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110071

MADV_GUARD_INSTALL can only install guard markers in a range without
populated entries. It zaps the range and retries, restarting the syscall
if the range still isn't clear. On a file-backed VMA registered for
uffd-wp, the zap keeps uffd-wp markers and converts write-protected PTEs
into new markers, as the pages are still in the page cache and must stay
write-protected. The range never becomes clear, and installing a guard
region in write-protected shmem keeps restarting the madvise() call.
Signal handlers still run, but the call does not return until the task
is killed.

An entry that is write-protected must stay write-protected while a guard
is installed on it and after the guard is removed. PTE markers are a bit
mask, so a marker can be a guard marker and a uffd-wp marker at the same
time. To fix it, let a guard marker carry the uffd-wp bit:

 - guard install adds the guard bit to an existing uffd-wp marker
 - guard removal clears only the guard bit
 - unprotecting or unregistering clears the uffd-wp bit of a guard
   marker

The fault path, zap, fork, and pagemap already handle a marker with both
bits set. However, pte_is_uffd_marker() would let UFFDIO_COPY overwrite
the guard, so make it ignore guard markers. Anonymous VMAs drop uffd-wp
markers on zap and never get the combined marker.

MADV_GUARD_INSTALL on a uffd-wp shmem range now succeeds instead of
hanging. When the guard region is removed again, its pages are still
write-protected. While the guard is in place, pagemap reports both
PM_GUARD_REGION and PM_UFFD_WP for them.

There are two simpler alternatives, but neither works. Zapping with
ZAP_FLAG_DROP_MARKER fixes the hang but drops the write protection: the
page is still in the page cache once the guard is removed, and writes to
it are not reported. Refusing guard install on uffd-wp file VMAs in
is_valid_guard_vma() would break a combination that works on anonymous
memory, by adding a new -EINVAL for it.

Fixes: f807123d578d ("mm: allow guard regions in file-backed and read-only mappings")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/leafops.h |  4 ++++
 mm/madvise.c            | 28 ++++++++++++++++++++++++++--
 mm/mprotect.c           | 23 +++++++++++++++++++++--
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 4c1476ae3234..add4968ded44 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -578,6 +578,10 @@ static inline bool pte_is_uffd_marker(pte_t pte)
 	if (!softleaf_is_marker(entry))
 		return false;
 
+	/* A guard marker stays a guard, even with the uffd-wp bit set. */
+	if (softleaf_is_guard_marker(entry))
+		return false;
+
 	/* UFFD WP, poisoned swap entries are UFFD-handled. */
 	if (softleaf_is_uffd_wp_marker(entry))
 		return true;
diff --git a/mm/madvise.c b/mm/madvise.c
index 0214efd2a014..e2c6b0f26672 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1123,6 +1123,23 @@ static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
 		return 0;
 	}
 
+	/*
+	 * Zapping keeps uffd-wp markers on file-backed VMAs, so add the guard
+	 * to the marker instead. The slot stays write-protected once the guard
+	 * is removed.
+	 */
+	if (!vma_is_anonymous(walk->vma) && pte_is_uffd_wp_marker(pteval)) {
+		const softleaf_t entry = softleaf_from_pte(pteval);
+
+		set_pte_at(walk->mm, addr, pte,
+			   make_pte_marker(softleaf_to_marker(entry) |
+					   PTE_MARKER_GUARD));
+		update_mmu_cache(walk->vma, addr, pte);
+		(*nr_pages)++;
+
+		return 0;
+	}
+
 	/* If populated return >0 so we abort the operation + zap. */
 	return 1;
 }
@@ -1259,8 +1276,15 @@ static int guard_remove_pte_entry(pte_t *pte, unsigned long addr,
 	pte_t ptent = ptep_get(pte);
 
 	if (is_guard_pte_marker(ptent)) {
-		/* Simply clear the PTE marker. */
-		pte_clear(walk->mm, addr, pte);
+		const softleaf_t entry = softleaf_from_pte(ptent);
+		const pte_marker marker = softleaf_to_marker(entry) &
+					  ~PTE_MARKER_GUARD;
+
+		/* Clear the guard bit and keep the uffd-wp bit, if set. */
+		if (marker)
+			set_pte_at(walk->mm, addr, pte, make_pte_marker(marker));
+		else
+			pte_clear(walk->mm, addr, pte);
 		update_mmu_cache(walk->vma, addr, pte);
 	}
 
diff --git a/mm/mprotect.c b/mm/mprotect.c
index ef4e7188e24d..6cc5b99b4185 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -249,9 +249,28 @@ static long change_softleaf_pte(struct vm_area_struct *vma,
 		 * because any access should sigbus/sigsegv
 		 * anyway.
 		 */
-		if (softleaf_is_poison_marker(entry) ||
-		    softleaf_is_guard_marker(entry))
+		if (softleaf_is_poison_marker(entry))
 			return 0;
+
+		/*
+		 * A guard marker on a file-backed VMA carries the
+		 * uffd-wp state of the slot for when the guard is
+		 * removed.
+		 */
+		if (softleaf_is_guard_marker(entry)) {
+			const pte_marker old = softleaf_to_marker(entry);
+			pte_marker marker = old;
+
+			if (uffd_prot_resolve)
+				marker &= ~PTE_MARKER_UFFD_WP;
+
+			if (marker == old)
+				return 0;
+			set_pte_at(vma->vm_mm, addr, pte,
+				   make_pte_marker(marker));
+			return 1;
+		}
+
 		/*
 		 * If this is uffd-wp pte marker and we'd like
 		 * to unprotect it, drop it; the next page

-- 
2.39.5

