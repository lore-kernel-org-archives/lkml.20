Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF674E0203
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954162; cv=none; b=ZAeYTkcOMlrGYHAUZTgha3G9UbqDi7V0mtv53WTwy/EN9xwQtnB6Pxa9q07cDFIF3eusTaq7WHyKUhY6cOd8nUxXpt1IO7fvO3sKKvnbZbs48nkmsCjux9lsxzPryRIQGxIV3/BVG7Z/qchGAMewZCGkH0kwmTqYatgPDpETLDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954162; c=relaxed/simple;
	bh=wxfqMJtn1W7yfkOIWwGDU+cuf258NP+En0EemreTblU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgNBLcnF3drXabdx3Yb2FrvsqktpQm0DDaVu2JJhM1Yc21uKfL8QgrdeKqxHJt8jsRLDgPGcrXQiqlBA/tcR80kcOZ9jO0eDBnxOxhos68o3Zg443VQOpiLojMXW+y7dbkZGQtF8IokQ0tAqd6u527Lv0RNPBQZ3T+1aEevSbF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yl/j+4vj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yl/j+4vj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20ECF1476;
	Fri,  2 Oct 2026 08:15:52 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638BE3F85F;
	Fri,  2 Oct 2026 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954155; bh=wxfqMJtn1W7yfkOIWwGDU+cuf258NP+En0EemreTblU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yl/j+4vjl+68TN7gfciDeWp24lIKIj4Qc/A+khGDSh6B6F+kHmevE+HXub6+tePo7
	 +wkpQ31fwKH83cv9U9vLWqI430U8wNfxoLz8swyamgdjkdCj3Z2asBq9J+MI8uYN5z
	 W6j4WHDsXfnA+Qdw/ZOxlLKlXhXUv2i5thyFyBG0=
Message-ID: <ab39009b-7ce9-4f25-b78f-f24c4bf2a2c8@arm.com>
Date: Fri, 2 Oct 2026 16:15:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm_mpam: resctrl: Correct check that existing
 class is L3
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-9-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-9-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> The class used to back mbm_total_bytes can be either at the L3 or the
> memory. If a platform had candidate classes at both the memory and the L3
> then, as the check for whether the existing class is L3 or not in
> counter_update_class() is broken, the class that will be chosen depends on
> which order the classes are considered and so the probe order.

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..b825bd90d4bd 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1076,7 +1076,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
>  	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
>  
>  	if (existing_class) {
> -		if (class->level == 3) {
> +		if (existing_class->level == 3) {
>  			pr_debug("Existing class is L3 - L3 wins\n");
>  			return;
>  		}

Heh, the debug message strong hints at how that was supposed to work!

Reviewed-by: James Morse <james.morse@arm.com>



Thanks,

James
