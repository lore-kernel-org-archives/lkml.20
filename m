Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3C4908C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055876; cv=none; b=nqENROj6njpj5XWUvThDfE1j0ACE8OW1MVSLk3D3zttgRMfH6V684oGcgX5pUZf7Pet6MEWbve8t2n3iaPxJsX5DhVIUvGbHPZdbJFXqtC6BwSgdTcBVZS57s7e/A+U8vI+aXJsLjc6nlGEqNcpP6Gjo2JlJIOTyHjsz4ffx3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055876; c=relaxed/simple;
	bh=1GIdHNxhGE182IYP1h+OGr+Y4dRWIRPsmZ9dxSNVj2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLwnAZKxDsrW2SMzWuHzJe0Bbs+8SPkTzfW3nNRbw4RxW0F6JAq5Hx9zTL3f23By2cSwnPMf09aR+s5MDk5xHt3+Zyhj7r8SAvDTlmRN2oL+zT16cERsy9WyXQkdA8L97rXhYMjp5sfOk8bmnEEry1oyyrpr9EoaTzh+Md93oz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gmrMrUKy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lqZm9IfV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gmrMrUKy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lqZm9IfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmA9jiPk7zoomWkGiowG3gCebu1IH8Li4eqPWHiVK/8=;
	b=gmrMrUKyxQ2tTTGK0BP1KJVWBTFardkT7JqbO20wn/HQXulCOg9xFa6gxoOfwAoQsIrju6
	EH3zNUG9NS07Dcl06ry45PgPO/ffGryFpv32xe9+aUWB7KGZrPN+giVmNlB0ASZztW8Isy
	93zxlC5oX7upP7GsO8o/AMkiOXw7E5I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-VqFWtYb_NpmGMTxcLZRD3w-1; Tue, 22 Sep 2026 01:44:30 -0400
X-MC-Unique: VqFWtYb_NpmGMTxcLZRD3w-1
X-Mimecast-MFC-AGG-ID: VqFWtYb_NpmGMTxcLZRD3w_1790055869
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so765968a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055869; x=1790660669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmA9jiPk7zoomWkGiowG3gCebu1IH8Li4eqPWHiVK/8=;
        b=lqZm9IfVDQAhc4ARsNemZl0zh6glHd4eNJHgKuHm9kYWXXnqYBb8Lux8PPX3BZCt8L
         kRiriPNh0vV0iH9mBRMnu9Eg9F+OLQjLl8XDLICzxLXff1tJy+g68pgIawiPrPciJBe4
         iTTF6w88samcwmWyYGSuUGAwF6TpEydTCDPSlMvtHPWDYR++Xa/G2Q8zSXkw2UvFmpNK
         s3SEz0UkWOd4Si350u5mDQ8ZUcoBvbbuO175JnxLQTOajWZ/7GhvK/L4B1wLkvCpvkHY
         pCr63iQZaVws3yZoIY9clwMKGiJoMlIFQeqjKkVrnfDXKiMIXng/t+RSNTktL/IJ3SEd
         zzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055869; x=1790660669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmA9jiPk7zoomWkGiowG3gCebu1IH8Li4eqPWHiVK/8=;
        b=b3sPelv9/ZGwDw0idud6UV2yHfJeliWy/qH9YsbycqDHtLxNLOaQuXB7+s8M7BRc39
         GdvteXStBFP3newlO6EhHU3dK51Yjg+iYPB6nA9f59dBRJZgZVsr7L4qixJUgkxxIxYe
         B1ji1fQfHWGMEUnlcijNSFngXFugD7jvKVALt2ZiKCHMlDUGTQ52smQO6FRt5POEHRKE
         05qThqGY6AkkUdT0g2TNFBfQLtnIMOX5msZj5Qq9oIv7axMVAnhjM2ts+gs5W127jf6r
         BSX2be06bjorRBUmd+ve/4dTk8MAcdcqjdamix21LocqswOdGF89cwlW//K0l9mteKLo
         scIw==
X-Forwarded-Encrypted: i=1; AKwUvByvhwSk1K2ej9j83A5MJDhptvTaFghz3zMUrhZh5AY+JLev2EqREF6QLN8WrRk+fhgMUxrIPSB7Vrf+cLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kGjDuc1Xy75gvTY9vfYyJltIVLP+eswVp/1Cy3JBglQIokLI+h
	wWrl/EkIQF+NvAVPKX2lbsK+rrpC7JiErIZWdfDFP7LDjMpzUdGmJbEIa6QkrDPnBdXEmsHM92R
	03kOh9UcyPhEW2TIzImvBNsMY7JO8kYQSJa8Qv7lLIKB/xbEtnJ85iQXO/adu//8dFQ==
X-Gm-Gg: AYBFou3TKEb3GJC+WA/6sS8KMdGK1U0CTC6VIzRVC4qE62hNH4iJPGZWg7UDy86tjnD
	wJuU9Lg1oSSs01Xt6R5IHRwEBFJaeOREkK0LLQrFuKC7TjXpj5F2407dRCKZ8OXUgqRMd/jdLEr
	oyAL5h4qfjKrZ2y7tAXPG7hlEBNJVOhYSqNptNVSXdAD85VOoXpKU8pH7GU3bLO/ltI/HRkZ12z
	Aem2zzOWIKqnWkqXA+OTuf+iDdhrWx5Zemud7WhjUGmOIfybP/VymL3DzbmmCqAeSgDni1KbXzv
	kmz2jWfCsuQsDVvI8fooWWjh5pgfWaJhQJt5oGGb+plj0rf55VFHyGYbsMIcuo98v/zcZYsQbCO
	40f8yHmanGXfTF5mM4DuKZLk9Ucd4HpuJ8Z4VwFB2Jw==
X-Received: by 2002:a17:90b:5846:b0:39e:6a7f:6188 with SMTP id 98e67ed59e1d1-3a073680db6mr6849a91.25.1790055868917;
        Mon, 21 Sep 2026 22:44:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5846:b0:39e:6a7f:6188 with SMTP id 98e67ed59e1d1-3a073680db6mr6837a91.25.1790055868458;
        Mon, 21 Sep 2026 22:44:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e53c107sm1266677a91.5.2026.09.21.22.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:44:27 -0700 (PDT)
Message-ID: <6b0e04b1-f0a2-418a-9b24-9803713676a5@redhat.com>
Date: Tue, 22 Sep 2026 15:44:22 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] arm_mpam: resctrl: Make read_mon_cdp_safe() self
 consistent
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-10-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-10-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
> reading returned in val is the sum of the monitor values for the given
> component. However, when cdp_enabled equal to true it is again the sum of
> the monitor values but with the initial value of val also added. Both
> resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
> read_mon_cdp_safe() and are documented to return the val directly without
> consideration of the older value.
> 
>   The val is always zeroed before read_mon_cdp_safe() is called except in
>   __check_limbo() and __l3_mon_event_count_sum() but the latter is not
>   relevant on MPAM systems.  The extra accumulation in __check_limbo() means
>   when there are multiple RMIDs in limbo some of them may be marked dirty
>   when they are already clean.
> 
> Change the cdp_enabled equals true case to match the false case and the
> documentation of the resctrl arch hooks.
> 
> Fixes: fb56b29932ca ("arm_mpam: resctrl: Add resctrl_arch_rmid_read()")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
> Add fixes tag as actually fixes an issue (Sashiko)
> Update commit message
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

