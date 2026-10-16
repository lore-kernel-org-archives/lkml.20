Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813CE4E1C97
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167288; cv=none; b=orz4l8g3K+DRk9SvUPgOdPDSK1tcsPMPKo1jm2VdgEC+3MlYlBYt5TJRROnnTDTmP6uvq+BDS/fXWpzRzDJBU5ImXmY4IsQ23Vl5O6K4e/SrqnANgtLsV5JeK8m9I5Bs5aT1dvUg6KqZvOZHU0zCwWa7NHNgGTR7nlrYJoHBZpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167288; c=relaxed/simple;
	bh=gEHy834UvFZ5FTyNJPHtHywSI+FJzQgUIJqTNI8l25M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=WBfw902T/AW36c9nxD2dC8IeQD7glpcDsXcPzMTJm4BkeaxRxJVkC6B2Q9pgaEocWJU7LXIHGJ4/0NHO9rhmfDi/6d0p3giv1B7M9qxnzmtAN0/I3+q2jBmqFs4LCLuFjGKWTUQjEN7kQ4AhxbsQR19iFx7Ssw8hqi/wWQgOqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e16BeeSE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e16BeeSE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-85377c8bc96so59507b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167286; x=1792772086; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqqjrcRtopgj4w6foGEIKIoT7EAlewpzNj52vuU1gDQ=;
        b=e16BeeSEENkDZ8Wksf7J6opYzhmeRVJV8//en8mNx2GX9lXubk1dezCIPwUI3w8fIx
         TRNwcIbE0SeBXwVAgV9A5KbS0WBnd7kWz1MHb6UraXJCsKexIe+Q0gmm9uA1nZ2sGLy+
         UYnD3o0rreEWO8Vjj0jGetR7RzQXNuTEPzAPmjudOPHzQ1+gI7/96/9FOefRkHA7F5Rh
         PV7bg7zW4p/hz8pmITtR+zE5VoDRxeqnxBSWHumAbH94gBC6/k9RAneReOXUrZnma9wC
         EZaSzt1EZj1cAL7ulMd9+8tBJdGnDCA/NBhTGoy2fJPU0ZAZNteKCFPyTN/2zioaxSyR
         ES5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167286; x=1792772086;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqqjrcRtopgj4w6foGEIKIoT7EAlewpzNj52vuU1gDQ=;
        b=FEOLn7SWRZqnfoKuC3ySRE1pVnRSINq01YSjGoxClBwQSHRnP0+0phultyEMco9cJ6
         0re99KUHG4l06ElfEPtiQooArtBAxEnoYBQHYDl2SSU90/pHC7I+bCyTg07erZY1jyFH
         JbphujGV44rXBApDWLFD3sIZz5Lm9U2z5eCA09yov/y83+/hKdS4+itNPeyN1a5fVlMj
         yInN0omB6jRFI2iCOh4YNm+OTOzZmZ2hXwEd+BPvAmjmezulzGRk3hudA5rjUsn8O79J
         Le84KT3cF1yXDyCTLnb1gU72gIJh/P2gYuhY/rdJUpZVeGjRj9vtLoln0UrKdqJytBrr
         nq5g==
X-Forwarded-Encrypted: i=1; AKwUvBwGyk/s4v36R63esM5kdehzAEEbSL6WWz9nt7Z23pHvfst1+ljHjgR2xfJhAXoU62HLhyH01BlgKgYNUDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeN7TYqe5gUJYDwLGrsxPUqJulbhyqizkixejAPrWWT1o2tHtR
	sDlZyj/PeFMIfs+GYtFsxD86F4mnmS6qJXnzbUMZvOll5ESV43pW2bbC
X-Gm-Gg: AYBFou0Ihhlr9PgyvSG8jNwrfEbMG6RjL94lDUT0FIUbkRc+RHaZAspmg3nbS+TDnuK
	2K5c2yX2VwSuusi/eeRd5OABX1smoSuH3fEsTm/KU4b6+uW2nQ6clTE/jYSQ7N5cF8SBdkvKZe7
	j+9/LEJMgecif1ALE1BsOrAVT5BvjVK5LCAkRvuwuFh6ebeRuKyGay3vtGtsfQ4K8sS7aAAf9R0
	wUdtT4Jh/NIAxh+lLKjPK8TOidLyaLtbvhv8AAUVg4tcCMSXJsSm1b2ghIRnaJV9X3MviCYNU+S
	jM4/GJjNi/nEY/VAACZylM3zAs7yDyTVrBNX4OEQL/24tVQ5K3HYY2FopPTRthxY/Yasy5foEe+
	3YJmD8aWlOuMqLoHEgd3ElykwT68bk7YsOxOK641Jv3aDZ0j+1HccsGbzpDE8NEgJjxuMYAxu7x
	sYE1SDXwr5uFbnMNQD/8Mmvv9A7tn6fkpF8u+VDQNPzUxntKBtiblBH3oux5WM8tno5SMEBAj5X
	zxIPsXk3dTNwA7MsT5obD3hzp2yZ9oW8SX1EqpHiE+LLeWvu/YOomXcy3l2Il0gMbRH8nn1UKvj
	6XE=
X-Received: by 2002:a05:6a00:4215:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a04cb1942fmr34405b3a.25.1792167285668;
        Fri, 16 Oct 2026 09:14:45 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b3199dsm1415504b3a.3.2026.10.16.09.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:14:45 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 16:14:44 +0000
Message-Id: <DM6EA4NZEW6T.1QXD6YWB6J9JZ@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <memxor@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf: Load ringbuf consumer_pos under the
 spinlock
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Igor Malovitsa" <igor.malovitsa@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261016003318.529860-2-igor.malovitsa@gmail.com>
References: <20261016003318.529860-1-igor.malovitsa@gmail.com> <20261016003318.529860-2-igor.malovitsa@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 12:33 AM Igor Malovitsa <igor.malovitsa@gmail.com> wrote:
> -	cons_pos = smp_load_acquire(&rb->consumer_pos);
> -
>  	if (raw_res_spin_lock_irqsave(&rb->spinlock, flags))
>  		return NULL;
>
> +	/* Under the lock, so at most one ring behind producer_pos. */
> +	cons_pos = smp_load_acquire(&rb->consumer_pos);
> +

libbpf writes consumer_pos after every record, so this load is
a cache miss most of the time.
Today it's done before the lock. With this patch all other producers
spin on the lock while this cpu waits for it. On 64-bit too.
So "Neither changes anything on 64-bit" in the cover letter is not correct.

imo it's not worth slowing down everyone for that.

pw-bot: cr
