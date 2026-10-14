Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E39566C66
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000808; cv=none; b=DlBM/MUtwnrN4Ffux8mMvbgM6DChQQAuQaJVObB3c/8MnQaFNguUkKMUM2OiFONLsT64zZGOX4Pdq+9OOSMenma8FM4T2O/UpBgkYdS8d6ZJczp2wydOpgApwEZd/bHB1IgWaxEmPWHHp4hHr0GP7WWLXK6ebBKhDnYgINNGrkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000808; c=relaxed/simple;
	bh=SnnbpgzsDV974jbRJz0lX+Is3nTo81dEnnsUYCzxTLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f28rWrAFyT5wVulNO7omkSbBoqombwA12yLGykOAFIE4dX8LOqM6iM5T9adglfaj44pn0wi1lHvtnHrk3doyHeT9CqdEB0TEjcU5f77WAHxN9/o8xVPiEfgUNuXoSjdeFDkxRNBTWjkJCRsqUVnSTY3+oYMDRkp1STFVuh7rVGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=s7uGOUb3; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2zIAp1Vn; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="s7uGOUb3";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2zIAp1Vn"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHNqms2447159
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CEcN
	BxFn1YRqFoXuxQm8S+kMuXOXL2RaXN5t9JDLXWg=; b=s7uGOUb3yG4+027fLEGd
	cSD7h7i5r4uusPq29VaE1jgnezTq3aNve3p+UoUgYOc3/uIJgk8INUtvmjBFgkE7
	egO4tRrrGw4J3I7my4flAXCk7b5g5zSFo+sWdXKW86LHa3t2RZ9nUD/eF2Wmvjyt
	q6BU2N7HhYomrksKrFQK9zjLN9LYD/7lh5nDRbAR6DSwFBMQw6Z7GN3rSGSz5D1i
	e1bCE3UqVCHRGZTsywgfw+ZKYlybxwU6w7XroPgtQzdVme6smkLw7GJKMew7UHZL
	t+J28OUE9GMapKif40nSC/QfeSLxTAB+qtRkh5lrWXiuBiRGUdNLCFy4kOshKZdm
	QQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ha7n8uydn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:00:06 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337ed1ba44so95491021cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792000805; x=1792605605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEcNBxFn1YRqFoXuxQm8S+kMuXOXL2RaXN5t9JDLXWg=;
        b=2zIAp1VnahuXcjo2Vtl46ZbAZ0pr+DVtrISpewWfJPnbx/jiBvyGXwQBmpJtb791Ie
         tYp04qUtwQKzQ24HCn73upO4mJI0gKg15wlIeBEGsEIrVm+onzpFAZ1eGsxL7A7R1td8
         4iAfmvAGD2qa9Pv3ZOViFl1BVAHKSBnQnFvrEybaSjbtP9/2MO+UnQgqfZhPnk85D/Vc
         p7Ph7MMRrfBNcFcw8w3lKGRKaFYrt8NR+IDU0uqZaTKstj/MYOgtPrRR5VQlkrWR7cct
         tuhKdE6Q+JdwBcYeBlRKMT/ftljbgDmTa0kEZE5Qi94rR0x7Mto03ZjE0ZEroUfQXU4M
         jBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000805; x=1792605605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEcNBxFn1YRqFoXuxQm8S+kMuXOXL2RaXN5t9JDLXWg=;
        b=PCvqWa53hh4luwZQpml1e/kgsIZ4MWpXFHTkQ8v7fCnPVFXFPNphOYvcqJ7NdgiwPc
         AUgCjuYvMkf8Z2QzSiroGtoLWftm2ryzpQmafOvrDTbAP0JLEpC75xDgJ7D/REppBBGR
         eEeUgVePji72s3or1cH6mnCYgC5ohS1DtPL/PfXz93PTD4qngwNYBjEO5O/adoJX/leZ
         ptU+AGvFwatt2IacLXV6DNElikykcqfzYOATjzmzSlAvplPOZqFT17hfA6v4pscT999W
         YFIXneX65NgMK3i/gmnFKVlk+ddKj+ivhdjKeIpap7kDE9NxwV76Zn0FPUwXpDj6enYi
         +Kkg==
X-Forwarded-Encrypted: i=1; AKwUvBxrfnQTRYKdjkbTVmPI47gw+xGVpHEB7T6EQNn+PWaU85J1PbO6m9NfpNZu0jh4L4GXLw/8NYl7QQhPY5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCBZRsG9r017npu8Jflw2gLgGwC9/mQcfCnkIyn0TxZXFnTM6D
	P5T/3lhDdsFOzBDIS8HjYlt1J69m2cIYJpGVEvqFWPFNTUQcrNeg33dkMbBSDhB2tZ3q4K3o9pt
	1/cEAnTfp8mBbgJV163RSaZYdC5aQrGiEP0jElcgjPhM0cbyrIf2uQpWHjzshhA==
