Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63861330B01
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861364; cv=none; b=oiV9J9hG5giwRacfoJkbv6X2tk2eshp7tNRM5xRFpEYCWAZFFetJ59r83x/WrF6+H/kFg1VdWRC7rUtxFNc/56MPK/GWT/mBZB5kincwpWqzq0kT2lUC0BHVacCPc2OTujQOtlnVOqykgKwY2oLXqg5JzQxq0WI0JN1PeW2JCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861364; c=relaxed/simple;
	bh=qhzcIOoY2hosLyVIxdPxsmyEewTnK1YjZA3gz2txs9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLsWOKmZueNIVwTwouWbquksDDF8YasqdAX202ZYKRzAAM/zNlkHayUQ49kiMgAl+3ocT26LAKtBMnKKihKlTrlX+rPqvbWs3Lo/zl/x6aHLLwaUqKySyTiG7RX8bGmGfp4E9Hm9IHA1yQY+WfJSn/He3YzGyifh/BTOqjya7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RvhAHV0S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RvhAHV0S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso59720305e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790861362; x=1791466162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djo86y34WOc5FBXQPseI8JTPk4toU7ySXcp+GeD54N4=;
        b=RvhAHV0S2K/1fncgugK9c9V6+RABQEyMM9IfFhlztnc05JOL1bhrTEOzp8dwA//dgx
         /kfCXemv7nNkNo5fIQCLLMfwAg3Tf3MYF4IXuXxiumFaL45Kk7So5jJFVAH12SjMYhKJ
         vVNs4YRQMh/czuLcXOslI/aa9NAjxx6C0Ik3w+evd3BAFo0AjTI7CkRxp7vnA/stbVyF
         nb/KVPfq2UrKBOLNWaKyHx0eTLA2zOQM2BvuulkQmIB8ubJOZaEOlgZ8tTpd2kotm0vb
         1dTqGjz4hHP2tTLDglDhS/YS43JCKBVs1DOzbpq6JzCsuZCFkVowatwkPu5O3zvPEaPU
         aiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861362; x=1791466162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djo86y34WOc5FBXQPseI8JTPk4toU7ySXcp+GeD54N4=;
        b=UvgXurK3jdRda1Bz3q+XnK44BFl4ETyH2RkmbWLadnUK9zVvwUiXbdtkxgHiyf+/vb
         0WJpW4oSbQ8LBTO7bUUIi3RzyX/aPfdPhnRHlVrjvQ4C9v9sfpf1c06wFxr9wtBO/87K
         4HJE8JNLoB2EllGnikw0FgHrDZ2NsU+xJW545sD5ZqJ/W/QLFB0Tr6LW/e4lEfGPq1iz
         iVuRV+xiQfUVm1FFrp0CihBAz8gaeGk4DaYSpxKPRyzWeKLQ0kslGnV34Oh2N0EhVrvd
         TAlXiivojFOJOsZU1Us7zm6MOj5ospuK6agnrDLSsfwS8rlmxp74LWrfCyKhU69r3WbK
         WrtQ==
X-Gm-Message-State: AFuF++m0Tjy01643FEHcshtpDQy0mIzfMfANl+FQ6I7Euxcp1IUog4ee
	Dom9uNLPmtd3CbY8o3jqd9jpTRigVsUwoPG5RNCEzBsVVCz/IoCnb/FkHI2a6v3Y2QU=
