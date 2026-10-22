Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686634;
	b=vRAjW5iPqYwtrnlGuz3t0KEimGxjlZt4IXHxltHFo5VhTemTbGrZp17h1PqKguGH+Mmw
	 4gvnInUfWU47Eq7wushoaUgyXNNhS1TbFBTT4iLwoXUF0S2sdFPc+0PxXcMGfG+qsbNjf
	 hnCC6TWl5YdWfM7mDk2sUF/yxJ6SfMd+gjj0zhNDCPK7SHH8OpJGW5+VlYgElFhQdingG
	 AUstV6S+5Ab+7/tmmLCo4F8yTq5kDXHu/GZVirhfOrScklV7K57ZwnDlsMcpboE5lN3vH
	 CBi3KYtrIDPx//FXCWEputouI7BZVUe7C3aTQCZ2/ZubPz03Vn4TyLfHfltE4U1cenA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lrrjHTsXX+lF0K8S1G4KJ7467S0hYPsoCwX9ER6dD6Q=;
	b=0A2WWnAkl500AMIajke1qiLaToMyxM96NC6sx/qiG9Q9ui74st9WDRZGNKjjs+BekBaf
	 1rPHOcZYWoimO1U9L0dpTuPsoCO438Nc53N7YKR/uLuAr254BrP5zXr3oUFt9biW3sPn/
	 LQJiDySxWVLwXSPiZgt8YP3mAhKIwYW26Z/XJXlU2rtPdMzPUliUWxcnLdtl47CM4l4Qz
	 aj+pgpN6GaEyT1+8CiEfJWtYHKmHxkoevcHNSuX0OW18yxxkoCDjVNIQejV7emIYMUtHQ
	 LAnmdznvfUYXTw0N7oQsARH1uj1QJnD+bzJOf0766WV0Ep1ZWi4L6nvquTrXilOKfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=fn76BIqq;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=By5KtG9G;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=fn76BIqq;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=By5KtG9G
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEWwlp2478261
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=lrrj
	HTsXX+lF0K8S1G4KJ7467S0hYPsoCwX9ER6dD6Q=; b=fn76BIqq4yFfeOp3x2E/
	B4Zq8cvnp6BCl73ATfof2p1JtnWqJyCMxxWMssNgd3kjOdhXQM/mulvQdG2RZKHx
	FjdlBOcHSLYNx8DaZJTeHGLj1fZx6p1u71reb54QROoVj1UGh7MSxGJ2Lvx5hG3w
	RHccPNHEuGTgSzfTplrm2yGzfIQp9QavXsECYOK+7lO/Pf19+XdV+vWjFu7dwshP
	lR0cT6IunRxWYcYP+YOXChKHrHi5Q9DeqhU2AK7fzZvz7Y2MTaORjoEpXiBiDBDU
	Z+5xjSbKxF9TXQZTWotEXnyBYaSokHe+W1xUKmaLnQFziFJdcJBtGcMUNZnAgbyC
	EA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hf928f6kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:30:27 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b529a8610so1331696d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792686627; x=1793291427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrrjHTsXX+lF0K8S1G4KJ7467S0hYPsoCwX9ER6dD6Q=;
        b=By5KtG9GGGVHjzcmCwfWTRdul9yG2TGlKlBIAJ32mi1pzd50OoqfXS0hb3KbTOYQ/S
         cNEgEDO5WOK/J1S29Sp4Hh5PkBd4DsdFsMkdD5K4qlMZk/08dW4Fa/4R5YCACEBPrsvm
         gwOK/O8b71H/ufFYlODBJJOEwBT9axEhf2nuF8ka6h7OhOBAvHwV1/auVG6N6tbF123U
         JFnGSP5LJxk8k8T9y06Vl8TB+9qokStdgm1Bh55bfOUy81jUv4DFKLCmAGtGu5hdAlN/
         Dr31tXvWlm5zaGeFhEW5Rn/zH9DLNslE2zD0+WG/306O57f6DYlOhIWk6SwHpGpp7FGu
         8VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686627; x=1793291427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrrjHTsXX+lF0K8S1G4KJ7467S0hYPsoCwX9ER6dD6Q=;
        b=Dd8ralFLeQGXdImxeCHKG8FuOLoRD2zwoXrBIJ70+6huRPpKS55ePinGg4KGU62M33
         AUUQDEKfUj5jMSxmuInwSnQpIGP9cqJ27qwGMo1FFXtD3RmS6Obc3TVq+0GvZP9vfd0R
         WzdMbpfgP60N6K8wmRF0/8NmQ4jpYqgQWLJ9/XaIfKPNACcV8+4HYqbZYd+L1gDPQ/2E
         O1LAY0cZOeRWaG91B1N4/SnSl0NYnoyexqYT8TvBZD4Zk0+c3484TqulJO5fh4pRp3Oa
         b421HfTINpV1eSMGYQBe2vst/ApI7+kVemHFfEDy1wTEZVU0kOZbN5Wf+Yc7UNhAuNAY
         pjOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8VxPLnB7IJYE6U6TUHX/N4d4MmlMLxPuAB1dOwX4amTOf3INmFNtj06yp5jaJl3oj3BBWiZXVfE2cY1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYImSyKEctdyhDTuzacuKAinS84BjeX6lw6mIzlrQFNY7Uq0zXn7
	dcOUNDMmpxWlB2SWvFxHzTP0USr21Ai1fq76jkBgdO9Lfujz3U3K+HPqNfGv3jKfSXGIRrXjJLi
	fMHoe3a7DrX70qWP0q/Y77L2a9vXXQ6DvdTb0czA3bSQ+009ZZN1qTStCPyypqQ==
