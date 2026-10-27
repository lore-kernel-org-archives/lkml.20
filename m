Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079580;
	b=1THG6MJThqVeZyMa8SrvefeBnJET6bBTyE8MQfNz00uiwEuEqUX60XU/MMojmIQDidnp
	 qWf40XC5p6hBBLQZZ6gNyfqwo4vumQ+GZ96XQ0Evfmb7g6OJqPa8KC+okI2i5NqYaUUSo
	 lucjwS8BCwqWdF4uj2AAvDOpNP6hU4vMVRtPgY5u3uz1BiH5/HN+4JSkKdgvKBA4RfCFa
	 aQSozCirzvTVIgqiewyyL+6D84IXAuXRUNyHJm5fvXpuN1MuD06KyifEC3SRtfSaqw54Q
	 b6c5S52G/jmF4lXsiuhxSXdtgWDW/E3OLbtnagfRZr0EUP4koW3fuG9ZrvXzHU9mQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iIJdGWKhMzg94WxFYkaSChZ0Q2ESvRHXcSSilwjNWTY=;
	b=anIhfIbCMjpb2y9upvroFskMm25HuZx7qiHTYNC5kmExl0OuvELG9my46HjkbuvwV4l6
	 EADE/TiZzZS0MsR0hmjVm21EPfMgMveG0Zxr57Lm8yl1cGCnOUmzaXjfYOMr1RzlBJ+R8
	 f2AEFoNEIb3VShzM/xpZqp9zgAYJZWlqjc2PHKxyxN1nM/8iQgGw5vNgBBiWt82I6Kgv7
	 C6BNWOMGpbicAx8cxictDJfOLgyC7S8+QYpBaqu5jQhmvl1v8bIfVz6v9u4s/5eQUmqQK
	 srlYP6T2j6YxWAMj21O+8W/vQ1anbXTXz3O8EMos+Y/7j/qOrYfOeDXd4tKh8vbhzBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gvNMDXwl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFoC4BU9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gvNMDXwl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFoC4BU9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YoWL2336506
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIJdGWKhMzg94WxFYkaSChZ0
	Q2ESvRHXcSSilwjNWTY=; b=gvNMDXwlelP+132CMJKXIstnX2Z9sLcyo6gCiN3e
	MDGyYgFFK17/2o09242SVzOCxXoXmSgIHYXzOP4h4iM3PHSfwtU5gbUadudXibPq
	yGNhBNZpmL6d56SSuKMz0yXVGyB60oLnL2+4LfwoO38kvXinlq9P/QwhJaJtAp/b
	eGdw8CbDt3R3MjE7Wr+vWVpsbk5MCED30+VkkWmauVmQVFhAlRBEN2AhUpgxc/mW
	7aH5Bf8gitANxKE9W8fX8nY6IhG/LQ6kqXtuGH9M0QQlpP/iB6yLuV3VQ9e9ZyIx
	/rQabLBNfR++CLg0Fz0hgzJkeeY3u9J2rUL9r9hkv1w4uw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d9g96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:39:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso815657eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793079578; x=1793684378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIJdGWKhMzg94WxFYkaSChZ0Q2ESvRHXcSSilwjNWTY=;
        b=OFoC4BU9t3jRlO5XxNpqRQIhWlnji49NUgWZosFbjFYBqD8Gx3EuxAAmJMfZch9p07
         jQ8vfarJF7ZRSyJSaa7HMXH5TYxAS7waOipoMzsShnrqfcPzl31HA8smP3b0BnXqk2MZ
         p6WKL+ZDukLkiAmoQCL8vNKgmkbM3omOMc94aQmwgxoJ7q1BxMHxjJvYpUz8yo64eITg
         dxv6LLcytsY/v/MFR0jvM5XfMOpFIBGyyR/s8vgIECQynftymbyCbjToKaH2G9/rseac
         oMyABlf4F/uVj16+JXmbmbEePoRu8a5GZImJ/q0M13KXunOXbPQ5h2bXI0NsHtvIhB7m
         xrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079578; x=1793684378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIJdGWKhMzg94WxFYkaSChZ0Q2ESvRHXcSSilwjNWTY=;
        b=BFZ3nbVyvh0vGRxAj3YOuclNhtRYNl8HgRPdCUHbFODhWKKSPg9wT0ye9gwtDEhl8y
         ODOt239lNzFguqnFI3KFRHIO3R6aK+k2to+N+UzzRLE2EfypO+rmm85TInaYf/b/4mRw
         NFlng4a09YKzTO++D95rHV15bYb3a5X7wFS8qY+gHKthqQKKfAak2+yLUpIXhinjNSLW
         boHh5bp3xJRmw/TvtXS1GcXGDaDeEEKZhshdS7eg4LMqo+ct053V+nUP5D4jorv6MtH8
         8PtLpDUO/qGUHb1x4xzGXchc8E6TlRy+e+2SxIEEC6xaxHx7oTwYzihbM0YPwDS86f/G
         q8iQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ0pnZgZVWdwjP6+XR2wPvTgkbclEmuWkrmLdthWyOAPy9Dt5OSeZ3qWZyIkxnqInmkWoqeJXeiL7NZUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHvvSRPpt2IHssM2VvRGf+QdzIqw64leZvxrwsG2nt6fWj+Won
	sbHHvSStHOuOnMZZQWxPIbF8Spq8SDZitOPMZKVMFbvMEPYeqL2zFpXdGV9nWLhKFTndKZy9XN1
	jvWBFC7N5+bdlWSdKLVFAlayi1SZjsQ8Zqm+A8z9SPYMLp94xhSBXXr1Vl80HIZ6YqHPjzstEES
	DSoA==
