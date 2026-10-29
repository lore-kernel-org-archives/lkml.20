Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281639;
	b=5CQHQ488ddY1Z9r8MGsPiCBfCwqleLALwchqltT5xknNOQCa9ouHt8RktoKgh4UCozgr
	 4aBbMQx/0mv9oqKEKcOycVQ71mYa5vT12zJJao+i4THkG7y0C2y8WO7MI+0z3DnUNlpdS
	 UKdg8SlVM+T0ZF5LsC3BD87WL+A/j8A8mJij5/mKZBJVcXbsA1P44eYsZOFfAiRm8bARJ
	 uKqkFVt3xZ5kOPWgRQAiU7zH947w2pbVbjHrI95eplv5lr+2ki4pVv0RDpIL7yLxG3Tj9
	 u4JM/WDFlLYvSGVQ0Sv5x2kSmwf8uLj/O3C4LymGmoRRMvFS0nEddBO3InzXz8r5fAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LzaYibF6mNyyGAGyvN+zjBCsoGvCNikDa8hZ39a+8Fg=;
	b=EnX/Bmrp3n9z7qVJMoibtgWLqu9WoBiMofVjRAmvE7d3d+K+mxq2/xfLqed0GCT65zGH
	 VWwcmTaUNVdTHviSOnYp/7I84L4DdQdkGEBvFu6K6ls1pEp3F2toN8+gsfBnGZDd2cgcf
	 geiV0LE+jvp/KkVGVrzcGk3/nH/FL+cFnSnkP45dIjbvYoNfHuihoMnHzGow1yBF59wMn
	 pxWVviDhpUQYLgvzNam0GVW+sf+jKPtBUqbXm5yEewdI7ro3PWIwffA+E2C0wYBjG5P/K
	 lK8VJEs2Abf8QAL0K28Wk5iRmajBAoJMTbK+sfnwnrdSrCE4pe3qLbC54oqteaSZ09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=V4Qa2C2z;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XAuGfgG5;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=V4Qa2C2z;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=XAuGfgG5
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TDFsv12208071
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps01; bh=LzaYibF6mNyyGAG
	yvN+zjBCsoGvCNikDa8hZ39a+8Fg=; b=V4Qa2C2zvxI3eZn1CBiQ0Ki/7SJ/rXC
	+FHqNzyzDmtqMKO4cHIn0n2+7gF3bShIaqq4UJg6lWju5GBFofRf/DN/tdKfRsfg
	6f8pj+9LH53i3uNQB28bX0qBkPcie3eH4T7Zyj7hPrX86B0BQ6LnnDuHGH6wtEyO
	2x786dSnO8t5JhTkO/xHfX5c1QWWnG03iVtBEgaoTlycvp7WostUlnM2iavifmLe
	nYniVw9Ae88PnAC8Hu1rhfScswKvZxmrV9e/rcIfqiRTTWGfT4EjD+3gPFcjc6gT
	g/lIa88ZR9GUnxKhiV90B9BqIJ0biH1ZbaolFXuDbNza9PrEBNDvOKg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hm5bv101q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:47:11 -0400 (EDT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99082f450bfso1748195241.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793281631; x=1793886431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzaYibF6mNyyGAGyvN+zjBCsoGvCNikDa8hZ39a+8Fg=;
        b=XAuGfgG5ZRT+zhdalnSl1bAkzmDyUeBufaxHBjVkPv3zm4IkT0sVTnpbyhjWfHV4Cv
         BfRmqoOUnqcM14+DYvjQWUo3VeasIXY6wccXQEI50FOMvvQvqYQ8twOD81Ic1KNeRCLt
         5UhQl4U5BZvJgd8RDwRwLwM/XlZN9ZAtneStpenphswWwEq9rcVBiVxfMk0VCPdwCvYx
         eQ+Jx1NVk29VpwwjsU5lFv/GgZL5JYK7Qx2BQXkUeBtd7Pvt/ymoEtpy7jUJHEBtf68V
         o+m8wBxhFbG4wTzHPTl5dHJu8w4SghqDR0T6RUDoS+wLClLBRbkpZB8r3qXtC6/WJTCS
         a2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281631; x=1793886431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LzaYibF6mNyyGAGyvN+zjBCsoGvCNikDa8hZ39a+8Fg=;
        b=a72leZUnWZAxs59K8n/7gq8yiznIN6zHBMucK0C8SEpaj/0fBADLWVV4+ZIfYuH7sB
         Q5IyKgvg7KLRZ0nSq7jKZkjR/YkzcWLZd2/h2b2+PW7p9eox1xJnHIHzYnEHvI/1ZJUE
         bjea2i4G3zSQYIq3fHurCIn/TlnBInbrLq8VyAjDW55cEwenHQQKQzb8S0IBW/y3uUh6
         9uf+SfsvmmGMQo2/x3j3FDYOYjDu2K4MNIGHNF5kh/CeJbNl7jNjfRbupqeU/k1weuTG
         xShx+ShFukLYbk6X0Sl2oIJSiiOYHpbo5bTurcQcJu/Mj8zwCDs2hsZBKTjYM5KbMMgd
         mrrw==
X-Forwarded-Encrypted: i=1; AKwUvBz0lRpBajzCYQR3ma67VmN7tK6qME6cRyO2B0Y94CBM5yzRHAog+h+TNRbBzZQtWGPlkCQcVgWcpRH3t9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjaVmyDgbon3ai23cO5+iMdyC7IyGPSobb8f+6Zat4EvRXyj4o
	0QTICBcxhNpoQbmA4yj7J/ZEhrbs8/0HFFoOvEVI1eyrWOOuhDp8Ix/nyGglSeBImtuK1mdBKED
	oHIi54xfS4B8OZ5A0tJfRgPLcN/iRGTnz38z/oOIOaOQ22m8Ja4SXUeZll/2VoA==
X-Gm-Gg: AYBFou2h/iHWqF1JQKvjo1yh6BYzIB5Wdcz2yXWhkCigPvUcpIcxU9QzyvL+IpJWi77
	tHHMzNObVx2Y65VERjcYjhQWTBS+v2cY21hDDfBrLK3AhL8BA6YRbwjuVcJQ2bbAzpc5C3X7LJt
	TPe6Ba1QhFOY/r5z2IAF0Pv7nsD/Uff4iqOg6MDQ1eXqbTN+rfYWnzmtgu94CezrefQ1zc2+qvG
	XS1R9pxm0bDpI3/IGwca8uscKMn4enUvJZ88sTKVhFXBXE4aTyD+8d7mP490piFHKQrZiKFW4Wz
	3hpRoiJaP+RUXdqnB+75FsrHVPyBJuZqq5Uo/w1rgQQZ2vnXWfWHhP6T+8DSCjLlJw3Xvym/Xe7
	gwbBGv0nF2NtYERN8b5uVr4EXq62Tugfzy7WuO78bJ6e0/63I/CFREzhllowaGs7zwwZ+sBq7cc
	mcr8kLksJiUUh6OeHD7QZC46gj/oFV
X-Received: by 2002:a05:6102:3ca6:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d03a1faee0mr2882890137.4.1793281631262;
        Thu, 29 Oct 2026 06:47:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3ca6:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d03a1faee0mr2882865137.4.1793281630591;
        Thu, 29 Oct 2026 06:47:10 -0700 (PDT)
Received: from localhost.localdomain (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33431146f8f.14.2026.10.29.06.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:47:09 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
To: Hongfu Li <hongfu.li@linux.dev>, Hongfu Li <lihongfu@kylinos.cn>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
        simona@ffwll.ch, kees@kernel.org, tzimmermann@suse.de,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu
Subject: Re: [PATCH] drm/i915/userptr: Convert page APIs to folio equivalents in put_pages
Date: Thu, 29 Oct 2026 09:46:05 -0400
Message-Id: <20261029134605.882933-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260723064651.4100-1-hongfu.li@linux.dev>
References: <20260723064651.4100-1-hongfu.li@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Y4dtIReN c=1 sm=1 tr=0 ts=6ae34e60 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=bg3mo46-JBcyr3_gL6MA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX/mEHgIkpEbhX
 SLsxwnzxoUzIGqRQ0WcxNG1TenD4BaYkws1fA3jklvjSbvqDshzocd3wzmOabESJL6veXLC9fDU
 e9RqTyBw0lHvruqXjxt/wscE8DJs2ylQ5MehVU3K0kTmH1OuEP4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX51ZRJLz4ajc3
 UDMgbO8E2SD12N4eHzL+lJlQQUadKjhco84ejTYcCPNQyzenMVS6BF9iVnbM1zzuVsDvQOiuGbJ
 bepo5e5mr1IDxQ5OkW/064XPKFN6V9oVnXtDr9LH6HhvuPoVpxLIkMWJ/MFabEqS8pHoewbniaB
 PIS0ChZ7kzeKHn4VIOY63hbcyNFemHBBnV3Z9WFjWDVMAHIrTj8LY4efb6XXytgQ+xWg0o4YLwX
 G9vXEguVNxu5uRg44lcnMOzFhZXmvyRsF4ClfF/2MF45PZbWc/OQ/Rg+inWOSq5nvwJfadcwq10
 knQRqbyKE+3FYlUKFs0qrBcIAUMLGv6V/rvFZojAiGNuxtsghc5mfcYf8JbuTiJKowSv0CtbV9E
 irrm4WLs4/itSAVP+kNxxyACDNKIJMxLz0DQvqR/3BeyTgu2dHHZB+mrIW7ylm11Tp1NbT+X4bq
 17Cnz45XMXNtar+lSmQ==
X-Proofpoint-ORIG-GUID: Ew551Yvh9PM_enhInm5Stk2dC51psfqW
X-Proofpoint-GUID: Ew551Yvh9PM_enhInm5Stk2dC51psfqW
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 spamscore=0 lowpriorityscore=10 clxscore=1015
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

On Thu, Jul 23, 2026 at 02:46:51PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> Cache the folio with page_folio() at the start of the sg_table loop,
> then use folio helpers directly to eliminate repeated compound_head()
> lookups inside page API wrappers.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Hi,

Is there any update on picking this up? It would be great to get this
in, as it removes the last user of trylock_page() in the tree.

Thanks,
Tal
