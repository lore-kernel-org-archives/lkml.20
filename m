Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367192;
	b=UYfZTHcA+12sL4BRD0ZYBrdYze9CZY01eiKTnWgKyUZXyO0rPLDKR1k/mVef4vnatApH
	 lHdjwT3jFQFxFW/4oanynfEImhtWY1kdlR3pazR+Zw7mG8RsqPzYddZU8EMuG1WxsOHwC
	 S07+iqIw9AewCGviU/TXnP2rfuQedoSmR7LebbGttPZ3ilUTN2VVDJqKZpbNJjiI2r49X
	 PGiF0Lh1WEjF6FiqtBQFLtZR0BjLIcwvHj0/2uVG5NYf2zmK3dKa+mHQB7jI6CtCdYpgJ
	 p3W+O4P5OkN/gdYT8hd7FsO7GdsjLrfHYmu/Xw8Gmba4cQkStjzFqwM9OuYzTlSYnnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o8lmC1CEcuQRQENyfqYrXJ3vs6TTuyhEVdpg3dSwAzs=;
	b=cbvI/KuDsuRKmHZU4DQsArXYHF2ePY9Svhlj6L72Azjj18EDJa0qDpnXmriaP8bBAz2L
	 Sosb3SKD+lg7TDeOA1G5vuSWZ9FZy5qGzeWHV5r8w0I02JjdIn+QjTx/x0A+ZUqDdTol/
	 McLTDmCY9bWTcRjfYhzYAjprhSeZFobIVdVq7AQw5DNYBcrGzH+g6ZhzoDcnli/OiEXP6
	 jkRRYBM64Galnv6HtyTPDVIgF+wexMNGpKoDR4JJUmyNaVExpsXgchLXyYRt8QhT4rdb+
	 GxqlZAwwoIy+StjGMikQxzH1Q3cYUfR+FJITLvnqmSu6uNDTfCMOxO2YzcOjl912qFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TIcq03Up;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ob4qyAcC;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BCC606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BCC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TIcq03Up;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ob4qyAcC
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1bgUG2570260
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=o8lm
	C1CEcuQRQENyfqYrXJ3vs6TTuyhEVdpg3dSwAzs=; b=TIcq03UpeXG5lwYgqnoC
	oiIGN1h+T9pWC3UwBNT1771VVg0u4q1PH/9AAQYGex6VEhdW0bmD2r7tdcfA1RQr
	5yZ9JD4Z5ClYyb2xiZ19yggiwwQausPdbOJMzZamTKLiypUKCJYQfN6n7wBcljC9
	ep7JF56xU25TxwH4SPaQ1EEnRp2bNNXupiNQXkmfzICk9oYpIfUQCmXfLW84GfO8
	pVknrQmjI7YGa/+hcBaCMyp094tU2VEK84j96m6+RMOvOn+MnP3HC/izSokntB81
	uepYzn0NW6tQtZCTgHkNB/Aqey9UQ3gc1xsCvOivR7oWbmYZ+jLPww3zMKXtXZoZ
	9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hvayq23mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:19:51 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so521561085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794367190; x=1794971990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8lmC1CEcuQRQENyfqYrXJ3vs6TTuyhEVdpg3dSwAzs=;
        b=ob4qyAcCafLdtNiqrgtBH4EfDgWku4fZSuh8BPfI3IcdK/z3FgEDCuiemLxI7byob5
         2B2nPxTLh+kfiA5fPYRQ6HLMEigAuyrAryquxtjzGWiOZhkAs/aKq5MBXNphAaD6yC4l
         PR/ynGi0q2HP0iu6rfqbtTWOYrVHdzQcnP+hDu7+GPkvqJUmtysnxa0lF1mHBOVMKcFw
         EwWsPU7/9U1AD6NFPFIbfeAaUJ2vGiU7ndKOMJX5uLOIPgAJiw+0WOGFsXL3MwowgUH3
         Si6QubTpYvmBUbSVp5dHJsWreZ22UVw8JOC6rjsjZR2DPQXVxnDaFQr3qUX+gre+8nWO
         UbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367190; x=1794971990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8lmC1CEcuQRQENyfqYrXJ3vs6TTuyhEVdpg3dSwAzs=;
        b=HfTaS7xQvtP8Qf3iBT193a4U8ghy8DtkYXPp4g/QUAWHRTLLelTfUmS0uPIeQaMWFi
         qfLvp0SEBXi1hhI9t3qP6ct/X9R3EJd38CTZvOj8Q9pG4RLClLQTr6LbIDaojyGF7Y6T
         WCA0YmJ5rHJabMYFXpeaxyg+LgM11D42p+Yyaonlc7JVEoKldjN4EEjr91rs4e1h+XRE
         nI4g/Luq/+09Jvepju7EP+AKABeN7OAqHYhSEDugnIV2YY64M07paf9ln+ga80MHXOOT
         7C2W32bPoBwfuoxtIqutGImvnWaVXHyqXaEdx2XDLz16uAj674wa1fYh/Bq5HtleQ5es
         2rAA==
