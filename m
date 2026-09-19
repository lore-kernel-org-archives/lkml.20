Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A81ABEDE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782527; cv=pass; b=ePe7xmFb0YgLBV/K01jvP7jiuue8eJP+OXiQC11NhOPARvdEewiD7/vtJZmtYBhoRMX31Cn1/JwOj1Q9Kgdb12o+yAN2czSPZ2t9xeup5QjH/srGUoNcO3qLt+JILlIJIxr2T+nkCbhcAecNrQsMA4VLOWQhnyiYwDOmZBqXyCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782527; c=relaxed/simple;
	bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UmvYiqyWDddmfY/eBGPm/5qT1bY4yLOLKjTyLn5HzY42cGaISdUHNttnXbBWckhpvKF3IhgM/ppkzmCgpnZKjHugaMPG3BSAUZ2vJqPxpVSDj0O5+ncQoPwVkHiouVMQ6peKqBXrjgJ5CuJi54pPrlWqDS7qE/3RKfrUj9XWpw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pressgrupdesk.com; spf=pass smtp.mailfrom=pressgrupdesk.com; dkim=pass (2048-bit key) header.d=pressgrupdesk.com header.i=@pressgrupdesk.com header.b=zQdYW9mx; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pressgrupdesk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pressgrupdesk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pressgrupdesk.com header.i=@pressgrupdesk.com header.b="zQdYW9mx"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so2088174a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789782524; cv=none;
        d=google.com; s=arc-20260327;
        b=X/51SYihH3poky23XqiHIHTLZmcZVNByVsPoIdqD3WgErhN22UYusTBE1/kpOSSB77
         FAL77GMEQ7jv4E3X5yJrYzAGSPTJ/c2VBpwEpmdstOg+tO9MxKzSI//Vka5OxwWWUFDP
         2h42F3EH8UJkeK98SK0v9+57cMR1vGL9iGTgRTbrqCi6TEn88QISgPHb0Aur6aOHcgOn
         CGwjAGrrM5F4irgkskUyWISJdYSH4/P9vEsIq7kk0ZZ6KeJVbNeRKxPJHGKuAsZna7pZ
         O78NLTqxEHkwKEw+bQC8XsA0EqYOp7cp93EvN9+MRDxDTavcAZbZ/5K/phuQ3ToqpKGg
         9YzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:sender:mime-version:dkim-signature;
        bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=SqpkY3wtqJB6qmC4SCHEj5vkN2AFt/HqAlSAHp7k2iK2yJDDqMJ3HLW/nvwHCgwS/K
         xIfgYm1Ry7auL66cOfyUVjaHgpWK2KDw9xG2q6eoQMFrBqvGbtFnwDAOlTLlSN4W9xUr
         duf6zedxrovNNLR5p3mTsTaY9Uefy6nOeMXiK9gbtGcQpz3x9dFrU+LeNx60XkB9CmHc
         pOgQ9yZ7/FO5CTW1DQtYmeXIPPllS62ocD9dH0Z4KrB9yZiCebiMmDyEcgKX1G3Kpq9W
         kxx/mfmSlH5rSR413MF7AOWgZya0sNFbh0/TvrCiLtQWLgejegFzgDpAYIWU2M2ynNgp
         EfMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pressgrupdesk.com; s=google; t=1789782524; x=1790387324; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
        b=zQdYW9mxoHpj0OOiisFfDPp962j/EbeiT9n+QBK1CK5+UYF9VI2R3wlLo5DMoFj3Zl
         biB60z9Kd+hZ94H8v2WpLy2uEB6DwL83Q/XYv1y0p3VxP+pz1yacbOl/8zZR10oXi5Yd
         P+lglzR5dFLik04ccXV83vT+r3KCgqMNPeueC2p0IqTH0TuT2GUJ5bhoH2VPCO8FdCNQ
         ylJ5kAVxotMIBVLlKn1BbaU/ujEr/wxf4/QLqXNbvYMBiVEBl49ltrnhClMhbMm6C0JQ
         n948RgwxFxJblq/VfsvKocTRfwFsdYozLpJX1mcdwRn7iEPmxLs+r4xAdxVvXD4gfBf3
         zl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789782524; x=1790387324;
        h=content-type:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XxiyVCurDpLs6gXSr1N6NOajH5tev6m0fK8akbKqDUU=;
        b=BM2okJw4goMLjHXZfSHQqHx3qKNKExJyK1OR6NcwBb9HOdTbjpWXH6Iw4htHu9vd6t
         BJytDfgO4MQqAfStUtUR7iNj2pYK3Q2FPa0lplrMWBLxv/XcebzArHnmnL453rJDcws7
         st6f7DYNPP6uVvUi2iPR8ki22WQHpQAhraGoNs9b7p6Q4UEZbKuj5J5Qyu3nkEHsxLRr
         CPYeONgRQE4wI4Xpx0aDeLDIVjlWudaD6N/BKqBTOBQvmVsSvxazmcwhGMaAk30zhNc8
         /zLo7/gclwS341xutMImax1fZoQiq7juP8cRxDTkdRGq2KICFzS3hjmkrfB+9td6GD2S
         QFgA==
