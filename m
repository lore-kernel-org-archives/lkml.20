Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442832;
	b=JtGQiwP75Ka5V0ar1PzP9gIMAOMFemr7k3zRADS1Lpk2ZrvVz5fwcAfxbgWknJ7Wlcdz
	 qNGOwm78Unsremu7k0sw0qEhsCwuGkADpYmTR5k6fhPvi6hQ4Xp4vEMNUvDqKWvL1b8sI
	 EC1Bpzvfm0qKm1Jp5teeSQJUMaQl9EZ0zQlChfvsxtdSy2OGwlEWQsC0/Uk3eVukOMjNl
	 m2yfhfN0ymO60JAkCyWWrPCNPE4XSMQdShL26waq4cmNMb2zsKWotU7claQdo6poNJOxx
	 orw1cAyPEqv0wdO3ZfCAtSxjiO7G5C7vCvavRWqJ5LDq5M6NgqAuNTK6NJ1Gcap0LRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=;
	b=umc57sIZHY9LXow1rqayPxygykiDh4nNcGqYlFSXONndOYHt7yR2Gpyq+2oxDU84oNqR
	 QMvZnTd4IQCjkbnq8w20SrYCgmdN9yxyxD7AOvr3AynBJzZJbjivfj9njUo8RA1I6lfpG
	 SVNnHi5LaY/SCH4lnqUgQi8/xvn7a52loKqT5fo7cL1UVzOHIMdkWZ8IwRWQ26ybIwLnt
	 5lc1lupQbDt36lAXvPmBZnlynQNEFNUgBno227U7h/sXjs8LVrR2iGs7zxAkrRaJEHvvD
	 Y6xuABJ9wB9VMgSHrPBka9qc73lopoUKMja8qjuKSQmvIFAPoaQmlAAOpyORaiUnoIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c85oB9L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYfW8Uqb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B116A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c85oB9L/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYfW8Uqb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK6uD4106610
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=; b=c85oB9L/ttWD3DI3
	j5a1EP/lz73swN31wwZ/uAEcNqOxfohgnNNhIzuvLaNoy7yihUjx2XYAJa0NukA6
	mVGsolWsAJoPzUs0ChV5hz3WQYY08WmKzu8bYyj1zzOQVJxAuYW25vmi/U8das7N
	9diXIpQWC8e0ohwVC5gtziFLQJpFTpluPw7xjsUZklTNxzyIUAeZ7WNGRoL99b/m
	KIM/20GLwpKKYnTm63gavifZ9lN04kbVCV+XXtHUznXjTPGrtRzeN1GExPTwxZ9X
	qvnNO2W1Bb1DXc3s666eF5Ik21vURClCNhib6oxqdmJOwzVvMW681HdBaomykbqE
	RAJIeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr780jg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:47:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35d4538fd74so8577241eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792442829; x=1793047629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=;
        b=bYfW8UqbC9equPYOWSY5/FdvXXgdJWAtGjb4lkLXygvFGy1NtoO+nRPKbFVKYXOnwH
         lTNXyayE/E6a5iCSBbkyGQQWfKMNwAKnlFfdAtzU5yV7ztM+fpWXsPMvmOyQtomBthoc
         nKR+Ee0lDrfG2M/aBWcr5glmA1KZSxiVi2i10ELxVY0HbLvJk6Yo35bt4Qp4hzALtzdL
         b55ALeN0kyTtNW5JxkeSPNc0X8NS4ytq7VHFGDYWcbO5yU0HOq1mryHtq3Di3ZtjP8QJ
         4Ze22RGIJbtMm0+aNFRQ9PCv+OI1g1HdtNuYOdk7Y4KFYDMHzj4c9xgdviqwZd2DlZsK
         d2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442829; x=1793047629;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=;
        b=GIbpObxYeSukEXVQjaCn9n7i4w/1rcZc8m7e0RmFLUUsVs9C0RocaHxUhvwXJ8Z3sf
         aoBzMAwxWpbGhbH7DwB6q5HfSfa39daeelv6hMgjf/GgTF52/Tya9Z7EreyVti0Wk+RE
         z6+0xl9X9KG/+hA7CcfdWvOZNN8qOrZxeVh21Cvq8zqpXIATADw62c0g7eJ2w2cjH4S8
         b0PmE5pq8iH3HUX/1tEw43eoRoCCNiHqyEZ/WwbtzENmF+TY/0VTb+Nl6Rw7yDTvL2GM
         xwa/Jh2MblJQIh92T1xpu5kUjS/26QayknXjOydRywdNb30LyxyccyL6FcJrK/Xc+Slt
         kmhw==
X-Gm-Message-State: AFq9FYIoTAprPxE1fPl5Uo9OuG4eyTFGYH16Zk/HU3fKci/LvFRdYakN
	cA4uTFefkc0CNUWUejkIeOCFAoA/edWK3MGsvt6lRQT9mGdRFPanl3RZn7fxsYZJ+aBPeZjKOLf
	/AMbpqTM1vcG4K43lyHvYM2y5GBO5a/jamFU9nnl8AYfGW3QzG8aLM/6DKz5TjSugTS3xmQnySv
	8=
