Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F863D953B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788984674; cv=none; b=XeG8BkDlFizEvyEAEC9iLDxUWG2u02J4gPaDOLF7XZggMK5rPmjSyYQefbjcknBmQOkXiDAmJhsCO49X4Xiiey6rAZ432wlwl6oVomzoK3cQRi+0KgR673pGgczRbXOXG/SVQFCW9gjwZ4L4lcfrwyiWjvtZgzeesbU5V3dbZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788984674; c=relaxed/simple;
	bh=vdCVltj0A3eVF+yChMwUN7F8jYlR7UHxsgQGWemLZA8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxpSEPj8v6FDIplGInP1Lfl5FoI79tujNjpj6V0tqt340RhaD3K3vA15MCw9tiWykk19SMGu/2m3pPI1V/L3Y+gIAkvajETRfMs9iuFYnLzCN5+n9eIRhLXfj4hUVLpL7qY88eHHhf6wauuzS7/R5tDQPjI1EmVwy02CDVq3rXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMND5InV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMND5InV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso66289725ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788984667; x=1789589467; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/nqOuwsqgg0fRM3HpI/iUpxVRO339G5Gp0/QcOudjtY=;
        b=DMND5InVN3qowho55ONxe2kN3j+hRgF4I66yrrLyHsKfBOqSUG3fMbUyLZLi3qQoaV
         r3/WGLzOugaCzdJguI9TdEuLOD+sFButvyEeCaG8kpodj7fmiVj2De5i05yaK1/Hoba6
         e9FpI0AspZvmr/OK/E9xjIXHbvDVab/CnQeSag7+LAzZhRhl2RVVuIciHZk1BnYExMmU
         F5f2wU1lopr2mT/83zIzUMWrBue9fzL9u1UvljbKuMJyeCaMPRvkamZsfJvvEr9RhOi6
         yjR2FXoflP09RVj5bSxVMiSbDy15/EP+khTqWGaPlE04QJJPicxftL9nkGKmqYUvkHrH
         P6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788984667; x=1789589467;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/nqOuwsqgg0fRM3HpI/iUpxVRO339G5Gp0/QcOudjtY=;
        b=cCjaayLV+sousuhEye6wen1SG6QO9BMItTgpB4aLVI8T26V3U3Cpi8yzBwXUnJ0DQR
         nQ9GfT3GwF0EKNUIaXs83YqsqvEV01mWw7cndUZF9HVkRD7ueKdOarSx1hpSwQL4A/fU
         pUMcPyGJ1Es6TJNmKtI7KdarGnmAK+L5QTFYdXXCr1UsbyaaQ/QtNE2eTAMlIcF7B+mb
         /VPB579ViUE5BPm6F/W9XCvhE9XK3KDiAv4xXOSizH+WsmS7Il0WdsNHxyb5wiL5H1jo
         KBBzitceBXzMNIPCMMN/dU7HCLs6tf4kGk9nJqvON6XZQfh0BVvOJ0T168EWKf6VZ2Vg
         pGCA==
X-Forwarded-Encrypted: i=1; AKwUvBxL7kp+eXawRGlsUv0/nOfpxZnrB412IW//F3+vwRyJa3izt8sH0yAbopbEqgPuwpsTrdgFBF/BU4r6jCA=@vger.kernel.org
X-Gm-Message-State: AFuF++kI+hUy+0SH0TspxcTmNICkNuqOnaSckhdM5Bahs0KhSH/Eljbi
	58LgLyYxWbz7y8lSEZOM0+IvXeemxDkx7NOmny8OzrjdVrR8tzJcLkHV
