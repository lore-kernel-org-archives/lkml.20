Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547981;
	b=SlD8MFyayD3Ije0Bs4mHGtCiC5OIn+1Z0GQv92qg2WtgQt59PBz31cJ1cA/DKlvuXQGO
	 Zy4K05tuwweBoIMgiN2xhXoh9jmAFNiQszaK4xZjK+aSiuTjDY6vrSeFHtiH5EdHbD12D
	 BvRvj+EP+SUbMETKRrQbfz6zJAzGJi5eSYlYe8J1FvjGHT2ztj9nMFGsUUqjPtlkt3atO
	 YxcNFxRlxErmVXywudhRcPdEcIYmM72CJKneCBAC+oPiRIwiw9v9S1fgBjpCNzZp+SFsz
	 HqZWNkxSeF3wNIIPC9gNYnhvL4n8aZZ+3w2R54pw0bFysUzqJtMbroiCiOmBUXV/X6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zh/eyo6M2RHjRsF25F61w93yrzGMZmR6HtXDWGgj+0M=;
	b=TJHDbLgYq1NelzJNJzxyy2PPOe+jJI2J2vMjCZI0SIN5ImqoWrBfp6uDBIwM6uwsqFRi
	 IUOVvYMQeZ1Q9PmgNClYF3+15EgbFfndQ2bhUuophtBXNGXbF7/1taoFRMzG3inqkqXxi
	 yM3ujr/KlFwE8/PlHehZvoFyNaiUP44k47CjOioLjGY756bMBxfD6jJGu8CMO07J52OuN
	 UdMjjFM7G+TReS4OdhL4rwjL6Uhgl1eXrs+4U5UpAbv9ZVowunYysJsxW0VdTKj1as7T6
	 OT4HgLJaTd+U5733QRm80gdiZayHYyaUc5LV5twe174qoSY3Vck2TrG3pMvMCYS0c7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=fiXWWpqr;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=PAg5dkLY;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E84606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E84606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=fiXWWpqr;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=PAg5dkLY
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1ESINZ3608493
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 10:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Zh/e
	yo6M2RHjRsF25F61w93yrzGMZmR6HtXDWGgj+0M=; b=fiXWWpqrhEKnabq+O8Qe
	4p7MYiwp1IDmw2sq8ufILH2S//wrTtB8haPB1cgQBujDVeOIXG6VJunRZXdBf6zs
	7JHGnMMl6Xcq3vIedZbeSkWZqstfxnhl7FFsHW9d1qxFfTlUvuTddjf52ub4yYMG
	uibGhVgGx2ub5WlBiT7fHWrJv/R3ffdUvtCyGjOH4JO9aGJj++jnAT0v6cD1SHfy
	UqtIlJTuhjlLAc3I0MR70WOxpSMHZfwix/P6cZKvsy0B8x+LOj+UUSGvjUpWVXGc
	guF9bJR/lpXWy+vHTco3ETjGKkDw9LZ7Lsp56Q4vFEYFLrMl+31gFdOCDKGb5+2o
	Lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hp77fgcn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:46:14 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364605e74bso65938751cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793547973; x=1794152773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zh/eyo6M2RHjRsF25F61w93yrzGMZmR6HtXDWGgj+0M=;
        b=PAg5dkLYAOVBadZv84nNTi58qj+v7qcgrKTcF75dGAtyBxo+0JNRT8OqKv57zgxDiz
         p+WK/Q9xSzgQwmp0XGnqQmr/mxK8+FbM/u+SqPAqTM2gRuoHa+GS+G+sZ5z+9yW1OQBU
         EJJMOeBi1eiRfTbhU/k/hJgW/+s1WeGup/5ENkM3MX+osT56ecnFlQSXA2ajGd6IZYmp
         9SwpKo6TJnIwL2Y+b04lmWN8S+ugGSCUGihVzkr0mLpvba9Zzhi1ioznJVUBnZM25cRJ
         bRf1pLWgSZyNbQpHF7FMzH6VCADtVraa7RomPSTaqf4dOsT9xgMz0q+Xjh8nOsk8tQFF
         dk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547973; x=1794152773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zh/eyo6M2RHjRsF25F61w93yrzGMZmR6HtXDWGgj+0M=;
        b=beaGfkdqAkS5e3sWDuoHlAQoZdgvHctgb3dvof1yeQZ70n1I05KUhbEH5JS9IhIDb7
         2OEy/VdA5AuRC1u6BCoe1fvoTBEu/gYmtmAZ06Wrm3FFbYIFmJeDcC/kVkVhL8gGs19Y
         +U8h1sqr7e9oi1cJtziTNKGEJbv1Vdxe+XcmUkw70Yur2jNPSULOS++k+1r0kPHFdYjD
         jI/iCrIrpACzYBNN6r5NKH6uxi8dghLJOK7dKDGwiDgAbhIxeljvQdRDWHPVFCyDmbH/
         ndCFmtGVKkob/5gavHyB4S3jniqwORuCrEtwgaE7vsXE9+Zg9vWHEpBRAh2nnMUavKDw
         Bvmg==
X-Forwarded-Encrypted: i=1; AKwUvBziuO/83gr4v/eYh7lARjV/6AoqQBo+P+sRQ9Hp9Jnv8kMsCDCP3UQFL2K4fw44ea3m0ncUx8zW5sakQa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcXFfB02GO3app1fZmAIpLRlsH87c9OQIsBwfE2sTuHqLUCDzE
	hxkdKBr+7Xw+QMr/UEcnDwnZoPL0ERx5cJzdDiqwyUdPwDAubUDu7t0f11XuA9xfSOXeEtPFXWV
	81bbMCqV7IxS1ErsL0mXArjmsoc38yIZp7kabDiyusU2grpNn60U/6Ds74q0FGXz0dDmfYWwu
