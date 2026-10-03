Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1D3603E8
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001353; cv=none; b=RKQNuPJwU/YEI4pG4GSTtOuVQVJMeYlpTQ6MmQJjXIky+B45mcHG6Ds+4kJdr/yIdqO+LgTb5l2BcH8ggaS392mr52tKoIDMBRcRXRyL4zDefVtT8lqq8UoWHa2635rPHdopwFlcsuF3lOXvkU8Qyn+H/DFL2xfIY0pR4+boJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001353; c=relaxed/simple;
	bh=DD4FDKqDe5MLZbpoPD6Fuf26hrheV72HpMXR6Lc65pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzt89loWcywBbPsePae8ww/DBKFF6CiZO/EE1TzBtvGHLZZOeaUa223ETtmZ15UC5wL0l2ZdpF+rT97QIhnp4lKujGH+5bcNdvnZVbmK/SkvfGeepIxEe78fJ7EoIv26reRk9YYJdJbJzTw9P5gWhpC/PCb0N21wEfWetnU6YCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+4TwNA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+f3ugAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+4TwNA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+f3ugAK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6934Bb7L2856872
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 04:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GPPhG3McnxH7twP/0eHwBUr1
	k8vDDtjVagOk1VrRcHA=; b=m+4TwNA2GEIgrj8jjh8dcCFH/XtltGie2mlLI3ob
	uGTL0u4z7w6PehJZenTVf61k0Em0a4eYPjy1qcQNTE9Mt+oVEnU2Knxp+b35uidY
	W2bS67Mmdv6ZIe66W4ZU/z+iHOdVf9CXdomkbuBRuG+bvInlhR7lRHcXhK2PX45p
	xWSXAl7m61SUJOyDy5L8bPllGlZu2NuzsW5xD3nAviZWj67oyAHMwbLihnALHedz
	M//JTsYqYXTXTOtxiWFjHhr+r2KE/9z2xxmNWV3az/AVL1VRHN0cvtqAjrSfjXtn
	JYwZIDfHt3VeakJCQ8ZI/QS6+i2lEXBHvjL+sIZdToGKrQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tfd80fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:22:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so4097c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791001351; x=1791606151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPPhG3McnxH7twP/0eHwBUr1k8vDDtjVagOk1VrRcHA=;
        b=A+f3ugAKdtyR+Ch5uscneypO6Pg4fhiU2wrUyoUJ6RUuYo3XHV+Hqu2YB3r4RAbUUx
         7aEBLtxvBTVw0zcPjryL38ktiavM0IzYMy8svfzgUkTb9cv8gzJgj15IsnXNjjW+ahwR
         F69XE0/drw28f+IbgqGZxlFXpH/i7GcwAJGMHUrEdhX8qxVXaGWhCJUwQkcEsZSya6at
         fa6vkicL0/Eve4+rWqG+YIgpAk6BYgcSvUBzGf7CXEudTIBFAz7kG/rJaNCXwkeuCqJ9
         0wM3Q/er5rOU8gMibcD8dn6pI4Q7VwJ14M43VwS1RT+cFNfGmAl5xMhWVriR/xOUVy+h
         H/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791001351; x=1791606151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPPhG3McnxH7twP/0eHwBUr1k8vDDtjVagOk1VrRcHA=;
        b=OWzkuDmnTD/XeyGnNVEgCh72hs06YoWrppHREgitcVFzsCIK1huLJ0JTyPYaRRC9EW
         WT6cTj0RF2nV+SAWZRomf+/KivUF+QkZKKoLppIvr+r7NxXKvuWgiL+t/ULTw5RnnV3R
         0yn/F/6/UTOCk5E5DshqbmRh4M42PX5pYytCwJja6dy5N0OQtp2hN6/20+Rhe+dVdAug
         t44LWCMo3MiBB2an0hEksaSeVligxOvL3WfCrNx+kq9/0QdZlD9LO+x2G8pjAtNuE/IO
         9KvFoKrVk1HZWexS11EIhhaUeHfmSjmdZxEHXGQaQJE/CDpc/skj5qha3enbjEn/0z7I
         +CpA==
X-Forwarded-Encrypted: i=1; AKwUvBy7wqcwfS5Kd/n740YkjJCyJ+hTMqVSRDk5n7O4Q4uZInN/WR28CIADBQdF0p1/aNImCzgUOefAA6DwFYk=@vger.kernel.org
X-Gm-Message-State: AFuF++nPOf2dcTE4yGOuWwoSIUx5cbqrE6hpozsCP/3s5jaDtXjquRO0
	FgXHh/1dYve88jReJgevMs4+ABgZohmDzny2aWa910kpvosrwfu097uw8si60C9ByZ+edHnabAI
	wJfrurpqFTqqDWYnsPKESs6Qrh4vJwc0swHVlqm+MvQoXELGJv21Z+aY0Lk2bZqr0SeI=
