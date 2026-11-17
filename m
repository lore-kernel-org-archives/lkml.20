Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897430;
	b=a2MhJo+/e+1Ffggnehw5dwAfg7X+S0tKCwv8nsEngA1mnMRenoKVtdYqOOdMSeDcROUB
	 fNWQL8QjAqN00V/H+WEBUuJtAaKMJE5d1Lypo04ZsxnD0eKGYaX9FOYINVLRGrifpc8DI
	 6Fz0KmRIZfRpzRXrrUu5q/HilK0rO3risQrhF8SmYrd566o2knOgYlqOMVaf1jYq0Hrz7
	 HpgSlaCvQsrp4bLH24K7T5MBjZh2NXUjr3Uzvh3LUm3ON9ZwncK4JUY4IGeap6QllrRc6
	 O0Qe2+wIK2I9FM2SGSUt3kQxhUFveC4QxHSTtoycQ1rsIp5sSE3qO24JyS0wptyIk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DOsBTsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=;
	b=DrWFiwwQsq/la5CF9QkFj32JRMID0HNPG63BNyKIXZhUg9yRBeuDuPt1mjAN6Itj6QSq
	 ubUGLn3wtH9TGvPeUEoWw4i+ohtn+n7AgSoupxI6e2aQekfcFi6tliwDVYqnO4Xr6EiHY
	 yuP48SD1D7ztceLXBnwd3tahFV/UXv++b0vcCufUXoqcO1F8A7188dnK7YsPsirTSzAex
	 J5EyCWxDTRADfZwsDcFFvj11Ot+S5AarH2We8TaBh3ZJDS0ysgHDjZ8ySR/LzEan6ndr7
	 SaR4LYKMBDaecsl/1lA6pOvrzkJOmUJInDJy++H/pLgutUZmvSA/kLWN2M9o5yLMtmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=MauZHBO0;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=NAacnamq;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=MauZHBO0;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=NAacnamq
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6XfNK787742
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DOsB
	TsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=; b=MauZHBO0QHOwDKA+XX+b
	5NPgYZ4th7Jzs/pn2qwSByCnGvBsaSJc5coSVdGgWEdboi7jundzHOOM5HiM42WB
	w0OyBmo17RGT7CtiNHkic9OwrbhIuAIOKMz1xyVIP0oacCdQoPCmhkkn2AmamZC7
	mBeSrbxoXB6igxp5uzLLa4D2IFme7QvqvquEjuxdUxnBQA6/IHFDWpw05cjVR1nA
	6pqKykASzKK8FkuSYbOtbsrqtnG1wjANodQW1tQeKxZrnFbvlYJ/Evk7urX0feCD
	FDfewHX0Jj2Ys1Zg/kZOA96usAUZAlS01YBpxaYovi/Ep2sJWUyQKe5egD9ZDAKN
	/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0djq8u7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:37:08 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso377595785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794897428; x=1795502228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOsBTsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=;
        b=NAacnamqM/fJxKIaGIq/+aJuJkRwcvSvNe3PsFCVhJHtQPEw3GkpqTnt/Zu7OcjRdT
         UYcULCikl0UsUFK7F/oizAEr6LQbCZxFxLsrE3/+DL+AZabmY1fPMMPxnaXOARdgk/kS
         7FtXohksQSwnIhBJD5Q8vUjq+2XaUxgZRXz6ABlYlAtyOqPqJ+qXEiV/mxrLFh7IL+BW
         E66PCqzKKXM39dzvJG/5vQAY4Q6GKslyig7ktMrD2pnKs4TlqnVcjZCIBAfXpjDDi9UA
         M9ZTTlfkok64SL9B1bjUUd1NbcwDazSidl81OPTvoUZ6uQZ8PhzakvysmIFfAwRy8gLV
         KMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897428; x=1795502228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOsBTsM8HzI17SPUr1ak/9a9bMUvOh6RzD9t7xsTYQU=;
        b=eAwlcMUF5FTiQfofD2axi9FmToF98Z9ddl1hKnBDi88VTrT/mpKadIadnRNc27jfpz
         cpN7qE8bg5gQ5XHRxeFV3/N6hhEF1hRiQ5G5cXNvRegvByxIFzWmV4Q2P6pbZNNJUmvn
         TWctkBrV4E98mCDz9yw/2UD2a8CNcIlgaPdpDWvzLm3fUaQE93JW9NOM0NpVPjI+glF9
         YZzR5HZ6gsjsuVAt5A7H861T8sH20rR/g0aq8pY9sDs7NfSdkDz6nUzSIv9dPZMZ9403
         vXVp6Y4NguMV2lHDv3PcIXVoWNpk8bsYhRjqI4Ejzl28oqO20EZ2Kkq1jrTGQuYcjxIM
         Tzhg==
