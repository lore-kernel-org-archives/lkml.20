Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406923D297
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788657408; cv=none; b=UewL+SU3UENZDJ3qX889ZevBsfJosO/c+F+m4dDb8140zq8wmB7u3DLeiU+MUu23haKGRDe9FH3TSTjEyXXz9xckJnjE9Mysl0eZ9Rdd8vFQvqJg7x8IpKbYvKJMHu1+8vuQ/3QhdFWFPZbYSU3H4O31ZX/kRESUsyKWZn4obNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788657408; c=relaxed/simple;
	bh=fpGd9kqFDbWIRRWIYboTyimcRpAKdqXIX4dnQIRcF5E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=n69yJfr7GBHb2hbQXqka5H1gXwovdXzEbAI7VntClY9+DzKtEhFKsjxabYoSIUTNo5yasYqoQNTJ460cjZPlBnvNRdy5BPAnUazlvR9vtnOwb6LrIExUHxDXY1u05Lkri8ZLpzCb5YhGSglVl+DGmIj8GDe35TmqZ/p7WhpRE08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KQdVdkXo; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3CpiPCsT; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KQdVdkXo";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3CpiPCsT"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6861APBv3393075
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 21:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=pa0O
	qXhl/BvyBCkwtgKhBKSdWO22N2FxDof/l5rwFP0=; b=KQdVdkXoQnDKSAWHSVQB
	zqaBM1Q2IrkfBjbcCw+aJoKk8bXrliF/45KMrqAxyJtNagjk+DCfp6yzKwvn0k4U
	84XnJOBW8cWNX2orq2sLd3o7gdjSyoZZPDpmElaBxRcEraesw8z7lTVJF4MoJ28x
	HHQQfJTTwVe5SgZzU17X2VjMP9KW+9kIPpFcMMuw74LuVJ8se+W7sLQ60gGJMiKm
	PGN4VqLv8UbUEn9gwxATxHDH/W9C37Thz2GQr3tzEC2w8Z5Ssix7YkR92uYc+KLS
	+2ALMqdPFGCgZvvtoe44jhIMBrICXC22I0RFFvtaEnojPbcjxIrFLi8mCjMob3N5
	TQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ggg1jkjf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:16:45 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91043af01d9so32049886d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788657405; x=1789262205; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pa0OqXhl/BvyBCkwtgKhBKSdWO22N2FxDof/l5rwFP0=;
        b=3CpiPCsTzNQnhET7lYrrUPJSWrmBbdb725EBirXEH0Qrv5Epty+7+FFZU/OeM/mk00
         r3y4nr7YL+ol+zHhwJJVhuuily6OyLUqg7mKOqJMFGyTJpbmyc04G/eNXTRYljkCp1TQ
         cIKlc/uP/Y2DvzJ27eNfHnhlxXK6bA2l6iGLt0vZkvL/torFYKTBwoy/CbTPkpuHo+fB
         zlopvxeKjS2uyUNaeS0DUqMey9UbAL8QCxIckbjgl4CVUO8onpAAO+kAGi6hnum0D9M7
         RXDVIvZq7h2DmjVNQ3xhLK2h/N9qCQr4Reuzc+/AQnN7UFz02Ah/iLiT2W04QWkvfQ4C
         U95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788657405; x=1789262205;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pa0OqXhl/BvyBCkwtgKhBKSdWO22N2FxDof/l5rwFP0=;
        b=riAtTU18qmLQs6PCKA1+bvF2aTo6o6rYhihMVhTWOfDEZVJuPmCxfF6FxbDBVt4SvF
         KtrvQYrYuaGpHsKzL6MCJ9lL1iWcWsYstRJElVhCD611ofqfzxocjON/VZC9GTx1sa/J
         U5WFVIWsXuT4NJgKBs5tlt9is6drQIkzRfFL+c+oJut4GiFYawTLScS0AIFzfo7YifEP
         34wO3zKm5ubuYjFm1cSbhwDg4/ZbgusLWiLldSj9Byvo2tu8AqpSyg+cl48fIdZZ0aiI
         AgKlNooae2Y2ryF353FqI1djH502JBUEwpJpibTHP3y1tvTlenNiASm55UOv4xTQfBVn
         ANAA==
X-Forwarded-Encrypted: i=1; AKwUvBzAj019RL8+/O/yP/Zt2b8L5aLSkzLLmAXpZBJmBwW29o19P48tuPz7Q0o7fMU+Jvx4L0rzCQkxG+Dyfac=@vger.kernel.org
X-Gm-Message-State: AFuF++nUDbNBu+ISel5KS2CL9+zU/je+GWPf8F8Stp5SJrDJVgYfMBfu
	jkamAgQckTA3VjpnMPa+3joPtDj6TFLZomVFfztwYuKExr73dYodBwWcYgFfRYbDXctKArmfUZ8
	vhQshSGKKK6BqqV8Gsth+cgkwZxEhCHRlkVTqWCTVBt9xfeQMh6cchWI/wMy/NtAAACIxPQeL
