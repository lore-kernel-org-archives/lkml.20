Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495B3F6C3B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055928; cv=none; b=BB5FAQA1MosgxF9VAzACskDzv3GkwLefxlpQsWDJmqkAywM+X9AtX+1xmGiYXrqdhi0aeyvysb7KoJXTHlIpGeRSIbv5GJ4ugIjRrTHbhYWDGio85HXqQX1I2SpxoXInQm9O4ao9gOjFUXZrk/IwRl6dSx2bYepE06aoxaw7tww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055928; c=relaxed/simple;
	bh=oOinXXpJuGYAm2fCWN0zx4stjeOXHRESOM4xmXvcg3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1K9uOpDoCXGRgo7775ucLilM17GcYcFlqCdaLDj2pFk6raBQYdHCou8U2idCX9aS9yZ7+nF9JMu4keJoGMSiLnNHAl1vuKw8TCZp3zHHC15zwUgM4CUDZTxBfWdNbhVLF4F+JekWKznt6gR5JEHePOlR+nspP00bADRo/+NoZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODFmYqYN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELCtGEpw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODFmYqYN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELCtGEpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQejFIIIFE6fTGF6lTC/UW/FVyJt6i6U66qSLqZAyAY=;
	b=ODFmYqYNe/nXcc3ep7wLKhmPW5ThduUk40jVTXPnJ5U24gY+jIQGhVLqkVHG3DWtqVTXyg
	5KSijd8WmfTePGfFdeBtX0pmhTwzmh5pl1ZuJp73ooJ4NOXK2BYgHc6I8To53DSWmVQZxj
	NyS5Sa+gQKUxfnMCP1UwliD4PRZylcE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-A7JZ1uDlPmewizU4C8dJww-1; Tue, 22 Sep 2026 01:45:10 -0400
X-MC-Unique: A7JZ1uDlPmewizU4C8dJww-1
X-Mimecast-MFC-AGG-ID: A7JZ1uDlPmewizU4C8dJww_1790055909
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so5944855ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055909; x=1790660709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQejFIIIFE6fTGF6lTC/UW/FVyJt6i6U66qSLqZAyAY=;
        b=ELCtGEpwoWi28MdrZTi1C0dOscp4DFQBL5AbhQNVdcgriECn2XsA6E11ugWX3qb6uF
         OnZe3vO4oTjusra/zK2IzBbLvUns3/vwYEZ7v+UlB6hxlLqDA9tisVqch3RNfciYiAYt
         d6POd49xMOTRuCNQFw+e9TWa+Q6ObDTmHizWs+OizJR1Okrsbk5HiNeTVx+t/1tQJXKs
         BdrfpV3siRO4EfnIGKudmBei6K3zaemyeo1le6qxELTnRBnNK7nWK3u4CrHAFZgxUJbg
         q+S+7WwbHQ/KjECeekGUfXSHY4sOpOQQ9YSN/rnXl9VnJx0v2mYL11IDu0T5slErZewB
         OlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055909; x=1790660709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQejFIIIFE6fTGF6lTC/UW/FVyJt6i6U66qSLqZAyAY=;
        b=vRzIeTftc9dBgE4VN4OtDEtOQndv672+s5viqQnIEyABkZVIN5Z2/eIyc5owEXbEsP
         pnAJwQMKduXBNaBPZFNndwssRipTzbsgQFMRzdNUTq63DZLo3MfnBoVz6iC4FTGrlLY3
         5CZ9Fjeo/22TmoX0Ez8P5HpKw3HGZzlw5U0GR8QeHJwDof4FSok5iUxphhhtmw+0FDnw
         1DTs9Pz1qZKk5sfQcgXm7BOvx9Rak8pCX+xclIlrWpeeXC3kZROrSljfY9Gw7iqTLecL
         jOpYnXVhs/CxD5UOSzBKamhImh8B+mlI2k0oJMI4DkzhGZUD9tzUK5BUqqmShovsNtZF
         HBhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwv8uBPJlSuDEcrOfj62JxQ7ATEAH/RPh9fxhhtBIUUBsxVx75uy9T1DKp2yQ71ss1B/Xh8byWjb9ASD2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k67TiT8vNu7dPZzF8wFeKK/R8B2MA7iotxFDXuaQfzhF0UF2iZ
	4tOr64BM2V8mHvEQv1g3I4GuySIhIKVzIdIHMDKVYYlqr0v/d1ckfynYXJvWsOMUihxz4SrQRaF
	eL4hUzzMcoXStpRprusRqd0b3zcXarCndFcAi/1FCbvBMotQ8SBeCyaqQIpgBc+nWHA==
X-Gm-Gg: AYBFou15hsDWRlPhJg40k7TAA5fswVseVMON8B3tdIEKRi0qbIyiL3ssE4pd/TqdB5i
	G0whUbwAiQZcL0tVKlqvyTo12pzWPq+NAx0mUC8sps1lXtWfjQf4FvZn5MxapCSmnwwUX+aC3SJ
	jB8O3qg/269RCjc6+iOTiYyQCAx5AjHpkEnLm5clg7HA0omTVvL7LXYULKiFjzB8MnvrxWz/sX3
	bfbSORxgY69SN6QRYwnjic+93hXFJDrULPnBDjj3uA+dKipYpL0IVqCWLcSSc34tJHcLAJlrMW3
	EI21Q4pnRr7u79+sExNLEFuv8V17NKewSGad3spb1A7ZfASdN3/FOzmg6LQpUKBJsThXuV0kYkl
	JZvVX9Xl8GaMbJF/F0AGq4Z+DKiMYTyl/GROz9SlXcw==
X-Received: by 2002:a17:903:2412:b0:2dd:a94a:437a with SMTP id d9443c01a7336-2df60d6752emr392055ad.0.1790055909298;
        Mon, 21 Sep 2026 22:45:09 -0700 (PDT)
X-Received: by 2002:a17:903:2412:b0:2dd:a94a:437a with SMTP id d9443c01a7336-2df60d6752emr391905ad.0.1790055908866;
        Mon, 21 Sep 2026 22:45:08 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d048086sm3562615ad.59.2026.09.21.22.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:45:08 -0700 (PDT)
Message-ID: <8928b196-9373-4d60-b44f-87d1607e04a6@redhat.com>
Date: Tue, 22 Sep 2026 15:45:04 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm_mpam: Switch to kvzmalloc_objs() for
 allocation of component cfg
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-12-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-12-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> Each component cfg is sized by the size of a per-PARTID multiplied by the
> number of PARTIDs. On a platform sized to push the limits of the
> specification, the allocation using kzalloc_objs() will consistently
> fail. Change to use kvzmalloc_objs() so that large allocations fall back to
> vmalloc() based allocations.
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