X-Forwarded-Encrypted: i=1; AL+hErHbYtgVHUuz4RxkpQywRs0ixTJH+kZfEI2PqT35r1fBq7qAR+6VJwOlsyeKz9vihj2Wlymg4jEXRuUqCzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dS3ggYzl5MKHBzUzBFwwQkfWrFYZIbdGs/mR7Oty6lzmNV7pM
	Ey1lRftpNkAO4HyHfaAPPGHL2GAkqT5CNTuWIKdLQzaL9f5WP5DdONyPIdtgXWrTn879CZh0Oki
	ahC6WMmEGZxGnU5/4v2URYB5XsJaV/AJnmxDrtQpsMb1uDqST+mMoGjnX0rpPeA==
X-Gm-Gg: AYBFou3zVNxzx9i7akzmJZ20arCNnIcGs5gMCxy0YvS82DJSVxhjSRlknKLnvzYrROl
	opXCLFt/8+tPfEMmNRBeRGqZZPI0V4amHI7BApH0nZ9R+658xgV4NHgUgq5Q5oaXsJP/SZovbzU
	60WFYNXKUsbfmJD1aViYqHfgAVAwuiLHvVtCut0Efz1+5S+5+7JAREfNfpsteIkribNg0VldfTK
	KN+kai/KwdLWjyVHZX8j5NLb3KdhEUlX0zCKzXBfIMEPVcHMd193a+wnyQ6kBsKnDrZXLO2bM/h
	oAJjbMnVxdt8dfjVSw9nGf1kpnL4pOsVhkE5w3CrmYNvbxUigCo2xLMoaaePQbXMN7QZuDmaI+J
	c6sYXjG9BCbwX+dQXINBN2SNjyQWHCqt42ExP7Nb+5xh5kKtV3NVgRZ/AxnJUIGUiw8pK69QSLq
	SfEcSM9pAeWCnoyDxXmIUMjw==
X-Received: by 2002:a05:620a:2b46:b0:949:6898:2e4b with SMTP id af79cd13be357-94968982e92mr1269465085a.66.1794897427876;
        Mon, 16 Nov 2026 22:37:07 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:949:6898:2e4b with SMTP id af79cd13be357-94968982e92mr1269462185a.66.1794897427441;
        Mon, 16 Nov 2026 22:37:07 -0800 (PST)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d614b4sm104980356d6.18.2026.11.16.22.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:37:06 -0800 (PST)
Message-ID: <8092de9e-3146-4fe7-a235-01ea8efab08c@columbia.edu>
Date: Tue, 17 Nov 2026 01:37:06 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/madvise: zap markers from guard regions
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        David Hildenbrand
 <david@kernel.org>,
        Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, stable@vger.kernel.org
