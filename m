Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AEB2931F8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790488659; cv=none; b=ROZEKIqfgLjWYW9vYxkmhmh+lG9HtM1RmWjh9PFExxd/iughYPWObcZuuFHWWCMWXDM5oY96JBWX0B/21zUk1Zjas1AMyVubpo/5YE7kvMR4Z0nMc7yEAOAI2qpXFinOlOGTXdpY3U+dWvLilMyxOWxJsCf2AH0uBy6WzdctJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790488659; c=relaxed/simple;
	bh=0NKpelGRfQnQzMzeXQTDJEbct8OZ7RHNUTpnJALTYOE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TVVIYNtucVvLGOiXleAf03bodIPyMYF/f9Hjo5L2J1AK9f+Tm2jaDnk4eaCcxRDYcNGAdrXzsYzSt2922G+99Q5HN1MZnaOGR3waQ/lBF57mt5r8OJvQZhSnvoU6/P9blqNjlH/C016UhsEumseZPhad8UHQgSd9fypCDVj3PFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=zvCXaymn; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="zvCXaymn"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-8807e5b8fa9so1113658b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1790488653; x=1791093453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Q7ojo/+9f8btc9QXVuwIwQjhu8wDT9QIZhmP31kU+M=;
        b=zvCXaymnRsWVKRgSQATT0o6qfLAvCP4Nh3v+XKr2Q+tVZOamteXxHS92Vg03P5t4rj
         cdjnqXx+FG8NnR6xCyxF1/sq8wVDJfXnzjTNDhGW5SE7oPMXhGG+nedYMBLb3XJ4aeqh
         oGFSjREDj3CFvKSGPTj36YJsc/vwfZZSgyE+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790488653; x=1791093453;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Q7ojo/+9f8btc9QXVuwIwQjhu8wDT9QIZhmP31kU+M=;
        b=um2qF8k5Biq5N/kX9Tb6bzFLncTvP+yZgmNTcbMAnbwzxWJj8GexnWs9U2wkvGRz7A
         qKZjSzZMv/1XvcZLMcKH9bELYMGTPtHBOjziqUW4xb+pXz5D8MCO/Mkgi1+kW0nxPOKe
         WyccoW7ysx/YfwXg8nQcadYYpGlKGf4sMXrSmNkMvEva4qBnjoyry5BXlhugtpTLb5h3
         L0AJBFWu6IBtHJk0BztGTIZkfLSQr1LayeCgmuEYD266e8qn+QhpCMFdvdMsj6Lr/QSi
         9Q/E/QdjxuJ6PPwVfK6SeWxDMdQRVYa32ZcUYdwNaZI7wIKhuqn5/1upF7Lrv2SNuYPZ
         lwGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF1danv7JnrIgtydJfzJyi2VgKwzwJ02RpcAE1q31vrinkxvzWHCQVnUwPN2Ei+WExuxgrmcRDF7mXZ0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mdy5J/nRp1F9U0kd4NRvPQ1I+WCyUdQuxxBJOXS4Yy+Yflzeli
	RKpRoYHlneHfNsSbmraJuqG7JtH9o4bwct3HuRaZSjxmSnTFfsJbCRTQEjo5LJSUEu0=
X-Gm-Gg: AYBFou3rcOGyWIQDTwHWc2EiNSQPROSfFWaQlITcutPgoh96WIDCyqS84tPSgnt0b+Q
	hz2Zo04h3Wf000t7fg7D3N2e0Vs2OEwNB4u/DwjjUFja9jRho2U4fr5YFiIbF4QnoHBEkYTRh5r
	i+2U9J2PtG7Q6kXtujXKltP0+SUrDu0D3Qy2XPHHdGNVM6m8HtKImLFR/JFrKL33imTWqFbyNk6
	HRdkddWpSnuFiBa+kvpfcCo/isVD+G15TNM/utlZrodCFLNulAlbeew6m/W0HQ+TMzmVlwcwW/K
	vyWpz+7oimZg2MNiq+VmsyT4cQ2MDUZWdNENJKcybzYuerIPrG7OY9ZXxac2D+I9R2NgCtK/vOU
	xz3Chp7SwdofiRaqbS9gMbeLaf34ttTRUV7V4av+XWUHqBsxrw8XvEmmMHbL5UkayEnxv0Lt8+c
	yK6v7Rd7x1kWrQ2UTWAX8U931Lwkd+AknPsRnVbSavMrFxkCMLr7xL8VtRl3gA3T4N
X-Received: by 2002:a05:6a00:340b:b0:857:7337:5db7 with SMTP id d2e1a72fcca58-8802a2b91d9mr4532210b3a.21.1790488653039;
        Sat, 26 Sep 2026 22:57:33 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8808182fd7fsm2328266b3a.39.2026.09.26.22.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:57:31 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Subject: [PATCH 0/2] tools/mm/slabinfo: report sheaf and barn statistics
Date: Sun, 27 Sep 2026 05:57:26 +0000
Message-Id: <20260927-tools-mm-update-slabinfo-v1-0-a4ea0d4dc136@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEawuGoC/x3M3QpAQBBA4VfRXJsyq/y9ilwsBlPsagcpeXeby
 +/inAeUg7BCkzwQ+BIV7yIoTWBYrJsZZYwGk5kiqw3h4f2quG147qM9GHW1vbjJY8W2z0uqqco
 JYr4HnuT+1233vh8w9vD/agAAAA==
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Seongjun Hong <hsj0512@snu.ac.kr>
X-Mailer: b4 0.13.0

Since commit 2d517aa09bbc ("slab: add opt-in caching layer of percpu
sheaves"), kernel exposes sheaf and barn statistics through sysfs but
slabinfo did not utilize this information. Make slabinfo report
kmem_cache statistics including sheaf and barn counters.

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
Seongjun Hong (2):
      tools/mm/slabinfo: refactor slab attribute reading
      tools/mm/slabinfo: report percpu sheaves and barn statistics

 tools/mm/slabinfo.c | 303 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 189 insertions(+), 114 deletions(-)
---
base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
change-id: 20260921-tools-mm-update-slabinfo-8eab37191831

Best regards,
-- 
Best regards,
Seongjun Hong

