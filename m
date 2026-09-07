Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AB38F64E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822933; cv=none; b=Yn8UaDym0wiPpPfXhQkHmifVbgDYXMYRnaBpFGhgkEmo3MYUPY8hNoXHAAnh/Hsomoxd2PtTNfdo/+JK+gexbAdq5AuiiM0pD8HUdfe2mYbT+uPuXpZmnK8sejBlxgrApUzZaKB3SELkZn7vY7oPvLyNVbHukWUj+Mu9IJ0tmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822933; c=relaxed/simple;
	bh=54FYdvIVoIC0Sy6F8zRr3jxj3oRCQFRwcuYEnCT1ZuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBXT5KUtTLg04saVw5OyNTzJKRo8k/8s5hk68X5fVxLzxRLRj/pRhxua6jnO1Oj2qnPGcKMskCT2mPt7yb3maObsvQsc/7jcL27VtNruORfTBKM4tW2A3sWh8DczZfdNIu1KYY+2DJeWC3UIQyy/krAcqw9iDFiMj+fNOTIH4fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sc2ISMqt; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ywbKUdM2; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sc2ISMqt";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ywbKUdM2"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687MXw4V3507993
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 19:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TpwD
	HH8ZM/W/wUFqtMovrUTp6DZrPbd2fdTAYntlazk=; b=sc2ISMqtFseQ/vmmdj0H
	idk+oXT+FVA5KtIjB2WOMMlR6xfb6MG91gRKcMAVXcRyGs86yIp83OvAuwF4kvrL
	S1pDpbyxsw4ly5Eqp/ZCDSWmZF7ULMDQPoneS2Ea1/DMLgzQD/DPK/hUI7Z/Ok1+
	uW2tCrrfUIuIsolmkHcYkm7lG1he0Sc/pQJbZ8ZqM/UP1EYJ2Mkwl/lwsPIxKlrf
	TzdF8diIqfZJq/5QthXDlOnkHGBp9BhLk6Kyopr0275m9VtVMBw944S6z8KVbnNV
	7xGVMNerOoc9E9yfDhHMMNSDvmPP7Ve6DXHnV/N/3+YQ5i+fFCkSn634VFGhVFLG
	XA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gj52xgem6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:15:30 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso98734911cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788822925; x=1789427725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpwDHH8ZM/W/wUFqtMovrUTp6DZrPbd2fdTAYntlazk=;
        b=ywbKUdM2FZcJCUdOMg1HrHmN/Sj1GSNoT+tZhXOxqBjl4VE/xruX9gGXSLTHvVsXOt
         ZAbhGhFte83yFr74j/ro8soyHoUC3eAcNsaasH+17mK3Nirsq08Betm7nhn2zBAXShOi
         f4wZIUbHgglRk9IiIj+R+ZTfuRE6euwFnLvf14ogNlhrZDWIW6TSdDXnJkBlJ5TCL8Uy
         vI0L4u4KCpPjrKO7+HE0/SlSifVoXRVYT8XSVYUeHqTKwXSgrImp84Rsc5juNI5Jg4eF
         yQoscQehJ+JPEDEqUunuuVrY4EFegQSQe+jmHohTrsSOsy/zOL6bl4QLp4VnBaOMcozZ
         9ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788822925; x=1789427725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpwDHH8ZM/W/wUFqtMovrUTp6DZrPbd2fdTAYntlazk=;
        b=kbA1EapvBEUSMxFFgrEbqE1Tv9yLj7eHysy7dVAHETJgVmGBvuXspk4BQZddGcRhtL
         bvQ3hDy/nxZ0LG6lB280axQ7AH+pgLjozf/HuZGrbTLInwRTOIB0koxRcElXcDFWC/NP
         OEfX2zk2jnyN1EBVIAqrsPOqGj80ijpqZXT26ZfnneA3IWb4AiKB+E42Iyhm4XMoS5P2
         NO8YrrZ2Km/tylnvszXUQVlA9Rf+GyadyPsnAaypMo9Vbvq3JzWfXhPyysjntf1Y+t6V
         qSaW9hZ7YI61C6lcCl79Hh51Pz1/m3x3Rm62yok0+Twv1na5AiEgW6ZiJw18+PzjxJoQ
         pxyg==
X-Forwarded-Encrypted: i=1; AKwUvByZxIi5HxmCoQ7W9SEA5YlO9xhm+7NVgqyCMTgyGgPo1jLsM3J1htrbhtEn7v6kEKAGEuQGqcEMVH5zUR4=@vger.kernel.org
X-Gm-Message-State: AFuF++kH7SlkQj60vTFfsX7/xaqMJ9cTBXFIhfAAQUH98OvED5zvexlQ
	dKAZq5CZsx5qUv7fKbRn7Gc4BwavKdCROjXlSX1nYjYbAWrw2+cUhYnJbN6IddS9qNpQ0CA/DsT
	JKz5hpZ38hk9paDklLPKq87N/+FpDHuR0IMfv4JTWm/TJLb6CBbbRrMBzxhqFQw==