X-Gm-Gg: AYBFou16Ls+1aCcPIHRsCBMrPHSF8xGU/qgxLKQKkxQUIpW3U00RzGhUdai+cHLhDID
	u2v7vBGM8fJze1X2kPUwu41YwVvZLsEXfWhp28Fggw4NKYPlyUdjMkHT9X+5GuCQw9BN1IAI+FB
	5KRUHkrBJ9hhLS1Wc08nbbYYMxtVf+8U06e29Hg6dSrmgztjU4zUd2KimDCrK33MKJen9DFzus6
	JJb5W3DY3cym3p3GQ5esPJfpCfyKcw4MIbwRws4uz/Y7rcWQueD8F1Sq3Xcy3PO8DsN6wVgX/Hp
	mRHKmzFW/hQOxUpt0ngnTIQwcf2dbyx2fY3tdrJf7EnV2KFW7tJnjSZorYaCtgpjc/Z5PqDyqK8
	xltfSw/LxxWFkGAmvLiNQ/OfWPDWck0VOR7/2B5vrbHxzBVap0+MizVbp9QDXr7187425WGRYfl
	zX7lYYm0A7ATLKiD6FhxREaGlgZqRH2Qh3F4wgyMgu3SI2Iq4j6vfzZqER7a8vPMbFB4vw0S5wE
	YX854+VHnZxV1VWzgqTnGRhy3ea94Sn42kzJ/MJehEixJSgG9O1VqTJ1LfZtVLwoUB0rKCNGDBY
	ltG7Ms0olGJqg5jSIFs=
X-Received: by 2002:a05:622a:2445:b0:536:6c22:e346 with SMTP id d75a77b69052e-542b7ef7ee4mr131486201cf.68.1793547973588;
        Sun, 01 Nov 2026 07:46:13 -0800 (PST)
X-Received: by 2002:a05:622a:2445:b0:536:6c22:e346 with SMTP id d75a77b69052e-542b7ef7ee4mr131485721cf.68.1793547973169;
        Sun, 01 Nov 2026 07:46:13 -0800 (PST)
Received: from [192.168.1.187] (ool-18e492e0.dyn.optonline.net. [24.228.146.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e23441sm68905836d6.4.2026.11.01.07.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 07:46:12 -0800 (PST)
Message-ID: <930e2b99-df87-4aeb-88d0-d12d012edbf1@columbia.edu>
Date: Sun, 1 Nov 2026 10:46:11 -0500
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
Subject: Re: [PATCH] mm/swapfile: drop a large unmapped swap-in folio in
 unuse_pte()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
References: <20261030-swapin-large-unmapped-v1-1-41e4ae378e6c@columbia.edu>
 <04ad7001-bdd4-47e1-9a80-5b2464da1044@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <04ad7001-bdd4-47e1-9a80-5b2464da1044@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MCFS9DrFsQ4FRHPMcNqRlaWm6GAmhebL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA2MiBTYWx0ZWRfX5fSCn0soK42i
 LuqVVjfWDyS38VRq2uZXJzTvGwYCLMFgumlKij/7NWFTfX3oRzjD3gbORr8F9+hafJptYJwZvur
 UzqvAxPFxMcYTCtH9jperv16AJY08IqMBwrya9OmGnCTaYV5witM
X-Proofpoint-ORIG-GUID: MCFS9DrFsQ4FRHPMcNqRlaWm6GAmhebL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA2MiBTYWx0ZWRfX+mJTPhIouTbE
 1DmfWvAv2zPKrbtxBbHnmOGHJJSIxf5RKFcC+0EG6zNFO6AHtmtuQSN1kXrN+ES6IGClqlA+d+c
 y4k43LGRzBb8FY2cyU0tZPyFnmuKMaOhX8w6oj7a5X4zFeRZoLXTKY+odXRVzM5hfEjeENVC/4h
 J1cSHEU2VwmTSJLKt8gu+XVOqP7lP0Jo0fJi0sfBW7XgLUSJB0INBJrAyYMNyG55pbvedV/qUUW
 kEZhhd6cmI8bI/xOuKwE+a9hJ25yCIf9bApPGWbce+6sl7wkgSFNGZTxJ+XwahuBDXsVimlgWU5
 k4RhLtizdnMZOK1i3NjnYVWlCNCeeLoGEf0cuq1dY6UgP8atytMXHu0KaBL98Wc4cfvOJ7TjYDj
 +AZ2/1FF7J3m9xDfQs08HgCN2FozOeqZx+RYBYtFKF36k026PZouUz6XVCRvygxKRak2TsASvYF
 CQ7uaPL8KExFDEJFs5Q==
X-Authority-Analysis: v=2.4 cv=OLOyTiaB c=1 sm=1 tr=0 ts=6ae75ec6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FE+fbgsriwsnvVT5CFHM3g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=JsHdwqBLpqT9QgIBurUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=10
 adultscore=0 clxscore=1015 bulkscore=10 impostorscore=10 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010062

On 10/30/26 6:15 PM, David Hildenbrand (Arm) wrote:
> Why is this special to large folios? I guess because a single PTE keeps the
> large folio alive, right?

Yup. For a small folio the one PTE maps all of it so
folio_add_new_anon_rmap() is fine there. For a larger one it marks
every page as mapped and exclusive even though only one PTE got mapped.

> Can you pack the existing handling in do_swap_page() into a helper, pass
> nr_pages, and reuse it here?
Sounds good, I'll do that in v2 and send it against mm/core.git
for-next.  One small thing in the helper you suggested though:
the first check should be folio_test_anon() instead of
!folio_test_anon(), otherwise a large non-anon folio would
still get mapped.

Thanks!
Mani
