Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D9D51C337
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912987; cv=none; b=jn38ClerFOAOSrQ3eXvd3mufjeV/JkU0y2A2V9HtvBczdqhf6jSv90onfFPho9Q0jjHAXGzAFq/8y4DZpI4i71UY1GdBDwv5KkPovoRr/xZXSxIkpaviR9R4xXLYFhB5JRvhcnOlYzuy7e5qKJpyYw4d5uvaLZXrZsiJqWAOkYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912987; c=relaxed/simple;
	bh=Dj5dkMy90u8AZTnJJCjsiqTyzCoru/ESbIGWugvCt1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nICPjXtvyxxcMShn5dp+ZaGKdmn+jbqNofYiSS33ZfpVoPgdY1eRDbnrSonucQNRe6V7MsSINn2ZfNwW7ZqSVGtvn33DRDNloPZGsHqIW5i2xz7LyD2uC0z5CSTuMPTdbzTZsFQ1EL/nf/9p267ZMPYPexe1qPJseoS7SZur/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=oUFuMisZ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=GTsZg0Zu; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="oUFuMisZ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="GTsZg0Zu"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGYBfc3459722
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=u1Ri
	8mJXPdKAGRkcGKBITz/hwC09NlNj7vX3FNyHoII=; b=oUFuMisZgL5jb2g3IUFa
	xyWCEGGvD7O2Xynt63Y2Xve3B8CjRupGpPqJ/OWx/bWve9CFyedTl4/LhrCOTc7L
	8eeFRCEJ8Gobz0dDRYFI5rv58ztENPO+Pg8B1ytmDaoffc4cs99w91W7CdFOT8bw
	AuxcjDc7kRjZ53Za7v+nQVfrKigLhb9FOSnUYxeGyoAdVSWzSjTjlZfQQGtGv1de
	A6il+vgtOck/VHgnlAJG0nFI7oa49w60KExN6HRJQif+Ne8CA33NcLpaAiced6LJ
	uqykVOtRqWfKINcyAt8UPYllYgRyubdk3uQmsIzkrY8uD2RaRZgK4F6oTPSvOw0+
	+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h9pq11xjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:36:18 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535851217d9so71853991cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791912977; x=1792517777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1Ri8mJXPdKAGRkcGKBITz/hwC09NlNj7vX3FNyHoII=;
        b=GTsZg0ZuJP49GLhD0WqVDzBe1LGyTl53LmWhIoVEH2tcynO0ez1AQH4FI4koREdhCc
         59hnYZrrkwqJWMU4GdZcwoZx8z7rHrAp50nZ5R6DNJ0NWBJu7Ix3mRUFBxAWWldY89jm
         5ZY9BzHT97FMol7pSBlHYsyvryaIHDz/psb6sEUf6QOJMaH6Ri34vFVSjrSsfFbKvlsT
         OWIRQOUH+RkzioutihObFlTURWJwNZNa1Nqdt8D6m/hdSQyQ4MRTwQDLyWIfROFNPAHd
         Duw9MI7rhEgasmYP18wAOGmgWC0vlP4S+cgivlj5xP7P1FGaTTWmp3brvoD82z/vsEqv
         4zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912977; x=1792517777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1Ri8mJXPdKAGRkcGKBITz/hwC09NlNj7vX3FNyHoII=;
        b=G/eiSqUzWZM7PNPB57hauPVc8+JJuunrdOf69o2C12gfRfHjXiFMpoyutFKr3JGbcW
         pV4a1bgxsuOq1Rw3kjzupulvcUu939KDKZAja6hOiOQCyR3Z7mEwwbKdA5Ecz47qprva
         YMFSdSk2l4RbKz59RYFZj9oQ+HhezkBTPxMEIoQY7/OewSQtuoxcMDxTBZyN91GfuWG9
         MWiHvPlTpBiD3LXToG0smG74JldA1BRnVu4RYBa/5klwJr5W7kpwt2miV4mG+HoCG1Uq
         dtpmsMiWs9guNG+5onMIi/cXmN5wWl/kOBf8GcgWce3CoMo5b+7qm6wMRb3AHivSUCaE
         nh6g==
X-Forwarded-Encrypted: i=1; AKwUvBzlcbO3t9koGd5cRZML25Ao34P8VZ2VYF54CaRaL13UzfdmEIxB0YVe8k+SMS3F5amRsZLGYPBvogE2w6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ3wNeK8/Itr/vTFsBPDpeLJLV7iU7toVf5+UCBqDXfQNUSY+9
	8TLqznquipqAb5tTiiDCjYT1DYyOpnEjr6O4diSo0iU6bXz15+QFQ0SMHplA379K9WYGOi5H3vp
	iyqFRn6hRLgBbY8R4NzwKt/ZqvrT7TuBNEJcqI/yFnmyY5OszMM2S7MjsyT/1eA==