X-Gm-Message-State: AFuF++mSgGFBs6xPMeh5nXvyELxYyS4r1TujpZuZcqm5Ecn7kJUJYwOX
	4I4iyWlWbOBXhr64eiZSk7R51F9ijmq4YtNbnTeJCU+5od2vcRowXzYTMj7AK2qYlkp2Di7hclp
	bM7WtH4ixAyWA8VWDEiZO5wqZ6hbA3zyhFHqdk3Y9GCwGtQ/j+pP+9w==
X-Gm-Gg: AYBFou1CJLB1SbvawEpGHwdWrac5PhJeTAS1TdrII6DJBPmFo4sTdLUM8hG4c1B3AuJ
	NdOXoYfb3GUDqDPr7kae1vn3BCJVBWX+S44outGNiaRtPj4X54/QQfIcTOrf4PgYuFh5q25twR7
	Jb/wvjISSZZduYtH2js/hHjahL9gp7Roa/LiZLQEZ/GGTzZEkEQOZVNXQoGW8thMafvbhUGcBGt
	ae6a4vtDL3qk4lJk4C/1L2e27qHw4UytvfdepqactvUq/mcSkSxlmNj8CSPyeDe3g1/9embYoVh
	exXM9CVXNA1fWH2V+pgtrxWGNstAbW+Wrea38Jec8pEamzu66bYUurIoGwU4nevMycTz3WaCPnE
	uKW08BAubUSN9GMjlcaonHGk=
X-Received: by 2002:a17:907:94d6:b0:c29:f5d8:9c7c with SMTP id
 a640c23a62f3a-c2a158869b0mr358128266b.43.1789782523761; Fri, 18 Sep 2026
 18:48:43 -0700 (PDT)
Received: from 104313752547 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 18:48:43 -0700
Received: from 104313752547 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 18:48:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Manuscript Submission Desk <admissions@pressgrupdesk.com>
From: Manuscript Submission Desk <admissions@pressgrupdesk.com>
Date: Fri, 18 Sep 2026 18:48:43 -0700
X-Google-Sender-Auth: Yw95g-uFIBCMqfBnCXtTlWHTm0c
X-Gm-Features: AcwNN1Wcw1M45hxvS0762xJsvrQNF1-cq7XqIKwMBKvPHvVj5r0Iwdb8i0rzEgQ
Message-ID: <CAF1wJJUvtjH_Ruj3GYnfD+B7Lz95H3e1PvK36b=s71ptibOMog@mail.gmail.com>
Subject: Invitation for English Manuscript Submission
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Researcher,

We are currently welcoming English-language manuscript submissions
from researchers, academics, doctoral candidates and independent
scholars.

Authors working on original research articles, reviews, theoretical
papers and interdisciplinary studies are invited to submit their
manuscripts for consideration.

If you currently have a completed manuscript or research paper, we
would be pleased to invite you to review our submission information.

Further details and submission information will be provided through
our manuscript platform.

Kind regards,

Manuscript Submission Desk

If you do not wish to receive further invitations, simply reply UNSUBSCRIBE.
