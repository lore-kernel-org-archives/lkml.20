Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F6238159
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018818; cv=none; b=m7d5cYkvvVqc+XVMECPIpSBIzV5Mp4bDddbiMrziGPtwgm9KYoulWoLLmpnkA4FhdEFzjWxXdZZXZ11we+K8Bd/PNojxg78PGx5wHuf6O6x9Vfk8Cy6nD5QzkzoATvIUjLFc2/oqPEHkPeo6kiNZrV83gpO/QxsijdG2O0YxDvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018818; c=relaxed/simple;
	bh=qh51favisqRYFIIJw45kc1LAAx7fR21479+AvfqL/04=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Lx38cbM/qdPz8bfNwrxxd1lnZjvZU8SVEiiqYlKGD08C3XDj7iAulWyJDzk9JSnLGcXiWbcG7E4jOrwRVyzHn+KHzlf/gTBKsH7hcKV3xSTilZfyWn/6s43xmrUmgIsv0s5fnCMU/lZz5CgElWkr3f2IIROEPEXUHne5f9GYFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=o+T9xXEZ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=aBtAL7HJ; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="o+T9xXEZ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="aBtAL7HJ"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TEf0xH1322383
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=8ymD
	ovfw/EFXV/LaI27PWgfgegjJSquVlVvW7s1UYGk=; b=o+T9xXEZ8enT9OA0oMXX
	MAwHYlBvVBNQq/jeJDWvIJXTZNvcPRZPR/NMQFGbDwud9gBXxSv8nupTfqjdIWum
	JPRQsdHKxBJSdb+bbK2Ast6AriOck1LKP3Y5rLtlAuImz53Tc6zsuWqevgLS4Hlk
	XI79aokYsSont52zNxNWqDAUdn+59yzIAUgpgRrUlZoGDmKysiWCNF/Ki8xGH2eZ
	Jtuyaxv66aS5sDXDd9d+V1erALxlKH4hruwqaIBo9r+OMsauBA8rrQhbAQ+DPnRC
	cIXQWQ/FW2jfmg/e9gIdFZhYND1MKch2MKuDbyTmyKc/XXZU7N2yjNsowcRP1bXW
	fQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbsppa7qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:53:35 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb2a46cb5so51405271cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788018815; x=1788623615; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ymDovfw/EFXV/LaI27PWgfgegjJSquVlVvW7s1UYGk=;
        b=aBtAL7HJTTf5uIPdZphj88AXDN4vNoX1Wm4cY1YqGKVtE1nTf7jhxpPw1B73WblaFJ
         +rUj3aWn2N/p09aR0itbLaNqCtS2p/Nxcjp19XQeN2Y5asuJlJgSzmE7J9/N8UaoMjYD
         oq7OHahqVmdNUVv63nJDmf2hcamsf3dfTLy9QAPHZqDEvGYFSZlN5yRIBZjIkLhhWVPp
         tN78TpMPCSE7RNtV++igtwecRJH2DRAfe2tzvgPv1IniuCpBo/FYTrwkszEVw0NzAUmF
         FGlNtPQFeAqHy4i6WVyW9+5UJbZHejw7Vzs01LYR97ahJUmPSiWR70NUHV+5HJ9Jv4kA
         SWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018815; x=1788623615;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ymDovfw/EFXV/LaI27PWgfgegjJSquVlVvW7s1UYGk=;
        b=q8rteI+dIdgG7tiUXZPXxRwlH/sGxZvnyfssW0ERwo8jiDYzhOgmZ4TN70DP4LGrZM
         1rlft+/xoS9elgWYWLBi6kYALI0E6NhVi3Os+wpeA0P4/97Yr+0JB15we7zVf9+hHyuZ
         r5Ez241nZzbqxms9nffGFtDyYR+eXQktM9Y65noAlUjf2QHaWE81t7nyDkT59OTgo2eF
         cIeJr/tbTroq7n8WPqbjdFIwKBv/mm1EqGGkdnYE7we9UX3A+tbZlqHzGraiMuXEf3oE
         ttpM0NpJrahltWKQ6B10kXCtTvwU4KfiulFLuM3XgxvmHtmID6RYABqD1Nu3JJs+j9ya
         evvw==
X-Forwarded-Encrypted: i=1; AHgh+RrnwzA7QtOW9YtU02RoX1kKKOf7iGWpI7XcmOk/mUNS3R1sE7UG/GBZe9AorwSs0Z87ERk587K8Jm+zrEw=@vger.kernel.org
X-Gm-Message-State: AFuF++liRm7KbAaT7CWbNXQxi4tQCuQtKPas0SaZVrEek0mKFYrAUj4q
	85RhbZhlUGoQvn0Mn49WVceiOVYzdDUBOzqSnxE7fyaLnYCHl3wmbyjnJnkLZPEFfzbOcdv6ZIS
	OoPiggckU6C8xDNVqh2mLbGXNDztVzkJEjnEfKormXMrjJL1w1SNLAOAxGw9uQQ==