X-Gm-Gg: AYBFou3dmd7tACZa+2O3VzT2+UMvWh5kOZYCH/+zJmXf8g1Gfh6EugNrEKr9bbWDTaW
	r09M46q0cwXxSkTnafsYI+hHFE5aQUwApgA6TpcT9EHztrfTW+qyFR9Mw3/nuVvqF+9XjKQj0iG
	HwNDRAREzobnRbWTz9qFvlj56U7ynmDfRGNyhfv5N2Zr9UbLD+mjsPzZmcDVGAB3G3baz/ROfyD
	8GYP4vT764E3N4AwpuBAUt7Dc1+jMponL4dp8KN0saibbK6rnOaX1Px7kfC+5LgAptQDKb/8RTp
	lUiY8aOIV2wHy2WsLzwZuGcc9aSEGlr/3FgMDKdGrJ6X+rFwP0ffmjR+0+FjdVRUktuW0RttVSu
	odCIB0ucj2CKGPNCqiYJdWe/ME/T1ffahbqQDMyD5WO9DIw==
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr233112661cf.8.1791912977268;
        Tue, 13 Oct 2026 10:36:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr233112291cf.8.1791912976817;
        Tue, 13 Oct 2026 10:36:16 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b731a6csm107012341cf.11.2026.10.13.10.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 10:36:16 -0700 (PDT)
Message-ID: <fcbf90fd-6de0-4652-b4e0-8946f1581c6c@columbia.edu>
Date: Tue, 13 Oct 2026 13:36:15 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ext4: complete dropbehind writeback in task context
To: Christoph Hellwig <hch@lst.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>,
        Taotao Chen <chentaotao@didiglobal.com>,
        Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-ext4-dontcache-complete-in-task-v1-1-6ac801557041@columbia.edu>
 <20261013115926.GA2944@lst.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20261013115926.GA2944@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BuwIUoX5 c=1 sm=1 tr=0 ts=6ace6c12 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=zoHXe33pqz0Du4Moe64A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3MCBTYWx0ZWRfX0zk9uA3I6tz6
 h6CwxhG49NhBNKdoSXk5vDxhgdoOwhMWdm5ELH1ZrtZXLElyAdjedm0HNLuu5PdJqq04J1En2Gs
 TCEoBQdFdEsZOYmswBQ8SeB0ORQqvd2DjThV//LXL7hZlQcOqnY5
X-Proofpoint-ORIG-GUID: A_6yLHMZmz7-4VkE_WXdaQnse8bR5F-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3MCBTYWx0ZWRfX0MWBTUSdnin8
 XvyyTHSduAYuVc14YD0z8izXypPe2jV+9L/qVr+TYnz4jFFSsx7EANjDOQwJYZnkmm3psTsj7s4
 ZO3Tz1n5GCumuBG4u7K9sbPRyuG1HIzdD2chSwR/eEPhTwlcj4Q49TwwyaAKcXh9+1KfvYY2Htp
 7YTlrYX8zfSbpcmnodsrHIRC6UyQlohFvscrzdu5I9qWL57Zbi4XCn1CGW6yxHye1/EeUZPaDhl
 hv7MaONRd0+l7fjSMYkPgFEQfEWaVONdliKyYCrjADRo4GA8aWbqx/xslh7/SJyl1cFn8VG+LYK
 pflkeSST5wfFWWSH4af2ZVgDhql0I7zIIh1gGAWAupj0m/pi2I4EVXBytke5syTB/dvIhxsYkdT
 6EeneydtUCHAhLsJQ1vVGUuupCrtZHprLo3cPx+tzeaET05254DnN1foHJqVeTCssjzYjKu7SmZ
 0uZAmYNUi17t39O+phw==
X-Proofpoint-GUID: A_6yLHMZmz7-4VkE_WXdaQnse8bR5F-N
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=10 adultscore=0 malwarescore=0 bulkscore=10 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130070

On 10/13/26 7:59 AM, Christoph Hellwig wrote:
> I wonder if we can add a test to xfstests using say the mincore command
> in xfs_io to check if the pages actually get dropped after a trivial
> RWF_DONTCACHE write to verify this behavior?
> 

Looks doable, I can take a stab at that in the next week or so.
