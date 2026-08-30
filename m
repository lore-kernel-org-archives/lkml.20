Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAD3B3C10
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093659; cv=none; b=MhQ6+0+tkIYA8juqMWDHCP1WwvXVAvXR609RF95D/A2o58wDz/c0BUMrulY3jhuwmrIzZ80cnDIiQKxYlJbDYNpv9+/LlQfEPbuQOx999/eg9ej623aCzhqgHVkjalUbVSKiJQtP8IzD5fABQmpPp5TFCgGNDN3wUQZzoxgwHsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093659; c=relaxed/simple;
	bh=YIBbjn0Oj037chJI497t317V4nDUV+xFP8kA84PSwIM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D0zLkmQKRcJLu1xH+Zw9nvhJK4NqVtzw33GT5M3HM0iHFrT7Gtk/+CA0r1ru+yYZiIGPoCjkZbpaqtskYnae33A3tKNyJ/VBQom+bsu0v26VpSkfSm5GWuVOssDpWRp51rz301TYATknO5tTbi4goewSLm+ixR+cWPWEtlNVV84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCBlZe9T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lii+CikY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCBlZe9T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lii+CikY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7R21345771
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ts/BHYg7HcI7k8S2f4TtgdcIWYXxaQ2+X+jtc8onAs0=; b=KCBlZe9T2g5h344X
	w+TDC1XznO941QF/NMgc9n1l3B0FTRkErCLZRqKY1IjsNfMQBE+zrVWCGKFC6RLU
	L6WOkDMIYk0gniJ/id6XRFGGuJNUX3mRbkugCeFVqQOBmQiUTKqJBTiWxNc1plAr
	w8KyEGR7lJMa+k7fv7cxZwbAnWAiBkVHlIAUkzNXksdgVO6HH5CMvZNNtrPaVZ1c
	xyxInYCd5tf1TMe+b0AKMVVIc09unG4fAZgxBT0odz/L83o7Vd5hSN3RFCcgowiB
	40Ucy15PkExHWMG5w9iUYUVbiKlWiRiOO6Ccr603JvPvzRJGpk6tHJrDw5ZLzUO2
	Jx1xZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwb08v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:40:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f9e903b02so38756921cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788093656; x=1788698456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ts/BHYg7HcI7k8S2f4TtgdcIWYXxaQ2+X+jtc8onAs0=;
        b=Lii+CikYuiF3+udUpWypPPoRyK/L4nTrbhGC/iQFHqzQcdDu7jFLBFtORG0sYlRBe2
         M0HFnx2YxCAM74EeexlBiKIJo3sPGzIFT2LCHKRTjz+MDEDsNo+L22I1vI2yqEp982E1
         0ZpD6DDas6wxHCtvZg+d4LIOr1OIKu+ro0Edoz8i6Cq7YLrMMgZ792V61Akv0n6DkRE9
         49Kq2uPaE2C9JtpRHSss58CEDWfgTygbjNMseUuwktExyNKWyaPeWPpoF2VOpROOBV6G
         CeKZESTL85FcJnvOpa/9hXBsoiMX96LjRhIFCFtNKZJ4pJv7cqZ+5bojR/DeEAybXNFv
         EQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788093656; x=1788698456;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ts/BHYg7HcI7k8S2f4TtgdcIWYXxaQ2+X+jtc8onAs0=;
        b=nUiVPAL8hehTggKizM7o2Z/yS9tjzH4UqOggy0odt+7U72VDMmcvKoN7OLX1vCdqRU
         g8VgJSiZ+rbOB1LvhIrXvJkxNCiI9oUcwex60Sgt8P/mhJSRN+io2LtDBjmO8EosLzLb
         czjhTQOsCkDnIKCaptmxDC3xBJvPZg+gcxQvIKJCachjhuYsJRub7RpBG7fNTwz+rD/H
         F6KdZA6gnGNo6PdJHQAdlvUdsNqD+tiv2zyXEYErYaod4fqSEEcMkqXXEJ8NNDzXGJ6B
         WHJ74SGfKOP5t9Na/PyMeZTvjAwMQ/vFIK41fVEpNzYJsIFSibZLB8hXFJhJsI47Mi26
         SBjw==
X-Forwarded-Encrypted: i=1; AHgh+RoUFUuq4FP/e8UsS3FdW3hiNLoQ7/3XH3OnJHocf8aQNocFc1T9k4aVN/B59+a/U6bdelz2icCGuAYMjh0=@vger.kernel.org
X-Gm-Message-State: AFuF++nTYb+chL8dJiJnrljLLRokjwuMzn6q7Jv2RvPaU9sHnZCh3Tmh
	9d52Qc1svLhDlBpQLSr5NRtU5lHxC0Zf9xKzf6up6OTdKSs5ynzWHE+c0gA5gI17JFYXJ4kNRU0
	QIgsCKtO674Wxq53cMdbmzye7wXw/f2VOpzFYLeDLUuzLxXvUMYCec/wqFZGy0cfdoMY=
