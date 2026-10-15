Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284602931E6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024891; cv=none; b=O81Dw1STvsnc22LQuF+JNQBPaGQNDHmtuUTw++wr/Wuat7d6qqyrwblymJqkliSJKZ3BhkewatuBvb/Gz1qQO4b17xNoxg/S5Emmr/SqZBcULNrXVUYOEaOcA1jjeIAynjDSjQMp7jxJkQ9e2EuZZJvkT8PAow/cl036LItqb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024891; c=relaxed/simple;
	bh=Pf5+YeQcPloVKTlYpAhhmE0RtcJ7wod9H7wGMxmpep0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=emd4NHo/B1ea8v1We9iYwAAR5eXoUJTsD5/0cWqj5wxoCHwx/xFRfzmKbRHNJ13hsFGsQVl/pn6XE6ioxmLU6GtN2foXoxVu3F3uOlxzy8ng2zXafbyPcxB7KAvyiZndiiotn9yDnwJH3EZTOLW4YyUHbmN7SOQPH0MibOZFTl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e+DMcqUU; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e+DMcqUU"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso5698340a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792024889; x=1792629689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pf5+YeQcPloVKTlYpAhhmE0RtcJ7wod9H7wGMxmpep0=;
        b=e+DMcqUUezx/+5tCerSipK2GUeSGc6pIck6z/lUjo4g9i8/+ve1MuFEe2/szmuymIs
         agjk1a1EMDWcynLJHvvzFbOSqtXO7sdw2ZXQ7vPHT+54KjdQDwBhtmn6XxxO/Wq3BL73
         1AVd6gkTvzfeJMbKYTs39xbdXBNbxgmE24dGm9MwsUu6dkSVAsvl243tyww4y0ROchGZ
         z5RrVSWhmDzCQQZytUKgalGhFkOgEPeC8PlTmXhBkj/2sL8kFhWehp5pfRSLX5UjGvEE
         vMB1HNSGzW4UqxehmxtRxFYyYE/9jwFwfsNC9Gexdq+bSv8eywilGp3JKEN04sfuIc7F
         i7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024889; x=1792629689;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pf5+YeQcPloVKTlYpAhhmE0RtcJ7wod9H7wGMxmpep0=;
        b=o4sca8cfIxvT2ZDf18XgL13wlwoLkY05G7WfwT0jGdgtCpumuYSuULLKTlK4YbBViE
         yNIc7zp228Loz6MflA5lCTTOUEYv6WC/Ii4sGMuMFEFJDeSfVbgpcdXNdbpjsFKBFa82
         YfVaztWaiqFGPcWsi0DpEvpHSm/UNCKLRul+36jVyLHk6ZNWyQRks5rT+tjtBTFLa7Xc
         dn0COGmamNV/FsSQ9hoKqj70t8HXdLbgTHh/kIQDaFFBr1jEMi8VX3enT4sg5dDTvE74
         eTTP2Ecq19gIm5ZRjJ9F582vcEauEIp1j7QmSB8+nNpQ1wEx0zwz6tXUO65jUwfCiOjB
         COXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL2lH/YgHl4lwBL1u5lWkysJ9azeFyf7OJh5zZDK4zQgt4zHVzI6pKSe8cekc3QKmEAFEJAGqzdIGoHkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEedHNLxfMd1rt8PTfvq1GrD9gsxuo4HHEgWqLK9ESCf2XerwE
	kXitQtwXAA749BcIKp+JOaC2L23O5GzKPn5yzGSFaFjPZRW/7yPUQSiRv84slq4qt2clmgJc1d0
	L4HPEilj1bUDSz8H1MNPMig==
X-Received: from pgac2.prod.google.com ([2002:a05:6a02:2942:b0:cc7:e840:a614])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c4:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3ac8af94eeemr1509712a91.28.1792024887625;
 Wed, 14 Oct 2026 17:41:27 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:41:25 +0800
In-Reply-To: <sashiko-outbox-172057@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <sashiko-outbox-172057@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015004125.3503453-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2 1/5] scsi: ufs: bsg: Complete the job on error
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Brian Kao <powenkao@google.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2026 at 12:32:09AM +0000, sashiko-bot@kernel.org wrote:
> Because job->reply_len is set to 104, this copies 8 bytes of adjacent
> slab memory to userspace, which could lead to heap corruption and
> memory disclosure.

Pre-existing and not changed by this patch; fixed separately in bsg-lib:
https://lore.kernel.org/all/20261013132708.1669415-1-stanleyjhu@google.com/