X-Gm-Gg: AYBFou1PdLWPC4sckFMaaWobfeQQUUFCxDM3xGDddc45IzaQUo6kJaX2XUT5anwaMvp
	ImJjyVyYrpxL0COE+dLPM4jD6gEmRMs9CKvr6Osn9U+jlAejvEJFc4AvGjZ4SLmHoy8gKtH+Z2+
	Ib5Rp3879a+Zx+gIoaK+AWPSGwI42FoALJDPc/OCYXqRvzauKnsXSly8KerBm/aylyyzx2IlvXb
	Z44rze+ubkOy9S16QLLP/cgWUCNAvrmk7MHxTq713JyNL/DgDeUtjFZHF6fv7jK//pUYRL7NeVD
	viwBdCRuQFoCSxFOksi7SoALsq9v4nYEuTXemNadqievpMIa1+AiK/Rfd7cd3mJhW03QrxIoYgw
	dFD5AVYMeR3f9n86NHVfGJ3jlz1cvpxlbfeBXoEl+rQ==
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr13915307eec.35.1792442829151;
        Mon, 19 Oct 2026 13:47:09 -0700 (PDT)
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr13915262eec.35.1792442828380;
        Mon, 19 Oct 2026 13:47:08 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm38362321eec.0.2026.10.19.13.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:47:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:46:57 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 03/32] firmware: arm_scmi: Refactor
 __scmi_event_handler_get_ops helper
Message-ID: <20261019134657.0000624a@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-4-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX5FIcTQIjymOC
 MlsTGQqh2/ad26JVZUYGcjqcV4+wxrq7cTaaL2kGhv1paoEi0DRf07cWZl7sa5O5CrHLNpXAqY0
 G7hv6MfKlnvUgQxWeKF6BurYELREH9sTjRQaXIqbv0BL5z9nNj2IASmtkPZ/8g0YX9HYrojbgzj
 jowqNo1UmKcbchRqq3H4hlavpAe4tZyH/5NzU+JeV/GV9hikO4bi7KR1zDSS/7GKws6HbKwmHwK
 JNAyRwcKqUiVTUxfbtoyeYdo1wyCpd3Q8MVqW1WztTf4Dm0OKFynbQJ4+mMcyZ47RFGIiFndqi/
 kqu9Po/n3ukhnsDPtwbIP8gNhRt0+1FMxDXz6CiJ5lw6J5YukgSeZL5AXdOMzTN4DzMXWhh2czW
 b0u8+ZLTcA7ncudJmyN4KN13NjkHyLrjvKtls+IGtXtfH83OCLOsxcBxN9pEDJ2CtOhl34/AQfa
 4QshyJMxp9F5IIZPbYQ==
X-Proofpoint-GUID: mMb1D9WTKAwawVJs-g8qnlqePK2n1Fg3
X-Authority-Analysis: v=2.4 cv=LKnz05W9 c=1 sm=1 tr=0 ts=6ad681ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0wFYMLthbzNeuU8dIDoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX3XqjMCnXAS5U
 CNkQumix5mmZX/TMu4wLY9Uw9o7+/+XoES7LVWOhxbZKnURIEGaLHY/ekcK4uGVjwkHZIGoa0b7
 wyBy7s2uSwBO7uRldkdNmaRw5sPcAwI=
X-Proofpoint-ORIG-GUID: mMb1D9WTKAwawVJs-g8qnlqePK2n1Fg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190082

On Fri, 16 Oct 2026 19:55:24 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Refactor the __scmi_event_handler_get_ops notification helper to simplify
> its logic and make use of guards for locking.
> 
> Mostly no functional change, in the sense that while the functionality
> remained the same, a richer set of errors is returned where before was
> always a -EINVAL.

Maybe mention why scmi_allocate_event_handler() is now wrapped in
an scmi_allocate_pending_event_handler()

I like the change but beyond logical division of activities it
isn't immediately obvious why that split exists.

One really minor thing inline that I don't care that much about.

Anyhow, both trivial so
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/notify.c | 73 +++++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index 7d1bb424a723..2bc2e03df639 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -890,7 +890,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
>  
>  /**
>   * scmi_allocate_event_handler()  - Allocate Event handler
> - * @ni: A reference to the notification instance to use
>   * @evt_key: 32bit key uniquely bind to the event identified by the tuple
>   *	     (proto_id, evt_id, src_id)
>   *
> @@ -903,8 +902,7 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
>   * Context: Assumes to be called with @pending_mtx already acquired.
>   * Return: the freshly allocated structure on Success
>   */
> -static struct scmi_event_handler *
> -scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
> +static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
>  {
>  	struct scmi_event_handler *hndl;
>  
> @@ -914,8 +912,20 @@ scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
>  	hndl->key = evt_key;
>  	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
>  	refcount_set(&hndl->users, 1);
> -	/* New handlers are created pending */
> -	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
> +
> +	return hndl;
> +}
> +
> +static struct scmi_event_handler *
> +scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni,
> +				    u32 evt_key)
> +{
> +	struct scmi_event_handler *hndl;
> +
> +	lockdep_assert_held(&ni->pending_mtx);
> +	hndl =  scmi_allocate_event_handler(evt_key);
> +	if (hndl)
> +		hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
Trivial but I'd keep to a strict errors out of line
	if (!hndl)
		return NULL

	hash_add(ni->...
	
	return hndl;

It burns a few lines be saves a few brain cells.

>  
>  	return hndl;
>  }