X-Gm-Gg: AYBFou3RwN0XGG/jun3TKhtsIbzHlSuDDMTJyAL/sEooyWpbcbQs8Zv2NBYZM9mT7Em
	UAB/YeNC9sRO9F263CnNDdG36FxiwJ3yheAl7/BdP1NdcMPdYZPn8xZjcUzQ6nngHIPfL4IsEqB
	icH+WLXvQFbg048J9WzLpt7p+7of3Vfvj+lgsuHhzRsmBuUxkT4EQ9azUB/PTuWnRO0IdU8QViX
	GUV53OuIuKYe8SvxG/ZO+qd6oEuTQK0TVHO26iv1Q6+5Ps1Nb+hLRR6EjODcL3oD1nBgq//B9Fz
	6ZQsIUMJF9y3WoYoyHtWj/tPjzF+386ZWDyV1u18KhRb0riymhVj0+oXpkpU8pXllVgipIlIFDq
	zi3xPy34DGOZlvsQQXsY4o+j9DHOHZmCIPPevmxKlmwwlAw==
X-Received: by 2002:a05:6214:d04:b0:910:39f5:3747 with SMTP id 6a1803df08f44-9103efc87f8mr165538576d6.2.1788657404998;
        Sat, 05 Sep 2026 18:16:44 -0700 (PDT)
X-Received: by 2002:a05:6214:d04:b0:910:39f5:3747 with SMTP id 6a1803df08f44-9103efc87f8mr165538356d6.2.1788657404625;
        Sat, 05 Sep 2026 18:16:44 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067b125sm57108466d6.29.2026.09.05.18.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 18:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/zswap: convert zswap_store_page() and
 zswap_compress() to take a folio
From: Tal Zussman <tz2294@columbia.edu>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Nhat Pham <nphamcs@gmail.com>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260904232108.3034333-1-wfelipe@google.com>
References: <20260904232108.3034333-1-wfelipe@google.com>
Date: Sat, 05 Sep 2026 21:16:39 -0400
Message-Id: <178865739998.1122157.4086614121955790016.b4-review@b4>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788657403; l=1078;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=fpGd9kqFDbWIRRWIYboTyimcRpAKdqXIX4dnQIRcF5E=;
 b=2xrv39QBDJyGK+wzlMOINud1WKQlgdmab+FTuxAgx/YJSdZYGJUOJiT0X9m3c0by1jx6fuf0r
 URymY0U8MRtDZ2WR8vB99NsJsMyn6/mjglxvyMXvLj9epduY/Jqn8m4
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: FkwEvhlVgftuH7DMP-tasgYbRYh2r9Vk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDAxMCBTYWx0ZWRfX2mc7YwPwSrw5
 UudPpZPs6bkphjUap8cy6tEd8lmow+p/fRBi1LtoJfYtqax9g48M481IkiRmQO5MTpnBRMkByCG
 G34hNUypuZJg0KlisDma4Cu/g+UTYPL+hm4fCvEu4ZtLZbkX6vMU
X-Authority-Analysis: v=2.4 cv=IJkyzAvG c=1 sm=1 tr=0 ts=6a9cbefd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=umyeRmfRCjY_sZYBsYkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: FkwEvhlVgftuH7DMP-tasgYbRYh2r9Vk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDAxMCBTYWx0ZWRfX7hzd9MolCD/y
 ygmTyeJ6HK8OXDCd2VOwG452EJHtmpiJnKQCEGKjObFEk/ULUGo8u44qSN+TCR7ZEY8yk9swf+w
 +/IfAdCFJZ/lNPZfvHEGS9zt/TTRe1dgf/0jB9Ln713heCd1iCsdLtPXwiNKOM58s/x47gX8FvZ
 bHJLYuLhrm9BxwYlGwOA22sz8vDwke1EntFUTbgF2uy0PI8uQOETNiraIz7rxKYqtzdyYhGDMqg
 TcGlAslh6byEtxi3I89xeZsGZpRq5TNqux+akmBG3CKQPUE57kir+PDtZf2WnjMWhLHNQl196qj
 +DnfSB8Vdyhg9zyHJEFKfNfZZOcjV2jfmZ9GO32WXJ3dQzxoYiYjO80d+BwU+23Ms2IhYJdj2PP
 /wsx8EEnmusX4kYBXOoEKlhl/s2x+2mHijuE79df93L9bMQ5OK6gylW4PNLjFV/9ucEUlx8FAhZ
 tk0OfPRnl3yzhLXnwmQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11897
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=10 malwarescore=0 bulkscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060010

> Currently, zswap_store() iterates through a folio and extracts individual
> struct page pointers using folio_page() to pass into zswap_store_page()
> and zswap_compress().
> 
> Pass the folio and the page index directly into these functions instead.
> This eliminates the need to materialize struct page pointers inside the
> zswap_store() loop and replaces legacy page-based accessors with their
> folio equivalents:
> 
> - sg_set_page() -> sg_set_folio()
> - kmap_local_page() -> kmap_local_folio()
> - page_to_nid() -> folio_nid()
> - page_swap_entry() -> calculated via folio->swap and index
> 
> Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
>

I have a very similar patch as part of a larger series here [1].
It looks like we mostly aligned apart from a helper the series
introduces, so I can easily rebase on top of this if this is applied,
so:

Reviewed-by: Tal Zussman <tz2294@columbia.edu>

[1]: https://lore.kernel.org/linux-mm/20260830-folio_swap_entry-v1-4-7786b52acbc8@columbia.edu/

-- 
Tal Zussman <tz2294@columbia.edu>