X-Gm-Gg: AYBFou131NPsYyWqQi1cgQkTWVqEO59DuL7ZnL7hd+opfH/wOcvrqHhNFtPfJqeXiN2
	HcCRNa8DRBnhvVSSBRHOUyBXKlu3KeeGhpyKxstEbLVED8fWqWuUsahVEirMvRMdaCL7Wp/134H
	ry1QAcIcA8OU+D4gMkuyvlcdSvDyw1c8BUzS51oudFtYm+w3ZVB5zy1uI4OnHqHo2A4Q/S540vF
	HlR/7aLTMXcU64viDvHcJqE0XZXMSqGKYdyroB1Dno2WohRU0iRUK/WNxlKnFlsdM3qXpYpXmwD
	5s9lyBvqAfZGPLBUZ3CNq+HsEBN+JrCrq4T2SWR9DdFCfwwyKdtaFlBKn0LQ7fKtBd1zSk72eoR
	sXaSh+3D2E/YFvgxSQbNcBL/mqX+pu98u6TcIU4rtqusiK0wQxrtCFyunBDKeTZzQwhjtimTg1w
	rmqtsfA8X0BXKWxOYvK/kTwDqidHZFU/i3XW9K2/d+VbLXatIBJbILZp0AHA4ulVPhqAM1rFvlQ
	SNH6TmhqKjnX3vf3168JJdb/+I8jQC6eRao4fcUnF2HW2Mt+p1PJqLw
X-Received: by 2002:a17:902:ef44:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2db1259d1f8mr510415315ad.14.1788984667252;
        Wed, 09 Sep 2026 13:11:07 -0700 (PDT)
Received: from mars.local.gmail.com ([153.246.84.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db63c00837sm41962775ad.40.2026.09.09.13.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:11:06 -0700 (PDT)
Date: Thu, 10 Sep 2026 05:11:03 +0900
Message-ID: <m2cxum423s.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: akpm@linux-foundation.org
Cc: tasos.papagiannnis@gmail.com,
	linux-mm@kvack.org,
	liam@infradead.org,
	ljs@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/nommu: Reject wrapping ranges in access_remote_vm()
In-Reply-To: <20260909001341.6a7c3556259f7cf9a79c1da7@linux-foundation.org>
References: <20260909064231.18693-1-tasos.papagiannnis@gmail.com>
	<20260909001341.6a7c3556259f7cf9a79c1da7@linux-foundation.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello,

On Wed, 09 Sep 2026 16:13:41 +0900,
Andrew Morton wrote:
> 
> On Wed,  9 Sep 2026 09:42:31 +0300 Anastasios Papagiannis <tasos.papagiannnis@gmail.com> wrote:
> 
> > The NOMMU implementation of access_process_vm() rejects address ranges
> > whose end wraps around, but access_remote_vm() bypasses this check even
> > though both functions delegate to __access_remote_vm().
> > 
> > Move the wraparound check into __access_remote_vm() so it applies to
> > both entry points.
> 
> lgtm, thanks.
> 
> > This is originally reported in [1].
> > 
> > [1] https://lore.kernel.org/bpf/4ef240a5bea36ff84df9589671367832860795159386a4c8fba546a0fa8b786f@mail.kernel.org/
> 
> Ah, bpfbot scored one.
> 
> Sashiko might have found more issues in there:
> 	https://sashiko.dev/#/patchset/20260909064231.18693-1-tasos.papagiannnis@gmail.com
> 
> I'll optimistically cc Hajime Tazaki, who has been doing some NOMMU
> work recently.

I got a similar review (from Sashiko) that current use of
!vma->vm_file isn't appropriate and should use vma_set_anonymous().  IIUC
that case happens only (I may miss something) with /dev/zero (via
mmap_zero_prepare()).

I also had a patch but am currently waiting for Lorenzo's input for
his work on /dev/zero, which mentioned in his reply.

https://lore.kernel.org/linux-mm/an8BlTgk7sc5vFJ1@lucifer/

Thus 3 comments of Sashiko (all about vma->vm_file) can be addressed
in future, and are not needed an immediate fix.

I wish to ask this to Lorenzo too.

-- Hajime
