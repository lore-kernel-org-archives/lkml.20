Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4817A3B19AA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288444; cv=none; b=aGeSIQ1vXPVIvEz5bWhm2i+ahtRGXuk4kMlcYvywHkOYvwhSm6oXh7ifXqv8vyrzV5/QPvEsCffVYpqizmd8+QjEetmThNIHcrRI/7MoDD6PBO3jikzFoeimXnhbTyp3tONdU8/FrCsStl5lP3pQDcWOvd9m5cSb/zQ7mxECg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288444; c=relaxed/simple;
	bh=yPDFtSzOArCINVVZkEx+dztNh/aGMUPCr8wwfmMt9Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsVyeS2O3+JmW8ofneNsp1F2kGtwf2PRKbXchlqHC49zE0tM0qSbkQHBry9KViTeaPaA5Plg8ZAu6zn3AkMX5+bGoM/wazz4MVSB53eQTF3tXbgiCAVrndw9fKm+xFaO1q+b03o2vFBTnpB5/ve0+hFyMcwkWhj3zg9ns8+hAmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrdbwMeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnbRnz1z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrdbwMeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnbRnz1z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIe39G2866857
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=; b=HrdbwMeIqm0nSjmN
	zCT4rY+9fjyOwZnb86hfmPeEx0yFmklUtVf2lzQL3djhfocyVLQPPLI4CTBUDgdv
	A+VIqqMUH5lo5eRQhxff+UQFhsGBr8lWbb3+8x+JRR++mjoBxqBZMyBeimadoZ+1
	9omb1qw4EQGcMJeHkkaO/jfpEHS5LPuw2yEw9TEPzsXbEvmjFf0tCHrTHXxJK09s
	EooV/JiZdiyFnqdFfbQLyTwyJw+RWyzmgHrG7IpO/MWKN07vrUGdxSUPwKrZVq8d
	tbbsm+RlLcKJf7XVMApEI+82DzfaCCejMFFBCBQ4xmvI9QGWQr3BFno4sqODbhPk
	URo0hA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8sve4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:20:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3284bbaa89dso932847eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790288425; x=1790893225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=;
        b=FnbRnz1zJJqx/LNEGaPno3JPrzK8JNpzLR8DVkRg9m9FShV9bfm86oUSQWysA5JyTS
         JQaPvF0zn4OWBjwC3+Il0JoQN95IMNcvzyw2F1qTYIfqJNRD702JuE1ymS12QmSZiYCr
         yhNbQTtAPZtZZ4KhuPWmpDsV6Qz4PwwUGH2zIuEkOCDFTHNpmdgb0oAx9J0mj5uK1S4a
         glKZD0JzrrTCNeqTWS9WUV1bx6quJj1HwDlpsxmYCjSD/yeHqeguy7BS/uyMM6nJA2BZ
         iIhOOzHmqtICXt05anhb9BzKVOjlcAlgbiHG0ecXhD7S+lNNlcdabvRfobLNUjzKnXJO
         9DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288425; x=1790893225;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=;
        b=VyIalD7yjTvHf/irFDVO3DCUlskxnj2N1zYgZKLExJFfxwMs+3K1yTgVzo9CTVpDI/
         M3+f0/5oY9VPqM7wFgCt2WBhDnkiA3V/Ya8tkKRzllcVXqerA+kYnwYQwQBEGBGyfR53
         ZfTGKNvAzbNYroxlrTCgaLZAWCSuq46n8G73HPURTq4PGEVzTbUcoRWJL8dpXYCospZK
         Joh3dh+7q4V87zEIAZN+v+SwsEX66sbmi1Lgl/sMi+AaZFNrbgGz0PIF3+cda5lGs3Qx
         yDo5UHWNntZ8Ekp8lKGaaE3c8aw3kbslaanKJDZbx9csoudhDkLM9LYBHAnTf5q5sT/3
         esZw==
X-Forwarded-Encrypted: i=1; AKwUvBzemRDtUV9jbHYpALWZsZpO1YOY7kBCEwdnY7MCMtdWM4lTeXfjcPuyM2IC5zTz1whWBM58N+zdXcVmR9g=@vger.kernel.org
X-Gm-Message-State: AFuF++m/ScmoPX0t9AW5rf7StYviJXvMrMWStkKfxvqOp0P2nauzRM4E
	59V22eiXG+05hz4P0lmL5xm7it5YciAAO0Bgw+8h3ZLc1co90UdM1Klx8uvri1agleDnFyX+AxN
	SLtK6ZsZHkZTh+73AMdWjXzeDFsmgOyWROvG4yX0Dd2OGrqMmrEoAm9e/m0z9PMrf9zI=
X-Gm-Gg: AYBFou3M7LUsafJAWAN33uG+qejgA09KMunhpYJjTW7TOn5ldPC5pxvYpYhexdnT6tC
	TjL6y1aQrY5ZO+DdhfcmlrQ4Di35/5Eowo+TzviDVRfo/wV7OLgG8GgQ0I4IJHhg0GAtXDwf9Nq
	cJoGw6jgaOMAlbz4lDoIgnuLnPbvG5gZU0vlVqgymg+RvEJ3UUZNIzVvgChQErm9HEnwPTLCpto
	KX86DwA3MupsAsiklume0+sdVmwX1ynJD8ZEoJbh9Fvsw3v0JEBAuuZcqvibQRYQ4MIzQ3zMwzt
	cXDTj/CD6phrZssFsGPE7cfZuif8LCl0h0J4sGa1gfpRt8T+loFczToGzvjYfIg47UUTqUAAifL
	bbaSu3WonWNRaK1zWY5NZXe/fmJ9d4ZBQNHG8fXj+GurM11jFlFuHmg==