X-Gm-Gg: AYBFou1p8D5qnCdOEDQp5TAj167C63LVawjGUaU3CdVy2uPEdIHUwfyKvfoizE9T38m
	MSL/ZjkhLhTK1pVNO7I/+BJYt+wXzbpHQkyTyYXniiw0ebV+D53M95Oxtj1JOOE5jzRWSOkGnGi
	+beJ5TL21+/Z6ZTSuq1cW6ZZdjEpu7Nn9MMILjkqoFnBdWitojDEj5Imrou+EpWorEIqHWF7Noa
	EfWACMn0xf5ymW47yL2pme5Mw6sjSMmJYaX0hRp41SKw1f4lFUC9MUira98YcRzwbVrn+5BqnVd
	5Q2s8ItrY139ZvXjNoV3Bk/hb5KUFl4Ri7q/19WIGE0uTNa8GMV8ljmK6A1J99oAeTg4AQnTNbx
	mjX/dVaH7mI4WUnD10FdcBKRbFh8wDMCREIf4vM9q3+NEdwHF2lQ=
X-Received: by 2002:a05:6214:5283:b0:91c:305:a955 with SMTP id 6a1803df08f44-91c12ee13femr95696836d6.31.1792686627090;
        Thu, 22 Oct 2026 09:30:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5283:b0:91c:305:a955 with SMTP id 6a1803df08f44-91c12ee13femr95696026d6.31.1792686626376;
        Thu, 22 Oct 2026 09:30:26 -0700 (PDT)
Received: from [10.207.2.202] (nat-128-59-178-167.net.columbia.edu. [128.59.178.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c370ed672sm1061766d6.42.2026.10.22.09.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:30:25 -0700 (PDT)
Message-ID: <816dcdc4-7b4f-4d8a-982d-5fe45c3c3e99@columbia.edu>
Date: Thu, 22 Oct 2026 12:30:24 -0400
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
Subject: Re: [PATCH 0/7] ecryptfs: remove the remaining struct page usage
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AEsupXpFeOcbjl0z3GZLoMtPUXWFts7I
X-Proofpoint-ORIG-GUID: AEsupXpFeOcbjl0z3GZLoMtPUXWFts7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NSBTYWx0ZWRfX3XP7JU6s+VUp
 f+OETR62G5p6oPz8/THNR74cl/IJH+ndw96FUkDpXh3xdcZQMjLJPbLNyUxMZKVGjXTc1qpY51e
 jxB34tKSM1DKIEsyu+giF780k6KlqODhUiYvW1ixFfU0mLkqf18EIa934CX1ZMuAqwk/Vn3ty95
 HqwyrkFlzbEjGeURG7oqbXWbvtauym+Rl0tkdjhBxtBvQ2NwQs3GgXdArtZvHKpo2fAg7HYBuKl
 bokxq+5iBP16g6iMbpV+3Cmt+LEYFWDRou4Xges1OFiQiqvQuEOoi+O6O73oz33Knb9TEMk1nA+
 j2LXgsXpfp2AK8aAVKtCCxNE/s4CElQ8OMgObMN9uDgl5XtR7bfINDNJsxJ2sL9n3Cj+ynqKPIH
 YqxY0cuYaag/NrO5fygNqjw7UkGmuAuHwErck1QTPGI4hShqE7nm2jTY/YRBR4mbqSeVOAYbKbW
 Dp2Ig5si0J2FPN/DDSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NSBTYWx0ZWRfX1fAotz/k2g2M
 TvHAv32bKERJkIOvoCPxpHj9vFH9aEUpdRDH/K85r1af+txOpPPBH/GPK2eR/W57Hmpxki7O0Ii
 CKbP53afXJlLoO0oyh6o8GhI29dfxFyAL9CbAgUU5Y7j8fzpOXBJ
X-Authority-Analysis: v=2.4 cv=dcIVTnXe c=1 sm=1 tr=0 ts=6ada3a23 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2Da5xiS/qB/F0tTsr62afA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=gF-yDPsWzASaGOsw9AEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11942
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=10 impostorscore=10 bulkscore=10 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220065

On 10/14/26 9:35 PM, Tal Zussman wrote:
> Convert the page cache side of the encryption path to folios, and use
> plain kernel memory for the buffers that were only pages because of the
> old interfaces: the ciphertext block, the header buffer from
> ecryptfs_get_zeroed_pages(), and the scatterlists built by
> virt_to_scatterlist(). Also make a shrinking truncate zero the tail of
> the last folio in place, as other filesystems do, instead of copying
> from the zero page through the write path. After this, fs/ecryptfs has
> no struct page usage left.
> 
> Ran cleanly with fsx and fsstress on ecryptfs over ext4 in the default,
> xattr, and passthrough mount options.
> 
> ---
> Tal Zussman (7):
>       ecryptfs: remove struct ecryptfs_page_crypt_context
>       ecryptfs: use a folio and a buffer in crypt_extent()
>       ecryptfs: use kzalloc() for the header buffer
>       ecryptfs: use sg_init_one() instead of virt_to_scatterlist()
>       ecryptfs: zero the tail of the last folio in place on truncate
>       ecryptfs: rename functions to refer to folios
>       ecryptfs: refer to folios in comments and printk strings
> 

Sashiko found some issues with patches 4 and 5. I'll send v2 with fixes
soon.

Thanks,
Tal

