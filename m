Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372422D5C7A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839788; cv=none; b=RVG1fLu9jiYFxSEzqTLYMdky4SQUUjigP+toQMjPcgGQfZBDofgSUtmYXshZ7aVxqCQFGe8ceKbysUanM+ZcVa9cR55sE2aVlWm178rZleTcYJQ/SAanMI93uRKlSdaKTDJP+rgc7gZuGrnBHapgVGcpMb5IW5jZ7kD/m9ZFaq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839788; c=relaxed/simple;
	bh=TOJCX5txHscGUt/xdLHicyU6pWt5xGwGejxAzRv5Fcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erqRhBUqxAg7vv2GMUwsaAPnuQjqybEH60SR2aeFzUZ1o9Nn0AWxh/eTrBoJG+fyOWB1IcyI6z5o8d0N/0Riw3DOuoNcYGo0bboY/Ewxi/uaToEEG+q8cV9XMQr6IREJeAs/4vT+SHBqoa781R4TOoV8DgMqTtL92qKWc6+Oj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=S3cd/pSB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="S3cd/pSB"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJiWnb1149521;
	Mon, 12 Oct 2026 21:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uOeRbY
	5zd/YMwkNv8/66VsyHhlD9kyU9Q3Cur7XCeV4=; b=S3cd/pSB5SFi9qQcfyqkfz
	w1DJl3CKIUOb8zriuiIZ+fXSB43G1xKBQL9Kx7JEsEGVSQbQGvYDIpbTrEob4KeL
	ov4B/RBd1pc7TyABPCtJkVrsaQasZl7CtwezYMB19GOinidRxsO3og3yvJCvwd5B
	Zfmidd82CoVbBWpnVooSZhjbABPJUYVYfUEOeqolTM+aQ2xQWMPfK8XT/WjGMLr5
	p6pEx4CntrNZGBy157Buy4B9MszsShr38imY+PSnkR3Gux1TxcqRM6wL/mr9q5LX
	ZiwjOh6zAXbu7qrylrJ31n0fxpBg5en0yMFDf8i0xPgCrerwokpRisamnhyROz7A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7e1w2gqb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 21:10:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJONOC1811998;
	Mon, 12 Oct 2026 21:10:36 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h7yppq2pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 21:10:36 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69CLAZhM64291212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 21:10:35 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE4BA58057;
	Mon, 12 Oct 2026 21:10:34 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF9F158058;
	Mon, 12 Oct 2026 21:10:33 +0000 (GMT)
Received: from [9.67.101.21] (unknown [9.67.101.21])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Oct 2026 21:10:33 +0000 (GMT)
Message-ID: <85244b39-017b-4978-8a4e-ff8e8dc89ffb@linux.ibm.com>
Date: Mon, 12 Oct 2026 14:10:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 2/3] powerpc/pseries: switch to dynamic ibmebus
 root device
To: Johan Hovold <johan@kernel.org>, Geoff Levand <geoff@infradead.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy
 <chleroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260812142016.55136-1-johan@kernel.org>
 <20260812142016.55136-3-johan@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <20260812142016.55136-3-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4MiBTYWx0ZWRfX4jm1s17p7m4a
 8AXeQna4bddFo0wjBacUmoesRy5dysvN/oiivDaDFihLP/mweu8+zXvRfJ4mxJOn6VJlJGRXHe3
 SCesNQCq5McNGOiz8W0PQaEymDJfPsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4MiBTYWx0ZWRfX8qTZ+EyLKK90
 Cz+q67knmRZc4PyrZr0fjluLr2i7wwqPpNbUlG4x/2DfAkHHCSpOoy0aArBplY/U7ZrzVG9UeGh
 Q0zfQn3quUJj65xf/+/gbYJvpNxenVVYWGLqqPCWXKY0q2D45CYTNJP3dKeKTleW5d0SH4Qe97Y
 2PMIiGbTfHadGpKqOGFMzdu1AK979/1KDZSYuc/FhxpMwQrXyVvPA/TQ4JkXnjJi75Obkd9VIgV
 NWW7SgHhzgbYQxeqG2w6UWj0EZRRVm/RGOYuY81FAzjpBq9hTPnu5kLmncb7yGxF4y11oNwmPyD
 HMMrTxtvPlYaIY0fJSxToY1045pURPb6FOBpHUKOjgY+ps5kPqBFP3hDFRFI6SjLRob3KbKEoAF
 yujFb6o8xIwDI+1dosmqm6DWjDcGK5OIlMgsH5QLaRkC+lfOl45pTfzAQsww7hdudnovtG/ZCaX
 7/hwERXSLqwlwsFb6hw==