X-Received: by 2002:a05:7300:cf90:b0:339:7b3b:236d with SMTP id 5a478bee46e88-34001f081bcmr3059389eec.15.1790288425257;
        Thu, 24 Sep 2026 15:20:25 -0700 (PDT)
X-Received: by 2002:a05:7300:cf90:b0:339:7b3b:236d with SMTP id 5a478bee46e88-34001f081bcmr3059364eec.15.1790288424751;
        Thu, 24 Sep 2026 15:20:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm1343887eec.28.2026.09.24.15.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:20:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:20:17 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>,
        Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 08/13] arm_mpam: propagate MSC access errors for
 interrupt control
Message-ID: <20260924152017.00004ec8@oss.qualcomm.com>
In-Reply-To: <20260924152739.2865510-9-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
	<20260924152739.2865510-9-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfXyhVDuN5fNtIQ
 gC6SfmG8yFRMHexxF31iZgq4OK0yETF6KF7SLmKMmY/Vu0fCznk0O0H8FXlSK28I4QLbZatp1Hu
 0u9stYRpR0RinoRrFukNT3OUNV+UwMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfX8DNN7YFRtFxd
 VClV1/ZJ32v1j38i8SC2WVKOW5CZxz9pg1TpBExY+S+RvtBceotxylMvLamh/qGepvx+boQxwmv
 JruJoOj5vd6thw/TJ5gjbWlziErkizG/4XlH5XHpbHMXsU88+zWuA9EuDnyXmtNMcDclMCMx9zH
 1S5z+xmpDpzAZjZJcJigByn2zrjBm2JFgqBCxkqakMrrHChAuQjj+Iph+DMGpNftsRUJD6i+93/
 95O6j8m2pwxI3UapOCGiiFUdyGOlPd252wxHC+vWPa/6WJRlorNmhBpFAeUCcp3ED82R6lWUcKc
 pS+4QosUkmbMUGtLrzXlCnIlouE9wRgBzVD5pYXIITfTCctKK1rjfaYCHDVodeHeugJIQNF9lbr
 JLlxjdjbt/yuQQeSDNKDE1e/cI/yd1Udz3ReuqOkpPytiJnRjdlwP2+MuwOOzix9J896lAEVQ7t
 Fl8pASKVl4GgJjHudOg==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab5a22a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=BicPeEsDMmYJQF04euIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Ad5IShY3PIrhqCkedzlc0aPp4rovX3sl
X-Proofpoint-ORIG-GUID: Ad5IShY3PIrhqCkedzlc0aPp4rovX3sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240091

On Thu, 24 Sep 2026 17:27:34 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the functions dealing with interrupt registration and enablement
> to check for and return errors, and propagate MSC read and write errors
> from the lower level up.
> This does not cover the IRQ handler yet, as this needs some more
> attention.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

A few trivial things below.  Anyhow, I don't really care about them so

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/resctrl/mpam_devices.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 558efab75f911..eb26c25b9f970 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1105,7 +1105,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  	}
>  
>  	/* Clear any stale errors */
> -	mpam_msc_clear_esr(msc);
> +	ret = mpam_msc_clear_esr(msc);
> +	if (ret)
> +		return ret;
>  
>  	spin_lock(&partid_max_lock);
>  	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
> @@ -2668,9 +2670,7 @@ static int mpam_enable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
>  }
>  
>  /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
> @@ -2678,9 +2678,7 @@ static int mpam_disable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, 0);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, 0);
>  }
>  
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
> @@ -2777,11 +2775,13 @@ static int mpam_register_irqs(void)
>  				return err;
>  		}
>  
> -		mutex_lock(&msc->error_irq_lock);
> -		msc->error_irq_req = true;
> -		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> -		msc->error_irq_hw_enabled = true;
> -		mutex_unlock(&msc->error_irq_lock);
> +		scoped_guard(mutex, &msc->error_irq_lock) {
> +			msc->error_irq_req = true;
> +			err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +			if (err)
> +				return err;
> +			msc->error_irq_hw_enabled = true;
> +		}

Scope ends here so unless something else gets added in later patches, you
could just use a guard() and reduce the noise.

>  	}
>  
>  	return 0;
> @@ -2800,10 +2800,10 @@ static void mpam_unregister_irqs(void)
>  		if (irq <= 0)
>  			continue;
>  
> -		mutex_lock(&msc->error_irq_lock);

Given you don't return early as a result this is an unrelated change. I don't
really mind but in ideal world would be a separate patch.

> +		guard(mutex)(&msc->error_irq_lock);
>  		if (msc->error_irq_hw_enabled) {
> -			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
> -			msc->error_irq_hw_enabled = false;
> +			if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
> +				msc->error_irq_hw_enabled = false;
>  		}
>  
>  		if (msc->error_irq_req) {
> @@ -2815,7 +2815,6 @@ static void mpam_unregister_irqs(void)
>  			}
>  			msc->error_irq_req = false;
>  		}
> -		mutex_unlock(&msc->error_irq_lock);
>  	}
>  }
>  