References: <20261113-disallow-uffd-guard-install-v2-1-9d0063c70542@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261113-disallow-uffd-guard-install-v2-1-9d0063c70542@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JQko_-sOS7ScmE-eoKeIgzyrkLinYDvK
X-Proofpoint-ORIG-GUID: JQko_-sOS7ScmE-eoKeIgzyrkLinYDvK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX6uJaCLq85sDx
 4o7F2YMngD6NN5Jqn1JOZHkvKDPyRNob8KyRz66yfNyKdIcbgqyf1Kd7VcJl3AmtcpgnMnWBJP8
 oYjpr30WZvRwPpKrMrwT+OnT5GNuaEtF3R+zIjalOQmoOlSCOAp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX0nXDeBN2rysJ
 r097lTJ5sac4f+16sDnhJRKUWZOghzXaC4oqMZkBhLr0HnWoD/A6XfuyRqQND8064KIIkQ8aQwz
 tp54dxhjRiijfl03WRILUvKiXN9jVVvMpijUrOYRnYgmO3H+vlT/9jBeAEWH0vr7FQMBMGkT9mC
 UpBzNniUr0TMu1cueb7FEHWXy3xp3bL88msDlXp3++q3Bm7GML/r3hTE9Qjwvq/3VlfC0GtvXyQ
 3TRP2gWJ/Wh045TaRRgMruOTjx/oEyRRVeHAkm9C1EMCD0S4fWC+SODu6cUFTGwdk16giDT8MTF
 3PvCLslHjzMReNa+g/pNfdiCfCwSVl9T8LI7oGcjO+hVrCvVzMLOmhumSxuWPPgY3D8gKeld/Hs
 ipOctsNt3eqCjfBaNOu1aDEugvvG+Ywysja8R/PBa86LvPrgnlZzhnPoD7E48mzFMajGZwMUJCz
 39AauuWenkQlUj2+c8A==
X-Authority-Analysis: v=2.4 cv=YaoodARf c=1 sm=1 tr=0 ts=6afbf615 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=nc3XcxN3xHuRbhElZrYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=10 bulkscore=10 lowpriorityscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

On 11/13/26 4:04 PM, Lorenzo Stoakes (ARM) wrote:
> In order to establish guard regions, guard markers are installed in the
> page tables of a mapped VMA.
> 
> However, problems arise when one tries to combine this with registering a
> VMA for userfaultfd, as such operations may themselves need to install page
> table markers such as uffd-wp.
> 
> When the installation is attempted the guard marker prevents these markers
> being applied, which can lead to unexpected results (especially if the
> guard regions are later removed.)
> 
> This is especially problematic because guard region installation causes the
> regions to be zapped first, meaning that the removal of userfaultfd-tracked
> ranges will not be logged in this case.
> 
> Additionally, the uffd-wp page table marker will be propagated regardless
> for file-backed mappings as the zap being performed does not clear these
> markers.
> 
> This is problematic, as it can cause repeated failure to install guard
> markers resulting in an infinite loop.
> 
> Therefore, update guard region installation to invoke the zap with the
> ZAP_FLAG_DROP_MARKER flag applied.
> 
> Both before and after this change, uffd remove events will not trigger on
> guard region installation, nor will write protect state be propagated after
> guard region removal.
> 
> This makes sense as conceptually, guard regions mark a part of a VMA as
> effectively unmapped at the page table level, and removing the markers is
> like mapping the VMA again, over which operation uffd markers would in any
> case be lost.
> 
> A survey of open source users indicates nobody is relying on installing
> guard regions in uffd-armed VMAs. Software including glibc, android,
> tcmalloc and CRIU were checked.
> 
> This change means that any already established guard regions are removed on
> zap. These will be overwritten with the newly installed guard markers on
> success.
> 
> However, if this fails for some reason (fatal signal likely the only
> reasonable cause), guard regions may remain removed, and concurrent faults
> may succeed in the interim in the range.
> 
> Since the installation failing guarantees nothing about the range being
> installed into, and since success overwrites with guard markers, this isn't
> an issue.
> 
> Since MADV_DONTNEED does something similar, abstract the zapping to
> zap_range() and call it from both places.
> 
Reviewed-by: Tal Zussman <tz2294@columbia.edu>
Tested-by: Tal Zussman <tz2294@columbia.edu>
