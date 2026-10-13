Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E9052BE3C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913755; cv=none; b=NhYE+NwpJ+LO5FRD9g/TdIw5j2/BwYXyxmvQGiqELVRKoEguAWOHcV8QIKq1ZwTUJkGIpnRvuo3c2dQ8zE8eA7E+J6xyndVznBbhNV7CjZD47XK8JDWbbuTno+rSU4+fnnXPx1IrcMMIBofEemPiwJ6m0X6J4BSyHfvifKT1aRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913755; c=relaxed/simple;
	bh=gt4OYb/2uGd62Fa4qtJHnBmBlHwiNXQvphYRF9TM9W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnWDfRRvslDlDi6Su+dP0znrEbdZGgL0v4r0IQ2AI8cwyQ/W8X82DH+VhbpzaxWzvSz7sh2+squDCrKGdKnEUM+qIEnTzVeBr8uovkhgUFtN6SkYmxv3SAoKGXx/mDKDwFxTQ0fawCBdb6IwoMDf7kwwK7x7aMjauCWu5bzVNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sMEVj/0y; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=aUnr2pjD; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sMEVj/0y";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="aUnr2pjD"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGYvMg083631
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=9I62
	VOX7B6MmAu1N/fosfEWYVH1Z+oaZOt7rTDsf4HM=; b=sMEVj/0y0bdOmWtdhZxy
	zeFU5p6uIyFsJnV07j6YacyiVL+D48SI3KP64knD6S62NVfFLmR3+iHibcxSKSBW
	TMGfrzE9+G+GLnQH4t0Sq+MZKubJLArWfo2tlxkXygSR85VrWj37XtG5zfaMcXLp
	xSPlLJyzykHKbWL4yQL7Nn6OviTi9427DsBEjnovFNDdQZS2B8ySB0kb8ULy/M1y
	ROoUz5wMdpu9CdPdId7txCJL4/Y53SKGX8lkgA3SWw55ubLU2MuRLMXZwOyBantT
	PouXx6iqQfhaXplxHyqweLVhdrl16tNCFRc05Ar7mn1HcrlBajSsm0AI18st2WO5
	Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h9pm5jc6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:49:11 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso732343385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791913751; x=1792518551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9I62VOX7B6MmAu1N/fosfEWYVH1Z+oaZOt7rTDsf4HM=;
        b=aUnr2pjDrSYLHv3mGSrSJf77W3PwBhJJWtpd5Qt5VxGjVzvLZDKbcrog1SCkbWeXO7
         +DGsNffyZZ1So1wGSEW9hRtGEwIS5C3ELfOf5DdoUHFnCHILaiiIrHNsDy9vOvw7Tv4G
         g4qP5gvtw8j22BA5cVpZbJM1DCzWaQxkuYZvVwc9D4anWoSy779eC3aYpnsqD2azgKIV
         xy7u/VfP0s5hqpJAKet9GqZRwaQH8nfuonX1vwuzDO6JMczbMbxTGcEgdbd6oglHVv6J
         TbMhtUyZnfQ796PCWFJy+JvJUYqCXhcsF1MOmsXkMt45b2lFFzHJsdvVe5EOjvico+v/
         U2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913751; x=1792518551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I62VOX7B6MmAu1N/fosfEWYVH1Z+oaZOt7rTDsf4HM=;
        b=AQRtf6MpITkGgmlVJlteE/Yu/BIYE0mCmQuAoleMqQeaPxmPo726xwxGh8lLcAwLx0
         OeWHT/32JdNJkN3iIO6D4jWRlZ64QnH0XqqetgeCxWxy7bQWrdVIQZcm+mWaxLeF3IOH
         Fzh+aYmK6TkDS59zf//0gZoMiAYFnwwTNXBycee1xRdJPF9I5uKtmpLDraV0HusjQ6jq
         ClTi31dXYTBCT0F8bLojYr/Gw8gMbFe6D2ey3mLpfIonsq0gSyDyhHZ7GAFPeS4kB00t
         R72V1V6vs/Ag55tAN3aGNYVQtMaJxw3zt8QohwxB87kefvOi1Vf0tJRjxMVIIMasfpHL
         YR/g==
X-Forwarded-Encrypted: i=1; AKwUvByumUBqGqtXNC7mLf+0CDB+wxy5jDjReWtj+XCV7Nh8uqnhOashDis4E1JjvfxJJIHyTFxdT+jVH1eGxxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmRH9TEh7CWgYODvdVhsryOnExSYwxXMJC9Zj0iaCMK+MDk5lk
	wUhtfY72ElvS4Y+jbZlvjFp3VsXWqhEA6+s9DvtL47TN1lILgL/I9b6g63I/xWTTg/R1DUhFMtH
	F2v71lrdyKFXjUD+Pv0LbyFTfLegkJ7qC+vKWaa189ylHP0zFyhVuCj0UGnNtPQnN8X3Zsg==