X-Authority-Analysis: v=2.4 cv=E6pYNqdl c=1 sm=1 tr=0 ts=6acd4ccd cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=KVws_vwQB_PUgFkgaC8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9FlBh5Fau2QIPUMtfXf7FTs3ruR3S-ld
X-Proofpoint-GUID: 692mHVGhtEQmnnpE3l61Ukqs4nvewVUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120082

On 8/12/26 7:20 AM, Johan Hovold wrote:
> Driver core expects devices to be dynamically allocated and will, for
> example, complain loudly if a device that lacks a release function is
> ever freed.
> 
> Use root_device_register() to allocate and register the root device
> instead of open coding using a static device.
> 
> Also add the missing sanity check when registering ibmebus devices to
> avoid use-after-free if the bus failed to register (which would
> previously have triggered a bunch of use-after-free warnings).
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   arch/powerpc/platforms/pseries/ibmebus.c | 39 ++++++++++++++----------
>   1 file changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
> index 2d0f991da2c8..48076fe6ab30 100644
> --- a/arch/powerpc/platforms/pseries/ibmebus.c
> +++ b/arch/powerpc/platforms/pseries/ibmebus.c
> @@ -52,9 +52,7 @@
>   #include <asm/ibmebus.h>
>   #include <asm/machdep.h>
>   
> -static struct device ibmebus_bus_device = { /* fake "parent" device */
> -	.init_name = "ibmebus",
> -};
> +static struct device *ibmebus_bus_device;	/* fake "parent" device */
>   
>   const struct bus_type ibmebus_bus_type;
>   
> @@ -172,7 +170,10 @@ static int ibmebus_create_device(struct device_node *dn)
>   	struct platform_device *dev;
>   	int ret;
>   
> -	dev = of_device_alloc(dn, NULL, &ibmebus_bus_device);
> +	if (!ibmebus_bus_device)
> +		return -ENOENT;
> +
> +	dev = of_device_alloc(dn, NULL, ibmebus_bus_device);
>   	if (!dev)
>   		return -ENOMEM;
>   
> @@ -448,6 +449,7 @@ EXPORT_SYMBOL(ibmebus_bus_type);
>   
>   static int __init ibmebus_bus_init(void)
>   {
> +	struct device *root;
>   	int err;
>   
>   	printk(KERN_INFO "IBM eBus Device Driver\n");
> @@ -459,23 +461,28 @@ static int __init ibmebus_bus_init(void)
>   		return err;
>   	}
>   
> -	err = device_register(&ibmebus_bus_device);
> -	if (err) {
> -		printk(KERN_WARNING "%s: device_register returned %i\n",
> +	root = root_device_register("ibmebus");
> +	if (IS_ERR(root)) {
> +		err = PTR_ERR(root);
> +		printk(KERN_WARNING "%s: root_device_register returned %i\n",
>   		       __func__, err);
> -		put_device(&ibmebus_bus_device);
> -		bus_unregister(&ibmebus_bus_type);
> -
> -		return err;
> +		goto err_deregister_bus;
>   	}
>   
> +	ibmebus_bus_device = root;
> +
>   	err = ibmebus_create_devices(ibmebus_matches);
> -	if (err) {
> -		device_unregister(&ibmebus_bus_device);
> -		bus_unregister(&ibmebus_bus_type);
> -		return err;
> -	}
> +	if (err)
> +		goto err_deregister_root;
>   
>   	return 0;
> +
> +err_deregister_root:
> +	ibmebus_bus_device = NULL;
> +	root_device_unregister(root);
> +err_deregister_bus:
> +	bus_unregister(&ibmebus_bus_type);
> +
> +	return err;
>   }
>   machine_postcore_initcall(pseries, ibmebus_bus_init);

I went through the init error paths and they look right: the global is
only set once the root device exists and is cleared before the root is
unregistered, so the new NULL check in ibmebus_create_device() stays
valid after a failed init.

Reviewed-by: Mingming Cao <mmc@linux.ibm.com>