X-Forwarded-Encrypted: i=1; AL+hErG1CWo3ueebUUSuwf4xDdIuwm1YrDaYfheIydS9dCnC09ecUhRLbxYf7T1rZhxt0d5R2C9R7gdDxKbRzLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8novYJGzjDdJqzi8+xw72Cj7V382SsVyOMx8h8O/sDwV+ibiN5
	pD5qPX7r7QfcKbMNeJkKpdjP6HPNs1i/0u4UqjkARLqx5UxZXUKEVwVtF8TBPrcf13VpGaXdmYi
	rUn8xannFSsnQz1pc7tA4oQCEGTsMmTe1kUPqHy9OxGK96DFAaOI6vU3CoiPTzA==
X-Gm-Gg: AYBFou3IIsWtaULqweCvoUpEC5fVQLpDhP51q+iRju+GVdP8Bf7XfczohjEBFPCPbDL
	YlSYwb+UpJK7K/VbutjAdmhsqwdw6vL2VqQEN0H68kaSQve6facelo69AZdVDeN6jnpxklrBRjw
	+Qj3rk7wO7LT2OGH1CKWRkgsljmf4HDbSBwhqjBFwvBfKyCKB14WgauFIC1g5Yt+Q8hua6NwlHl
	nF2TXYBMnGpczD6hJZ2OxBwoJqRmZ1xAmakZr4osh/bztEjpUNBAJ86I8A2Zz51PRp7IkkGtudN
	ZihL+Y49W1FW+RrG5r2uwbDX9OSj06JUTDwYCcTQc1nnWD8rxhql1VdNaYpXIwiX6/tFBUpr4PP
	vfsq2QfDPkM24zKpjPSwfY27aGmBN2N3hObPgMBX6zCSenQaizKDPB89+CAAM0KzJb5P936VGFd
	1r0PfmqADLCfnDFRqvvCvUFA==
X-Received: by 2002:a05:620a:294c:b0:93f:2b23:481b with SMTP id af79cd13be357-947afd6d3camr182909885a.22.1794367190190;
        Tue, 10 Nov 2026 19:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:294c:b0:93f:2b23:481b with SMTP id af79cd13be357-947afd6d3camr182908385a.22.1794367189754;
        Tue, 10 Nov 2026 19:19:49 -0800 (PST)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7f2edesm383441285a.40.2026.11.10.19.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 19:19:49 -0800 (PST)
Message-ID: <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
Date: Tue, 10 Nov 2026 22:19:48 -0500
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
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: "David Hildenbrand (Arm)" <david@kernel.org>, n3rd <18670333770@163.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "ljs@kernel.org" <ljs@kernel.org>, "kas@kernel.org" <kas@kernel.org>,
        "ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
        "peterx@redhat.com" <peterx@redhat.com>,
        "security@kernel.org" <security@kernel.org>
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfXwJUZZ3OVKjqa
 Rm/gTJqNUbTL2bI7Z71UmUAsEz7U67/hN1kth2ObdHXY2I3X6/wB+yBmpy2dUlm89h6MF5ZwuHA
 PIdZA7OahFJY2XuifaiSGp+qI6S8gSZqMlk/hNnIrHtct3KI0bKSEPPzDJIOkZI8gKsCOqe6GH7
 9RZ2U5LnnFb9MFD1yCHzqqP0KXLw/9Se6v6ld2vIGqdV5dk9RuHPf49gZEBkT+l2NsBVgfZEhwg
 O4sT6dFFzxw+7jWRH7ubtjdeMpIm7FLLVhlEcDp35Ey5OvDnESJQNKOrG2NZ9OJich+9akKdykb
 KctiVjvvDdYXC8G3x84Zgh00mjulPaFsLS5aza83bzz2MoNilLUiWN9fb9kmDqcI/jLP7eqBKk0
 EawrfXnVKhWP/uEYGFRzKwVPmL6bNnFiYx85FTYovFP0R77BtSbWPlW2p3SLwUWOes04Hj6HBqn
 Dk8XRSARymMkpukN7sQ==
X-Authority-Analysis: v=2.4 cv=X4vHu2Te c=1 sm=1 tr=0 ts=6af3ded7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=a8VdgqZZYpu-pf18SQIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX1okiFPkHzpJV
 reaymWKQqSx4esJ/j9Uao1cbdBnzLPutwJ+qd0WhTiWi2gYmip5kF7TbsfppItAZl7aEDXPMGBM
 P6yS2ecsDi/BzETBRGBeuFOqKaeay6HjJ2VvmLDzexuk0sz86dZu
X-Proofpoint-ORIG-GUID: mPPsI2NpYNTYt60NdXpZLetZ4_ReVjN8
X-Proofpoint-GUID: mPPsI2NpYNTYt60NdXpZLetZ4_ReVjN8
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 lowpriorityscore=10 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=10 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

On 11/10/26 6:55 AM, David Hildenbrand (Arm) wrote:
> On 11/10/26 12:54, n3rd wrote:
>> 
>> Hello,
>> 
>> I am reporting a security bug in the Linux kernel.
> 
> Stop sending uffd problems as security bugs. STOP IT NOW.
> 
> Tal has a long list of uffd-related fixes he is about to send out. CCing him.
> 
So this issue was originally on my list and I had a fix for it... but it was
REALLY ugly and a band-aid, so I dropped it.

I think the real solution is to just add actual markers for RWP and solve
all of these issues at once... but that should be a separate series from my
batch of fixes (which I'll be sending shortly). Is there a reason RWP
markers weren't done in the first place that I'm missing?

Thanks,
Tal
