Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584771;
	b=GoePCW9wcXjc/hLczhXUV1NeXqIE4SoYJIkg87OmodnPoa42+IEM2MSUG30dGoTkfcKy
	 B83y4/0ShPPx4JnMDJ8t2N+2IDOa4sZPOH9iRdSZIkVHmhl74zGVY87uiCNUigajUTfDH
	 JewqBEI+xnm0kU/8DrtyL+u6+ckijBIeDjguvQyKmuJNYH3d8Ab95GgZonPoGe7nf1hGl
	 CxvzEIH/ixzG3p6jjM1lYoNtv5McZkxLWl32E4xxmb2KO8rb39H6YRqx8bjKyDzfv+Qoi
	 fOR6SWODKnadMwBmLzKF2vn80jNKWsYSb4RIYCoGoNbJPGWawpNbvM2ROBORYG1nNmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TOa81AMcZ39FVPpdKUi4a+jsK34E7NL5Bi1fu+zvPwA=;
	b=BDYzJoER043LI8i3925Fqq6zh9s0wWITpqNtikkWdBYSIuXOCreDgjNFcyg1GYz7GcdL
	 MifXXsXNY8IZk2LlMZkWdVf8/JRoaURgQkws0QmYGWBV44o5tXRHMGq4I2SGF11lwz28t
	 PccX7diK/KqrZk6H3LYkllFCeNwbMMR9aee34nDTDIbPnMBhKn1P5ZZt9afYD+7MCPy0H
	 8VLuZMTVUizFoXp6sPJCapltg+u0N1rLOOU6H7CLhoOH8R5mJq+/Q9TpgIWrPcfaMvSDM
	 Jfn/CMMCoEt/AGN4PyLE+OaafjPHiMdwKUCFo6fgKd4KjQeSCvn1x1mB4PF7wmt0/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Mz6kD96k;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TNNLVyBO;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D110606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D110606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Mz6kD96k;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TNNLVyBO
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1DSu0e3811211
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 20:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TOa8
	1AMcZ39FVPpdKUi4a+jsK34E7NL5Bi1fu+zvPwA=; b=Mz6kD96kVplItFSo8ra0
	2qdsM4Hk13j55ItZQHvGa91+l2LcpZpC6YSnV19GSCxGIYVbivLeQu+eSwmmdV/m
	snscUURbS+gNrPOnuJkxuAuonUERyq6VhndtrXQRj1VnhF5KSN9TIJyJ3MdULojq
	4e4qeB42BTz7FPZcCLZzdAg6g4Z50XZNvULk2re7VwZEygPY1ORu7A5IcpOk+WB+
	KXEW5sB1MF7feBUYvmO+Kltpt5OyL5TDuZEO4UpzOWJsVxGCaIq/8jFulqpD6Dkt
	4PAkKHadGxT+FGV4R8AVup96qqXZvuGFIGbOcRYU4AzVW9V5NOusxyYt3vJSmlE3
	Dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hp26w44xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:59:29 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so175837485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793584769; x=1794189569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOa81AMcZ39FVPpdKUi4a+jsK34E7NL5Bi1fu+zvPwA=;
        b=TNNLVyBOfQ4HYc2qWQV5Hs9a2k/mgCM+owx4CTV9+yAcIo0sMFPrECssRDjF+5Q1YW
         MFvEbJDOuYswJePR7P1VPKibo/wvi4sBpm96erRUvOl0VK95Qm5Q7A+zXpnE3Y4NLa7d
         k84ImLnqrB3PhoYPrxAgIvGu8bxPAFrwYf8VTyKIWT2u1HkQoomkoYR6o6Wm9k1gx2Xp
         139w8p/Tm4oKPa/9JuqRQ9KjJRNILTSM9ZaZEQ5ZY0/lzEoIqLLWu30xzdIQO3L50Svn
         t5312P+x8lcdGhJ/ZxZkHwq1Kp851yWBHo2vDxWuRCV09snirwLbUplZcPX6hsBWHGGw
         u9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793584769; x=1794189569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOa81AMcZ39FVPpdKUi4a+jsK34E7NL5Bi1fu+zvPwA=;
        b=T17e+ctYpUyw1f/ikP7pRLt/x4seR4Fs6mJjsq2krGy2MI9L/8cED5jp9ZPBvd8UOb
         iU2V1BpDM2pbdQCWAi4PYTJ6u6a6rPHDW6/afSW0MqntJ6rs85j4zah9zdt/8I67qtnd
         ImhgzjqJ54flNeyJx+xqqJ8KTChCl5FAEKC8PAv28YaXrEND5QexKs+6DbTD8u6nVNNq
         De9qeb5wJhkskrjDddqhs0ZfheUIQayxUD45I9cCgo3JskHd9Qot8WOFYW1g0PfyJc7l
         J7rt31lM0N27osTw0YE5uH8z2g5N+zUryYzaRugKKNlI43qmJJK/KW177F7AVmfeOyXs
         w5Hg==
X-Forwarded-Encrypted: i=1; AKwUvBy7fzA+zJdOUyDxuiUfbnJ2EL1vWeXW5ywwRAaS+evKpLZCmaYOGKeCSFcHhR/HsvXUT9aMOcHDvg2DkRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrR10g2kKuZnRsdhcoraHF4llDSeNtSxP5jdveixGIpHdtqcxR
	8KkNdHsD3IetMmt8rPca3cTBLYfetxNQVPi0h5n+08LbFm9S1h+6wxp3OOLK8usv/72KDfIZ+u1
	K8CzCWVfxcdjvrhoLkZNC3K/FJ5vR8NW9KGI23sAXMWbnxHu+xqbMMLSejMjynw==