X-Gm-Gg: AYBFou1g1MiwbDFLA7KvVNUHtEn6Gl7HUeF2fZwbDjN+LRPwMxx0vdy5XCQxjtY/oa2
	n9B01RaQph9jeFrk2h5uviClA3MEGF0Az3gxOlIoi2t1y2J2izytKyGhvbCNTn7n4BJZycBd3Oh
	U7AhJiqIEbJSffsYWCrJVR0f49JKiqN+aUCPKpl23o6KxuvlqX1ycZzJoMIMRXZbA+kfaZYsavj
	eL7IVzueGTreKc6cWF/1rp1JxaApdy2bmk84k4WZSxnvZRA5hzs9QGzZUfrzftNhHdxK5bfoyJJ
	qvTduwUfMBjVVNE1xAFB9rTZTkD5OLMgPmD15kyGEvEm/DKpnO9mqVDtAXlVD0lofBfb3bY/9Ml
	0QsBSfHQARhzm/VsU+TCInxN4mVaoKNmQdaOpMWTpKOi156s=
X-Received: by 2002:a05:622a:244f:b0:530:35bb:bafc with SMTP id d75a77b69052e-53054961542mr281314871cf.28.1788822924883;
        Mon, 07 Sep 2026 16:15:24 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:530:35bb:bafc with SMTP id d75a77b69052e-53054961542mr281314101cf.28.1788822924471;
        Mon, 07 Sep 2026 16:15:24 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541ba2d2sm100456331cf.22.2026.09.07.16.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 16:15:23 -0700 (PDT)
Message-ID: <ebd92c0c-23bb-4ffd-a55b-349210e61da6@columbia.edu>
Date: Mon, 7 Sep 2026 19:15:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] block: take i_rwsem for the direct I/O write
 fallback
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
 <20260828-blkdev-fixes-v2-2-32f3f40cebed@columbia.edu>
 <20260907070851.GA934@lst.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260907070851.GA934@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MLRQXsZl c=1 sm=1 tr=0 ts=6a9f4592 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=NEAV23lmAAAA:8 a=14txEF8SjVWJ8V080YcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI1NiBTYWx0ZWRfXyOG9sOXXyVMl
 Jjjgx+qLzb4TXLAfwjIY4QodRGwiOuiHI49lQlOvXzuf5MSCBbLuW0IqKRMN4hsOcJ56xI+C3WF
 ot5hcNHgii1PQxBJfwlY6G+Yj454NKrqZ79v5vvGrHT3AUWIE+Q5
X-Proofpoint-GUID: StP1eooxXJpnp9tAcbMA7nb3OW1fXGom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI1NiBTYWx0ZWRfXyWgDOYFehNMY
 jFao1kWPl+qpUdoCLpViAKCUJ/Rd1Uosqf9b1GCYvU5Yqx6UwGIJrk997i1r7eP9aNp5m2rxKqu
 17N5VE5g2fOhA3sscqkCuUWo7qXJvzkSDLvC3gvDYxJdvtprZHAYif8kLRJTfzIjjwnmL6ZJcKL
 ES+S4YKU0oAyOwX1y2nhmNSwjJEOSE+n0w7dCBFABAlDZ+AQDrIHN3KWvPvISbPJeN3O8RnBaBL
 mzWxT9IZavRdoGv33jlECCLAlUkEDsTifFIdSBD0FlLT4l9FUUbk1B1CKGC/YWJSt/BhKiIfwgn
 Dc4jENtyKK8DMtxITJAzMWlt/wfLOpVdzgQt/9T6AP6GwsUIEe25ze6qh8Ha+GGEBJYIaVSiF7w
 Ma8YT9Uvnl6DnqdMLqpOKPY/QPhWW47au2iU2KJfa5nyxuaftlfRfzizCFtHVBAivfSKlgq82OC
 h6devsC9KvTbNwpt3fw==
X-Proofpoint-ORIG-GUID: StP1eooxXJpnp9tAcbMA7nb3OW1fXGom
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 impostorscore=10 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070256

On 9/7/26 10:08 AM, Christoph Hellwig wrote:
> On Fri, Aug 28, 2026 at 09:49:51AM -0400, Tal Zussman wrote:
>> The reproducer used was written by an LLM, and is available at [1].
>> 
>> [1] https://gist.github.com/tzussman/69d06bc57d42a42989eb038b1b5aeb74
> 
> Can your submit this to blktests?
> 

Will do for both this and 3/7.

> The fix looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Thanks!