X-Gm-Gg: AYBFou02ykcOdtkVgafq/ImD1AqwALNi3x9qXjGzccm2+ZJ1OMvLRm+XeH9QEOEppmM
	HyIiDcJsBTvhoQIKtHdc1AlWJU19e6R5EReYfrGjksJIiJkwO5C3m7GzH8tKzxlghEUGcX+k0zC
	mZl8sByIZwD/vY669CBWTnNOySOu+Lzug22DkMAo1Fr0/DVZ0DlVa+UJPnjUuOL/j7+MiwOittW
	SMtOntaPGNJANvHVbYvk6t52dHSIrw5uE/72BqVt+4mq4CqDLpjbZKYIWbRzJrOGIwBPLBQSR1f
	GFCbjV9TktAeYUKlv0+A677/wTW5z2LxCkSzPHZvazwN825HcWjTUkiMvCwSHkiaG9bvliJspU4
	O8DIaWlrfGNr5YMuUiL3qQcNnG4UISbim9saIyrEfgKBmOsnO9bmqMXRn4ulytOh+ZQVm5y256L
	vSf09bKNzjGyLMm2E9TqrO1CLXtWyka6Y6WcxzZ/BD2CxWYqe/soi0UCCLG1cbvu5H1wjpcr+uL
	9kSAafPVkdVExxLYGyYU9UnmgA4
X-Received: by 2002:a05:600c:3486:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a01ad9847amr74558815e9.1.1790861361167;
        Thu, 01 Oct 2026 06:29:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.thefacebook.com ([2620:10d:c092:500::6:7dd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a024a85409sm25779795e9.15.2026.10.01.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:29:20 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: david@kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	osalvador@suse.de,
	raghavendra.kt@amd.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 4/7] sched/numa: separate VMA placement from scan continuation
Date: Thu,  1 Oct 2026 09:29:13 -0400
Message-ID: <20261001132913.486570-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e1728faa-5d50-48af-8ba0-5098be9124eb@kernel.org>
References: <20260930112206.205083-5-gourry@gourry.net> <e1728faa-5d50-48af-8ba0-5098be9124eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 12:44:50PM +0200, David Hildenbrand (Arm) wrote:=0D
> On 9/30/26 13:22, Gregory Price wrote:=0D
> > -static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struc=
t *vma)=0D
> > +static bool vma_needs_placement_scan(struct mm_struct *mm,=0D
> > +             struct vm_area_struct *vma)=0D
> =0D
> mm can be had from vma->vm_mm, so likely sufficient to only pass the vma?=
=0D
> =0D
> Apart from that this looks much clearer to me=0D
> =0D
=0D
ack. agreed.=0D
=0D
If nothing else comes up on v4, could you please fold the fixlet below?=0D
Otherwise i can spin a v4.=0D
=0D
should be conflict-free with a git am -3=0D
=0D
~Gregory=0D
=0D
--- >8 ---=0D
=0D
Subject: sched/numa: drop mm argument from vma_needs_placement_scan()=0D
=0D
The mm can be had from vma->vm_mm.=0D
---=0D
 kernel/sched/fair.c | 6 +++---=0D
 1 file changed, 3 insertions(+), 3 deletions(-)=0D
=0D
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c=0D
index 3b30786ded3b..095289d3da3c 100644=0D
--- a/kernel/sched/fair.c=0D
+++ b/kernel/sched/fair.c=0D
@@ -4082,9 +4082,9 @@ static void reset_ptenuma_scan(struct task_struct *p)=
=0D
 	p->mm->numa_scan_offset =3D 0;=0D
 }=0D
 =0D
-static bool vma_needs_placement_scan(struct mm_struct *mm,=0D
-		struct vm_area_struct *vma)=0D
+static bool vma_needs_placement_scan(struct vm_area_struct *vma)=0D
 {=0D
+	struct mm_struct *mm =3D vma->vm_mm;=0D
 	unsigned long pids;=0D
 	/*=0D
 	 * Allow unconditional access first two times, so that all the (pages)=0D
@@ -4313,7 +4313,7 @@ static void task_numa_work(struct callback_head *work=
)=0D
 		 * VMA candidate exists. If a scan is already in-progress, finish it,=0D
 		 * but track continuation separately from starting a new one.=0D
 		 */=0D
-		placement_due =3D vma_needs_placement_scan(mm, vma);=0D
+		placement_due =3D vma_needs_placement_scan(vma);=0D
 		scan_started =3D mm->numa_scan_offset > vma->vm_start;=0D
 		pid_scan_allowed =3D vma_pids_forced || placement_due;=0D
 =0D
