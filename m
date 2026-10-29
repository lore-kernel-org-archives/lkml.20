Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286313;
	b=b38fM/GSUqYqaYK1yi/3mTwvvvRuxdIqFnVLW9uf2kmRWxeUvPXI+aUr9/O7H3fAwkfv
	 TF5vo7++LLtQQ6Lz9uTNU3SxqCGXSRs0r2QNya0rVek8I8mv6dQeTgscnczREFxcDhXvl
	 eY56I18igW58bJFPMdcASNCL8PH4YAOsUbFCjqGPNqL/ZHvidt2TAcTVM8vlryidVqvTp
	 bure3uJ91q2UB/cVs48SJU7I/iFzN+yNlSx70QFtQQaBZWQ9A8HlqVYut+KkNXmTIbUIh
	 xFrSrjiWSW2SQs1E6eoCUHMvlIBKJsde3+WC7EDmjPlTfNskS1X0U2s8bQp6+KzvYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vdl3zVyVjBZWDK1aeLeEcxRGnowINUoX/w7iRIrrcs8=;
	b=1J0JbEepN7/UwbA/fLJpVWy0f4YzdH8EHKrSOKeOjau9WY3LiROlSm2XTmTeAh3fdsYn
	 THUp/oO2Yh70DnaiF3mWPNL1xsN5HLKMEiB3SeBuMURzt2Lty/sSW5P252oAMjLysV+b7
	 /BPmiFgDyRT64RdGOL3mftRHTcAVwonbPo7Cy/pEHhblmo++tOHJmaDiIKVIzg+P9PX7s
	 b4xHwGBSlt+oIYWYLCbtE+U4dnpkQDSbDzFDcGf4HuX9/W7xGSXbK5xleRYuHte1vYU8t
	 rSKYGP1Tg/P5Ge21xiiwpu0a77lTKB+6mQDi/vtTQUFpYY7czqKQVpCuiaHeE9RdNYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ut6AC4sr;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=KTvkBblp;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ut6AC4sr;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=KTvkBblp
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TEur962153445
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=vdl3
	zVyVjBZWDK1aeLeEcxRGnowINUoX/w7iRIrrcs8=; b=ut6AC4srs2Ls6ntSteUU
	tMeoOU5PB/5JAsOrBCD/1y8thr7bVXPn/20RI2WPzj0O6pD8NyRoAbDtJjuEIvqM
	hztuZCo3eTFcwdNMYw4C68qn5soZMC4gxRNKfOW7HLwpvmGg6OtjCHRxzsyYePY0
	BxuEG4DCxmAZ9XMY+ul3ynMCQzxqn60tBRssboT1sVp9DmHM3LS1ygQPJr4DcqfY
	jjIf4UxOegCQlwFTCP1hIIQ5Tcf9f1le3eNKO45azU0q/fR2orVSKEwl1w86AoJT
	zyKj/JkEGGZsOZZpuxTpSUuZW2+qi07SapJBkBeGy1pGc3kGHEKUrMdgAzttXrkU
	1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hm7tt0f18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:05:05 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b4bf686ceso32310736d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793286304; x=1793891104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdl3zVyVjBZWDK1aeLeEcxRGnowINUoX/w7iRIrrcs8=;
        b=KTvkBblpm+DjYOzWPoesGHfRGDc8Y9esTAi6XStHuQwetj3MPH9PNo2E4AIIEFq0aE
         BWgWzP0WHnQydCwudIvSXOlCn5CeHEJvahMEdLcD5aZiOvL2WIHa/qE7QapGUlMhVnbF
         Mx+9pLUx6w7WrOhVsEyEiSLKjdEggFbiCIBAn/s2kPz/zdcYJReIn99cRUJRJk9h2t2e
         t9D3lDV7xxda00mmAlYzxv3SrymE5+cCRHK7QLQWXhIJo6KpNrBJtvFyZNN46uKKumoa
         5egx7M+XPANaizEZNh+2yryp2XYfTGhLChQ7OVoUWlrYffWCRuFUkazHeisXORXyYw9o
         pOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286304; x=1793891104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdl3zVyVjBZWDK1aeLeEcxRGnowINUoX/w7iRIrrcs8=;
        b=slBQS7kM7H8fTOZsHUUxdVxdhu8WOQRdlIgp1+8GBWR+QeNx6Z1j1utAinZKOVDDxo
         LnhjisrTcVNGGsbH4shHnyc0bhcyHRnyILACq+htaV03dTALWDQp66bieOGC+sFIUhOD
         LUqTkdpIu17U+9EGQtkyAPGckiuVqdShCIGprxC8aBF9pocio+LPSk0tJxDUgGcbNMTW
         FoX0o4RL2mGndoGdQRurNjWPP1V4Am2WekWgkn04t/JCu7J4+/8QzlId+HLwuNW0j+ff
         cHWdUNgWsWYHahfW8pjXNscBCNUw6MexJa9nwb0w4IZEBZDiEi8eWpxGtvm6KlCsS+xz
         tR0w==
X-Forwarded-Encrypted: i=1; AKwUvBwls/GYdkw70Yd6sw/vtUELvvIo1RJSt601n/Pvnz14julN5CZER2AycauX7lOEiJm6bAtjYaGJZbLHHB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhDxHD8Fi0cl21Ltf5JHb3w9cw4MLAknqLfpLP62wrNYXUW1x0
	tV7bEXoA/OSf6HXzvNQJJu5k8jiTNCePMiErnKIlAIKMtRPVzF9MkhumWevKONHVcpCxCzlMZYI
	L9fZhxB4O6cHYyZ3YG9kusyH0W13qwEJtLj0u4W3NT98pFBNN3rsL3WYzIlEPcg==