X-Gm-Gg: AYBFou3JPf8Vk9aVZhWQroSt+52BqYkhFOLH9Be5UIwTdKQKMGJuwDI8t9fSDPDD0oy
	Hh7cuPQXwKmR4FAIslzdCTs8iTgrqjOPaqDnINbpY0oTefhG52GFChf/gzRWtzzOJuoqdSPy2YT
	rpo5Lh9OONizEhzYE79wx2m3CibsZeQJoPKNNDssWuhHnkdOB6sBmQp4KkYtwC4mk/Z2iBwcklX
	yPd+x3mU9jark9pO/IvSpSjNdgFwiin19qJmr+EEeMMvzS1ojD0n/5+YrnelTV8pspnY+bslO+g
	f4zHva9mGxeJ+AYWvME/3GCMVOgMBofGNHMGJe71kKPoLBDkXHMihJ51RvLjrhFO3i8tp4XyfjZ
	E0sRd/p9dC2PJgx8dKUUrpH/NGXX3Sg8UG1EM4bsi4BKAfSOT
X-Received: by 2002:a05:622a:428b:b0:533:3911:f504 with SMTP id d75a77b69052e-5359fdf2526mr271506421cf.57.1792000805557;
        Wed, 14 Oct 2026 11:00:05 -0700 (PDT)
X-Received: by 2002:a05:622a:428b:b0:533:3911:f504 with SMTP id d75a77b69052e-5359fdf2526mr271505941cf.57.1792000804977;
        Wed, 14 Oct 2026 11:00:04 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-176-148.net.columbia.edu. [128.59.176.148])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53612830ec3sm2952541cf.27.2026.10.14.11.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:00:04 -0700 (PDT)
Message-ID: <7eee4fcf-1348-4d60-a1ec-cd3b76eb5904@columbia.edu>
Date: Wed, 14 Oct 2026 14:00:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/18] btrfs: remove the v1 space cache
To: dsterba@suse.cz
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
 <20261013122214.GA1310987@suse.cz>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261013122214.GA1310987@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _7Pu62RFi2Dr2V-H7QlZKfBXP-yki0uT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3MSBTYWx0ZWRfX8N2H5YIebA6s
 BemUrALSMicBFYT0aRUkP0Pxrr3Swwu4iBddG6nzab+vSul2t7XTu09z8/z7H6RFOLFlOz4QDUB
 g8q4RGBI4j8w0Xv0wmBOe0zAEPWZoG/JsE+aK2F9beuQnh6zYxtrtvGEBNuxodrGNnLdl1hbteQ
 /HRsauL2MdrtqYoGP9LggNY2g+awf39bJY/g+3xCXRLcgaqZgEU6+qjGSPGs7rPX1f6h4UKuclD
 bsaKhgbptL2kSGZDB3+gZq2lXNnvqR0yStwiCp2B7g2IAb64qi2cfqIkhls/V/zz/56wJOrlfT7
 OSgRXxzUViRbNqm5F6A5kODUTGU/+NCKHumJ5lOdvu//kSuCbPmm55sSQGfY11YoCZeTKnZj51Z
 5M64Vnx/4r7LA8bzrxF5k7dMMsUHhvnOigrTU6wdKJr0VGH7Gj/c2OUq+iBSRSkMFgWNRfbN2Ep
 5MT347+cWFRArsSkEFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3MSBTYWx0ZWRfX2cuTA0BVWkFD
 I9JfxwoMw+8OeiKOYWit9ar9usp0OG6T2/6mWN7gw2PX/51u+GvlTx9dlhfR4Ou6ZiIvOz5cjaG
 m8bY+nHUFeYLK0GpUuY795xSTxqmjYbxcNA65FuFR/JMxVE2VzhD
X-Proofpoint-ORIG-GUID: _7Pu62RFi2Dr2V-H7QlZKfBXP-yki0uT
X-Authority-Analysis: v=2.4 cv=G8iJgNk5 c=1 sm=1 tr=0 ts=6acfc326 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dxtdfZqDOO0kCslK4e47hQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=TKffICSxeowAhaLLEZsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=10 phishscore=0
 priorityscore=1501 impostorscore=10 suspectscore=0 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140071

On 10/13/26 8:22 AM, David Sterba wrote:
> 
> Thanks, unfortunatelly this did not make it into the 7.4 pull as the
> freeze was yesterday and I was not able to process the v3 last week.
> The v4 still has some issues reported by sashiko. It could be still
> possible to send that separately as 2nd pull to 7.4 because the code has
> been in linux-next, small fixups would be possible, and it's code
> removal.
> 

No problem. I took a look at the Sashiko feedback. It looks like a
rare pre-existing issue, with the fix being to change the `if (truncate)`
to `if (truncate && !ret)`. I can prepend a standalone fix for this at the
start of the series and respin.

Thanks,
Tal