X-Gm-Gg: AYBFou1pH2hlAtYmGTXWi0ot6uFZ/C+0MD2DDR2AfaYYspnFGZP5GOdKODdKyykx6Mn
	a9wHhJCwDda0c5a297++CbkqW6W8468UiQwDqtf0DETkUoq13uABNndOYcq43PcVHGh7S9fVMLM
	HYE+neHvLld4/0Ycdv1Dn4OUAI3/Y9K0OL5Da0/iKRwD/zgJy0RjePpSXV0F9ZmKSA6suxrf4de
	3pIirsAFAS1lhqNJf/AEj5m4xjC1NW8O7b3sTEOMEljBkmO11HPqGB+eMfRd4e2c0Xvhd2zS0a5
	s56tU8ckZKUxwJUc9C3NzWFcHwv5gjMvL9RDOdCjXQ+wV9nCOhOE+w7j97xOh8Xfw5ZTd0roYKd
	Ic4G6g3BZahAyTzUbgpOQCQohaKceP+Bu34LStSbcU7bpqueDaNiyyIzTcryyK44FY9iHlYsTIx
	07+mVfzvgRwart2wFU7C3nPlYRlqrnkJOvTyR93NLWez6IQ87FtOadCf761pp2XRxpqUoQC8JP6
	CJbqdnaF5D1p629vn0XVbxDeARTnAGuxk0aZREqouD/iNEzbOzeQ4I13Dqro37rU2TYtsmXUuX4
	KmT3Mg2/3L2ZVwbi62hCiITKfqsqTAua/Q==
X-Received: by 2002:a05:620a:2996:b0:93c:c405:3215 with SMTP id af79cd13be357-944216970b3mr1557092885a.44.1793584768861;
        Sun, 01 Nov 2026 17:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:2996:b0:93c:c405:3215 with SMTP id af79cd13be357-944216970b3mr1557091085a.44.1793584768559;
        Sun, 01 Nov 2026 17:59:28 -0800 (PST)
Received: from [192.168.1.179] (pool-98-113-200-94.nycmny.fios.verizon.net. [98.113.200.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ac6bddsm715383785a.37.2026.11.01.17.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 17:59:28 -0800 (PST)
Message-ID: <1b21a602-aeb1-4e76-9f12-87761d89de86@columbia.edu>
Date: Sun, 1 Nov 2026 20:59:27 -0500
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
Subject: Re: [PATCH] btrfs: fix bio counter and bioc leak when async
 checksumming fails
To: Qu Wenruo <wqu@suse.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
        David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        tz2294@columbia.edu, stable@vger.kernel.org
References: <20261101-btrfs-async-csum-leak-v1-1-feafe7ae61e9@columbia.edu>
 <d9990870-188d-49b5-badf-9e7ae9a273ed@gmx.com>
 <3d3cedc7-a148-40ef-ac22-9aa89d0920f6@suse.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <3d3cedc7-a148-40ef-ac22-9aa89d0920f6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lvXkIlHEyVAoihJevDqCAEG1pOiOAjKq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwNyBTYWx0ZWRfX0LfP1UuG0kaF
 rAbk2JLUPsa8EcHr2ImFWsqFHW0FU4xaexuY4y7qy7RBABoBdZqhbLGibEbghgpjPe8kiY58S4z
 D7QBnn/HIFe49/eObuI6pQH42ei+N/VBwP1fIfK9p3G6xhNgFKFz
X-Authority-Analysis: v=2.4 cv=E9JYNqdl c=1 sm=1 tr=0 ts=6ae7ee81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xAVkXJFauo6zK1gNGjfgTg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=6ma1GsHSQ2guFgE4MT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwNyBTYWx0ZWRfX5dnWCfDO41r/
 liw3Lz14hWwXWXavwX2nB1p9Bp+mpZNwY+9zHKHqrhEcQ/2U0npB0QSeVQbtHKa8atT7nsCeAFv
 NsaQ62SuPPhgQ/7ivmnT3+xMLY+DTYIxQy+besJAK7HkahzcHvzPn04QTznig2OaLDa0LYcXWdS
 M8QIAHV9UbdS0hQ8WyhVxDfeACVoZTTaxmwVpMTuMXMYH0Pb1SBHWurLdqtVcvteE35nCCa19S4
 vq3fZ77B1Ix1w6vxelDYhnS7aAciaGin37rbi1KLgWkyidAOvsHJfBTRbHEAvr+S5v8FepZSAkF
 EWhrwZsMSGYhgXg1CKKLDbYbcskSR91ONWUkOVzMFQeJO+rqqDbPnjzlTWETooZsSM8uDyZnJd/
 CtXLMPqnZ1+iVUKL4TL8O4nFzXJL2Y2g+01K7Mo45mlWLQQjT61L0bMXSEaytxkKGx+Xacc9I57
 E2VPoh7bZYfXfbYCRsw==
X-Proofpoint-ORIG-GUID: lvXkIlHEyVAoihJevDqCAEG1pOiOAjKq
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 impostorscore=10 phishscore=0 lowpriorityscore=10
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020007

On 11/1/26 3:53 PM, Qu Wenruo wrote:
> 在 2026/11/2 07:08, Qu Wenruo 写道:
>> So I'm wondering what's your setup? Are you running SHA256 algo for 
>> checksum? I can add it to the commit message during merge.


Yep, it's a sha256 filesystem on a non-EXPERIMENTAL build, with
failslab failing the checksum allocation in the worker.

> And Sashiko exposed an existing problem, even with this patch applied, 
> the error handling of btrfs_split_bio() is not going to release the bioc.

Good catch, I'll put the bioc there too and send a v2 with the sha256
setup mentioned in the commit message.

Thanks for the review!
Mani