X-Gm-Gg: AYBFou15wDkGUMuz/Rzlu8lwwl8FCRLwOdhLXXVHqfaIf7crgSyu/4SvoQNu2CLyO4t
	jVViFLfJQNO0cOCibFx49xVx0ScoexrDCMiDuLQ1CEj7TDU/V/lRJA/22vOwrH8MepLaLfGeihs
	eJ65Gu3S64QvqKiCiBWEynw9uuNR2ArjQEDZWJMwrrdjISBha0FCkoEgKx/aM4E8rZmvvcNALfe
	JQvIjvk8EcaymS5ahm6CTGkEtV9zu3AKMOlLGL7A+5LNPeEwgSSsqM69vpb4hXIY9M7SSFp/FL/
	I3m5bTigeU74o7z6mrBsEBIe6CN3+gPOgt/nRRBoWgZJ4oZU3Xb+zQ+M1sQUnOhsrB86y2mwxhk
	+cRFAwpvyrUs/3+WpRJZIUDNnKbH+1YsOobV7RTZMD+qFuR1KuOsKzVkG3T3hr+2wD0yVCVvf2M
	Sr79ro8V3Z+Jjx6Q7kEugjf+k826YjNFKx5mmKSTZspEtYuiFd8SEMSEXpIxaKzf7EfofUmPLEr
	K3+2DF4y8oHmCUBWHHzp5Q+LLfybUcczfP6VdnCkmMnDaEL3XTnqE5yPCRcDV4Qj8Q=
X-Received: by 2002:a05:6214:ccf:b0:91c:524:465d with SMTP id 6a1803df08f44-91c7cf468acmr86813306d6.9.1793286304096;
        Thu, 29 Oct 2026 08:05:04 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:91c:524:465d with SMTP id 6a1803df08f44-91c7cf468acmr86812696d6.9.1793286303616;
        Thu, 29 Oct 2026 08:05:03 -0700 (PDT)
Received: from [10.206.158.158] ([129.236.230.185])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca29091e0sm22536d6.7.2026.10.29.08.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:05:03 -0700 (PDT)
Message-ID: <5537eacc-0884-4b05-9634-16dff0eef69b@columbia.edu>
Date: Thu, 29 Oct 2026 11:05:02 -0400
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
Subject: Re: [PATCH] exit: use READ_ONCE() to read mm->owner
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu
References: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
 <20261028235404.2a24aa50c06556eaf77a033b@linux-foundation.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <20261028235404.2a24aa50c06556eaf77a033b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E6lYNqdl c=1 sm=1 tr=0 ts=6ae360a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=s68UaERRFoarOrKl7kvqFw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=VwQbUJbxAAAA:8 a=5dIJZD-rmGDQ5m4RUCsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OSBTYWx0ZWRfX9oh5+PWCE+9c
 8MyDXhgMqQahyND2jom7z6D4s6epThm2T1oaPB//SIcTOsgOZ2HpGwBYPNgrL2xggzUXje00GlR
 54CoJO4A5ptZ0Crthoa0+Tzb/HLv1yP3rTdkf3Cvw4SQvhSgeehJ7xdHtVORkaMBg7Bu4WL0Mcj
 EBRvpTIP84n5F1rEqHzcRVDxRbRNpHSNsOhtTc0lLI8/KKoesGndMAQsupbzU26BwpGZSgJRs4b
 dvAtBQbJwdbRBGY/L3fZVR+ER8WUoR0P7jGXgLqax997bJWiz+j4b23nsUqu1+HM9lqxjTjEdZb
 s8IXafuqt6PhVyfqAwF1iUQ5SBzW/GWtV7LHj5EN4U7GdNaGcdlBWPcAQ5zZV16KGZuc4zyfalv
 KhcABlcvlFbvdbhgIXyFDTpamlGovsdLzUCvbSjmrqF4/toD7fqFBoYMFl1yHw6VEHqXFLtZrkI
 zsEwnp4D5WozJn59oMw==
X-Proofpoint-ORIG-GUID: yLRIaZokEYaFAvLMvYrBVA23oLVRzggb
X-Proofpoint-GUID: yLRIaZokEYaFAvLMvYrBVA23oLVRzggb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OSBTYWx0ZWRfXzr8zrk395AYY
 Jb42560BlD/+uCoez2RnYcpmDFlDWN1L3Yn0gOAoNQFdrRq2dedvwEPxvsoGTTZFELqZJgN5yWx
 vyQDhoPxKTgiWRDzDapeGzvNJ+P+kBdmuGzR+Wt8/zUCJf0Notu1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=10 malwarescore=0
 priorityscore=1501 bulkscore=10 impostorscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290059



On 10/29/26 2:54 AM, Andrew Morton wrote:
> We don't want older kernels doing this either, so I suggest
> 
> Fixes: cf475ad28ac3 ("cgroups: add an owner to the mm_struct")
> Cc: <stable$vger.kernel.org>

Sounds good to me, thanks. Should I send a v2 with these tags or will
you add them when you apply it?

Mani
