Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF8493D2E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055905; cv=none; b=atok8qIbdncaQUCmrVtfcAsU5n5CigLnEDBOl+SSmAwGJIGaCN5ROU1dN1Ma41PcGxRrtoQ7BQBjYXuoarM8elcOTRvMvm65JaxWZW/eWWemsnDSpCfSRKKZeSVJh2Eh7UYZCf4nGua/f9+6ShiJ1RDK1RgKSrtRtp9LFSoVOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055905; c=relaxed/simple;
	bh=idhVttimfBl8kiSSJ4Dd8bcSrrbYEB7MNan3+I62CeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A14krIuL9i++8kwmAUucFQAZXwzeVeKr8DLcjj+nUzdGjMmBVf7xyI5tpX28GszyGg6ZWWfjUq0buPwpWSscR4D2szfHTV8DiaZKVrkxic6d4HSQskbrUx0I2xRPXmO2V98c+NWI904sm/Uy+LvYS/f+YU5F4pcsoVFyO+a4S1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjE8kP38; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIspwzh+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjE8kP38";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIspwzh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnnA+hu4V8aSPXEUCWQPC65BdY+sjOrXVnMp6lLQJmQ=;
	b=DjE8kP38Fe+k6/J0QnW8J16ZylkX4aCOyZIOkgP5DezM8EBEdiRS0epUGzE+mSxBzYp3AJ
	9vrnf75Cc+wAxPnSstMT6VYt6GX5DfSt9d1lyiFotbZGQmrMwK9YK0EcTX5YC/fVC6QK93
	pF46cm5fUwZ9nz0QISlkWfFFjCh8aLE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-g_yq3939NMmuW3oLOnhmKw-1; Tue, 22 Sep 2026 01:44:53 -0400
X-MC-Unique: g_yq3939NMmuW3oLOnhmKw-1
X-Mimecast-MFC-AGG-ID: g_yq3939NMmuW3oLOnhmKw_1790055892
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc92350888so67740365ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055892; x=1790660692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnnA+hu4V8aSPXEUCWQPC65BdY+sjOrXVnMp6lLQJmQ=;
        b=cIspwzh+EtrkVZf9e0Y5QwPrSjXPnWrJ//zXL4ltkGFG66BbfoyjMd+xSnoHLUaPup
         3wRFyhDRsevp3qJaTFeiefXUQAES1w4uNn/sSJWZz6UxIu5VHOg/gkJQChU0d6bCgPE6
         Gyj1lcP08hdnxlUgY8f08McOHn6m3ZI2E06X9sB2piujEr+eqZgvzFwwvGjqWztreiv+
         hph1b0OltwR6GZhcxJgpwNLOCp0ZJQBJprlmBOI2R8KbiEz6F0cQdzgNI2OL+kv+4A/V
         2vtXk+tjWl7YFeVtS5ps4IB9NropzScAOnxpMYdy9XYujrkl1MH7L6TmYs++UgDNHzB2
         eCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055892; x=1790660692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnnA+hu4V8aSPXEUCWQPC65BdY+sjOrXVnMp6lLQJmQ=;
        b=R0hWNa289cr9ZdBJ/6hoM609x1QUy4VeJsh+UGRQQ4nfmo4mTfoDNsd1rkjp5dZCjl
         VgD6KiYEEfkiu/cEdZ5fMUpgvMeOZz85RSmDez6nIZcGicxcuSFkOzVg6OyNXjaj5VhE
         /gQPrsbwYjm+hDJ3HIkzw2yspPTO9NXBP3wW9KeMuPuvpqecGgybod23S3eU5Wo6h/pz
         mQWlcVIoj/KEC29sfRuO+ODSo1jrEobte9sentqCa3djS+U27I/7jGRV3Lop+/iW5GMq
         SABJOad+nXfkmVqBJa8dWztwLjzacrKg0pTCDyBigQombFPV04cFZ8eLDVfkWU70eJt3
         oFDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7QfN+FIwlk97p/nk1blnA5bdSG087gchUXrftgsrhhASIGjR9JYPbkmM6tvgFKFQZ8fEuIRUt6S3+H30=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ0I/lgQRXa0LPZcDQmlpWRRjJO5CJ5SgbFTWPaalU4VOE2R20
	OI0x0oQlWHZio0/8RYR46q6RHY/Qi+1mxiO2/eDBv5p380zkbIehFEwIcYEKfjm5nog6ykFcI0t
	Kngk7NRkdyQLRTxCtgY/0x7uvWz+h/rcQbjpIGxOouZ8aJK/nwtxfxW5woN968W1K6g==
X-Gm-Gg: AYBFou04fwr4j7F5Gyc2HR/6roMOwEAHP976W8czxm4ibKydc8YQoSLstbdJMv39hb5
	OxE9h5q/niI0iiTe8VwiMCddSAGQnjjMdCf2r5TR0D/XcmdK6Dw2NtkurGw/7A5Q2GLSJDld1c2
	szzyinXtPhX3FNpP7mLQnoQX/WfC8t9aNmQIHPwwTYByYkLLMZUUdkHJ/d00tCDXrUarOHKVhkN
	LedrscVCZ+LVRK7D5FKwAEkxMYMX8StWuElvBd8GH9IHJGUW7fyYjGWnHdWE7BS2T1TX2u8e5RD
	DOHG1gMfVAoLB2UM1lCB8s3a51hL/jGeScIEb0ACI27CG0H/jLPuN/s4z7FzXtQl1KpVDLRonl2
	O1NbXZHt6GbNncEnXQKxwiXCLlL8vi+URh8TbLJXNLg==
X-Received: by 2002:a17:902:c94b:b0:2dd:ad73:c939 with SMTP id d9443c01a7336-2df609d71cfmr1169345ad.26.1790055892343;
        Mon, 21 Sep 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a17:902:c94b:b0:2dd:ad73:c939 with SMTP id d9443c01a7336-2df609d71cfmr1169035ad.26.1790055891896;
        Mon, 21 Sep 2026 22:44:51 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d01965esm3653455ad.23.2026.09.21.22.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:44:51 -0700 (PDT)
Message-ID: <89cf5ea2-d0bb-4cb8-a32b-ca843658e894@redhat.com>
Date: Tue, 22 Sep 2026 15:44:47 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm_mpam: Don't loop forever if there is the
 maximum possible amount of PARTIDs
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-11-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-11-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> On a theoretical platform with the maximum possible number of usable
> PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
> mpam_reprogram_ris() will never reach their termination condition leading
> to a system hang when register the cpu hotplug handlers when MPAM is
> enabling.
> 
> Fix these loops.
> 
> Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