X-Gm-Gg: AYBFou3U+DkzZLD0rlcDyODFWMAQlUQoqEQkWzCJZdzue7ZzL+wylkpaZfi1zwQCeCc
	aqItHaGw7OOC1F2SfZBbmp5NGN9Fx8kFFtfV4cs/nl3k5RDG9Pz3/FK/7aA4x5G71t7Rdb3jYt6
	VrldupF8/Myswad4n+2tsfxPJ0g+PUbODG85Q30MBWLqYMtcE+mQGe+BXA6i2nyZkikrRjzM9jn
	oKDU/cDjIJdg+MsyHnyNfsp1qWIwbpF2IOMPgkoyYFJeM57z9y8Zzc5wmkqw8n1UrvJ9oA80dNb
	zAjHSxN0f+3jNFpcpjBDrWWqIeJUonKxFyKF3PfllT6DNudiasrF+mM7V7vZy8UqfLInyfGwhI9
	auvRJzJSV3Iyc2B5k5kswgNfcgGQ2FkNi5CjpUaiPXb85UMKh
X-Received: by 2002:a05:7023:a8a:b0:14e:37c7:2b20 with SMTP id a92af1059eb24-1a3c5e708c3mr2542330c88.20.1793079577686;
        Mon, 26 Oct 2026 22:39:37 -0700 (PDT)
X-Received: by 2002:a05:7023:a8a:b0:14e:37c7:2b20 with SMTP id a92af1059eb24-1a3c5e708c3mr2542302c88.20.1793079577101;
        Mon, 26 Oct 2026 22:39:37 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm27366260c88.21.2026.10.26.22.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:39:36 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:39:34 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: joro@8bytes.org, will@kernel.org
Cc: robin.murphy@arm.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        fenglin.wu@oss.qualcomm.com
Subject: Re: [PATCH 1/1] iommu: Hold group references across bus_iommu_probe()
Message-ID: <auA5Fo-m35EMgmYj@hu-petche-lv.qualcomm.com>
References: <20260929070737.3798358-1-peter.chen@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929070737.3798358-1-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX0djyEJVDI3L+
 RGLlFQswGuLeMfImkkdwK2zunqRwOb9WoaftKC0ihfJ2BSglPu1gP3GtZtpftGckvtCJF89A+O8
 YK1iQkBXQ5rP+sTVN5fk9+TjkvTpML0=
X-Proofpoint-GUID: 5Jxu3y_IZzwYZZZnfcNZvxk1ZTv66Jsr
X-Proofpoint-ORIG-GUID: 5Jxu3y_IZzwYZZZnfcNZvxk1ZTv66Jsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXwUm+EN6j4DLG
 9Exl7ztL6jGGEjrBqQo/9obl8wGXwxSdQgHNRRHlK9LoA/BJBRdBFM7l3Vic3UR7ggYu4bXHDcn
 bNAFrtcGwyi6zviGbAkR6T6efOW5MqKC/iZAkAEjnQePtLv6hih/4T/HlUEtlUKiqGoh1DygIs4
 kM3yZIeMIOxZIg7eMoyBudGhIEXTT48Js6LPzqkwNYhjhW51OhjPhTUbxFBNFiZNooaPiQULXjS
 0hsJEvFWQFUL0uXAl1c5mr3FSl7BAYWgkkLeUlaCHet4qxhGLfGZvCNlmbJFwnDjNbH9CBZEfIf
 i3vadv1r8FhbT1MSk17oCGp99Rq+5VJYjWp28RuwgILKK4A2GoECpxncNP31YjSAKr3UrKRLeQo
 MuthhIrohrPGYDr49nnvFcb6ojBVRgkx+920BQE5iofKeSlUnVqMFtnLzkqxDln1HJ/cNrc9uuU
 YOi21w5nP0glIhuNvjA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0391a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UKnF6JsuxYHOT1UCHVIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270022