X-Gm-Gg: AYBFou3QnxoSzLpZoArGZlAVm4Y0lTZfg/Z5RftUmJDzI9QMc2hBhPLBmInGZJIitKW
	wF/mcHfWip9KN4d1HnAUKr0WobUryWwmG8YqS/nPM6xOxv0ejoNR5lsV11lN0QYl4jHSZvKvoi5
	H+iYlKZ38fS5JwXKhz4XF/TAybqSE8RQ2xAFUzKiY37KxLYqG1NpIVrpi5SkdvUtZ0aFFSVt6zi
	/KRphyj6ju82Qm7LfyRvxP7XQ2kki7DM8oxeQm0AC0+/0gdjqQiU0nwZYvpGRhi9wKUBq8tNvrL
	2xZ8hLkFxk+SiIx7iu2Fple3JnJTyRppmNUgwTPiJnxBDLJ4wg371Y4YuDP2czLGdb6kHt3SGVM
	YL/5+NCQspmJZWRUqiVDn8xqtSyMTiugiGrxkK/nha8Dt5Q==
X-Received: by 2002:a05:620a:44c8:b0:939:1222:b9f1 with SMTP id af79cd13be357-93ebcd2b3d1mr2100869685a.0.1791913751095;
        Tue, 13 Oct 2026 10:49:11 -0700 (PDT)
X-Received: by 2002:a05:620a:44c8:b0:939:1222:b9f1 with SMTP id af79cd13be357-93ebcd2b3d1mr2100865585a.0.1791913750556;
        Tue, 13 Oct 2026 10:49:10 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f49861sm294878185a.4.2026.10.13.10.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 10:49:10 -0700 (PDT)
Message-ID: <5ff63ccc-3aba-4c4a-a289-48620f1ceffa@columbia.edu>
Date: Tue, 13 Oct 2026 13:49:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Joanne Koong <joannelkoong@gmail.com>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
 <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
 <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3MCBTYWx0ZWRfX6pBSoOhH5BBI
 96VVOeQOlxeHa1H343qAd/RP9g3YKxHHVIQVjCl2gVUDgiHJV+U3V/oaksO71dKzG7noBEsff8g
 wa/OUALdEWoX1Msl1D+3jIiTuEHxXgB73PE6pTLGI63Y7ygoNHx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3MCBTYWx0ZWRfX5iIRQuCTvRrn
 TTIXBLEoOiMcS+F7Ga1CipkYi82OwmwJkRQbWMxxSqmrHFvEdHXP8CaEeOXpiWDifaIrKk1Jo63
 MXxOG0XhhbH8uQrCUe0NqjXr2mCqqd+C4QcnYfM1EbDSTWL8Qy10DOaVGLt3WmvcdLEky6I6MdY
 6BOv2u+0jgn9wCcNwCE9+xhmoiLxVZHj6NMfUKzcN1fkPJ1Hutl8yb24x/f0EAXgtrMPJAVEMZ8
 gv9tla+edjuh7r/Q00KIf9EZqx6rQxuZ6ZLQ7ZH/PoebiBUrzu6B7apxIjF7rv/ltPL8b+q/apO
 fHgozd8kN4KIKgvsTTXN5+3LLfVJWWW6VYq5OpfJxqOPOZlmjFoJYlUoU5GbOa3Nt0TAMMllHb+
 P9giRjQf3n/KD9mvl9hvvKSrfwZ3Ripw9pPfAHxNDl95FlYa+a81CuQhFH1pt2vIGHOCoRQybtv
 N1f+NyVBf6amdRe+asg==
X-Authority-Analysis: v=2.4 cv=Dv/Da2/+ c=1 sm=1 tr=0 ts=6ace6f17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=YsdHqNpWnMdXCkS-BawA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kxoqX7SuKJjiezVPgqEtl3JfQBe0ZcYC
X-Proofpoint-GUID: kxoqX7SuKJjiezVPgqEtl3JfQBe0ZcYC
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=10
 spamscore=0 bulkscore=10 lowpriorityscore=10 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130070

On 10/13/26 1:38 PM, Bernd Schubert wrote:
> On 10/13/26 18:48, Tal Zussman wrote:
>> On 9/24/26 7:42 PM, Tal Zussman wrote:
>>> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
>>> removes the last caller of find_get_page_flags() and one of the last
>>> callers of find_lock_page().
>>>
>>> Based on fuse/for-next.
>>>
>> 
>> Hi,
>> 
>> Following up on this. It'd be great to get this in as it would allow us
>> to remove find_get_page_flags() and find_lock_page() next cycle.
> 
> 
> fuse has large folios enabled now - the patches need to handle that.
> Even if it would not be enabled yet, Joanne had spend quite some effort
> to enable large folios, any change that tried to rely on behavior would
> have just increased her burden...
> 
Hi Bernd,

As far as I can see, Joanne's patches enable large folios for regular files.
Here we operate on directories, which are initialized through fuse_init_dir()
and so do not use large folios. In any case, these patches switch to using
the relevant folio helpers, which would get us closer to using large folios
in the readdir cache if that's eventually desired.

Thanks,
Tal
