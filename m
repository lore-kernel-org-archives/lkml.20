Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541302;
	b=vyFDiavcTIeX2fRFq+CuAqPobPwmO/z7//WJeGUEZZzrcMN0hlWJ26/rm50s7Tme0Lod
	 TLavOQmvU+TvnYvmZJTIdPatW+MYQaiUJXa03ack5fYOYWk//ClNhreP/YQ3JYVMO7Ubr
	 ffStguICdKR6cNIjune00EqgmgJCLumt23YIdbHbgydbfc2E10F3kcQCsLzw4UinE2zxm
	 lXW/mtUyRL/gSWzwFbDnXAGFttqhv0jO1o38KLMbSy+KjsM3amR8o+o/5m/BtX5t8IfSH
	 iIbGW+5xXDLzBngWfUaP7AvJSv2/vOl8XgQZD04uAGPS/eCA73A5cqxITpwHJJ2/hNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w86GXJKk57CWbsK1o2/pIiyaV2WJY8p2m7MJiTZdj8g=;
	b=ysHexdNYDY5ktKD9qB56A2ash39eVtzdEGtIw2agqQ3xAfbgOdDJOSUfxqcEnVokRdZ/
	 O5I0una1eme+uhzK7VmtCdKR5t/3IW9M7QVK6xJ9LWse0vaqjqu+miFmvfjuz0Kgi8WWr
	 ZuDfWG8/R5hZ+URBvC7En2Y3OO7AD+ih2hLS6uXCEApi53eiWlk9YHd/Cxlb7IS2Kxeqz
	 ABpTWLZADzb9yAm+NhQNhVHEMxQ30reF+0cWznL3fydSU6KUIFBPFMuE+5tGlUX3tGfTH
	 HpbOtPjD/S0Hu++47H/QBmOALfWH3W4rBX/CR8/PQCE+tg0f/lJaOsWg5n+QaSRkh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=bRzx2sb3;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LfjEF+nE;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21B606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC21B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=bRzx2sb3;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LfjEF+nE
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1DVVV02897232
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 08:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=w86G
	XJKk57CWbsK1o2/pIiyaV2WJY8p2m7MJiTZdj8g=; b=bRzx2sb3xvz2LXbC8aay
	FqwNt2HJCwFUZvpm68hsS7dNZ4ezMyXOTmz4Vr0bm0/LEa5qcQe+pekBSl+atzvv
	3IzjboNn25thdp6Tpt7fgV3Y/XmXQl+QuKsUtcJHTnjMasH9hqmDvYmI8br6C88e
	R9cYaBdxPWhb7+Unjy7Gr719pSW4Q/MHdCZQQCoDNtvjcJXMWrI+pHk2uSj5WHvt
	rSvOx9dUmvru27x2tvHAKFtFzlQbz5Myh3LSycHW2Xzvpytn1VeXJr6ZHFczUFEg
	cemnB2towM9yWivuq5OYRXXmWI1UPDtXo8+2m1dPZc2+lBuX6j03oFdkLIpU0okr
	bw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnccxx5f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:54:54 -0500 (EST)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b937ecbb4so41470656d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793541293; x=1794146093; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w86GXJKk57CWbsK1o2/pIiyaV2WJY8p2m7MJiTZdj8g=;
        b=LfjEF+nEl44m3pkxy+lpFSJqz3LusfsM5Ame+CJasvbuf4Fhy39yGS5cgpXwe1ZwSD
         hWmd4aUNBYvum/dpklfeOVKaNLixEcb2VH6VD6TeyOLydxt8GlzkijiJ+b8nnQChTEbh
         TT9k3FRXCf6Ns3C2zc/JYYLa3d5RS+gXN5w55HgR+IDq/4P/FHql/3VpsUAE1xNPP/7w
         AD1gxEUkw5a/p9EraozWXJGzkzGx+LOUPk9KUusYgp9YhHpan18hj4Hn3cgKLcgT87xR
         IjZHE1nmONpvb5WXehxz2/n5r2jFaiB3S2gz0qzZ6the+4jSrNsBTxgZLCjZayLRRUZh
         FrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541293; x=1794146093;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w86GXJKk57CWbsK1o2/pIiyaV2WJY8p2m7MJiTZdj8g=;
        b=H4q9pSBOjy2GmKrnDqqPhpX29SaKmFYryYvixUFP4v9OWWL9ZFDo1BpInVkwqLEKZO
         1ALHd8Kbi9m3nl/TAAkywHl+eMSbUncwyGkBGoqt4QxBMYdba5h2Eg9N6cTXD/z64SID
         L2wVkOf0kJBW6lDDKdaZRaxr9Vzo07vutP7C48DurPQ6T3e1CVMztMNLnZ+TVeVDKo42
         yEof+afBKJ4czuz3L0gFLRBjaCSekwXWJgdGHuwvjp50MQnZmUCWRJLaUVpYrQfdMugo
         sUX4xHM6ZaCKsF3nVBYe65iQ9vjdUDu5o/TBoT77CV8veoSHjjtuANRXnHFhQ/urQYYh
         OIuQ==
X-Forwarded-Encrypted: i=1; AKwUvByFEItKwQZKxYT1fHrdMb8thNCWiPGZ6+gV5wddOG3MkT0qI633wY35q13N47rt5+wGdY5VtLTqDmmFeks=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2LQK+HXgTf4S4ARCg4/EQnLM1rkMAVAR2yW4MYMquy6Qq/C0h
	LBL2aIVOoqCkGzob9L4MAMXZ7YNkOuJI4RO41Bs3bDVcrPUTSZyb3TNMgWeciDzwhEAAy5QN8+b
	JV65H5e7TqRVPHcmP5fT9NxBmzluWTUWQEN8yla6F3+9wMJHT1WPHxFgCo5Mppg==