On 26-09-29 00:07:37, Peter Chen wrote:
> bus_iommu_probe() collects the groups that are linked through
> group->entry, but the list does not hold a reference on them. Only the
> member devices do. A device of such a group may be released while the
> bus walk is still in progress, for example by a BUS_NOTIFY_REMOVED_DEVICE
> for a platform device that is depopulated concurrently. If the last
> iommu_group_put() then frees the group while it is still linked on the
> list, the second loop of bus_iommu_probe() walks and unlinks freed
> memory.
> 
> This is the "iommu_bus_notifier() being triggered during
> bus_iommu_probe()" case that commit da33e87bd2bf ("iommu: Handle yet
> another race around registration") left open. The sequence is like
> below:
> - Process 'A' creates the platform device 'T'.
> - Process 'B' (eg, arm_smmu_device_probe) walks the iommu bus, and
>   allocates new group ID 'X' for this device 'T'.
> - Process 'A' deletes the platform device 'T', and frees its iommu group.
> - Process 'B' finishes walking the iommu bus, and tries to get the iommu
>   group from the list, but that iommu group has been freed.
> 
> The kernel dump is like below:
>   list_del corruption. next->prev should be ffffff8064a984e8,
>                        but was 0000000000000000. (next=ffffff8064a9a6e8)
>   kernel BUG at lib/list_debug.c:67!
>   Call trace:
>    __list_del_entry_valid_or_report+0x148/0x14c (P)
>    iommu_device_register+0x1d8/0x268
>    arm_smmu_device_probe+0x588/0x624 [arm_smmu]
>    platform_probe+0x74/0xb8
>    ...
>    deferred_probe_work_func+0xa4/0xf4
> 
> where next points at ->entry (offset 232) of a freed kmalloc-512 object,
> the released iommu_group of the depopulated device. That was seen
> on an Android 6.18-based kernel, but the code involved is unchanged in
> mainline.
> 
> Take a group reference when a group is added to the list, and drop it
> once bus_iommu_probe() is done with the group. With the group kept
> alive, a group that has lost all of its devices in the meantime can
> simply be skipped: there is nothing left to attach a default domain to.
> 
> Also drain the list on the error paths. Returning early used to leave
> the remaining groups linked to the dead on-stack list head, so
> list_empty(&group->entry) stays false for them and a later
> bus_iommu_probe() would never queue them for default domain setup again.
> 
> Fixes: 41df6dcc0a3f ("iommu: Keep a list of allocated groups in __iommu_probe_device()")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c | 41 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index b486b8bbd1fc..6965b89e76bb 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -682,10 +682,14 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
>  		/*
>  		 * With a group_list argument we defer the default_domain setup
>  		 * to the caller by providing a de-duplicated list of groups
> -		 * that need further setup.
> +		 * that need further setup. The list holds a reference on each
> +		 * group, as its devices may be released before the caller
> +		 * gets to it.
>  		 */
> -		if (list_empty(&group->entry))
> +		if (list_empty(&group->entry)) {
> +			iommu_group_ref_get(group);
>  			list_add_tail(&group->entry, group_list);
> +		}
>  	}
>  
>  	if (group->default_domain)
> @@ -1951,6 +1955,18 @@ static void iommu_group_do_probe_finalize(struct device *dev)
>  		ops->probe_finalize(dev);
>  }
>  
> +static void iommu_group_list_put(struct list_head *group_list)
> +{
> +	struct iommu_group *group, *next;
> +
> +	list_for_each_entry_safe(group, next, group_list, entry) {
> +		mutex_lock(&group->mutex);
> +		list_del_init(&group->entry);
> +		mutex_unlock(&group->mutex);
> +		iommu_group_put(group);
> +	}
> +}
> +
>  static int bus_iommu_probe(const struct bus_type *bus)
>  {
>  	struct iommu_group *group, *next;
> @@ -1959,7 +1975,7 @@ static int bus_iommu_probe(const struct bus_type *bus)
>  
>  	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
>  	if (ret)
> -		return ret;
> +		goto err_put_groups;
>  
>  	list_for_each_entry_safe(group, next, &group_list, entry) {
>  		struct group_device *gdev;
> @@ -1969,6 +1985,16 @@ static int bus_iommu_probe(const struct bus_type *bus)
>  		/* Remove item from the list */
>  		list_del_init(&group->entry);
>  
> +		/*
> +		 * The bus notifier may have released every device of the group
> +		 * since it was added to the list; there is nothing to set up.
> +		 */
> +		if (list_empty(&group->devices)) {
> +			mutex_unlock(&group->mutex);
> +			iommu_group_put(group);
> +			continue;
> +		}
> +
>  		/*
>  		 * We go to the trouble of deferred default domain creation so
>  		 * that the cross-group default domain type and the setup of the
> @@ -1977,7 +2003,8 @@ static int bus_iommu_probe(const struct bus_type *bus)
>  		ret = iommu_setup_default_domain(group, 0);
>  		if (ret) {
>  			mutex_unlock(&group->mutex);
> -			return ret;
> +			iommu_group_put(group);
> +			goto err_put_groups;
>  		}
>  		for_each_group_device(group, gdev)
>  			iommu_setup_dma_ops(gdev->dev, group->default_domain);
> @@ -1991,9 +2018,15 @@ static int bus_iommu_probe(const struct bus_type *bus)
>  		 */
>  		for_each_group_device(group, gdev)
>  			iommu_group_do_probe_finalize(gdev->dev);
> +
> +		iommu_group_put(group);
>  	}
>  
>  	return 0;
> +
> +err_put_groups:
> +	iommu_group_list_put(&group_list);
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.43.0
> 

A gentle ping.

-- 

Thanks,
Peter Chen