X-Gm-Gg: AR+sD10M940ohvZNZDqirxar88JYB3W3VFWo1NEhnJdhXLxVuz4STvL6559uhlEyz+T
	+1fvydVb4uExeXjYwcCvTbvJAgu1vZA+7Ft69VpZTpTnoqn9bU8G7xDjVmRvqESb/QW653/yEmL
	cSWmNYMxnkb4mcWuZs6aAyDT2jpJIb4t/wQVKV98Usj4WXnNB15mLWC3WSoVq/B8x5vucQdeHko
	yH2b/dCsp9vGbieOLCMROxPdNGvCQ7a89GvMRwwWIYwFj0t1lRFCyyjiLiS4058SP1etayHcikC
	dxUnj6fXfEfyNFSs4Mzq5iPfD1a5DSEKSoQd8Gm3CHD6H+GvH+dTBVwXslI5vjEgMAMkUsQvd/K
	Oe7hwwrF9+8r09zduYRd8w2PbV+oh0M/hz2c6hIc9rg==
X-Received: by 2002:ac8:58c8:0:b0:52f:f546:c683 with SMTP id d75a77b69052e-52ff546dc18mr97024341cf.29.1788018810142;
        Sat, 29 Aug 2026 08:53:30 -0700 (PDT)
X-Received: by 2002:ac8:58c8:0:b0:52f:f546:c683 with SMTP id d75a77b69052e-52ff546dc18mr97023781cf.29.1788018809486;
        Sat, 29 Aug 2026 08:53:29 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a8e0657sm108099655e9.13.2026.08.29.08.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] mm: filemap: retain mapped dropbehind folios
From: Tal Zussman <tz2294@columbia.edu>
To: Wenjie Qi <qwjhust@gmail.com>
Cc: willy@infradead.org, jack@suse.cz, akpm@linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, baohua@kernel.org, axboe@kernel.dk,
        trond.myklebust@hammerspace.com, qiwenjie@xiaomi.com
In-Reply-To: <3fa43eaca792bc0bbde4b82a6c1fcdd3f528b398.1787999152.git.qiwenjie@xiaomi.com>
References: <20260820142956.1414337-1-qiwenjie@xiaomi.com>
 <3fa43eaca792bc0bbde4b82a6c1fcdd3f528b398.1787999152.git.qiwenjie@xiaomi.com>
Date: Sat, 29 Aug 2026 11:53:20 -0400
Message-Id: <178801880005.667254.16521776519325089161.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788018806; l=870;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=qh51favisqRYFIIJw45kc1LAAx7fR21479+AvfqL/04=;
 b=9D2u9tIK2luFb739fqW5+911YvX99bhciYQK2e9hDkpVr5QE+J47y/qLzFvrZsNOv4iZBwOd+
 88JH/jEfrXMAg8nXG80s4x1xQYClTr9LeVpgl9V2v1bUAu3R3xvjiUE
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: DccKFLb1UifhmY6UMZR1UPJpz4BFnKAk
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6a930080 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=pGLkceISAAAA:8 a=IeNN-m2dAAAA:8 a=Xs2TF1iIujOxxFI1s40A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDEzNyBTYWx0ZWRfXyQ6P1Xom+2s8
 aa4wPo6rNHktw/HSPgbGZcOKERD75NvFt806RxnT4THzC/HYze6ZgZimTeCYUaTSuIPVTDdQseT
 4uGQ5LwIeEVOIrUbdQQMQvtJgP8x8DPskcCt/f+WP9uAzE8J1pyJbxLeHYMQ844LofgQ8cbZ4uZ
 WsPRU3bQl5FJyUI4j8WQdnqxoAAnU4Rb5pGV3/5SAZhwOLYd7gL+PDLEEV1gJe0ewxCZ79gdAeb
 SLqhdVtwySPAPW4b1mTGYn9gpjQvaEbZSFRzvmRJyVxT9jd1w17Y8Y13YfvIitwhvX+SfErEkwY
 X+USUjgChGu+sY7855hXSE7eEc/gzhu+DhmBn5qKlBe0THkrpaqNsHTgckHvSnZ/kn6Kwo7tCVA
 wFBqrZKrfXdLRCYJhbwSLAwM0gG1BXoJxj63/tSLIszpshzQnhr8oOHferNSgHnF22XEbthfMB6
 TRF8ghZcfS7ysVh0SkA==
X-Proofpoint-GUID: DccKFLb1UifhmY6UMZR1UPJpz4BFnKAk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDEzNyBTYWx0ZWRfX1JA8Mb2jcF9q
 +QgvLSNJyMMOUX2L4JJqlTWIj0yAaKmUz+UYqw+r1k/zHG0eNMeiSPTjstC7OVTyCOWbDnCgQaX
 PlnGBoOuDMmVFgoRd6dI/1nJWTaMIS/vTe6U46wY2MZZR1Pb5qJS
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=10 clxscore=1015
 phishscore=0 bulkscore=10 priorityscore=1501 lowpriorityscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290137

On Sat, 29 Aug 2026 20:30:47 +0800, Wenjie Qi <qwjhust@gmail.com> wrote:
> Fault-around can map ready dropbehind folios without going through the
> normal page-cache lookup that clears dropbehind. A mapping represents a
> competing cached user, so retain the folio instead of forcibly unmapping it
> when writeback completes.
> 
> Unmapped dropbehind folios continue through the existing invalidation path.
> 
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>

Overall looks good to me. It may be nice to add a sentence about the
safety aspect of this in the commit message. Maybe something like:

  folio_unmap_invalidate() may sleep if the folio is mapped, so this
  also ensures that folio_end_dropbehind() is safe to call from
  non-preemptible task context.

Reviewed-by: Tal Zussman <tz2294@columbia.edu>

-- 
Tal Zussman <tz2294@columbia.edu>