X-Gm-Gg: AYBFou1T6LAeC4ajahNpEEEv9sJXTxAwDaoXGvMTe7P+i3gbsD7gv5yZ1Ci8QZkwoxT
	jcYIKP/8xnQLHc9f9jLM7DYRNrZ14O2C64mZmhCzFnE8vZf0Tg6mfQCkdzxJwhS8QTSIn3EFzVR
	df1fYrN/D693ZLe4J3Kch77EjXymlbt9OkEtFb2YdeiW5/8g5aGLiy/Sy+vaZk3ySjhhG8qUqsR
	D/dM2+VO86cngrg3txYkhETbFvo6/Spry7OvAWPGFN3XnrUj3QaA9bqCyWVcupxrnABpo74DiL0
	len3DYJjKSqRWgh3XcFhDZV5p3QBMkQsiiLmc1EK1fm9AE/STLVgG4WBnk+Y1Ruq7kcrOxMtQMV
	ZWyzA8F3d9f939n/tvU47DP1Qk/KKG8n7yR+7WXivfw==
X-Received: by 2002:a05:701b:280e:b0:14d:523b:ce86 with SMTP id a92af1059eb24-14f5bffb067mr251785c88.20.1791001350541;
        Fri, 02 Oct 2026 21:22:30 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:14d:523b:ce86 with SMTP id a92af1059eb24-14f5bffb067mr251748c88.20.1791001349894;
        Fri, 02 Oct 2026 21:22:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm2061919c88.1.2026.10.02.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:22:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 12:22:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] usb: typec: Add onsemi FUSB15201 support
Message-ID: <asCC_0bS8nkFMyB4@QCOM-aGQu4IUr3Y>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LroHWXdc c=1 sm=1 tr=0 ts=6ac08307 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1MyDP9Hqjn3o93XXZQA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Zi98DzxQMWheWdcqfEzZkyE-8ZNdFtg3
X-Proofpoint-ORIG-GUID: Zi98DzxQMWheWdcqfEzZkyE-8ZNdFtg3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxNyBTYWx0ZWRfX5LKUl0ndwZTq
 SkXeKf3//F5qYPcVv/vgVfOIjy+Ze65Tht+s1Vojc4kOfRrsRXxNzKkAGKsYoAKfPMyp+/1xq4D
 qXZzs4NSwncYQcMcrekC4epcFnEcSu4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxNyBTYWx0ZWRfXwpyeA+9GRAcz
 Cf+fdJ8OaGo7mV4c/CCf3UIyD62XIbcHq0xwNB3uhADFGwUiZUTYwc1YeeNhkOzLW+t5LEfq2U3
 XSX7V+OPxT8/knEB4jhAe/77TBv/9xK5qsWaH/CVoa1uk5JL1yNCCsHxk0G7GxC1F4RIDf49Iol
 MbSscM4sQFoQS7Pu0Tnte7+g05sYXtppem0a7LrFE7H7ICgobZPoX4M/4+hYHWvOU3dh3w63gV6
 zBvJW2FCwdmjbZUd/+otkzV1ghsDTDSuo6rSCBMEqmn2YO0naVEO/GfEDlZUXxpS/eG+aAF3Fq5
 7zNXFBlso0PK6TYpTB1WFy5kNZWl94tQShpevIMhNv3mveh/URSWvh9PR9jEcwHGxLBRQbDB+Ny
 8VnRnkF3UOsLxQVKMZFby0pPbYKPtxh2vqfAMMnSb37HbI6JBx/fmMxX+rbNp3wP0F+xk3mmfk1
 cN800aNMyeyr2XSWrsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030017

On Wed, Sep 16, 2026 at 09:59:16PM +0800, Shawn Guo wrote:
> The series adds a driver/binding for onsemi FUSB15201 which can be found
> on Qualcomm Nord reference design boards as a dual-port USB Type-C
> controller.
> 
> Changes for v3:
> - Address Heikki's review comments (Thanks Heikki!)
> - Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Drop include of <linux/mod_devicetable.h>
> - Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/
> 
> Shawn Guo (2):
>   dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
>   usb: typec: Add onsemi FUSB15201 driver

Hi Greg,

How does this look to you? Would you consider to queue it up for 7.4
merge window?

Shawn
