Received: from mta0.migadu.com (out-229.mta0.migadu.com [91.218.175.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05764FC8C4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566051; cv=none; b=Fs46Y4H/7j3gtYTpvqdVZEGX3qT0Y8VNSnYsWLnK9pCfNFuM7Gzkw+7ApSiEO0zO4yujzme4CJ23j0KY5WPZ/QHKekJCdmaFuMVthiydNVZFeNBZJwDNUQcEc1bVGeGri/SMoTtZ5RIpOrm7/jTjYdRX4Tray7RqWv5u+jVJsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566051; c=relaxed/simple;
	bh=KMVu0CcPsSRobBEZ8F9wVjzDQQHjHvDdtXmmgpo1Yvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sT9x/FzT5z2Qe6h1DLuEDviyttqquEJfEWuiToOb7yT4xbmSd7kyvVKTdpgc3ZClozySIZCYL+cKfnfNb77VD7mUtwJZgznkvTYvqADhauYzTP8XGI9+e4nXntW4NIy+ZPE5+bfgNc3liEBiMIEk8sUesrNoxOCvvlvSvH2dm1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VvebwdQe; arc=none smtp.client-ip=91.218.175.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VvebwdQe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KMVu0CcPsSRobBEZ8F9wVjzDQQHjHvDdtXmmgpo1Yvg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789566041; v=1; x=1790170841;
 b=VvebwdQeMiauAqXPWChAYda54/xoW1p4zSWMyDG9EXAaUmcIEenN//knTiUSw4LaJb0fn4ZA
 8XcJgpU2h8XbI/Cfv+zq4DpqVgrLD+nuhuCnVxtB7juyZ8AlAJJ8s4c7bTsDupOgfznhT1ydQhp
 lHgM0NCAGK9bV7QWr6jlRB58=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4004ce7093c6a1de;
	Wed, 16 Sep 2026 13:40:31 +0000
X-Mizu-Trace-ID: 4004ce7093c6a1de
X-Migadu-Flow: FLOW_OUT
Message-ID: <9fd990b5-b4fd-423a-bd80-2bb630fc5de5@linux.dev>
Date: Wed, 16 Sep 2026 14:40:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: libsas: Fix interval notation
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916124403.315227-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20260916124403.315227-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 13:44, Manuel Ebner wrote:
> Remove needless ']' from interval boundary.
> 

This documentation is wrong for this structure description (not shown) - 
it should be for asd_sas_phy, not sas_phy

Same for sas_port -> asd_sas_port

> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>   Documentation/scsi/libsas.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/scsi/libsas.rst b/Documentation/scsi/libsas.rst
> index 305a253d5..9ebf2bf28 100644
> --- a/Documentation/scsi/libsas.rst
> +++ b/Documentation/scsi/libsas.rst
> @@ -75,7 +75,7 @@ enabled
>       - must be set (0/1)
>   
>   id
> -    - must be set [0,MAX_PHYS)]
> +    - must be set [0,MAX_PHYS)

this looks ok, even though it is so trivial

>   
>   class, proto, type, role, oob_mode, linkrate
>       - must be set

