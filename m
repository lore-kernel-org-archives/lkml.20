Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61B37AA78
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168434; cv=none; b=NpI+cGnVNYWLu3J2mP/wQgZhDi61LgjCT5LcoT0D9ci5LRUeO2ObLr7GJGFal6kSqwCUGE46aZ4mpVxhlFXM2bY/hREVH/YBJUsQAcGHtw3Tw+CshyZFHhmcqCY1UWgCzUoiMrK5bHVV+vjgvDXKcTsawyI9TX8clqsEZzVUBbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168434; c=relaxed/simple;
	bh=fJKrUMd1G0IBo0I8qT/dKyrOBSwsrbO7w6cKV5h30LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PiX7NIZED9jfPkXoJur+7wSDJXNmaiJuv2EFJf1lrceE+t9oyzRendaKlvT3IVw033cyNg2F++QPGDOgwTpYvJxyxu6XO3ncyv4pzO4ZZB+Thqorbwphks3xuN61nK/CyRCgGObWtQxsx25A4VqJbScp3anRLbjrfNMP8wb2iiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=gGc1GgJs; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="gGc1GgJs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fJKrUMd1G0IBo0I8qT/dKyrOBSwsrbO7w6cKV5h30LQ=; t=1792168432; x=1793032432; 
	b=gGc1GgJslmPzKJxrsbnSbI56vKjqP55cO4KjB3jvfMpg1Yrn2lsj1wzpHksm2mL+C8jMFLH3Swu
	E7Ts3yQIp+dYgqYsSbG11DZFy1bFbwSv2fycoiA2B47pDVBmKL6SGkJq2ng24M9lLpwNshlNwzcDI
	hGVYu/FH+3dSdMDj3dIYw7wgUWJwvGyIyhYevQPQ4QYJdxa3DZVNUyTzHi8dQCuw+vn2albh5zkwt
	30jsPGrFPEblUN7317qPs1kuGRvZTJT/But1yHiuzXHFIQq0dht92F1SbUEXZ2hFRdPUrfiM9Xrhq
	hKhb7B4WpOzdLxJrPJ6p62O3Q6sKmMQkVGcw==;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHksR-00Fane-TM
	for linux-kernel@vger.kernel.org;
	Fri, 16 Oct 2026 12:33:51 -0400
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c263415982eso14293966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztgK5ZfHsCAkUf8O39Ief0sPUsFE6Jkj61MzTU8DZmcojbF8WveRwtPoEGu4NvF4OdMjvhg9y7VR9xVo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmbodt7ym84B/isq4nlQJHvkBsH7z63lzYi9eADu70XGAh1Qqj
	k7brI4kWRVStBrwTC1XrZCnM6mqTFQmqXnJyvN6Bnm8292SbKm+fWDaAqfXbHdtGjED8BxzWYrG
	KOoJFG+mYohLZKsnyFXXujCgbPr0WJz4=
X-Received: by 2002:a17:907:c00d:b0:c40:80eb:c541 with SMTP id
 a640c23a62f3a-c419a05d6d0mr30053166b.2.1792168430981; Fri, 16 Oct 2026
 09:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016132510.789715-1-nickolai@csail.mit.edu> <atJBK6hWYh2AqXwK@thinkstation>
In-Reply-To: <atJBK6hWYh2AqXwK@thinkstation>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Fri, 16 Oct 2026 12:33:36 -0400
X-Gmail-Original-Message-ID: <CADGQE7F2nLDe=emG0qVMRHSPGtqDMRB3_313C9sQHoiSRUTQFA@mail.gmail.com>
X-Gm-Features: AclHuK-ldb28rC0chx7CFiWEZ5xqOK-MBV-RXV0XASoMu-7VUmiEbSreuv-EtaY
Message-ID: <CADGQE7F2nLDe=emG0qVMRHSPGtqDMRB3_313C9sQHoiSRUTQFA@mail.gmail.com>
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after
 concurrent resizes
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	Vitaly Vul <vitaly.vul@partner.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:46=E2=80=AFAM Harry Yoo <harry@kernel.org> wrote=
:
> The bug looks valid in theory, not sure if how easily it can be
> reproduced in practice as resizing should be quite rare.
>
> (A bug is a bug and should be fixed, but no need to hurry in this case)

I agree; seems unlikely to happen, but might as well fix it at some point.

> So it's Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") ?

Yes; I didn't think it was useful to include this "catch-all" tag, but
technically, that's correct.

Thanks,

Nickolai.