X-Gm-Gg: AR+sD106aw/+TgzskPCPtsUNDR6bPQcpkTGbniiV8ASyFHIb+F/kgtQq4brbZDgJs9S
	r64mQ2JrZYhoCEFWa9zvne9iwAy0268AxHRxAsGTp7b+GTmn4fBQ2FTKLmIswcM0QUXZJc3snej
	RTMDF/3gMJNu5xah+n1TOQvaLjB2LNopHfw5jBUO1r98aN2dcC/DaFy6cVM24LAsaqwH6cTeGLL
	IN+/BQGkXJWMeVCLJVT2tF07wbSKyA4Skd+ocHFwB84iBkMpr7iFSqCtCeuuOjywlDiU5B996/f
	PuzyJXck56R72ARdUeiMKkRCzFAV7/6Mb6M9CzDi0MPjRi/DITrRS6wvXitOjLR6S/I6d7QcKn+
	9NA+oqwl+yaObTf7xhx2eG2BL/XfBKaJ8dmp6H2QdxP+43UX+ye/4uz6dVNEYRXgOSlphVwXvuR
	9qmo5npMDFOIX2obLaMQAW1hVOqdR8J/w8VyQuGTDsWQF+z3psTkpqM/ir6POX4XHE/sY=
X-Received: by 2002:ac8:7e8f:0:b0:52e:3820:a23c with SMTP id d75a77b69052e-5300b8691d0mr18081051cf.13.1788093655954;
        Sun, 30 Aug 2026 05:40:55 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52e:3820:a23c with SMTP id d75a77b69052e-5300b8691d0mr18080751cf.13.1788093655487;
        Sun, 30 Aug 2026 05:40:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c5b2sm2399347a12.5.2026.08.30.05.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 05:40:53 -0700 (PDT)
Message-ID: <096b57f0-90be-406d-bcbb-74d19dee91a5@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 14:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI
 remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
To: "D. Manresa" <dmanresa@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827232636.93145-1-dmanresa@gmail.com>
 <apGqPKMIk5kgqfMj@kekkonen.localdomain>
 <20260828205424.154443-1-dmanresa@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260828205424.154443-1-dmanresa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nvAst8voKmjcz7fLmPuW9sciAfVl5EFF
X-Proofpoint-ORIG-GUID: nvAst8voKmjcz7fLmPuW9sciAfVl5EFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEwNyBTYWx0ZWRfX20qkv2r2/U5R
 IeiMpldIyRoJUSUFvRSGo7fmRee0IxJNFsEBoocY03EtvoCX5rfvJIlSvB9f8X/qiofpM1ksNMV
 O2RfDouMW2BDpc4vIgeOrmAI0kkwNCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEwNyBTYWx0ZWRfX7rvJwtybzKvj
 FX+86zJuwKcYcKSgGYYTcA6dEIWpgMdoXoHfFWyc7OAHuZQJjHaLT7KZh3PZ1Npoj8KpFg2111X
 cd1IkyzKHukibLjIGhPAZJ70B+7lPwodbIcRx5n7B+QVhKQnb4kbTgJwd9jpfgIy3cKEIffCDbz
 j819BqqIq8Ux63PUNIstLyUMRLLzZqdVUAyTPx1h/412rvc+6+YtM0xilxZGIjwlnNrFcXQupEE
 NSWshyze6q0hGHDi9hSNiCIhfkqtApMgb2IQJxguw5Mwh3ysIxmJvcCKSgWiLJnRr0IKUyMsDw1
 +2cnXNsoJEjWBw7t825kLEm9SJBZFlQ0VpVu1cQn0Tdwdv2hKols6bN00EXmx+C6BesXNrzT5Hv
 7tnRTVSxObjERkZPKsbP39XP0Uratw+STfMWXbVZ+O3IEx90HesYvuh13fEOSV2jaluFSxFs1f1
 VnMg8FQQCAWw0BUUyWw==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a9424d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=z0a0rmqq3SQDDqeIxcsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300107

Hi,

On 28-Aug-26 22:54, D. Manresa wrote:
> Hi Sakari,
> 
> On Fri, Aug 28, 2026 at 06:33:16PM +0300, Sakari Ailus wrote:
>> The regulator string length has been increased to 6 since and I believe
>> with <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm> (on LMML) the
>> camera might work streaming-wise at least. There might be Bayer order
>> issues though, there was another patchset
>> (<20260729-sp7plus-ov-flips-v2-0-91884b81a8f5@berg.pm>) addressing those.
> 
> Thanks for the pointers -- good to know about the string length fix, and
> we are aware of Jakob's two series: we have adopted his POWER1 approach
> in our local tree and have offered him Tested-by on this hardware to
> help both series move.
> 
> This report is orthogonal to the sensor bring-up, though: all three
> sensors here are fully powered and streaming (the cameras work
> end-to-end, hardware ISP included). The issue is that ipu-bridge has no
> teardown -- after any unbind of the IPU PCI device its software nodes
> stay registered, so a rescan can never re-probe (-EEXIST), and once the
> module is gone the node properties dangle into freed module memory. It
> reproduces on any ipu-bridge machine regardless of sensor state.
> 
> Would a fix be welcome, and if so, which direction do you prefer:
> a real teardown on unbind (unregister the node groups, clear the
> secondary fwnodes, drop the deliberate struct leak), or making
> ipu_bridge_init() idempotent so a rebind reuses the already-registered
> nodes? Happy to write and test either on this hardware.

Not Sakari, but IIRC the goal has always been for the nodes to
stick around (be leaked) since other drivers may still reference
them when the module goes away and then a rebind should use
the already-registered nodes,

Which is why all of the swnodes are dynamically allocated and e.g.
strings a strdup-ed and things are never freed. If there are pointers
in the swnodes to things which go away on module unload then that is
a bug which should fixed.

Regards,

Hans