X-Gm-Gg: AYBFou3sFtRmfMplifFvHfw+Ov9CUHXTQuQD8TczLIDqBxZbQy3xWJCK5e8y41pr2GN
	Tp2VjWX3URQS2aEr2kMgWug5j4veIoGdDi+Ym6A+sG4CUW7eyFm70QYBVL0HaaFhoQYn/4LZlMl
	W+RgF/hFp8pk5Yx0YXgy+cmP6abJYAiDHWPmGi8Fuk0f0EBfuh0+S+8bt7w/a6lJXs+pv+hzn7R
	t7QrNg4p5up4JVQKLPBRgi9J7UnBOpGxMkr50qsJyFtBiq8NaxVl5CxJePwOX8dcvQoZJrzL8/0
	yllrHq6seMw2BMn9pW7DcISKlWsadLUJbH9+z9TIA57GWARgDyMxM8M5tjf1jSzdUEBUvWkCbE5
	ChlTBJZjp3mCMiHVqeEJ5KJUpCQjGJJwauh236Nfwm60xPzBcPNcZeoN+Nuo=
X-Received: by 2002:a05:620a:2710:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9442184df35mr1241527385a.72.1793541293554;
        Sun, 01 Nov 2026 05:54:53 -0800 (PST)
X-Received: by 2002:a05:620a:2710:b0:93f:3cb0:4639 with SMTP id af79cd13be357-9442184df35mr1241524785a.72.1793541293056;
        Sun, 01 Nov 2026 05:54:53 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba2415sm14680787f8f.50.2026.11.01.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:54:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/vma: undo userfaultfd unmap preparation when
 unmapping fails
From: Tal Zussman <tz2294@columbia.edu>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
        Jann Horn <jannh@google.com>,
        Noah Weinberger <NoahWeinberger2003@proton.me>,
        Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
        Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, stable@vger.kernel.org
In-Reply-To: <20261101-uffd-unmap-abort-v1-1-1588d7a7c61a@kernel.org>
References: <20261101-uffd-unmap-abort-v1-1-1588d7a7c61a@kernel.org>
Date: Sun, 01 Nov 2026 08:54:12 -0500
Message-Id: <179354125206.1160833.15685446781372913857.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793541289; l=699;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=KVDlIBGZ8sUNXJ5Zqe2o9W5vfay33kUNx6yzDVUOXWA=;
 b=A2fDt8WEiG/978sXfzb8nnpP99XqNHXnaLMw8FlmnzNdVAZqbqVW+oTIku2Zvx1VhqejjXGFx
 FAFeojSy/6jCPd2awvm8clmxE3ND/NxTsXdMTEICuQHLp2+OOZNnpHW
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA1NSBTYWx0ZWRfX33Fz/ULhEXEa
 Y8eHe99suw2JK63cfCaMCGvL+SucHj+YbzMgiTbrJiuLevBU/lEVhYPPgJHojTifdeBiK1p1dMW
 O0nqzcGN8kN0yhtD7NnAe8ZgVcHonX5z8yCYiWfeqT6plY+lyhRAvgZOzHEqHUlgQ8KXqqVwKU1
 /pkPXkXox0BHaMk+QVQPSPyapQd16PJs4MBsy0DAl5AQDsrsAeyy+AdfmHl4OVny59e3xf3y4ND
 EwDdmzm87JqIgCLM7HlQdekSdEmP/YlhAZ62ZtSIZIAdwhbqnVfrT1+RsGbUhkWH1D6lVWfEoBB
 uiMfFKG4bNYzYh+L7UElQpJPtn5V0UIShwDqW9NWtI1LRvIeUTBA9Au3a6bbyBV5xkNQNl+MmsP
 k9BUBqvUlozEVdb9ZUzlFX3DoQB02ZxW1tFwRKpJse3KWgSG4jSP4p0FJCWmaZBp+oKguAFjwDL
 RUd/IadhUOR41pFAaeA==
X-Authority-Analysis: v=2.4 cv=XKSl2ghE c=1 sm=1 tr=0 ts=6ae744ae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=d_C_vffKwV36uL0hTwoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: z7LihL2Fmx3ZP9slYKUdmzdYhXEO_jF_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA1NSBTYWx0ZWRfX0xT9l/0WqWHV
 3jh1tafgBorR94MlxYgeCP3vhIMjzVkNfsSdF/1Pgx7bgJiTKnzyIPHGdT15Gpj2XH5s+Fqldo2
 bPsT5OvXN63urq5EK7KYTOBhU8SJxdUzc4UOSk/JtvzmcfFaNEYG
X-Proofpoint-GUID: z7LihL2Fmx3ZP9slYKUdmzdYhXEO_jF_
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 malwarescore=0 lowpriorityscore=10
 clxscore=1015 bulkscore=10 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010055

On Sun, 01 Nov 2026 10:24:02 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> vms_gather_munmap_vmas() collects VMAs to unmap and calls
> userfaultfd_unmap_prep() for each of these VMAs. This takes a reference
> to the userfaultfd context, raises ctx->mmap_changing and queues an
> UFFD_EVENT_UNMAP on the caller's list.
> 
> If gathering fails half way, e.g. because one of the VMAs is sealed, or
> the operation fails after the VMAs were gathered, the original mappings
> stay intact but the queued events remain on the list.
> 
> [...]

Reviewed-by: Tal Zussman <tz2294@columbia.edu>
Tested-by: Tal Zussman <tz2294@columbia.edu>

-- 
Tal Zussman <tz2294@columbia.edu>
